Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D94BD6625CF
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Jan 2023 13:47:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673268422;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=swjuNQ/i0Y/kXuzGWDfuHdb2fSh/vC4jMIjMsr1R+fQ=;
	b=exwyP/nBop6lJxHiQqP6EKKCZULaNFk/HqnVUETCSw1w3K9YhPH7Ybzo22342bYxvAafK/
	kS8DmYgqPen9gSe0O4B8Zid5ELFgZAfr8DIr9yE7Pk5zdcw63fTdS3p9w2Qje5w4o9cnRm
	7e/sev4AIjYfnsPhOylnL3msh7yschk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-uQ_87ZQaP6Sutgx2gBAQoA-1; Mon, 09 Jan 2023 07:46:59 -0500
X-MC-Unique: uQ_87ZQaP6Sutgx2gBAQoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 793611C07542;
	Mon,  9 Jan 2023 12:46:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8FA43112131B;
	Mon,  9 Jan 2023 12:46:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 137E71947B9F;
	Mon,  9 Jan 2023 12:46:56 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 25AE31947B94 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  9 Jan 2023 12:46:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9DA62166B2B; Mon,  9 Jan 2023 12:46:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (ovpn-192-3.brq.redhat.com [10.40.192.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2923C2166B26;
 Mon,  9 Jan 2023 12:46:42 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Dave Chinner <dchinner@redhat.com>
Date: Mon,  9 Jan 2023 13:46:42 +0100
Message-Id: <20230109124642.1663842-1-agruenba@redhat.com>
In-Reply-To: <20230108213305.GO1971568@dread.disaster.area>
References: <20230108213305.GO1971568@dread.disaster.area>
 <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-5-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 "Darrick J . Wong" <djwong@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

On Sun, Jan 8, 2023 at 10:33 PM Dave Chinner <david@fromorbit.com> wrote:
> On Sun, Jan 08, 2023 at 08:40:28PM +0100, Andreas Gruenbacher wrote:
> > Add an iomap_get_folio() helper that gets a folio reference based on
> > an iomap iterator and an offset into the address space.  Use it in
> > iomap_write_begin().
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  fs/iomap/buffered-io.c | 39 ++++++++++++++++++++++++++++++---------
> >  include/linux/iomap.h  |  1 +
> >  2 files changed, 31 insertions(+), 9 deletions(-)
> >
> > diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> > index d4b444e44861..de4a8e5f721a 100644
> > --- a/fs/iomap/buffered-io.c
> > +++ b/fs/iomap/buffered-io.c
> > @@ -457,6 +457,33 @@ bool iomap_is_partially_uptodate(struct folio *folio, size_t from, size_t count)
> >  }
> >  EXPORT_SYMBOL_GPL(iomap_is_partially_uptodate);
> >
> > +/**
> > + * iomap_get_folio - get a folio reference for writing
> > + * @iter: iteration structure
> > + * @pos: start offset of write
> > + *
> > + * Returns a locked reference to the folio at @pos, or an error pointer if the
> > + * folio could not be obtained.
> > + */
> > +struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos)
> > +{
> > +     unsigned fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE | FGP_NOFS;
> > +     struct folio *folio;
> > +
> > +     if (iter->flags & IOMAP_NOWAIT)
> > +             fgp |= FGP_NOWAIT;
> > +
> > +     folio = __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
> > +                     fgp, mapping_gfp_mask(iter->inode->i_mapping));
> > +     if (folio)
> > +             return folio;
> > +
> > +     if (iter->flags & IOMAP_NOWAIT)
> > +             return ERR_PTR(-EAGAIN);
> > +     return ERR_PTR(-ENOMEM);
> > +}
> > +EXPORT_SYMBOL_GPL(iomap_get_folio);
>
> Hmmmm.
>
> This is where things start to get complex. I have sent a patch to
> fix a problem with iomap_zero_range() failing to zero cached dirty
> pages over UNWRITTEN extents, and that requires making FGP_CREAT
> optional. This is an iomap bug, and needs to be fixed in the core
> iomap code:
>
> https://lore.kernel.org/linux-xfs/20221201005214.3836105-1-david@fromorbit.com/
>
> Essentially, we need to pass fgp flags to iomap_write_begin() need
> so the callers can supply a 0 or FGP_CREAT appropriately. This
> allows iomap_write_begin() to act only on pre-cached pages rather
> than always instantiating a new page if one does not exist in cache.
>
> This allows that iomap_write_begin() to return a NULL folio
> successfully, and this is perfectly OK for callers that pass in fgp
> = 0 as they are expected to handle a NULL folio return indicating
> there was no cached data over the range...
>
> Exposing the folio allocation as an external interface makes bug
> fixes like this rather messy - it's taking a core abstraction (iomap
> hides all the folio and page cache manipulations from the
> filesystem) and punching a big hole in it by requiring filesystems
> to actually allocation page cache folios on behalf of the iomap
> core.
>
> Given that I recently got major push-back for fixing an XFS-only bug
> by walking the page cache directly instead of abstracting it via the
> iomap core, punching an even bigger hole in the abstraction layer to
> fix a GFS2-only problem is just as bad....

