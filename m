Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E9AAC338F13
	for <lists+cluster-devel@lfdr.de>; Fri, 12 Mar 2021 14:48:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615556882;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mGVrqRR/EdsJ58oQBz9bA8mqrPBLdCCGyVZHhJCl6xI=;
	b=KFvWaT9tZkt6NrVhV5GBhw7cH/pZMKBSKQY1rAHShSk37A3LD1F+ewjDDS0W0yQhjdL7lD
	yJI7OhPAp/yEUoZ8k2KCU7Dy6+fR60+KXnYiR8tUl0QAiwfd5uxFFPO8S/xFN9KlLieZ5X
	3x9fGEJPZm4DD+3y8UYoYz1eZU2wR08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-cIjKSFNSNmWDc-WvtO-jjQ-1; Fri, 12 Mar 2021 08:47:59 -0500
X-MC-Unique: cIjKSFNSNmWDc-WvtO-jjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E80E981746B;
	Fri, 12 Mar 2021 13:47:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A50345C1C5;
	Fri, 12 Mar 2021 13:47:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C2936CF68;
	Fri, 12 Mar 2021 13:47:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12CDlrbm005774 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Mar 2021 08:47:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1E811100F49F; Fri, 12 Mar 2021 13:47:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 189571002388
	for <cluster-devel@redhat.com>; Fri, 12 Mar 2021 13:47:50 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E1154A714
	for <cluster-devel@redhat.com>; Fri, 12 Mar 2021 13:47:50 +0000 (UTC)
Date: Fri, 12 Mar 2021 08:47:47 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <974432554.62261527.1615556867692.JavaMail.zimbra@redhat.com>
In-Reply-To: <428776378.62261523.1615556859550.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.166, 10.4.195.19]
Thread-Topic: gfs2: Bypass log flush if the journal is not live
Thread-Index: /j9qlzyjgjhRBLd7RPdCGKOaGuaG/w==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Bypass log flush if the journal
	is not live
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Patch fe3e397668775 ("gfs2: Rework the log space allocation logic")
changed the log flush logic such that it reserves a set of journal blocks
for cases in which log_flush has no active transaction but still needs
blocks for revokes. However, these blocks were still requested even if
the journal is not active, for example, for spectator mounts.
In fact, the log_flush should be bypassed entirely in these cases.
This patch adds a check to gfs2_log_flush so the function is bypassed if
the journal is not active.

Fixes: fe3e397668775 ("gfs2: Rework the log space allocation logic")
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 760af666576c..6410281546f9 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1036,7 +1036,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 	 * Do this check while holding the log_flush_lock to prevent new
 	 * buffers from being added to the ail via gfs2_pin()
 	 */
-	if (gfs2_withdrawn(sdp))
+	if (gfs2_withdrawn(sdp) || !test_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags))
 		goto out;
 
 	/* Log might have been flushed while we waited for the flush lock */

