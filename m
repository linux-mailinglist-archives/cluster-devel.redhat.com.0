Return-Path: <cluster-devel-bounces@listman.redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id 9D18231D31A
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Feb 2021 01:01:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613520113;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GD8uzTnfv469Mvsun1T8TLC09MQCxwc2YiafuczQYMw=;
	b=aePyiknN3gNCihkGcEN/rN1IA5SU3My7/Ai3bqEZbJG8ach7PHbogz9oaYVy/uUFAcF4Qp
	Wipgjf3W1JJVWP6bkz8p5kZxcbiV/CXvJe7BlcV2YM6f9PSMIAdYeN+yTpXeTnYNoRp4u4
	fNk5ue0+Om4/7nLBFa8LDFRIOT08rcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-eeEQGAhaOHCHCmyf2C3O4g-1; Tue, 16 Feb 2021 19:01:49 -0500
X-MC-Unique: eeEQGAhaOHCHCmyf2C3O4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52857106BB24;
	Wed, 17 Feb 2021 00:01:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 407E75C661;
	Wed, 17 Feb 2021 00:01:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E12218095CB;
	Wed, 17 Feb 2021 00:01:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11H00uQh031292 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 19:00:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7993A5C661; Wed, 17 Feb 2021 00:00:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-173.rdu2.redhat.com [10.10.115.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EBF3D5C5B5;
	Wed, 17 Feb 2021 00:00:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Feb 2021 19:00:39 -0500
Message-Id: <20210217000046.349203-6-aahringo@redhat.com>
In-Reply-To: <20210217000046.349203-1-aahringo@redhat.com>
References: <20210217000046.349203-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 05/12] fs: dlm: add check if dlm
	is currently running
X-BeenThere: cluster-devel@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@listman.redhat.com>
List-Help: <mailto:cluster-devel-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@listman.redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@listman.redhat.com
Errors-To: cluster-devel-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252

This patch adds checks for dlm config attributes regarding to protocol
parameters as it makes only sense to change them when dlm is not running.
It also adds a check for valid protocol specifiers and return invalid
argument if they are not supported.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c   | 34 ++++++++++++++++++++++++++++++++--
 fs/dlm/lowcomms.c |  2 +-
 fs/dlm/lowcomms.h |  3 +++
 3 files changed, 36 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 73e6643903af..ab26cf135710 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -164,6 +164,36 @@ static ssize_t cluster_##name##_show(struct config_ite=
m *item, char *buf)     \
 }                                                                         =
    \
 CONFIGFS_ATTR(cluster_, name);
=20
+static int dlm_check_protocol_and_dlm_running(unsigned int x)
+{
+=09switch (x) {
+=09case 0:
+=09=09/* TCP */
+=09=09break;
+=09case 1:
+=09=09/* SCTP */
+=09=09break;
+=09default:
+=09=09return -EINVAL;
+=09}
+
+=09if (dlm_allow_conn)
+=09=09return -EBUSY;
+
+=09return 0;
+}
+
+static int dlm_check_zero_and_dlm_running(unsigned int x)
+{
+=09if (!x)
+=09=09return -EINVAL;
+
+=09if (dlm_allow_conn)
+=09=09return -EBUSY;
+
+=09return 0;
+}
+
 static int dlm_check_zero(unsigned int x)
 {
 =09if (!x)
@@ -180,7 +210,7 @@ static int dlm_check_buffer_size(unsigned int x)
 =09return 0;
 }
=20
-CLUSTER_ATTR(tcp_port, dlm_check_zero);
+CLUSTER_ATTR(tcp_port, dlm_check_zero_and_dlm_running);
 CLUSTER_ATTR(buffer_size, dlm_check_buffer_size);
 CLUSTER_ATTR(rsbtbl_size, dlm_check_zero);
 CLUSTER_ATTR(recover_timer, dlm_check_zero);
@@ -188,7 +218,7 @@ CLUSTER_ATTR(toss_secs, dlm_check_zero);
 CLUSTER_ATTR(scan_secs, dlm_check_zero);
 CLUSTER_ATTR(log_debug, NULL);
 CLUSTER_ATTR(log_info, NULL);
-CLUSTER_ATTR(protocol, NULL);
+CLUSTER_ATTR(protocol, dlm_check_protocol_and_dlm_running);
 CLUSTER_ATTR(mark, NULL);
 CLUSTER_ATTR(timewarn_cs, dlm_check_zero);
 CLUSTER_ATTR(waitwarn_us, NULL);
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index d772e1d4461d..d25b9132c593 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -134,7 +134,7 @@ static DEFINE_SPINLOCK(dlm_node_addrs_spin);
 static struct listen_connection listen_con;
 static struct sockaddr_storage *dlm_local_addr[DLM_MAX_ADDR_COUNT];
 static int dlm_local_count;
-static int dlm_allow_conn;
+int dlm_allow_conn;
=20
 /* Work queues */
 static struct workqueue_struct *recv_workqueue;
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index 0918f9376489..f74888ed43b4 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -14,6 +14,9 @@
=20
 #define LOWCOMMS_MAX_TX_BUFFER_LEN=094096
=20
+/* switch to check if dlm is running */
+extern int dlm_allow_conn;
+
 int dlm_lowcomms_start(void);
 void dlm_lowcomms_stop(void);
 void dlm_lowcomms_exit(void);
--=20
2.26.2

