Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E8E26BC5
	for <lists+cluster-devel@lfdr.de>; Wed, 22 May 2019 21:30:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB399C066462;
	Wed, 22 May 2019 19:30:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D205D60FFE;
	Wed, 22 May 2019 19:29:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E1145B426;
	Wed, 22 May 2019 19:29:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4MJT3Zj005287 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 22 May 2019 15:29:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 52E90544F8; Wed, 22 May 2019 19:29:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CBFB7DFC2;
	Wed, 22 May 2019 19:28:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4E003084039;
	Wed, 22 May 2019 19:28:44 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A57F820675;
	Wed, 22 May 2019 19:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558553324;
	bh=er8bjw5Be+wNat4kjZirfdmwGlYr8c9X0T3DtQXcQ0U=;
	h=From:To:Cc:Subject:Date:From;
	b=hXanLC5haxR2Frrfq++h4SKE8xSaKbXFxztEzhb41xn/qrRkfjAtVqt0EsYkwnWbl
	oXxrh5055s6e90Q8vxd2MNcd6At0oFvr//nC3CjvpaUf/3v3Dvfu98tUL/T6R5GXUH
	eOPhePL8dfCgrGZ8TMwQvCJj3iSoTstDiqGTgvrA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 22 May 2019 15:25:56 -0400
Message-Id: <20190522192842.25858-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 22 May 2019 19:28:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Wed, 22 May 2019 19:28:44 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'sashal@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<sashal@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 4.14 001/167] gfs2: Fix lru_count
	going negative
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Wed, 22 May 2019 19:30:05 +0000 (UTC)

From: Ross Lagerwall <ross.lagerwall@citrix.com>

[ Upstream commit 7881ef3f33bb80f459ea6020d1e021fc524a6348 ]

Under certain conditions, lru_count may drop below zero resulting in
a large amount of log spam like this:

vmscan: shrink_slab: gfs2_dump_glock+0x3b0/0x630 [gfs2] \
    negative objects to delete nr=-1

This happens as follows:
1) A glock is moved from lru_list to the dispose list and lru_count is
   decremented.
2) The dispose function calls cond_resched() and drops the lru lock.
3) Another thread takes the lru lock and tries to add the same glock to
   lru_list, checking if the glock is on an lru list.
4) It is on a list (actually the dispose list) and so it avoids
   incrementing lru_count.
5) The glock is moved to lru_list.
5) The original thread doesn't dispose it because it has been re-added
   to the lru list but the lru_count has still decreased by one.

Fix by checking if the LRU flag is set on the glock rather than checking
if the glock is on some list and rearrange the code so that the LRU flag
is added/removed precisely when the glock is added/removed from lru_list.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/glock.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index d5284d0dbdb59..cd6a64478a026 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -183,15 +183,19 @@ static int demote_ok(const struct gfs2_glock *gl)
 
 void gfs2_glock_add_to_lru(struct gfs2_glock *gl)
 {
+	if (!(gl->gl_ops->go_flags & GLOF_LRU))
+		return;
+
 	spin_lock(&lru_lock);
 
-	if (!list_empty(&gl->gl_lru))
-		list_del_init(&gl->gl_lru);
-	else
+	list_del(&gl->gl_lru);
+	list_add_tail(&gl->gl_lru, &lru_list);
+
+	if (!test_bit(GLF_LRU, &gl->gl_flags)) {
+		set_bit(GLF_LRU, &gl->gl_flags);
 		atomic_inc(&lru_count);
+	}
 
-	list_add_tail(&gl->gl_lru, &lru_list);
-	set_bit(GLF_LRU, &gl->gl_flags);
 	spin_unlock(&lru_lock);
 }
 
@@ -201,7 +205,7 @@ static void gfs2_glock_remove_from_lru(struct gfs2_glock *gl)
 		return;
 
 	spin_lock(&lru_lock);
-	if (!list_empty(&gl->gl_lru)) {
+	if (test_bit(GLF_LRU, &gl->gl_flags)) {
 		list_del_init(&gl->gl_lru);
 		atomic_dec(&lru_count);
 		clear_bit(GLF_LRU, &gl->gl_flags);
@@ -1158,8 +1162,7 @@ void gfs2_glock_dq(struct gfs2_holder *gh)
 		    !test_bit(GLF_DEMOTE, &gl->gl_flags))
 			fast_path = 1;
 	}
-	if (!test_bit(GLF_LFLUSH, &gl->gl_flags) && demote_ok(gl) &&
-	    (glops->go_flags & GLOF_LRU))
+	if (!test_bit(GLF_LFLUSH, &gl->gl_flags) && demote_ok(gl))
 		gfs2_glock_add_to_lru(gl);
 
 	trace_gfs2_glock_queue(gh, 0);
@@ -1454,6 +1457,7 @@ __acquires(&lru_lock)
 		if (!spin_trylock(&gl->gl_lockref.lock)) {
 add_back_to_lru:
 			list_add(&gl->gl_lru, &lru_list);
+			set_bit(GLF_LRU, &gl->gl_flags);
 			atomic_inc(&lru_count);
 			continue;
 		}
@@ -1461,7 +1465,6 @@ __acquires(&lru_lock)
 			spin_unlock(&gl->gl_lockref.lock);
 			goto add_back_to_lru;
 		}
-		clear_bit(GLF_LRU, &gl->gl_flags);
 		gl->gl_lockref.count++;
 		if (demote_ok(gl))
 			handle_callback(gl, LM_ST_UNLOCKED, 0, false);
@@ -1496,6 +1499,7 @@ static long gfs2_scan_glock_lru(int nr)
 		if (!test_bit(GLF_LOCK, &gl->gl_flags)) {
 			list_move(&gl->gl_lru, &dispose);
 			atomic_dec(&lru_count);
+			clear_bit(GLF_LRU, &gl->gl_flags);
 			freed++;
 			continue;
 		}
-- 
2.20.1

