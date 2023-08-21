Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C22782E61
	for <lists+cluster-devel@lfdr.de>; Mon, 21 Aug 2023 18:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692635155;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wEo0lAcPJIAhVkpcF6b8fuV6xRSYb5TQrzAt5JqbjAc=;
	b=dkYAeyqyZDn33xTxikZ2/EIODyjlbk/u2fArR7OnhQSVpY/p5oMgm+BdJCVotjM1BWSRZw
	dEtSe0GPaBMOT5FORUQeyC0NgEI/zP6sluacgO/bLCfy5P2IHoKUiPstUOdkb1PY9MQ/9Q
	QjW9T8aevruenhIdkhbo+MF2Lfj/x4Q=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-g9332KArM6GniHWzty1nQA-1; Mon, 21 Aug 2023 12:25:52 -0400
X-MC-Unique: g9332KArM6GniHWzty1nQA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18B1828EC106;
	Mon, 21 Aug 2023 16:25:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C44C492C13;
	Mon, 21 Aug 2023 16:25:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5AAB61946589;
	Mon, 21 Aug 2023 16:25:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AD0131946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 21 Aug 2023 16:25:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 96E3F492C1B; Mon, 21 Aug 2023 16:25:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A05C492C13;
 Mon, 21 Aug 2023 16:25:48 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 21 Aug 2023 12:25:38 -0400
Message-Id: <20230821162540.594227-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH dlm-tool 1/3] dlm_controld: update rbtree
 implementation
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch updates the rbtree implementation taken from the Linux
kernel.
---
 README.license                  |   3 +
 dlm_controld/linux_helpers.h    |  11 +
 dlm_controld/list.h             |   1 -
 dlm_controld/rbtree.c           | 724 +++++++++++++++++++++-----------
 dlm_controld/rbtree.h           | 393 ++++++++++++-----
 dlm_controld/rbtree_augmented.h | 303 +++++++++++++
 dlm_controld/rbtree_types.h     |  34 ++
 7 files changed, 1097 insertions(+), 372 deletions(-)
 create mode 100644 dlm_controld/linux_helpers.h
 create mode 100644 dlm_controld/rbtree_augmented.h
 create mode 100644 dlm_controld/rbtree_types.h

diff --git a/README.license b/README.license
index ededf669..d53f5894 100644
--- a/README.license
+++ b/README.license
@@ -7,10 +7,13 @@ libdlm/libdlm_internal.h
 GPLv2
 
 dlm_controld/list.h (copied from linux kernel)
+dlm_controld/linux_helpers.h (various GPLv2 functions copied from linux kernel)
 
 GPLv2+
 
 dlm_controld/rbtree.c (copied from linux kernel)
 dlm_controld/rbtree.h (copied from linux kernel)
+dlm_controld/rbtree_augmented.h (copied from linux kernel)
+dlm_controld/rbtree_types.h (copied from linux kernel)
 all other original files
 
diff --git a/dlm_controld/linux_helpers.h b/dlm_controld/linux_helpers.h
new file mode 100644
index 00000000..5ef13466
--- /dev/null
+++ b/dlm_controld/linux_helpers.h
@@ -0,0 +1,11 @@
+/*  Copied from linux kernel */
+
+#ifndef __DLM_LINUX_HELPERS__
+#define __DLM_LINUX_HELPERS__
+
+#define WRITE_ONCE(x, val)				\
+do {							\
+	*(volatile typeof(x) *)&(x) = (val);		\
+} while (0)
+
+#endif /* __DLM_LINUX_HELPERS__ */
diff --git a/dlm_controld/list.h b/dlm_controld/list.h
index 8100cbc7..a2a5e5f3 100644
--- a/dlm_controld/list.h
+++ b/dlm_controld/list.h
@@ -15,7 +15,6 @@
 	const typeof( ((type *)0)->member ) *__mptr = (ptr);    \
 	(type *)( (char *)__mptr - offsetof(type,member) );})
 
-
 /*
  * These are non-NULL pointers that will result in page faults
  * under normal circumstances, used to verify that nobody uses
diff --git a/dlm_controld/rbtree.c b/dlm_controld/rbtree.c
index 9f49917d..d07ffc29 100644
--- a/dlm_controld/rbtree.c
+++ b/dlm_controld/rbtree.c
@@ -1,284 +1,458 @@
+/* Copied from linux/lib/rbtree.c */
 /*
   Red Black Trees
   (C) 1999  Andrea Arcangeli <andrea@suse.de>
   (C) 2002  David Woodhouse <dwmw2@infradead.org>
-  
-  This program is free software; you can redistribute it and/or modify
-  it under the terms of the GNU General Public License as published by
-  the Free Software Foundation; either version 2 of the License, or
-  (at your option) any later version.
+  (C) 2012  Michel Lespinasse <walken@google.com>
 
-  This program is distributed in the hope that it will be useful,
-  but WITHOUT ANY WARRANTY; without even the implied warranty of
-  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-  GNU General Public License for more details.
-
-  You should have received a copy of the GNU General Public License
-  along with this program; if not, write to the Free Software
-  Foundation, Inc.
 
   linux/lib/rbtree.c
 */
 
