Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C8914166A73
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 23:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582238385;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c/0B3Jhj2bADGFyqmWOWCzVqTY6ZgGzTo0xqecujkBI=;
	b=U3mLkBXbp9UzEEhyapAElSFCyYAgP0bnmcUfvF3ZuU6g2e3t3Z1/XCHezNWd3EhkWhV3Ne
	wwNKNaGC90YDGAJSez80H9xYkoeUOMrAOVBh1VmFuvsYp9obTP/oCUvPof7VKAXXwa6CVu
	fEswzB8iOzvEsmm7ThHnnyLENwnod9s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-tHA-IT7WOYq5HDGokMOwmw-1; Thu, 20 Feb 2020 17:39:44 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F2738017CC;
	Thu, 20 Feb 2020 22:39:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F88B6E3EE;
	Thu, 20 Feb 2020 22:39:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41FE18B2C8;
	Thu, 20 Feb 2020 22:39:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KMdPMx019870 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 17:39:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D1AAE2024517; Thu, 20 Feb 2020 22:39:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9E962028CD5
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 22:39:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E55A5185A78F
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 22:39:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-254-qK8wGCBLOSSNGG459TqWag-1; Thu, 20 Feb 2020 17:39:21 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4uTN-0006hx-9M; Thu, 20 Feb 2020 22:39:09 +0000
Date: Thu, 20 Feb 2020 14:39:09 -0800
From: Matthew Wilcox <willy@infradead.org>
To: dsterba@suse.cz, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	ocfs2-devel@oss.oracle.com, linux-xfs@vger.kernel.org
Message-ID: <20200220223909.GB24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200220175400.GB2902@twin.jikos.cz>
MIME-Version: 1.0
In-Reply-To: <20200220175400.GB2902@twin.jikos.cz>
X-MC-Unique: qK8wGCBLOSSNGG459TqWag-1
X-MC-Unique: tHA-IT7WOYq5HDGokMOwmw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01KMdPMx019870
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH v7 00/23] Change readahead API
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 20, 2020 at 06:54:00PM +0100, David Sterba wrote:
> On Wed, Feb 19, 2020 at 01:00:39PM -0800, Matthew Wilcox wrote:
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
> >=20
> > The only unconverted filesystems are those which use fscache.
> > Their conversion is pending Dave Howells' rewrite which will make the
> > conversion substantially easier.
> >=20
> > I want to thank the reviewers; Dave Chinner, John Hubbard and Christoph
> > Hellwig have done a marvellous job of providing constructive criticism.
> > Eric Biggers pointed out how I'd broken ext4 (which led to a substantia=
l
> > change).  I've tried to take it all on board, but I may have missed
> > something simply because you've done such a thorough job.
> >=20
> > This series can also be found at
> > http://git.infradead.org/users/willy/linux-dax.git/shortlog/refs/tags/r=
eadahead_v7
> > (I also pushed the readahead_v6 tag there in case anyone wants to diff,=
 and
> > they're both based on 5.6-rc2 so they're easy to diff)
> >=20
> > v7:
> >  - Now passes an xfstests run on ext4!
>=20
> On btrfs it still chokes on the first test btrfs/001, with the following
> warning, the test is stuck there.

Thanks.  The warning actually wasn't the problem, but it did need to
be addressed.  I got a test system up & running with btrfs, and it's
currently on generic/027 with the following patch:

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 9c782c15f7f7..d23a224d2ad2 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -676,7 +676,7 @@ static inline unsigned int __readahead_batch(struct rea=
dahead_control *rac,
 =09=09struct page **array, unsigned int array_sz)
 {
 =09unsigned int i =3D 0;
-=09XA_STATE(xas, &rac->mapping->i_pages, rac->_index);
+=09XA_STATE(xas, &rac->mapping->i_pages, 0);
 =09struct page *page;
=20
 =09BUG_ON(rac->_batch_count > rac->_nr_pages);
@@ -684,6 +684,8 @@ static inline unsigned int __readahead_batch(struct rea=
dahead_control *rac,
 =09rac->_index +=3D rac->_batch_count;
 =09rac->_batch_count =3D 0;
=20
+=09xas_set(&xas, rac->_index);
+=09rcu_read_lock();
 =09xas_for_each(&xas, page, rac->_index + rac->_nr_pages - 1) {
 =09=09VM_BUG_ON_PAGE(!PageLocked(page), page);
 =09=09VM_BUG_ON_PAGE(PageTail(page), page);
@@ -702,6 +704,7 @@ static inline unsigned int __readahead_batch(struct rea=
dahead_control *rac,
 =09=09if (i =3D=3D array_sz)
 =09=09=09break;
 =09}
+=09rcu_read_unlock();
=20
 =09return i;
 }


