Return-Path: <cluster-devel-bounces@listman.redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id E6DAA31D325
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Feb 2021 01:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613520149;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2jEDBvsA8F2QtIpeekBE8EzqxKYYzUYtTW44FpmLthE=;
	b=EN2USXIe7IJp3pRG/SIozO7zlpFcr50XG+JKceUdlL4GzDe7EopGaLp7jVlNEweaoTqZ/g
	w9p5dr764hFlROz5FkJ4VnCjKnaAD5HDevv1fo8uepcZ/Wu1TytF3zcJ3mbwFTcr9fbIaN
	KlX+Rn+8A0QuiUnoEwo4gdsG+yXHM/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-8tgeOhmfNqaRnU1APQ-A7Q-1; Tue, 16 Feb 2021 19:02:25 -0500
X-MC-Unique: 8tgeOhmfNqaRnU1APQ-A7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04827193578E;
	Wed, 17 Feb 2021 00:02:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E51D65C5B5;
	Wed, 17 Feb 2021 00:02:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1DB557DFD;
	Wed, 17 Feb 2021 00:02:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11H011jP031366 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 19:01:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 815025C661; Wed, 17 Feb 2021 00:01:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-173.rdu2.redhat.com [10.10.115.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 00DBB5C1B4;
	Wed, 17 Feb 2021 00:01:00 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Feb 2021 19:00:46 -0500
Message-Id: <20210217000046.349203-13-aahringo@redhat.com>
In-Reply-To: <20210217000046.349203-1-aahringo@redhat.com>
References: <20210217000046.349203-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 12/12] fs: dlm: add shutdown hook
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252

This patch fixes issues which occurs when dlm lowcomms synchronize their
workqueues but dlm application layer already released the lockspace. In
such cases messages like:

dlm: gfs2: release_lockspace final free
dlm: invalid lockspace 3841231384 from 1 cmd 1 type 11

are printed on the kernel log. This patch is solving this issue by
introducing a new "shutdown" hook before calling "stop" hook when the
lockspace is going to be released finally. This should pretend any
dlm messages sitting in the workqueues during or after lockspace
removal.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lockspace.c |  3 +++
 fs/dlm/lowcomms.c  | 42 +++++++++++++++++++++++-------------------
 fs/dlm/lowcomms.h  |  1 +
 3 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index 561dcad08ad6..9d52384e6100 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -788,6 +788,9 @@ static int release_lockspace(struct dlm_ls *ls, int for=
ce)
=20
 =09dlm_recoverd_stop(ls);
=20
+=09if (ls_count =3D=3D 1)
+=09=09dlm_lowcomms_shutdown();
+
 =09dlm_callback_stop(ls);
=20
 =09remove_lockspace(ls);
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index e6652189a282..92b27da6f73e 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1593,6 +1593,29 @@ static int work_start(void)
 =09return 0;
 }
=20
+static void shutdown_conn(struct connection *con)
+{
+=09if (con->shutdown_action)
+=09=09con->shutdown_action(con);
+}
+
+void dlm_lowcomms_shutdown(void)
+{
+=09/* Set all the flags to prevent any
+=09 * socket activity.
+=09 */
+=09dlm_allow_conn =3D 0;
+
+=09if (recv_workqueue)
+=09=09flush_workqueue(recv_workqueue);
+=09if (send_workqueue)
+=09=09flush_workqueue(send_workqueue);
+
+=09dlm_close_sock(&listen_con.sock);
+
+=09foreach_conn(shutdown_conn);
+}
+
 static void _stop_conn(struct connection *con, bool and_other)
 {
 =09mutex_lock(&con->sock_mutex);
@@ -1614,12 +1637,6 @@ static void stop_conn(struct connection *con)
 =09_stop_conn(con, true);
 }
=20
-static void shutdown_conn(struct connection *con)
-{
-=09if (con->shutdown_action)
-=09=09con->shutdown_action(con);
-}
-
 static void connection_release(struct rcu_head *rcu)
 {
 =09struct connection *con =3D container_of(rcu, struct connection, rcu);
@@ -1676,19 +1693,6 @@ static void work_flush(void)
=20
 void dlm_lowcomms_stop(void)
 {
-=09/* Set all the flags to prevent any
-=09   socket activity.
-=09*/
-=09dlm_allow_conn =3D 0;
-
-=09if (recv_workqueue)
-=09=09flush_workqueue(recv_workqueue);
-=09if (send_workqueue)
-=09=09flush_workqueue(send_workqueue);
-
-=09dlm_close_sock(&listen_con.sock);
-
-=09foreach_conn(shutdown_conn);
 =09work_flush();
 =09foreach_conn(free_conn);
 =09work_stop();
diff --git a/fs/dlm/lowcomms.h b/fs/dlm/lowcomms.h
index f74888ed43b4..98bf93ab1fdc 100644
--- a/fs/dlm/lowcomms.h
+++ b/fs/dlm/lowcomms.h
@@ -18,6 +18,7 @@
 extern int dlm_allow_conn;
=20
 int dlm_lowcomms_start(void);
+void dlm_lowcomms_shutdown(void);
 void dlm_lowcomms_stop(void);
 void dlm_lowcomms_exit(void);
 int dlm_lowcomms_close(int nodeid);
--=20
2.26.2

