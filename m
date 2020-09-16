Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 23C7726BE67
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Sep 2020 09:44:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-i0Xm8VNvPP-kL4okg5ZWpA-1; Wed, 16 Sep 2020 03:44:30 -0400
X-MC-Unique: i0Xm8VNvPP-kL4okg5ZWpA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3613680F043;
	Wed, 16 Sep 2020 07:44:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 236B01002D4E;
	Wed, 16 Sep 2020 07:44:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 19DE5183D02C;
	Wed, 16 Sep 2020 07:44:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08G2i7jf027318 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 22:44:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 565D8F00E4; Wed, 16 Sep 2020 02:44:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51926F00E9
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 02:44:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C7BB185A78B
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 02:44:04 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-139-scnIncl-Nty_HZzqHJgN_Q-1; Tue, 15 Sep 2020 22:44:00 -0400
X-MC-Unique: scnIncl-Nty_HZzqHJgN_Q-1
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 4F66E912A19B44A2A8FB;
	Wed, 16 Sep 2020 10:27:52 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
	10:27:43 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Christine Caulfield <ccaulfie@redhat.com>, David Teigland
	<teigland@redhat.com>
Date: Wed, 16 Sep 2020 10:50:19 +0800
Message-ID: <20200916025019.3992471-1-liushixin2@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08G2i7jf027318
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 16 Sep 2020 03:44:24 -0400
Cc: cluster-devel@redhat.com, Liu Shixin <liushixin2@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH -next] dlm: convert to use
	DEFINE_SEQ_ATTRIBUTE macro
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Use DEFINE_SEQ_ATTRIBUTE macro to simplify the code.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 fs/dlm/debug_fs.c | 104 ++++------------------------------------------
 1 file changed, 8 insertions(+), 96 deletions(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index d6bbccb0ed15..c4d1860b9e41 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -571,126 +571,38 @@ static void table_seq_stop(struct seq_file *seq, void *iter_ptr)
 	}
 }
 
-static const struct seq_operations format1_seq_ops = {
+static const struct seq_operations format1_sops = {
 	.start = table_seq_start,
 	.next  = table_seq_next,
 	.stop  = table_seq_stop,
 	.show  = table_seq_show,
 };
 
-static const struct seq_operations format2_seq_ops = {
+static const struct seq_operations format2_sops = {
 	.start = table_seq_start,
 	.next  = table_seq_next,
 	.stop  = table_seq_stop,
 	.show  = table_seq_show,
 };
 
-static const struct seq_operations format3_seq_ops = {
+static const struct seq_operations format3_sops = {
 	.start = table_seq_start,
 	.next  = table_seq_next,
 	.stop  = table_seq_stop,
 	.show  = table_seq_show,
 };
 
-static const struct seq_operations format4_seq_ops = {
+static const struct seq_operations format4_sops = {
 	.start = table_seq_start,
 	.next  = table_seq_next,
 	.stop  = table_seq_stop,
 	.show  = table_seq_show,
 };
 
-static const struct file_operations format1_fops;
-static const struct file_operations format2_fops;
-static const struct file_operations format3_fops;
-static const struct file_operations format4_fops;
-
-static int table_open1(struct inode *inode, struct file *file)
-{
-	struct seq_file *seq;
-	int ret;
-
-	ret = seq_open(file, &format1_seq_ops);
-	if (ret)
-		return ret;
-
-	seq = file->private_data;
-	seq->private = inode->i_private; /* the dlm_ls */
-	return 0;
-}
-
-static int table_open2(struct inode *inode, struct file *file)
-{
-	struct seq_file *seq;
-	int ret;
-
-	ret = seq_open(file, &format2_seq_ops);
-	if (ret)
-		return ret;
-
-	seq = file->private_data;
-	seq->private = inode->i_private; /* the dlm_ls */
-	return 0;
-}
-
-static int table_open3(struct inode *inode, struct file *file)
-{
-	struct seq_file *seq;
-	int ret;
-
-	ret = seq_open(file, &format3_seq_ops);
-	if (ret)
-		return ret;
-
-	seq = file->private_data;
-	seq->private = inode->i_private; /* the dlm_ls */
-	return 0;
-}
-
-static int table_open4(struct inode *inode, struct file *file)
-{
-	struct seq_file *seq;
-	int ret;
-
-	ret = seq_open(file, &format4_seq_ops);
-	if (ret)
-		return ret;
-
-	seq = file->private_data;
-	seq->private = inode->i_private; /* the dlm_ls */
-	return 0;
-}
-
-static const struct file_operations format1_fops = {
-	.owner   = THIS_MODULE,
-	.open    = table_open1,
-	.read    = seq_read,
-	.llseek  = seq_lseek,
-	.release = seq_release
-};
-
-static const struct file_operations format2_fops = {
-	.owner   = THIS_MODULE,
-	.open    = table_open2,
-	.read    = seq_read,
-	.llseek  = seq_lseek,
-	.release = seq_release
-};
-
-static const struct file_operations format3_fops = {
-	.owner   = THIS_MODULE,
-	.open    = table_open3,
-	.read    = seq_read,
-	.llseek  = seq_lseek,
-	.release = seq_release
-};
-
-static const struct file_operations format4_fops = {
-	.owner   = THIS_MODULE,
-	.open    = table_open4,
-	.read    = seq_read,
-	.llseek  = seq_lseek,
-	.release = seq_release
-};
+DEFINE_SEQ_ATTRIBUTE(format1);
+DEFINE_SEQ_ATTRIBUTE(format2);
+DEFINE_SEQ_ATTRIBUTE(format3);
+DEFINE_SEQ_ATTRIBUTE(format4);
 
 /*
  * dump lkb's on the ls_waiters list
-- 
2.25.1


