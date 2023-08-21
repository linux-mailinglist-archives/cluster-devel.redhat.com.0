Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC97782E62
	for <lists+cluster-devel@lfdr.de>; Mon, 21 Aug 2023 18:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692635161;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2FrFpvr+QZPd+TI02MSO5RTTfmyEprcYYz9ZjEuqgd4=;
	b=KAFqkFAaNy3yMn30cQZl0ynwuDvF5Yy56DRRdrteyIR0iloe1VYOdAGil/OBZFTCAIC5IW
	igi+0+yshWPobi8XQH8cIFRE7jAnfyBHypkXtrJ7HuWm0sN+739c1880oc7HpES5nXW6aV
	eBQ8Lxhtr1VXfLxEK9SsItqfNn5haMs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-Tayh0NwrMX6MlfFIyF3wzQ-1; Mon, 21 Aug 2023 12:25:57 -0400
X-MC-Unique: Tayh0NwrMX6MlfFIyF3wzQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E476D823D68;
	Mon, 21 Aug 2023 16:25:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D700E4021B9;
	Mon, 21 Aug 2023 16:25:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7A22F1946597;
	Mon, 21 Aug 2023 16:25:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0F1A41946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 21 Aug 2023 16:25:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F1C8F492C1B; Mon, 21 Aug 2023 16:25:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7F90492C13;
 Mon, 21 Aug 2023 16:25:48 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 21 Aug 2023 12:25:40 -0400
Message-Id: <20230821162540.594227-3-aahringo@redhat.com>
In-Reply-To: <20230821162540.594227-1-aahringo@redhat.com>
References: <20230821162540.594227-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH dlm-tool 3/3] dlm_controld: update list
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch updates the list implementation taken from the Linux kernel.
There are new list manipulation functions introduced that could be
became useful later.
---
 dlm_controld/linux_helpers.h |   7 +
 dlm_controld/list.h          | 667 ++++++++++++++++++++++++++++++-----
 2 files changed, 576 insertions(+), 98 deletions(-)

diff --git a/dlm_controld/linux_helpers.h b/dlm_controld/linux_helpers.h
index 09705cff..f959cf55 100644
--- a/dlm_controld/linux_helpers.h
+++ b/dlm_controld/linux_helpers.h
@@ -24,6 +24,11 @@
 
 #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
 
+#define POISON_POINTER_DELTA 0xdeadbeef
+
+#define LIST_POISON1  ((void *) 0x100 + POISON_POINTER_DELTA)
+#define LIST_POISON2  ((void *) 0x122 + POISON_POINTER_DELTA)
+
 /**
  * container_of - cast a member of a structure out to the containing structure
  * @ptr:	the pointer to the member.
@@ -39,6 +44,8 @@
 		      "pointer type mismatch in container_of()");	\
 	((type *)(__mptr - offsetof(type, member))); })
 
+#define READ_ONCE(x)  (*(const volatile typeof(x) *)&(x))
+
 #define WRITE_ONCE(x, val)				\
 do {							\
 	*(volatile typeof(x) *)&(x) = (val);		\
diff --git a/dlm_controld/list.h b/dlm_controld/list.h
index e9df2ef2..aab3b2b0 100644
--- a/dlm_controld/list.h
+++ b/dlm_controld/list.h
@@ -1,20 +1,17 @@
-/* Copied from include/linux/list.h */
-
+/*  Copied from include/linux/list.h */
 #ifndef _LINUX_LIST_H
 #define _LINUX_LIST_H
 
+#include <stdbool.h>
+
 #include "linux_helpers.h"
 
-/*
- * These are non-NULL pointers that will result in page faults
- * under normal circumstances, used to verify that nobody uses
- * non-initialized list entries.
- */
-#define LIST_POISON1  ((void *) 0x00100100)
-#define LIST_POISON2  ((void *) 0x00200200)
+struct list_head {
+	struct list_head *next, *prev;
+};
 
 /*
- * Simple doubly linked list implementation.
+ * Circular doubly linked list implementation.
  *
  * Some of the internal functions ("__xxx") are useful when
  * manipulating whole lists rather than single entries, as
@@ -23,21 +20,44 @@
  * using the generic single-entry routines.
  */
 
-struct list_head {
-	struct list_head *next, *prev;
-};
-
 #define LIST_HEAD_INIT(name) { &(name), &(name) }
 
 #define LIST_HEAD(name) \
 	struct list_head name = LIST_HEAD_INIT(name)
 
