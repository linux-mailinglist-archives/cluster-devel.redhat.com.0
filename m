Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 547F6171AE0
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Feb 2020 14:57:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582811866;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G9POXr4UT0yi7zmDCzRJ3gVmaQp3f9QmznDCl8s9zlA=;
	b=gu9YVRu8NfjfgO9ZnW4bG0socmCpJB343NwfSn+YStaLQeRqaOp4uqX2UKA3MspYHyzYbE
	/B0qYTTRYBA1wE6WcIjwzXS1mRB00uscj9PO/pKLTfche1sLPrZ6EqQy3b7QFM0hywFn+B
	Mw21IEgGvYLIs+B8Jh0Vx1uaYSBW+M0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-dbfTZJfKMe22BrPMlbjiVA-1; Thu, 27 Feb 2020 08:57:44 -0500
X-MC-Unique: dbfTZJfKMe22BrPMlbjiVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BA53108443B;
	Thu, 27 Feb 2020 13:57:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B80419C7F;
	Thu, 27 Feb 2020 13:57:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 070D484468;
	Thu, 27 Feb 2020 13:57:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01RDvUpM001246 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 08:57:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3E06D1CB; Thu, 27 Feb 2020 13:57:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3959A8C08D
	for <cluster-devel@redhat.com>; Thu, 27 Feb 2020 13:57:27 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BAE3718095FF;
	Thu, 27 Feb 2020 13:57:27 +0000 (UTC)
Date: Thu, 27 Feb 2020 08:57:27 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <1689115571.11050129.1582811847602.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200227053842.4wthay5evgb4tlap@kili.mountain>
References: <20200227053842.4wthay5evgb4tlap@kili.mountain>
MIME-Version: 1.0
X-Originating-IP: [10.36.116.223, 10.4.195.10]
Thread-Topic: gfs2: Force withdraw to replay journals and wait for it to finish
Thread-Index: 5VNT/ut4AwOo7V5yQMxMC44zsaBLSA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [bug report] gfs2: Force withdraw to replay
 journals and wait for it to finish
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> Hello Bob Peterson,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch f4e8da521747: "gfs2: Force withdraw to replay journals and
> wait for it to finish" from Jan 28, 2020, leads to the following
> Smatch complaint:
> 
>     fs/gfs2/util.c:135 signal_our_withdraw()
>      error: we previously assumed 'sdp->sd_vfs' could be null (see line 119)
> 
> fs/gfs2/util.c
>    118		clear_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
>    119		if (sdp->sd_vfs && !sb_rdonly(sdp->sd_vfs))
>                     ^^^^^^^^^^^
> Patch adds check
> 
>    120			ret = gfs2_make_fs_ro(sdp);
>    121
>    122		/*
>    123		 * Drop the glock for our journal so another node can recover it.
>    124		 */
>    125		if (gfs2_holder_initialized(&sdp->sd_journal_gh)) {
>    126			gfs2_glock_dq_wait(&sdp->sd_journal_gh);
>    127			gfs2_holder_uninit(&sdp->sd_journal_gh);
>    128		}
>    129		sdp->sd_jinode_gh.gh_flags |= GL_NOCACHE;
>    130		gfs2_glock_dq(&sdp->sd_jinode_gh);
>    131		if (test_bit(SDF_FS_FROZEN, &sdp->sd_flags)) {
>    132			/* Make sure gfs2_unfreeze works if partially-frozen */
>    133			flush_workqueue(gfs2_freeze_wq);
>    134			atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
>    135			thaw_super(sdp->sd_vfs);
>                         ^^^^^^^^^^^^^^^^^^^^^^^
> And unchecked dereference as well inside the thaw_super() function.
> 
>    136		} else {
>    137			wait_on_bit(&gl->gl_flags, GLF_DEMOTE, TASK_UNINTERRUPTIBLE);
> 
> regards,
> dan carpenter

Hi,

Thanks. I fixed it.

Bob Peterson

