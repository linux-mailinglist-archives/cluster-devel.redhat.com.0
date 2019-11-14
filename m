Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CB3C0FC4A1
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 11:49:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573728539;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xsJEC+t6xDZSS/T8EQPUjnht35xWbviP7mmK94T+LfM=;
	b=ivdx4wcQuI0L9f0KAp2NUJAMQqF8Zy4z6uht+TWMTDilV7aVx01a7t2KjuNt66HeUA+QGK
	A6JJva6VsqkiRFQs7r6g5Vku1+ksNTnIbaQXpocJcdA1supaj+ZksurkonNeJ7GIn0+Hq0
	ZC1bEgzpXusjPP/RiN3qRoxjFqYTsjo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-fdCRgolxPja6NksxK2YeQw-1; Thu, 14 Nov 2019 05:48:58 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3D731005500;
	Thu, 14 Nov 2019 10:48:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BB0C5C219;
	Thu, 14 Nov 2019 10:48:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6B99180880C;
	Thu, 14 Nov 2019 10:48:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEAmqU0006170 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 05:48:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 56AD9691BA; Thu, 14 Nov 2019 10:48:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fogou.chygwyn.com (unknown [10.33.36.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 918396084E;
	Thu, 14 Nov 2019 10:48:48 +0000 (UTC)
To: Bob Peterson <rpeterso@redhat.com>,
	cluster-devel <cluster-devel@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <9b23098c-865c-4b1c-9024-be2c2e461afe@redhat.com>
Date: Thu, 14 Nov 2019 10:48:47 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 00/32] gfs2: misc recovery patch
 collection
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: fdCRgolxPja6NksxK2YeQw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

There are a lot of useful fixes in this series. We should consider how=20
many of them should go to -stable I think. Also we should start to get=20
them integrated upstream. Might be a good plan to sort out the more=20
obvious ones and send those right away, and then do anything which needs=20
a bit more review in a second pass,

Steve.

On 13/11/2019 21:29, Bob Peterson wrote:
> This is my latest collection of patches to address the myriad of gfs2
> recovery problems I've found. I'm not convinced we need all of these
> but I thought I'd send them anyway and get feedback
>
> Some of these are just bugs and may be pushed separately.
>
> Bob Peterson (32):
>    gfs2: Introduce concept of a pending withdraw
>    gfs2: clear ail1 list when gfs2 withdraws
>    gfs2: Rework how rgrp buffer_heads are managed
>    gfs2: fix infinite loop in gfs2_ail1_flush on io error
>    gfs2: log error reform
>    gfs2: Only complain the first time an io error occurs in quota or log
>    gfs2: Ignore dlm recovery requests if gfs2 is withdrawn
>    gfs2: move check_journal_clean to util.c for future use
>    gfs2: Allow some glocks to be used during withdraw
>    gfs2: Don't loop forever in gfs2_freeze if withdrawn
>    gfs2: Make secondary withdrawers wait for first withdrawer
>    gfs2: Don't write log headers after file system withdraw
>    gfs2: Force withdraw to replay journals and wait for it to finish
>    gfs2: fix infinite loop when checking ail item count before go_inval
>    gfs2: Add verbose option to check_journal_clean
>    gfs2: Abort gfs2_freeze if io error is seen
>    gfs2: Issue revokes more intelligently
>    gfs2: Prepare to withdraw as soon as an IO error occurs in log write
>    gfs2: Check for log write errors before telling dlm to unlock
>    gfs2: new slab for transactions
>    gfs2: Close timing window with GLF_INVALIDATE_IN_PROGRESS
>    gfs2: Do log_flush in gfs2_ail_empty_gl even if ail list is empty
>    gfs2: Don't skip log flush if glock still has revokes
>    gfs2: initialize tr_ail1_list when creating transactions
>    gfs2: Withdraw in gfs2_ail1_flush if write_cache_pages returns error
>    gfs2: drain the ail2 list after io errors
>    gfs2: make gfs2_log_shutdown static
>    gfs2: Eliminate GFS2_RDF_UPTODATE flag in favor of buffer existence
>    gfs2: if finish_open returns error, clean up iopen glock mess
>    gfs2: Don't demote a glock until its revokes are written
>    gfs2: Do proper error checking for go_sync family of glops functions
>    gfs2: fix glock reference problem in gfs2_trans_add_unrevoke
>
>   fs/gfs2/aops.c       |   4 +-
>   fs/gfs2/file.c       |   2 +-
>   fs/gfs2/glock.c      | 140 ++++++++++++++++++++++----
>   fs/gfs2/glops.c      | 153 ++++++++++++++++++++++------
>   fs/gfs2/incore.h     |  21 ++--
>   fs/gfs2/inode.c      |   6 ++
>   fs/gfs2/lock_dlm.c   |  52 ++++++++++
>   fs/gfs2/log.c        | 231 +++++++++++++++++++++++++++++-------------
>   fs/gfs2/log.h        |   2 +-
>   fs/gfs2/lops.c       |  12 ++-
>   fs/gfs2/main.c       |  23 +++++
>   fs/gfs2/meta_io.c    |   6 +-
>   fs/gfs2/ops_fstype.c |  51 +---------
>   fs/gfs2/quota.c      |  10 +-
>   fs/gfs2/recovery.c   |   5 +
>   fs/gfs2/rgrp.c       |  82 +++++++++------
>   fs/gfs2/rgrp.h       |   1 -
>   fs/gfs2/super.c      |  97 ++++++++++++------
>   fs/gfs2/sys.c        |   2 +-
>   fs/gfs2/trans.c      |  38 +++++--
>   fs/gfs2/trans.h      |   1 +
>   fs/gfs2/util.c       | 235 +++++++++++++++++++++++++++++++++++++++++--
>   fs/gfs2/util.h       |  16 +++
>   23 files changed, 924 insertions(+), 266 deletions(-)
>

