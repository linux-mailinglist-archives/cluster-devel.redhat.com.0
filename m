Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4231F03E6
	for <lists+cluster-devel@lfdr.de>; Sat,  6 Jun 2020 02:24:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591403049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=njMILhG3vsSTfU8KS9iMQkwcxYq+KfHgglAW/r2uVkU=;
	b=E23AvJPMxQNSRdCRjVLhFj+xGN1jfeFjNJy/b2ocrPkrMBrG5Zx1eP9Hl1Rkw0w2XBFtPJ
	sHCW9JBLtNJmbqcuY64gczedqC5z6Ukb8fFoPjpOPdgi+7JKva7wUxNOeFVow8aNNvYh/n
	S42Fr/nzw0K2RIRaVocGigBHbWyDfmg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-8kJN9iY1M2KuTN8qkWbHiw-1; Fri, 05 Jun 2020 20:24:06 -0400
X-MC-Unique: 8kJN9iY1M2KuTN8qkWbHiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89999107ACF7;
	Sat,  6 Jun 2020 00:24:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D77178FDE;
	Sat,  6 Jun 2020 00:24:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 496B58A8CA;
	Sat,  6 Jun 2020 00:24:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 055Gl5Nc020662 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 12:47:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1997D7B610; Fri,  5 Jun 2020 16:47:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-115-80.phx2.redhat.com [10.3.115.80])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D765F7B60D
	for <cluster-devel@redhat.com>; Fri,  5 Jun 2020 16:47:04 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  5 Jun 2020 11:46:56 -0500
Message-Id: <20200605164701.30776-2-rpeterso@redhat.com>
In-Reply-To: <20200605164701.30776-1-rpeterso@redhat.com>
References: <20200605164701.30776-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/6] gfs2: Add new sysfs file for gfs2
	status
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
sd_log_in_flight:  1

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/sys.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/fs/gfs2/sys.c b/fs/gfs2/sys.c
index d28c41bd69b0..572353f0b41f 100644
--- a/fs/gfs2/sys.c
+++ b/fs/gfs2/sys.c
@@ -63,6 +63,69 @@ static ssize_t id_show(struct gfs2_sbd *sdp, char *buf)
 			MAJOR(sdp->sd_vfs->s_dev), MINOR(sdp->sd_vfs->s_dev));
 }
 
+static ssize_t status_show(struct gfs2_sbd *sdp, char *buf)
+{
+	unsigned long f = sdp->sd_flags;
+	ssize_t s;
+
+	s = snprintf(buf, PAGE_SIZE,
+		     "Journal Checked:   %d\n"
+		     "Journal Live:      %d\n"
+		     "Withdrawn:         %d\n"
+		     "No barriers:       %d\n"
+		     "No recovery:       %d\n"
+		     "Demote:            %d\n"
+		     "No Journal ID:     %d\n"
+		     "RO Recovery:       %d\n"
+		     "Skip DLM Unlock:   %d\n"
+		     "Force AIL Flush:   %d\n"
+		     "FS Frozen:         %d\n"
+		     "Withdrawing:       %d\n"
+		     "Withdraw In Prog:  %d\n"
+		     "Remote Withdraw:   %d\n"
+		     "Withdraw Recovery: %d\n"
+		     "sd_log_lock held:  %d\n"
+		     "statfs_spin held:  %d\n"
+		     "sd_rindex_spin:    %d\n"
+		     "sd_jindex_spin:    %d\n"
+		     "sd_trunc_lock:     %d\n"
+		     "sd_bitmap_lock:    %d\n"
+		     "sd_ordered_lock:   %d\n"
+		     "sd_ail_lock:       %d\n"
+		     "sd_log_error:      %d\n"
+		     "sd_log_flush_lock: %d\n"
+		     "sd_log_num_revoke: %u\n"
+		     "sd_log_in_flight:  %d\n",
+		     test_bit(SDF_JOURNAL_CHECKED, &f),
+		     test_bit(SDF_JOURNAL_LIVE, &f),
+		     test_bit(SDF_WITHDRAWN, &f),
+		     test_bit(SDF_NOBARRIERS, &f),
+		     test_bit(SDF_NORECOVERY, &f),
+		     test_bit(SDF_DEMOTE, &f),
+		     test_bit(SDF_NOJOURNALID, &f),
+		     test_bit(SDF_RORECOVERY, &f),
+		     test_bit(SDF_SKIP_DLM_UNLOCK, &f),
+		     test_bit(SDF_FORCE_AIL_FLUSH, &f),
+		     test_bit(SDF_FS_FROZEN, &f),
+		     test_bit(SDF_WITHDRAWING, &f),
+		     test_bit(SDF_WITHDRAW_IN_PROG, &f),
+		     test_bit(SDF_REMOTE_WITHDRAW, &f),
+		     test_bit(SDF_WITHDRAW_RECOVERY, &f),
+		     spin_is_locked(&sdp->sd_log_lock),
+		     spin_is_locked(&sdp->sd_statfs_spin),
+		     spin_is_locked(&sdp->sd_rindex_spin),
+		     spin_is_locked(&sdp->sd_jindex_spin),
+		     spin_is_locked(&sdp->sd_trunc_lock),
+		     spin_is_locked(&sdp->sd_bitmap_lock),
+		     spin_is_locked(&sdp->sd_ordered_lock),
+		     spin_is_locked(&sdp->sd_ail_lock),
+		     sdp->sd_log_error,
+		     rwsem_is_locked(&sdp->sd_log_flush_lock),
+		     sdp->sd_log_num_revoke,
+		     atomic_read(&sdp->sd_log_in_flight));
+	return s;
+}
+
 static ssize_t fsname_show(struct gfs2_sbd *sdp, char *buf)
 {
 	return snprintf(buf, PAGE_SIZE, "%s\n", sdp->sd_fsname);
@@ -283,6 +346,7 @@ GFS2_ATTR(quota_sync,          0200, NULL,          quota_sync_store);
 GFS2_ATTR(quota_refresh_user,  0200, NULL,          quota_refresh_user_store);
 GFS2_ATTR(quota_refresh_group, 0200, NULL,          quota_refresh_group_store);
 GFS2_ATTR(demote_rq,           0200, NULL,	    demote_rq_store);
+GFS2_ATTR(status,              0444, status_show,   NULL);
 
 static struct attribute *gfs2_attrs[] = {
 	&gfs2_attr_id.attr,
@@ -295,6 +359,7 @@ static struct attribute *gfs2_attrs[] = {
 	&gfs2_attr_quota_refresh_user.attr,
 	&gfs2_attr_quota_refresh_group.attr,
 	&gfs2_attr_demote_rq.attr,
+	&gfs2_attr_status.attr,
 	NULL,
 };
 ATTRIBUTE_GROUPS(gfs2);
-- 
2.26.2

