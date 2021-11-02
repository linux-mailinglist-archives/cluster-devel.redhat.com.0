Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F24044365D
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 20:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635880689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ky7L7v7oaJZ+52khu+S+7tPs2Vq3IUiPoPvUsdwO1Lg=;
	b=M0RIZXQ/xRsaMs1pYjv1ZNJCOTKEDx3xAexvA5bcixZLhZdTK34qhyBQAZidZn5D1aYnK1
	F7dNJWWGLoJR3n5DHWXIJUz+rORTE2Af/87BNoIGnaRuUkzP91BA9QY1AADAS2FH0xHR/s
	SGzIofWy6xmpOGfHMMv6csUzVFYMq5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-KM3KkOILPV61LFBV8aNe-g-1; Tue, 02 Nov 2021 15:18:05 -0400
X-MC-Unique: KM3KkOILPV61LFBV8aNe-g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FC0DFC23;
	Tue,  2 Nov 2021 19:18:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 100A619C59;
	Tue,  2 Nov 2021 19:18:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDCE0181A1D0;
	Tue,  2 Nov 2021 19:18:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2JHxnM020797 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 15:17:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 94DCE2B060; Tue,  2 Nov 2021 19:17:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 46A1A652AC;
	Tue,  2 Nov 2021 19:17:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Nov 2021 15:17:20 -0400
Message-Id: <20211102191724.210095-15-aahringo@redhat.com>
In-Reply-To: <20211102191724.210095-1-aahringo@redhat.com>
References: <20211102191724.210095-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND v5.15-rc7 14/18] fs: dlm: add debugfs
	rawmsg send functionality
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds a dlm functionality to send a raw dlm message to a
specific cluster node. This raw message can be build by user space and
send out by writing the message to "rawmsg" dlm debugfs file.

There is a in progress scapy dlm module which provides a easy build of
DLM messages in user space. For example:

DLM(h_cmd=3, o_nextcmd=1, h_nodeid=1, h_lockspace=0xe4f48a18, ...)

The goal is to provide an easy reproducable state to crash DLM or to
fuzz the DLM kernel stack if there are possible ways to crash it.

Note: that if the sequence number is zero and dlm version is not set to
3.1 the kernel will automatic will set a right sequence number, otherwise
DLM stack testing is not possible.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c | 37 ++++++++++++++++++++++++++++++++++++
 fs/dlm/midcomms.c | 48 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/dlm/midcomms.h |  2 ++
 3 files changed, 87 insertions(+)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 47e9d57e4cae..555904eeea8e 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -768,6 +768,42 @@ static int dlm_version_show(struct seq_file *file, void *offset)
 }
 DEFINE_SHOW_ATTRIBUTE(dlm_version);
 
+static ssize_t dlm_rawmsg_write(struct file *fp, const char __user *user_buf,
+				size_t count, loff_t *ppos)
+{
+	void *buf;
+	int ret;
+
+	if (count > PAGE_SIZE || count < sizeof(struct dlm_header))
+		return -EINVAL;
+
+	buf = kmalloc(PAGE_SIZE, GFP_NOFS);
+	if (!buf)
+		return -ENOMEM;
+
+	if (copy_from_user(buf, user_buf, count)) {
+		ret = -EFAULT;
+		goto out;
+	}
+
+	ret = dlm_midcomms_rawmsg_send(fp->private_data, buf, count);
+	if (ret)
+		goto out;
+
+	kfree(buf);
+	return count;
+
+out:
+	kfree(buf);
+	return ret;
+}
+
+static const struct file_operations dlm_rawmsg_fops = {
+	.open	= simple_open,
+	.write	= dlm_rawmsg_write,
+	.llseek	= no_llseek,
+};
+
 void *dlm_create_debug_comms_file(int nodeid, void *data)
 {
 	struct dentry *d_node;
@@ -782,6 +818,7 @@ void *dlm_create_debug_comms_file(int nodeid, void *data)
 	debugfs_create_file("send_queue_count", 0444, d_node, data,
 			    &dlm_send_queue_cnt_fops);
 	debugfs_create_file("version", 0444, d_node, data, &dlm_version_fops);
+	debugfs_create_file("rawmsg", 0200, d_node, data, &dlm_rawmsg_fops);
 
 	return d_node;
 }
diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 95a5643a950e..0b9bce6f04e1 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1427,3 +1427,51 @@ int dlm_midcomms_close(int nodeid)
 
 	return ret;
 }
+
+/* debug functionality to send raw dlm msg from user space */
+struct dlm_rawmsg_data {
+	struct midcomms_node *node;
+	void *buf;
+};
+
+static void midcomms_new_rawmsg_cb(void *data)
+{
+	struct dlm_rawmsg_data *rd = data;
+	struct dlm_header *h = rd->buf;
+
+	switch (h->h_version) {
+	case cpu_to_le32(DLM_VERSION_3_1):
+		break;
+	default:
+		switch (h->h_cmd) {
+		case DLM_OPTS:
+			if (!h->u.h_seq)
+				h->u.h_seq = rd->node->seq_send++;
+			break;
+		default:
+			break;
+		}
+		break;
+	}
+}
+
+int dlm_midcomms_rawmsg_send(struct midcomms_node *node, void *buf,
+			     int buflen)
+{
+	struct dlm_rawmsg_data rd;
+	struct dlm_msg *msg;
+	char *msgbuf;
+
+	rd.node = node;
+	rd.buf = buf;
+
+	msg = dlm_lowcomms_new_msg(node->nodeid, buflen, GFP_NOFS,
+				   &msgbuf, midcomms_new_rawmsg_cb, &rd);
+	if (!msg)
+		return -ENOMEM;
+
+	memcpy(msgbuf, buf, buflen);
+	dlm_lowcomms_commit_msg(msg);
+	return 0;
+}
+
diff --git a/fs/dlm/midcomms.h b/fs/dlm/midcomms.h
index 579abc6929be..bc63cf73aa87 100644
--- a/fs/dlm/midcomms.h
+++ b/fs/dlm/midcomms.h
@@ -28,6 +28,8 @@ const char *dlm_midcomms_state(struct midcomms_node *node);
 unsigned long dlm_midcomms_flags(struct midcomms_node *node);
 int dlm_midcomms_send_queue_cnt(struct midcomms_node *node);
 uint32_t dlm_midcomms_version(struct midcomms_node *node);
+int dlm_midcomms_rawmsg_send(struct midcomms_node *node, void *buf,
+			     int buflen);
 
 #endif				/* __MIDCOMMS_DOT_H__ */
 
-- 
2.27.0

