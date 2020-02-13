Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B102615BF9E
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Feb 2020 14:43:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581601438;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jDk9Dvdb7jiQ9uR0oYEC9NNfoWc1odvjdcsY4m+T64E=;
	b=Ht/3TJ8I5zPp4D40DU8dqqs5fh75bL3sinzwjzhjoOn/PxH8P6XEI13Z9xRMNNd7Azdu9y
	JBawl1ChQiGGMWhN1ZlmxAVhvCYbosp7URcODhQSHeUtGLXjFwApGofZkG2+pXWm9/dhqY
	/IH97Fpveo990s0cHpU6uScQfevz81A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-9EAz0AKEM4a9NpqaxtzdAA-1; Thu, 13 Feb 2020 08:43:57 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 386D58E2DC8;
	Thu, 13 Feb 2020 13:43:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 018885C1C3;
	Thu, 13 Feb 2020 13:43:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C0DB8B2AE;
	Thu, 13 Feb 2020 13:43:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DDhaBo007379 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 08:43:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A474211422DD; Thu, 13 Feb 2020 13:43:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FE2511422DC
	for <cluster-devel@redhat.com>; Thu, 13 Feb 2020 13:43:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D12E1011E19
	for <cluster-devel@redhat.com>; Thu, 13 Feb 2020 13:43:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-26-yVsGcVvLNDKHBXd31FMRng-1; Thu, 13 Feb 2020 08:43:32 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j2Elw-0008Pa-QR; Thu, 13 Feb 2020 13:43:16 +0000
Date: Thu, 13 Feb 2020 05:43:16 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <20200213134316.GK7778@bombadil.infradead.org>
References: <20200125013553.24899-1-willy@infradead.org>
	<20200212203852.8b7e0b28974e41227bd97329@linux-foundation.org>
MIME-Version: 1.0
In-Reply-To: <20200212203852.8b7e0b28974e41227bd97329@linux-foundation.org>
X-MC-Unique: yVsGcVvLNDKHBXd31FMRng-1
X-MC-Unique: 9EAz0AKEM4a9NpqaxtzdAA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01DDhaBo007379
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mark Fasheh <mark@fasheh.com>, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 00/12] Change readahead API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Feb 12, 2020 at 08:38:52PM -0800, Andrew Morton wrote:
> On Fri, 24 Jan 2020 17:35:41 -0800 Matthew Wilcox <willy@infradead.org> w=
rote:
>=20
> > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> >=20
> > This series adds a readahead address_space operation to eventually
> > replace the readpages operation.  The key difference is that
> > pages are added to the page cache as they are allocated (and
> > then looked up by the filesystem) instead of passing them on a
> > list to the readpages operation and having the filesystem add
> > them to the page cache.  It's a net reduction in code for each
> > implementation, more efficient than walking a list, and solves
> > the direct-write vs buffered-read problem reported by yu kuai at
> > https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@hu=
awei.com/
>=20
> Unclear which patch fixes this and how it did it?

I suppose the problem isn't fixed until patch 13/13 is applied.
What yu kuai is seeing is a race where readahead allocates a page,
then passes it to iomap_readpages, which calls xfs_read_iomap_begin()
which looks up the extent.  Then thread 2 does DIO which modifies the
extent, because there's nothing to say that thread 1 is still using it.
With this patch series, the readpages code puts the locked pages in the
cache before calling iomap_readpages, so any racing write will block on
the locked page until readahead is completed.

If you're tempted to put this into -mm, I have a couple of new changes;
one to fix a kernel-doc warning for mpage_readahead() and one to add
kernel-doc for iomap_readahead():

+++ b/fs/mpage.c
@@ -339,9 +339,7 @@
=20
 /**
  * mpage_readahead - start reads against pages
- * @mapping: the address_space
- * @start: The number of the first page to read.
- * @nr_pages: The number of consecutive pages to read.
+ * @rac: Describes which pages to read.
  * @get_block: The filesystem's block mapper function.
  *
  * This function walks the pages and the blocks within each page, building=
 and

+++ b/fs/iomap/buffered-io.c
@@ -395,6 +395,21 @@
 =09return done;
 }
=20
+/**
+ * iomap_readahead - Attempt to read pages from a file.
+ * @rac: Describes the pages to be read.
+ * @ops: The operations vector for the filesystem.
+ *
+ * This function is for filesystems to call to implement their readahead
+ * address_space operation.
+ *
+ * Context: The file is pinned by the caller, and the pages to be read are
+ * all locked and have an elevated refcount.  This function will unlock
+ * the pages (once I/O has completed on them, or I/O has been determined t=
o
+ * not be necessary).  It will also decrease the refcount once the pages
+ * have been submitted for I/O.  After this point, the page may be removed
+ * from the page cache, and should not be referenced.
+ */
 void iomap_readahead(struct readahead_control *rac, const struct iomap_ops=
 *ops)
 {
 =09struct inode *inode =3D rac->mapping->host;

I'll do a v6 with those changes soon, but I would really like a bit more
review from filesystem people, particularly ocfs2 and gfs2.


