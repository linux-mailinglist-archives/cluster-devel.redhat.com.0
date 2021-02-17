Return-Path: <cluster-devel-bounces@listman.redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id EFB0E31D31C
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Feb 2021 01:01:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613520115;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cXnjoBiaPkyM/KvOdszudzXnJHix5hShTawquW66qJM=;
	b=FZ4WvGAzv8WcHyc8eWCEVftD/r8CQryhAOM/TPbSM3evJPv1szx6WC2+SXfV/fA5JIm3YN
	wqgp2P51b/8RXbvrgyRiXc+SorMfLuf649v088LrPhi1g73CgrOEa3fdB+yUTqZePgds+p
	du+vTjvk4LIANUYiPZuBQt71kIh3fp8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-_cvcxhTBPXiNG5eHJJnsGg-1; Tue, 16 Feb 2021 19:01:51 -0500
X-MC-Unique: _cvcxhTBPXiNG5eHJJnsGg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2993801976;
	Wed, 17 Feb 2021 00:01:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9286C5C1B4;
	Wed, 17 Feb 2021 00:01:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7302018095C7;
	Wed, 17 Feb 2021 00:01:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11H00wCi031327 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 19:00:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9CDF25C5B5; Wed, 17 Feb 2021 00:00:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-173.rdu2.redhat.com [10.10.115.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CC055C1B4;
	Wed, 17 Feb 2021 00:00:58 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Feb 2021 19:00:42 -0500
Message-Id: <20210217000046.349203-9-aahringo@redhat.com>
In-Reply-To: <20210217000046.349203-1-aahringo@redhat.com>
References: <20210217000046.349203-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 08/12] fs: dlm: simplify
	writequeue handling
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

This patch cleans up the current dlm sending allocator handling by using
some named macros, list functionality and removes some goto statements.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 83 ++++++++++++++++++++++++-----------------------
 1 file changed, 43 insertions(+), 40 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index e0e74ee82a21..d9784ff0ca30 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -102,6 +102,9 @@ struct listen_connection {
 =09struct work_struct rwork;
 };
=20
+#define DLM_WQ_REMAIN_BYTES(e) (PAGE_SIZE - e->end)
+#define DLM_WQ_LENGTH_BYTES(e) (e->end - e->offset)
+
 /* An entry waiting to be sent */
 struct writequeue_entry {
 =09struct list_head list;
@@ -1332,7 +1335,7 @@ static struct writequeue_entry *new_writequeue_entry(=
struct connection *con,
 {
 =09struct writequeue_entry *entry;
=20
-=09entry =3D kmalloc(sizeof(struct writequeue_entry), allocation);
+=09entry =3D kzalloc(sizeof(*entry), allocation);
 =09if (!entry)
 =09=09return NULL;
=20
@@ -1342,20 +1345,48 @@ static struct writequeue_entry *new_writequeue_entr=
y(struct connection *con,
 =09=09return NULL;
 =09}
=20
-=09entry->offset =3D 0;
-=09entry->len =3D 0;
-=09entry->end =3D 0;
-=09entry->users =3D 0;
 =09entry->con =3D con;
+=09entry->users =3D 1;
=20
 =09return entry;
 }
=20
+static struct writequeue_entry *new_wq_entry(struct connection *con, int l=
en,
+=09=09=09=09=09     gfp_t allocation, char **ppc)
+{
+=09struct writequeue_entry *e;
+
+=09spin_lock(&con->writequeue_lock);
+=09if (!list_empty(&con->writequeue)) {
+=09=09e =3D list_last_entry(&con->writequeue, struct writequeue_entry, lis=
t);
+=09=09if (DLM_WQ_REMAIN_BYTES(e) >=3D len) {
+=09=09=09*ppc =3D page_address(e->page) + e->end;
+=09=09=09e->end +=3D len;
+=09=09=09e->users++;
+=09=09=09spin_unlock(&con->writequeue_lock);
+
+=09=09=09return e;
+=09=09}
+=09}
+=09spin_unlock(&con->writequeue_lock);
+
+=09e =3D new_writequeue_entry(con, allocation);
+=09if (!e)
+=09=09return NULL;
+
+=09*ppc =3D page_address(e->page);
+=09e->end +=3D len;
+
+=09spin_lock(&con->writequeue_lock);
+=09list_add_tail(&e->list, &con->writequeue);
+=09spin_unlock(&con->writequeue_lock);
+
+=09return e;
+};
+
 void *dlm_lowcomms_get_buffer(int nodeid, int len, gfp_t allocation, char =
**ppc)
 {
 =09struct connection *con;
-=09struct writequeue_entry *e;
-=09int offset =3D 0;
=20
 =09if (len > DEFAULT_BUFFER_SIZE ||
 =09    len < sizeof(struct dlm_header)) {
@@ -1369,35 +1400,7 @@ void *dlm_lowcomms_get_buffer(int nodeid, int len, g=
fp_t allocation, char **ppc)
 =09if (!con)
 =09=09return NULL;
=20
-=09spin_lock(&con->writequeue_lock);
-=09e =3D list_entry(con->writequeue.prev, struct writequeue_entry, list);
-=09if ((&e->list =3D=3D &con->writequeue) ||
-=09    (PAGE_SIZE - e->end < len)) {
-=09=09e =3D NULL;
-=09} else {
-=09=09offset =3D e->end;
-=09=09e->end +=3D len;
-=09=09e->users++;
-=09}
-=09spin_unlock(&con->writequeue_lock);
-
-=09if (e) {
-=09got_one:
-=09=09*ppc =3D page_address(e->page) + offset;
-=09=09return e;
-=09}
-
-=09e =3D new_writequeue_entry(con, allocation);
-=09if (e) {
-=09=09spin_lock(&con->writequeue_lock);
-=09=09offset =3D e->end;
-=09=09e->end +=3D len;
-=09=09e->users++;
-=09=09list_add_tail(&e->list, &con->writequeue);
-=09=09spin_unlock(&con->writequeue_lock);
-=09=09goto got_one;
-=09}
-=09return NULL;
+=09return new_wq_entry(con, len, allocation, ppc);
 }
=20
 void dlm_lowcomms_commit_buffer(void *mh)
@@ -1410,7 +1413,8 @@ void dlm_lowcomms_commit_buffer(void *mh)
 =09users =3D --e->users;
 =09if (users)
 =09=09goto out;
-=09e->len =3D e->end - e->offset;
+
+=09e->len =3D DLM_WQ_LENGTH_BYTES(e);
 =09spin_unlock(&con->writequeue_lock);
=20
 =09queue_work(send_workqueue, &con->swork);
@@ -1436,11 +1440,10 @@ static void send_to_sock(struct connection *con)
=20
 =09spin_lock(&con->writequeue_lock);
 =09for (;;) {
-=09=09e =3D list_entry(con->writequeue.next, struct writequeue_entry,
-=09=09=09       list);
-=09=09if ((struct list_head *) e =3D=3D &con->writequeue)
+=09=09if (list_empty(&con->writequeue))
 =09=09=09break;
=20
+=09=09e =3D list_first_entry(&con->writequeue, struct writequeue_entry, li=
st);
 =09=09len =3D e->len;
 =09=09offset =3D e->offset;
 =09=09BUG_ON(len =3D=3D 0 && e->users =3D=3D 0);
--=20
2.26.2

