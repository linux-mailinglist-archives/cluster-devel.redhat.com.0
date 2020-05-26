Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 245131E22AE
	for <lists+cluster-devel@lfdr.de>; Tue, 26 May 2020 15:07:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590498435;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4T+t6xnzEMVtMg7PHTWLjeDvujaHiO5X9RBGunxfmi4=;
	b=K8wfo6xLktbM+f+jxO6su0lmZdAvnoJikm3xaOzYx8qlmGP0PvTK7MgaEBpla5bGxhyijT
	ScBmAlITD6XlY/KbISfkQEXKyOl0OcUcxMj7clNhuEFS2UtDYQlRaX3o1XnZQk9S2bFwff
	zxnd7OI/EW1Dhj3pB7TxbBYjCDLEp50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-mbxQuhFWOLyTrbIe3MbQwQ-1; Tue, 26 May 2020 09:07:13 -0400
X-MC-Unique: mbxQuhFWOLyTrbIe3MbQwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8761EC1DF;
	Tue, 26 May 2020 13:07:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A60868ECE1;
	Tue, 26 May 2020 13:07:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F859180954D;
	Tue, 26 May 2020 13:07:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04QD5fmP010698 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 26 May 2020 09:05:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AB005D9E7; Tue, 26 May 2020 13:05:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 250025D9E5
	for <cluster-devel@redhat.com>; Tue, 26 May 2020 13:05:41 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue, 26 May 2020 08:05:32 -0500