-#define INIT_LIST_HEAD(ptr) do { \
-	(ptr)->next = (ptr); (ptr)->prev = (ptr); \
-} while (0)
+/**
+ * INIT_LIST_HEAD - Initialize a list_head structure
+ * @list: list_head structure to be initialized.
+ *
+ * Initializes the list_head to point to itself.  If it is a list header,
+ * the result is an empty list.
+ */
+static inline void INIT_LIST_HEAD(struct list_head *list)
+{
+	WRITE_ONCE(list->next, list);
+	WRITE_ONCE(list->prev, list);
+}
+
+#ifdef CONFIG_DEBUG_LIST
+extern bool __list_add_valid(struct list_head *new,
+			      struct list_head *prev,
+			      struct list_head *next);
+extern bool __list_del_entry_valid(struct list_head *entry);
+#else
+static inline bool __list_add_valid(struct list_head *new,
+				struct list_head *prev,
+				struct list_head *next)
+{
+	return true;
+}
+static inline bool __list_del_entry_valid(struct list_head *entry)
+{
+	return true;
+}
+#endif
 
 /*
- * Insert a new entry between two known consecutive entries. 
+ * Insert a new entry between two known consecutive entries.
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
@@ -46,10 +66,13 @@ static inline void __list_add(struct list_head *new,
 			      struct list_head *prev,
 			      struct list_head *next)
 {
+	if (!__list_add_valid(new, prev, next))
+		return;
+
 	next->prev = new;
 	new->next = next;
 	new->prev = prev;
-	prev->next = new;
+	WRITE_ONCE(prev->next, new);
 }
 
 /**
@@ -65,6 +88,7 @@ static inline void list_add(struct list_head *new, struct list_head *head)
 	__list_add(new, head, head->next);
 }
 
+
 /**
  * list_add_tail - add a new entry
  * @new: new entry to be added
@@ -88,30 +112,99 @@ static inline void list_add_tail(struct list_head *new, struct list_head *head)
 static inline void __list_del(struct list_head * prev, struct list_head * next)
 {
 	next->prev = prev;
-	prev->next = next;
+	WRITE_ONCE(prev->next, next);
+}
+
+/*
+ * Delete a list entry and clear the 'prev' pointer.
+ *
+ * This is a special-purpose list clearing method used in the networking code
+ * for lists allocated as per-cpu, where we don't want to incur the extra
+ * WRITE_ONCE() overhead of a regular list_del_init(). The code that uses this
+ * needs to check the node 'prev' pointer instead of calling list_empty().
+ */
+static inline void __list_del_clearprev(struct list_head *entry)
+{
+	__list_del(entry->prev, entry->next);
+	entry->prev = NULL;
+}
+
+static inline void __list_del_entry(struct list_head *entry)
+{
+	if (!__list_del_entry_valid(entry))
+		return;
+
+	__list_del(entry->prev, entry->next);
 }
 
 /**
  * list_del - deletes entry from list.
  * @entry: the element to delete from the list.
- * Note: list_empty on entry does not return true after this, the entry is
+ * Note: list_empty() on entry does not return true after this, the entry is
  * in an undefined state.
  */
 static inline void list_del(struct list_head *entry)
 {
-	__list_del(entry->prev, entry->next);
+	__list_del_entry(entry);
 	entry->next = LIST_POISON1;
 	entry->prev = LIST_POISON2;
 }
 
