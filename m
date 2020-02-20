Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3E75516639B
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Feb 2020 17:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582217877;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1AlrqdDuPLGBvVqAn0mIIB2GE/BkOLYVTypze/M5WCo=;
	b=HfRFs8x1oHt2WG56oyHj3D4ygR0kXl374E4St6uztheg/nNx2o3XdI70VbtnOArvIr3YTp
	N3rq4eoMyJtOwxxXnkBf+qWCLSanM1PTDEEnjvoMmtzr6L6uhBOQ7wKzRXx0MV3o1EjjKG
	//nh6f+HBySHIWGUH3VqrVs74uk6wTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-amCyoHCKN-mQrGrG6h1zEg-1; Thu, 20 Feb 2020 11:57:55 -0500
X-MC-Unique: amCyoHCKN-mQrGrG6h1zEg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 422A2141C;
	Thu, 20 Feb 2020 16:57:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD54F8B741;
	Thu, 20 Feb 2020 16:57:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE51618089CD;
	Thu, 20 Feb 2020 16:57:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KGviYG032036 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 11:57:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 082682028CD4; Thu, 20 Feb 2020 16:57:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 036FA2028CD3
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 16:57:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2FAA101A55A
	for <cluster-devel@redhat.com>; Thu, 20 Feb 2020 16:57:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-455--xT8OSvkMGyeearlmy09RA-1; Thu, 20 Feb 2020 11:57:39 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j4p8p-0005KC-2B; Thu, 20 Feb 2020 16:57:35 +0000
Date: Thu, 20 Feb 2020 08:57:34 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20200220165734.GZ24185@bombadil.infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-23-willy@infradead.org>
	<20200220154912.GC19577@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200220154912.GC19577@infradead.org>
X-MC-Unique: -xT8OSvkMGyeearlmy09RA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01KGviYG032036
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 22/24] iomap: Convert from readpages
	to readahead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 20, 2020 at 07:49:12AM -0800, Christoph Hellwig wrote:
> > +/**
> > + * iomap_readahead - Attempt to read pages from a file.
> > + * @rac: Describes the pages to be read.
> > + * @ops: The operations vector for the filesystem.
> > + *
> > + * This function is for filesystems to call to implement their readahe=
ad
> > + * address_space operation.
> > + *
> > + * Context: The file is pinned by the caller, and the pages to be read=
 are
> > + * all locked and have an elevated refcount.  This function will unloc=
k
> > + * the pages (once I/O has completed on them, or I/O has been determin=
ed to
> > + * not be necessary).  It will also decrease the refcount once the pag=
es
> > + * have been submitted for I/O.  After this point, the page may be rem=
oved
> > + * from the page cache, and should not be referenced.
> > + */
>=20
> Isn't the context documentation something that belongs into the aop
> documentation?  I've never really seen the value of duplicating this
> information in method instances, as it is just bound to be out of date
> rather sooner than later.

I'm in two minds about it as well.  There's definitely no value in
providing kernel-doc for implementations of a common interface ... so
rather than fixing the nilfs2 kernel-doc, I just deleted it.  But this
isn't just the implementation, like nilfs2_readahead() is, it's a library
function for filesystems to call, so it deserves documentation.  On the
other hand, there's no real thought to this on the part of the filesystem;
the implementation just calls this with the appropriate ops pointer.

Then again, I kind of feel like we need more documentation of iomap to
help filesystems convert to using it.  But maybe kernel-doc isn't the
mechanism to provide that.


