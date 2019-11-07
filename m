Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 619E5F3828
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Nov 2019 20:08:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573153730;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+nsGYlMGI7nTDzKHrl7s8xA6nCsIEVAObb+Oo19o7Pk=;
	b=FSgGwOFgGX44V6MFSWTeJF9BxpslZomudtTJW1E50pPhbpv/8Jrbpz+XPuWSb5PsOUx6NZ
	9UskuXJD/RenflT0xJcCz6b7bb5Mpskt30ejSmSvCUsfboJLyj0Uk5d6u3IyApI0tig85e
	PIdEZ30gLPkPrdyRTHlGpuyVOrD2gyE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-49cfcMPgMN63ia9smIWBaw-1; Thu, 07 Nov 2019 14:08:45 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59A661005502;
	Thu,  7 Nov 2019 19:08:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4745A100EBA4;
	Thu,  7 Nov 2019 19:08:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A32018089CE;
	Thu,  7 Nov 2019 19:08:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA7J8bJM012592 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 14:08:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 743025D6B7; Thu,  7 Nov 2019 19:08:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.157])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 494205D70D
	for <cluster-devel@redhat.com>; Thu,  7 Nov 2019 19:08:35 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  7 Nov 2019 19:08:26 +0000
Message-Id: <20191107190827.14169-2-anprice@redhat.com>
In-Reply-To: <20191107190827.14169-1-anprice@redhat.com>
References: <20191107190827.14169-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 2/3] fsck.gfs2: Retain context for indirect
	pointers in ->check_metalist
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
X-MC-Unique: 49cfcMPgMN63ia9smIWBaw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

When the pass->check_metalist() functions are called, the pointer is
thrown away and the function is just called with a block address,
meaning that ->check_metalist() is unable to fix the pointer itself if
it deems the block pointed to is garbage.

Add an iptr structure which collects together the inode, the metadata
block buffer and the offset of the pointer in that buffer. The iptr is
now passed to ->check_metadata instead of the separate inode and block
address arguments.

Resolves: rhbz#1487726

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/afterpass1_common.c |  6 ++--
 gfs2/fsck/afterpass1_common.h |  4 +--
 gfs2/fsck/fs_recovery.c       |  8 ++---
 gfs2/fsck/metawalk.c          | 55 ++++++++++++++++----------------
 gfs2/fsck/metawalk.h          | 15 +++++++--
 gfs2/fsck/pass1.c             | 59 ++++++++++++++++++-----------------
 gfs2/fsck/pass1b.c            | 22 +++++++------
 gfs2/fsck/pass2.c             |  8 +++--
 8 files changed, 98 insertions(+), 79 deletions(-)

diff --git a/gfs2/fsck/afterpass1_common.c b/gfs2/fsck/afterpass1_common.c
index b7476408..55a6c76b 100644
--- a/gfs2/fsck/afterpass1_common.c
+++ b/gfs2/fsck/afterpass1_common.c
@@ -175,10 +175,12 @@ int remove_dentry_from_dir(struct gfs2_sbd *sdp, uint=
64_t dir,
 =09return error;
 }
