Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 69D5B20B6F3
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Jun 2020 19:27:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593192436;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iWYuP09XL9VKlZ0yFTQH9Gd93urAoYAH5xWp/K1DFHA=;
	b=gLq80YsvhZmem4BgOx8zF4H8VE9aVHgdvQ/aYwCbQH2PxAqB3R0qqJiHAX0tWJ44gCbupX
	WRmCopxWStwQVU6XGTvMHcoGD/VLG5WYLZsaHZCEtBr7vLYg29HqjLVFdQRxGPF9/YZAQy
	hSy8KyWIrZSbpCmyF+5g9cDeQsE3Xkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-eHE4EfGdPmigLCYrTz_jBA-1; Fri, 26 Jun 2020 13:27:14 -0400
X-MC-Unique: eHE4EfGdPmigLCYrTz_jBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BFC7804003;
	Fri, 26 Jun 2020 17:27:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CE225D9C5;
	Fri, 26 Jun 2020 17:27:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10941875B4;
	Fri, 26 Jun 2020 17:27:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QHR9xY019166 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 13:27:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D990D8FF97; Fri, 26 Jun 2020 17:27:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-78.rdu2.redhat.com [10.10.115.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D17081C8;
	Fri, 26 Jun 2020 17:27:08 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: davem@davemloft.net
Date: Fri, 26 Jun 2020 13:26:50 -0400
Message-Id: <20200626172650.115224-4-aahringo@redhat.com>
In-Reply-To: <20200626172650.115224-1-aahringo@redhat.com>
References: <20200626172650.115224-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: netdev@vger.kernel.org, cluster-devel@redhat.com, kuba@kernel.org
Subject: [Cluster-devel] [PATCHv2 dlm-next 3/3] fs: dlm: set skb mark per
	peer socket
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
 fs/dlm/lowcomms.c | 16 ++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 6dce6ec58d74f..eac241ed9003e 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -204,6 +204,7 @@ enum {
 	COMM_ATTR_LOCAL,
 	COMM_ATTR_ADDR,
 	COMM_ATTR_ADDR_LIST,
+	COMM_ATTR_MARK,
 };
 
 enum {
@@ -236,6 +237,7 @@ struct dlm_comm {
 	int nodeid;
 	int local;
 	int addr_count;
+	unsigned int mark;
 	struct sockaddr_storage *addr[DLM_MAX_ADDR_COUNT];
 };
 
@@ -473,6 +475,7 @@ static struct config_item *make_comm(struct config_group *g, const char *name)
 	cm->nodeid = -1;
 	cm->local = 0;
 	cm->addr_count = 0;
+	cm->mark = 0;
 	return &cm->item;
 }
 
@@ -668,8 +671,28 @@ static ssize_t comm_addr_list_show(struct config_item *item, char *buf)
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
 
@@ -678,6 +701,7 @@ static struct configfs_attribute *comm_attrs[] = {
 	[COMM_ATTR_LOCAL] = &comm_attr_local,
 	[COMM_ATTR_ADDR] = &comm_attr_addr,
 	[COMM_ATTR_ADDR_LIST] = &comm_attr_addr_list,
+	[COMM_ATTR_MARK] = &comm_attr_mark,
 	NULL,
 };
 
@@ -837,6 +861,20 @@ int dlm_comm_seq(int nodeid, uint32_t *seq)
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
index bc94123ac305a..48b4055fd07ff 100644
--- a/fs/dlm/config.h
+++ b/fs/dlm/config.h
@@ -47,6 +47,7 @@ void dlm_config_exit(void);
 int dlm_config_nodes(char *lsname, struct dlm_config_node **nodes_out,
 		     int *count_out);
 int dlm_comm_seq(int nodeid, uint32_t *seq);
+int dlm_comm_mark(int nodeid, unsigned int *mark);
 int dlm_our_nodeid(void);
 int dlm_our_addr(struct sockaddr_storage *addr, int num);
 
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index eaedad7d069a8..3fa1b93dbbc7e 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -914,6 +914,7 @@ static void sctp_connect_to_sock(struct connection *con)
 	int result;
 	int addr_len;
 	struct socket *sock;
+	unsigned int mark;
 
 	if (con->nodeid == 0) {
 		log_print("attempt to connect sock 0 foiled");
@@ -944,6 +945,13 @@ static void sctp_connect_to_sock(struct connection *con)
 	if (result < 0)
 		goto socket_err;
 
+	/* set skb mark */
+	result = dlm_comm_mark(con->nodeid, &mark);
+	if (result < 0)
+		goto bind_err;
+
+	sock_set_mark(sock->sk, mark);
+
 	con->rx_action = receive_from_sock;
 	con->connect_action = sctp_connect_to_sock;
 	add_sock(sock, con);
@@ -1006,6 +1014,7 @@ static void tcp_connect_to_sock(struct connection *con)
 	struct sockaddr_storage saddr, src_addr;
 	int addr_len;
 	struct socket *sock = NULL;
+	unsigned int mark;
 	int result;
 
 	if (con->nodeid == 0) {
@@ -1027,6 +1036,13 @@ static void tcp_connect_to_sock(struct connection *con)
 	if (result < 0)
 		goto out_err;
 
+	/* set skb mark */
+	result = dlm_comm_mark(con->nodeid, &mark);
+	if (result < 0)
+		goto out_err;
+
+	sock_set_mark(sock->sk, mark);
+
 	memset(&saddr, 0, sizeof(saddr));
 	result = nodeid_to_addr(con->nodeid, &saddr, NULL, false);
 	if (result < 0) {
-- 
2.26.2

