Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE9F6D82CB
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 18:02:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680710561;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4E5sAaKj2nRhZMpCfhlf1IVMfFLjV6lcrwFxgfc+2Uo=;
	b=Aaxx+MwhZQVXelY0kRHJHgQnS7uS9oR4TAsbv1OilebD//McTgCWUmSqIm6y5Hg0TI5oi1
	O0TOMrqDHD1iPGU/dmzl4WqikdRFa+hyc3CLCQjL+G4Medul+f8MgUKqbGAmlgsxX4n6wX
	/FI7vj1TqG6Lzp+1kF/nAqI4ZviKdy8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-HPOqLIlyP76UeSnOQFhSEg-1; Wed, 05 Apr 2023 12:02:38 -0400
X-MC-Unique: HPOqLIlyP76UeSnOQFhSEg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC1F688B780;
	Wed,  5 Apr 2023 16:02:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF0A9492C14;
	Wed,  5 Apr 2023 16:02:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 77E391946597;
	Wed,  5 Apr 2023 16:02:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2965B1946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 16:02:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0E58F440BC; Wed,  5 Apr 2023 16:02:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06263440D6
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 16:02:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBFD5100DEB0
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 16:02:32 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-BKdqmVOfPBinXCfDiaTK7w-1; Wed, 05 Apr 2023 12:02:30 -0400
X-MC-Unique: BKdqmVOfPBinXCfDiaTK7w-1
Received: by mail-qv1-f69.google.com with SMTP id
 dg8-20020a056214084800b005acc280bf19so16440113qvb.22
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 09:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680710549;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4E5sAaKj2nRhZMpCfhlf1IVMfFLjV6lcrwFxgfc+2Uo=;
 b=atJ8cvtSEKRekUeoqzjRsJUOuy7B7elgt2KnxUp42e04o/vu4KUDKca2On631URpp5
 TiRmwbAl2WMMaLiUciJ8h38DQwpRb9FM0vKvaV2yWgrzq1AWeUxTnSFvSLYc361DFXtD
 xpnITt5pCeZpXYUCoDeyjBlrSQ52Vs9YMd8zELvwfLSz8h4GPdx2XMJ5HSi0suBQQN42
 HMSIeAVJiCgQrt7UWfg0FmLUa758wHAaH3HSvu4+qtPD4Tc5KxkuhUQF6ui2jcLHVCOl
 hU7zSpO3tpDTd00Augiid7KoRLYaxBusaneD8/CbVQiH17Lz9yolgt6lcgam+Vr406bs
 F2Xg==
X-Gm-Message-State: AAQBX9e6/994E9woKXG+kq6+zUPzyBlt67zh/jJnnOYF0dZ2JzQ9aBdq
 mHM83Xr2w8EZCuVZMLYFpTE5FaKp71KmMBtbCXGsxOtJHFlZbJ+TjFNN5zyZw9gNEcscmOB8eua
 2T9xFCTbNamGrLf6ev9mV
X-Received: by 2002:ac8:5fce:0:b0:3b9:b6e3:c78e with SMTP id
 k14-20020ac85fce000000b003b9b6e3c78emr5645467qta.8.1680710548124; 
 Wed, 05 Apr 2023 09:02:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350a9fBwBu823yNMJRRNCF/kPjd5TTa8a0sHl1G7/F6LAQ61bqbdFkGDEgXPZez2BOg5cs9V+tg==
X-Received: by 2002:ac8:5fce:0:b0:3b9:b6e3:c78e with SMTP id
 k14-20020ac85fce000000b003b9b6e3c78emr5645405qta.8.1680710547586; 
 Wed, 05 Apr 2023 09:02:27 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 m12-20020ac8688c000000b003df7d7bbc8csm4060750qtq.75.2023.04.05.09.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 09:02:26 -0700 (PDT)
Date: Wed, 5 Apr 2023 18:02:21 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20230404163602.GC109974@frogsfrogsfrogs>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: fsverity@lists.linux.dev, linux-ext4@vger.kernel.org,
 damien.lemoal@opensource.wdc.com, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Darrick,

