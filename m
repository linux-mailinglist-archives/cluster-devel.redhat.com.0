Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 03BFB311056
	for <lists+cluster-devel@lfdr.de>; Fri,  5 Feb 2021 19:50:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612551055;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=f5Cg7U4zQbAydjFENPmaXZq+hzBsMRGAQ9DwVWKRPtg=;
	b=IXSG8/Bvn5eOCFfoIqZXt65xJy6Y8r0w0jPxipACx2mcyoqaZlaVjs8S6RuDGAk1IguKlz
	QznRBQIaCI0qCVooRA4tuVXgCyyq7LrdKVPavlnM5wR4xo6qeP2gh48G5m9pp13equLzGN
	kXPvsvbmWLKGGysmoLZuNoGVzAy/53s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-esNg62VBNz2EIpdjCbwFog-1; Fri, 05 Feb 2021 13:50:53 -0500
X-MC-Unique: esNg62VBNz2EIpdjCbwFog-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00636107ACE4;
	Fri,  5 Feb 2021 18:50:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1FF719CA8;
	Fri,  5 Feb 2021 18:50:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCAE218095CB;
	Fri,  5 Feb 2021 18:50:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 115Iofdm010885 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Feb 2021 13:50:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7F4C22B0A9; Fri,  5 Feb 2021 18:50:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7771260C5D;
	Fri,  5 Feb 2021 18:50:41 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F68118095CA;
	Fri,  5 Feb 2021 18:50:41 +0000 (UTC)
Date: Fri, 5 Feb 2021 13:50:41 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <721726179.52142767.1612551041387.JavaMail.zimbra@redhat.com>
In-Reply-To: <2015701800.52142747.1612550975657.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.118, 10.4.195.27]
Thread-Topic: gfs2: Don't skip dlm unlock if glock has an lvb
Thread-Index: QKo6Mqq0d2hcmCaudFq08i0MBhqgIg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [gfs2 PATCH] gfs2: Don't skip dlm unlock if glock
	has an lvb
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Patch fb6791d100d1bba20b5cdbc4912e1f7086ec60f8 was designed to allow
gfs2 to unmount quicker by skipping the step where it tells dlm to
unlock glocks in EX with lvbs. This was done because when gfs2 unmounts
a file system, it destroys the dlm lockspace shortly after it destroys
the glocks so it doesn't need to unlock them all: the unlock is implied
when the lockspace is destroyed by dlm.

However, that patch introduced a use-after-free in dlm: as part of its
normal dlm_recoverd process, it can call ls_recovery to recover dead
locks. In so doing, it can call recover_rsbs which calls recover_lvb for
any mastered rsbs. Func recover_lvb runs through the list of lkbs queued
to the given rsb (if the glock is cached but unlocked, it will still be
queued to the lkb, but in NL--Unlocked--mode) and if it has an lvb,
copies it to the rsb, thus trying to preserve the lkb. However, when
gfs2 skips the dlm unlock step, it frees the glock and its lvb, which
means dlm's function recover_lvb references the now freed lvb pointer,
copying the freed lvb memory to the rsb.

This patch changes the check in gdlm_put_lock so that it calls dlm_unlock
for all glocks that contain an lvb pointer.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Fixes: fb6791d100d1 "GFS2: skip dlm_unlock calls in unmount"
---
 fs/gfs2/lock_dlm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 9f2b5609f225..153272f82984 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -284,7 +284,6 @@ static void gdlm_put_lock(struct gfs2_glock *gl)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 	struct lm_lockstruct *ls = &sdp->sd_lockstruct;
-	int lvb_needs_unlock = 0;
 	int error;
 
 	if (gl->gl_lksb.sb_lkid == 0) {
@@ -297,13 +296,10 @@ static void gdlm_put_lock(struct gfs2_glock *gl)
 	gfs2_sbstats_inc(gl, GFS2_LKS_DCOUNT);
 	gfs2_update_request_times(gl);
 
-	/* don't want to skip dlm_unlock writing the lvb when lock is ex */
-
-	if (gl->gl_lksb.sb_lvbptr && (gl->gl_state == LM_ST_EXCLUSIVE))
-		lvb_needs_unlock = 1;
+	/* don't want to skip dlm_unlock writing the lvb when lock has one */
 
 	if (test_bit(SDF_SKIP_DLM_UNLOCK, &sdp->sd_flags) &&
-	    !lvb_needs_unlock) {
+	    !gl->gl_lksb.sb_lvbptr) {
 		gfs2_glock_free(gl);
 		return;
 	}

