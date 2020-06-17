Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CD8531FC415
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Jun 2020 04:22:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592360554;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4ooCOoMaqnAEbjhADcJVW/wtNKjGO0zmqKUrejM+8w8=;
	b=RMfY8/E/z921aJSdSQsyBWAyogL16kVBdsz7ah0EH7bui4VlBZ9yI7xYyRarBMpdHoKMuC
	3PR+gCODaUO7eDgwIwd9XMEucuL4NBS9ubk7GKuuQKix4o3faoyMuxhJg8rbsHSKjeADUN
	Rt28e0U4gVQyR3wRAGGydlp5LR2Aw0c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-nulEjIe8Nqm_1iigKjRvHg-1; Tue, 16 Jun 2020 22:22:33 -0400
X-MC-Unique: nulEjIe8Nqm_1iigKjRvHg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06BE210059AD;
	Wed, 17 Jun 2020 02:22:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4CE55C1BD;
	Wed, 17 Jun 2020 02:22:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B0C01809547;
	Wed, 17 Jun 2020 02:22:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05H2MLug008123 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 22:22:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C33D10CD919; Wed, 17 Jun 2020 02:22:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56EF410CD92A
	for <cluster-devel@redhat.com>; Wed, 17 Jun 2020 02:22:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC4AF8007CD
	for <cluster-devel@redhat.com>; Wed, 17 Jun 2020 02:22:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-329-5r-j9djzPamt27x33j_gUw-1; Tue, 16 Jun 2020 22:22:15 -0400
X-MC-Unique: 5r-j9djzPamt27x33j_gUw-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jlNi9-0002wT-UP; Wed, 17 Jun 2020 02:21:57 +0000
Date: Tue, 16 Jun 2020 19:21:57 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <20200617022157.GF8681@bombadil.infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-17-willy@infradead.org>
	<CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
	<20200617003216.GC8681@bombadil.infradead.org>
	<CAHpGcMK6Yu0p-FO8CciiySqh+qcWLG-t3hEaUg-rqJnS=2uhqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHpGcMK6Yu0p-FO8CciiySqh+qcWLG-t3hEaUg-rqJnS=2uhqg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	John Hubbard <jhubbard@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
	Junxiao Bi <junxiao.bi@oracle.com>, linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-erofs@lists.ozlabs.org, Linux-MM <linux-mm@kvack.org>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v11 16/25] fs: Convert mpage_readpages
 to mpage_readahead
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
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Wed, Jun 17, 2020 at 02:57:14AM +0200, Andreas GrÃ¼nbacher wrote:
> Am Mi., 17. Juni 2020 um 02:33 Uhr schrieb Matthew Wilcox <willy@infradead.org>:
> >
> > On Wed, Jun 17, 2020 at 12:36:13AM +0200, Andreas Gruenbacher wrote:
> > > Am Mi., 15. Apr. 2020 um 23:39 Uhr schrieb Matthew Wilcox <willy@infradead.org>:
> > > > From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > > >
> > > > Implement the new readahead aop and convert all callers (block_dev,
> > > > exfat, ext2, fat, gfs2, hpfs, isofs, jfs, nilfs2, ocfs2, omfs, qnx6,
> > > > reiserfs & udf).  The callers are all trivial except for GFS2 & OCFS2.
> > >
> > > This patch leads to an ABBA deadlock in xfstest generic/095 on gfs2.
> > >
> > > Our lock hierarchy is such that the inode cluster lock ("inode glock")
> > > for an inode needs to be taken before any page locks in that inode's
> > > address space.
> >
> > How does that work for ...
> >
> > writepage:              yes, unlocks (see below)
> > readpage:               yes, unlocks
> > invalidatepage:         yes
> > releasepage:            yes
> > freepage:               yes
> > isolate_page:           yes
> > migratepage:            yes (both)
> > putback_page:           yes
> > launder_page:           yes
> > is_partially_uptodate:  yes
> > error_remove_page:      yes
> >
> > Is there a reason that you don't take the glock in the higher level
> > ops which are called before readhead gets called?  I'm looking at XFS,
> > and it takes the xfs_ilock SHARED in xfs_file_buffered_aio_read()
> > (called from xfs_file_read_iter).
> 
> Right, the approach from the following thread might fix this:
> 
> https://lore.kernel.org/linux-fsdevel/20191122235324.17245-1-agruenba@redhat.com/T/#t

In general, I think this is a sound approach.

Specifically, I think FAULT_FLAG_CACHED can go away.  map_pages()
will bring in the pages which are in the page cache, so when we get to
gfs2_fault(), we know there's a reason to acquire the glock.