Message-Id: <20200526130536.295081-5-rpeterso@redhat.com>
In-Reply-To: <20200526130536.295081-1-rpeterso@redhat.com>
References: <20200526130536.295081-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 4/8] gfs2: Add new sysfs file for gfs2 status
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds a new file: /sys/fs/gfs2/*/status which will report
the status of the file system. Catting this file dumps the current
status of the file system according to various superblock variables.
For example:

Journal Checked:   1
Journal Live:      1
Withdrawn:         0
No barriers:       0
No recovery:       0
Demote:            0
No Journal ID:     1
RO Recovery:       0
Skip DLM Unlock:   0
Force AIL Flush:   0
FS Frozen:         0
Withdrawing:       0
Withdraw In Prog:  0
Remote Withdraw:   0
Withdraw Recovery: 0
sd_log_lock held:  0
statfs_spin held:  0
sd_rindex_spin:    0
sd_jindex_spin:    0
sd_trunc_lock:     0
sd_bitmap_lock:    0
sd_ordered_lock:   0
sd_ail_lock:       0
sd_log_error:      0
sd_log_flush_lock: 0
sd_log_flush_lock: 1
sd_ail1_list:      281 transactions, 11 ail1, 1 ail2
sd_ail2_list:      0 transactions, 0 ail1, 0 ail2
sd_log_revokes:    0 / 0
sd_log_in_flight:  1

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/sys.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index d28c41bd69b0..ea86ba5e4afb 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -63,6 +63,117 @@ static ssize_t id_show(struct gfs2_sbd *sdp, char *buf)
 			MAJOR(sdp->sd_vfs->s_dev), MINOR(sdp->sd_vfs->s_dev));
 }
 
+static int count_trans_list(struct gfs2_sbd *sdp, struct list_head *head,
+			    int *ail1, int *ail2)
+{
+	struct gfs2_trans *tr;
+	struct gfs2_bufdata *bd;
+	int unlock_spin, trans = 0;
+
+	*ail1 = *ail2 = 0;
+	unlock_spin = spin_trylock(&sdp->sd_ail_lock);
+
+	list_for_each_entry(tr, head, tr_list) {
+		trans++;
+		list_for_each_entry(bd, &tr->tr_ail1_list, bd_ail_st_list)
+			(*ail1)++;
+		list_for_each_entry(bd, &tr->tr_ail2_list, bd_ail_st_list)
+			(*ail2)++;
+	}
+
+	if (unlock_spin)
+		spin_unlock(&sdp->sd_ail_lock);
+
+	return trans;
+}
+
+static int count_list(struct gfs2_sbd *sdp, struct list_head *head)
+{
+	int unlock_spin, count = 0;
+	struct gfs2_bufdata *bd;
+
+	unlock_spin = spin_trylock(&sdp->sd_log_lock);
+
+	list_for_each_entry(bd, head, bd_list)
+		count++;
+	if (unlock_spin)
+		spin_unlock(&sdp->sd_log_lock);
+
+	return count;
+}
+
+static ssize_t status_show(struct gfs2_sbd *sdp, char *buf)
+{
+	unsigned long f = sdp->sd_flags;
+	int trans1, ail11, ail12, trans2, ail21, ail22;
+	unsigned int revokes;
+	ssize_t s;
+
+	trans1 = count_trans_list(sdp, &sdp->sd_ail1_list, &ail11, &ail12);
+	trans2 = count_trans_list(sdp, &sdp->sd_ail2_list, &ail21, &ail22);
+	revokes = count_list(sdp, &sdp->sd_log_revokes);
+	s= snprintf(buf, PAGE_SIZE,
+		    "Journal Checked:   %d\n"
+		    "Journal Live:      %d\n"
+		    "Withdrawn:         %d\n"
+		    "No barriers:       %d\n"
+		    "No recovery:       %d\n"
+		    "Demote:            %d\n"
+		    "No Journal ID:     %d\n"
+		    "RO Recovery:       %d\n"
+		    "Skip DLM Unlock:   %d\n"
+		    "Force AIL Flush:   %d\n"
+		    "FS Frozen:         %d\n"
+		    "Withdrawing:       %d\n"
+		    "Withdraw In Prog:  %d\n"
+		    "Remote Withdraw:   %d\n"
+		    "Withdraw Recovery: %d\n"
+		    "sd_log_lock held:  %d\n"
+		    "statfs_spin held:  %d\n"
+		    "sd_rindex_spin:    %d\n"
+		    "sd_jindex_spin:    %d\n"
+		    "sd_trunc_lock:     %d\n"
+		    "sd_bitmap_lock:    %d\n"
+		    "sd_ordered_lock:   %d\n"
+		    "sd_ail_lock:       %d\n"
+		    "sd_log_error:      %d\n"
+		    "sd_log_flush_lock: %d\n"
+		    "sd_ail1_list:      %d transactions, %d ail1, %d ail2\n"
+		    "sd_ail2_list:      %d transactions, %d ail1, %d ail2\n"
+		    "sd_log_revokes:    %d / %u\n"
+		    "sd_log_in_flight:  %d\n",
+		    test_bit(SDF_JOURNAL_CHECKED, &f),
+		    test_bit(SDF_JOURNAL_LIVE, &f),
+		    test_bit(SDF_WITHDRAWN, &f),
+		    test_bit(SDF_NOBARRIERS, &f),
+		    test_bit(SDF_NORECOVERY, &f),
+		    test_bit(SDF_DEMOTE, &f),
+		    test_bit(SDF_NOJOURNALID, &f),
+		    test_bit(SDF_RORECOVERY, &f),
+		    test_bit(SDF_SKIP_DLM_UNLOCK, &f),
+		    test_bit(SDF_FORCE_AIL_FLUSH, &f),
+		    test_bit(SDF_FS_FROZEN, &f),
+		    test_bit(SDF_WITHDRAWING, &f),
+		    test_bit(SDF_WITHDRAW_IN_PROG, &f),
+		    test_bit(SDF_REMOTE_WITHDRAW, &f),
+		    test_bit(SDF_WITHDRAW_RECOVERY, &f),
+		    spin_is_locked(&sdp->sd_log_lock),
+		    spin_is_locked(&sdp->sd_statfs_spin),
+		    spin_is_locked(&sdp->sd_rindex_spin),
+		    spin_is_locked(&sdp->sd_jindex_spin),
+		    spin_is_locked(&sdp->sd_trunc_lock),
+		    spin_is_locked(&sdp->sd_bitmap_lock),
+		    spin_is_locked(&sdp->sd_ordered_lock),
+		    spin_is_locked(&sdp->sd_ail_lock),
+		    sdp->sd_log_error,
+		    rwsem_is_locked(&sdp->sd_log_flush_lock),
+		    trans1, ail11, ail12,
+		    trans2, ail21, ail22,
+		    revokes, sdp->sd_log_num_revoke,
+		    atomic_read(&sdp->sd_log_in_flight));
+	return s;
+}
+
 static ssize_t fsname_show(struct gfs2_sbd *sdp, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%s\n", sdp->sd_fsname);
@@ -283,6 +394,7 @@ GFS2_ATTR(quota_sync,          0200, NULL,          quota_sync_store);
 GFS2_ATTR(quota_refresh_user,  0200, NULL,          quota_refresh_user_store);
 GFS2_ATTR(quota_refresh_group, 0200, NULL,          quota_refresh_group_store);
 GFS2_ATTR(demote_rq,           0200, NULL,	    demote_rq_store);
+GFS2_ATTR(status,              0444, status_show,   NULL);
 
 static struct attribute *gfs2_attrs[] = {
 	&gfs2_attr_id.attr,
@@ -295,6 +407,7 @@ static struct attribute *gfs2_attrs[] = {
 	&gfs2_attr_quota_refresh_user.attr,
 	&gfs2_attr_quota_refresh_group.attr,
 	&gfs2_attr_demote_rq.attr,
+	&gfs2_attr_status.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(gfs2);
-- 
2.26.2

