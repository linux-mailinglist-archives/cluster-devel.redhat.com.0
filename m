Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB393552DC
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Apr 2021 13:54:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-GN0YKo16OQqCTLBavMVylg-1; Tue, 06 Apr 2021 07:54:54 -0400
X-MC-Unique: GN0YKo16OQqCTLBavMVylg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D151800D53;
	Tue,  6 Apr 2021 11:54:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB975369A;
	Tue,  6 Apr 2021 11:54:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 626EB4A700;
	Tue,  6 Apr 2021 11:54:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136Bsgu8030463 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 07:54:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56D322166B44; Tue,  6 Apr 2021 11:54:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 513612157F24
	for <cluster-devel@redhat.com>; Tue,  6 Apr 2021 11:54:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 180B3811E9B
	for <cluster-devel@redhat.com>; Tue,  6 Apr 2021 11:54:40 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-395-1XR8XNeBN_CtP_JhjptDSA-1; Tue, 06 Apr 2021 07:54:38 -0400
X-MC-Unique: 1XR8XNeBN_CtP_JhjptDSA-1
Received: by mail-ed1-f48.google.com with SMTP id p4so5936994edr.2
	for <cluster-devel@redhat.com>; Tue, 06 Apr 2021 04:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=P/I/9NNIAgEX5lkRCmtPUDKKe3W6gL5/TflW7Rsi0Nw=;
	b=RmfV+m54/voaajnvHi3tKYG2KtF7SVVinIalGTkPajEO0VD2iESyRKhpWX2j3PAxAB
	Ey5KKLBemfzgwg10l1weo34/5Acq38Kw0yxoU2TMh6ePF7ywCDfBIV76onHwozUxiZq1
	fc8ybVgp1zeyQ+kwuAe2rGhVkCg1rkAzqLllQ6Vv4IhkU2GLWkDcS0c24FgZKy+gKzuy
	Obr6CucM6TskzYcLdeHJNuB5eewavssnlewC4W7JLaysPa5HwIaz6tLL5AL6wB7hXCAy
	c6fcyfFHjRsVLMx86xio7X7HkVKN1PbBaYH+34bbn7BEJ9mkSYypEHdAraUIVT9RpIYn
	6r2A==
X-Gm-Message-State: AOAM533riqBDrbHXvJEFVCZBDJVV2adso1f8hYQ5eTjL/TVzEELn7hha
	EvnJ+VJ+kTp0s7Z8/ONj59I5/w==
X-Google-Smtp-Source: ABdhPJwlz0v/o0dBfE+fx5/my+wmBnuj8s9AG2PFWxzJ7csKDnO6LPJGHCtvbTQ0rqW0OkRgQ/VHvA==
X-Received: by 2002:a05:6402:3125:: with SMTP id
	dd5mr8486514edb.9.1617710077020; 
	Tue, 06 Apr 2021 04:54:37 -0700 (PDT)
Received: from dell ([91.110.221.193]) by smtp.gmail.com with ESMTPSA id
	h17sm13432298eds.26.2021.04.06.04.54.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 06 Apr 2021 04:54:36 -0700 (PDT)
Date: Tue, 6 Apr 2021 12:54:34 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Bob Peterson <rpeterso@redhat.com>
Message-ID: <20210406115434.GU2916463@dell>
References: <20210326091151.311647-1-lee.jones@linaro.org>
	<20210406091126.GT2916463@dell>
	<468723920.4255981.1617709446972.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
In-Reply-To: <468723920.4255981.1617709446972.JavaMail.zimbra@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 00/18] Rid W=1 warnings from GFS2
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, 06 Apr 2021, Bob Peterson wrote:

> ----- Original Message -----
> > On Fri, 26 Mar 2021, Lee Jones wrote:
> > 
> > > This set is part of a larger effort attempting to clean-up W=1
> > > kernel builds, which are currently overwhelmingly riddled with
> > > niggly little warnings.
> > > 
> > > Lee Jones (18):
> > >   fs: gfs2: dir: Finish off mostly complete headers demote others
> > >   fs: gfs2: xattr: Help out some kernel-doc header demote non-conformant
> > >     ones
> > >   fs: gfs2: bmap: Demote half-complete kernel-doc headers fix others
> > >   fs: gfs2: glops: Fix a couple of kernel-doc misdemeanours demote
> > >     others
> > >   fs: gfs2: log: Fix a couple of param descriptions and demote
> > >     non-conformant headers
> > >   fs: gfs2: lops: Help out worthy kernel-doc headers and demote others
> > >   fs: gfs2: glock: Fix some deficient kernel-doc headers and demote
> > >     non-conformant ones
> > >   fs: gfs2: aops: Fix a little potential doc-rot
> > >   fs: gfs2: meta_io: Add missing description for 'rahead' param
> > >   fs: gfs2: inode: Fix worthy function headers demote others
> > >   fs: gfs2: file: Strip out superflouous param description and demote
> > >     kernel-doc abuse
> > >   fs: gfs2: ops_fstype: Fix a little doc-rot
> > >   fs: gfs2: quota: Fix incorrect param name in 'gfs2_quotad'
> > >   fs: gfs2: rgrp: Fix a few kernel-doc misdemeanours
> > >   fs: gfs2: recovery: Provide missing param descriptions and remove one
> > >     other
> > >   fs: gfs2: super: Fix kernel-doc issues where feasible demote one other
> > >   fs: gfs2: util: Fix one conformant kernel-doc header and demote a
> > >     bunch of abuses
> > >   fs: gfs2: lock_dlm: Demote incomplete kernel-doc header
> > 
> > These have been on the list for a couple of weeks now.
> >   
> > Is there anything I can do to help expedite their merge?
> >   
> > I'm concerned since -rc6 has just been released.
> 
> Hi Lee,
> 
> Thanks for your patches. Andreas and I have a slight disagreement about them.
> I wanted to merge them, but Andreas is concerned that there may be some
> cases in which we should get rid of parameter descriptions altogether.
> So I've been waiting for Andreas to review them all before we push them.
> Also, the dir.c patch might be out of date because of a patch I recently did that
> was recently added to for-next. I'll work with Andreas to expedite them so
> they can go into the next merge window.

Thanks for the update Bob.

My initial response to that would be; this patch-set ensures all of
the warnings are taken care of.  Removal of superfluous documentation
could be easily undertaken as part of a subsequent effort.

It would be good to have these warnings quashed for v5.13.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

