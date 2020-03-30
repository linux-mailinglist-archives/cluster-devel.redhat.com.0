Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 1C142197D59
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576014;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MZ+/nn9jjaEsZ5jT5VdOmYX2xfuU861jyRaXOxs1Wns=;
	b=CuV4kcFexJoTsy1yLFIn1zf/iB5w5Bl0YUsdCJoj1YFv/dIc0HGUxDS2MZLHh4Tpi+PygZ
	tKCfBvcRZIEOanpUmQJt8lSh0N7cLknbfl2Uj1jtsTiYdD6YrcwOUfmhR5ySDx1i4jOzwV
	MV06WxjwLnr9CRMX7DMSu0W19JqhPKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-kQQm-XvwOau0n5fshUQ_hw-1; Mon, 30 Mar 2020 09:46:51 -0400
X-MC-Unique: kQQm-XvwOau0n5fshUQ_hw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5055F18FE868;
	Mon, 30 Mar 2020 13:46:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B5B710027B8;
	Mon, 30 Mar 2020 13:46:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDF80944DA;
	Mon, 30 Mar 2020 13:46:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkUGI020156 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 261EF48; Mon, 30 Mar 2020 13:46:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DED7F97B17
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:29 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:45:49 -0500
Message-Id: <20200330134624.259349-5-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 04/39] gfs2: Turn gfs2_consist into
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
2.25.1