+/**
+ * list_replace - replace old entry by new one
+ * @old : the element to be replaced
+ * @new : the new element to insert
+ *
+ * If @old was empty, it will be overwritten.
+ */
+static inline void list_replace(struct list_head *old,
+				struct list_head *new)
+{
+	new->next = old->next;
+	new->next->prev = new;
+	new->prev = old->prev;
+	new->prev->next = new;
+}
+
+/**
+ * list_replace_init - replace old entry by new one and initialize the old one
+ * @old : the element to be replaced
+ * @new : the new element to insert
+ *
+ * If @old was empty, it will be overwritten.
+ */
+static inline void list_replace_init(struct list_head *old,
+				     struct list_head *new)
+{
+	list_replace(old, new);
+	INIT_LIST_HEAD(old);
+}
+
+/**
+ * list_swap - replace entry1 with entry2 and re-add entry1 at entry2's position
+ * @entry1: the location to place entry2
+ * @entry2: the location to place entry1
+ */
+static inline void list_swap(struct list_head *entry1,
+			     struct list_head *entry2)
+{
+	struct list_head *pos = entry2->prev;
+
+	list_del(entry2);
+	list_replace(entry1, entry2);
+	if (pos == entry1)
+		pos = entry2;
+	list_add(entry1, pos);
+}
+
 /**
  * list_del_init - deletes entry from list and reinitialize it.
  * @entry: the element to delete from the list.
  */
 static inline void list_del_init(struct list_head *entry)
 {
-	__list_del(entry->prev, entry->next);
-	INIT_LIST_HEAD(entry); 
+	__list_del_entry(entry);
+	INIT_LIST_HEAD(entry);
 }
 
 /**
@@ -121,8 +214,8 @@ static inline void list_del_init(struct list_head *entry)
  */
 static inline void list_move(struct list_head *list, struct list_head *head)
 {
-        __list_del(list->prev, list->next);
-        list_add(list, head);
+	__list_del_entry(list);
+	list_add(list, head);
 }
 
 /**
@@ -133,8 +226,61 @@ static inline void list_move(struct list_head *list, struct list_head *head)
 static inline void list_move_tail(struct list_head *list,
 				  struct list_head *head)
 {
-        __list_del(list->prev, list->next);
-        list_add_tail(list, head);
+	__list_del_entry(list);
+	list_add_tail(list, head);
+}
+
+/**
+ * list_bulk_move_tail - move a subsection of a list to its tail
+ * @head: the head that will follow our entry
+ * @first: first entry to move
+ * @last: last entry to move, can be the same as first
+ *
+ * Move all entries between @first and including @last before @head.
+ * All three entries must belong to the same linked list.
+ */
+static inline void list_bulk_move_tail(struct list_head *head,
+				       struct list_head *first,
+				       struct list_head *last)
+{
+	first->prev->next = last->next;
+	last->next->prev = first->prev;
+
+	head->prev->next = first;
+	first->prev = head->prev;
+
+	last->next = head;
+	head->prev = last;
+}
+
+/**
+ * list_is_first -- tests whether @list is the first entry in list @head
+ * @list: the entry to test
+ * @head: the head of the list
+ */
+static inline int list_is_first(const struct list_head *list, const struct list_head *head)
+{
+	return list->prev == head;
+}
+
+/**
+ * list_is_last - tests whether @list is the last entry in list @head
+ * @list: the entry to test
+ * @head: the head of the list
+ */
+static inline int list_is_last(const struct list_head *list, const struct list_head *head)
+{
+	return list->next == head;
+}
+
+/**
+ * list_is_head - tests whether @list is the list @head
+ * @list: the entry to test
+ * @head: the head of the list
+ */
+static inline int list_is_head(const struct list_head *list, const struct list_head *head)
+{
+	return list == head;
 }
 
 /**
@@ -143,50 +289,155 @@ static inline void list_move_tail(struct list_head *list,
  */
 static inline int list_empty(const struct list_head *head)
 {
-	return head->next == head;
+	return READ_ONCE(head->next) == head;
 }
 
 /**
- * list_empty_careful - tests whether a list is
- * empty _and_ checks that no other CPU might be
- * in the process of still modifying either member
- *
- * NOTE: using list_empty_careful() without synchronization
- * can only be safe if the only activity that can happen
- * to the list entry is list_del_init(). Eg. it cannot be used
- * if another CPU could re-list_add() it.
+ * list_rotate_left - rotate the list to the left
+ * @head: the head of the list
+ */
+static inline void list_rotate_left(struct list_head *head)
+{
+	struct list_head *first;
+
+	if (!list_empty(head)) {
+		first = head->next;
+		list_move_tail(first, head);
+	}
+}
+
+/**
+ * list_rotate_to_front() - Rotate list to specific item.
+ * @list: The desired new front of the list.
+ * @head: The head of the list.
  *
+ * Rotates list so that @list becomes the new front of the list.
+ */
+static inline void list_rotate_to_front(struct list_head *list,
+					struct list_head *head)
+{
+	/*
+	 * Deletes the list head from the list denoted by @head and
+	 * places it as the tail of @list, this effectively rotates the
+	 * list so that @list is at the front.
+	 */
+	list_move_tail(head, list);
+}
+
+/**
+ * list_is_singular - tests whether a list has just one entry.
  * @head: the list to test.
  */
