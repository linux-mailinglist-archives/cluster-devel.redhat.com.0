Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC223D7878
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 16:28:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627396102;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rITdQ/34J3xpcrKdRTx53/CCAeu2jk6HhmzQK16/kfw=;
	b=MOW95RTFROfnGzSfJp+QnSqeQCO/rNuuxBgUBdXSJmcT1cKFtMsdMIBb05HI9swo8MpoQk
	YjDolmbdyiEsieigIUB526sjLzYtKyOz/7/N4CrWVnDOrT6r93YlAXZlxOtWXa1GpUg9rX
	dr3PU8oZ4aE88gzGCILhNI8NzzKGUP4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-GT0c1i3sN7-54YbJ3SSnrQ-1; Tue, 27 Jul 2021 10:28:21 -0400
X-MC-Unique: GT0c1i3sN7-54YbJ3SSnrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CCC687D542;
	Tue, 27 Jul 2021 14:28:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 273A05C1B4;
	Tue, 27 Jul 2021 14:28:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 942C7180BAB1;
	Tue, 27 Jul 2021 14:28:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RESE7C032263 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 10:28:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEEE32039DB8; Tue, 27 Jul 2021 14:28:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA0E32039DBE
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 14:28:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79D4D18A01A5
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 14:28:08 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-363-koiXXPBxPpeTreFXGlsdPw-1; Tue, 27 Jul 2021 10:28:07 -0400
X-MC-Unique: koiXXPBxPpeTreFXGlsdPw-1
Received: by mail-wm1-f70.google.com with SMTP id
	n7-20020a05600c3b87b029024e59a633baso1441652wms.5
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 07:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nMpAlUszv6K5eQQ8rqCPNdRoY2zbzUOIAee8WyhkNxg=;
	b=ld4Jbi9DVEC7n1dfOCWJtXvGw4MyHpANC46UUQKBMrR0jj7BaPgkvUFzrtdJmbyEUp
	HaqCiPZV6a4TAek4HnPYh2YaivH6jT6besBVvckrN9rlJF+kW2rOMsVx5rQkjzHIM1uG
	t+/ywy2ECjgHsXF1Yy2ps9lPNHg4chIGCeyM9NKH9IVpMcODix3trKv43wtKBnfazjJx
	LtQtQ8qXLf3np1B+RcUbsk2i8H5x28SEdCVx0x1s51qk8yD6cupY6wlRwSIFznNuP0Xg
	k0+mZVN+c76Qu9Pn5y3EVCPTaPpGRC7fG1d4OrjZ/mWYqBzdpwQspNUUTvOsGV8Gjqu1
	ymvw==
X-Gm-Message-State: AOAM5310HhpvO9RYJCMRPIdT413LEXM5dx8dU1ZXfMugFC3/1NYbwnb1
	HCwFpm7J1a416jFcG6yggG/ier8ZrCRtCPNEsZgxZqvVeDmBnqcW8pba6ucER3QuK3Fj9W1024O
	dsnC+DNOTfHi513pMzc3tyJ/6C5WBz5Nu3o7ztw==
X-Received: by 2002:a05:600c:4a12:: with SMTP id
	c18mr4426724wmp.3.1627396085329; 
	Tue, 27 Jul 2021 07:28:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyUHG+NJ9n3cGzz80PvIgMVJ00itRHF/0U42aI9uylWNhu0ti4lXZXR72czocia5p6FN2402pQ2HmPOD48wbc=
X-Received: by 2002:a05:600c:4a12:: with SMTP id
	c18mr4426703wmp.3.1627396085134; 
	Tue, 27 Jul 2021 07:28:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210726140058.GA9206@lst.de>
	<612d262a-e997-e887-ade9-1edc5efab758@redhat.com>
	<20210727070546.GA12839@lst.de>
	<50315f10-b891-3bde-cd03-4efd697a13cc@redhat.com>
In-Reply-To: <50315f10-b891-3bde-cd03-4efd697a13cc@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 27 Jul 2021 16:27:53 +0200
Message-ID: <CAHc6FU5HOm0RJbxNNkaArdf14zqnKjQCvMkL1W+5uOtkVrrwfw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 16RESE7C032263
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] gfs2 hang in xfstests generic/361 (v3)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, Jul 27, 2021 at 4:05 PM Bob Peterson <rpeterso@redhat.com> wrote:
> On 7/27/21 2:05 AM, Christoph Hellwig wrote:
> > On Mon, Jul 26, 2021 at 01:50:11PM -0500, Bob Peterson wrote:
> >> FYI: I just pushed a replacement patch to linux-gfs2/for-next.next4.
> >> The patch I mentioned last time had problems, so this is a simplified
> >> middle-ground between that patch and the one I suggested earlier.
> >> Patch is a89a427e0afe.
> >
> > With just that patch cherry picked the test still hangs.
> >
> > The entire linux-gfs2/for-next.next4 completes a quick group xfstests
> > run, but with a lot of failures:
> >
> > Failures: generic/079 generic/082 generic/092 generic/094 generic/103 generic/219 generic/230 generic/235 generic/244 generic/294 generic/306 generic/347 generic/379 generic/380 generic/382 generic/383 generic/384 generic/385 generic/386 generic/400 generic/441 generic/452 generic/488 generic/545 generic/566 generic/587 generic/594 generic/600 generic/601 generic/603
> > Failed 30 of 514 tests
> >
>
> Hi Christoph,
>
> Thanks for testing gfs2.
> Andreas and I are fully aware of these failures. When I do a full run
> (which I do almost every day), I get these same 9 failures that you also
> reported:
>
> generic/294
> generic/306
> generic/441
> generic/452
> generic/488
> generic/545
> generic/594
> generic/619
> generic/631
>
> I've not done a detailed analysis of these 9 lately, but in the past
> I've looked at individual failures and they're usually because gfs2 does
> a "file system withdraw" due to IO errors writing to its journal (and
> such--as we want and expect) whereas most file systems don't do that. So
> these are kind of expected failures. Perhaps I should go back check them
> again.
>
> The others you reported are are exempted from my testing (I've got them
> in my excludes file) because in most cases the problem is gfs2's lack of
> support for the usrquota / grpquota / prjquota mount options:
>
> generic/082 - Lack of support for -o usrquota / grpquota / prjquota
> generic/219
> generic/230
> generic/235
> generic/244
> generic/379
> generic/380
> generic/382
> generic/383
> generic/384
> generic/385
> generic/386
> generic/400
> generic/566
> generic/587
> generic/600
> generic/601
> generic/603
>
> That leaves us:
>
> generic/079 [expunged] - Incorrect permission check (doesn't match the
> one in notify_change)

I've tried fixing that one a long time ago:

https://listman.redhat.com/archives/cluster-devel/2018-February/msg00042.html

> generic/092 [expunged] - Lack of support for unwritten extents
> generic/094 [expunged] - Lack of support for unwritten extents
> generic/103       [expunged] - Command having problems: xfs_io -i -fc
> falloc 0 66574524k /mnt/scratch/spc
> (I haven't taken the time to analyze this yet)
> Inconsistent filesystem when running out of space on dm-thin
> (I haven't taken the time to analyze this yet either)
>
> So we know we've still got some work to do here, but we've got higher
> priorities at the moment. They're still on our to-do list.
>
> Regards,
>
> Bob Peterson

Andreas


