Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 360046663CB
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Jan 2023 20:36:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673465786;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4DMvLtDPlSliteCx6qFn8oz8SfGuJcvsaDoB1yob6PA=;
	b=T5FlQWJLID6gbbcZJ/0+xYveHAozBNViDsr31lwm7QLGoEj4iCBHCQYA/kHQDLXTNPhtGd
	IH5g552vhN3JqMBZWot9MPP8DdadFR/QRlxdl7t8kcQHykWJyjaY5XAM62r7zHIRFG12oA
	EMBMvrBhbOaw0Qw9VVZ1IOTbwz9y2NY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-V7rc3_ncPMi6sZYr6YDGCA-1; Wed, 11 Jan 2023 14:36:21 -0500
X-MC-Unique: V7rc3_ncPMi6sZYr6YDGCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 071713806707;
	Wed, 11 Jan 2023 19:36:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E307C2026D68;
	Wed, 11 Jan 2023 19:36:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AE1561946A45;
	Wed, 11 Jan 2023 19:36:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0747419465A3 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 11 Jan 2023 19:36:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BD627C158BB; Wed, 11 Jan 2023 19:36:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B6A0BC15BA0
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 19:36:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FC011C0897E
 for <cluster-devel@redhat.com>; Wed, 11 Jan 2023 19:36:17 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-160-VC_SDauROguPHtPy-P3bXg-1; Wed,
 11 Jan 2023 14:36:15 -0500
X-MC-Unique: VC_SDauROguPHtPy-P3bXg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFgte-004Pul-4L; Wed, 11 Jan 2023 19:36:26 +0000
Date: Wed, 11 Jan 2023 19:36:26 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Y78PunroeYbv2qgH@casper.infradead.org>
References: <20230108213305.GO1971568@dread.disaster.area>
 <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-5-agruenba@redhat.com>
 <20230109124642.1663842-1-agruenba@redhat.com>
 <Y70l9ZZXpERjPqFT@infradead.org>
 <Y71pWJ0JHwGrJ/iv@casper.infradead.org>
 <Y72DK9XuaJfN+ecj@infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y72DK9XuaJfN+ecj@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [RFC v6 04/10] iomap: Add iomap_get_folio helper
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
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
 linux-xfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 10, 2023 at 07:24:27AM -0800, Christoph Hellwig wrote:
> On Tue, Jan 10, 2023 at 01:34:16PM +0000, Matthew Wilcox wrote:
> > > Exactly.  And as I already pointed out in reply to Dave's original
> > > patch what we really should be doing is returning an ERR_PTR from
> > > __filemap_get_folio instead of reverse-engineering the expected
> > > error code.
> > 
> > Ouch, we have a nasty problem.
> > 
> > If somebody passes FGP_ENTRY, we can return a shadow entry.  And the
> > encodings for shadow entries overlap with the encodings for ERR_PTR,
> > meaning that some shadow entries will look like errors.  The way I
> > solved this in the XArray code is by shifting the error values by
> > two bits and encoding errors as XA_ERROR(-ENOMEM) (for example).
> > 
> > I don't _object_ to introducing XA_ERROR() / xa_err() into the VFS,
> > but so far we haven't, and I'd like to make that decision intentionally.
> 
> So what would be an alternative way to tell the callers why no folio
> was found instead of trying to reverse engineer that?  Return an errno
> and the folio by reference?  The would work, but the calling conventions
> would be awful.

Agreed.  How about an xa_filemap_get_folio()?

(there are a number of things to fix here; haven't decided if XA_ERROR
should return void *, or whether i should use a separate 'entry' and
'folio' until I know the entry is actually a folio ...)

Usage would seem pretty straightforward:

	folio = xa_filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
			fgp, mapping_gfp_mask(iter->inode->i_mapping));
	status = xa_err(folio);
	if (status)
		goto out_no_page;

diff --git a/mm/filemap.c b/mm/filemap.c
index 7bf8442bcfaa..7d489f96c690 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1800,40 +1800,25 @@ static void *mapping_get_entry(struct address_space *mapping, pgoff_t index)
 }
 
 /**
- * __filemap_get_folio - Find and get a reference to a folio.
+ * xa_filemap_get_folio - Find and get a reference to a folio.
  * @mapping: The address_space to search.
  * @index: The page index.
  * @fgp_flags: %FGP flags modify how the folio is returned.
  * @gfp: Memory allocation flags to use if %FGP_CREAT is specified.
  *
- * Looks up the page cache entry at @mapping & @index.
- *
- * @fgp_flags can be zero or more of these flags:
- *
- * * %FGP_ACCESSED - The folio will be marked accessed.
- * * %FGP_LOCK - The folio is returned locked.
- * * %FGP_ENTRY - If there is a shadow / swap / DAX entry, return it
- *   instead of allocating a new folio to replace it.
- * * %FGP_CREAT - If no page is present then a new page is allocated using
- *   @gfp and added to the page cache and the VM's LRU list.
- *   The page is returned locked and with an increased refcount.
- * * %FGP_FOR_MMAP - The caller wants to do its own locking dance if the
- *   page is already in cache.  If the page was allocated, unlock it before
- *   returning so the caller can do the same dance.
- * * %FGP_WRITE - The page will be written to by the caller.
- * * %FGP_NOFS - __GFP_FS will get cleared in gfp.
- * * %FGP_NOWAIT - Don't get blocked by page lock.
- * * %FGP_STABLE - Wait for the folio to be stable (finished writeback)
- *
- * If %FGP_LOCK or %FGP_CREAT are specified then the function may sleep even
- * if the %GFP flags specified for %FGP_CREAT are atomic.
+ * Looks up the page cache entry at @mapping & @index.  See
+ * __filemap_get_folio() for a detailed description.
  *
- * If there is a page cache page, it is returned with an increased refcount.
+ * This differs from __filemap_get_folio() in that it will return an
+ * XArray error instead of NULL if something goes wrong, allowing the
+ * advanced user to distinguish why the failure happened.  We can't use an
+ * ERR_PTR() because its encodings overlap with shadow/swap/dax entries.
  *
- * Return: The found folio or %NULL otherwise.
+ * Return: The entry in the page cache or an xa_err() if there is no entry
+ * or it could not be appropiately locked.
  */
-struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
-		int fgp_flags, gfp_t gfp)
+struct folio *xa_filemap_get_folio(struct address_space *mapping,
+		pgoff_t index, int fgp_flags, gfp_t gfp)
 {
 	struct folio *folio;
 
@@ -1851,7 +1836,7 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 		if (fgp_flags & FGP_NOWAIT) {
 			if (!folio_trylock(folio)) {
 				folio_put(folio);
-				return NULL;
+				return (struct folio *)XA_ERROR(-EAGAIN);
 			}
 		} else {
 			folio_lock(folio);
@@ -1890,7 +1875,7 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 
 		folio = filemap_alloc_folio(gfp, 0);
 		if (!folio)
-			return NULL;
+			return (struct folio *)XA_ERROR(-ENOMEM);
 
 		if (WARN_ON_ONCE(!(fgp_flags & (FGP_LOCK | FGP_FOR_MMAP))))
 			fgp_flags |= FGP_LOCK;
@@ -1902,19 +1887,65 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 		err = filemap_add_folio(mapping, folio, index, gfp);
 		if (unlikely(err)) {
 			folio_put(folio);
-			folio = NULL;
 			if (err == -EEXIST)
 				goto repeat;
+			folio = (struct folio *)XA_ERROR(err);
+		} else {
+			/*
+			 * filemap_add_folio locks the page, and for mmap
+			 * we expect an unlocked page.
+			 */
+			if (fgp_flags & FGP_FOR_MMAP)
+				folio_unlock(folio);
 		}
-
-		/*
-		 * filemap_add_folio locks the page, and for mmap
-		 * we expect an unlocked page.
-		 */
-		if (folio && (fgp_flags & FGP_FOR_MMAP))
-			folio_unlock(folio);
 	}
 
+	if (!folio)
+		folio = (struct folio *)XA_ERROR(-ENODATA);
+	return folio;
+}
+EXPORT_SYMBOL_GPL(xa_filemap_get_folio);
+
+/**
+ * __filemap_get_folio - Find and get a reference to a folio.
+ * @mapping: The address_space to search.
+ * @index: The page index.
+ * @fgp: %FGP flags modify how the folio is returned.
+ * @gfp: Memory allocation flags to use if %FGP_CREAT is specified.
+ *
+ * Looks up the page cache entry at @mapping & @index.
+ *
+ * @fgp_flags can be zero or more of these flags:
+ *
+ * * %FGP_ACCESSED - The folio will be marked accessed.
+ * * %FGP_LOCK - The folio is returned locked.
+ * * %FGP_ENTRY - If there is a shadow / swap / DAX entry, return it
+ *   instead of allocating a new folio to replace it.
+ * * %FGP_CREAT - If no page is present then a new page is allocated using
+ *   @gfp and added to the page cache and the VM's LRU list.
+ *   The page is returned locked and with an increased refcount.
+ * * %FGP_FOR_MMAP - The caller wants to do its own locking dance if the
+ *   page is already in cache.  If the page was allocated, unlock it before
+ *   returning so the caller can do the same dance.
+ * * %FGP_WRITE - The page will be written to by the caller.
+ * * %FGP_NOFS - __GFP_FS will get cleared in gfp.
+ * * %FGP_NOWAIT - Don't get blocked by page lock.
+ * * %FGP_STABLE - Wait for the folio to be stable (finished writeback)
+ *
+ * If %FGP_LOCK or %FGP_CREAT are specified then the function may sleep even
+ * if the %GFP flags specified for %FGP_CREAT are atomic.
+ *
+ * If there is a page cache page, it is returned with an increased refcount.
+ *
+ * Return: The found folio or %NULL otherwise.
+ */
+struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
+		int fgp, gfp_t gfp)
+{
+	struct folio *folio = xa_filemap_get_folio(mapping, index, fgp, gfp);
+
+	if (xa_is_err(folio))
+		return NULL;
 	return folio;
 }
 EXPORT_SYMBOL(__filemap_get_folio);

