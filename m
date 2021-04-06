Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9C813354F9C
	for <lists+cluster-devel@lfdr.de>; Tue,  6 Apr 2021 11:11:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-FafLULA4NjChc9rFF3lE0w-1; Tue, 06 Apr 2021 05:11:46 -0400
X-MC-Unique: FafLULA4NjChc9rFF3lE0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51CA810CE7A8;
	Tue,  6 Apr 2021 09:11:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C286B610AE;
	Tue,  6 Apr 2021 09:11:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6F9D4BB7C;
	Tue,  6 Apr 2021 09:11:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1369BYvl013210 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 05:11:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C7762166BA9; Tue,  6 Apr 2021 09:11:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35E5B2166B44
	for <cluster-devel@redhat.com>; Tue,  6 Apr 2021 09:11:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B784A811E9B
	for <cluster-devel@redhat.com>; Tue,  6 Apr 2021 09:11:31 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-569-X9x2PV2CMGunYGrIhFOYyg-1; Tue, 06 Apr 2021 05:11:29 -0400
X-MC-Unique: X9x2PV2CMGunYGrIhFOYyg-1
Received: by mail-wm1-f46.google.com with SMTP id a76so3767924wme.0
	for <cluster-devel@redhat.com>; Tue, 06 Apr 2021 02:11:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to;
	bh=dkstBULZQtDUbA+Mw8ppM5llptybXO1REdfMIsOsnrw=;
	b=squlw1/R0TcBdRxHGbfdDRkLbdWdJxtKjRF4r5cuXYgePYJaHx0K8uohanQhEgwuyo
	FuXfNYhDs4QNWbVC3layLkz1pZG1UwLga5UEG9Np2lxsyhjgTiGqptXlAhFAvwYLQyGr
	8+VPK91mBMPLXe0R9dYc271tB6uih0RVZ3gfd+ieTT/F0Nmlr3bf5Dos0Rn7BSIgHnN2
	X2yKW8ohOSXpjKYa9t8TMQPG3kjVN2kIvXtA4EUukjvcFfPmi/Pzj1R7mdqShMgKdoHf
	6cVSyshgqT+YgAMvL6ScqVigXVa3yJV/fdXx26+PtANs9geRye5dnY4vtuyCTrN2FGGA
	cD/Q==
X-Gm-Message-State: AOAM53119A0/t7EwoDs71WQ9yy7vWtspTNtq4qZSssVGwxMLXw8JiWoG
	vVyf4KMqEPSR2EVgv3dhA9lWGg==
X-Google-Smtp-Source: ABdhPJz7ZvZHwz5g7uaqnq+HtHaLVth2jpVHSveDhM+2tFBS5D1VVPXeqyRZYdPnm4iITFPwbp6XJA==
X-Received: by 2002:a1c:9853:: with SMTP id a80mr1910144wme.44.1617700288552; 
	Tue, 06 Apr 2021 02:11:28 -0700 (PDT)
Received: from dell ([91.110.221.193])
	by smtp.gmail.com with ESMTPSA id p17sm2052687wmg.5.2021.04.06.02.11.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 06 Apr 2021 02:11:28 -0700 (PDT)
Date: Tue, 6 Apr 2021 10:11:26 +0100
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org, Andreas Gruenbacher <agruenba@redhat.com>,
	Bob Peterson <rpeterso@redhat.com>, cluster-devel@redhat.com
Message-ID: <20210406091126.GT2916463@dell>
References: <20210326091151.311647-1-lee.jones@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20210326091151.311647-1-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, 26 Mar 2021, Lee Jones wrote:

> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> Lee Jones (18):
>   fs: gfs2: dir: Finish off mostly complete headers demote others
>   fs: gfs2: xattr: Help out some kernel-doc header demote non-conformant
>     ones
>   fs: gfs2: bmap: Demote half-complete kernel-doc headers fix others
>   fs: gfs2: glops: Fix a couple of kernel-doc misdemeanours demote
>     others
>   fs: gfs2: log: Fix a couple of param descriptions and demote
>     non-conformant headers
>   fs: gfs2: lops: Help out worthy kernel-doc headers and demote others
>   fs: gfs2: glock: Fix some deficient kernel-doc headers and demote
>     non-conformant ones
>   fs: gfs2: aops: Fix a little potential doc-rot
>   fs: gfs2: meta_io: Add missing description for 'rahead' param
>   fs: gfs2: inode: Fix worthy function headers demote others
>   fs: gfs2: file: Strip out superflouous param description and demote
>     kernel-doc abuse
>   fs: gfs2: ops_fstype: Fix a little doc-rot
>   fs: gfs2: quota: Fix incorrect param name in 'gfs2_quotad'
>   fs: gfs2: rgrp: Fix a few kernel-doc misdemeanours
>   fs: gfs2: recovery: Provide missing param descriptions and remove one
>     other
>   fs: gfs2: super: Fix kernel-doc issues where feasible demote one other
>   fs: gfs2: util: Fix one conformant kernel-doc header and demote a
>     bunch of abuses
>   fs: gfs2: lock_dlm: Demote incomplete kernel-doc header

These have been on the list for a couple of weeks now.
  
Is there anything I can do to help expedite their merge?
  
I'm concerned since -rc6 has just been released.

--
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