-static inline int list_empty_careful(const struct list_head *head)
+static inline int list_is_singular(const struct list_head *head)
 {
-	struct list_head *next = head->next;
-	return (next == head) && (next == head->prev);
+	return !list_empty(head) && (head->next == head->prev);
 }
 
-static inline void __list_splice(struct list_head *list,
-				 struct list_head *head)
+static inline void __list_cut_position(struct list_head *list,
+		struct list_head *head, struct list_head *entry)
+{
+	struct list_head *new_first = entry->next;
+	list->next = head->next;
+	list->next->prev = list;
+	list->prev = entry;
+	entry->next = list;
+	head->next = new_first;
+	new_first->prev = head;
+}
+
+/**
+ * list_cut_position - cut a list into two
+ * @list: a new list to add all removed entries
+ * @head: a list with entries
+ * @entry: an entry within head, could be the head itself
+ *	and if so we won't cut the list
+ *
+ * This helper moves the initial part of @head, up to and
+ * including @entry, from @head to @list. You should
+ * pass on @entry an element you know is on @head. @list
+ * should be an empty list or a list you do not care about
+ * losing its data.
+ *
+ */
+static inline void list_cut_position(struct list_head *list,
+		struct list_head *head, struct list_head *entry)
+{
+	if (list_empty(head))
+		return;
+	if (list_is_singular(head) && !list_is_head(entry, head) && (entry != head->next))
+		return;
+	if (list_is_head(entry, head))
+		INIT_LIST_HEAD(list);
+	else
+		__list_cut_position(list, head, entry);
+}
+
+/**
+ * list_cut_before - cut a list into two, before given entry
+ * @list: a new list to add all removed entries
+ * @head: a list with entries
+ * @entry: an entry within head, could be the head itself
+ *
+ * This helper moves the initial part of @head, up to but
+ * excluding @entry, from @head to @list.  You should pass
+ * in @entry an element you know is on @head.  @list should
+ * be an empty list or a list you do not care about losing
+ * its data.
+ * If @entry == @head, all entries on @head are moved to
+ * @list.
+ */
+static inline void list_cut_before(struct list_head *list,
+				   struct list_head *head,
+				   struct list_head *entry)
+{
+	if (head->next == entry) {
+		INIT_LIST_HEAD(list);
+		return;
+	}
+	list->next = head->next;
+	list->next->prev = list;
+	list->prev = entry->prev;
+	list->prev->next = list;
+	head->next = entry;
+	entry->prev = head;
+}
+
+static inline void __list_splice(const struct list_head *list,
+				 struct list_head *prev,
+				 struct list_head *next)
 {
 	struct list_head *first = list->next;
 	struct list_head *last = list->prev;
-	struct list_head *at = head->next;
 
-	first->prev = head;
-	head->next = first;
+	first->prev = prev;
+	prev->next = first;
 
-	last->next = at;
-	at->prev = last;
+	last->next = next;
+	next->prev = last;
+}
+
+/**
+ * list_splice - join two lists, this is designed for stacks
+ * @list: the new list to add.
+ * @head: the place to add it in the first list.
+ */
+static inline void list_splice(const struct list_head *list,
+				struct list_head *head)
+{
+	if (!list_empty(list))
+		__list_splice(list, head, head->next);
 }
 
 /**
- * list_splice - join two lists
+ * list_splice_tail - join two lists, each list being a queue
  * @list: the new list to add.
  * @head: the place to add it in the first list.
  */
-static inline void list_splice(struct list_head *list, struct list_head *head)
+static inline void list_splice_tail(struct list_head *list,
+				struct list_head *head)
 {
 	if (!list_empty(list))
-		__list_splice(list, head);
+		__list_splice(list, head->prev, head);
 }
 
 /**
@@ -200,7 +451,24 @@ static inline void list_splice_init(struct list_head *list,
 				    struct list_head *head)
 {
 	if (!list_empty(list)) {
-		__list_splice(list, head);
+		__list_splice(list, head, head->next);
+		INIT_LIST_HEAD(list);
+	}
+}
+
+/**
+ * list_splice_tail_init - join two lists and reinitialise the emptied list
+ * @list: the new list to add.
+ * @head: the place to add it in the first list.
+ *
+ * Each of the lists is a queue.
+ * The list at @list is reinitialised
+ */
+static inline void list_splice_tail_init(struct list_head *list,
+					 struct list_head *head)
+{
+	if (!list_empty(list)) {
+		__list_splice(list, head->prev, head);
 		INIT_LIST_HEAD(list);
 	}
 }