-#include <stdlib.h>
-#include "rbtree.h"
-
-static void __rb_rotate_left(struct rb_node *node, struct rb_root *root)
-{
-	struct rb_node *right = node->rb_right;
-	struct rb_node *parent = rb_parent(node);
+#include "rbtree_augmented.h"
 
-	if ((node->rb_right = right->rb_left))
-		rb_set_parent(right->rb_left, node);
-	right->rb_left = node;
+/*
+ * red-black trees properties:  https://en.wikipedia.org/wiki/Rbtree
+ *
+ *  1) A node is either red or black
+ *  2) The root is black
+ *  3) All leaves (NULL) are black
+ *  4) Both children of every red node are black
+ *  5) Every simple path from root to leaves contains the same number
+ *     of black nodes.
+ *
+ *  4 and 5 give the O(log n) guarantee, since 4 implies you cannot have two
+ *  consecutive red nodes in a path and every red node is therefore followed by
+ *  a black. So if B is the number of black nodes on every simple path (as per
+ *  5), then the longest possible path due to 4 is 2B.
+ *
+ *  We shall indicate color with case, where black nodes are uppercase and red
+ *  nodes will be lowercase. Unknown color nodes shall be drawn as red within
+ *  parentheses and have some accompanying text comment.
+ */
 
-	rb_set_parent(right, parent);
+/*
+ * Notes on lockless lookups:
+ *
+ * All stores to the tree structure (rb_left and rb_right) must be done using
+ * WRITE_ONCE(). And we must not inadvertently cause (temporary) loops in the
+ * tree structure as seen in program order.
+ *
+ * These two requirements will allow lockless iteration of the tree -- not
+ * correct iteration mind you, tree rotations are not atomic so a lookup might
+ * miss entire subtrees.
+ *
+ * But they do guarantee that any such traversal will only see valid elements
+ * and that it will indeed complete -- does not get stuck in a loop.
+ *
+ * It also guarantees that if the lookup returns an element it is the 'correct'
+ * one. But not returning an element does _NOT_ mean it's not present.
+ *
+ * NOTE:
+ *
+ * Stores to __rb_parent_color are not important for simple lookups so those
+ * are left undone as of now. Nor did I check for loops involving parent
+ * pointers.
+ */
 
-	if (parent)
-	{
-		if (node == parent->rb_left)
-			parent->rb_left = right;
-		else
-			parent->rb_right = right;
-	}
-	else
-		root->rb_node = right;
-	rb_set_parent(node, right);
+static inline void rb_set_black(struct rb_node *rb)
+{
+	rb->__rb_parent_color += RB_BLACK;
 }
 
-static void __rb_rotate_right(struct rb_node *node, struct rb_root *root)
+static inline struct rb_node *rb_red_parent(struct rb_node *red)
 {
-	struct rb_node *left = node->rb_left;
-	struct rb_node *parent = rb_parent(node);
-
-	if ((node->rb_left = left->rb_right))
-		rb_set_parent(left->rb_right, node);
-	left->rb_right = node;
-
-	rb_set_parent(left, parent);
+	return (struct rb_node *)red->__rb_parent_color;
+}
 
-	if (parent)
-	{
-		if (node == parent->rb_right)
-			parent->rb_right = left;
-		else
-			parent->rb_left = left;
-	}
-	else
-		root->rb_node = left;
-	rb_set_parent(node, left);
+/*
+ * Helper function for rotations:
+ * - old's parent and color get assigned to new
+ * - old gets assigned new as a parent and 'color' as a color.
+ */
+static inline void
+__rb_rotate_set_parents(struct rb_node *old, struct rb_node *new,
+			struct rb_root *root, int color)
+{
+	struct rb_node *parent = rb_parent(old);
+	new->__rb_parent_color = old->__rb_parent_color;
+	rb_set_parent_color(old, new, color);
+	__rb_change_child(old, new, parent, root);
 }
 
-void rb_insert_color(struct rb_node *node, struct rb_root *root)
+static __always_inline void
+__rb_insert(struct rb_node *node, struct rb_root *root,
+	    void (*augment_rotate)(struct rb_node *old, struct rb_node *new))
 {
-	struct rb_node *parent, *gparent;
-
-	while ((parent = rb_parent(node)) && rb_is_red(parent))
-	{
-		gparent = rb_parent(parent);
-
-		if (parent == gparent->rb_left)
-		{
-			{
-				register struct rb_node *uncle = gparent->rb_right;
-				if (uncle && rb_is_red(uncle))
-				{
-					rb_set_black(uncle);
-					rb_set_black(parent);
-					rb_set_red(gparent);
-					node = gparent;
-					continue;
-				}
+	struct rb_node *parent = rb_red_parent(node), *gparent, *tmp;
+
+	while (true) {
+		/*
+		 * Loop invariant: node is red.
+		 */
+		if (!parent) {
+			/*
+			 * The inserted node is root. Either this is the
+			 * first node, or we recursed at Case 1 below and
+			 * are no longer violating 4).
+			 */
+			rb_set_parent_color(node, NULL, RB_BLACK);
+			break;
+		}
+
+		/*
+		 * If there is a black parent, we are done.
+		 * Otherwise, take some corrective action as,
+		 * per 4), we don't want a red root or two
+		 * consecutive red nodes.
+		 */
+		if(rb_is_black(parent))
+			break;
+
+		gparent = rb_red_parent(parent);
+
+		tmp = gparent->rb_right;
+		if (parent != tmp) {	/* parent == gparent->rb_left */
+			if (tmp && rb_is_red(tmp)) {
+				/*
+				 * Case 1 - node's uncle is red (color flips).
+				 *
+				 *       G            g
+				 *      / \          / \
+				 *     p   u  -->   P   U
+				 *    /            /
+				 *   n            n
+				 *
+				 * However, since g's parent might be red, and
+				 * 4) does not allow this, we need to recurse
+				 * at g.
+				 */
+				rb_set_parent_color(tmp, gparent, RB_BLACK);
+				rb_set_parent_color(parent, gparent, RB_BLACK);
+				node = gparent;
+				parent = rb_parent(node);
+				rb_set_parent_color(node, parent, RB_RED);
+				continue;
 			}
 
-			if (parent->rb_right == node)
-			{
-				register struct rb_node *tmp;
-				__rb_rotate_left(parent, root);
-				tmp = parent;
+			tmp = parent->rb_right;
+			if (node == tmp) {
+				/*
+				 * Case 2 - node's uncle is black and node is
+				 * the parent's right child (left rotate at parent).
+				 *
+				 *      G             G
+				 *     / \           / \
+				 *    p   U  -->    n   U
+				 *     \           /
+				 *      n         p
+				 *
+				 * This still leaves us in violation of 4), the
+				 * continuation into Case 3 will fix that.
+				 */
+				tmp = node->rb_left;
+				WRITE_ONCE(parent->rb_right, tmp);
+				WRITE_ONCE(node->rb_left, parent);
+				if (tmp)
+					rb_set_parent_color(tmp, parent,
+							    RB_BLACK);
+				rb_set_parent_color(parent, node, RB_RED);
+				augment_rotate(parent, node);
 				parent = node;
-				node = tmp;
+				tmp = node->rb_right;
 			}
 
-			rb_set_black(parent);
-			rb_set_red(gparent);
-			__rb_rotate_right(gparent, root);
+			/*
+			 * Case 3 - node's uncle is black and node is
+			 * the parent's left child (right rotate at gparent).
+			 *
+			 *        G           P
+			 *       / \         / \
+			 *      p   U  -->  n   g
+			 *     /                 \
+			 *    n                   U
+			 */
+			WRITE_ONCE(gparent->rb_left, tmp); /* == parent->rb_right */
+			WRITE_ONCE(parent->rb_right, gparent);
+			if (tmp)
+				rb_set_parent_color(tmp, gparent, RB_BLACK);
+			__rb_rotate_set_parents(gparent, parent, root, RB_RED);
+			augment_rotate(gparent, parent);
+			break;
 		} else {
-			{
-				register struct rb_node *uncle = gparent->rb_left;
-				if (uncle && rb_is_red(uncle))
-				{
-					rb_set_black(uncle);
-					rb_set_black(parent);
-					rb_set_red(gparent);
-					node = gparent;
-					continue;
-				}
+			tmp = gparent->rb_left;
+			if (tmp && rb_is_red(tmp)) {
+				/* Case 1 - color flips */
+				rb_set_parent_color(tmp, gparent, RB_BLACK);
+				rb_set_parent_color(parent, gparent, RB_BLACK);
+				node = gparent;
+				parent = rb_parent(node);
+				rb_set_parent_color(node, parent, RB_RED);
+				continue;
 			}
 
-			if (parent->rb_left == node)
-			{
-				register struct rb_node *tmp;
-				__rb_rotate_right(parent, root);
-				tmp = parent;
+			tmp = parent->rb_left;
+			if (node == tmp) {
+				/* Case 2 - right rotate at parent */
+				tmp = node->rb_right;
+				WRITE_ONCE(parent->rb_left, tmp);
+				WRITE_ONCE(node->rb_right, parent);
+				if (tmp)
+					rb_set_parent_color(tmp, parent,
+							    RB_BLACK);
+				rb_set_parent_color(parent, node, RB_RED);
+				augment_rotate(parent, node);
 				parent = node;
-				node = tmp;
+				tmp = node->rb_left;
 			}
 
-			rb_set_black(parent);
-			rb_set_red(gparent);
-			__rb_rotate_left(gparent, root);
+			/* Case 3 - left rotate at gparent */
+			WRITE_ONCE(gparent->rb_right, tmp); /* == parent->rb_left */
+			WRITE_ONCE(parent->rb_left, gparent);
+			if (tmp)
+				rb_set_parent_color(tmp, gparent, RB_BLACK);
+			__rb_rotate_set_parents(gparent, parent, root, RB_RED);
+			augment_rotate(gparent, parent);
+			break;
 		}
 	}
-
-	rb_set_black(root->rb_node);
 }
 
-static void __rb_erase_color(struct rb_node *node, struct rb_node *parent,
-			     struct rb_root *root)
+/*
+ * Inline version for rb_erase() use - we want to be able to inline
+ * and eliminate the dummy_rotate callback there
+ */
+static __always_inline void
+____rb_erase_color(struct rb_node *parent, struct rb_root *root,
+	void (*augment_rotate)(struct rb_node *old, struct rb_node *new))
 {
-	struct rb_node *other;
-
-	while ((!node || rb_is_black(node)) && node != root->rb_node)
-	{
-		if (parent->rb_left == node)
-		{
-			other = parent->rb_right;
-			if (rb_is_red(other))
-			{
-				rb_set_black(other);
-				rb_set_red(parent);
-				__rb_rotate_left(parent, root);
-				other = parent->rb_right;
-			}
-			if ((!other->rb_left || rb_is_black(other->rb_left)) &&
-			    (!other->rb_right || rb_is_black(other->rb_right)))
-			{
-				rb_set_red(other);
-				node = parent;
-				parent = rb_parent(node);
+	struct rb_node *node = NULL, *sibling, *tmp1, *tmp2;
+
+	while (true) {
+		/*
+		 * Loop invariants:
+		 * - node is black (or NULL on first iteration)
+		 * - node is not the root (parent is not NULL)
+		 * - All leaf paths going through parent and node have a
+		 *   black node count that is 1 lower than other leaf paths.
+		 */
+		sibling = parent->rb_right;
+		if (node != sibling) {	/* node == parent->rb_left */
+			if (rb_is_red(sibling)) {
+				/*
+				 * Case 1 - left rotate at parent
+				 *
+				 *     P               S
+				 *    / \             / \
+				 *   N   s    -->    p   Sr
+				 *      / \         / \
+				 *     Sl  Sr      N   Sl
+				 */
+				tmp1 = sibling->rb_left;
+				WRITE_ONCE(parent->rb_right, tmp1);
+				WRITE_ONCE(sibling->rb_left, parent);
+				rb_set_parent_color(tmp1, parent, RB_BLACK);
+				__rb_rotate_set_parents(parent, sibling, root,
+							RB_RED);
+				augment_rotate(parent, sibling);
+				sibling = tmp1;
 			}
-			else
-			{
-				if (!other->rb_right || rb_is_black(other->rb_right))
-				{
-					rb_set_black(other->rb_left);
-					rb_set_red(other);
-					__rb_rotate_right(other, root);
-					other = parent->rb_right;
+			tmp1 = sibling->rb_right;
+			if (!tmp1 || rb_is_black(tmp1)) {
+				tmp2 = sibling->rb_left;
+				if (!tmp2 || rb_is_black(tmp2)) {
+					/*
+					 * Case 2 - sibling color flip
+					 * (p could be either color here)
+					 *
+					 *    (p)           (p)
+					 *    / \           / \
+					 *   N   S    -->  N   s
+					 *      / \           / \
+					 *     Sl  Sr        Sl  Sr
+					 *
+					 * This leaves us violating 5) which
+					 * can be fixed by flipping p to black
+					 * if it was red, or by recursing at p.
+					 * p is red when coming from Case 1.
+					 */
+					rb_set_parent_color(sibling, parent,
+							    RB_RED);
+					if (rb_is_red(parent))
+						rb_set_black(parent);
+					else {
+						node = parent;
+						parent = rb_parent(node);
+						if (parent)
+							continue;
+					}
+					break;
 				}
-				rb_set_color(other, rb_color(parent));
-				rb_set_black(parent);
-				rb_set_black(other->rb_right);
-				__rb_rotate_left(parent, root);
-				node = root->rb_node;
-				break;
+				/*
+				 * Case 3 - right rotate at sibling
+				 * (p could be either color here)
+				 *
+				 *   (p)           (p)
+				 *   / \           / \
+				 *  N   S    -->  N   sl
+				 *     / \             \
+				 *    sl  Sr            S
+				 *                       \
+				 *                        Sr
+				 *
+				 * Note: p might be red, and then both
+				 * p and sl are red after rotation(which
+				 * breaks property 4). This is fixed in
+				 * Case 4 (in __rb_rotate_set_parents()
+				 *         which set sl the color of p
+				 *         and set p RB_BLACK)
+				 *
+				 *   (p)            (sl)
+				 *   / \            /  \
+				 *  N   sl   -->   P    S
+				 *       \        /      \
+				 *        S      N        Sr
+				 *         \
+				 *          Sr
+				 */
+				tmp1 = tmp2->rb_right;
+				WRITE_ONCE(sibling->rb_left, tmp1);
+				WRITE_ONCE(tmp2->rb_right, sibling);
+				WRITE_ONCE(parent->rb_right, tmp2);
+				if (tmp1)
+					rb_set_parent_color(tmp1, sibling,
+							    RB_BLACK);
+				augment_rotate(sibling, tmp2);
+				tmp1 = sibling;
+				sibling = tmp2;
 			}
-		}
-		else
-		{
-			other = parent->rb_left;
-			if (rb_is_red(other))
-			{
-				rb_set_black(other);
-				rb_set_red(parent);
-				__rb_rotate_right(parent, root);
-				other = parent->rb_left;
-			}
-			if ((!other->rb_left || rb_is_black(other->rb_left)) &&
-			    (!other->rb_right || rb_is_black(other->rb_right)))
-			{
-				rb_set_red(other);
-				node = parent;
-				parent = rb_parent(node);
+			/*
+			 * Case 4 - left rotate at parent + color flips
+			 * (p and sl could be either color here.
+			 *  After rotation, p becomes black, s acquires
+			 *  p's color, and sl keeps its color)
+			 *
+			 *      (p)             (s)
+			 *      / \             / \
+			 *     N   S     -->   P   Sr
+			 *        / \         / \
+			 *      (sl) sr      N  (sl)
+			 */
+			tmp2 = sibling->rb_left;
+			WRITE_ONCE(parent->rb_right, tmp2);
+			WRITE_ONCE(sibling->rb_left, parent);
+			rb_set_parent_color(tmp1, sibling, RB_BLACK);
+			if (tmp2)
+				rb_set_parent(tmp2, parent);
+			__rb_rotate_set_parents(parent, sibling, root,
+						RB_BLACK);
+			augment_rotate(parent, sibling);
+			break;
+		} else {
+			sibling = parent->rb_left;
+			if (rb_is_red(sibling)) {
+				/* Case 1 - right rotate at parent */
+				tmp1 = sibling->rb_right;
+				WRITE_ONCE(parent->rb_left, tmp1);
+				WRITE_ONCE(sibling->rb_right, parent);
+				rb_set_parent_color(tmp1, parent, RB_BLACK);
+				__rb_rotate_set_parents(parent, sibling, root,
+							RB_RED);
+				augment_rotate(parent, sibling);
+				sibling = tmp1;
 			}
-			else
-			{
-				if (!other->rb_left || rb_is_black(other->rb_left))
-				{
-					rb_set_black(other->rb_right);
-					rb_set_red(other);
-					__rb_rotate_left(other, root);
-					other = parent->rb_left;
+			tmp1 = sibling->rb_left;
+			if (!tmp1 || rb_is_black(tmp1)) {
+				tmp2 = sibling->rb_right;
+				if (!tmp2 || rb_is_black(tmp2)) {
+					/* Case 2 - sibling color flip */
+					rb_set_parent_color(sibling, parent,
+							    RB_RED);
+					if (rb_is_red(parent))
+						rb_set_black(parent);
+					else {
+						node = parent;
+						parent = rb_parent(node);
+						if (parent)
+							continue;
+					}
+					break;
 				}
-				rb_set_color(other, rb_color(parent));
-				rb_set_black(parent);
-				rb_set_black(other->rb_left);
-				__rb_rotate_right(parent, root);
-				node = root->rb_node;
-				break;
+				/* Case 3 - left rotate at sibling */
+				tmp1 = tmp2->rb_left;
+				WRITE_ONCE(sibling->rb_right, tmp1);
+				WRITE_ONCE(tmp2->rb_left, sibling);
+				WRITE_ONCE(parent->rb_left, tmp2);
+				if (tmp1)
+					rb_set_parent_color(tmp1, sibling,
+							    RB_BLACK);
+				augment_rotate(sibling, tmp2);
+				tmp1 = sibling;
+				sibling = tmp2;
 			}
+			/* Case 4 - right rotate at parent + color flips */
+			tmp2 = sibling->rb_right;
+			WRITE_ONCE(parent->rb_left, tmp2);
+			WRITE_ONCE(sibling->rb_right, parent);
+			rb_set_parent_color(tmp1, sibling, RB_BLACK);
+			if (tmp2)
+				rb_set_parent(tmp2, parent);
+			__rb_rotate_set_parents(parent, sibling, root,
+						RB_BLACK);
+			augment_rotate(parent, sibling);
+			break;
 		}
 	}
-	if (node)
-		rb_set_black(node);
 }
 
-void rb_erase(struct rb_node *node, struct rb_root *root)
+/* Non-inline version for rb_erase_augmented() use */
+void __rb_erase_color(struct rb_node *parent, struct rb_root *root,
+	void (*augment_rotate)(struct rb_node *old, struct rb_node *new))
 {
-	struct rb_node *child, *parent;
-	int color;
+	____rb_erase_color(parent, root, augment_rotate);
+}
 
-	if (!node->rb_left)
-		child = node->rb_right;
-	else if (!node->rb_right)
-		child = node->rb_left;
-	else
-	{
-		struct rb_node *old = node, *left;
+/*
+ * Non-augmented rbtree manipulation functions.
+ *
+ * We use dummy augmented callbacks here, and have the compiler optimize them
+ * out of the rb_insert_color() and rb_erase() function definitions.
+ */
 
-		node = node->rb_right;
-		while ((left = node->rb_left) != NULL)
-			node = left;
-
-		if (rb_parent(old)) {
-			if (rb_parent(old)->rb_left == old)
-				rb_parent(old)->rb_left = node;
-			else
-				rb_parent(old)->rb_right = node;
-		} else
-			root->rb_node = node;
-
-		child = node->rb_right;
-		parent = rb_parent(node);
-		color = rb_color(node);
-
-		if (parent == old) {
-			parent = node;
-		} else {
-			if (child)
-				rb_set_parent(child, parent);
-			parent->rb_left = child;
+static inline void dummy_propagate(struct rb_node *node, struct rb_node *stop) {}
+static inline void dummy_copy(struct rb_node *old, struct rb_node *new) {}
+static inline void dummy_rotate(struct rb_node *old, struct rb_node *new) {}
 
-			node->rb_right = old->rb_right;
-			rb_set_parent(old->rb_right, node);
-		}
+static const struct rb_augment_callbacks dummy_callbacks = {
+	.propagate = dummy_propagate,
+	.copy = dummy_copy,
+	.rotate = dummy_rotate
+};
 
-		node->rb_parent_color = old->rb_parent_color;
-		node->rb_left = old->rb_left;
-		rb_set_parent(old->rb_left, node);
+void rb_insert_color(struct rb_node *node, struct rb_root *root)
+{
+	__rb_insert(node, root, dummy_rotate);
+}
 
-		goto color;
-	}
+void rb_erase(struct rb_node *node, struct rb_root *root)
+{
+	struct rb_node *rebalance;
+	rebalance = __rb_erase_augmented(node, root, &dummy_callbacks);
+	if (rebalance)
+		____rb_erase_color(rebalance, root, dummy_rotate);
+}
 
-	parent = rb_parent(node);
-	color = rb_color(node);
-
-	if (child)
-		rb_set_parent(child, parent);
-	if (parent)
-	{
-		if (parent->rb_left == node)
-			parent->rb_left = child;
-		else
-			parent->rb_right = child;
-	}
-	else
-		root->rb_node = child;
+/*
+ * Augmented rbtree manipulation functions.
+ *
+ * This instantiates the same __always_inline functions as in the non-augmented
+ * case, but this time with user-defined callbacks.
+ */
 
- color:
-	if (color == RB_BLACK)
-		__rb_erase_color(child, parent, root);
+void __rb_insert_augmented(struct rb_node *node, struct rb_root *root,
+	void (*augment_rotate)(struct rb_node *old, struct rb_node *new))
+{
+	__rb_insert(node, root, augment_rotate);
 }
 
 /*
@@ -312,24 +486,27 @@ struct rb_node *rb_next(const struct rb_node *node)
 {
 	struct rb_node *parent;
 
-	if (rb_parent(node) == node)
+	if (RB_EMPTY_NODE(node))
 		return NULL;
 
-	/* If we have a right-hand child, go down and then left as far
-	   as we can. */
+	/*
+	 * If we have a right-hand child, go down and then left as far
+	 * as we can.
+	 */
 	if (node->rb_right) {
-		node = node->rb_right; 
+		node = node->rb_right;
 		while (node->rb_left)
-			node=node->rb_left;
+			node = node->rb_left;
 		return (struct rb_node *)node;
 	}
 
-	/* No right-hand children.  Everything down and left is
-	   smaller than us, so any 'next' node must be in the general
-	   direction of our parent. Go up the tree; any time the
-	   ancestor is a right-hand child of its parent, keep going
-	   up. First time it's a left-hand child of its parent, said
-	   parent is our 'next' node. */
+	/*
+	 * No right-hand children. Everything down and left is smaller than us,
+	 * so any 'next' node must be in the general direction of our parent.
+	 * Go up the tree; any time the ancestor is a right-hand child of its
+	 * parent, keep going up. First time it's a left-hand child of its
+	 * parent, said parent is our 'next' node.
+	 */
 	while ((parent = rb_parent(node)) && node == parent->rb_right)
 		node = parent;
 
@@ -340,20 +517,24 @@ struct rb_node *rb_prev(const struct rb_node *node)
 {
 	struct rb_node *parent;
 
-	if (rb_parent(node) == node)
+	if (RB_EMPTY_NODE(node))
 		return NULL;
 
-	/* If we have a left-hand child, go down and then right as far
-	   as we can. */
+	/*
+	 * If we have a left-hand child, go down and then right as far
+	 * as we can.
+	 */
 	if (node->rb_left) {
-		node = node->rb_left; 
+		node = node->rb_left;
 		while (node->rb_right)
-			node=node->rb_right;
+			node = node->rb_right;
 		return (struct rb_node *)node;
 	}
 
-	/* No left-hand children. Go up till we find an ancestor which
-	   is a right-hand child of its parent */
+	/*
+	 * No left-hand children. Go up till we find an ancestor which
+	 * is a right-hand child of its parent.
+	 */
 	while ((parent = rb_parent(node)) && node == parent->rb_left)
 		node = parent;
 
@@ -365,20 +546,51 @@ void rb_replace_node(struct rb_node *victim, struct rb_node *new,
 {
 	struct rb_node *parent = rb_parent(victim);
 
+	/* Copy the pointers/colour from the victim to the replacement */
+	*new = *victim;
+
 	/* Set the surrounding nodes to point to the replacement */
-	if (parent) {
-		if (victim == parent->rb_left)
-			parent->rb_left = new;
-		else
-			parent->rb_right = new;
-	} else {
-		root->rb_node = new;
-	}
 	if (victim->rb_left)
 		rb_set_parent(victim->rb_left, new);
 	if (victim->rb_right)
 		rb_set_parent(victim->rb_right, new);
+	__rb_change_child(victim, new, parent, root);
+}
 
-	/* Copy the pointers/colour from the victim to the replacement */
-	*new = *victim;
+static struct rb_node *rb_left_deepest_node(const struct rb_node *node)
+{
+	for (;;) {
+		if (node->rb_left)
+			node = node->rb_left;
+		else if (node->rb_right)
+			node = node->rb_right;
+		else
+			return (struct rb_node *)node;
+	}
+}
+
+struct rb_node *rb_next_postorder(const struct rb_node *node)
+{
+	const struct rb_node *parent;
+	if (!node)
+		return NULL;
+	parent = rb_parent(node);
+
+	/* If we're sitting on node, we've already seen our children */
+	if (parent && node == parent->rb_left && parent->rb_right) {
+		/* If we are the parent's left node, go to the parent's right
+		 * node then all the way down to the left */
+		return rb_left_deepest_node(parent->rb_right);
+	} else
+		/* Otherwise we are the parent's right node, and the parent
+		 * should be next */
+		return (struct rb_node *)parent;
+}
+
+struct rb_node *rb_first_postorder(const struct rb_root *root)
+{
+	if (!root->rb_node)
+		return NULL;
+
+	return rb_left_deepest_node(root->rb_node);
 }
diff --git a/dlm_controld/rbtree.h b/dlm_controld/rbtree.h
index 9a4ad606..ddb86ff6 100644
--- a/dlm_controld/rbtree.h
+++ b/dlm_controld/rbtree.h
@@ -1,20 +1,8 @@
+/* Copied from linux/include/linux/rbtree.h */
 /*
   Red Black Trees
   (C) 1999  Andrea Arcangeli <andrea@suse.de>
   
-  This program is free software; you can redistribute it and/or modify
-  it under the terms of the GNU General Public License as published by
-  the Free Software Foundation; either version 2 of the License, or
-  (at your option) any later version.
-
-  This program is distributed in the hope that it will be useful,
-  but WITHOUT ANY WARRANTY; without even the implied warranty of
-  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-  GNU General Public License for more details.
-
-  You should have received a copy of the GNU General Public License
-  along with this program; if not, write to the Free Software
-  Foundation, Inc.
 
   linux/include/linux/rbtree.h
 
@@ -23,138 +11,313 @@
   I know it's not the cleaner way,  but in C (not in C++) to get
   performances and genericity...
 
-  Some example of insert and search follows here. The search is a plain
-  normal search over an ordered tree. The insert instead must be implemented
-  int two steps: as first thing the code must insert the element in
-  order as a red leaf in the tree, then the support library function
-  rb_insert_color() must be called. Such function will do the
-  not trivial work to rebalance the rbtree if necessary.
+  See Documentation/core-api/rbtree.rst for documentation and samples.
+*/
+
+#ifndef	_LINUX_RBTREE_H
+#define	_LINUX_RBTREE_H
+
+#include <stdbool.h>
+#include <string.h>
+
+#include "list.h"
+#include "rbtree_types.h"
+
+#define rb_parent(r)   ((struct rb_node *)((r)->__rb_parent_color & ~3))
+
+#define	rb_entry(ptr, type, member) container_of(ptr, type, member)
+
+#define RB_EMPTY_ROOT(root)  (READ_ONCE((root)->rb_node) == NULL)
+
+/* 'empty' nodes are nodes that are known not to be inserted in an rbtree */
+#define RB_EMPTY_NODE(node)  \
+	((node)->__rb_parent_color == (unsigned long)(node))
+#define RB_CLEAR_NODE(node)  \
+	((node)->__rb_parent_color = (unsigned long)(node))
+
+
+extern void rb_insert_color(struct rb_node *, struct rb_root *);
+extern void rb_erase(struct rb_node *, struct rb_root *);
+
+
+/* Find logical next and previous nodes in a tree */
+extern struct rb_node *rb_next(const struct rb_node *);
+extern struct rb_node *rb_prev(const struct rb_node *);
+extern struct rb_node *rb_first(const struct rb_root *);
+extern struct rb_node *rb_last(const struct rb_root *);
+
+/* Postorder iteration - always visit the parent after its children */
+extern struct rb_node *rb_first_postorder(const struct rb_root *);
+extern struct rb_node *rb_next_postorder(const struct rb_node *);
+
+/* Fast replacement of a single node without remove/rebalance/add/rebalance */
+extern void rb_replace_node(struct rb_node *victim, struct rb_node *new,
+			    struct rb_root *root);
 
------------------------------------------------------------------------
-static inline struct page * rb_search_page_cache(struct inode * inode,
-						 unsigned long offset)
+static inline void rb_link_node(struct rb_node *node, struct rb_node *parent,
+				struct rb_node **rb_link)
 {
-	struct rb_node * n = inode->i_rb_page_cache.rb_node;
-	struct page * page;
+	node->__rb_parent_color = (unsigned long)parent;
+	node->rb_left = node->rb_right = NULL;
 
-	while (n)
-	{
-		page = rb_entry(n, struct page, rb_page_cache);
+	*rb_link = node;
+}
 
-		if (offset < page->offset)
-			n = n->rb_left;
-		else if (offset > page->offset)
-			n = n->rb_right;
-		else
-			return page;
-	}
-	return NULL;
+#define rb_entry_safe(ptr, type, member) \
+	({ typeof(ptr) ____ptr = (ptr); \
+	   ____ptr ? rb_entry(____ptr, type, member) : NULL; \
+	})
+
+/**
+ * rbtree_postorder_for_each_entry_safe - iterate in post-order over rb_root of
+ * given type allowing the backing memory of @pos to be invalidated
+ *
+ * @pos:	the 'type *' to use as a loop cursor.
+ * @n:		another 'type *' to use as temporary storage
+ * @root:	'rb_root *' of the rbtree.
+ * @field:	the name of the rb_node field within 'type'.
+ *
+ * rbtree_postorder_for_each_entry_safe() provides a similar guarantee as
+ * list_for_each_entry_safe() and allows the iteration to continue independent
+ * of changes to @pos by the body of the loop.
+ *
+ * Note, however, that it cannot handle other modifications that re-order the
+ * rbtree it is iterating over. This includes calling rb_erase() on @pos, as
+ * rb_erase() may rebalance the tree, causing us to miss some nodes.
+ */
+#define rbtree_postorder_for_each_entry_safe(pos, n, root, field) \
+	for (pos = rb_entry_safe(rb_first_postorder(root), typeof(*pos), field); \
+	     pos && ({ n = rb_entry_safe(rb_next_postorder(&pos->field), \
+			typeof(*pos), field); 1; }); \
+	     pos = n)
+
+/* Same as rb_first(), but O(1) */
+#define rb_first_cached(root) (root)->rb_leftmost
+
+static inline void rb_insert_color_cached(struct rb_node *node,
+					  struct rb_root_cached *root,
+					  bool leftmost)
+{
+	if (leftmost)
+		root->rb_leftmost = node;
+	rb_insert_color(node, &root->rb_root);
 }
 
-static inline struct page * __rb_insert_page_cache(struct inode * inode,
-						   unsigned long offset,
-						   struct rb_node * node)
+
+static inline struct rb_node *
+rb_erase_cached(struct rb_node *node, struct rb_root_cached *root)
 {
-	struct rb_node ** p = &inode->i_rb_page_cache.rb_node;
-	struct rb_node * parent = NULL;
-	struct page * page;
-
-	while (*p)
-	{
-		parent = *p;
-		page = rb_entry(parent, struct page, rb_page_cache);
-
-		if (offset < page->offset)
-			p = &(*p)->rb_left;
-		else if (offset > page->offset)
-			p = &(*p)->rb_right;
-		else
-			return page;
-	}
+	struct rb_node *leftmost = NULL;
 
-	rb_link_node(node, parent, p);
+	if (root->rb_leftmost == node)
+		leftmost = root->rb_leftmost = rb_next(node);
 
-	return NULL;
+	rb_erase(node, &root->rb_root);
+
+	return leftmost;
 }
 
-static inline struct page * rb_insert_page_cache(struct inode * inode,
-						 unsigned long offset,
-						 struct rb_node * node)
+static inline void rb_replace_node_cached(struct rb_node *victim,
+					  struct rb_node *new,
+					  struct rb_root_cached *root)
 {
-	struct page * ret;
-	if ((ret = __rb_insert_page_cache(inode, offset, node)))
-		goto out;
-	rb_insert_color(node, &inode->i_rb_page_cache);
- out:
-	return ret;
+	if (root->rb_leftmost == victim)
+		root->rb_leftmost = new;
+	rb_replace_node(victim, new, &root->rb_root);
 }
------------------------------------------------------------------------
-*/
 
-#ifndef	_LINUX_RBTREE_H
-#define	_LINUX_RBTREE_H
-
-#include <linux/stddef.h>
+/*
+ * The below helper functions use 2 operators with 3 different
+ * calling conventions. The operators are related like:
+ *
+ *	comp(a->key,b) < 0  := less(a,b)
+ *	comp(a->key,b) > 0  := less(b,a)
+ *	comp(a->key,b) == 0 := !less(a,b) && !less(b,a)
+ *
+ * If these operators define a partial order on the elements we make no
+ * guarantee on which of the elements matching the key is found. See
+ * rb_find().
+ *
+ * The reason for this is to allow the find() interface without requiring an
+ * on-stack dummy object, which might not be feasible due to object size.
+ */
 
-struct rb_node
-{
-	unsigned long  rb_parent_color;
-#define	RB_RED		0
-#define	RB_BLACK	1
-	struct rb_node *rb_right;
-	struct rb_node *rb_left;
-} __attribute__((aligned(sizeof(long))));
-    /* The alignment might seem pointless, but allegedly CRIS needs it */
-
-struct rb_root
+/**
+ * rb_add_cached() - insert @node into the leftmost cached tree @tree
+ * @node: node to insert
+ * @tree: leftmost cached tree to insert @node into
+ * @less: operator defining the (partial) node order
+ *
+ * Returns @node when it is the new leftmost, or NULL.
+ */
+static __always_inline struct rb_node *
+rb_add_cached(struct rb_node *node, struct rb_root_cached *tree,
+	      bool (*less)(struct rb_node *, const struct rb_node *))
 {
-	struct rb_node *rb_node;
-};
+	struct rb_node **link = &tree->rb_root.rb_node;
+	struct rb_node *parent = NULL;
+	bool leftmost = true;
 
+	while (*link) {
+		parent = *link;
+		if (less(node, parent)) {
+			link = &parent->rb_left;
+		} else {
+			link = &parent->rb_right;
+			leftmost = false;
+		}
+	}
 
-#define rb_parent(r)   ((struct rb_node *)((r)->rb_parent_color & ~3))
-#define rb_color(r)   ((r)->rb_parent_color & 1)
-#define rb_is_red(r)   (!rb_color(r))
-#define rb_is_black(r) rb_color(r)
-#define rb_set_red(r)  do { (r)->rb_parent_color &= ~1; } while (0)
-#define rb_set_black(r)  do { (r)->rb_parent_color |= 1; } while (0)
+	rb_link_node(node, parent, link);
+	rb_insert_color_cached(node, tree, leftmost);
 
-static inline void rb_set_parent(struct rb_node *rb, struct rb_node *p)
-{
-	rb->rb_parent_color = (rb->rb_parent_color & 3) | (unsigned long)p;
+	return leftmost ? node : NULL;
 }
-static inline void rb_set_color(struct rb_node *rb, int color)
+
+/**
+ * rb_add() - insert @node into @tree
+ * @node: node to insert
+ * @tree: tree to insert @node into
+ * @less: operator defining the (partial) node order
+ */
+static __always_inline void
+rb_add(struct rb_node *node, struct rb_root *tree,
+       bool (*less)(struct rb_node *, const struct rb_node *))
 {
-	rb->rb_parent_color = (rb->rb_parent_color & ~1) | color;
+	struct rb_node **link = &tree->rb_node;
+	struct rb_node *parent = NULL;
+
+	while (*link) {
+		parent = *link;
+		if (less(node, parent))
+			link = &parent->rb_left;
+		else
+			link = &parent->rb_right;
+	}
+
+	rb_link_node(node, parent, link);
+	rb_insert_color(node, tree);
 }
 
-#define RB_ROOT	(struct rb_root) { NULL, }
-#define	rb_entry(ptr, type, member) container_of(ptr, type, member)
+/**
+ * rb_find_add() - find equivalent @node in @tree, or add @node
+ * @node: node to look-for / insert
+ * @tree: tree to search / modify
+ * @cmp: operator defining the node order
+ *
+ * Returns the rb_node matching @node, or NULL when no match is found and @node
+ * is inserted.
+ */
+static __always_inline struct rb_node *
+rb_find_add(struct rb_node *node, struct rb_root *tree,
+	    int (*cmp)(struct rb_node *, const struct rb_node *))
+{
+	struct rb_node **link = &tree->rb_node;
+	struct rb_node *parent = NULL;
+	int c;
 
-#define RB_EMPTY_ROOT(root)	((root)->rb_node == NULL)
-#define RB_EMPTY_NODE(node)	(rb_parent(node) == node)
-#define RB_CLEAR_NODE(node)	(rb_set_parent(node, node))
+	while (*link) {
+		parent = *link;
+		c = cmp(node, parent);
 
-extern void rb_insert_color(struct rb_node *, struct rb_root *);
-extern void rb_erase(struct rb_node *, struct rb_root *);
+		if (c < 0)
+			link = &parent->rb_left;
+		else if (c > 0)
+			link = &parent->rb_right;
+		else
+			return parent;
+	}
 
-/* Find logical next and previous nodes in a tree */
-extern struct rb_node *rb_next(const struct rb_node *);
-extern struct rb_node *rb_prev(const struct rb_node *);
-extern struct rb_node *rb_first(const struct rb_root *);
-extern struct rb_node *rb_last(const struct rb_root *);
+	rb_link_node(node, parent, link);
+	rb_insert_color(node, tree);
+	return NULL;
+}
 
-/* Fast replacement of a single node without remove/rebalance/add/rebalance */
-extern void rb_replace_node(struct rb_node *victim, struct rb_node *new, 
-			    struct rb_root *root);
+/**
+ * rb_find() - find @key in tree @tree
+ * @key: key to match
+ * @tree: tree to search
+ * @cmp: operator defining the node order
+ *
+ * Returns the rb_node matching @key or NULL.
+ */
+static __always_inline struct rb_node *
+rb_find(const void *key, const struct rb_root *tree,
+	int (*cmp)(const void *key, const struct rb_node *))
+{
+	struct rb_node *node = tree->rb_node;
+
+	while (node) {
+		int c = cmp(key, node);
+
+		if (c < 0)
+			node = node->rb_left;
+		else if (c > 0)
+			node = node->rb_right;
+		else
+			return node;
+	}
+
+	return NULL;
+}
 
-static inline void rb_link_node(struct rb_node * node, struct rb_node * parent,
-				struct rb_node ** rb_link)
+/**
+ * rb_find_first() - find the first @key in @tree
+ * @key: key to match
+ * @tree: tree to search
+ * @cmp: operator defining node order
+ *
+ * Returns the leftmost node matching @key, or NULL.
+ */
+static __always_inline struct rb_node *
+rb_find_first(const void *key, const struct rb_root *tree,
+	      int (*cmp)(const void *key, const struct rb_node *))
 {
-	node->rb_parent_color = (unsigned long )parent;
-	node->rb_left = node->rb_right = NULL;
+	struct rb_node *node = tree->rb_node;
+	struct rb_node *match = NULL;
 
-	*rb_link = node;
+	while (node) {
+		int c = cmp(key, node);
+
+		if (c <= 0) {
+			if (!c)
+				match = node;
+			node = node->rb_left;
+		} else if (c > 0) {
+			node = node->rb_right;
+		}
+	}
+
+	return match;
 }
 
+/**
+ * rb_next_match() - find the next @key in @tree
+ * @key: key to match
+ * @tree: tree to search
+ * @cmp: operator defining node order
+ *
+ * Returns the next node matching @key, or NULL.
+ */
+static __always_inline struct rb_node *
+rb_next_match(const void *key, struct rb_node *node,
+	      int (*cmp)(const void *key, const struct rb_node *))
+{
+	node = rb_next(node);
+	if (node && cmp(key, node))
+		node = NULL;
+	return node;
+}
+
+/**
+ * rb_for_each() - iterates a subtree matching @key
+ * @node: iterator
+ * @key: key to match
+ * @tree: tree to search
+ * @cmp: operator defining node order
+ */
+#define rb_for_each(node, key, tree, cmp) \
+	for ((node) = rb_find_first((key), (tree), (cmp)); \
+	     (node); (node) = rb_next_match((key), (node), (cmp)))
+
 #endif	/* _LINUX_RBTREE_H */
diff --git a/dlm_controld/rbtree_augmented.h b/dlm_controld/rbtree_augmented.h
new file mode 100644
index 00000000..580a4c56
--- /dev/null
+++ b/dlm_controld/rbtree_augmented.h
@@ -0,0 +1,303 @@
+/*  Copied from linux/include/linux/rbtree_augmented.h */
+/*
+  Red Black Trees
+  (C) 1999  Andrea Arcangeli <andrea@suse.de>
+  (C) 2002  David Woodhouse <dwmw2@infradead.org>
+  (C) 2012  Michel Lespinasse <walken@google.com>
+
+
+  linux/include/linux/rbtree_augmented.h
+*/
+
+#ifndef _LINUX_RBTREE_AUGMENTED_H
+#define _LINUX_RBTREE_AUGMENTED_H
+
+#include "rbtree.h"
+#include "linux_helpers.h"
+
+/*
+ * Please note - only struct rb_augment_callbacks and the prototypes for
+ * rb_insert_augmented() and rb_erase_augmented() are intended to be public.
+ * The rest are implementation details you are not expected to depend on.
+ *
+ * See Documentation/core-api/rbtree.rst for documentation and samples.
+ */
+
+struct rb_augment_callbacks {
+	void (*propagate)(struct rb_node *node, struct rb_node *stop);
+	void (*copy)(struct rb_node *old, struct rb_node *new);
+	void (*rotate)(struct rb_node *old, struct rb_node *new);
+};
+
+extern void __rb_insert_augmented(struct rb_node *node, struct rb_root *root,
+	void (*augment_rotate)(struct rb_node *old, struct rb_node *new));
+
+/*
+ * Fixup the rbtree and update the augmented information when rebalancing.
+ *
+ * On insertion, the user must update the augmented information on the path
+ * leading to the inserted node, then call rb_link_node() as usual and
+ * rb_insert_augmented() instead of the usual rb_insert_color() call.
+ * If rb_insert_augmented() rebalances the rbtree, it will callback into
+ * a user provided function to update the augmented information on the
+ * affected subtrees.
+ */
+static inline void
+rb_insert_augmented(struct rb_node *node, struct rb_root *root,
+		    const struct rb_augment_callbacks *augment)
+{
+	__rb_insert_augmented(node, root, augment->rotate);
+}
+
+static inline void
+rb_insert_augmented_cached(struct rb_node *node,
+			   struct rb_root_cached *root, bool newleft,
+			   const struct rb_augment_callbacks *augment)
+{
+	if (newleft)
+		root->rb_leftmost = node;
+	rb_insert_augmented(node, &root->rb_root, augment);
+}
+
+/*
+ * Template for declaring augmented rbtree callbacks (generic case)
+ *
+ * RBSTATIC:    'static' or empty
+ * RBNAME:      name of the rb_augment_callbacks structure
+ * RBSTRUCT:    struct type of the tree nodes
+ * RBFIELD:     name of struct rb_node field within RBSTRUCT
+ * RBAUGMENTED: name of field within RBSTRUCT holding data for subtree
+ * RBCOMPUTE:   name of function that recomputes the RBAUGMENTED data
+ */
+
+#define RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME,				\
+			     RBSTRUCT, RBFIELD, RBAUGMENTED, RBCOMPUTE)	\
+static inline void							\
+RBNAME ## _propagate(struct rb_node *rb, struct rb_node *stop)		\
+{									\
+	while (rb != stop) {						\
+		RBSTRUCT *node = rb_entry(rb, RBSTRUCT, RBFIELD);	\
+		if (RBCOMPUTE(node, true))				\
+			break;						\
+		rb = rb_parent(&node->RBFIELD);				\
+	}								\
+}									\
+static inline void							\
+RBNAME ## _copy(struct rb_node *rb_old, struct rb_node *rb_new)		\
+{									\
+	RBSTRUCT *old = rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
+	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
+	new->RBAUGMENTED = old->RBAUGMENTED;				\
+}									\
+static void								\
+RBNAME ## _rotate(struct rb_node *rb_old, struct rb_node *rb_new)	\
+{									\
+	RBSTRUCT *old = rb_entry(rb_old, RBSTRUCT, RBFIELD);		\
+	RBSTRUCT *new = rb_entry(rb_new, RBSTRUCT, RBFIELD);		\
+	new->RBAUGMENTED = old->RBAUGMENTED;				\
+	RBCOMPUTE(old, false);						\
+}									\
+RBSTATIC const struct rb_augment_callbacks RBNAME = {			\
+	.propagate = RBNAME ## _propagate,				\
+	.copy = RBNAME ## _copy,					\
+	.rotate = RBNAME ## _rotate					\
+};
+
+/*
+ * Template for declaring augmented rbtree callbacks,
+ * computing RBAUGMENTED scalar as max(RBCOMPUTE(node)) for all subtree nodes.
+ *
+ * RBSTATIC:    'static' or empty
+ * RBNAME:      name of the rb_augment_callbacks structure
+ * RBSTRUCT:    struct type of the tree nodes
+ * RBFIELD:     name of struct rb_node field within RBSTRUCT
+ * RBTYPE:      type of the RBAUGMENTED field
+ * RBAUGMENTED: name of RBTYPE field within RBSTRUCT holding data for subtree
+ * RBCOMPUTE:   name of function that returns the per-node RBTYPE scalar
+ */
+
+#define RB_DECLARE_CALLBACKS_MAX(RBSTATIC, RBNAME, RBSTRUCT, RBFIELD,	      \
+				 RBTYPE, RBAUGMENTED, RBCOMPUTE)	      \
+static inline bool RBNAME ## _compute_max(RBSTRUCT *node, bool exit)	      \
+{									      \
+	RBSTRUCT *child;						      \
+	RBTYPE max = RBCOMPUTE(node);					      \
+	if (node->RBFIELD.rb_left) {					      \
+		child = rb_entry(node->RBFIELD.rb_left, RBSTRUCT, RBFIELD);   \
+		if (child->RBAUGMENTED > max)				      \
+			max = child->RBAUGMENTED;			      \
+	}								      \
+	if (node->RBFIELD.rb_right) {					      \
+		child = rb_entry(node->RBFIELD.rb_right, RBSTRUCT, RBFIELD);  \
+		if (child->RBAUGMENTED > max)				      \
+			max = child->RBAUGMENTED;			      \
+	}								      \
+	if (exit && node->RBAUGMENTED == max)				      \
+		return true;						      \
+	node->RBAUGMENTED = max;					      \
+	return false;							      \
+}									      \
+RB_DECLARE_CALLBACKS(RBSTATIC, RBNAME,					      \
+		     RBSTRUCT, RBFIELD, RBAUGMENTED, RBNAME ## _compute_max)
+
+
+#define	RB_RED		0
+#define	RB_BLACK	1
+
+#define __rb_parent(pc)    ((struct rb_node *)(pc & ~3))
+
+#define __rb_color(pc)     ((pc) & 1)
+#define __rb_is_black(pc)  __rb_color(pc)
+#define __rb_is_red(pc)    (!__rb_color(pc))
+#define rb_color(rb)       __rb_color((rb)->__rb_parent_color)
+#define rb_is_red(rb)      __rb_is_red((rb)->__rb_parent_color)
+#define rb_is_black(rb)    __rb_is_black((rb)->__rb_parent_color)
+
+static inline void rb_set_parent(struct rb_node *rb, struct rb_node *p)
+{
+	rb->__rb_parent_color = rb_color(rb) + (unsigned long)p;
+}
+
+static inline void rb_set_parent_color(struct rb_node *rb,
+				       struct rb_node *p, int color)
+{
+	rb->__rb_parent_color = (unsigned long)p + color;
+}
+
+static inline void
+__rb_change_child(struct rb_node *old, struct rb_node *new,
+		  struct rb_node *parent, struct rb_root *root)
+{
+	if (parent) {
+		if (parent->rb_left == old)
+			WRITE_ONCE(parent->rb_left, new);
+		else
+			WRITE_ONCE(parent->rb_right, new);
+	} else
+		WRITE_ONCE(root->rb_node, new);
+}
+
+extern void __rb_erase_color(struct rb_node *parent, struct rb_root *root,
+	void (*augment_rotate)(struct rb_node *old, struct rb_node *new));
+
+static __always_inline struct rb_node *
+__rb_erase_augmented(struct rb_node *node, struct rb_root *root,
+		     const struct rb_augment_callbacks *augment)
+{
+	struct rb_node *child = node->rb_right;
+	struct rb_node *tmp = node->rb_left;
+	struct rb_node *parent, *rebalance;
+	unsigned long pc;
+
+	if (!tmp) {
+		/*
+		 * Case 1: node to erase has no more than 1 child (easy!)
+		 *
+		 * Note that if there is one child it must be red due to 5)
+		 * and node must be black due to 4). We adjust colors locally
+		 * so as to bypass __rb_erase_color() later on.
+		 */
+		pc = node->__rb_parent_color;
+		parent = __rb_parent(pc);
+		__rb_change_child(node, child, parent, root);
+		if (child) {
+			child->__rb_parent_color = pc;
+			rebalance = NULL;
+		} else
+			rebalance = __rb_is_black(pc) ? parent : NULL;
+		tmp = parent;
+	} else if (!child) {
+		/* Still case 1, but this time the child is node->rb_left */
+		tmp->__rb_parent_color = pc = node->__rb_parent_color;
+		parent = __rb_parent(pc);
+		__rb_change_child(node, tmp, parent, root);
+		rebalance = NULL;
+		tmp = parent;
+	} else {
+		struct rb_node *successor = child, *child2;
+
+		tmp = child->rb_left;
+		if (!tmp) {
+			/*
+			 * Case 2: node's successor is its right child
+			 *
+			 *    (n)          (s)
+			 *    / \          / \
+			 *  (x) (s)  ->  (x) (c)
+			 *        \
+			 *        (c)
+			 */
+			parent = successor;
+			child2 = successor->rb_right;
+
+			augment->copy(node, successor);
+		} else {
+			/*
+			 * Case 3: node's successor is leftmost under
+			 * node's right child subtree
+			 *
+			 *    (n)          (s)
+			 *    / \          / \
+			 *  (x) (y)  ->  (x) (y)
+			 *      /            /
+			 *    (p)          (p)
+			 *    /            /
+			 *  (s)          (c)
+			 *    \
+			 *    (c)
+			 */
+			do {
+				parent = successor;
+				successor = tmp;
+				tmp = tmp->rb_left;
+			} while (tmp);
+			child2 = successor->rb_right;
+			WRITE_ONCE(parent->rb_left, child2);
+			WRITE_ONCE(successor->rb_right, child);
+			rb_set_parent(child, successor);
+
+			augment->copy(node, successor);
+			augment->propagate(parent, successor);
+		}
+
+		tmp = node->rb_left;
+		WRITE_ONCE(successor->rb_left, tmp);
+		rb_set_parent(tmp, successor);
+
+		pc = node->__rb_parent_color;
+		tmp = __rb_parent(pc);
+		__rb_change_child(node, successor, tmp, root);
+
+		if (child2) {
+			rb_set_parent_color(child2, parent, RB_BLACK);
+			rebalance = NULL;
+		} else {
+			rebalance = rb_is_black(successor) ? parent : NULL;
+		}
+		successor->__rb_parent_color = pc;
+		tmp = successor;
+	}
+
+	augment->propagate(tmp, NULL);
+	return rebalance;
+}
+
+static __always_inline void
+rb_erase_augmented(struct rb_node *node, struct rb_root *root,
+		   const struct rb_augment_callbacks *augment)
+{
+	struct rb_node *rebalance = __rb_erase_augmented(node, root, augment);
+	if (rebalance)
+		__rb_erase_color(rebalance, root, augment->rotate);
+}
+
+static __always_inline void
+rb_erase_augmented_cached(struct rb_node *node, struct rb_root_cached *root,
+			  const struct rb_augment_callbacks *augment)
+{
+	if (root->rb_leftmost == node)
+		root->rb_leftmost = rb_next(node);
+	rb_erase_augmented(node, &root->rb_root, augment);
+}
+
+#endif	/* _LINUX_RBTREE_AUGMENTED_H */
diff --git a/dlm_controld/rbtree_types.h b/dlm_controld/rbtree_types.h
new file mode 100644
index 00000000..d6ed9045
--- /dev/null
+++ b/dlm_controld/rbtree_types.h
@@ -0,0 +1,34 @@
+/* Copied from linux/include/linux/rbtree_types.h */
+#ifndef _LINUX_RBTREE_TYPES_H
+#define _LINUX_RBTREE_TYPES_H
+
+struct rb_node {
+	unsigned long  __rb_parent_color;
+	struct rb_node *rb_right;
+	struct rb_node *rb_left;
+} __attribute__((aligned(sizeof(long))));
+/* The alignment might seem pointless, but allegedly CRIS needs it */
+
+struct rb_root {
+	struct rb_node *rb_node;
+};
+
+/*
+ * Leftmost-cached rbtrees.
+ *
+ * We do not cache the rightmost node based on footprint
+ * size vs number of potential users that could benefit
+ * from O(1) rb_last(). Just not worth it, users that want
+ * this feature can always implement the logic explicitly.
+ * Furthermore, users that want to cache both pointers may
+ * find it a bit asymmetric, but that's ok.
+ */
+struct rb_root_cached {
+	struct rb_root rb_root;
+	struct rb_node *rb_leftmost;
+};
+
+#define RB_ROOT (struct rb_root) { NULL, }
+#define RB_ROOT_CACHED (struct rb_root_cached) { {NULL, }, NULL }
+
+#endif
-- 
2.31.1