We can handle that by adding a new IOMAP_NOCREATE iterator flag and
checking for that in iomap_get_folio().  Your patch then turns into
the below.

Thanks,
Andreas

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index dacc7c80b20d..34b335a89527 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -470,6 +470,8 @@ struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos)
 	unsigned fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE | FGP_NOFS;
 	struct folio *folio;
 
+	if (!(iter->flags & IOMAP_NOCREATE))
+		fgp |= FGP_CREAT;
 	if (iter->flags & IOMAP_NOWAIT)
 		fgp |= FGP_NOWAIT;
 
@@ -478,6 +480,8 @@ struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos)
 	if (folio)
 		return folio;
 
+	if (iter->flags & IOMAP_NOCREATE)
+		return ERR_PTR(-ENODATA);
 	if (iter->flags & IOMAP_NOWAIT)
 		return ERR_PTR(-EAGAIN);
 	return ERR_PTR(-ENOMEM);
@@ -1162,8 +1166,12 @@ static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
 	loff_t written = 0;
 
 	/* already zeroed?  we're done. */
-	if (srcmap->type == IOMAP_HOLE || srcmap->type == IOMAP_UNWRITTEN)
+	if (srcmap->type == IOMAP_HOLE)
 		return length;
+	/* only do page cache lookups over unwritten extents */
+	iter->flags &= ~IOMAP_NOCREATE;
+	if (srcmap->type == IOMAP_UNWRITTEN)
+		iter->flags |= IOMAP_NOCREATE;
 
 	do {
 		struct folio *folio;
@@ -1172,8 +1180,19 @@ static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
 		size_t bytes = min_t(u64, SIZE_MAX, length);
 
 		status = iomap_write_begin(iter, pos, bytes, &folio);
-		if (status)
+		if (status) {
+			if (status == -ENODATA) {
+				/*
+				 * No folio was found, so skip to the start of
+				 * the next potential entry in the page cache
+				 * and continue from there.
+				 */
+				if (bytes > PAGE_SIZE - offset_in_page(pos))
+					bytes = PAGE_SIZE - offset_in_page(pos);
+				goto loop_continue;
+			}
 			return status;
+		}
 		if (iter->iomap.flags & IOMAP_F_STALE)
 			break;
 
@@ -1181,6 +1200,19 @@ static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
 		if (bytes > folio_size(folio) - offset)
 			bytes = folio_size(folio) - offset;
 
+		/*
+		 * If the folio over an unwritten extent is clean, then we
+		 * aren't going to touch the data in it at all. We don't want to
+		 * mark it dirty or change the uptodate state of data in the
+		 * page, so we just unlock it and skip to the next range over
+		 * the unwritten extent we need to check.
+		 */
+		if (srcmap->type == IOMAP_UNWRITTEN &&
+		    !folio_test_dirty(folio)) {
+			folio_unlock(folio);
+			goto loop_continue;
+		}
+
 		folio_zero_range(folio, offset, bytes);
 		folio_mark_accessed(folio);
 
@@ -1188,6 +1220,7 @@ static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
 		if (WARN_ON_ONCE(bytes == 0))
 			return -EIO;
 
+loop_continue:
 		pos += bytes;
 		length -= bytes;
 		written += bytes;
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 515318dfbc38..87b9d9aba4bb 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -841,17 +841,7 @@ xfs_setattr_size(
 		trace_xfs_zero_eof(ip, oldsize, newsize - oldsize);
 		error = xfs_zero_range(ip, oldsize, newsize - oldsize,
 				&did_zeroing);
-	} else {
-		/*
-		 * iomap won't detect a dirty page over an unwritten block (or a
-		 * cow block over a hole) and subsequently skips zeroing the
-		 * newly post-EOF portion of the page. Flush the new EOF to
-		 * convert the block before the pagecache truncate.
-		 */
-		error = filemap_write_and_wait_range(inode->i_mapping, newsize,
-						     newsize);
-		if (error)
-			return error;
+	} else if (newsize != oldsize) {
 		error = xfs_truncate_page(ip, newsize, &did_zeroing);
 	}
 
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 3e6c34b03c89..55f195866f00 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -164,6 +164,7 @@ struct iomap_folio_ops {
 #else
 #define IOMAP_DAX		0
 #endif /* CONFIG_FS_DAX */
+#define IOMAP_NOCREATE		(1 << 9) /* look up folios without FGP_CREAT */
 
 struct iomap_ops {
 	/*
-- 
2.38.1