@@ -209,117 +477,320 @@ static inline void list_splice_init(struct list_head *list,
  * list_entry - get the struct for this entry
  * @ptr:	the &struct list_head pointer.
  * @type:	the type of the struct this is embedded in.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  */
 #define list_entry(ptr, type, member) \
 	container_of(ptr, type, member)
 
 /**
  * list_first_entry - get the first element from a list
- * @ptr:        the list head to take the element from.
- * @type:       the type of the struct this is embedded in.
- * @member:     the name of the list_struct within the struct.
+ * @ptr:	the list head to take the element from.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the name of the list_head within the struct.
  *
  * Note, that list is expected to be not empty.
  */
 #define list_first_entry(ptr, type, member) \
 	list_entry((ptr)->next, type, member)
 
+/**
+ * list_last_entry - get the last element from a list
+ * @ptr:	the list head to take the element from.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Note, that list is expected to be not empty.
+ */
+#define list_last_entry(ptr, type, member) \
+	list_entry((ptr)->prev, type, member)
+
+/**
+ * list_first_entry_or_null - get the first element from a list
+ * @ptr:	the list head to take the element from.
+ * @type:	the type of the struct this is embedded in.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Note that if the list is empty, it returns NULL.
+ */
+#define list_first_entry_or_null(ptr, type, member) ({ \
+	struct list_head *head__ = (ptr); \
+	struct list_head *pos__ = READ_ONCE(head__->next); \
+	pos__ != head__ ? list_entry(pos__, type, member) : NULL; \
+})
+
+/**
+ * list_next_entry - get the next element in list
+ * @pos:	the type * to cursor
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_next_entry(pos, member) \
+	list_entry((pos)->member.next, typeof(*(pos)), member)
+
+/**
+ * list_next_entry_circular - get the next element in list
+ * @pos:	the type * to cursor.
+ * @head:	the list head to take the element from.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Wraparound if pos is the last element (return the first element).
+ * Note, that list is expected to be not empty.
+ */
+#define list_next_entry_circular(pos, head, member) \
+	(list_is_last(&(pos)->member, head) ? \
+	list_first_entry(head, typeof(*(pos)), member) : list_next_entry(pos, member))
+
+/**
+ * list_prev_entry - get the prev element in list
+ * @pos:	the type * to cursor
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_prev_entry(pos, member) \
+	list_entry((pos)->member.prev, typeof(*(pos)), member)
+
+/**
+ * list_prev_entry_circular - get the prev element in list
+ * @pos:	the type * to cursor.
+ * @head:	the list head to take the element from.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Wraparound if pos is the first element (return the last element).
+ * Note, that list is expected to be not empty.
+ */
+#define list_prev_entry_circular(pos, head, member) \
+	(list_is_first(&(pos)->member, head) ? \
+	list_last_entry(head, typeof(*(pos)), member) : list_prev_entry(pos, member))
+
 /**
  * list_for_each	-	iterate over a list
- * @pos:	the &struct list_head to use as a loop counter.
+ * @pos:	the &struct list_head to use as a loop cursor.
  * @head:	the head for your list.
  */
 #define list_for_each(pos, head) \
-	for (pos = (head)->next; pos != (head); pos = pos->next)
+	for (pos = (head)->next; !list_is_head(pos, (head)); pos = pos->next)
 
 /**
- * __list_for_each	-	iterate over a list
- * @pos:	the &struct list_head to use as a loop counter.
+ * list_for_each_continue - continue iteration over a list
+ * @pos:	the &struct list_head to use as a loop cursor.
  * @head:	the head for your list.
  *
- * This variant differs from list_for_each() in that it's the
- * simplest possible list iteration code, no prefetching is done.
- * Use this for code that knows the list to be very short (empty
- * or 1 entry) most of the time.
+ * Continue to iterate over a list, continuing after the current position.
  */
-#define __list_for_each(pos, head) \
-	for (pos = (head)->next; pos != (head); pos = pos->next)
+#define list_for_each_continue(pos, head) \
+	for (pos = pos->next; !list_is_head(pos, (head)); pos = pos->next)
 
 /**
  * list_for_each_prev	-	iterate over a list backwards
- * @pos:	the &struct list_head to use as a loop counter.
+ * @pos:	the &struct list_head to use as a loop cursor.
  * @head:	the head for your list.
  */
 #define list_for_each_prev(pos, head) \