On Tue, Apr 04, 2023 at 09:36:02AM -0700, Darrick J. Wong wrote:
> On Tue, Apr 04, 2023 at 04:53:17PM +0200, Andrey Albershteyn wrote:
> > In case of different Merkle tree block size fs-verity expects
> > ->read_merkle_tree_page() to return Merkle tree page filled with
> > Merkle tree blocks. The XFS stores each merkle tree block under
> > extended attribute. Those attributes are addressed by block offset
> > into Merkle tree.
> > 
> > This patch make ->read_merkle_tree_page() to fetch multiple merkle
> > tree blocks based on size ratio. Also the reference to each xfs_buf
> > is passed with page->private to ->drop_page().
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > ---
> >  fs/xfs/xfs_verity.c | 74 +++++++++++++++++++++++++++++++++++----------
> >  fs/xfs/xfs_verity.h |  8 +++++
> >  2 files changed, 66 insertions(+), 16 deletions(-)
> > 
> > diff --git a/fs/xfs/xfs_verity.c b/fs/xfs/xfs_verity.c
> > index a9874ff4efcd..ef0aff216f06 100644
> > --- a/fs/xfs/xfs_verity.c
> > +++ b/fs/xfs/xfs_verity.c
> > @@ -134,6 +134,10 @@ xfs_read_merkle_tree_page(
> >  	struct page		*page = NULL;
> >  	__be64			name = cpu_to_be64(index << PAGE_SHIFT);
> >  	uint32_t		bs = 1 << log_blocksize;
> > +	int			blocks_per_page =
> > +		(1 << (PAGE_SHIFT - log_blocksize));
> > +	int			n = 0;
> > +	int			offset = 0;
> >  	struct xfs_da_args	args = {
> >  		.dp		= ip,
> >  		.attr_filter	= XFS_ATTR_VERITY,
> > @@ -143,26 +147,59 @@ xfs_read_merkle_tree_page(
> >  		.valuelen	= bs,
> >  	};
> >  	int			error = 0;
> > +	bool			is_checked = true;
> > +	struct xfs_verity_buf_list	*buf_list;
> >  
> >  	page = alloc_page(GFP_KERNEL);
> >  	if (!page)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > -	error = xfs_attr_get(&args);
> > -	if (error) {
> > -		kmem_free(args.value);
> > -		xfs_buf_rele(args.bp);
> > +	buf_list = kzalloc(sizeof(struct xfs_verity_buf_list), GFP_KERNEL);
> > +	if (!buf_list) {
> >  		put_page(page);
> > -		return ERR_PTR(-EFAULT);
> > +		return ERR_PTR(-ENOMEM);
> >  	}
> >  
> > -	if (args.bp->b_flags & XBF_VERITY_CHECKED)
> > +	/*
> > +	 * Fill the page with Merkle tree blocks. The blcoks_per_page is higher
> > +	 * than 1 when fs block size != PAGE_SIZE or Merkle tree block size !=
> > +	 * PAGE SIZE
> > +	 */
> > +	for (n = 0; n < blocks_per_page; n++) {
> 
> Ahah, ok, that's why we can't pass the xfs_buf pages up to fsverity.
> 
> > +		offset = bs * n;
> > +		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));
> 
> Really this ought to be a typechecked helper...
> 
> struct xfs_fsverity_merkle_key {
> 	__be64	merkleoff;

Sure, thanks, will change this

> };
> 
> static inline void
> xfs_fsverity_merkle_key_to_disk(struct xfs_fsverity_merkle_key *k, loff_t pos)
> {
> 	k->merkeloff = cpu_to_be64(pos);
> }
> 
> 
> 
> > +		args.name = (const uint8_t *)&name;
> > +
> > +		error = xfs_attr_get(&args);
> > +		if (error) {
> > +			kmem_free(args.value);
> > +			/*
> > +			 * No more Merkle tree blocks (e.g. this was the last
> > +			 * block of the tree)
> > +			 */
> > +			if (error == -ENOATTR)
> > +				break;
> > +			xfs_buf_rele(args.bp);
> > +			put_page(page);
> > +			kmem_free(buf_list);
> > +			return ERR_PTR(-EFAULT);
> > +		}
> > +
> > +		buf_list->bufs[buf_list->buf_count++] = args.bp;
> > +
> > +		/* One of the buffers was dropped */
> > +		if (!(args.bp->b_flags & XBF_VERITY_CHECKED))
> > +			is_checked = false;
> 
> If there's enough memory pressure to cause the merkle tree pages to get
> evicted, what are the chances that the xfs_bufs survive the eviction?

The merkle tree pages are dropped after verification. When page is
dropped xfs_buf is marked as verified. If fs-verity wants to
verify again it will get the same verified buffer. If buffer is
evicted it won't have verified state.

So, with enough memory pressure buffers will be dropped and need to
be reverified.

> 
> > +		memcpy(page_address(page) + offset, args.value, args.valuelen);
> > +		kmem_free(args.value);
> > +		args.value = NULL;
> > +	}
> > +
> > +	if (is_checked)
> >  		SetPageChecked(page);
> > +	page->private = (unsigned long)buf_list;
> >  
> > -	page->private = (unsigned long)args.bp;
> > -	memcpy(page_address(page), args.value, args.valuelen);
> > -
> > -	kmem_free(args.value);
> >  	return page;
> >  }
> >  
> > @@ -191,16 +228,21 @@ xfs_write_merkle_tree_block(
> >  
> >  static void
> >  xfs_drop_page(
> > -	struct page	*page)
> > +	struct page			*page)
> >  {
> > -	struct xfs_buf *buf = (struct xfs_buf *)page->private;
> > +	int				i = 0;
> > +	struct xfs_verity_buf_list	*buf_list =
> > +		(struct xfs_verity_buf_list *)page->private;
> >  
> > -	ASSERT(buf != NULL);
> > +	ASSERT(buf_list != NULL);
> >  
> > -	if (PageChecked(page))
> > -		buf->b_flags |= XBF_VERITY_CHECKED;
> > +	for (i = 0; i < buf_list->buf_count; i++) {
> > +		if (PageChecked(page))
> > +			buf_list->bufs[i]->b_flags |= XBF_VERITY_CHECKED;
> > +		xfs_buf_rele(buf_list->bufs[i]);
> > +	}
> >  
> > -	xfs_buf_rele(buf);
> > +	kmem_free(buf_list);
> >  	put_page(page);
> >  }
> >  
> > diff --git a/fs/xfs/xfs_verity.h b/fs/xfs/xfs_verity.h
> > index ae5d87ca32a8..433b2f4ae3bc 100644
> > --- a/fs/xfs/xfs_verity.h
> > +++ b/fs/xfs/xfs_verity.h
> > @@ -16,4 +16,12 @@ extern const struct fsverity_operations xfs_verity_ops;
> >  #define xfs_verity_ops NULL
> >  #endif	/* CONFIG_FS_VERITY */
> >  
> > +/* Minimal Merkle tree block size is 1024 */
> > +#define XFS_VERITY_MAX_MBLOCKS_PER_PAGE (1 << (PAGE_SHIFT - 10))
> > +
> > +struct xfs_verity_buf_list {
> > +	unsigned int	buf_count;
> > +	struct xfs_buf	*bufs[XFS_VERITY_MAX_MBLOCKS_PER_PAGE];
> 
> So... this is going to be a 520-byte allocation on arm64 with 64k pages?
> Even if the merkle tree block size is the same as the page size?  Ouch.

yeah, it also allocates a page and is dropped with the page, so,
I took it as an addition to already big chunk of memory. But I
probably will change it, viz. comment from Eric on this patch.

-- 
- Andrey

