Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 857E044ED9E
	for <lists+cluster-devel@lfdr.de>; Fri, 12 Nov 2021 20:53:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636746808;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0T7tDP4HEfk6tnitH7w30jx5kc1Q6ZGsWayT60EuTqg=;
	b=DRIcQKanKfiWp0xGZ7SxXPlrsfiA8jTOtBH2sCc1zxcOzNpSVN2abSVNYyu5CNv3VKbAxV
	3+Tu2ecuOHwbF188Z4NAfs5Qy8f5CYxZ5OIlAlncrvGWpmaLxW+h6Zf+ybWwAsnQTtjYJS
	7uKHn/ylV/615LAyThSotIs0ozXWfPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-KGNXTWU9P2y2kbk2-nSmcw-1; Fri, 12 Nov 2021 14:53:25 -0500
X-MC-Unique: KGNXTWU9P2y2kbk2-nSmcw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 182809F92A;
	Fri, 12 Nov 2021 19:53:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B4545C1B4;
	Fri, 12 Nov 2021 19:53:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B6EDC181A1CF;
	Fri, 12 Nov 2021 19:53:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ACJrIIE007865 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Nov 2021 14:53:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6526F5C1D0; Fri, 12 Nov 2021 19:53:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 343045C1B4
	for <cluster-devel@redhat.com>; Fri, 12 Nov 2021 19:53:12 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 12 Nov 2021 13:53:12 -0600
Message-Id: <20211112195312.240650-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: zero out all rgrp lvbs after recovery
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

When journals are replayed they start from the last stable point in
the journal. But an rgrp's glock lvb can be updated before the rgrp is
stable in the journal, so another node can see newer lvb values that
reflect changes made after the stable point in the journal.

This patch changes function thaw_glock, which is called after journal
recovery is complete, on every node, regardless of whether or not the
node replayed the journal (and therefore the rgrps). There's no good
way for any given node to determine if its rgrp glocks had been replayed
by a different node from a another node's journal, so it has no way to know
if its lvbs are still valid. So as soon as it knows recovery is complete
and the journals have been properly replayed, it zeroes out the lvbs
for all rgrp glocks. This forces it to re-read the lvb the next time
the glock is held.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glock.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 8dbd6fe66420..24c101287b70 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2161,6 +2161,8 @@ void gfs2_flush_delete_work(struct gfs2_sbd *sdp)
 
 static void thaw_glock(struct gfs2_glock *gl)
 {
+	if (gl->gl_name.ln_type == LM_TYPE_RGRP)
+		memset(gl->gl_lksb.sb_lvbptr, 0, sizeof(struct gfs2_rgrp_lvb));
 	if (!test_and_clear_bit(GLF_FROZEN, &gl->gl_flags))
 		return;
 	if (!lockref_get_not_dead(&gl->gl_lockref))
-- 
2.33.1

