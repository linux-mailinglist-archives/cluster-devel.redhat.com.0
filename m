Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A856189DE
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Nov 2022 21:47:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667508454;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=MxS/4UcS9QV06TA42jz+n7cPJ0B1Da1lpvr3ubjc6GY=;
	b=b+NW9gN8100fE8Hf8TiGlZzChIEebiTdeRA39/XTBHhiQI4MNil0ZQEXdgSA1Dsb0350uV
	MrXvafmxaZwN68EKb1jZgDjuDOT+2/CY1twIMBktOjI5QP9xlYVfS8CyeWu2bOgUoZ4Fsa
	/79S2a06utjiywb33PVDbiaklAnx9nc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-Rg93ip95OjmIcM-Ky4u4lg-1; Thu, 03 Nov 2022 16:47:31 -0400
X-MC-Unique: Rg93ip95OjmIcM-Ky4u4lg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39EBA3C0D879;
	Thu,  3 Nov 2022 20:47:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4B0834A9254;
	Thu,  3 Nov 2022 20:47:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 02DC519465B2;
	Thu,  3 Nov 2022 20:47:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A040A1946594 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  3 Nov 2022 20:47:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8E27B492B06; Thu,  3 Nov 2022 20:47:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 864B1492B1E
 for <cluster-devel@redhat.com>; Thu,  3 Nov 2022 20:47:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69C9229AB435
 for <cluster-devel@redhat.com>; Thu,  3 Nov 2022 20:47:25 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-79-HE3VbVqkOsawJXueISsWOg-1; Thu, 03 Nov 2022 16:47:23 -0400
X-MC-Unique: HE3VbVqkOsawJXueISsWOg-1
Received: by mail-pj1-f52.google.com with SMTP id
 f5-20020a17090a4a8500b002131bb59d61so6169236pjh.1
 for <cluster-devel@redhat.com>; Thu, 03 Nov 2022 13:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MxS/4UcS9QV06TA42jz+n7cPJ0B1Da1lpvr3ubjc6GY=;
 b=OdFD7+nhCi6xxpjiek94jNP/lnRnSws3xKuDSRxG0BWyssQa5w6ynRqnM+pQxnBQ1V
 GpohXxZ7gbwibuwI+gQCQx2J6GE8H8jpr2tuTxrco8BC5VwDUYWofT2xyetFXH7OogDv
 wPUQPVh1XY92ANHtfcjOnYuAnLBtxouckzvf4zQsDPXzCdmgpJ3YKd3ptfb60jSNjWHe
 THNaYPeNAKdBaPcMteaeEBer+BxHpM6OUNkhE/0ziVXWZSM8pn5D3K3ePi7BLuksOYI4
 anhAKvGrEKeyo0m7lrc0OJbU/rLVsde8pwOKsg5ZuePBy57y1YHqoLFcsDjVwfvANFVz
 zqyQ==
X-Gm-Message-State: ACrzQf19rdiP5ZgTiSXFhV7/AtP8ywTcn4IyepiJopiurMuJRzV3NrbV
 /dHdx+4ebX21lLz14QpjRJOC8jW4q0KRaw==
X-Google-Smtp-Source: AMsMyM5GUtVQUrVsmSVgFmsiPB/ae+Y5AFUcecj0KBZFMpN2UeC1Le+3w3RaW8dan20LGNVVX2XxhA==
X-Received: by 2002:a17:90a:5781:b0:20a:9962:bb4a with SMTP id
 g1-20020a17090a578100b0020a9962bb4amr49118773pji.185.1667508442530; 
 Thu, 03 Nov 2022 13:47:22 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-106-210.pa.nsw.optusnet.com.au.
 [49.181.106.210]) by smtp.gmail.com with ESMTPSA id
 y12-20020aa78f2c000000b00561b455267fsm1205656pfr.27.2022.11.03.13.47.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:47:22 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1oqh7P-009uXX-4a; Fri, 04 Nov 2022 07:47:19 +1100
Date: Fri, 4 Nov 2022 07:47:19 +1100
From: Dave Chinner <david@fromorbit.com>
To: Vishal Moola <vishal.moola@gmail.com>
Message-ID: <20221103204719.GY2703033@dread.disaster.area>
References: <20221102161031.5820-1-vishal.moola@gmail.com>
 <20221103070807.GX2703033@dread.disaster.area>
 <CAOzc2pzFMU-XiGZ9bsp40JkpYVSzQuxs2VXgfw_p9abkj4GrFw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOzc2pzFMU-XiGZ9bsp40JkpYVSzQuxs2VXgfw_p9abkj4GrFw@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 03, 2022 at 09:38:48AM -0700, Vishal Moola wrote:
> On Thu, Nov 3, 2022 at 12:08 AM Dave Chinner <david@fromorbit.com> wrote:
> >
> > On Wed, Nov 02, 2022 at 09:10:08AM -0700, Vishal Moola (Oracle) wrote:
> > > This patch series replaces find_get_pages_range_tag() with
> > > filemap_get_folios_tag(). This also allows the removal of multiple
> > > calls to compound_head() throughout.
> > > It also makes a good chunk of the straightforward conversions to folios,
> > > and takes the opportunity to introduce a function that grabs a folio
> > > from the pagecache.
> > >
> > > F2fs and Ceph have quite a lot of work to be done regarding folios, so
> > > for now those patches only have the changes necessary for the removal of
> > > find_get_pages_range_tag(), and only support folios of size 1 (which is
> > > all they use right now anyways).
> > >
> > > I've run xfstests on btrfs, ext4, f2fs, and nilfs2, but more testing may be
> > > beneficial. The page-writeback and filemap changes implicitly work. Testing
> > > and review of the other changes (afs, ceph, cifs, gfs2) would be appreciated.
> >
> > Same question as last time: have you tested this with multipage
> > folios enabled? If you haven't tested XFS, then I'm guessing the
> > answer is no, and you haven't fixed the bug I pointed out in
> > the write_cache_pages() implementation....
> >
> 
> I haven't tested the series with multipage folios or XFS.
> 
> I don't seem to have gotten your earlier comments, and I
> can't seem to find them on the mailing lists. Could you
> please send them again so I can take a look?

They are in the lore -fsdevel archive - no idea why you couldn't
find them....

https://lore.kernel.org/linux-fsdevel/20221018210152.GH2703033@dread.disaster.area/
https://lore.kernel.org/linux-fsdevel/20221018214544.GI2703033@dread.disaster.area/

-Dave.
-- 
Dave Chinner
david@fromorbit.com

