Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 0896D18D036
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Mar 2020 15:23:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584714200;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pbMzMfVEquMuTv9cQbD7SUTvF+9Ieh7fDCqRVYZSNsI=;
	b=ezXMUFS+K8sBFZ0QIcQO6Exr0VTfQoYOszXGuElWv7htkX75XAbPK1eIVH1xgIxYqM38Yl
	LN10yFCwcNQi2hZq/vKTg1J3iP4RrWyNpADO18+MvScEu2lNjbiu+vfQBtjXWh/j7ErLrt
	Dwh2HE/Q5bWiXzNdevqge2TchKqP4eQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-XBdIef_xNNi8VSaIBInaWQ-1; Fri, 20 Mar 2020 10:23:17 -0400
X-MC-Unique: XBdIef_xNNi8VSaIBInaWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3587DBB2;
	Fri, 20 Mar 2020 14:22:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE80E60BF1;
	Fri, 20 Mar 2020 14:22:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C238E942AC;
	Fri, 20 Mar 2020 14:22:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02KEMoLV022025 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Mar 2020 10:22:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B2552166AE4; Fri, 20 Mar 2020 14:22:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16F482166B30
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 14:22:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F16028F68E5
	for <cluster-devel@redhat.com>; Fri, 20 Mar 2020 14:22:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-182-lS7pSaeDPViVGBIHTSLp3w-1; Fri, 20 Mar 2020 10:22:47 -0400
X-MC-Unique: lS7pSaeDPViVGBIHTSLp3w-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jFIXh-0000hI-6P; Fri, 20 Mar 2020 14:22:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 20 Mar 2020 07:22:11 -0700
Message-Id: <20200320142231.2402-6-willy@infradead.org>
In-Reply-To: <20200320142231.2402-1-willy@infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02KEMoLV022025
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v9 05/25] mm: Add new readahead_control API
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Filesystems which implement the upcoming ->readahead method will get
their pages by calling readahead_page() or readahead_page_batch().
These functions support large pages, even though none of the filesystems
to be converted do yet.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 include/linux/pagemap.h | 140 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 24894b9b90c9..232892d37071 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -638,6 +638,146 @@ static inline int add_to_page_cache(struct page *page=
,
 =09return error;
 }
=20
+/**
+ * struct readahead_control - Describes a readahead request.
+ *
+ * A readahead request is for consecutive pages.  Filesystems which
+ * implement the ->readahead method should call readahead_page() or
+ * readahead_page_batch() in a loop and attempt to start I/O against
+ * each page in the request.
+ *
+ * Most of the fields in this struct are private and should be accessed
+ * by the functions below.
+ *
+ * @file: The file, used primarily by network filesystems for authenticati=
on.
+ *=09  May be NULL if invoked internally by the filesystem.
+ * @mapping: Readahead this filesystem object.
+ */
+struct readahead_control {
+=09struct file *file;
+=09struct address_space *mapping;
+/* private: use the readahead_* accessors instead */
+=09pgoff_t _index;
+=09unsigned int _nr_pages;
+=09unsigned int _batch_count;
+};
+
+/**
+ * readahead_page - Get the next page to read.
+ * @rac: The current readahead request.
+ *
+ * Context: The page is locked and has an elevated refcount.  The caller
+ * should decreases the refcount once the page has been submitted for I/O
+ * and unlock the page once all I/O to that page has completed.
+ * Return: A pointer to the next page, or %NULL if we are done.
+ */
+static inline struct page *readahead_page(struct readahead_control *rac)
+{
+=09struct page *page;
+
+=09BUG_ON(rac->_batch_count > rac->_nr_pages);
+=09rac->_nr_pages -=3D rac->_batch_count;
+=09rac->_index +=3D rac->_batch_count;
+
+=09if (!rac->_nr_pages) {
+=09=09rac->_batch_count =3D 0;
+=09=09return NULL;
+=09}
+
+=09page =3D xa_load(&rac->mapping->i_pages, rac->_index);
+=09VM_BUG_ON_PAGE(!PageLocked(page), page);
+=09rac->_batch_count =3D hpage_nr_pages(page);
+
+=09return page;
+}
+
+static inline unsigned int __readahead_batch(struct readahead_control *rac=
,
+=09=09struct page **array, unsigned int array_sz)
+{
+=09unsigned int i =3D 0;
+=09XA_STATE(xas, &rac->mapping->i_pages, 0);
+=09struct page *page;
+
+=09BUG_ON(rac->_batch_count > rac->_nr_pages);
+=09rac->_nr_pages -=3D rac->_batch_count;
+=09rac->_index +=3D rac->_batch_count;
+=09rac->_batch_count =3D 0;
+
+=09xas_set(&xas, rac->_index);
+=09rcu_read_lock();
+=09xas_for_each(&xas, page, rac->_index + rac->_nr_pages - 1) {
+=09=09VM_BUG_ON_PAGE(!PageLocked(page), page);
+=09=09VM_BUG_ON_PAGE(PageTail(page), page);
+=09=09array[i++] =3D page;
+=09=09rac->_batch_count +=3D hpage_nr_pages(page);
+
+=09=09/*
+=09=09 * The page cache isn't using multi-index entries yet,
+=09=09 * so the xas cursor needs to be manually moved to the
+=09=09 * next index.  This can be removed once the page cache
+=09=09 * is converted.
+=09=09 */
+=09=09if (PageHead(page))
+=09=09=09xas_set(&xas, rac->_index + rac->_batch_count);
+
+=09=09if (i =3D=3D array_sz)
+=09=09=09break;
+=09}
+=09rcu_read_unlock();
+
+=09return i;
+}
+
+/**
+ * readahead_page_batch - Get a batch of pages to read.
+ * @rac: The current readahead request.
+ * @array: An array of pointers to struct page.
+ *
+ * Context: The pages are locked and have an elevated refcount.  The calle=
r
+ * should decreases the refcount once the page has been submitted for I/O
+ * and unlock the page once all I/O to that page has completed.
+ * Return: The number of pages placed in the array.  0 indicates the reque=
st
+ * is complete.
+ */
+#define readahead_page_batch(rac, array)=09=09=09=09\
+=09__readahead_batch(rac, array, ARRAY_SIZE(array))
+
+/**
+ * readahead_pos - The byte offset into the file of this readahead request=
.
+ * @rac: The readahead request.
+ */
+static inline loff_t readahead_pos(struct readahead_control *rac)
+{
+=09return (loff_t)rac->_index * PAGE_SIZE;
+}
+
+/**
+ * readahead_length - The number of bytes in this readahead request.
+ * @rac: The readahead request.
+ */
+static inline loff_t readahead_length(struct readahead_control *rac)
+{
+=09return (loff_t)rac->_nr_pages * PAGE_SIZE;
+}
+
+/**
+ * readahead_index - The index of the first page in this readahead request=
.
+ * @rac: The readahead request.
+ */
+static inline pgoff_t readahead_index(struct readahead_control *rac)
+{
+=09return rac->_index;
+}
+
+/**
+ * readahead_count - The number of pages in this readahead request.
+ * @rac: The readahead request.
+ */
+static inline unsigned int readahead_count(struct readahead_control *rac)
+{
+=09return rac->_nr_pages;
+}
+
 static inline unsigned long dir_pages(struct inode *inode)
 {
 =09return (unsigned long)(inode->i_size + PAGE_SIZE - 1) >>
--=20
2.25.1


