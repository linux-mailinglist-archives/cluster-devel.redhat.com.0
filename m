Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE32544F2F
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jun 2022 16:35:25 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-v_VqPOhIObuE2Nk8bu0kYQ-1; Thu, 09 Jun 2022 10:35:23 -0400
X-MC-Unique: v_VqPOhIObuE2Nk8bu0kYQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D311F80013E;
	Thu,  9 Jun 2022 14:35:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C752A18EA4;
	Thu,  9 Jun 2022 14:35:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E4BC1947061;
	Thu,  9 Jun 2022 14:35:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CF0931947040 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Jun 2022 14:35:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BF56740885A2; Thu,  9 Jun 2022 14:35:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BBA3540885A1
 for <cluster-devel@redhat.com>; Thu,  9 Jun 2022 14:35:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E6481C05157
 for <cluster-devel@redhat.com>; Thu,  9 Jun 2022 14:35:19 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-HOmpv96sMXeE-T4AtaCUlQ-1; Thu, 09 Jun 2022 10:35:17 -0400
X-MC-Unique: HOmpv96sMXeE-T4AtaCUlQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nzJFc-00DcSb-SM; Thu, 09 Jun 2022 14:35:08 +0000
Date: Thu, 9 Jun 2022 15:35:08 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Hildenbrand <david@redhat.com>
Message-ID: <YqIFHPJZNMrmtXlh@casper.infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-4-willy@infradead.org>
 <b2a81248-03fc-afb3-1041-d8206e95e08a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b2a81248-03fc-afb3-1041-d8206e95e08a@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 03/19] fs: Add aops->migrate_folio
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
 linux-ntfs-dev@lists.sourceforge.net, Christoph Hellwig <hch@lst.de>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 09, 2022 at 02:50:20PM +0200, David Hildenbrand wrote:
> On 08.06.22 17:02, Matthew Wilcox (Oracle) wrote:
> > diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
> > index c0fe711f14d3..3d28b23676bd 100644
> > --- a/Documentation/filesystems/locking.rst
> > +++ b/Documentation/filesystems/locking.rst
> > @@ -253,7 +253,8 @@ prototypes::
> >  	void (*free_folio)(struct folio *);
> >  	int (*direct_IO)(struct kiocb *, struct iov_iter *iter);
> >  	bool (*isolate_page) (struct page *, isolate_mode_t);
> > -	int (*migratepage)(struct address_space *, struct page *, struct page *);
> > +	int (*migrate_folio)(struct address_space *, struct folio *dst,
> > +			struct folio *src, enum migrate_mode);
> >  	void (*putback_page) (struct page *);
> 
> isolate_page/putback_page are leftovers from the previous patch, no?

Argh, right, I completely forgot I needed to update the documentation in
that patch.

> > +++ b/Documentation/vm/page_migration.rst
> > @@ -181,22 +181,23 @@ which are function pointers of struct address_space_operations.
> >     Once page is successfully isolated, VM uses page.lru fields so driver
> >     shouldn't expect to preserve values in those fields.
> >  
> > -2. ``int (*migratepage) (struct address_space *mapping,``
> > -|	``struct page *newpage, struct page *oldpage, enum migrate_mode);``
> > -
> > -   After isolation, VM calls migratepage() of driver with the isolated page.
> > -   The function of migratepage() is to move the contents of the old page to the
> > -   new page
> > -   and set up fields of struct page newpage. Keep in mind that you should
> > -   indicate to the VM the oldpage is no longer movable via __ClearPageMovable()
> > -   under page_lock if you migrated the oldpage successfully and returned
> > -   MIGRATEPAGE_SUCCESS. If driver cannot migrate the page at the moment, driver
> > -   can return -EAGAIN. On -EAGAIN, VM will retry page migration in a short time
> > -   because VM interprets -EAGAIN as "temporary migration failure". On returning
> > -   any error except -EAGAIN, VM will give up the page migration without
> > -   retrying.
> > -
> > -   Driver shouldn't touch the page.lru field while in the migratepage() function.
> > +2. ``int (*migrate_folio) (struct address_space *mapping,``
> > +|	``struct folio *dst, struct folio *src, enum migrate_mode);``
> > +
> > +   After isolation, VM calls the driver's migrate_folio() with the
> > +   isolated folio.  The purpose of migrate_folio() is to move the contents
> > +   of the source folio to the destination folio and set up the fields
> > +   of destination folio.  Keep in mind that you should indicate to the
> > +   VM the source folio is no longer movable via __ClearPageMovable()
> > +   under folio if you migrated the source successfully and returned
> > +   MIGRATEPAGE_SUCCESS.  If driver cannot migrate the folio at the
> > +   moment, driver can return -EAGAIN. On -EAGAIN, VM will retry folio
> > +   migration in a short time because VM interprets -EAGAIN as "temporary
> > +   migration failure".  On returning any error except -EAGAIN, VM will
> > +   give up the folio migration without retrying.
> > +
> > +   Driver shouldn't touch the folio.lru field while in the migrate_folio()
> > +   function.
> >  
> >  3. ``void (*putback_page)(struct page *);``
> 
> Hmm, here it's a bit more complicated now, because we essentially have
> two paths: LRU+migrate_folio or !LRU+movable_ops
> (isolate/migrate/putback page)

