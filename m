Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 793D739E1C2
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Jun 2021 18:15:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-wzOU2u42M9mWP3zRVumdsA-1; Mon, 07 Jun 2021 12:15:20 -0400
X-MC-Unique: wzOU2u42M9mWP3zRVumdsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD7F36D241;
	Mon,  7 Jun 2021 16:15:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D082E60CCF;
	Mon,  7 Jun 2021 16:15:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF59E1800BB8;
	Mon,  7 Jun 2021 16:15:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 157GFAwI016717 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 7 Jun 2021 12:15:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42EB81112C14; Mon,  7 Jun 2021 16:15:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E0271004163
	for <cluster-devel@redhat.com>; Mon,  7 Jun 2021 16:15:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9120180122D
	for <cluster-devel@redhat.com>; Mon,  7 Jun 2021 16:15:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-364--v6dcuPFMwqjmIzCVA26Vw-1;
	Mon, 07 Jun 2021 12:15:01 -0400
X-MC-Unique: -v6dcuPFMwqjmIzCVA26Vw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id B68D461441;
	Mon,  7 Jun 2021 16:14:59 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon,  7 Jun 2021 12:14:36 -0400
Message-Id: <20210607161448.3584332-9-sashal@kernel.org>
In-Reply-To: <20210607161448.3584332-1-sashal@kernel.org>
References: <20210607161448.3584332-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 157GFAwI016717
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com,
	Hillf Danton <hdanton@sina.com>,
	syzbot <syzbot+34ba7ddbf3021981a228@syzkaller.appspotmail.com>
Subject: [Cluster-devel] [PATCH AUTOSEL 4.19 09/21] gfs2: Fix use-after-free
	in gfs2_glock_shrink_scan
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Hillf Danton <hdanton@sina.com>

[ Upstream commit 1ab19c5de4c537ec0d9b21020395a5b5a6c059b2 ]

The GLF_LRU flag is checked under lru_lock in gfs2_glock_remove_from_lru() to
remove the glock from the lru list in __gfs2_glock_put().

On the shrink scan path, the same flag is cleared under lru_lock but because
of cond_resched_lock(&lru_lock) in gfs2_dispose_glock_lru(), progress on the
put side can be made without deleting the glock from the lru list.

Keep GLF_LRU across the race window opened by cond_resched_lock(&lru_lock) to
ensure correct behavior on both sides - clear GLF_LRU after list_del under
lru_lock.

Reported-by: syzbot <syzbot+34ba7ddbf3021981a228@syzkaller.appspotmail.com>
Signed-off-by: Hillf Danton <hdanton@sina.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/glock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index c20d71d86812..14d11ccda868 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -1457,6 +1457,7 @@ __acquires(&lru_lock)
 	while(!list_empty(list)) {
 		gl = list_entry(list->next, struct gfs2_glock, gl_lru);
 		list_del_init(&gl->gl_lru);
+		clear_bit(GLF_LRU, &gl->gl_flags);
 		if (!spin_trylock(&gl->gl_lockref.lock)) {
 add_back_to_lru:
 			list_add(&gl->gl_lru, &lru_list);
@@ -1502,7 +1503,6 @@ static long gfs2_scan_glock_lru(int nr)
 		if (!test_bit(GLF_LOCK, &gl->gl_flags)) {
 			list_move(&gl->gl_lru, &dispose);
 			atomic_dec(&lru_count);
-			clear_bit(GLF_LRU, &gl->gl_flags);
 			freed++;
 			continue;
 		}
-- 
2.30.2


