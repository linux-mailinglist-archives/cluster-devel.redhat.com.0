Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F278F1ADE05
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Apr 2020 15:09:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587128970;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NSodluDwuTvhYPF8Cqn6LmDy5Jgt+KzjLAJ4ObdWNCg=;
	b=fmgrM1HhwpNLG/mU4IV23CKbXWZQ2YWR2AE3NoYntkNLIVv9RGCo9F1O+7jBrtu4D8AUAn
	DRWn2XWPTQFbeQtSffhGxd3Bs5Gl7G2qyr7+jaPiHvj/hOvwx7hCmkbs8U+i97Za2THjVD
	+q054aju9lMGE/pxqGK7K4ZSTmCcRWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-ACqCqGtWPwqWq3gpNpreHA-1; Fri, 17 Apr 2020 09:09:26 -0400
X-MC-Unique: ACqCqGtWPwqWq3gpNpreHA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1737B149C0;
	Fri, 17 Apr 2020 13:09:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7908277B5;
	Fri, 17 Apr 2020 13:09:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A40318089C8;
	Fri, 17 Apr 2020 13:09:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03HD9Kxj029127 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 17 Apr 2020 09:09:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC706A1020; Fri, 17 Apr 2020 13:09:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0766AA09BA;
	Fri, 17 Apr 2020 13:09:18 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1E8918095FF;
	Fri, 17 Apr 2020 13:09:17 +0000 (UTC)
Date: Fri, 17 Apr 2020 09:09:16 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1706994570.22510265.1587128956368.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU43LpVbPEEq29cDkJ5X2t=6qACfoETw15QZX1CHKqPUbQ@mail.gmail.com>
References: <202004171521.Z9s8gKSV%lkp@intel.com>
	<CAHc6FU43LpVbPEEq29cDkJ5X2t=6qACfoETw15QZX1CHKqPUbQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.115.143, 10.4.195.3]
Thread-Topic: fs/gfs2/util.c:126:3: error: implicit declaration of function
	'gfs2_glock_dq_wait'; did you mean 'gfs2_glock_nq_init'?
Thread-Index: 2MoupndOds6VNctcWmauO84Exwnx9Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [gfs2:gfs2-iopen 12/12] fs/gfs2/util.c:126:3:
 error: implicit declaration of function 'gfs2_glock_dq_wait';
 did you mean 'gfs2_glock_nq_init'?
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
> Bob,
> 
> commit "gfs2: Force withdraw to replay journals and wait for it to
> finish" adds three new users of gfs2_glock_dq_wait in function
> signal_our_withdraw. Is the waiting there done for a reason, or can we
> replace gfs2_glock_dq_wait with gfs2_glock_dq / gfs2_glock_dq_uninit
> in that function?
> 
> Thanks,
> Andreas

Hi Andreas,

I remember debugging cases in which we needed to wait.
When we didn't wait for glocks to be demoted, the node just reacquired
the glocks again too quickly, before other nodes could attempt recovery.
When the withdrawing node tried to reacquire them, DLM simply granted
them on the same node, which is the only node that must not do recovery.

Addressing each instance separately:

(1) We would dequeue our journal glock, then dequeue the live glock.
    The other nodes would see the callback for the "live" glock and
    attempt recovery, however they were denied access to the journal
    glock because it was still held on the recovering node. That's
    because the glock state machine (but more importantly the dlm)
    had not yet demoted the lock completely when this took place.
    So none of the nodes performed recovery.
(2) We might be able to get rid of the "wait" for the "live" glock.
    I can't think of a case in which that would behave badly, but
    bear in mind it's been more than a year since I originally wrote
    that. It's probably closer to 2 years now.
(3) We might be able to get rid of the third "wait" which is also for
    the "live" glock. I don't remember the circumstances.

TBH, I wouldn't feel comfortable getting rid of any of those waits
until I do some heavy experimentation on my 5-node cluster with the
recovery tests.

Bob