Oh ... actually, this is just documenting the driver side of things.
I don't really like how it's written.  Here, have some rewritten
documentation (which is now part of the previous patch):

+++ b/Documentation/vm/page_migration.rst
@@ -152,110 +152,15 @@ Steps:
 Non-LRU page migration
 ======================

-Although migration originally aimed for reducing the latency of memory accesses
-for NUMA, compaction also uses migration to create high-order pages.
+Although migration originally aimed for reducing the latency of memory
+accesses for NUMA, compaction also uses migration to create high-order
+pages.  For compaction purposes, it is also useful to be able to move
+non-LRU pages, such as zsmalloc and virtio-balloon pages.

-Current problem of the implementation is that it is designed to migrate only
-*LRU* pages. However, there are potential non-LRU pages which can be migrated
-in drivers, for example, zsmalloc, virtio-balloon pages.
-
-For virtio-balloon pages, some parts of migration code path have been hooked
-up and added virtio-balloon specific functions to intercept migration logics.
-It's too specific to a driver so other drivers who want to make their pages
-movable would have to add their own specific hooks in the migration path.
-
-To overcome the problem, VM supports non-LRU page migration which provides
-generic functions for non-LRU movable pages without driver specific hooks
-in the migration path.
-
-If a driver wants to make its pages movable, it should define three functions
-which are function pointers of struct address_space_operations.
-
-1. ``bool (*isolate_page) (struct page *page, isolate_mode_t mode);``
-
-   What VM expects from isolate_page() function of driver is to return *true*
-   if driver isolates the page successfully. On returning true, VM marks the page
-   as PG_isolated so concurrent isolation in several CPUs skip the page
-   for isolation. If a driver cannot isolate the page, it should return *false*.
-
-   Once page is successfully isolated, VM uses page.lru fields so driver
-   shouldn't expect to preserve values in those fields.
-
-2. ``int (*migratepage) (struct address_space *mapping,``
-|      ``struct page *newpage, struct page *oldpage, enum migrate_mode);``
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
-
-3. ``void (*putback_page)(struct page *);``
-
-   If migration fails on the isolated page, VM should return the isolated page
-   to the driver so VM calls the driver's putback_page() with the isolated page.
-   In this function, the driver should put the isolated page back into its own data
-   structure.
-
-Non-LRU movable page flags
-
-   There are two page flags for supporting non-LRU movable page.
-
-   * PG_movable
-
-     Driver should use the function below to make page movable under page_lock::
-
-       void __SetPageMovable(struct page *page, struct address_space *mapping)
-
-     It needs argument of address_space for registering migration
-     family functions which will be called by VM. Exactly speaking,
-     PG_movable is not a real flag of struct page. Rather, VM
-     reuses the page->mapping's lower bits to represent it::
-
-       #define PAGE_MAPPING_MOVABLE 0x2
-       page->mapping = page->mapping | PAGE_MAPPING_MOVABLE;
-
-     so driver shouldn't access page->mapping directly. Instead, driver should
-     use page_mapping() which masks off the low two bits of page->mapping under
-     page lock so it can get the right struct address_space.
-
-     For testing of non-LRU movable pages, VM supports __PageMovable() function.
-     However, it doesn't guarantee to identify non-LRU movable pages because
-     the page->mapping field is unified with other variables in struct page.
-     If the driver releases the page after isolation by VM, page->mapping
-     doesn't have a stable value although it has PAGE_MAPPING_MOVABLE set
-     (look at __ClearPageMovable). But __PageMovable() is cheap to call whether
-     page is LRU or non-LRU movable once the page has been isolated because LRU
-     pages can never have PAGE_MAPPING_MOVABLE set in page->mapping. It is also
-     good for just peeking to test non-LRU movable pages before more expensive
-     checking with lock_page() in pfn scanning to select a victim.
-
-     For guaranteeing non-LRU movable page, VM provides PageMovable() function.
-     Unlike __PageMovable(), PageMovable() validates page->mapping and
-     mapping->a_ops->isolate_page under lock_page(). The lock_page() prevents
-     sudden destroying of page->mapping.
-
-     Drivers using __SetPageMovable() should clear the flag via
-     __ClearMovablePage() under page_lock() before the releasing the page.
-
-   * PG_isolated
-
-     To prevent concurrent isolation among several CPUs, VM marks isolated page
-     as PG_isolated under lock_page(). So if a CPU encounters PG_isolated
-     non-LRU movable page, it can skip it. Driver doesn't need to manipulate the
-     flag because VM will set/clear it automatically. Keep in mind that if the
-     driver sees a PG_isolated page, it means the page has been isolated by the
-     VM so it shouldn't touch the page.lru field.
-     The PG_isolated flag is aliased with the PG_reclaim flag so drivers
-     shouldn't use PG_isolated for its own purposes.
+If a driver wants to make its pages movable, it should define a struct
+movable_operations.  It then needs to call __SetPageMovable() on each
+page that it may be able to move.  This uses the ``page->mapping`` field,
+so this field is not available for the driver to use for other purposes.

 Monitoring Migration
 =====================
