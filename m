Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 56FBB283758
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Oct 2020 16:08:45 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-zrA2T2p6Mki_R3QjAKk-7g-1; Mon, 05 Oct 2020 10:08:42 -0400
X-MC-Unique: zrA2T2p6Mki_R3QjAKk-7g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCA64802B47;
	Mon,  5 Oct 2020 14:08:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 323D578807;
	Mon,  5 Oct 2020 14:08:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7004044A5E;
	Mon,  5 Oct 2020 14:08:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 095E8WtJ015499 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Oct 2020 10:08:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5EE1E202450E; Mon,  5 Oct 2020 14:08:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59B3F2026F94
	for <cluster-devel@redhat.com>; Mon,  5 Oct 2020 14:08:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2292101AA46
	for <cluster-devel@redhat.com>; Mon,  5 Oct 2020 14:08:22 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-297-xGp_B2v_Mxmu27mB6y1awQ-1; Mon, 05 Oct 2020 10:08:18 -0400
X-MC-Unique: xGp_B2v_Mxmu27mB6y1awQ-1
Received: by mail-lf1-f67.google.com with SMTP id 197so11005422lfo.11;
	Mon, 05 Oct 2020 07:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8Q/zdfYEifwQYC1tCHHSSSZhx/UYtdSVO8Lzn1xEk2s=;
	b=Uf+LLV2hsEebBZw41cMuLoxVmWG9TO1/kvxNZoG2dn00Gm5UaTkAtj8pafa2gFa5eA
	OuxdZIbnu0OhRS1J9oFc8swGvJApB5V2wCsoYC/nGlaaBtLbKEB6e7AEmPRfctgeFVpI
	xu4au8OBQ2LloaQ0IfXogQydF4QYlCaPYyJzohPlTvrA92C/8lzgi6Hnr985zRflVpyU
	x1A3lYagkinT1KLUrydG1kKBXKWFZZES2nGC+y9a3V/tU2HlpfwLsF2YqIVf0VJlbPL1
	i+pLFAG+1h4mPlO4C97gvMSo0WVpfv8w/tAWXQem52/0QG7FucHmJPon6mDcqioOc+1a
	Y/jQ==
X-Gm-Message-State: AOAM531uAz8S44NmBaCB9ZnV5u1N1+XMedlher1c6CrysxJ/nzkdrhvq
	jJwEVgOSCGyYU7IuiAJytUPEJQh/J6JtNAEXcdVD1YUjnWs9OQ==
X-Google-Smtp-Source: ABdhPJxkJYiXlHS/tZKafFAGQmDTcC4D+vwZudITpZIRxWhyG5FyXFCr7ARBvDoGTxXlfBl1KTeBS1r7cukUXIYqVgY=
X-Received: by 2002:a19:cb12:: with SMTP id b18mr6308085lfg.417.1601906895743; 
	Mon, 05 Oct 2020 07:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201003063143.13093-1-foxhlchen@gmail.com>
	<ca694fc8-5f1b-ebf0-b891-c9a20225704f@redhat.com>
In-Reply-To: <ca694fc8-5f1b-ebf0-b891-c9a20225704f@redhat.com>
From: Fox Chen <foxhlchen@gmail.com>
Date: Mon, 5 Oct 2020 22:08:04 +0800
Message-ID: <CAC2o3D+X48sR4kFi9nS_atpTuSRWDnX92RD3uCUeh9AHXGnaNw@mail.gmail.com>
To: Andrew Price <anprice@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: gfs2_read_sb: put gfs2_assert
 inside the loop
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 5, 2020 at 9:23 PM Andrew Price <anprice@redhat.com> wrote:
>
> On 03/10/2020 07:31, Fox Chen wrote:
> > for (x = 2;; x++) {
> >          ...
> >          gfs2_assert(sdp, x <= GFS2_MAX_META_HEIGHT);  <--- after
> >          ...
> >          if (d != sdp->sd_heightsize[x - 1] || m)
> >                  break;
> >          sdp->sd_heightsize[x] = space;
> > }
> >
> > sdp->sd_max_height = x
> > gfs2_assert(sdp, sdp->sd_max_height <= GFS2_MAX_META_HEIGHT) <--- before
> >
> > Before this patch, gfs2_assert is put outside of the loop of
> > sdp->sd_heightsize[x] calculation. When something goes wrong,
>
> So this looks related to one of the recent syzbot reports, where the
> "something goes wrong" is the block size in the on-disk superblock was
> zeroed and that leads eventually to this out-of-bounds write. The
> correct fix in that case would be to add a validity check for the block
> size in gfs2_check_sb().
>

Yes, I saw this bug from the syzbot report and I though instead of
KASAN gfs2_assert should be able to catch it so I proposed this patch.
:)

thank you both for your comments.


fox

