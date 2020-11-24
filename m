Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A4FB02C31E9
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Nov 2020 21:28:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606249692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=q2rCKN48I+EvjWHDx3oH7XXfipNh1g4/gw5VE026Cn4=;
	b=Ec5CP5mDkL3+GWYKQV+0yD95Y1DcH0LmSoakQTy8zRhvVPr5OhBcBLBn3TLFIASmC/UQpE
	Qq6KrbRxDZL+fI8Dk2vNkeU7ts11xmIvm5Wc01+w6PhD2RALPnxgboUR1Q5unpFYSa9J8n
	2YdwlriGculI3GYBJsYXWm0y4MRujNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-d747DcCJOCqcVAjiUHS_BA-1; Tue, 24 Nov 2020 15:28:10 -0500
X-MC-Unique: d747DcCJOCqcVAjiUHS_BA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42DD48049CF;
	Tue, 24 Nov 2020 20:28:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E33560C43;
	Tue, 24 Nov 2020 20:28:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B15B94BB7B;
	Tue, 24 Nov 2020 20:28:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AOKS4oN015589 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 15:28:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3DB0912D7E; Tue, 24 Nov 2020 20:28:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38EDE1F0
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 20:28:01 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 089AA4BB40
	for <cluster-devel@redhat.com>; Tue, 24 Nov 2020 20:28:01 +0000 (UTC)
Date: Tue, 24 Nov 2020 15:28:00 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1899966741.29450616.1606249680993.JavaMail.zimbra@redhat.com>
In-Reply-To: <133471958.29450607.1606249651903.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.113.100, 10.4.195.3]
Thread-Topic: gfs2: Don't freeze the file system during unmount
Thread-Index: 2FtnQGnTs0m2Cg+KsNs7YrQ2s+Q0dQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Don't freeze the file system
	during unmount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

GFS2's freeze/thaw mechanism uses a special freeze glock to control its
operation. It does this with a sync glock operation (glops.c) called
freeze_go_sync. When the freeze glock is demoted (glock's do_xmote) the
glops function causes the file system to be frozen. This is intended. However,
GFS2's mount and unmount processes also hold the freeze glock to prevent other
processes, perhaps on different cluster nodes, from mounting the frozen file
system in read-write mode.

Before this patch, there was no check in freeze_go_sync for whether a freeze
in intended or whether the glock demote was caused by a normal unmount.
So it was trying to freeze the file system it's trying to unmount, which
ends up in a deadlock.

This patch adds an additional check to freeze_go_sync so that demotes of the
freeze glock are ignored if they come from the unmount process.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index e2cfc00ab936..3faa421568b0 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -582,7 +582,8 @@ static int freeze_go_sync(struct gfs2_glock *gl)
 	 * Once thawed, the work func acquires the freeze glock in
 	 * SH and everybody goes back to thawed.
 	 */
-	if (gl->gl_state == LM_ST_SHARED && !gfs2_withdrawn(sdp)) {
+	if (gl->gl_state == LM_ST_SHARED && !gfs2_withdrawn(sdp) &&
+	    !test_bit(SDF_NORECOVERY, &sdp->sd_flags)) {
 		atomic_set(&sdp->sd_freeze_state, SFS_STARTING_FREEZE);
 		error = freeze_super(sdp->sd_vfs);
 		if (error) {

