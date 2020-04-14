Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 298461A80C1
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Apr 2020 17:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586876581;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3uVumsZXLfg79HzCjS57lC3VYLsEoHhV/oNZG6yS6HI=;
	b=cPHgJCk/+ijI5LLN8CN15GvO6wFuql9moG3sb/FvxC913CKnVoXQjstceiuR4u3g3Tylau
	ewwHM+Z4TUod0dNacYLXt4h7I2bAI9BUCtIHRF2iXDe1+22rhWa/ObZfebKq/I3+aO/zG7
	v8/+Y3c49eIVxkkdKUPs1G2QIC5pjo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-EFfnV7BXNv-di0w0XevGpQ-1; Tue, 14 Apr 2020 11:02:58 -0400
X-MC-Unique: EFfnV7BXNv-di0w0XevGpQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C89CD10CE793;
	Tue, 14 Apr 2020 15:02:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF1F019C69;
	Tue, 14 Apr 2020 15:02:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9199618089CF;
	Tue, 14 Apr 2020 15:02:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03EF2l7x014698 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 11:02:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CE2792093CF0; Tue, 14 Apr 2020 15:02:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C93112028CD3
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F8DF800A15
	for <cluster-devel@redhat.com>; Tue, 14 Apr 2020 15:02:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-227-qncxEnQMOOyC1QXPlGzrFQ-1; Tue, 14 Apr 2020 11:02:44 -0400
X-MC-Unique: qncxEnQMOOyC1QXPlGzrFQ-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jON59-0006OC-SD; Tue, 14 Apr 2020 15:02:35 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 14 Apr 2020 08:02:13 -0700
Message-Id: <20200414150233.24495-6-willy@infradead.org>
In-Reply-To: <20200414150233.24495-1-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03EF2l7x014698
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] [PATCH v11 05/25] mm: Add new readahead_control API
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
index 6c61535aa7ff..a6eccfd2c80b 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -639,6 +639,146 @@ static inline int add_to_page_cache(struct page *page=
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


