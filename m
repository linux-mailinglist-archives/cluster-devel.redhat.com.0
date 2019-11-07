Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EA801F3825
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Nov 2019 20:08:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573153727;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0kekyP0/L0SWmtAtd/oIUMSVTOlO8/J1oDUL9XnUqzY=;
	b=TbscfQXFbHMls+n6rZtnqS/lw4YpH0IKz5bnzHurEVof126Lknc406mFuut90STtLWVvvG
	xr1atudk7fqFJCgFIQaPAQqxdU4hSiVs+57II6rFLwjSXpDSEg/qKAgBXypvCGoKpnzBll
	45bteaYMp97byBQAwK0HJk/ArzHlNW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-jINnVWwhMp-YFI2Pe4SUug-1; Thu, 07 Nov 2019 14:08:46 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE61D107ACC3;
	Thu,  7 Nov 2019 19:08:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A7AC600F4;
	Thu,  7 Nov 2019 19:08:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10F1018089CD;
	Thu,  7 Nov 2019 19:08:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA7J8ZVO012580 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 14:08:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ACFCD5D6B7; Thu,  7 Nov 2019 19:08:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.157])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FCCB5D6D8
	for <cluster-devel@redhat.com>; Thu,  7 Nov 2019 19:08:29 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  7 Nov 2019 19:08:25 +0000
Message-Id: <20191107190827.14169-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/3] fsck.gfs2: Fix segfault in
	build_and_check_metalist
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: jINnVWwhMp-YFI2Pe4SUug-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

In unlikely circumstances, indirect pointer corruption in a 'system'
inode's metadata tree can lead to the inode block state being marked as
'free' in pass1, which causes build_and_check_metalist() to be called in
pass 2. The pass has a NULL ->check_metalist function pointer and so a
segfault occurs when build_and_check_metalist attempts to call it.

Fix the segfault by calling ->check_metalist() only when it's not NULL.
This required some refactoring to make the extra level of if-nesting
easier to implement and read.

Resolves: rhbz#1487726

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/metawalk.c | 107 ++++++++++++++++++++-----------------------
 gfs2/fsck/metawalk.h |   1 +
 2 files changed, 50 insertions(+), 58 deletions(-)

diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index d256dd2f..5792be56 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -1210,6 +1210,51 @@ static void file_ra(struct gfs2_inode *ip, struct gf=
s2_buffer_head *bh,
 =09=09=09      extlen * sdp->bsize, POSIX_FADV_WILLNEED);
 }