=20
-int delete_metadata(struct gfs2_inode *ip, uint64_t block,
-=09=09    struct gfs2_buffer_head **bh, int h, int *is_valid,
+int delete_metadata(struct iptr iptr, struct gfs2_buffer_head **bh, int h,=
 int *is_valid,
 =09=09    int *was_duplicate, void *private)
 {
+=09struct gfs2_inode *ip =3D iptr.ipt_ip;
+=09uint64_t block =3D iptr_block(iptr);
+
 =09*is_valid =3D 1;
 =09*was_duplicate =3D 0;
 =09return delete_block_if_notdup(ip, block, bh, _("metadata"),
diff --git a/gfs2/fsck/afterpass1_common.h b/gfs2/fsck/afterpass1_common.h
index 829828f7..74b913f3 100644
--- a/gfs2/fsck/afterpass1_common.h
+++ b/gfs2/fsck/afterpass1_common.h
@@ -2,9 +2,9 @@
 #define _AFTERPASS1_H
=20
 #include "util.h"
+#include "metawalk.h"
=20
-extern int delete_metadata(struct gfs2_inode *ip, uint64_t block,
-=09=09=09   struct gfs2_buffer_head **bh, int h, int *is_valid,
+extern int delete_metadata(struct iptr iptr, struct gfs2_buffer_head **bh,=
 int h, int *is_valid,
 =09=09=09   int *was_duplicate, void *private);
 extern int delete_leaf(struct gfs2_inode *ip, uint64_t block, void *privat=
e);
 extern int delete_data(struct gfs2_inode *ip, uint64_t metablock,
diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index 4c0932b8..84cd4cc9 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -636,11 +636,11 @@ static int rangecheck_jblock(struct gfs2_inode *ip, u=
int64_t block)
 =09return meta_is_good;
 }
=20
-static int rangecheck_jmeta(struct gfs2_inode *ip, uint64_t block,
-=09=09=09       struct gfs2_buffer_head **bh, int h,
-=09=09=09       int *is_valid, int *was_duplicate,
-=09=09=09       void *private)
+static int rangecheck_jmeta(struct iptr iptr, struct gfs2_buffer_head **bh=
, int h,
+                            int *is_valid, int *was_duplicate, void *priva=
te)
 {
+=09struct gfs2_inode *ip =3D iptr.ipt_ip;
+=09uint64_t block =3D iptr_block(iptr);
 =09int rc;
=20
 =09*bh =3D NULL;
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index 5792be56..d8bc211c 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -1210,9 +1210,11 @@ static void file_ra(struct gfs2_inode *ip, struct gf=
s2_buffer_head *bh,
 =09=09=09      extlen * sdp->bsize, POSIX_FADV_WILLNEED);
 }
=20
-static int do_check_metalist(struct gfs2_inode *ip, uint64_t block, int he=
ight,
-                             struct gfs2_buffer_head **bhp, struct metawal=
k_fxns *pass)
+static int do_check_metalist(struct iptr iptr, int height, struct gfs2_buf=
fer_head **bhp,
+                             struct metawalk_fxns *pass)
 {
+=09struct gfs2_inode *ip =3D iptr.ipt_ip;
+=09uint64_t block =3D iptr_block(iptr);
 =09int was_duplicate =3D 0;
 =09int is_valid =3D 1;
 =09int error;
@@ -1220,7 +1222,7 @@ static int do_check_metalist(struct gfs2_inode *ip, u=
int64_t block, int height,
 =09if (pass->check_metalist =3D=3D NULL)
 =09=09return 0;
=20
-=09error =3D pass->check_metalist(ip, block, bhp, height, &is_valid,
+=09error =3D pass->check_metalist(iptr, bhp, height, &is_valid,
 =09=09=09=09     &was_duplicate, pass->private);
 =09if (error =3D=3D meta_error) {
 =09=09stack;
@@ -1270,10 +1272,11 @@ static int build_and_check_metalist(struct gfs2_ino=
de *ip, osi_list_t *mlp,
 =09=09=09=09    struct metawalk_fxns *pass)
 {
 =09uint32_t height =3D ip->i_di.di_height;
-=09struct gfs2_buffer_head *bh, *nbh, *metabh =3D ip->i_bh;
+=09struct gfs2_buffer_head *metabh =3D ip->i_bh;
 =09osi_list_t *prev_list, *cur_list, *tmp;
+=09struct iptr iptr =3D { .ipt_ip =3D ip, 0};
 =09int h, head_size, iblk_type;
-=09uint64_t *ptr, block, *undoptr;
+=09uint64_t *undoptr;
 =09int maxptrs;
 =09int error;
=20
@@ -1313,39 +1316,37 @@ static int build_and_check_metalist(struct gfs2_ino=
de *ip, osi_list_t *mlp,
 =09=09prev_list =3D &mlp[h - 1];
 =09=09cur_list =3D &mlp[h];
=20
-=09=09for (tmp =3D prev_list->next; tmp !=3D prev_list; tmp =3D tmp->next)=
{
-=09=09=09bh =3D osi_list_entry(tmp, struct gfs2_buffer_head,
-=09=09=09=09=09    b_altlist);
-=09=09=09if (gfs2_check_meta(bh->b_data, iblk_type)) {
+=09=09for (tmp =3D prev_list->next; tmp !=3D prev_list; tmp =3D tmp->next)=
 {
+=09=09=09iptr.ipt_off =3D head_size;
+=09=09=09iptr.ipt_bh =3D osi_list_entry(tmp, struct gfs2_buffer_head, b_al=
tlist);
+
+=09=09=09if (gfs2_check_meta(iptr_buf(iptr), iblk_type)) {
 =09=09=09=09if (pass->invalid_meta_is_fatal)
 =09=09=09=09=09return meta_error;
=20
 =09=09=09=09continue;
 =09=09=09}
-
 =09=09=09if (pass->readahead)
-=09=09=09=09file_ra(ip, bh, head_size, maxptrs, h);
+=09=09=09=09file_ra(ip, iptr.ipt_bh, head_size, maxptrs, h);
+
 =09=09=09/* Now check the metadata itself */
-=09=09=09for (ptr =3D (uint64_t *)(bh->b_data + head_size);
-=09=09=09     (char *)ptr < (bh->b_data + ip->i_sbd->bsize);
-=09=09=09     ptr++) {
+=09=09=09for (; iptr.ipt_off < ip->i_sbd->bsize; iptr.ipt_off +=3D sizeof(=
uint64_t)) {
+=09=09=09=09struct gfs2_buffer_head *nbh =3D NULL;
+
 =09=09=09=09if (skip_this_pass || fsck_abort) {
 =09=09=09=09=09free_metalist(ip, mlp);
 =09=09=09=09=09return meta_is_good;
 =09=09=09=09}
-=09=09=09=09nbh =3D NULL;
-
-=09=09=09=09if (!*ptr)
+=09=09=09=09if (!iptr_block(iptr))
 =09=09=09=09=09continue;
=20
-=09=09=09=09block =3D be64_to_cpu(*ptr);
-=09=09=09=09error =3D do_check_metalist(ip, block, h, &nbh, pass);
+=09=09=09=09error =3D do_check_metalist(iptr, h, &nbh, pass);
 =09=09=09=09if (error =3D=3D meta_error || error =3D=3D meta_skip_further)
 =09=09=09=09=09goto error_undo;
 =09=09=09=09if (error =3D=3D meta_skip_one)
 =09=09=09=09=09continue;
 =09=09=09=09if (!nbh)
-=09=09=09=09=09nbh =3D bread(ip->i_sbd, block);
+=09=09=09=09=09nbh =3D bread(ip->i_sbd, iptr_block(iptr));
 =09=09=09=09osi_list_add_prev(&nbh->b_altlist, cur_list);
 =09=09=09} /* for all data on the indirect block */
 =09=09} /* for blocks at that height */
@@ -1356,16 +1357,16 @@ error_undo: /* undo what we've done so far for this=
 block */
 =09if (pass->undo_check_meta =3D=3D NULL)
 =09=09return error;
=20
-=09log_info(_("Undoing the work we did before the error on block %llu "
-=09=09   "(0x%llx).\n"), (unsigned long long)bh->b_blocknr,
-=09=09 (unsigned long long)bh->b_blocknr);
-=09for (undoptr =3D (uint64_t *)(bh->b_data + head_size); undoptr < ptr &&
-=09=09     (char *)undoptr < (bh->b_data + ip->i_sbd->bsize);
+=09log_info(_("Undoing the work we did before the error on block %"PRIu64"=
 (0x%"PRIx64").\n"),
+=09         iptr.ipt_bh->b_blocknr, iptr.ipt_bh->b_blocknr);
+=09for (undoptr =3D (uint64_t *)(iptr_buf(iptr) + head_size);
+=09     undoptr < iptr_ptr(iptr) && undoptr < iptr_endptr(iptr);
 =09     undoptr++) {
-=09=09if (!*undoptr)
+=09=09uint64_t block =3D be64_to_cpu(*undoptr);
+
+=09=09if (block =3D=3D 0)
 =09=09=09continue;
=20
-=09=09block =3D be64_to_cpu(*undoptr);
 =09=09pass->undo_check_meta(ip, block, h, pass->private);
 =09}
 =09return error;
diff --git a/gfs2/fsck/metawalk.h b/gfs2/fsck/metawalk.h
index b5a037a3..592479df 100644
--- a/gfs2/fsck/metawalk.h
+++ b/gfs2/fsck/metawalk.h
@@ -42,6 +42,17 @@ enum meta_check_rc {
 =09meta_skip_one =3D 2,
 };
=20
+struct iptr {
+=09struct gfs2_inode *ipt_ip;
+=09struct gfs2_buffer_head *ipt_bh;
+=09unsigned ipt_off;
+};
+
+#define iptr_ptr(i) ((uint64_t *)(i.ipt_bh->b_data + i.ipt_off))
+#define iptr_block(i) be64_to_cpu(*iptr_ptr(i))
+#define iptr_endptr(i) ((uint64_t *)(iptr.ipt_bh->b_data + i.ipt_ip->i_sbd=
->bsize))
+#define iptr_buf(i) (i.ipt_bh->b_data)
+
 /* metawalk_fxns: function pointers to check various parts of the fs
  *
  * The functions should return -1 on fatal errors, 1 if the block
@@ -66,7 +77,7 @@ struct metawalk_fxns {
 =09int (*check_leaf) (struct gfs2_inode *ip, uint64_t block,
 =09=09=09   void *private);
 =09/* parameters to the check_metalist sub-functions:
-=09   ip: incore inode pointer
+=09   iptr: reference to the inode and its indirect pointer that we're ana=
lyzing
 =09   block: block number of the metadata block to be checked
 =09   bh: buffer_head to be returned
 =09   h: height
@@ -79,7 +90,7 @@ struct metawalk_fxns {
 =09   returns: 0 - everything is good, but there may be duplicates
 =09            1 - skip further processing
 =09*/
-=09int (*check_metalist) (struct gfs2_inode *ip, uint64_t block,
+=09int (*check_metalist) (struct iptr iptr,
 =09=09=09       struct gfs2_buffer_head **bh, int h,
 =09=09=09       int *is_valid, int *was_duplicate,
 =09=09=09       void *private);
diff --git a/gfs2/fsck/pass1.c b/gfs2/fsck/pass1.c
index 442734ba..9f211eb6 100644
--- a/gfs2/fsck/pass1.c
+++ b/gfs2/fsck/pass1.c
@@ -39,9 +39,8 @@ struct block_count {
 };
=20
 static int p1check_leaf(struct gfs2_inode *ip, uint64_t block, void *priva=
te);
-static int pass1_check_metalist(struct gfs2_inode *ip, uint64_t block,
-=09=09=09  struct gfs2_buffer_head **bh, int h, int *is_valid,
-=09=09=09  int *was_duplicate, void *private);
+static int pass1_check_metalist(struct iptr iptr, struct gfs2_buffer_head =
**bh, int h,
+                                int *is_valid, int *was_duplicate, void *p=
rivate);
 static int undo_check_metalist(struct gfs2_inode *ip, uint64_t block,
 =09=09=09       int h, void *private);
 static int pass1_check_data(struct gfs2_inode *ip, uint64_t metablock,
@@ -69,10 +68,8 @@ static int check_extended_leaf_eattr(struct gfs2_inode *=
ip, int i,
 =09=09=09=09     void *private);
 static int finish_eattr_indir(struct gfs2_inode *ip, int leaf_pointers,
 =09=09=09      int leaf_pointer_errors, void *private);
-static int invalidate_metadata(struct gfs2_inode *ip, uint64_t block,
-=09=09=09       struct gfs2_buffer_head **bh, int h,
-=09=09=09       int *is_valid, int *was_duplicate,
-=09=09=09       void *private);
+static int invalidate_metadata(struct iptr iptr, struct gfs2_buffer_head *=
*bh, int h,
+                               int *is_valid, int *was_duplicate, void *pr=
ivate);
 static int invalidate_leaf(struct gfs2_inode *ip, uint64_t block,
 =09=09=09   void *private);
 static int invalidate_data(struct gfs2_inode *ip, uint64_t metablock,
@@ -223,12 +220,12 @@ struct metawalk_fxns invalidate_fxns =3D {
  * marked "in use" by the bitmap.  You don't want root's indirect blocks
  * deleted, do you? Or worse, reused for lost+found.
  */
-static int resuscitate_metalist(struct gfs2_inode *ip, uint64_t block,
-=09=09=09=09struct gfs2_buffer_head **bh, int h,
-=09=09=09=09int *is_valid, int *was_duplicate,
-=09=09=09=09void *private)
+static int resuscitate_metalist(struct iptr iptr, struct gfs2_buffer_head =
**bh, int h,
+                                int *is_valid, int *was_duplicate, void *p=
rivate)
 {
 =09struct block_count *bc =3D (struct block_count *)private;
+=09struct gfs2_inode *ip =3D iptr.ipt_ip;
+=09uint64_t block =3D iptr_block(iptr);
=20
 =09*is_valid =3D 1;
 =09*was_duplicate =3D 0;
@@ -344,15 +341,16 @@ static int p1check_leaf(struct gfs2_inode *ip, uint64=
_t block, void *private)
 =09return 0;
 }
=20
-static int pass1_check_metalist(struct gfs2_inode *ip, uint64_t block,
-=09=09=09  struct gfs2_buffer_head **bh, int h, int *is_valid,
-=09=09=09  int *was_duplicate, void *private)
+static int pass1_check_metalist(struct iptr iptr, struct gfs2_buffer_head =
**bh, int h,
+                                int *is_valid, int *was_duplicate, void *p=
rivate)
 {
-=09int q;
-=09int iblk_type;
-=09struct gfs2_buffer_head *nbh;
 =09struct block_count *bc =3D (struct block_count *)private;
+=09struct gfs2_inode *ip =3D iptr.ipt_ip;
+=09uint64_t block =3D iptr_block(iptr);
+=09struct gfs2_buffer_head *nbh;
 =09const char *blktypedesc;
+=09int iblk_type;
+=09int q;
=20
 =09*bh =3D NULL;
=20
@@ -1111,11 +1109,12 @@ static int mark_block_invalid(struct gfs2_inode *ip=
, uint64_t block,
 =09return meta_is_good;
 }
=20
-static int invalidate_metadata(struct gfs2_inode *ip, uint64_t block,
-=09=09=09       struct gfs2_buffer_head **bh, int h,
-=09=09=09       int *is_valid, int *was_duplicate,
-=09=09=09       void *private)
+static int invalidate_metadata(struct iptr iptr, struct gfs2_buffer_head *=
*bh, int h,
+                               int *is_valid, int *was_duplicate, void *pr=
ivate)
 {
+=09struct gfs2_inode *ip =3D iptr.ipt_ip;
+=09uint64_t block =3D iptr_block(iptr);
+
 =09*is_valid =3D 1;
 =09*was_duplicate =3D 0;
 =09return mark_block_invalid(ip, block, ref_as_meta, _("metadata"),
@@ -1214,11 +1213,12 @@ static int rangecheck_block(struct gfs2_inode *ip, =
uint64_t block,
 =09return meta_is_good;
 }
=20
-static int rangecheck_metadata(struct gfs2_inode *ip, uint64_t block,
-=09=09=09       struct gfs2_buffer_head **bh, int h,
-=09=09=09       int *is_valid, int *was_duplicate,
-=09=09=09       void *private)
+static int rangecheck_metadata(struct iptr iptr, struct gfs2_buffer_head *=
*bh, int h,
+                               int *is_valid, int *was_duplicate, void *pr=
ivate)
 {
+=09struct gfs2_inode *ip =3D iptr.ipt_ip;
+=09uint64_t block =3D iptr_block(iptr);
+
 =09*is_valid =3D 1;
 =09*was_duplicate =3D 0;
 =09return rangecheck_block(ip, block, bh, btype_meta, private);
@@ -1317,12 +1317,13 @@ static int set_ip_blockmap(struct gfs2_inode *ip)
 =09return 0;
 }
=20
-static int alloc_metalist(struct gfs2_inode *ip, uint64_t block,
-=09=09=09  struct gfs2_buffer_head **bh, int h, int *is_valid,
-=09=09=09  int *was_duplicate, void *private)
+static int alloc_metalist(struct iptr iptr, struct gfs2_buffer_head **bh, =
int h,
+                          int *is_valid, int *was_duplicate, void *private=
)
 {
-=09int q;
 =09const char *desc =3D (const char *)private;
+=09struct gfs2_inode *ip =3D iptr.ipt_ip;
+=09uint64_t block =3D iptr_block(iptr);
+=09int q;
=20
 =09/* No need to range_check here--if it was added, it's in range. */
 =09/* We can't check the bitmap here because this function is called
diff --git a/gfs2/fsck/pass1b.c b/gfs2/fsck/pass1b.c
index 574622bf..91d7fa53 100644
--- a/gfs2/fsck/pass1b.c
+++ b/gfs2/fsck/pass1b.c
@@ -69,9 +69,8 @@ static void log_inode_reference(struct duptree *dt, osi_l=
ist_t *tmp, int inval)
 =09=09  (unsigned long long)dt->block, reftypestring);
 }
=20
-static int findref_meta(struct gfs2_inode *ip, uint64_t block,
-=09=09=09struct gfs2_buffer_head **bh, int h,
-=09=09=09int *is_valid, int *was_duplicate, void *private)
+static int findref_meta(struct iptr iptr, struct gfs2_buffer_head **bh, in=
t h,
+                        int *is_valid, int *was_duplicate, void *private)
 {
 =09*is_valid =3D 1;
 =09*was_duplicate =3D 0;
@@ -393,10 +392,12 @@ static void resolve_dup_references(struct gfs2_sbd *s=
dp, struct duptree *dt,
 =09return;
 }
=20
-static int clone_check_meta(struct gfs2_inode *ip, uint64_t block,
-=09=09=09    struct gfs2_buffer_head **bh, int h,
-=09=09=09    int *is_valid, int *was_duplicate, void *private)
+static int clone_check_meta(struct iptr iptr, struct gfs2_buffer_head **bh=
, int h,
+                            int *is_valid, int *was_duplicate, void *priva=
te)
 {
+=09struct gfs2_inode *ip =3D iptr.ipt_ip;
+=09uint64_t block =3D iptr_block(iptr);
+
 =09*was_duplicate =3D 0;
 =09*is_valid =3D 1;
 =09*bh =3D bread(ip->i_sbd, block);
@@ -788,11 +789,12 @@ static int check_leaf_refs(struct gfs2_inode *ip, uin=
t64_t block,
 =09return add_duplicate_ref(ip, block, ref_as_meta, 1, INODE_VALID);
 }
=20
-static int check_metalist_refs(struct gfs2_inode *ip, uint64_t block,
-=09=09=09       struct gfs2_buffer_head **bh, int h,
-=09=09=09       int *is_valid, int *was_duplicate,
-=09=09=09       void *private)
+static int check_metalist_refs(struct iptr iptr, struct gfs2_buffer_head *=
*bh, int h,
+                               int *is_valid, int *was_duplicate, void *pr=
ivate)
 {
+=09struct gfs2_inode *ip =3D iptr.ipt_ip;
+=09uint64_t block =3D iptr_block(iptr);
+
 =09*was_duplicate =3D 0;
 =09*is_valid =3D 1;
 =09return add_duplicate_ref(ip, block, ref_as_meta, 1, INODE_VALID);
diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 0a54c9be..3c1fae06 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -1873,10 +1873,12 @@ struct metawalk_fxns pass2_fxns =3D {
 =09.repair_leaf =3D pass2_repair_leaf,
 };
=20
-static int check_metalist_qc(struct gfs2_inode *ip, uint64_t block,
-=09=09=09     struct gfs2_buffer_head **bh, int h,
-=09=09=09     int *is_valid, int *was_duplicate, void *private)
+static int check_metalist_qc(struct iptr iptr, struct gfs2_buffer_head **b=
h, int h,
+                             int *is_valid, int *was_duplicate, void *priv=
ate)
 {
+=09struct gfs2_inode *ip =3D iptr.ipt_ip;
+=09uint64_t block =3D iptr_block(iptr);
+
 =09*was_duplicate =3D 0;
 =09*is_valid =3D 1;
 =09*bh =3D bread(ip->i_sbd, block);
--=20
2.21.0

