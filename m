Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 94DA8166794
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 20:53:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582228429;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uiHd3gVSn7M7RJIcrp9VLVh+4H0D0e1KUWO2tIkEGBQ=;
	b=QLiOjm3VKs36hLVyl7QVXI2ZQKNS9TB1brXgSxcrrYu5rtO5ordEHOgQcLMTD6IqftyOSJ
	c4D49SE7LcX7su6FR45PpEU7i/dNCAFI9t4Psoqz0ZV+v2ITnTKohdwRoHhqrxEp83pQeu
	MBFC2IUmt1wXwSjO/+/poXkMS1tE32M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434--3u33dRAMCinY29d_q7AuQ-1; Thu, 20 Feb 2020 14:53:47 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1317D925B3;
	Thu, 20 Feb 2020 19:53:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3294610C9;
	Thu, 20 Feb 2020 19:53:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D07C28B2B2;
	Thu, 20 Feb 2020 19:53:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KJrfTl009085 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 14:53:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8F1BC90F69; Thu, 20 Feb 2020 19:53:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7736C90F57
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 19:53:40 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 20 Feb 2020 13:53:04 -0600
Message-Id: <20200220195329.952027-4-rpeterso@redhat.com>
In-Reply-To: <20200220195329.952027-1-rpeterso@redhat.com>
References: <20200220195329.952027-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 03/28] gfs2: Remove usused cluster_wide
	arguments of gfs2_consist functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: -3u33dRAMCinY29d_q7AuQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: Andreas Gruenbacher <agruenba@redhat.com>

These arguments are always passed as 0, and they are never evaluated.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/util.c |  6 +++---
 fs/gfs2/util.h | 12 ++++++------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 322012e2064e..74247d686cf7 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -142,7 +142,7 @@ int gfs2_assert_warn_i(struct gfs2_sbd *sdp, char *asse=
rtion,
  *          0 if it was already withdrawn
  */
=20
-int gfs2_consist_i(struct gfs2_sbd *sdp, int cluster_wide, const char *fun=
ction,
+int gfs2_consist_i(struct gfs2_sbd *sdp, const char *function,
 =09=09   char *file, unsigned int line)
 {
 =09gfs2_lm(sdp,
@@ -157,7 +157,7 @@ int gfs2_consist_i(struct gfs2_sbd *sdp, int cluster_wi=
de, const char *function,
  *          0 if it was already withdrawn
  */
=20
-int gfs2_consist_inode_i(struct gfs2_inode *ip, int cluster_wide,
+int gfs2_consist_inode_i(struct gfs2_inode *ip,
 =09=09=09 const char *function, char *file, unsigned int line)
 {
 =09struct gfs2_sbd *sdp =3D GFS2_SB(&ip->i_inode);
@@ -178,7 +178,7 @@ int gfs2_consist_inode_i(struct gfs2_inode *ip, int clu=
ster_wide,
  *          0 if it was already withdrawn
  */
=20
-int gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd, int cluster_wide,
+int gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd,
 =09=09=09 const char *function, char *file, unsigned int line)
 {
 =09struct gfs2_sbd *sdp =3D rgd->rd_sbd;
diff --git a/fs/gfs2/util.h b/fs/gfs2/util.h
index fdc218a28609..2c2940d55a35 100644
--- a/fs/gfs2/util.h
+++ b/fs/gfs2/util.h
@@ -52,25 +52,25 @@ int gfs2_assert_warn_i(struct gfs2_sbd *sdp, char *asse=
rtion,
 =09=09=09=09=09__func__, __FILE__, __LINE__))
=20
=20
-int gfs2_consist_i(struct gfs2_sbd *sdp, int cluster_wide,
+int gfs2_consist_i(struct gfs2_sbd *sdp,
 =09=09   const char *function, char *file, unsigned int line);
=20
 #define gfs2_consist(sdp) \
-gfs2_consist_i((sdp), 0, __func__, __FILE__, __LINE__)
+gfs2_consist_i((sdp), __func__, __FILE__, __LINE__)
=20
=20
-int gfs2_consist_inode_i(struct gfs2_inode *ip, int cluster_wide,
+int gfs2_consist_inode_i(struct gfs2_inode *ip,
 =09=09=09 const char *function, char *file, unsigned int line);
=20
 #define gfs2_consist_inode(ip) \
-gfs2_consist_inode_i((ip), 0, __func__, __FILE__, __LINE__)
+gfs2_consist_inode_i((ip), __func__, __FILE__, __LINE__)
=20
=20
-int gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd, int cluster_wide,
+int gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd,
 =09=09=09 const char *function, char *file, unsigned int line);
=20
 #define gfs2_consist_rgrpd(rgd) \
-gfs2_consist_rgrpd_i((rgd), 0, __func__, __FILE__, __LINE__)
+gfs2_consist_rgrpd_i((rgd), __func__, __FILE__, __LINE__)
=20
=20
 int gfs2_meta_check_ii(struct gfs2_sbd *sdp, struct buffer_head *bh,
--=20
2.24.1