=20
+static int do_check_metalist(struct gfs2_inode *ip, uint64_t block, int he=
ight,
+                             struct gfs2_buffer_head **bhp, struct metawal=
k_fxns *pass)
+{
+=09int was_duplicate =3D 0;
+=09int is_valid =3D 1;
+=09int error;
+
+=09if (pass->check_metalist =3D=3D NULL)
+=09=09return 0;
+
+=09error =3D pass->check_metalist(ip, block, bhp, height, &is_valid,
+=09=09=09=09     &was_duplicate, pass->private);
+=09if (error =3D=3D meta_error) {
+=09=09stack;
+=09=09log_info("\n");
+=09=09log_info(_("Serious metadata error on block %"PRIu64" (0x%"PRIx64").=
\n"),
+=09=09         block, block);
+=09=09return error;
+=09}
+=09if (error =3D=3D meta_skip_further) {
+=09=09log_info("\n");
+=09=09log_info(_("Unrecoverable metadata error on block %"PRIu64" (0x%"PRI=
x64")\n"),
+=09=09         block, block);
+=09=09log_info(_("Further metadata will be skipped.\n"));
+=09=09return error;
+=09}
+=09if (!is_valid) {
+=09=09log_debug("Skipping rejected block %"PRIu64" (0x%"PRIx64")\n", block=
, block);
+=09=09if (pass->invalid_meta_is_fatal)
+=09=09=09return meta_error;
+=09=09return meta_skip_one;
+=09}
+=09if (was_duplicate) {
+=09=09log_debug("Skipping duplicate %"PRIu64" (0x%"PRIx64")\n", block, blo=
ck);
+=09=09return meta_skip_one;
+=09}
+=09if (!valid_block_ip(ip, block)) {
+=09=09log_debug("Skipping invalid block %"PRIu64" (0x%"PRIx64")\n", block,=
 block);
+=09=09if (pass->invalid_meta_is_fatal)
+=09=09=09return meta_error;
+=09=09return meta_skip_one;
+=09}
+=09return error;
+}
+
 /**
  * build_and_check_metalist - check a bunch of indirect blocks
  *                            This includes hash table blocks for director=
ies
@@ -1229,8 +1274,8 @@ static int build_and_check_metalist(struct gfs2_inode=
 *ip, osi_list_t *mlp,
 =09osi_list_t *prev_list, *cur_list, *tmp;
 =09int h, head_size, iblk_type;
 =09uint64_t *ptr, block, *undoptr;
-=09int error, was_duplicate, is_valid;
 =09int maxptrs;
+=09int error;
=20
 =09osi_list_add(&metabh->b_altlist, &mlp[0]);
=20
@@ -1294,65 +1339,11 @@ static int build_and_check_metalist(struct gfs2_ino=
de *ip, osi_list_t *mlp,
 =09=09=09=09=09continue;
=20
 =09=09=09=09block =3D be64_to_cpu(*ptr);
-=09=09=09=09was_duplicate =3D 0;
-=09=09=09=09error =3D pass->check_metalist(ip, block, &nbh,
-=09=09=09=09=09=09=09     h, &is_valid,
-=09=09=09=09=09=09=09     &was_duplicate,
-=09=09=09=09=09=09=09     pass->private);
-=09=09=09=09/* check_metalist should hold any buffers
-=09=09=09=09   it gets with "bread". */
-=09=09=09=09if (error =3D=3D meta_error) {
-=09=09=09=09=09stack;
-=09=09=09=09=09log_info(_("\nSerious metadata "
-=09=09=09=09=09=09   "error on block %llu "
-=09=09=09=09=09=09   "(0x%llx).\n"),
-=09=09=09=09=09=09 (unsigned long long)block,
-=09=09=09=09=09=09 (unsigned long long)block);
+=09=09=09=09error =3D do_check_metalist(ip, block, h, &nbh, pass);
+=09=09=09=09if (error =3D=3D meta_error || error =3D=3D meta_skip_further)
 =09=09=09=09=09goto error_undo;
-=09=09=09=09}
-=09=09=09=09if (error =3D=3D meta_skip_further) {
-=09=09=09=09=09log_info(_("\nUnrecoverable metadata "
-=09=09=09=09=09=09   "error on block %llu "
-=09=09=09=09=09=09   "(0x%llx). Further metadata"
-=09=09=09=09=09=09   " will be skipped.\n"),
-=09=09=09=09=09=09 (unsigned long long)block,
-=09=09=09=09=09=09 (unsigned long long)block);
-=09=09=09=09=09goto error_undo;
-=09=09=09=09}
-=09=09=09=09if (!is_valid) {
-=09=09=09=09=09log_debug( _("Skipping rejected block "
-=09=09=09=09=09=09     "%llu (0x%llx)\n"),
-=09=09=09=09=09=09   (unsigned long long)block,
-=09=09=09=09=09=09   (unsigned long long)block);
-=09=09=09=09=09if (pass->invalid_meta_is_fatal) {
-=09=09=09=09=09=09error =3D meta_error;
-=09=09=09=09=09=09goto error_undo;
-=09=09=09=09=09}
-=09=09=09=09=09continue;
-=09=09=09=09}
-=09=09=09=09/* Note that there's a special case in which
-=09=09=09=09   we need to process the metadata block, even
-=09=09=09=09   if it was a duplicate. That's for cases
-=09=09=09=09   where we deleted the last reference as
-=09=09=09=09   metadata. */
-=09=09=09=09if (was_duplicate) {
-=09=09=09=09=09log_debug( _("Skipping duplicate %llu "
-=09=09=09=09=09=09     "(0x%llx)\n"),
-=09=09=09=09=09=09   (unsigned long long)block,
-=09=09=09=09=09=09   (unsigned long long)block);
+=09=09=09=09if (error =3D=3D meta_skip_one)
 =09=09=09=09=09continue;
-=09=09=09=09}
-=09=09=09=09if (!valid_block_ip(ip, block)) {
-=09=09=09=09=09log_debug( _("Skipping invalid block "
-=09=09=09=09=09=09     "%lld (0x%llx)\n"),
-=09=09=09=09=09=09   (unsigned long long)block,
-=09=09=09=09=09=09   (unsigned long long)block);
-=09=09=09=09=09if (pass->invalid_meta_is_fatal) {
-=09=09=09=09=09=09error =3D meta_error;
-=09=09=09=09=09=09goto error_undo;
-=09=09=09=09=09}
-=09=09=09=09=09continue;
-=09=09=09=09}
 =09=09=09=09if (!nbh)
 =09=09=09=09=09nbh =3D bread(ip->i_sbd, block);
 =09=09=09=09osi_list_add_prev(&nbh->b_altlist, cur_list);
diff --git a/gfs2/fsck/metawalk.h b/gfs2/fsck/metawalk.h
index 119efeed..b5a037a3 100644
--- a/gfs2/fsck/metawalk.h
+++ b/gfs2/fsck/metawalk.h
@@ -39,6 +39,7 @@ enum meta_check_rc {
 =09meta_error =3D -1,
 =09meta_is_good =3D 0,
 =09meta_skip_further =3D 1,
+=09meta_skip_one =3D 2,
 };
=20
 /* metawalk_fxns: function pointers to check various parts of the fs
--=20
2.21.0

