Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 42E752B7EFD
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Nov 2020 15:03:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605708225;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=U7lcpZ208YqI3J+RFQrzR8ThFWXCc3FRHfRSoK2AagY=;
	b=Ry728r/oxPvW/ybLn8Jvi5vmU9Se2nzPtDe8cl3YB+n0YKMvjMJTH53CRU2Xl6fpwUZ0jy
	/+WPu8gO82M9yk4U1rEGYb6vFW2bG61mGoYcAsLb4lAVU6EgC7jBWeW5x9P9URUhQ+ltEW
	j2B/+oc2/3UeHFIJkMIQ6h9eAW7bxYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-v_Wx2RWMM8aqqEpD9hqtTg-1; Wed, 18 Nov 2020 09:03:38 -0500
X-MC-Unique: v_Wx2RWMM8aqqEpD9hqtTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2CA31017DCB;
	Wed, 18 Nov 2020 14:03:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3A2310016F7;
	Wed, 18 Nov 2020 14:03:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0273F1805304;
	Wed, 18 Nov 2020 14:03:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AIDsZxS006738 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 18 Nov 2020 08:54:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5C5DF5D6AB; Wed, 18 Nov 2020 13:54:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 193F35D6A1;
	Wed, 18 Nov 2020 13:54:32 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F6E1183D020;
	Wed, 18 Nov 2020 13:54:32 +0000 (UTC)
Date: Wed, 18 Nov 2020 08:54:31 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1998172605.26298612.1605707671951.JavaMail.zimbra@redhat.com>
In-Reply-To: <143412243.26298475.1605707584717.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.10, 10.4.195.12]
Thread-Topic: gfs2: Fix regression in freeze_go_sync
Thread-Index: lNsPWPV1nDcOqyWlVGgLz1xSw1wi0A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v2] gfs2: Fix regression in
	freeze_go_sync
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

(This is the same patch I posted yesterday but I revised the comment
based on suggestions from Andreas.)

Patch 541656d3a513 ("gfs2: freeze should work on read-only mounts") changed the
check for glock state in function freeze_go_sync() from "gl->gl_state ==
LM_ST_SHARED" to "gl->gl_req == LM_ST_EXCLUSIVE". That's wrong and it regressed
gfs2's freeze/thaw mechanism because only the freezing node (who requests
the glock in EX) queued freeze work.

All nodes go through this go_sync code path during the freeze to drop their
SHared hold on the freeze glock, allowing the freezing node to acquire it
in EXclusive mode. But all the nodes must freeze access to the file system
locally, so they ALL must queue freeze work. The freeze_work calls
freeze_func, which makes a request to reacquire the freeze glock in SH,
effectively blocking until the thaw from the EX holder. Once thawed, the
freezing node drops its EX hold on the freeze glock, then the (blocked)
freeze_func reacquires the freeze glock in SH again (on all nodes, including
the freezer) so all nodes go back to a thawed state.

This patch changes the check back to gl_state == LM_ST_SHARED like it was
prior to 541656d3a513.

Fixes: 541656d3a513 ("gfs2: freeze should work on read-only mounts")
Cc: stable@vger.kernel.org # v5.8+
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 6c1432d78dce..67f2921ae8d4 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -571,7 +571,18 @@ static int freeze_go_sync(struct gfs2_glock *gl)
 	int error = 0;
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
 
-	if (gl->gl_req == LM_ST_EXCLUSIVE && !gfs2_withdrawn(sdp)) {
+	/*
+	 * We need to check gl_state == LM_ST_SHARED here and not gl_req ==
+	 * LM_ST_EXCLUSIVE. That's because when any node does a freeze,
+	 * all the nodes should have the freeze glock in SH mode and they all
+	 * call do_xmote: One for EX and the others for UN. They ALL must
+	 * freeze locally, and they ALL must queue freeze work. The freeze_work
+	 * calls freeze_func, which tries to reacquire the freeze glock in SH,
+	 * effectively waiting for the thaw on the node who holds it in EX.
+	 * Once thawed, the work func acquires the freeze glock in
+	 * SH and everybody goes back to thawed.
+	 */
+	if (gl->gl_state == LM_ST_SHARED && !gfs2_withdrawn(sdp)) {
 		atomic_set(&sdp->sd_freeze_state, SFS_STARTING_FREEZE);
 		error = freeze_super(sdp->sd_vfs);
 		if (error) {