-	for (pos = (head)->prev; pos != (head); pos = pos->prev)
-        	
+	for (pos = (head)->prev; !list_is_head(pos, (head)); pos = pos->prev)
+
 /**
- * list_for_each_safe	-	iterate over a list safe against removal of list entry
- * @pos:	the &struct list_head to use as a loop counter.
+ * list_for_each_safe - iterate over a list safe against removal of list entry
+ * @pos:	the &struct list_head to use as a loop cursor.
  * @n:		another &struct list_head to use as temporary storage
  * @head:	the head for your list.
  */
 #define list_for_each_safe(pos, n, head) \
-	for (pos = (head)->next, n = pos->next; pos != (head); \
-		pos = n, n = pos->next)
+	for (pos = (head)->next, n = pos->next; \
+	     !list_is_head(pos, (head)); \
+	     pos = n, n = pos->next)
+
+/**
+ * list_for_each_prev_safe - iterate over a list backwards safe against removal of list entry
+ * @pos:	the &struct list_head to use as a loop cursor.
+ * @n:		another &struct list_head to use as temporary storage
+ * @head:	the head for your list.
+ */
+#define list_for_each_prev_safe(pos, n, head) \
+	for (pos = (head)->prev, n = pos->prev; \
+	     !list_is_head(pos, (head)); \
+	     pos = n, n = pos->prev)
+
+/**
+ * list_count_nodes - count nodes in the list
+ * @head:	the head for your list.
+ */
+static inline size_t list_count_nodes(struct list_head *head)
+{
+	struct list_head *pos;
+	size_t count = 0;
+
+	list_for_each(pos, head)
+		count++;
+
+	return count;
+}
+
+/**
+ * list_entry_is_head - test if the entry points to the head of the list
+ * @pos:	the type * to cursor
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ */
+#define list_entry_is_head(pos, head, member)				\
+	(&pos->member == (head))
 
 /**
  * list_for_each_entry	-	iterate over list of given type
- * @pos:	the type * to use as a loop counter.
+ * @pos:	the type * to use as a loop cursor.
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  */
 #define list_for_each_entry(pos, head, member)				\
-	for (pos = list_entry((head)->next, typeof(*pos), member);	\
-	     &pos->member != (head); 					\
-	     pos = list_entry(pos->member.next, typeof(*pos), member))
+	for (pos = list_first_entry(head, typeof(*pos), member);	\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = list_next_entry(pos, member))
 
 /**
  * list_for_each_entry_reverse - iterate backwards over list of given type.
- * @pos:	the type * to use as a loop counter.
+ * @pos:	the type * to use as a loop cursor.
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  */
 #define list_for_each_entry_reverse(pos, head, member)			\
-	for (pos = list_entry((head)->prev, typeof(*pos), member);	\
-	     &pos->member != (head); 					\
-	     pos = list_entry(pos->member.prev, typeof(*pos), member))
+	for (pos = list_last_entry(head, typeof(*pos), member);		\
+	     !list_entry_is_head(pos, head, member); 			\
+	     pos = list_prev_entry(pos, member))
 
 /**
- * list_prepare_entry - prepare a pos entry for use as a start point in
- *			list_for_each_entry_continue
+ * list_prepare_entry - prepare a pos entry for use in list_for_each_entry_continue()
  * @pos:	the type * to use as a start point
  * @head:	the head of the list
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Prepares a pos entry for use as a start point in list_for_each_entry_continue().
  */
 #define list_prepare_entry(pos, head, member) \
 	((pos) ? : list_entry(head, typeof(*pos), member))
 
 /**
- * list_for_each_entry_continue -	iterate over list of given type
- *			continuing after existing point
- * @pos:	the type * to use as a loop counter.
+ * list_for_each_entry_continue - continue iteration over list of given type
+ * @pos:	the type * to use as a loop cursor.
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Continue to iterate over list of given type, continuing after
+ * the current position.
  */
 #define list_for_each_entry_continue(pos, head, member) 		\
