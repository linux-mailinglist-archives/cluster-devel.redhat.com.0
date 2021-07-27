Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id F31B13D7DAC
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jul 2021 20:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627410635;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GswSWLPsXWpSVnSkfT8FhqgDLvFgGsZ5i7TQFbEePPM=;
	b=KIUtzR/hbxiDSxA1YisVPeVVI4BvgH+jMkdDnatemgbUwlziOvNQByejCXCjZVNof/ieWk
	XT9H9wytgwh24m2eIrsToEQyFzmfvvczIVFHKEufn5FlmhIoaajPk1yKzz/MBTYOpAFzu8
	LBf12gzmXRFIf+gUaEkzz+DeZQFyXs8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-tql5mV-MPqOsolF3mi4uWQ-1; Tue, 27 Jul 2021 14:30:34 -0400
X-MC-Unique: tql5mV-MPqOsolF3mi4uWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 547981015188;
	Tue, 27 Jul 2021 18:30:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 223A919C59;
	Tue, 27 Jul 2021 18:30:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5429A180BAB1;
	Tue, 27 Jul 2021 18:30:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16RIUSbn028468 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 27 Jul 2021 14:30:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A450E3094; Tue, 27 Jul 2021 18:30:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24AB2E56BC
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 18:30:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C714803790
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 18:30:25 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-257-6T9r-uq9ObObFeebxDdTjQ-1; Tue, 27 Jul 2021 14:30:23 -0400
X-MC-Unique: 6T9r-uq9ObObFeebxDdTjQ-1
Received: by mail-wr1-f71.google.com with SMTP id
	d13-20020adfc3cd0000b02901531b0b7c89so5801163wrg.23
	for <cluster-devel@redhat.com>; Tue, 27 Jul 2021 11:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GswSWLPsXWpSVnSkfT8FhqgDLvFgGsZ5i7TQFbEePPM=;
	b=t7N3ssgjPuCvCfus83my70VMuZiWqB4qTQrKwOLefKsAxQ4CiDSDwRSA6i6AeVRec7
	bnorVhnTq29+QPGwGGCrlPAiCNPJueNGJv5Pp37hhE7x5epHW7eoDadaUSf8g0UAn/0v
	cBRQeKn2nXVAZ0cQ4hYFbYFK8Pu5JQSluSRbre3M+by1NhnT5OlOCccHZGVvsusLcT2t
	fELpmfiNsOcctyiy+Ge+PSM6M3yfiK3xg3CsMM/FF9h1bw2D7O8O9TcghyPxUGmIHyen
	U+YJbT+Fahc9Z8qQQQfUM7vHYgjGV+KmEyKCZlj4Xk8YrI/NXFaVOkodWsu4WJDUQFwa
	CY/Q==
X-Gm-Message-State: AOAM530ssjtiZ71kIjrXsHTbXRo4++De8+2Wb0JGC+c4ZFdAtsROzfl1
	yekgGP6sciwolICRIVjQMGHNoq3HnI7nMq+fKyf2Bt06smqAQkPr7BhFBNzpI75Qdxak6cO+L9p
	2fOvRFVWrId2UTkdzKdl6PDQpqBaRl5JZ1B/CgQ==
X-Received: by 2002:a5d:540d:: with SMTP id g13mr17901846wrv.329.1627410622593;
	Tue, 27 Jul 2021 11:30:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAdAVDNkShLap/bVa8LJZiYp7vdFaqz7WN2RtPzT+N1d5moOKSW1lqY+QoaV7AXna5jEoXSenG5XjxdxVzVRQ=
X-Received: by 2002:a5d:540d:: with SMTP id g13mr17901840wrv.329.1627410622481;
	Tue, 27 Jul 2021 11:30:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210727173709.210711-1-rpeterso@redhat.com>
In-Reply-To: <20210727173709.210711-1-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 27 Jul 2021 20:30:11 +0200
Message-ID: <CAHc6FU5L5KPTOM0fNkPRd+-FMQzV224obEXu5p0FxCu+5eknrQ@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH 00/15] gfs2: misc. patch collection
	(V2)
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 27, 2021 at 7:37 PM Bob Peterson <rpeterso@redhat.com> wrote:
> This is version2 of a set of misc. patches from my collection.
> As before, they can be added individually or as a set. Changes from V1:
>
> 1. I added a wrapper patch Andreas wrote. I'm not sure how serious he is
>    about this one.

This is from the mmap-fault patch queue; it starts to make sense once
you add the retry code.

> 2. This set omits the patch "New log flush watchdog" due to Steve
>    Whitehouse's objections.
> 3. New patches were added to allow several more xfstests to run.
> 4. A new patch fixes a recovery error more understandable.
> 5. Patch "gfs2: fix deadlock in gfs2_ail1_empty withdraw" has been
>    reworked somewhat because of problems discovered by HCH.
> 6. A new patch was added to reduce code redundancy in gfs2_trans_add_*.
> 7. Two new patches from Andreas were added that allow xfstests
>    generic/079 to run on gfs2.
>
> Most of these patches are very safe and well-tested.
> I left out some of my more experimental patches.
>
> Andreas Gruenbacher (3):
>   gfs2: Add wrapper for iomap_file_buffered_write
>   fs: Move notify_change permission checks into may_setattr
>   gfs2: Switch to may_setattr in gfs2_setattr
>
> Bob Peterson (12):
>   gfs2: Fix glock recursion in freeze_go_xmote_bh
>   gfs2: Eliminate go_xmote_bh in favor of go_lock
>   gfs2: be more verbose replaying invalid rgrp blocks
>   gfs2: trivial clean up of gfs2_ail_error
>   gfs2: tiny cleanup in gfs2_log_reserve
>   gfs2: init system threads before freeze lock
>   gfs2: Don't release and reacquire local statfs bh
>   gfs2: fix deadlock in gfs2_ail1_empty withdraw
>   gfs2: replace sd_aspace with sd_inode
>   gfs2: reduce redundant code in gfs2_trans_add_*
>   gfs2: Make recovery error more readable
>   gfs2: ignore usr|grp|prjquota mount options
>
>  fs/attr.c            |  50 ++++++++++++--------
>  fs/gfs2/aops.c       |   9 +---
>  fs/gfs2/file.c       |  20 +++++---
>  fs/gfs2/glock.c      |  12 +----
>  fs/gfs2/glops.c      |  43 +++++++++--------
>  fs/gfs2/incore.h     |   9 +++-
>  fs/gfs2/inode.c      |   4 +-
>  fs/gfs2/log.c        |  18 +++++---
>  fs/gfs2/lops.c       |  44 ++++++++++++------
>  fs/gfs2/meta_io.c    |   2 +-
>  fs/gfs2/meta_io.h    |   2 -
>  fs/gfs2/ops_fstype.c |  84 ++++++++++++++++++++++++++++-----
>  fs/gfs2/super.c      | 107 ++++++++-----------------------------------
>  fs/gfs2/super.h      |   3 +-
>  fs/gfs2/trans.c      |  46 ++++++++-----------
>  fs/gfs2/util.c       |   2 +-
>  include/linux/fs.h   |   2 +
>  17 files changed, 238 insertions(+), 219 deletions(-)
>
> --
> 2.31.1
>

Thanks,
Andreas

