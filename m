Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81153F019
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:18 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-eLhzdPacPXyxyOYG2IO_Bw-1; Mon, 06 Jun 2022 16:41:13 -0400
X-MC-Unique: eLhzdPacPXyxyOYG2IO_Bw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCDC9100BAB9;
	Mon,  6 Jun 2022 20:41:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE5841121319;
	Mon,  6 Jun 2022 20:41:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 671BA194707C;
	Mon,  6 Jun 2022 20:41:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D38B9194706E for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Jun 2022 20:41:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B55661121319; Mon,  6 Jun 2022 20:41:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B11E51121315
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92CF918A662F
 for <cluster-devel@redhat.com>; Mon,  6 Jun 2022 20:41:11 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-xAcxHV6HM6Swi5D2tDOVig-1; Mon, 06 Jun 2022 16:41:09 -0400
X-MC-Unique: xAcxHV6HM6Swi5D2tDOVig-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWw-00B19J-Kl; Mon, 06 Jun 2022 20:40:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:31 +0100
Message-Id: <20220606204050.2625949-2-willy@infradead.org>
In-Reply-To: <20220606204050.2625949-1-willy@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH 01/20] fs: Add aops->migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Provide a folio-based replacement for aops->migratepage.  Update the
documentation to document migrate_folio instead of migratepage.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 Documentation/filesystems/locking.rst |  5 ++--
 Documentation/filesystems/vfs.rst     | 13 ++++++-----
 Documentation/vm/page_migration.rst   | 33 ++++++++++++++-------------
 include/linux/fs.h                    |  4 +++-
 mm/compaction.c                       |  4 +++-
 mm/migrate.c                          | 19 ++++++++++-----
 6 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
index c0fe711f14d3..3d28b23676bd 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -253,7 +253,8 @@ prototypes::
 	void (*free_folio)(struct folio *);
 	int (*direct_IO)(struct kiocb *, struct iov_iter *iter);
 	bool (*isolate_page) (struct page *, isolate_mode_t);
-	int (*migratepage)(struct address_space *, struct page *, struct page *);
+	int (*migrate_folio)(struct address_space *, struct folio *dst,
+			struct folio *src, enum migrate_mode);
 	void (*putback_page) (struct page *);
 	int (*launder_folio)(struct folio *);
 	bool (*is_partially_uptodate)(struct folio *, size_t from, size_t count);
@@ -281,7 +282,7 @@ release_folio:		yes
 free_folio:		yes
 direct_IO:
 isolate_page:		yes
-migratepage:		yes (both)
+migrate_folio:		yes (both)
 putback_page:		yes
 launder_folio:		yes
 is_partially_uptodate:	yes
diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index a08c652467d7..3ae1b039b03f 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -740,7 +740,8 @@ cache in your filesystem.  The following members are defined:
 		/* isolate a page for migration */
 		bool (*isolate_page) (struct page *, isolate_mode_t);
 		/* migrate the contents of a page to the specified target */
-		int (*migratepage) (struct page *, struct page *);
+		int (*migrate_folio)(struct mapping *, struct folio *dst,
+				struct folio *src, enum migrate_mode);
 		/* put migration-failed page back to right list */
 		void (*putback_page) (struct page *);
 		int (*launder_folio) (struct folio *);
@@ -935,12 +936,12 @@ cache in your filesystem.  The following members are defined:
 	is successfully isolated, VM marks the page as PG_isolated via
 	__SetPageIsolated.
 
-``migrate_page``
+``migrate_folio``
 	This is used to compact the physical memory usage.  If the VM
-	wants to relocate a page (maybe off a memory card that is
-	signalling imminent failure) it will pass a new page and an old
-	page to this function.  migrate_page should transfer any private
-	data across and update any references that it has to the page.
+	wants to relocate a folio (maybe from a memory device that is
+	signalling imminent failure) it will pass a new folio and an old
+	folio to this function.  migrate_folio should transfer any private
+	data across and update any references that it has to the folio.
 
 ``putback_page``
 	Called by the VM when isolated page's migration fails.
diff --git a/Documentation/vm/page_migration.rst b/Documentation/vm/page_migration.rst
index 8c5cb8147e55..e0f73ddfabb1 100644
--- a/Documentation/vm/page_migration.rst
+++ b/Documentation/vm/page_migration.rst
@@ -181,22 +181,23 @@ which are function pointers of struct address_space_operations.
    Once page is successfully isolated, VM uses page.lru fields so driver
    shouldn't expect to preserve values in those fields.
 
