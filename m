Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E1D6D2B6EE0
	for <lists+cluster-devel@lfdr.de>; Tue, 17 Nov 2020 20:42:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605642149;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=EHHVpehXjjZzMt92vdByzIWXk1l3zD55UOoTZIGAA5c=;
	b=WqKD3Un4IW8ivjYpavsfReoFf2ygSCF4yM97vQoC1QHtiB5nXhIoXqSgaSa5S0QY4/oneI
	qVrmCylzJsB7BeJaMX0TGJG4UUWd3QC6WQAN7l07BcfecSmQzdgQd6y0iBVOnbIfTzPPwE
	urDBShV1iIJCBk/DNHPlubZZ/wn5Y+M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-xH1C4qfcPC-p6sNQvR_ogQ-1; Tue, 17 Nov 2020 14:42:27 -0500
X-MC-Unique: xH1C4qfcPC-p6sNQvR_ogQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1E0864142;
	Tue, 17 Nov 2020 19:42:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 664FF1841F;
	Tue, 17 Nov 2020 19:42:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EF56F180B657;
	Tue, 17 Nov 2020 19:42:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AHJewRv001559 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 17 Nov 2020 14:40:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6826260C05; Tue, 17 Nov 2020 19:40:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61ABA60C04
	for <cluster-devel@redhat.com>; Tue, 17 Nov 2020 19:40:55 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5EA9718095FF
	for <cluster-devel@redhat.com>; Tue, 17 Nov 2020 19:40:55 +0000 (UTC)
Date: Tue, 17 Nov 2020 14:40:52 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1414973099.26198026.1605642052913.JavaMail.zimbra@redhat.com>
In-Reply-To: <796995883.26198021.1605642034293.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.10, 10.4.195.23]
Thread-Topic: gfs2: Fix regression in freeze_go_sync
Thread-Index: lAOIka1faI2MzTqyPpZ2CFgc04rSlQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Fix regression in freeze_go_sync
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Patch 541656d3a51 ("gfs2: freeze should work on read-only mounts") changed the
check for glock state in function freeze_go_sync() from "gl->gl_state ==
LM_ST_SHARED" to "gl->gl_req == LM_ST_EXCLUSIVE". That's wrong and it regressed
gfs2's freeze/thaw mechanism.

We need to check gl_state == LM_ST_SHARED and not gl_req == LM_ST_EXCLUSIVE
because when any node does a freeze, all the nodes should have the freeze glock
in SH mode and they all call do_xmote: One node for EX and the others for UN.
They ALL must freeze locally, and they ALL must queue freeze work. The
freeze_work calls freeze_func, which reacquires the freeze glock in SH,
effectively waiting for the thaw on the node who holds the freeze glock in EX.
Once thawed, the freeze_func acquires the freeze glock in SH and everybody
goes back to thawed.

Fixes: 541656d3a51 ("gfs2: freeze should work on read-only mounts")
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

