Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5412B14F1D8
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 19:07:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494069;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TlnYnvvAaY+5Xkhgu1RbzGE+jYYTUIWpC9C81Lty210=;
	b=Q3oyTexO3WhJUGwxiuqpUEOwa+5z7xJ4DefUw/jM+Ulc6HOAV759iF1cYPtlZFvTPO0OGV
	yrCLAsHtzn0RJ0VMR+aq1LQE6XsE0OXH79gYLk3yZEceixc5KI/tX6VA1DFlayrrZ1vaIU
	6EDOKxtHOm49LSdaVkfmVTw8ew8I+Ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-YJbcmGzKOtKdUY2g_7qPiw-1; Fri, 31 Jan 2020 13:07:46 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 470C710B9F16;
	Fri, 31 Jan 2020 18:07:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3126A5C290;
	Fri, 31 Jan 2020 18:07:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14F4A85CE1;
	Fri, 31 Jan 2020 18:07:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VI7cUR026891 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 13:07:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0BC0760BE1; Fri, 31 Jan 2020 18:07:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C60DC60BE0
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 18:07:36 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 31 Jan 2020 12:07:02 -0600
Message-Id: <20200131180723.178863-5-rpeterso@redhat.com>
In-Reply-To: <20200131180723.178863-1-rpeterso@redhat.com>
References: <20200131180723.178863-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 04/25] gfs2: Turn gfs2_consist into
	void functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: YJbcmGzKOtKdUY2g_7qPiw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Andreas Gruenbacher <agruenba@redhat.com>

Change the various gfs2_consist functions to return void.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/util.c | 24 +++++++++---------------
 fs/gfs2/util.h | 12 ++++++------
 2 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 74247d686cf7..698eb5952438 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -138,27 +138,23 @@ int gfs2_assert_warn_i(struct gfs2_sbd *sdp, char *as=
sertion,
=20
 /**
  * gfs2_consist_i - Flag a filesystem consistency error and withdraw
- * Returns: -1 if this call withdrew the machine,
- *          0 if it was already withdrawn
  */
=20
-int gfs2_consist_i(struct gfs2_sbd *sdp, const char *function,
-=09=09   char *file, unsigned int line)
+void gfs2_consist_i(struct gfs2_sbd *sdp, const char *function,
+=09=09    char *file, unsigned int line)
 {
 =09gfs2_lm(sdp,
 =09=09"fatal: filesystem consistency error - function =3D %s, file =3D %s,=
 line =3D %u\n",
 =09=09function, file, line);
-=09return gfs2_withdraw(sdp);
+=09gfs2_withdraw(sdp);
 }
=20
 /**
  * gfs2_consist_inode_i - Flag an inode consistency error and withdraw
- * Returns: -1 if this call withdrew the machine,
- *          0 if it was already withdrawn
  */
=20
-int gfs2_consist_inode_i(struct gfs2_inode *ip,
-=09=09=09 const char *function, char *file, unsigned int line)
+void gfs2_consist_inode_i(struct gfs2_inode *ip,
+=09=09=09  const char *function, char *file, unsigned int line)
 {
 =09struct gfs2_sbd *sdp =3D GFS2_SB(&ip->i_inode);
=20
@@ -169,17 +165,15 @@ int gfs2_consist_inode_i(struct gfs2_inode *ip,
 =09=09(unsigned long long)ip->i_no_formal_ino,
 =09=09(unsigned long long)ip->i_no_addr,
 =09=09function, file, line);
-=09return gfs2_withdraw(sdp);
+=09gfs2_withdraw(sdp);
 }
=20
 /**
  * gfs2_consist_rgrpd_i - Flag a RG consistency error and withdraw
- * Returns: -1 if this call withdrew the machine,
- *          0 if it was already withdrawn
  */
=20
-int gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd,
-=09=09=09 const char *function, char *file, unsigned int line)
+void gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd,
+=09=09=09  const char *function, char *file, unsigned int line)
 {
 =09struct gfs2_sbd *sdp =3D rgd->rd_sbd;
 =09char fs_id_buf[sizeof(sdp->sd_fsname) + 7];
@@ -192,7 +186,7 @@ int gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd,
 =09=09"  function =3D %s, file =3D %s, line =3D %u\n",
 =09=09(unsigned long long)rgd->rd_addr,
 =09=09function, file, line);
-=09return gfs2_withdraw(sdp);
+=09gfs2_withdraw(sdp);
 }
=20
 /**
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index 2c2940d55a35..93e089327216 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -52,22 +52,22 @@ int gfs2_assert_warn_i(struct gfs2_sbd *sdp, char *asse=
rtion,
 =09=09=09=09=09__func__, __FILE__, __LINE__))
=20
=20
-int gfs2_consist_i(struct gfs2_sbd *sdp,
-=09=09   const char *function, char *file, unsigned int line);
+void gfs2_consist_i(struct gfs2_sbd *sdp,
+=09=09    const char *function, char *file, unsigned int line);
=20
 #define gfs2_consist(sdp) \
 gfs2_consist_i((sdp), __func__, __FILE__, __LINE__)
=20
=20
-int gfs2_consist_inode_i(struct gfs2_inode *ip,
-=09=09=09 const char *function, char *file, unsigned int line);
+void gfs2_consist_inode_i(struct gfs2_inode *ip,
+=09=09=09  const char *function, char *file, unsigned int line);
=20
 #define gfs2_consist_inode(ip) \
 gfs2_consist_inode_i((ip), __func__, __FILE__, __LINE__)
=20
=20
-int gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd,
-=09=09=09 const char *function, char *file, unsigned int line);
+void gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd,
+=09=09=09  const char *function, char *file, unsigned int line);
=20
 #define gfs2_consist_rgrpd(rgd) \
 gfs2_consist_rgrpd_i((rgd), __func__, __FILE__, __LINE__)
--=20
2.24.1

