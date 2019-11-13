Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B4ACCFBAC8
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680648;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=u/8EL/S+hWsDpHuvAKtTryjaq07rtBYPXYvfv1stVsk=;
	b=fv3mgzZims+m66Lyt7q7eGAAeKtNiciMbdccICKkuN54blLik7+oVI1oBCl3/yP01mtwlv
	FeCe2xQKZiksBGU7lKsErfBa3HW/k1vSulsohuiTlJC7b4AP/dHnC9jQATanzF2pnKOsHy
	EoiqTL9QbN3IcSS4Rt2kZlIQ7blhkGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-U6OfdaVONU2ggZdPWotikg-1; Wed, 13 Nov 2019 16:30:47 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30A42189DC15;
	Wed, 13 Nov 2019 21:30:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EFAF6A505;
	Wed, 13 Nov 2019 21:30:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 042B74E56C;
	Wed, 13 Nov 2019 21:30:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUcga005256 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 40E0369739; Wed, 13 Nov 2019 21:30:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CC7F5C1BB
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:37 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:09 -0600
Message-Id: <20191113213030.237431-12-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 11/32] gfs2: Make secondary withdrawers wait
	for first withdrawer
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
X-MC-Unique: U6OfdaVONU2ggZdPWotikg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Before this patch, if a process encountered an error and decided to
withdraw, if another process was already in the process of withdrawing,
the secondary withdraw would be silently ignored, which set it free
to proceed with its processing, unlock any locks, etc. That's correct
behavior if the original withdrawer encounters further errors down
the road. However, second withdrawers need to wait for the first
withdrawer to finish its withdraw before proceeding. If we don't wait
we could end up assuming everything is alright, unlock glocks and
telling other nodes they can have the glock, despite the fact that
a withdraw is still ongoing and may require a journal replay before
any locks are released. For example, if an rgrp glock is freed
by a process that didn't wait for the withdraw, a journal replay
could introduce file system corruption by replaying a rgrp block
that has already been granted to another node.

This patch makes secondary withdrawers wait until the primary
withdrawer is finished with its processing before proceeding.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h |  3 +++
 fs/gfs2/util.c   | 21 +++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index f6ec52776408..6e713bf536a1 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -619,6 +619,7 @@ enum {
 =09SDF_FORCE_AIL_FLUSH     =3D 9,
 =09SDF_FS_FROZEN           =3D 10,
 =09SDF_WITHDRAWING=09=09=3D 11, /* Will withdraw eventually */
+=09SDF_WITHDRAW_IN_PROG=09=3D 12, /* Withdraw is in progress */
 };
=20
 enum gfs2_freeze_state {
@@ -829,6 +830,8 @@ struct gfs2_sbd {
 =09struct bio *sd_log_bio;
 =09wait_queue_head_t sd_log_flush_wait;
 =09int sd_log_error; /* First log error */
+=09atomic_t sd_withdrawer;
+=09wait_queue_head_t sd_withdraw_wait;
=20
 =09atomic_t sd_reserving_log;
 =09wait_queue_head_t sd_reserving_log_wait;
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 13068968a958..4ef5218303d7 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -86,9 +86,23 @@ int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *f=
mt, ...)
 =09struct va_format vaf;
=20
 =09if (sdp->sd_args.ar_errors =3D=3D GFS2_ERRORS_WITHDRAW &&
-=09    test_and_set_bit(SDF_WITHDRAWN, &sdp->sd_flags))
-=09=09return 0;
+=09    test_and_set_bit(SDF_WITHDRAWN, &sdp->sd_flags)) {
+=09=09if (!test_bit(SDF_WITHDRAW_IN_PROG, &sdp->sd_flags))
+=09=09=09return -1;
+
+=09=09fs_warn(sdp, "Pid %d waiting for process %d to withdraw.\n",
+=09=09=09pid_nr(task_pid(current)),
+=09=09=09atomic_read(&sdp->sd_withdrawer));
+=09=09wait_on_bit(&sdp->sd_flags, SDF_WITHDRAW_IN_PROG,
+=09=09=09    TASK_UNINTERRUPTIBLE);
+=09=09fs_warn(sdp, "Pid %d done waiting for process %d.\n",
+=09=09=09pid_nr(task_pid(current)),
+=09=09=09atomic_read(&sdp->sd_withdrawer));
+=09=09return -1;
+=09}
=20
+=09set_bit(SDF_WITHDRAW_IN_PROG, &sdp->sd_flags);
+=09atomic_set(&sdp->sd_withdrawer, pid_nr(task_pid(current)));
 =09if (fmt) {
 =09=09va_start(args, fmt);
=20
@@ -116,6 +130,9 @@ int gfs2_lm_withdraw(struct gfs2_sbd *sdp, const char *=
fmt, ...)
 =09=09set_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags);
 =09=09fs_err(sdp, "withdrawn\n");
 =09=09dump_stack();
+=09=09clear_bit(SDF_WITHDRAW_IN_PROG, &sdp->sd_flags);
+=09=09smp_mb__after_atomic();
+=09=09wake_up_bit(&sdp->sd_flags, SDF_WITHDRAW_IN_PROG);
 =09}
=20
 =09if (sdp->sd_args.ar_errors =3D=3D GFS2_ERRORS_PANIC)
--=20
2.23.0

