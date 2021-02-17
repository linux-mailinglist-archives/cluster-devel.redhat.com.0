Return-Path: <cluster-devel-bounces@listman.redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id F048A31D321
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Feb 2021 01:02:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613520147;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F5l6rk3fyviCvjvnbAgVj3AIsEnXZ6+Q7q6RsRENaIM=;
	b=Vm/hqib7Kt0A1V6/tVk35EzgPJpVEWjbMocXuhtaNjHzV8KDs0XVI7PY6ayNS1YfeA+KMf
	kpum+3e5YXLkgYkxciVoQRDALiDUjHOESxi46HPl2jUOmL1uLWKMSx8VoQnjtyXcn/rZ4J
	DeNE7g87w1mqdvjYlVrYYDuWp74Aydo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-Nbu-6k3KOAuHVP3J3I8yKw-1; Tue, 16 Feb 2021 19:02:22 -0500
X-MC-Unique: Nbu-6k3KOAuHVP3J3I8yKw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBDDC512C;
	Wed, 17 Feb 2021 00:02:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA8C860C15;
	Wed, 17 Feb 2021 00:02:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9155E18095CB;
	Wed, 17 Feb 2021 00:02:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11H00tnA031275 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 19:00:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BD3725C5B5; Wed, 17 Feb 2021 00:00:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-173.rdu2.redhat.com [10.10.115.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3CB3C5C1B4;
	Wed, 17 Feb 2021 00:00:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Feb 2021 19:00:38 -0500
Message-Id: <20210217000046.349203-5-aahringo@redhat.com>
In-Reply-To: <20210217000046.349203-1-aahringo@redhat.com>
References: <20210217000046.349203-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 04/12] fs: dlm: add errno
	handling to check callback
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252

This allows to return individual errno values for the config attribute
check callback instead of returning invalid argument only.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 49c5f9407098..73e6643903af 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -125,7 +125,7 @@ static ssize_t cluster_cluster_name_store(struct config=
_item *item,
 CONFIGFS_ATTR(cluster_, cluster_name);
=20
 static ssize_t cluster_set(struct dlm_cluster *cl, unsigned int *cl_field,
-=09=09=09   int *info_field, bool (*check_cb)(unsigned int x),
+=09=09=09   int *info_field, int (*check_cb)(unsigned int x),
 =09=09=09   const char *buf, size_t len)
 {
 =09unsigned int x;
@@ -137,8 +137,11 @@ static ssize_t cluster_set(struct dlm_cluster *cl, uns=
igned int *cl_field,
 =09if (rc)
 =09=09return rc;
=20
-=09if (check_cb && check_cb(x))
-=09=09return -EINVAL;
+=09if (check_cb) {
+=09=09rc =3D check_cb(x);
+=09=09if (rc)
+=09=09=09return rc;
+=09}
=20
 =09*cl_field =3D x;
 =09*info_field =3D x;
@@ -161,14 +164,20 @@ static ssize_t cluster_##name##_show(struct config_it=
em *item, char *buf)     \
 }                                                                         =
    \
 CONFIGFS_ATTR(cluster_, name);
=20
-static bool dlm_check_zero(unsigned int x)
+static int dlm_check_zero(unsigned int x)
 {
-=09return !x;
+=09if (!x)
+=09=09return -EINVAL;
+
+=09return 0;
 }
=20
-static bool dlm_check_buffer_size(unsigned int x)
+static int dlm_check_buffer_size(unsigned int x)
 {
-=09return (x < DEFAULT_BUFFER_SIZE);
+=09if (x < DEFAULT_BUFFER_SIZE)
+=09=09return -EINVAL;
+
+=09return 0;
 }
=20
 CLUSTER_ATTR(tcp_port, dlm_check_zero);
--=20
2.26.2

