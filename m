Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4678C8D8C7
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Aug 2019 19:02:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E116C64132;
	Wed, 14 Aug 2019 17:02:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD15E1001944;
	Wed, 14 Aug 2019 17:02:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1CA218089C8;
	Wed, 14 Aug 2019 17:02:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EH1Mv0028935 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 13:01:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB96283090; Wed, 14 Aug 2019 17:01:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C129883078
	for <cluster-devel@redhat.com>; Wed, 14 Aug 2019 17:01:21 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 14 Aug 2019 18:01:05 +0100
Message-Id: <20190814170105.8775-6-anprice@redhat.com>
In-Reply-To: <20190814170105.8775-1-anprice@redhat.com>
References: <20190814170105.8775-1-anprice@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 5/5] Remove osi_list.h
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 14 Aug 2019 17:02:34 +0000 (UTC)

No longer required.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/include/Makefile.am |  1 -
 gfs2/include/osi_list.h  | 84 ----------------------------------------
 2 files changed, 85 deletions(-)
 delete mode 100644 gfs2/include/osi_list.h

diff --git a/gfs2/include/Makefile.am b/gfs2/include/Makefile.am
index a03808b4..a4ebe923 100644
--- a/gfs2/include/Makefile.am
+++ b/gfs2/include/Makefile.am
@@ -1,7 +1,6 @@
 MAINTAINERCLEANFILES = Makefile.in
 
 noinst_HEADERS = \
-	osi_list.h \
 	list.h \
 	osi_tree.h \
 	linux_endian.h \
diff --git a/gfs2/include/osi_list.h b/gfs2/include/osi_list.h
deleted file mode 100644
index 3b1483ba..00000000
--- a/gfs2/include/osi_list.h
+++ /dev/null
@@ -1,84 +0,0 @@
-#ifndef __OSI_LIST_DOT_H__
-#define __OSI_LIST_DOT_H__
-
-
-
-struct osi_list
-{
-  struct osi_list *next, *prev;
-};
-typedef struct osi_list osi_list_t;
-
-
-
-#define osi_list_decl(var) osi_list_t var = { &var, &var }
-
-#define osi_list_empty(var) ((var)->next == (var))
-#define osi_list_entry(var, type, mem) ((type *)((unsigned long)(var) - (unsigned long)(&((type *)NULL)->mem)))
-
-
-
-#define osi_list_init(head) \
-do \
-{ \
-  osi_list_t *osi_list_var = (head); \
-  osi_list_var->next = osi_list_var->prev = osi_list_var; \
-} \
-while (0)
-
-#define osi_list_add(new, head) \
-do \
-{ \
-  osi_list_t *osi_list_var_new = (new); \
-  osi_list_t *osi_list_var_head = (head); \
-  osi_list_var_new->next = osi_list_var_head->next; \
-  osi_list_var_new->prev = osi_list_var_head; \
-  osi_list_var_head->next->prev = osi_list_var_new; \
-  osi_list_var_head->next = osi_list_var_new; \
-} \
-while (0)
-
-#define osi_list_add_next osi_list_add
-
-#define osi_list_add_prev(new, head) \
-do \
-{ \
-  osi_list_t *osi_list_var_new = (new); \
-  osi_list_t *osi_list_var_head = (head); \
-  osi_list_var_new->prev = osi_list_var_head->prev; \
-  osi_list_var_new->next = osi_list_var_head; \
-  osi_list_var_head->prev->next = osi_list_var_new; \
-  osi_list_var_head->prev = osi_list_var_new; \
-} \
-while (0)
-
-#define osi_list_del(var) \
-do \
-{ \
-  osi_list_t *osi_list_var = (var); \
-  osi_list_var->next->prev = osi_list_var->prev; \
-  osi_list_var->prev->next = osi_list_var->next; \
-} \
-while (0)
-
-#define osi_list_del_init(var) \
-do \
-{ \
-  osi_list_t *osi_list_var = (var); \
-  osi_list_var->next->prev = osi_list_var->prev; \
-  osi_list_var->prev->next = osi_list_var->next; \
-  osi_list_var->next = osi_list_var->prev = osi_list_var; \
-} \
-while (0)
-
-#define osi_list_foreach(tmp, head) \
-  for ((tmp) = (head)->next; (tmp) != (head); (tmp) = (tmp)->next) 
-
-#define osi_list_foreach_safe(tmp, head, x) \
-  for ((tmp) = (head)->next, (x) = (tmp)->next; \
-       (tmp) != (head); \
-       (tmp) = (x), (x) = (x)->next)
-
-
-
-#endif  /*  __OSI_LIST_DOT_H__  */
-- 
2.21.0

