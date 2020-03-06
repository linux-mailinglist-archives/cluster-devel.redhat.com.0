Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D332D17C39E
	for <lists+cluster-devel@lfdr.de>; Fri,  6 Mar 2020 18:05:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583514357;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CWrP+FKz4kVs7Tbtfxv6nMgOnB9KwhTBvw+WWZrk+hs=;
	b=J1gKRGCLMs59+d5WiK15k3cvMe/TbGmNVqpdZ7ZhWfQB8GWrc5kAeTZNQrQbYoYmlHQSKO
	slHBQTvQXARPXS40FmvHgxXKDBWp6V+qXr30eqJlK9H8bsZI/3GKLc/sLQJq62YO4M/p5m
	J/rsaSrDkm2qWwLciTaPCJ9zOIE0Kvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-wVUgKWifO7mGTwTPi4a6Aw-1; Fri, 06 Mar 2020 12:05:55 -0500
X-MC-Unique: wVUgKWifO7mGTwTPi4a6Aw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CAA6800EBC;
	Fri,  6 Mar 2020 17:05:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE65F19C6A;
	Fri,  6 Mar 2020 17:05:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D241586A05;
	Fri,  6 Mar 2020 17:05:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 026H5pAi028753 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 12:05:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E7ED18B74D; Fri,  6 Mar 2020 17:05:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD7DD8D57C
	for <cluster-devel@redhat.com>; Fri,  6 Mar 2020 17:05:50 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  6 Mar 2020 11:05:33 -0600
Message-Id: <20200306170534.1772544-6-rpeterso@redhat.com>
In-Reply-To: <20200306170534.1772544-1-rpeterso@redhat.com>
References: <20200306170534.1772544-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 5/6] gfs2: Add missing gfs2_qa_get
	error handling in gfs2_open_common
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Andreas Gruenbacher <agruenba@redhat.com>

This patch adds error handling to gfs2_open_common wrt gfs2_qa_get.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/file.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index adaaca98a884..99a75e779ac0 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -636,9 +636,17 @@ int gfs2_open_common(struct inode *inode, struct file =
*file)
=20
 =09gfs2_assert_warn(GFS2_SB(inode), !file->private_data);
 =09file->private_data =3D fp;
-=09if (file->f_mode & FMODE_WRITE)
-=09=09gfs2_qa_get(GFS2_I(inode));
+=09if (file->f_mode & FMODE_WRITE) {
+=09=09ret =3D gfs2_qa_get(GFS2_I(inode));
+=09=09if (ret)
+=09=09=09goto fail;
+=09}
 =09return 0;
+
+fail:
+=09kfree(file->private_data);
+=09file->private_data =3D NULL;
+=09return ret;
 }
=20
 /**
--=20
2.24.1

