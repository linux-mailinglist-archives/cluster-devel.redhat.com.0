Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA86184DE
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Nov 2022 17:39:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667493549;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Kh3PemVjLOMzD+zXkDJxoTeXa2tk+grc1up9htYz3yQ=;
	b=JPKH4DDf4D0rWUttgmHIq8ywf4Yo5D30OkElHSilIxisdw/5fSU+cu6gZk+8xmK70Gea1u
	YZOENKfOwW0lSRAVQ8bLRY9m0HOpL2aaPhXlLVGSHh3nasqihlrpY1gLZCcWCHJlnlamLS
	NK8o0tbhLHMrmdhCf/taqXxAbZj4gCM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-Lvq6x7WEMgu9EsDFezbDOg-1; Thu, 03 Nov 2022 12:39:05 -0400
X-MC-Unique: Lvq6x7WEMgu9EsDFezbDOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9631538173D3;
	Thu,  3 Nov 2022 16:39:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3F51200D8C3;
	Thu,  3 Nov 2022 16:39:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4109819465B2;
	Thu,  3 Nov 2022 16:39:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 07D3A1946594 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  3 Nov 2022 16:39:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BA87E492B1E; Thu,  3 Nov 2022 16:39:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B36EA492B06
 for <cluster-devel@redhat.com>; Thu,  3 Nov 2022 16:39:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 989BA101A52A
 for <cluster-devel@redhat.com>; Thu,  3 Nov 2022 16:39:01 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-461-8qe9thOzPfOcdJoxmd2XVg-1; Thu, 03 Nov 2022 12:38:59 -0400
X-MC-Unique: 8qe9thOzPfOcdJoxmd2XVg-1
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-36cbcda2157so20558337b3.11
 for <cluster-devel@redhat.com>; Thu, 03 Nov 2022 09:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kh3PemVjLOMzD+zXkDJxoTeXa2tk+grc1up9htYz3yQ=;
 b=myE38ewkqWMEix71zmiMvc2pA2zB4Xg1F6ncWEdwmt/aG9B+Dt0D1Ol6OjQEOwavW4
 1wSNJn2uMq80N+6Y1F0/HAGGMYMts1uOkZ92o6KzJaINIhHFSSXVPjA5FpKBdPWmZNMK
 ftpop7GZGnGF54vQIyGGmgCKdvqAMQlCykJC18YU0lSsFv4VQOZaipVLlp4Xdw+E3V4M
 SLmSKCkt7kfy2flOoWguXek4rBBWN4OEBReUque06yo7I//jOFs0L44CfMiedjyJkZhn
 YfbQ/fYIOv1zc3FyoowOmR4gFtoypCFTAG9/qfOT4mkYIXJ06q6thldCypWFxgod8ZKQ
 ykyg==
X-Gm-Message-State: ACrzQf2MVIa6tOBoH2Ddy1hj1CgOEFnYKvP4q6o+T8GSXANibyWSufI+
 pxpNWspIi4xiaL8qx2i54LlphvqSMNwGGuuGWGc=
X-Google-Smtp-Source: AMsMyM6eD3AkR/tTwVJuSGW1VpJEcDm8gRAUUIITH99yEF6ks7q7BqgOP+0YDkckG+H0+22nmeoDoFNiML2RzB4TzPI=
X-Received: by 2002:a81:1648:0:b0:36b:1891:7dda with SMTP id
 69-20020a811648000000b0036b18917ddamr29441580yww.447.1667493539150; Thu, 03
 Nov 2022 09:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221102161031.5820-1-vishal.moola@gmail.com>
 <20221103070807.GX2703033@dread.disaster.area>
In-Reply-To: <20221103070807.GX2703033@dread.disaster.area>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 3 Nov 2022 09:38:48 -0700
Message-ID: <CAOzc2pzFMU-XiGZ9bsp40JkpYVSzQuxs2VXgfw_p9abkj4GrFw@mail.gmail.com>
To: Dave Chinner <david@fromorbit.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v4 00/23] Convert to
 filemap_get_folios_tag()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 3, 2022 at 12:08 AM Dave Chinner <david@fromorbit.com> wrote:
>
> On Wed, Nov 02, 2022 at 09:10:08AM -0700, Vishal Moola (Oracle) wrote:
> > This patch series replaces find_get_pages_range_tag() with
> > filemap_get_folios_tag(). This also allows the removal of multiple
> > calls to compound_head() throughout.
> > It also makes a good chunk of the straightforward conversions to folios,
> > and takes the opportunity to introduce a function that grabs a folio
> > from the pagecache.
> >
> > F2fs and Ceph have quite a lot of work to be done regarding folios, so
> > for now those patches only have the changes necessary for the removal of
> > find_get_pages_range_tag(), and only support folios of size 1 (which is
> > all they use right now anyways).
> >
> > I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
> > beneficial. The page-writeback and filemap changes implicitly work. Testing
> > and review of the other changes (afs, ceph, cifs, gfs2) would be appreciated.
>
> Same question as last time: have you tested this with multipage
> folios enabled? If you haven't tested XFS, then I'm guessing the
> answer is no, and you haven't fixed the bug I pointed out in
> the write_cache_pages() implementation....
>

I haven't tested the series with multipage folios or XFS.

I don't seem to have gotten your earlier comments, and I
can't seem to find them on the mailing lists. Could you
please send them again so I can take a look?

