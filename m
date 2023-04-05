Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 157596D8135
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 17:12:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680707577;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SqJwMhzGjMA4RLeL2DTJK7ERbSrDJ+6vKzhw2fl99yc=;
	b=Onl18HugD0OWdIvx0VMn2QvrN1h4sxnhdOVStE4zWdnuEuizbHPrzFIsHJPX/QCaqtt18p
	G7fHGcfmlfbzR7yXv3Hk9ny4t2gRXn5F33jyR8QI5kttHOMAhLUx9szcqVYJGFlxgFCOZl
	0WMH6sWt1dlbPml+ubdjJQISu+GKyAk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-kKTEIBGcNB6-B9CJK4NXyA-1; Wed, 05 Apr 2023 11:12:56 -0400
X-MC-Unique: kKTEIBGcNB6-B9CJK4NXyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 273A83C0ED6C;
	Wed,  5 Apr 2023 15:12:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1C8621400E6D;
	Wed,  5 Apr 2023 15:12:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DD9461946597;
	Wed,  5 Apr 2023 15:12:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3D6DE194658F for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 15:12:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1C1D840C845F; Wed,  5 Apr 2023 15:12:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1464C40C83A9
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 15:12:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECE313C0ED6C
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 15:12:42 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-138-XNgCb0qkPBa4wSiLMpYHtQ-1; Wed, 05 Apr 2023 11:12:39 -0400
X-MC-Unique: XNgCb0qkPBa4wSiLMpYHtQ-1
Received: by mail-qv1-f70.google.com with SMTP id
 a15-20020a0562140c2f00b005ad28a23cffso16160069qvd.6
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 08:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680707559;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SqJwMhzGjMA4RLeL2DTJK7ERbSrDJ+6vKzhw2fl99yc=;
 b=mbxXkWj2+2s4a+4KY2RitpQkjQZVagJuIdj9ly0oFJlsN9jKlgjcqGozgOlp8p2G0M
 hVaCeqWCgQfFABQSl5/WEODdA2nyIxj028wLnA/yXZRtDw6yqDHAVF3pKWfhTi3e5CSj
 4calesZDNE2wMlGawZzz8//Gp2/xD/O18UBmcYCl8wHdxgd7jeolfnR5erUkLPrVG3RX
 lnrkbGSPKQAdt4H55Ws8JD2oe3699SrCVBg3DTA/IDPEcJCmBVYtNiW8pXFYGGDrnh0A
 w38r4Vog644nusFdL15s/pJrBgU1BDoNRHPfNM+8g0WOllBcY/09ml9cbtCML9bpdpka
 5RzQ==
X-Gm-Message-State: AAQBX9deb2cWSBUM4FFZh2buHc3wDtl7hZUapO3u/hjrZIsIJ/eT0U7p
 MlRgiGOEmfaetI40NdzVdG/NAI3FpKwNHkYHiE0f+qfEQ8Gl/QtzHlmdbFz/lXFhBRU5LF15Q9e
 H2IxGtWMPzXc9fDpTSxAB
X-Received: by 2002:ad4:5cc6:0:b0:5b8:d384:1b1b with SMTP id
 iu6-20020ad45cc6000000b005b8d3841b1bmr9629026qvb.28.1680707559355; 
 Wed, 05 Apr 2023 08:12:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350bTLeyVegiyAT0lX0KuZbEyJnR2oIc+0ekYOMME6yW+MNP2PzqzXS2RPNGFIg86YMrIm+IHVg==
X-Received: by 2002:ad4:5cc6:0:b0:5b8:d384:1b1b with SMTP id
 iu6-20020ad45cc6000000b005b8d3841b1bmr9628970qvb.28.1680707558963; 
 Wed, 05 Apr 2023 08:12:38 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 d1-20020a0cc681000000b005dd8b934579sm4274922qvj.17.2023.04.05.08.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 08:12:38 -0700 (PDT)
Date: Wed, 5 Apr 2023 17:12:34 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230405151234.sgkuasb7lwmgetzz@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404233224.GE1893@sol.localdomain>
MIME-Version: 1.0
In-Reply-To: <20230404233224.GE1893@sol.localdomain>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

On Tue, Apr 04, 2023 at 04:32:24PM -0700, Eric Biggers wrote:
> Hi Andrey,
> 
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
> > +		offset = bs * n;
> > +		name = cpu_to_be64(((index << PAGE_SHIFT) + offset));
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
> > +
> > +		memcpy(page_address(page) + offset, args.value, args.valuelen);
> > +		kmem_free(args.value);
> > +		args.value = NULL;
> > +	}
> 
> I was really hoping for a solution where the cached data can be used directly,
> instead allocating a temporary page and copying the cached data into it every
> time the cache is accessed.  The problem with what you have now is that every
> time a single 32-byte hash is accessed, a full page (potentially 64KB!) will be
> allocated and filled.  That's not very efficient.  The need to allocate the
> temporary page can also cause ENOMEM (which will get reported as EIO).
> 
> Did you consider alternatives that would work more efficiently?  I think it
> would be worth designing something that works properly with how XFS is planned
> to cache the Merkle tree, instead of designing a workaround.
> ->read_merkle_tree_page was not really designed for what you are doing here.
> 
> How about replacing ->read_merkle_tree_page with a function that takes in a
> Merkle tree block index (not a page index!) and hands back a (page, offset) pair
> that identifies where the Merkle tree block's data is located?  Or (folio,
> offset), I suppose.
> 
> With that, would it be possible to directly return the XFS cache?
> 
> - Eric
> 

Yeah, I also don't like it, I didn't want to change fs-verity much
so went with this workaround. But as it's ok, I will look into trying
to pass xfs buffers to fs-verity without direct use of
->read_merkle_tree_page(). I think it's possible with (folio,
offset), the xfs buffers aren't xattr value align so the 4k merkle
tree block is stored in two pages.

Thanks for suggestion!

-- 
- Andrey

