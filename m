Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 74A251FCDFA
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Jun 2020 14:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592398761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=bgQdDpnhOKa7VHuOZUqbz/NTO19wXj2bzwWRD9u6Y9c=;
	b=ZqLMekUBZYQEY0IDkRHnGI6BCoNT9owYuEo6FgY5yrFNuFZAikwH4NCTOYOHQgliO4N+wV
	S2GDYnmZF9ocZJvQHCu36SoEPGv2B4XjDrLl2lfL7kCXsotR4GzZD5Fx1++gKwnBei1VC5
	pVD72Sh46i61eIzeZi3dAyVvQtadbGc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-Da_lv_a_NtC1K-n4MWnLIw-1; Wed, 17 Jun 2020 08:59:19 -0400
X-MC-Unique: Da_lv_a_NtC1K-n4MWnLIw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDE171940923;
	Wed, 17 Jun 2020 12:59:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45F4119D7E;
	Wed, 17 Jun 2020 12:59:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA0EF833CC;
	Wed, 17 Jun 2020 12:59:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05HCxAal024071 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 08:59:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9DE587BA19; Wed, 17 Jun 2020 12:59:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 102147A029;
	Wed, 17 Jun 2020 12:59:08 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 080F018095FF;
	Wed, 17 Jun 2020 12:59:08 +0000 (UTC)
Date: Wed, 17 Jun 2020 08:59:07 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <416853929.34251287.1592398747954.JavaMail.zimbra@redhat.com>
In-Reply-To: <1421688518.34251202.1592398677345.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.115.80, 10.4.195.11]
Thread-Topic: gfs2: eliminate GIF_ORDERED in favor of list_empty
Thread-Index: YUtX+Hye7UwLk2FQXdVaK3erZRABDg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: eliminate GIF_ORDERED in favor
	of list_empty
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

In several places, we used the GIF_ORDERED inode flag to determine
if an inode was on the ordered writes list. However, since we always
held the sd_ordered_lock spin_lock during the manipulation, we can
just as easily check list_empty(&ip->i_ordered) instead.
This allows us to keep more than one ordered writes list to make
journal writing improvements.

This patch eliminates GIF_ORDERED in favor of checking list_empty.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h |  1 -
 fs/gfs2/log.c    | 15 +++++++++------
 fs/gfs2/log.h    |  4 ++--
 fs/gfs2/main.c   |  1 +
 4 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 36a6c640a372..a29e391d61a8 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -402,7 +402,6 @@ enum {
 	GIF_QD_LOCKED		= 1,
 	GIF_ALLOC_FAILED	= 2,
 	GIF_SW_PAGED		= 3,
-	GIF_ORDERED		= 4,
 	GIF_FREE_VFS_INODE      = 5,
 	GIF_GLOP_PENDING	= 6,
 	GIF_DEFERRED_DELETE	= 7,
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 6129a0d348ee..331c5baa13ec 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -625,6 +625,12 @@ static int ip_cmp(void *priv, struct list_head *a, struct list_head *b)
 	return 0;
 }
 
+static void __ordered_del_inode(struct gfs2_inode *ip)
+{
+	if (!list_empty(&ip->i_ordered))
+		list_del_init(&ip->i_ordered);
+}
+
 static void gfs2_ordered_write(struct gfs2_sbd *sdp)
 {
 	struct gfs2_inode *ip;
@@ -635,8 +641,7 @@ static void gfs2_ordered_write(struct gfs2_sbd *sdp)
 	while (!list_empty(&sdp->sd_log_ordered)) {
 		ip = list_first_entry(&sdp->sd_log_ordered, struct gfs2_inode, i_ordered);
 		if (ip->i_inode.i_mapping->nrpages == 0) {
-			test_and_clear_bit(GIF_ORDERED, &ip->i_flags);
-			list_del(&ip->i_ordered);
+			__ordered_del_inode(ip);
 			continue;
 		}
 		list_move(&ip->i_ordered, &written);
@@ -655,8 +660,7 @@ static void gfs2_ordered_wait(struct gfs2_sbd *sdp)
 	spin_lock(&sdp->sd_ordered_lock);
 	while (!list_empty(&sdp->sd_log_ordered)) {
 		ip = list_first_entry(&sdp->sd_log_ordered, struct gfs2_inode, i_ordered);
-		list_del(&ip->i_ordered);
-		WARN_ON(!test_and_clear_bit(GIF_ORDERED, &ip->i_flags));
+		__ordered_del_inode(ip);
 		if (ip->i_inode.i_mapping->nrpages == 0)
 			continue;
 		spin_unlock(&sdp->sd_ordered_lock);
@@ -671,8 +675,7 @@ void gfs2_ordered_del_inode(struct gfs2_inode *ip)
 	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
 
 	spin_lock(&sdp->sd_ordered_lock);
-	if (test_and_clear_bit(GIF_ORDERED, &ip->i_flags))
-		list_del(&ip->i_ordered);
+	__ordered_del_inode(ip);
 	spin_unlock(&sdp->sd_ordered_lock);
 }
 
diff --git a/fs/gfs2/log.h b/fs/gfs2/log.h
index 966585eef2ac..fe9a6c9487d7 100644
--- a/fs/gfs2/log.h
+++ b/fs/gfs2/log.h
@@ -53,9 +53,9 @@ static inline void gfs2_ordered_add_inode(struct gfs2_inode *ip)
 	if (gfs2_is_jdata(ip) || !gfs2_is_ordered(sdp))
 		return;
 
-	if (!test_bit(GIF_ORDERED, &ip->i_flags)) {
+	if (list_empty(&ip->i_ordered)) {
 		spin_lock(&sdp->sd_ordered_lock);
-		if (!test_and_set_bit(GIF_ORDERED, &ip->i_flags))
+		if (list_empty(&ip->i_ordered))
 			list_add(&ip->i_ordered, &sdp->sd_log_ordered);
 		spin_unlock(&sdp->sd_ordered_lock);
 	}
diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
index 733470ca6be9..c7393ee9cf68 100644
--- a/fs/gfs2/main.c
+++ b/fs/gfs2/main.c
@@ -39,6 +39,7 @@ static void gfs2_init_inode_once(void *foo)
 	atomic_set(&ip->i_sizehint, 0);
 	init_rwsem(&ip->i_rw_mutex);
 	INIT_LIST_HEAD(&ip->i_trunc_list);
+	INIT_LIST_HEAD(&ip->i_ordered);
 	ip->i_qadata = NULL;
 	gfs2_holder_mark_uninitialized(&ip->i_rgd_gh);
 	memset(&ip->i_res, 0, sizeof(ip->i_res));

