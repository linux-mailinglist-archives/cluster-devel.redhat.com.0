Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6472614F1D9
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Jan 2020 19:07:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494069;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uiHd3gVSn7M7RJIcrp9VLVh+4H0D0e1KUWO2tIkEGBQ=;
	b=IFtbihLmeg6HX5WaMAmwgCMHQZehqj5lzVACq2OLZpXMO/TRSatpBaawDtJ5oEbUB43qhE
	QNPU9P+esuzA9AWZKdjFqhx8UWRiyzmOcHte+8itvfXdkfjZLy4mbry6uczXYLlSqJOWJ5
	FXLa7w0IZsy7NSUcNoqO+Axs9/PF+tM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-OvHIESMqMLCgDX-pM7BnbA-1; Fri, 31 Jan 2020 13:07:45 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE5FCA0CDA;
	Fri, 31 Jan 2020 18:07:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 996BE19C4F;
	Fri, 31 Jan 2020 18:07:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 268C718089CF;
	Fri, 31 Jan 2020 18:07:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00VI7agW026876 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 31 Jan 2020 13:07:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 01B2660BE1; Fri, 31 Jan 2020 18:07:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9D9460BE0
	for <cluster-devel@redhat.com>; Fri, 31 Jan 2020 18:07:34 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 31 Jan 2020 12:07:01 -0600
Message-Id: <20200131180723.178863-4-rpeterso@redhat.com>
In-Reply-To: <20200131180723.178863-1-rpeterso@redhat.com>
References: <20200131180723.178863-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 03/25] gfs2: Remove usused cluster_wide
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: OvHIESMqMLCgDX-pM7BnbA-1
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

