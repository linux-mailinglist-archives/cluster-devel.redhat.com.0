Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FAA8D8C0
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Aug 2019 19:02:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 133DA309BDA2;
	Wed, 14 Aug 2019 17:02:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0FE48E7BD;
	Wed, 14 Aug 2019 17:02:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CCA2718005A4;
	Wed, 14 Aug 2019 17:02:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EH1HsJ028914 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 13:01:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF63183078; Wed, 14 Aug 2019 17:01:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F14B5832BD
	for <cluster-devel@redhat.com>; Wed, 14 Aug 2019 17:01:16 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Aug 2019 18:01:03 +0100
Message-Id: <20190814170105.8775-4-anprice@redhat.com>
In-Reply-To: <20190814170105.8775-1-anprice@redhat.com>
References: <20190814170105.8775-1-anprice@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 3/5] fsck.gfs2: Use the new list.h
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Wed, 14 Aug 2019 17:02:15 +0000 (UTC)

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/fs_recovery.c | 29 +++++++++---------
 gfs2/fsck/fsck.h        |  7 +++--
 gfs2/fsck/inode_hash.c  |  1 -
 gfs2/fsck/main.c        |  1 -
 gfs2/fsck/metawalk.c    |  4 +--
 gfs2/fsck/pass1b.c      | 34 ++++++++++-----------
 gfs2/fsck/pass3.c       |  1 -
 gfs2/fsck/rgrepair.c    |  1 -
 gfs2/fsck/util.c        | 66 +++++++++++++++++++----------------------
 9 files changed, 69 insertions(+), 75 deletions(-)

diff --git a/gfs2/fsck/fs_recovery.c b/gfs2/fsck/fs_recovery.c
index 4c0932b8..0da77453 100644
--- a/gfs2/fsck/fs_recovery.c
+++ b/gfs2/fsck/fs_recovery.c
@@ -10,6 +10,7 @@
 #define _(String) gettext(String)
 
 #include <logging.h>
+#include <list.h>
 #include "fsck.h"
 #include "fs_recovery.h"
 #include "libgfs2.h"
@@ -22,23 +23,23 @@
 unsigned int sd_found_jblocks = 0, sd_replayed_jblocks = 0;
 unsigned int sd_found_metablocks = 0, sd_replayed_metablocks = 0;
 unsigned int sd_found_revokes = 0;
