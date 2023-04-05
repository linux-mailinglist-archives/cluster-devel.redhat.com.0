Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D54EF6D8AC5
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Apr 2023 00:51:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680735098;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dLSxfaMFCVS8468KN/z0VwXJmbpcmKd5R8VPq1b2igA=;
	b=NaD86U/DSJiKC38ZotsmQo9O6mqqP86XFbak6KXZrxzmcXGTD5d5SASl/xZ0wx5psqffzP
	Uu/d4/AsrzRsb9u76extUXgGYd2AS4frD4Dsx+g4QuU+/HBWzdtCtqENrEn28m4HlbcsmJ
	JpU00a5dySPRp0RdqZOwBSTya0bsYWo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-OaBOwyUKOPePyl_yrjgm-A-1; Wed, 05 Apr 2023 18:51:35 -0400
X-MC-Unique: OaBOwyUKOPePyl_yrjgm-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8B1D101A531;
	Wed,  5 Apr 2023 22:51:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 661912027061;
	Wed,  5 Apr 2023 22:51:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 209481946597;
	Wed,  5 Apr 2023 22:51:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D20031946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 22:51:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C2D3A492C18; Wed,  5 Apr 2023 22:51:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB41A492C14
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 22:51:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CF653801F4E
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 22:51:33 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-W6afDxPFNc-lrZkf-XQiuA-1; Wed, 05 Apr 2023 18:51:29 -0400
X-MC-Unique: W6afDxPFNc-lrZkf-XQiuA-1
Received: by mail-pg1-f169.google.com with SMTP id y19so22724784pgk.5
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 15:51:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680735089;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dLSxfaMFCVS8468KN/z0VwXJmbpcmKd5R8VPq1b2igA=;
 b=3z8iewinR6OxGgd6sbgpU3hmCJjnUJEPvyim4JyEOx3wWzdZGA/DsyiJlJPuiZsMGB
 oKpGr5mexyNogWlEVwRqjid+jzjePM748ffW0cCnbuc6dmXR+JJqTf9rmLqYbBiTe59u
 3mz3LxA6spXWWFznxiSfouqmDcr3IFpuJ640V5axhJcAuIGx4zOjpmgZtMpl6/59CH3w
 u+P/FSmF0cYCt615LuVNCs19h0K4CQzA4oJd7DDYmpS6AUG39CrvKkw8oCiK6n29ovdC
 HuXHTBdlEH1o6uTZes7kG2x8vfA0iyr2utzD1LmD9X2i4GDU3zP8LuX4opI+5saRWjet
 IyUA==
X-Gm-Message-State: AAQBX9eRXwamjsuqPr2jBSdhRrDCBeVr7KXuaA1p0UCrLISzYA3e38X9
 sy0RHzpY9u4b7g8S4EEqIjtvRQ==
X-Google-Smtp-Source: AKy350byI2dOXAx2UUhieoBDXlt6kMcfX++CjjnLqbSOozpqmQEUOmvJ7mOnsddzMAKRV6q6VXMDHg==
X-Received: by 2002:a62:7b8b:0:b0:625:cc03:df33 with SMTP id
 w133-20020a627b8b000000b00625cc03df33mr7050385pfc.31.1680735088792; 
 Wed, 05 Apr 2023 15:51:28 -0700 (PDT)
Received: from dread.disaster.area (pa49-181-91-157.pa.nsw.optusnet.com.au.
 [49.181.91.157]) by smtp.gmail.com with ESMTPSA id
 m3-20020aa79003000000b006260645f2a7sm11619498pfo.17.2023.04.05.15.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 15:51:28 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pkByP-00HV2h-IA; Thu, 06 Apr 2023 08:51:25 +1000
Date: Thu, 6 Apr 2023 08:51:25 +1000
From: Dave Chinner <david@fromorbit.com>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230405225125.GS3223426@dread.disaster.area>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404233224.GE1893@sol.localdomain>
 <20230405151234.sgkuasb7lwmgetzz@aalbersh.remote.csb>
