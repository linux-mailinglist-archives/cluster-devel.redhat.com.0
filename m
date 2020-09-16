Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2CD26BE68
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Sep 2020 09:44:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-G24qsANINPyWWdjkqwJp-w-1; Wed, 16 Sep 2020 03:44:31 -0400
X-MC-Unique: G24qsANINPyWWdjkqwJp-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F70D80F044;
	Wed, 16 Sep 2020 07:44:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 231EA1002D46;
	Wed, 16 Sep 2020 07:44:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B913B183D029;
	Wed, 16 Sep 2020 07:44:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08G2i1K8027297 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 22:44:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3835E2166BA2; Wed, 16 Sep 2020 02:44:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3367F2166BA3
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 02:43:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADC09801213
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 02:43:58 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-316-SF5I2L02MwOWN9MPu7F39A-1; Tue, 15 Sep 2020 22:43:54 -0400
X-MC-Unique: SF5I2L02MwOWN9MPu7F39A-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id C48CB9466F007020C82C;
	Wed, 16 Sep 2020 10:27:52 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Wed, 16 Sep 2020
	10:27:45 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Bob Peterson <rpeterso@redhat.com>, Andreas Gruenbacher
	<agruenba@redhat.com>
Date: Wed, 16 Sep 2020 10:50:21 +0800
Message-ID: <20200916025021.3992575-1-liushixin2@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08G2i1K8027297
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 16 Sep 2020 03:44:24 -0400
Cc: cluster-devel@redhat.com, Liu Shixin <liushixin2@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH -next] gfs2: convert to use
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
 fs/gfs2/glock.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index f13b136654ca..15c5c26f6ae7 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -2415,7 +2415,7 @@ static const struct seq_operations gfs2_glstats_seq_ops = {
 	.show  = gfs2_glstats_seq_show,
 };
 
-static const struct seq_operations gfs2_sbstats_seq_ops = {
+static const struct seq_operations gfs2_sbstats_sops = {
 	.start = gfs2_sbstats_seq_start,
 	.next  = gfs2_sbstats_seq_next,
 	.stop  = gfs2_sbstats_seq_stop,
@@ -2468,16 +2468,6 @@ static int gfs2_glstats_open(struct inode *inode, struct file *file)
 	return __gfs2_glocks_open(inode, file, &gfs2_glstats_seq_ops);
 }
 
-static int gfs2_sbstats_open(struct inode *inode, struct file *file)
-{
-	int ret = seq_open(file, &gfs2_sbstats_seq_ops);
-	if (ret == 0) {
-		struct seq_file *seq = file->private_data;
-		seq->private = inode->i_private;  /* sdp */
-	}
-	return ret;
-}
-
 static const struct file_operations gfs2_glocks_fops = {
 	.owner   = THIS_MODULE,
 	.open    = gfs2_glocks_open,
@@ -2494,13 +2484,7 @@ static const struct file_operations gfs2_glstats_fops = {
 	.release = gfs2_glocks_release,
 };
 
-static const struct file_operations gfs2_sbstats_fops = {
-	.owner   = THIS_MODULE,
-	.open	 = gfs2_sbstats_open,
-	.read    = seq_read,
-	.llseek  = seq_lseek,
-	.release = seq_release,
-};
+DEFINE_SEQ_ATTRIBUTE(gfs2_sbstats);
 
 void gfs2_create_debugfs_file(struct gfs2_sbd *sdp)
 {
-- 
2.25.1


