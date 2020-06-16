Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9721FBD4B
	for <lists+cluster-devel@lfdr.de>; Tue, 16 Jun 2020 19:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592329690;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GnpZl3X5L/GBNbX+5vcDPUHR8ZydN9eUezs2OfGNv9Y=;
	b=ChfOZao/ug06dgg1kgitPcKkVE1FJ/EdiOzaHiq3UaK9AsAVyecRuJhmR62ceUblm5vXkv
	jMtT4P7sixohdfMHlJXlr8+6SSD1bfdNf8DPPynNdlD2g9A1kz3DFzjrjiSJl7SvOT1fwj
	s9a79ZTrZMRH6yk+jR1XGHK0q3zNBQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-BUyntI36PH2kGXc-3VPAtw-1; Tue, 16 Jun 2020 13:48:07 -0400
X-MC-Unique: BUyntI36PH2kGXc-3VPAtw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74ACF10059C9;
	Tue, 16 Jun 2020 17:48:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A2579313;
	Tue, 16 Jun 2020 17:48:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 535751809547;
	Tue, 16 Jun 2020 17:48:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GHm1jc015376 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 13:48:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1FF1E5C1C3; Tue, 16 Jun 2020 17:48:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-78.rdu2.redhat.com [10.10.114.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 842B15C1BD;
	Tue, 16 Jun 2020 17:48:00 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Jun 2020 13:47:27 -0400
Message-Id: <20200616174727.34030-3-aahringo@redhat.com>
In-Reply-To: <20200616174727.34030-1-aahringo@redhat.com>
References: <20200616174727.34030-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND dlm-next 2/2] fs: dlm: set skb mark
	per peer socket
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

This patch adds support to set the skb mark value for the DLM tcp and
sctp socket per peer. The mark value will be offered as per comm value
of configfs. At creation time of the peer socket it will be set as
socket option.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c   | 38 ++++++++++++++++++++++++++++++++++++++
 fs/dlm/config.h   |  1 +
 fs/dlm/lowcomms.c | 24 ++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index d74655cd6cd3..47f0b98b707f 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -200,6 +200,7 @@ enum {
 	COMM_ATTR_LOCAL,
 	COMM_ATTR_ADDR,
 	COMM_ATTR_ADDR_LIST,
+	COMM_ATTR_MARK,
 };
 
 enum {
@@ -232,6 +233,7 @@ struct dlm_comm {
 	int nodeid;
 	int local;
 	int addr_count;
+	unsigned int mark;
 	struct sockaddr_storage *addr[DLM_MAX_ADDR_COUNT];
 };
 
@@ -469,6 +471,7 @@ static struct config_item *make_comm(struct config_group *g, const char *name)
 	cm->nodeid = -1;
 	cm->local = 0;
 	cm->addr_count = 0;
+	cm->mark = 0;
 	return &cm->item;
 }
 
@@ -664,8 +667,28 @@ static ssize_t comm_addr_list_show(struct config_item *item, char *buf)
 	return 4096 - allowance;
 }
 
+static ssize_t comm_mark_show(struct config_item *item, char *buf)
+{
+	return sprintf(buf, "%u\n", config_item_to_comm(item)->mark);
+}
+
+static ssize_t comm_mark_store(struct config_item *item, const char *buf,
+			       size_t len)
+{
+	unsigned int mark;
+	int rc;
+
+	rc = kstrtouint(buf, 0, &mark);
+	if (rc)
+		return rc;
+
+	config_item_to_comm(item)->mark = mark;
+	return len;
+}
+
 CONFIGFS_ATTR(comm_, nodeid);
 CONFIGFS_ATTR(comm_, local);
+CONFIGFS_ATTR(comm_, mark);
 CONFIGFS_ATTR_WO(comm_, addr);
 CONFIGFS_ATTR_RO(comm_, addr_list);
 
@@ -674,6 +697,7 @@ static struct configfs_attribute *comm_attrs[] = {
 	[COMM_ATTR_LOCAL] = &comm_attr_local,
 	[COMM_ATTR_ADDR] = &comm_attr_addr,
 	[COMM_ATTR_ADDR_LIST] = &comm_attr_addr_list,
+	[COMM_ATTR_MARK] = &comm_attr_mark,
 	NULL,
 };
 
@@ -833,6 +857,20 @@ int dlm_comm_seq(int nodeid, uint32_t *seq)
 	return 0;
 }
 
+int dlm_comm_mark(int nodeid, unsigned int *mark)
+{
+	struct dlm_comm *cm;
+
+	cm = get_comm(nodeid);
+	if (!cm)
+		return -ENOENT;
+
+	*mark = cm->mark;
+	put_comm(cm);
+
+	return 0;
+}
+
 int dlm_our_nodeid(void)
 {
 	return local_comm ? local_comm->nodeid : 0;
diff --git a/fs/dlm/config.h b/fs/dlm/config.h
index 13508ec3ff5e..f62996cad561 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -46,6 +46,7 @@ void dlm_config_exit(void);
 int dlm_config_nodes(char *lsname, struct dlm_config_node **nodes_out,
 		     int *count_out);
 int dlm_comm_seq(int nodeid, uint32_t *seq);
+int dlm_comm_mark(int nodeid, unsigned int *mark);
 int dlm_our_nodeid(void);
 int dlm_our_addr(struct sockaddr_storage *addr, int num);
 
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 1bc32e728ba4..e00caad63be9 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1035,6 +1035,7 @@ static void sctp_connect_to_sock(struct connection *con)
 	int result;
 	int addr_len;
 	struct socket *sock;
+	unsigned int mark;
 	struct __kernel_sock_timeval tv = { .tv_sec = 5, .tv_usec = 0 };
 
 	if (con->nodeid == 0) {
@@ -1066,6 +1067,17 @@ static void sctp_connect_to_sock(struct connection *con)
 	if (result < 0)
 		goto socket_err;
 
+	/* set skb mark */
+	result = dlm_comm_mark(con->nodeid, &mark);
+	if (result < 0)
+		goto bind_err;
+
+	result = kernel_setsockopt(sock, SOL_SOCKET, SO_MARK,
+				   (char *)&mark, sizeof(mark));
+	if (result < 0)
+		log_print("Failed to set SO_MARK value to %u",
+			  dlm_config.ci_mark);
+
 	con->rx_action = receive_from_sock;
 	con->connect_action = sctp_connect_to_sock;
 	add_sock(sock, con);
@@ -1132,6 +1144,7 @@ static void tcp_connect_to_sock(struct connection *con)
 	struct sockaddr_storage saddr, src_addr;
 	int addr_len;
 	struct socket *sock = NULL;
+	unsigned int mark;
 	int one = 1;
 	int result;
 
@@ -1154,6 +1167,17 @@ static void tcp_connect_to_sock(struct connection *con)
 	if (result < 0)
 		goto out_err;
 
+	/* set skb mark */
+	result = dlm_comm_mark(con->nodeid, &mark);
+	if (result < 0)
+		goto out_err;
+
+	result = kernel_setsockopt(sock, SOL_SOCKET, SO_MARK,
+				   (char *)&mark, sizeof(mark));
+	if (result < 0)
+		log_print("Failed to set SO_MARK value to %u",
+			  dlm_config.ci_mark);
+
 	memset(&saddr, 0, sizeof(saddr));
 	result = nodeid_to_addr(con->nodeid, &saddr, NULL, false);
 	if (result < 0) {
-- 
2.26.2