-2. ``int (*migratepage) (struct address_space *mapping,``
-|	``struct page *newpage, struct page *oldpage, enum migrate_mode);``
-
-   After isolation, VM calls migratepage() of driver with the isolated page.
-   The function of migratepage() is to move the contents of the old page to the
-   new page
-   and set up fields of struct page newpage. Keep in mind that you should
-   indicate to the VM the oldpage is no longer movable via __ClearPageMovable()
-   under page_lock if you migrated the oldpage successfully and returned
-   MIGRATEPAGE_SUCCESS. If driver cannot migrate the page at the moment, driver
-   can return -EAGAIN. On -EAGAIN, VM will retry page migration in a short time
-   because VM interprets -EAGAIN as "temporary migration failure". On returning
-   any error except -EAGAIN, VM will give up the page migration without
-   retrying.
-
-   Driver shouldn't touch the page.lru field while in the migratepage() function.
+2. ``int (*migrate_folio) (struct address_space *mapping,``
+|	``struct folio *dst, struct folio *src, enum migrate_mode);``
+
+   After isolation, VM calls the driver's migrate_folio() with the
+   isolated folio.  The purpose of migrate_folio() is to move the contents
+   of the source folio to the destination folio and set up the fields
+   of destination folio.  Keep in mind that you should indicate to the
+   VM the source folio is no longer movable via __ClearPageMovable()
+   under folio if you migrated the source successfully and returned
+   MIGRATEPAGE_SUCCESS.  If driver cannot migrate the folio at the
+   moment, driver can return -EAGAIN. On -EAGAIN, VM will retry folio
+   migration in a short time because VM interprets -EAGAIN as "temporary
+   migration failure".  On returning any error except -EAGAIN, VM will
+   give up the folio migration without retrying.
+
+   Driver shouldn't touch the folio.lru field while in the migrate_folio()
+   function.
 
 3. ``void (*putback_page)(struct page *);``
 
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 9ad5e3520fae..7b380fa66983 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -362,9 +362,11 @@ struct address_space_operations {
 	void (*free_folio)(struct folio *folio);
 	ssize_t (*direct_IO)(struct kiocb *, struct iov_iter *iter);
 	/*
-	 * migrate the contents of a page to the specified target. If
+	 * migrate the contents of a folio to the specified target. If
 	 * migrate_mode is MIGRATE_ASYNC, it must not block.
 	 */
+	int (*migrate_folio)(struct address_space *, struct folio *dst,
+			struct folio *src, enum migrate_mode);
 	int (*migratepage) (struct address_space *,
 			struct page *, struct page *, enum migrate_mode);
 	bool (*isolate_page)(struct page *, isolate_mode_t);
diff --git a/mm/compaction.c b/mm/compaction.c
index 1f89b969c12b..db34b459e5d9 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -1045,7 +1045,9 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
 				goto isolate_fail_put;
 
 			mapping = page_mapping(page);
-			migrate_dirty = !mapping || mapping->a_ops->migratepage;
+			migrate_dirty = !mapping ||
+					mapping->a_ops->migrate_folio ||
+					mapping->a_ops->migratepage;
 			unlock_page(page);
 			if (!migrate_dirty)
 				goto isolate_fail_put;
diff --git a/mm/migrate.c b/mm/migrate.c
index e51588e95f57..75cb6aa38988 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -858,14 +858,17 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 	if (likely(is_lru)) {
 		if (!mapping)
 			rc = migrate_page(mapping, &dst->page, &src->page, mode);
-		else if (mapping->a_ops->migratepage)
+		else if (mapping->a_ops->migrate_folio)
 			/*
-			 * Most pages have a mapping and most filesystems
-			 * provide a migratepage callback. Anonymous pages
+			 * Most folios have a mapping and most filesystems
+			 * provide a migrate_folio callback. Anonymous folios
 			 * are part of swap space which also has its own
-			 * migratepage callback. This is the most common path
+			 * migrate_folio callback. This is the most common path
 			 * for page migration.
 			 */
+			rc = mapping->a_ops->migrate_folio(mapping, dst, src,
+								mode);
+		else if (mapping->a_ops->migratepage)
 			rc = mapping->a_ops->migratepage(mapping, &dst->page,
 							&src->page, mode);
 		else
@@ -883,8 +886,12 @@ static int move_to_new_folio(struct folio *dst, struct folio *src,
 			goto out;
 		}
 
-		rc = mapping->a_ops->migratepage(mapping, &dst->page,
-						&src->page, mode);
+		if (mapping->a_ops->migrate_folio)
+			rc = mapping->a_ops->migrate_folio(mapping, dst, src,
+								mode);
+		else
+			rc = mapping->a_ops->migratepage(mapping, &dst->page,
+							&src->page, mode);
 		WARN_ON_ONCE(rc == MIGRATEPAGE_SUCCESS &&
 				!folio_test_isolated(src));
 	}
-- 
2.35.1