-osi_list_t sd_revoke_list;
+struct list_head sd_revoke_list;
 unsigned int sd_replay_tail;
 
 struct gfs2_revoke_replay {
-	osi_list_t rr_list;
+	struct list_head rr_list;
 	uint64_t rr_blkno;
 	unsigned int rr_where;
 };
 
 int gfs2_revoke_add(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
 {
-	osi_list_t *tmp, *head = &sd_revoke_list;
+	struct list_head *tmp, *head = &sd_revoke_list;
 	struct gfs2_revoke_replay *rr;
 	int found = 0;
 
-	osi_list_foreach(tmp, head) {
-		rr = osi_list_entry(tmp, struct gfs2_revoke_replay, rr_list);
+	list_for_each(tmp, head) {
+		rr = list_entry(tmp, struct gfs2_revoke_replay, rr_list);
 		if (rr->rr_blkno == blkno) {
 			found = 1;
 			break;
@@ -56,19 +57,19 @@ int gfs2_revoke_add(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
 
 	rr->rr_blkno = blkno;
 	rr->rr_where = where;
-	osi_list_add(&rr->rr_list, head);
+	list_add(&rr->rr_list, head);
 	return 1;
 }
 
 int gfs2_revoke_check(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
 {
-	osi_list_t *tmp;
+	struct list_head *tmp;
 	struct gfs2_revoke_replay *rr;
 	int wrap, a, b;
 	int found = 0;
 
-	osi_list_foreach(tmp, &sd_revoke_list) {
-		rr = osi_list_entry(tmp, struct gfs2_revoke_replay, rr_list);
+	list_for_each(tmp, &sd_revoke_list) {
+		rr = list_entry(tmp, struct gfs2_revoke_replay, rr_list);
 		if (rr->rr_blkno == blkno) {
 			found = 1;
 			break;
@@ -86,12 +87,12 @@ int gfs2_revoke_check(struct gfs2_sbd *sdp, uint64_t blkno, unsigned int where)
 
 void gfs2_revoke_clean(struct gfs2_sbd *sdp)
 {
-	osi_list_t *head = &sd_revoke_list;
+	struct list_head *head = &sd_revoke_list;
 	struct gfs2_revoke_replay *rr;
 
-	while (!osi_list_empty(head)) {
-		rr = osi_list_entry(head->next, struct gfs2_revoke_replay, rr_list);
-		osi_list_del(&rr->rr_list);
+	while (!list_empty(head)) {
+		rr = list_entry(head->next, struct gfs2_revoke_replay, rr_list);
+		list_del(&rr->rr_list);
 		free(rr);
 	}
 }
@@ -502,7 +503,7 @@ static int gfs2_recover_journal(struct gfs2_inode *ip, int j, int preen,
 	*was_clean = 0;
 	log_info( _("jid=%u: Looking at journal...\n"), j);
 
-	osi_list_init(&sd_revoke_list);
+	INIT_LIST_HEAD(&sd_revoke_list);
 	error = gfs2_find_jhead(ip, &head);
 	if (!error) {
 		error = check_journal_seq_no(ip, 0);
diff --git a/gfs2/fsck/fsck.h b/gfs2/fsck/fsck.h
index 877448c3..13376a87 100644
--- a/gfs2/fsck/fsck.h
+++ b/gfs2/fsck/fsck.h
@@ -1,6 +1,7 @@
 #ifndef _FSCK_H
 #define _FSCK_H
 
+#include <list.h>
 #include "libgfs2.h"
 #include "osi_tree.h"
 
@@ -69,8 +70,8 @@ struct duptree {
 	int dup_flags;
 	int refs;
 	uint64_t block;
-	osi_list_t ref_inode_list; /* list of inodes referencing a dup block */
-	osi_list_t ref_invinode_list; /* list of invalid inodes referencing */
+	struct list_head ref_inode_list; /* list of inodes referencing a dup block */
+	struct list_head ref_invinode_list; /* list of invalid inodes referencing */
 };
 
 enum dup_ref_type {
@@ -84,7 +85,7 @@ enum dup_ref_type {
 };
 
 struct inode_with_dups {
-	osi_list_t list;
+	struct list_head list;
 	uint64_t block_no;
 	int dup_count;
 	int reftypecount[ref_types];
diff --git a/gfs2/fsck/inode_hash.c b/gfs2/fsck/inode_hash.c
index 09303d73..6f57733e 100644
--- a/gfs2/fsck/inode_hash.c
+++ b/gfs2/fsck/inode_hash.c
@@ -7,7 +7,6 @@
 
 #include <logging.h>
 #include "libgfs2.h"
-#include "osi_list.h"
 #include "inode_hash.h"
 #include "fsck.h"
 #define _(String) gettext(String)
diff --git a/gfs2/fsck/main.c b/gfs2/fsck/main.c
index ecdcd0f6..3f06d61b 100644
--- a/gfs2/fsck/main.c
+++ b/gfs2/fsck/main.c
@@ -21,7 +21,6 @@
 #include "libgfs2.h"
 #include "fsck.h"
 #include "link.h"
-#include "osi_list.h"
 #include "metawalk.h"
 #include "util.h"
 
diff --git a/gfs2/fsck/metawalk.c b/gfs2/fsck/metawalk.c
index d256dd2f..3b8fefab 100644
--- a/gfs2/fsck/metawalk.c
+++ b/gfs2/fsck/metawalk.c
@@ -1585,7 +1585,7 @@ int check_metatree(struct gfs2_inode *ip, struct metawalk_fxns *pass)
 			free_metalist(ip, &metalist[0]);
 			return 0;
 		}
-		bh = osi_list_entry(tmp, struct gfs2_buffer_head, b_altlist);
+		bh = list_entry(tmp, struct gfs2_buffer_head, b_altlist);
 		head_size = hdr_size(bh, height);
 		if (!head_size)
 			continue;
@@ -1625,7 +1625,7 @@ undo_metalist:
 	for (i = 0; pass->undo_check_meta && i < height; i++) {
 		while (!osi_list_empty(&metalist[i])) {
 			list = &metalist[i];
-			bh = osi_list_entry(list->next,
+			bh = list_entry(list->next,
 					    struct gfs2_buffer_head,
 					    b_altlist);
 			log_err(_("Undoing metadata work for block %llu "
diff --git a/gfs2/fsck/pass1b.c b/gfs2/fsck/pass1b.c
index 574622bf..a6dbf887 100644
--- a/gfs2/fsck/pass1b.c
+++ b/gfs2/fsck/pass1b.c
@@ -9,10 +9,10 @@
 #define _(String) gettext(String)
 
 #include <logging.h>
+#include <list.h>
 #include "libgfs2.h"
 #include "link.h"
 #include "fsck.h"
-#include "osi_list.h"
 #include "util.h"
 #include "metawalk.h"
 #include "inode_hash.h"
@@ -45,12 +45,12 @@ static int clone_data(struct gfs2_inode *ip, uint64_t metablock,
 		      uint64_t block, void *private,
 		      struct gfs2_buffer_head *bh, uint64_t *ptr);
 
-static void log_inode_reference(struct duptree *dt, osi_list_t *tmp, int inval)
+static void log_inode_reference(struct duptree *dt, struct list_head *tmp, int inval)
 {
 	char reftypestring[32];
 	struct inode_with_dups *id;
 
-	id = osi_list_entry(tmp, struct inode_with_dups, list);
+	id = list_entry(tmp, struct inode_with_dups, list);
 	if (id->dup_count == 1)
 		sprintf(reftypestring, "as %s", reftypes[get_ref_type(id)]);
 	else
@@ -145,7 +145,7 @@ static void clone_data_block(struct gfs2_sbd *sdp, struct duptree *dt,
  */
 static void revise_dup_handler(uint64_t dup_blk, struct dup_handler *dh)
 {
-	osi_list_t *tmp;
+	struct list_head *tmp;
 	struct duptree *dt;
 	struct inode_with_dups *id;
 
@@ -159,13 +159,13 @@ static void revise_dup_handler(uint64_t dup_blk, struct dup_handler *dh)
 
 	dh->dt = dt;
 	/* Count the duplicate references, both valid and invalid */
-	osi_list_foreach(tmp, &dt->ref_invinode_list) {
-		id = osi_list_entry(tmp, struct inode_with_dups, list);
+	list_for_each(tmp, &dt->ref_invinode_list) {
+		id = list_entry(tmp, struct inode_with_dups, list);
 		dh->ref_inode_count++;
 		dh->ref_count += id->dup_count;
 	}
-	osi_list_foreach(tmp, &dt->ref_inode_list) {
-		id = osi_list_entry(tmp, struct inode_with_dups, list);
+	list_for_each(tmp, &dt->ref_inode_list) {
+		id = list_entry(tmp, struct inode_with_dups, list);
 		dh->ref_inode_count++;
 		dh->ref_count += id->dup_count;
 	}
@@ -185,13 +185,13 @@ static void revise_dup_handler(uint64_t dup_blk, struct dup_handler *dh)
  *                  _but_ this type.  Try to save references as this type.
  */
 static void resolve_dup_references(struct gfs2_sbd *sdp, struct duptree *dt,
-				   osi_list_t *ref_list,
+				   struct list_head *ref_list,
 				   struct dup_handler *dh,
 				   int inval, int acceptable_ref)
 {
 	struct gfs2_inode *ip;
 	struct inode_with_dups *id;
-	osi_list_t *tmp, *x;
+	struct list_head *tmp, *x;
 	struct metawalk_fxns pass1b_fxns_delete = {
 		.private = NULL,
 		.check_metalist = delete_metadata,
@@ -208,11 +208,11 @@ static void resolve_dup_references(struct gfs2_sbd *sdp, struct duptree *dt,
 	int found_good_ref = 0;
 	int q;
 
-	osi_list_foreach_safe(tmp, ref_list, x) {
+	list_for_each_safe(tmp, x, ref_list) {
 		if (skip_this_pass || fsck_abort)
 			return;
 
-		id = osi_list_entry(tmp, struct inode_with_dups, list);
+		id = list_entry(tmp, struct inode_with_dups, list);
 		dh->dt = dt;
 
 		if (dh->ref_inode_count == 1) /* down to the last reference */
@@ -553,7 +553,7 @@ static void resolve_last_reference(struct gfs2_sbd *sdp, struct duptree *dt,
 {
 	struct gfs2_inode *ip;
 	struct inode_with_dups *id;
-	osi_list_t *tmp;
+	struct list_head *tmp;
 	int q;
 
 	log_notice( _("Block %llu (0x%llx) has only one remaining "
@@ -566,7 +566,7 @@ static void resolve_last_reference(struct gfs2_sbd *sdp, struct duptree *dt,
 	   from invalid to data or metadata. Start at the first one
 	   in the list, not the structure's place holder. */
 	tmp = dt->ref_inode_list.next;
-	id = osi_list_entry(tmp, struct inode_with_dups, list);
+	id = list_entry(tmp, struct inode_with_dups, list);
 	log_debug( _("----------------------------------------------\n"
 		     "Step 4. Set block type based on the remaining "
 		     "reference in inode %lld (0x%llx).\n"),
@@ -648,7 +648,7 @@ static void resolve_last_reference(struct gfs2_sbd *sdp, struct duptree *dt,
  */
 static int handle_dup_blk(struct gfs2_sbd *sdp, struct duptree *dt)
 {
-	osi_list_t *tmp;
+	struct list_head *tmp;
 	struct dup_handler dh = {0};
 	struct gfs2_buffer_head *bh;
 	uint32_t cmagic, ctype;
@@ -665,9 +665,9 @@ static int handle_dup_blk(struct gfs2_sbd *sdp, struct duptree *dt)
 		    (unsigned long long)dt->block,
 		    dh.ref_inode_count, dh.ref_count);
 
-	osi_list_foreach(tmp, &dt->ref_invinode_list)
+	list_for_each(tmp, &dt->ref_invinode_list)
 		log_inode_reference(dt, tmp, 1);
-	osi_list_foreach(tmp, &dt->ref_inode_list)
+	list_for_each(tmp, &dt->ref_inode_list)
 		log_inode_reference(dt, tmp, 0);
 
 	/* Figure out the block type to see if we can eliminate references
diff --git a/gfs2/fsck/pass3.c b/gfs2/fsck/pass3.c
index 4b9c54d8..daac4ba7 100644
--- a/gfs2/fsck/pass3.c
+++ b/gfs2/fsck/pass3.c
@@ -10,7 +10,6 @@
 
 #include <logging.h>
 #include "libgfs2.h"
-#include "osi_list.h"
 #include "fsck.h"
 #include "lost_n_found.h"
 #include "link.h"
diff --git a/gfs2/fsck/rgrepair.c b/gfs2/fsck/rgrepair.c
index ac44efd2..76dd0eba 100644
--- a/gfs2/fsck/rgrepair.c
+++ b/gfs2/fsck/rgrepair.c
@@ -12,7 +12,6 @@
 
 #include <logging.h>
 #include "libgfs2.h"
-#include "osi_list.h"
 #include "fsck.h"
 #include "fs_recovery.h"
 
diff --git a/gfs2/fsck/util.c b/gfs2/fsck/util.c
index 1c3ed9c3..663217fa 100644
--- a/gfs2/fsck/util.c
+++ b/gfs2/fsck/util.c
@@ -13,6 +13,7 @@
 #define _(String) gettext(String)
 
 #include <logging.h>
+#include <list.h>
 #include "libgfs2.h"
 #include "metawalk.h"
 #include "util.h"
@@ -261,8 +262,8 @@ static struct duptree *gfs2_dup_set(uint64_t dblock, int create)
 	dt->block = dblock;
 	dt->refs = 1; /* reference 1 is actually the reference we need to
 			 discover in pass1b. */
-	osi_list_init(&dt->ref_inode_list);
-	osi_list_init(&dt->ref_invinode_list);
+	INIT_LIST_HEAD(&dt->ref_inode_list);
+	INIT_LIST_HEAD(&dt->ref_invinode_list);
 	osi_link_node(&dt->node, parent, newn);
 	osi_insert_color(&dt->node, &dup_blocks);
 
@@ -275,17 +276,17 @@ static struct duptree *gfs2_dup_set(uint64_t dblock, int create)
 struct inode_with_dups *find_dup_ref_inode(struct duptree *dt,
 					   struct gfs2_inode *ip)
 {
-	osi_list_t *ref;
+	struct list_head *ref;
 	struct inode_with_dups *id;
 
-	osi_list_foreach(ref, &dt->ref_invinode_list) {
-		id = osi_list_entry(ref, struct inode_with_dups, list);
+	list_for_each(ref, &dt->ref_invinode_list) {
+		id = list_entry(ref, struct inode_with_dups, list);
 
 		if (id->block_no == ip->i_di.di_num.no_addr)
 			return id;
 	}
-	osi_list_foreach(ref, &dt->ref_inode_list) {
-		id = osi_list_entry(ref, struct inode_with_dups, list);
+	list_for_each(ref, &dt->ref_inode_list) {
+		id = list_entry(ref, struct inode_with_dups, list);
 
 		if (id->block_no == ip->i_di.di_num.no_addr)
 			return id;
@@ -298,17 +299,17 @@ struct inode_with_dups *find_dup_ref_inode(struct duptree *dt,
  */
 int count_dup_meta_refs(struct duptree *dt)
 {
-	osi_list_t *ref;
+	struct list_head *ref;
 	struct inode_with_dups *id;
 	int metarefs = 0;
 
-	osi_list_foreach(ref, &dt->ref_invinode_list) {
-		id = osi_list_entry(ref, struct inode_with_dups, list);
+	list_for_each(ref, &dt->ref_invinode_list) {
+		id = list_entry(ref, struct inode_with_dups, list);
 		if (id->reftypecount[ref_as_meta])
 			metarefs++;
 	}
-	osi_list_foreach(ref, &dt->ref_inode_list) {
-		id = osi_list_entry(ref, struct inode_with_dups, list);
+	list_for_each(ref, &dt->ref_inode_list) {
+		id = list_entry(ref, struct inode_with_dups, list);
 		if (id->reftypecount[ref_as_meta])
 			metarefs++;
 	}
@@ -398,7 +399,7 @@ int add_duplicate_ref(struct gfs2_inode *ip, uint64_t block,
 		/* If it's an invalid dinode, put it first on the invalid
 		   inode reference list otherwise put it on the normal list. */
 		if (!inode_valid || q == GFS2_BLKST_UNLINKED)
-			osi_list_add_prev(&id->list, &dt->ref_invinode_list);
+			list_add_tail(&id->list, &dt->ref_invinode_list);
 		else {
 			/* If this is a system dinode, we want the duplicate
 			   processing to find it first. That way references
@@ -406,10 +407,9 @@ int add_duplicate_ref(struct gfs2_inode *ip, uint64_t block,
 			   We don't want to delete journals in favor of dinodes
 			   that reference a block inside a journal. */
 			if (fsck_system_inode(ip->i_sbd, id->block_no))
-				osi_list_add(&id->list, &dt->ref_inode_list);
+				list_add(&id->list, &dt->ref_inode_list);
 			else
-				osi_list_add_prev(&id->list,
-						  &dt->ref_inode_list);
+				list_add_tail(&id->list, &dt->ref_inode_list);
 		}
 	}
 	id->reftypecount[reftype]++;
@@ -518,23 +518,23 @@ void dup_listent_delete(struct duptree *dt, struct inode_with_dups *id)
 	dt->refs--; /* one less reference */
 	if (id->name)
 		free(id->name);
-	osi_list_del(&id->list);
+	list_del(&id->list);
 	free(id);
 }
 
 void dup_delete(struct duptree *dt)
 {
 	struct inode_with_dups *id;
-	osi_list_t *tmp;
+	struct list_head *tmp;
 
-	while (!osi_list_empty(&dt->ref_invinode_list)) {
+	while (!list_empty(&dt->ref_invinode_list)) {
 		tmp = (&dt->ref_invinode_list)->next;
-		id = osi_list_entry(tmp, struct inode_with_dups, list);
+		id = list_entry(tmp, struct inode_with_dups, list);
 		dup_listent_delete(dt, id);
 	}
-	while (!osi_list_empty(&dt->ref_inode_list)) {
+	while (!list_empty(&dt->ref_inode_list)) {
 		tmp = (&dt->ref_inode_list)->next;
-		id = osi_list_entry(tmp, struct inode_with_dups, list);
+		id = list_entry(tmp, struct inode_with_dups, list);
 		dup_listent_delete(dt, id);
 	}
 	osi_erase(&dt->node, &dup_blocks);
@@ -608,7 +608,7 @@ void delete_all_dups(struct gfs2_inode *ip)
 {
 	struct osi_node *n, *next;
 	struct duptree *dt;
-	osi_list_t *tmp, *x;
+	struct list_head *tmp, *x;
 	struct inode_with_dups *id;
 	int found;
 
@@ -619,15 +619,15 @@ void delete_all_dups(struct gfs2_inode *ip)
 		found = 0;
 		id = NULL;
 
-		osi_list_foreach_safe(tmp, &dt->ref_invinode_list, x) {
-			id = osi_list_entry(tmp, struct inode_with_dups, list);
+		list_for_each_safe(tmp, x, &dt->ref_invinode_list) {
+			id = list_entry(tmp, struct inode_with_dups, list);
 			if (id->block_no == ip->i_di.di_num.no_addr) {
 				dup_listent_delete(dt, id);
 				found = 1;
 			}
 		}
-		osi_list_foreach_safe(tmp, &dt->ref_inode_list, x) {
-			id = osi_list_entry(tmp, struct inode_with_dups, list);
+		list_for_each_safe(tmp, x, &dt->ref_inode_list) {
+			id = list_entry(tmp, struct inode_with_dups, list);
 			if (id->block_no == ip->i_di.di_num.no_addr) {
 				dup_listent_delete(dt, id);
 				found = 1;
@@ -648,14 +648,10 @@ void delete_all_dups(struct gfs2_inode *ip)
 				continue;
 
 			id = NULL;
-			osi_list_foreach(tmp, &dt->ref_invinode_list)
-				id = osi_list_entry(tmp,
-						    struct inode_with_dups,
-						    list);
-			osi_list_foreach(tmp, &dt->ref_inode_list)
-				id = osi_list_entry(tmp,
-						    struct inode_with_dups,
-						    list);
+			list_for_each(tmp, &dt->ref_invinode_list)
+				id = list_entry(tmp, struct inode_with_dups, list);
+			list_for_each(tmp, &dt->ref_inode_list)
+				id = list_entry(tmp, struct inode_with_dups, list);
 			if (id)
 				log_debug("Last reference is from inode "
 					  "0x%llx\n",
-- 
2.21.0