-	for (pos = list_entry(pos->member.next, typeof(*pos), member);  \
-	     &pos->member != (head);					\
-	     pos = list_entry(pos->member.next, typeof(*pos), member))
+	for (pos = list_next_entry(pos, member);			\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = list_next_entry(pos, member))
+
+/**
+ * list_for_each_entry_continue_reverse - iterate backwards from the given point
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Start to iterate over list of given type backwards, continuing after
+ * the current position.
+ */
+#define list_for_each_entry_continue_reverse(pos, head, member)		\
+	for (pos = list_prev_entry(pos, member);			\
+	     !list_entry_is_head(pos, head, member);			\
+	     pos = list_prev_entry(pos, member))
+
+/**
+ * list_for_each_entry_from - iterate over list of given type from the current point
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type, continuing from current position.
+ */
+#define list_for_each_entry_from(pos, head, member) 			\
+	for (; !list_entry_is_head(pos, head, member);			\
+	     pos = list_next_entry(pos, member))
+
+/**
+ * list_for_each_entry_from_reverse - iterate backwards over list of given type
+ *                                    from the current point
+ * @pos:	the type * to use as a loop cursor.
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate backwards over list of given type, continuing from current position.
+ */
+#define list_for_each_entry_from_reverse(pos, head, member)		\
+	for (; !list_entry_is_head(pos, head, member);			\
+	     pos = list_prev_entry(pos, member))
 
 /**
  * list_for_each_entry_safe - iterate over list of given type safe against removal of list entry
- * @pos:	the type * to use as a loop counter.
+ * @pos:	the type * to use as a loop cursor.
  * @n:		another type * to use as temporary storage
  * @head:	the head for your list.
- * @member:	the name of the list_struct within the struct.
+ * @member:	the name of the list_head within the struct.
  */
 #define list_for_each_entry_safe(pos, n, head, member)			\
-	for (pos = list_entry((head)->next, typeof(*pos), member),	\
-		n = list_entry(pos->member.next, typeof(*pos), member);	\
-	     &pos->member != (head); 					\
-	     pos = n, n = list_entry(n->member.next, typeof(*n), member))
+	for (pos = list_first_entry(head, typeof(*pos), member),	\
+		n = list_next_entry(pos, member);			\
+	     !list_entry_is_head(pos, head, member); 			\
+	     pos = n, n = list_next_entry(n, member))
+
+/**
+ * list_for_each_entry_safe_continue - continue list iteration safe against removal
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		another type * to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type, continuing after current point,
+ * safe against removal of list entry.
+ */
+#define list_for_each_entry_safe_continue(pos, n, head, member) 		\
+	for (pos = list_next_entry(pos, member), 				\
+		n = list_next_entry(pos, member);				\
+	     !list_entry_is_head(pos, head, member);				\
+	     pos = n, n = list_next_entry(n, member))
 
+/**
+ * list_for_each_entry_safe_from - iterate over list from current point safe against removal
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		another type * to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate over list of given type from current point, safe against
+ * removal of list entry.
+ */
+#define list_for_each_entry_safe_from(pos, n, head, member) 			\
+	for (n = list_next_entry(pos, member);					\
+	     !list_entry_is_head(pos, head, member);				\
+	     pos = n, n = list_next_entry(n, member))
+
+/**
+ * list_for_each_entry_safe_reverse - iterate backwards over list safe against removal
+ * @pos:	the type * to use as a loop cursor.
+ * @n:		another type * to use as temporary storage
+ * @head:	the head for your list.
+ * @member:	the name of the list_head within the struct.
+ *
+ * Iterate backwards over list of given type, safe against removal
+ * of list entry.
+ */
+#define list_for_each_entry_safe_reverse(pos, n, head, member)		\
+	for (pos = list_last_entry(head, typeof(*pos), member),		\
+		n = list_prev_entry(pos, member);			\
+	     !list_entry_is_head(pos, head, member); 			\
+	     pos = n, n = list_prev_entry(n, member))
+
+/**
+ * list_safe_reset_next - reset a stale list_for_each_entry_safe loop
+ * @pos:	the loop cursor used in the list_for_each_entry_safe loop
+ * @n:		temporary storage used in list_for_each_entry_safe
+ * @member:	the name of the list_head within the struct.
+ *
+ * list_safe_reset_next is not safe to use in general if the list may be
+ * modified concurrently (eg. the lock is dropped in the loop body). An
+ * exception to this is if the cursor element (pos) is pinned in the list,
+ * and list_safe_reset_next is called after re-taking the lock and before
+ * completing the current iteration of the loop body.
+ */
+#define list_safe_reset_next(pos, n, member)				\
+	n = list_next_entry(pos, member)
 
 #endif
-- 
2.31.1