MIME-Version: 1.0
In-Reply-To: <20230405151234.sgkuasb7lwmgetzz@aalbersh.remote.csb>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v2 21/23] xfs: handle merkle tree block
 size != fs blocksize != PAGE_SIZE
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 05, 2023 at 05:12:34PM +0200, Andrey Albershteyn wrote:
> Hi Eric,
> 
> On Tue, Apr 04, 2023 at 04:32:24PM -0700, Eric Biggers wrote:
> > Hi Andrey,
> > 
> > On Tue, Apr 04, 2023 at 04:53:17PM +0200, Andrey Albershteyn wrote:
> > > In case of different Merkle tree block size fs-verity expects
> > > ->read_merkle_tree_page() to return Merkle tree page filled with
> > > Merkle tree blocks. The XFS stores each merkle tree block under
> > > extended attribute. Those attributes are addressed by block offset
> > > into Merkle tree.
> > > 
> > > This patch make ->read_merkle_tree_page() to fetch multiple merkle
> > > tree blocks based on size ratio. Also the reference to each xfs_buf
> > > is passed with page->private to ->drop_page().
> > > 
> > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > ---
> > >  fs/xfs/xfs_verity.c | 74 +++++++++++++++++++++++++++++++++++----------
> > >  fs/xfs/xfs_verity.h |  8 +++++
> > >  2 files changed, 66 insertions(+), 16 deletions(-)
> > > 
> > > diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
> > > index a9874ff4efcd..ef0aff216f06 100644
> > > --- a/fs/xfs/xfs_verity.c
> > > +++ b/fs/xfs/xfs_verity.c
> > > @@ -134,6 +134,10 @@ xfs_read_merkle_tree_page(
> > >  	struct page		*page = NULL;
> > >  	__be64			name = cpu_to_be64(index << PAGE_SHIFT);
> > >  	uint32_t		bs = 1 << log_blocksize;
> > > +	int			blocks_per_page =
> > > +		(1 << (PAGE_SHIFT - log_blocksize));
> > > +	int			n = 0;
> > > +	int			offset = 0;
> > >  	struct xfs_da_args	args = {
> > >  		.dp		= ip,
> > >  		.attr_filter	= XFS_ATTR_VERITY,
> > > @@ -143,26 +147,59 @@ xfs_read_merkle_tree_page(
> > >  		.valuelen	= bs,
> > >  	};
> > >  	int			error = 0;
> > > +	bool			is_checked = true;
> > > +	struct xfs_verity_buf_list	*buf_list;
> > >  
> > >  	page = alloc_page(GFP_KERNEL);
> > >  	if (!page)
> > >  		return ERR_PTR(-ENOMEM);
> > >  
> > > -	error = xfs_attr_get(&args);
> > > -	if (error) {
> > > -		kmem_free(args.value);
> > > -		xfs_buf_rele(args.bp);
> > > +	buf_list = kzalloc(sizeof(struct xfs_verity_buf_list), GFP_KERNEL);
> > > +	if (!buf_list) {
> > >  		put_page(page);
> > > -		return ERR_PTR(-EFAULT);
> > > +		return ERR_PTR(-ENOMEM);
> > >  	}
> > >  
> > > -	if (args.bp->b_flags & XBF_VERITY_CHECKED)
> > > +	/*
> > > +	 * Fill the page with Merkle tree blocks. The blcoks_per_page is higher
> > > +	 * than 1 when fs block size != PAGE_SIZE or Merkle tree block size !=
> > > +	 * PAGE SIZE
> > > +	 */
> > > +	for (n = 0; n < blocks_per_page; n++) {
> > > +		offset = bs * n;
> > > +		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));
> > > +		args.name = (const uint8_t *)&name;
> > > +
> > > +		error = xfs_attr_get(&args);
> > > +		if (error) {
> > > +			kmem_free(args.value);
> > > +			/*
> > > +			 * No more Merkle tree blocks (e.g. this was the last
> > > +			 * block of the tree)
> > > +			 */
> > > +			if (error == -ENOATTR)
> > > +				break;
> > > +			xfs_buf_rele(args.bp);
> > > +			put_page(page);
> > > +			kmem_free(buf_list);
> > > +			return ERR_PTR(-EFAULT);
> > > +		}
> > > +
> > > +		buf_list->bufs[buf_list->buf_count++] = args.bp;
> > > +
> > > +		/* One of the buffers was dropped */
> > > +		if (!(args.bp->b_flags & XBF_VERITY_CHECKED))
> > > +			is_checked = false;
> > > +
> > > +		memcpy(page_address(page) + offset, args.value, args.valuelen);
> > > +		kmem_free(args.value);
> > > +		args.value = NULL;
> > > +	}
> > 
> > I was really hoping for a solution where the cached data can be used directly,
> > instead allocating a temporary page and copying the cached data into it every
> > time the cache is accessed.  The problem with what you have now is that every
> > time a single 32-byte hash is accessed, a full page (potentially 64KB!) will be
> > allocated and filled.  That's not very efficient.  The need to allocate the
> > temporary page can also cause ENOMEM (which will get reported as EIO).
> > 
> > Did you consider alternatives that would work more efficiently?  I think it
> > would be worth designing something that works properly with how XFS is planned
> > to cache the Merkle tree, instead of designing a workaround.
> > ->read_merkle_tree_page was not really designed for what you are doing here.
> > 
> > How about replacing ->read_merkle_tree_page with a function that takes in a
> > Merkle tree block index (not a page index!) and hands back a (page, offset) pair
> > that identifies where the Merkle tree block's data is located?  Or (folio,
> > offset), I suppose.

{kaddr, len}, please.

> > 
> > With that, would it be possible to directly return the XFS cache?
> > 
> > - Eric
> > 
> 
> Yeah, I also don't like it, I didn't want to change fs-verity much
> so went with this workaround. But as it's ok, I will look into trying
> to pass xfs buffers to fs-verity without direct use of
> ->read_merkle_tree_page(). I think it's possible with (folio,
> offset), the xfs buffers aren't xattr value align so the 4k merkle
> tree block is stored in two pages.

I don't think this is necessary to actually merge the code. We want
it to work correctly as the primary concern, performance is a
secondary concern.

Regardless, as you mention, the xfs_buf is not made up of contiguous
pages so the merkle tree block data will be split across two
(or more) pages.  AFAICT, the fsverity code doesn't work with data
structures that span multiple disjoint pages...

Another problem is that the xfs-buf might be backed by heap memory
(e.g. 4kB fs block size on 64kB PAGE_SIZE) and so it cannot be
treated like a page cache page by the fsverity merkle tree code. We
most definitely do not want to be passing pages containing heap
memory to functions expecting to be passed lru-resident page cache
pages....

That said, xfs-bufs do have a stable method of addressing the data
in the buffers, and all the XFS code uses this to access and
manipulate data directly in the buffers.

That is, xfs_buf_offset() returns a mapped kaddr that points to the
contiguous memory region containing the metadata in the buffer.  If
the xfs_buf spans multiple pages, it will return a kaddr pointing
into the contiguous vmapped memory address that maps the entire
buffer data range. If it is heap memory, it simply returns a pointer
into that heap memory. If it's a single page, then it returns the
kaddr for the data within the page.

If you move all the assumptions about how the merkle tree data is
managed out of fsverity and require the fielsystems to do the
mapping to kaddrs and reference counting to guarantee life times,
then the need for multiple different methods for reading merkle tree
data go away...

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

