Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1236D1F1CBA
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jun 2020 18:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591632172;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vhFJhd0zagUIZ1voVPtSOEzKHeAy8DI0MtgCiGBUNvo=;
	b=HRrG27HEJlKI1IlyuIy7n/tq3HcP96zG+Jsqz6k1ZV/OQJjAfDXH5Bso6YGytdV8U7xoWz
	BoRPaZM3xq37txQiEdcCRjCTR6cpliYjKLwvhJH2AV27dSQMX6GtXlJW4hTPUdJoHbrHMK
	u7KPDnzEwifdB1CJ8KC4U58KSzAkyzo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-kGLuXBsdOt6oQgXVwFJ-fA-1; Mon, 08 Jun 2020 12:02:50 -0400
X-MC-Unique: kGLuXBsdOt6oQgXVwFJ-fA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AE82107B26F;
	Mon,  8 Jun 2020 16:02:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0CA67A1E6;
	Mon,  8 Jun 2020 16:02:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DC263B3490;
	Mon,  8 Jun 2020 16:02:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058G18YX011812 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 12:01:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A82189274; Mon,  8 Jun 2020 16:01:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.home.com (unknown [10.40.195.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C6208926C;
	Mon,  8 Jun 2020 16:01:07 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon,  8 Jun 2020 18:00:35 +0200
Message-Id: <20200608160039.549204-17-agruenba@redhat.com>
In-Reply-To: <20200608160039.549204-1-agruenba@redhat.com>
References: <20200608160039.549204-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 16/20] gfs2: Wake up when setting GLF_DEMOTE
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Wake up the sdp->sd_async_glock_wait wait queue when setting the GLF_DEMOTE
flag.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/glock.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 711259f68d55..7ad06dd49352 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -464,6 +464,15 @@ static void state_change(struct gfs2_glock *gl, unsigned int new_state)
 	gl->gl_tchange = jiffies;
 }
 
+static void gfs2_set_demote(struct gfs2_glock *gl)
+{
+	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
+
+	set_bit(GLF_DEMOTE, &gl->gl_flags);
+	smp_mb();
+	wake_up(&sdp->sd_async_glock_wait);
+}
+
 static void gfs2_demote_wake(struct gfs2_glock *gl)
 {
 	gl->gl_demote_state = LM_ST_EXCLUSIVE;
@@ -876,7 +885,7 @@ static void glock_work_func(struct work_struct *work)
 
 		if (!delay) {
 			clear_bit(GLF_PENDING_DEMOTE, &gl->gl_flags);
-			set_bit(GLF_DEMOTE, &gl->gl_flags);
+			gfs2_set_demote(gl);
 		}
 	}
 	run_queue(gl, 0);
@@ -1221,9 +1230,10 @@ int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs)
 static void handle_callback(struct gfs2_glock *gl, unsigned int state,
 			    unsigned long delay, bool remote)
 {
-	int bit = delay ? GLF_PENDING_DEMOTE : GLF_DEMOTE;
-
-	set_bit(bit, &gl->gl_flags);
+	if (delay)
+		set_bit(GLF_PENDING_DEMOTE, &gl->gl_flags);
+	else
+		gfs2_set_demote(gl);
 	if (gl->gl_demote_state == LM_ST_EXCLUSIVE) {
 		gl->gl_demote_state = state;
 		gl->gl_demote_time = jiffies;
-- 
2.26.2

