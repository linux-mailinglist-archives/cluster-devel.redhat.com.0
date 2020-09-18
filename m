Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B279226FFCC
	for <lists+cluster-devel@lfdr.de>; Fri, 18 Sep 2020 16:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600439279;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iLW9k/RJkj+DDgO6NHsRITgx0IQ8sQN7mbIk6cEgNqY=;
	b=fxhzhgqx2fSKhnucPkT0gsWYxNMaCEog0k18Whz+D6LNxVVPfnASi2oBVl4IdidHdP7Jno
	s0G9fCOd/x7tTDlNqkME3n55unpdCKQnO2gSdC5oubPBN06tScOnt+VcqJRpnklXCNq8m4
	cGP6WN6589wjdlnGW+otAJp4QsCxsPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-fE_AJs2OO4eVtLal7Z2pFw-1; Fri, 18 Sep 2020 10:27:58 -0400
X-MC-Unique: fE_AJs2OO4eVtLal7Z2pFw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6384980ED9A;
	Fri, 18 Sep 2020 14:27:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50C985D9E4;
	Fri, 18 Sep 2020 14:27:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03C7B8C7C9;
	Fri, 18 Sep 2020 14:27:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08IERlAR002405 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 10:27:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 069DF5576F; Fri, 18 Sep 2020 14:27:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-112-228.rdu2.redhat.com [10.10.112.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E86C55762;
	Fri, 18 Sep 2020 14:27:46 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 18 Sep 2020 10:27:24 -0400
Message-Id: <20200918142728.147392-3-aahringo@redhat.com>
In-Reply-To: <20200918142728.147392-1-aahringo@redhat.com>
References: <20200918142728.147392-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 2/6] fs: dlm: handle range check as
	callback
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds a callback to CLUSTER_ATTR macro to allow individual
callbacks for attributes which might have a more complex attribute range
checking just than non zero.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index f33a7e4ae917b..2b30104a34cef 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -125,7 +125,7 @@ static ssize_t cluster_cluster_name_store(struct config_item *item,
 CONFIGFS_ATTR(cluster_, cluster_name);
 
 static ssize_t cluster_set(struct dlm_cluster *cl, unsigned int *cl_field,
-			   int *info_field, int check_zero,
+			   int *info_field, bool (*check_cb)(unsigned int x),
 			   const char *buf, size_t len)
 {
 	unsigned int x;
@@ -137,7 +137,7 @@ static ssize_t cluster_set(struct dlm_cluster *cl, unsigned int *cl_field,
 	if (rc)
 		return rc;
 
-	if (check_zero && !x)
+	if (check_cb && check_cb(x))
 		return -EINVAL;
 
 	*cl_field = x;
@@ -146,13 +146,13 @@ static ssize_t cluster_set(struct dlm_cluster *cl, unsigned int *cl_field,
 	return len;
 }
 
-#define CLUSTER_ATTR(name, check_zero)                                        \
+#define CLUSTER_ATTR(name, check_cb)                                          \
 static ssize_t cluster_##name##_store(struct config_item *item, \
 		const char *buf, size_t len) \
 {                                                                             \
 	struct dlm_cluster *cl = config_item_to_cluster(item);		      \
 	return cluster_set(cl, &cl->cl_##name, &dlm_config.ci_##name,         \
-			   check_zero, buf, len);                             \
+			   check_cb, buf, len);                               \
 }                                                                             \
 static ssize_t cluster_##name##_show(struct config_item *item, char *buf)     \
 {                                                                             \
@@ -161,20 +161,25 @@ static ssize_t cluster_##name##_show(struct config_item *item, char *buf)     \
 }                                                                             \
 CONFIGFS_ATTR(cluster_, name);
 
-CLUSTER_ATTR(tcp_port, 1);
-CLUSTER_ATTR(buffer_size, 1);
-CLUSTER_ATTR(rsbtbl_size, 1);
-CLUSTER_ATTR(recover_timer, 1);
-CLUSTER_ATTR(toss_secs, 1);
-CLUSTER_ATTR(scan_secs, 1);
-CLUSTER_ATTR(log_debug, 0);
-CLUSTER_ATTR(log_info, 0);
-CLUSTER_ATTR(protocol, 0);
-CLUSTER_ATTR(mark, 0);
-CLUSTER_ATTR(timewarn_cs, 1);
-CLUSTER_ATTR(waitwarn_us, 0);
-CLUSTER_ATTR(new_rsb_count, 0);
-CLUSTER_ATTR(recover_callbacks, 0);
+static bool dlm_check_zero(unsigned int x)
+{
+	return !x;
+}
+
+CLUSTER_ATTR(tcp_port, dlm_check_zero);
+CLUSTER_ATTR(buffer_size, dlm_check_zero);
+CLUSTER_ATTR(rsbtbl_size, dlm_check_zero);
+CLUSTER_ATTR(recover_timer, dlm_check_zero);
+CLUSTER_ATTR(toss_secs, dlm_check_zero);
+CLUSTER_ATTR(scan_secs, dlm_check_zero);
+CLUSTER_ATTR(log_debug, NULL);
+CLUSTER_ATTR(log_info, NULL);
+CLUSTER_ATTR(protocol, NULL);
+CLUSTER_ATTR(mark, NULL);
+CLUSTER_ATTR(timewarn_cs, dlm_check_zero);
+CLUSTER_ATTR(waitwarn_us, NULL);
+CLUSTER_ATTR(new_rsb_count, NULL);
+CLUSTER_ATTR(recover_callbacks, NULL);
 
 static struct configfs_attribute *cluster_attrs[] = {
 	[CLUSTER_ATTR_TCP_PORT] = &cluster_attr_tcp_port,
-- 
2.26.2

