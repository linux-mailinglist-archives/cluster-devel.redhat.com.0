Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id AC5C72E0F70
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Dec 2020 21:39:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608669549;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PR2qRemCNpYqBH8h6Pl9dwkxm3KBOZQp3bDl9ysdk70=;
	b=bvY9MfslbNC6+w5GHi8iDE4JxvQoCvGwrWIfaIBcIdpiyftL9GbWsgjGiyeoHSQkSWub3i
	8G17LwhpPSW3IToWrZo0OF4fGVDBBTNpFP7UbVubd58DSoWkA/k+JPzjMHV9ZE4X2P4Eb2
	yXo+fwhFyMxA/RvZLCuHip9OsGnITCk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-rz-0QS8NNJ2IEC2zION8gA-1; Tue, 22 Dec 2020 15:39:07 -0500
X-MC-Unique: rz-0QS8NNJ2IEC2zION8gA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33966195D560;
	Tue, 22 Dec 2020 20:39:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBCC860BF1;
	Tue, 22 Dec 2020 20:39:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E48674BB7B;
	Tue, 22 Dec 2020 20:39:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BMKd2OD030591 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 22 Dec 2020 15:39:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 06DB05D723; Tue, 22 Dec 2020 20:39:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB0295D71B
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 20:38:58 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C51EF4BB40
	for <cluster-devel@redhat.com>; Tue, 22 Dec 2020 20:38:58 +0000 (UTC)
Date: Tue, 22 Dec 2020 15:38:58 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <2125295377.38904313.1608669538740.JavaMail.zimbra@redhat.com>
In-Reply-To: <290202568.38904309.1608669529163.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.81, 10.4.195.28]
Thread-Topic: gfs2: make recovery workqueue operate on a gfs2 mount point,
	not journal
Thread-Index: h3EvnDcNYKXArkzAuFkb4JmCyoERrQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: make recovery workqueue operate
 on a gfs2 mount point, not journal
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

Before this patch, journal recovery was done by a workqueue function that
operated on a per-journal basis. The problem is, these could run simultaneously
which meant that they could all use the same bio, sd_log_bio, to do their
writing to all the various journals. These operations overwrote one another
eventually causing memory corruption.

This patch makes the recovery workqueue operate on a per-superblock basis,
which means a mount point using, for example journal0, could do recovery
for all journals that need recovery. This is done consecutively so the
sd_log_bio is only referenced by one recovery at a time, thus avoiding the
chaos.

Since the journal recovery requests can come in any order, and unpredictably,
the new work func loops until there are no more journals to be recovered.

Since multiple processes may request recovery of a journal, and since they
all now use the same sdp-based workqueue, it's okay for them to get an
error from queue_work: Queueing work while there's already work queued.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h     |  2 +-
 fs/gfs2/ops_fstype.c |  2 +-
 fs/gfs2/recovery.c   | 32 ++++++++++++++++++++++++++++----
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index 8e1ab8ed4abc..b393cbf9efeb 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -529,7 +529,6 @@ struct gfs2_jdesc {
 	struct list_head jd_list;
 	struct list_head extent_list;
 	unsigned int nr_extents;
-	struct work_struct jd_work;
 	struct inode *jd_inode;
 	unsigned long jd_flags;
 #define JDF_RECOVERY 1
@@ -746,6 +745,7 @@ struct gfs2_sbd {
 	struct completion sd_locking_init;
 	struct completion sd_wdack;
 	struct delayed_work sd_control_work;
+	struct work_struct sd_recovery_work;
 
 	/* Inode Stuff */
 
diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 61fce59cb4d3..3d9a6d6d42cb 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -93,6 +93,7 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 	init_completion(&sdp->sd_locking_init);
 	init_completion(&sdp->sd_wdack);
 	spin_lock_init(&sdp->sd_statfs_spin);
+	INIT_WORK(&sdp->sd_recovery_work, gfs2_recover_func);
 
 	spin_lock_init(&sdp->sd_rindex_spin);
 	sdp->sd_rindex_tree.rb_node = NULL;
@@ -586,7 +587,6 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struct gfs2_holder *ji_gh)
 		INIT_LIST_HEAD(&jd->extent_list);
 		INIT_LIST_HEAD(&jd->jd_revoke_list);
 
-		INIT_WORK(&jd->jd_work, gfs2_recover_func);
 		jd->jd_inode = gfs2_lookupi(sdp->sd_jindex, &name, 1);
 		if (IS_ERR_OR_NULL(jd->jd_inode)) {
 			if (!jd->jd_inode)
diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index c26c68ebd29d..cd3e66cdb560 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -399,9 +399,8 @@ static void recover_local_statfs(struct gfs2_jdesc *jd,
 	return;
 }
 
-void gfs2_recover_func(struct work_struct *work)
+static void gfs2_recover_one(struct gfs2_jdesc *jd)
 {
-	struct gfs2_jdesc *jd = container_of(work, struct gfs2_jdesc, jd_work);
 	struct gfs2_inode *ip = GFS2_I(jd->jd_inode);
 	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
 	struct gfs2_log_header_host head;
@@ -562,16 +561,41 @@ void gfs2_recover_func(struct work_struct *work)
 	wake_up_bit(&jd->jd_flags, JDF_RECOVERY);
 }
 
+void gfs2_recover_func(struct work_struct *work)
+{
+	struct gfs2_sbd *sdp = container_of(work, struct gfs2_sbd,
+					    sd_recovery_work);
+	struct gfs2_jdesc *jd;
+	int count, recovered = 0;
+
+	do {
+		count = 0;
+		spin_lock(&sdp->sd_jindex_spin);
+		list_for_each_entry(jd, &sdp->sd_jindex_list, jd_list) {
+			if (test_bit(JDF_RECOVERY, &jd->jd_flags)) {
+				spin_unlock(&sdp->sd_jindex_spin);
+				gfs2_recover_one(jd);
+				spin_lock(&sdp->sd_jindex_spin);
+				count++;
+				recovered++;
+			}
+		}
+		spin_unlock(&sdp->sd_jindex_spin);
+	} while (count);
+	if (recovered > 1)
+		fs_err(sdp, "Journals recovered: %d\n", recovered);
+}
+
 int gfs2_recover_journal(struct gfs2_jdesc *jd, bool wait)
 {
+	struct gfs2_sbd *sdp = GFS2_SB(jd->jd_inode);
 	int rv;
 
 	if (test_and_set_bit(JDF_RECOVERY, &jd->jd_flags))
 		return -EBUSY;
 
 	/* we have JDF_RECOVERY, queue should always succeed */
-	rv = queue_work(gfs_recovery_wq, &jd->jd_work);
-	BUG_ON(!rv);
+	rv = queue_work(gfs_recovery_wq, &sdp->sd_recovery_work);
 
 	if (wait)
 		wait_on_bit(&jd->jd_flags, JDF_RECOVERY,