@@ -286,3 +191,5 @@ THP_MIGRATION_FAIL and PGMIGRATE_FAIL to increase.

 Christoph Lameter, May 8, 2006.
 Minchan Kim, Mar 28, 2016.
+
+.. kernel-doc:: include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -19,6 +19,43 @@ struct migration_target_control;
  */
 #define MIGRATEPAGE_SUCCESS            0

+/**
+ * struct movable_operations - Driver page migration
+ * @isolate_page:
+ * The VM calls this function to prepare the page to be moved.  The page
+ * is locked and the driver should not unlock it.  The driver should
+ * return ``true`` if the page is movable and ``false`` if it is not
+ * currently movable.  After this function returns, the VM uses the
+ * page->lru field, so the driver must preserve any information which
+ * is usually stored here.
+ *
+ * @migrate_page:
+ * After isolation, the VM calls this function with the isolated
+ * @src page.  The driver should copy the contents of the
+ * @src page to the @dst page and set up the fields of @dst page.
+ * Both pages are locked.
+ * If page migration is successful, the driver should call
+ * __ClearPageMovable(@src) and return MIGRATEPAGE_SUCCESS.
+ * If the driver cannot migrate the page at the moment, it can return
+ * -EAGAIN.  The VM interprets this as a temporary migration failure and
+ * will retry it later.  Any other error value is a permanent migration
+ * failure and migration will not be retried.
+ * The driver shouldn't touch the @src->lru field while in the
+ * migrate_page() function.  It may write to @dst->lru.
+ *
+ * @putback_page:
+ * If migration fails on the isolated page, the VM informs the driver
+ * that the page is no longer a candidate for migration by calling
+ * this function.  The driver should put the isolated page back into
+ * its own data structure.
+ */
+struct movable_operations {
+       bool (*isolate_page)(struct page *, isolate_mode_t);
+       int (*migrate_page)(struct page *dst, struct page *src,
+                       enum migrate_mode);
+       void (*putback_page)(struct page *);
+};
+
 /* Defined in mm/debug.c: */
 extern const char *migrate_reason_names[MR_TYPES];




