Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 22F431FF61A
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Jun 2020 17:03:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592492634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FQUOBcYuENIkZ0Pv+EeBoe1eTwC69pQS1gMtNZMVMjo=;
	b=OegVU+alJGMQm+EX5D/2qk+Z+KMC4dZ407//Epa9R4ozFMgv9SqfgKzo6PC8Gz8rqZluX+
	IdZ8W77NvPS80GAJwLChECBbWtg5es7bLjpuSWB/Ily3p5ehcxMwYpDpxh2ObS8qvPuUwL
	wmi4/lFMthVl8FY0j1xtzan2r4X5CQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-OWUuFywsP5G3A0cP4fFzgw-1; Thu, 18 Jun 2020 11:03:52 -0400
X-MC-Unique: OWUuFywsP5G3A0cP4fFzgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C889A0C13;
	Thu, 18 Jun 2020 15:03:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6EB65BACE;
	Thu, 18 Jun 2020 15:03:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DF5A1809547;
	Thu, 18 Jun 2020 15:03:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05IF3QF0018364 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 11:03:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF9962029F71; Thu, 18 Jun 2020 15:03:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB661201808E
	for <cluster-devel@redhat.com>; Thu, 18 Jun 2020 15:03:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DDB37811E77
	for <cluster-devel@redhat.com>; Thu, 18 Jun 2020 15:03:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-465-H7qZmOTEOG-fSS_fbxnlmw-1; Thu, 18 Jun 2020 11:03:19 -0400
X-MC-Unique: H7qZmOTEOG-fSS_fbxnlmw-1
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jlw4L-0003On-LK; Thu, 18 Jun 2020 15:03:09 +0000
Date: Thu, 18 Jun 2020 08:03:09 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20200618150309.GP8681@bombadil.infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-17-willy@infradead.org>
	<CAHc6FU4m1M7Tv4scX0UxSiVBqkL=Vcw_z-R7SufL8k7Bw=qPOw@mail.gmail.com>
	<20200617003216.GC8681@bombadil.infradead.org>
	<CAHpGcMK6Yu0p-FO8CciiySqh+qcWLG-t3hEaUg-rqJnS=2uhqg@mail.gmail.com>
	<20200617022157.GF8681@bombadil.infradead.org>
	<CAHc6FU7NLRHKRJJ6c2kQT0ig8ed1n+3qR-YcSCWzXOeJCUsLbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHc6FU7NLRHKRJJ6c2kQT0ig8ed1n+3qR-YcSCWzXOeJCUsLbA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	John Hubbard <jhubbard@nvidia.com>,
	Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, Junxiao Bi <junxiao.bi@oracle.com>,
	linux-xfs <linux-xfs@vger.kernel.org>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

On Thu, Jun 18, 2020 at 02:46:03PM +0200, Andreas Gruenbacher wrote:
> On Wed, Jun 17, 2020 at 4:22 AM Matthew Wilcox <willy@infradead.org> wrote:
> > On Wed, Jun 17, 2020 at 02:57:14AM +0200, Andreas GrÃ¼nbacher wrote:
> > > Right, the approach from the following thread might fix this:
> > >
> > > https://lore.kernel.org/linux-fsdevel/20191122235324.17245-1-agruenba@redhat.com/T/#t
> >
> > In general, I think this is a sound approach.
> >
> > Specifically, I think FAULT_FLAG_CACHED can go away.  map_pages()
> > will bring in the pages which are in the page cache, so when we get to
> > gfs2_fault(), we know there's a reason to acquire the glock.
> 
> We'd still be grabbing a glock while holding a dependent page lock.
> Another process could be holding the glock and could try to grab the
> same page lock (i.e., a concurrent writer), leading to the same kind
> of deadlock.

What I'm saying is that gfs2_fault should just be:

+static vm_fault_t gfs2_fault(struct vm_fault *vmf)
+{
+	struct inode *inode = file_inode(vmf->vma->vm_file);
+	struct gfs2_inode *ip = GFS2_I(inode);
+	struct gfs2_holder gh;
+	vm_fault_t ret;
+	int err;
+
+	gfs2_holder_init(ip->i_gl, LM_ST_SHARED, 0, &gh);
+	err = gfs2_glock_nq(&gh);
+	if (err) {
+		ret = block_page_mkwrite_return(err);
+		goto out_uninit;
+	}
+	ret = filemap_fault(vmf);
+	gfs2_glock_dq(&gh);
+out_uninit:
+	gfs2_holder_uninit(&gh);
+	return ret;
+}

because by the time gfs2_fault() is called, map_pages() has already been
called and has failed to insert the necessary page, so we should just
acquire the glock now instead of trying again to look for the page in
the page cache.

