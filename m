Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E92FB6D7A8F
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Apr 2023 13:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680692492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=BoHgQZFE6GmfSeys+DR2W7oxw4hgWtoFTpySQ2VkKFk=;
	b=I/ygOCMScEPrszPbaOFvRLp54t/Aeip3FKMS1RMETdlK5ek3hMiikRwGkYoGdQE4yZDvPb
	ThWszlqVTmB04GcBCA0iup+PG35bqTZ+TgyHycj+28yyPlPvNrxNTOFWIV4xeT+njlkDrw
	tkQrz/rZO/xF1P2h6s+KmDsaExfEzT8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-wSio_xJhMBO_dZIHwsLfew-1; Wed, 05 Apr 2023 07:01:29 -0400
X-MC-Unique: wSio_xJhMBO_dZIHwsLfew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D313858289;
	Wed,  5 Apr 2023 11:01:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E74118EC7;
	Wed,  5 Apr 2023 11:01:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 051771946597;
	Wed,  5 Apr 2023 11:01:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6E8D01946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Apr 2023 11:01:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 59D54492C18; Wed,  5 Apr 2023 11:01:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52865492C14
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 11:01:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3697A2814242
 for <cluster-devel@redhat.com>; Wed,  5 Apr 2023 11:01:24 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-3AHOh9AEN5i1xoQniQgcCQ-1; Wed, 05 Apr 2023 07:01:22 -0400
X-MC-Unique: 3AHOh9AEN5i1xoQniQgcCQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 b142-20020ae9eb94000000b007486a8b9ae9so13377887qkg.11
 for <cluster-devel@redhat.com>; Wed, 05 Apr 2023 04:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680692482;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BoHgQZFE6GmfSeys+DR2W7oxw4hgWtoFTpySQ2VkKFk=;
 b=Ds04jqZih1K+IYRLE0SDQ1I4Q2gTfylxTuPjyIsknD1xp9PcwfSEdJJXtTBhGCrfTi
 +2OjGXafmwP911KKVRO0XOZR/tuVd2WCRyOjOsQymrjSOH1l+mkbmxvSx+teKR2vRYYA
 ldwo7QrCkSyeiAqcYc5GPAFxGGKZj3nnJwy8txtH9igWKXI2P1Nl1UkC1DUOWvoFdN1s
 9rvtLHxxvyaTSnpW0+US5sEGA7lIx8rivxgc5q8jvKFA5g0CqrLwZayfe604kzleU4is
 C38E9ojoLOzEhVo/ascHkNwzLEl8froRWmDvFF54J8Li1XTL0i6k+v6WaRUF0xvHUTqJ
 Mt5A==
X-Gm-Message-State: AAQBX9fFmBxlpRdEsJmW1Ph3LZ+cb92ZPmvIYn1Ot31Tb1AYlW90rMm2
 y1EeHlSMBZJ2kj0K5KlK2R1dG7jUWwxbWmNZKRCztkCF/qrGW1HtutkFydXLqzeSkIb/ux/rLYr
 SiGfid+Um2r4ZTRo9Pb+0
X-Received: by 2002:a05:6214:4001:b0:5ca:f6dd:f3b6 with SMTP id
 kd1-20020a056214400100b005caf6ddf3b6mr8310658qvb.16.1680692482363; 
 Wed, 05 Apr 2023 04:01:22 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZN5rxyt4g78lpjs6te5NjsBmYN83L29u8HXb3VRNmLRZGiyzEv7hgqJmGPE20fJY6cuY/SPQ==
X-Received: by 2002:a05:6214:4001:b0:5ca:f6dd:f3b6 with SMTP id
 kd1-20020a056214400100b005caf6ddf3b6mr8310617qvb.16.1680692482068; 
 Wed, 05 Apr 2023 04:01:22 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 om30-20020a0562143d9e00b005dd8b934576sm4136208qvb.14.2023.04.05.04.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 04:01:21 -0700 (PDT)
Date: Wed, 5 Apr 2023 13:01:16 +0200
From: Andrey Albershteyn <aalbersh@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20230405110116.ia5wv3qxbnpdciui@aalbersh.remote.csb>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-10-aalbersh@redhat.com>
 <ZCxEHkWayQyGqnxL@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZCxEHkWayQyGqnxL@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v2 09/23] iomap: allow filesystem to
 implement read path verification
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
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christoph,

On Tue, Apr 04, 2023 at 08:37:02AM -0700, Christoph Hellwig wrote:
> >  	if (iomap_block_needs_zeroing(iter, pos)) {
> >  		folio_zero_range(folio, poff, plen);
> > +		if (iomap->flags & IOMAP_F_READ_VERITY) {
> 
> Wju do we need the new flag vs just testing that folio_ops and
> folio_ops->verify_folio is non-NULL?

Yes, it can be just test, haven't noticed that it's used only here,
initially I used it in several places.

> 
> > -		ctx->bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs),
> > -				     REQ_OP_READ, gfp);
> > +		ctx->bio = bio_alloc_bioset(iomap->bdev, bio_max_segs(nr_vecs),
> > +				REQ_OP_READ, GFP_NOFS, &iomap_read_ioend_bioset);
> 
> All other callers don't really need the larger bioset, so I'd avoid
> the unconditional allocation here, but more on that later.

Ok, make sense.

> 
> > +		ioend = container_of(ctx->bio, struct iomap_read_ioend,
> > +				read_inline_bio);
> > +		ioend->io_inode = iter->inode;
> > +		if (ctx->ops && ctx->ops->prepare_ioend)
> > +			ctx->ops->prepare_ioend(ioend);
> > +
> 
> So what we're doing in writeback and direct I/O, is to:
> 
>  a) have a submit_bio hook
>  b) allow the file system to then hook the bi_end_io caller
>  c) (only in direct O/O for now) allow the file system to provide
>     a bio_set to allocate from

I see.

> 
> I wonder if that also makes sense and keep all the deferral in the
> file system.  We'll need that for the btrfs iomap conversion anyway,
> and it seems more flexible.  The ioend processing would then move into
> XFS.
> 

Not sure what you mean here.

> > @@ -156,6 +160,11 @@ struct iomap_folio_ops {
> >  	 * locked by the iomap code.
> >  	 */
> >  	bool (*iomap_valid)(struct inode *inode, const struct iomap *iomap);
> > +
> > +	/*
> > +	 * Verify folio when successfully read
> > +	 */
> > +	bool (*verify_folio)(struct folio *folio, loff_t pos, unsigned int len);
> 
> Why isn't this in iomap_readpage_ops?
> 

Yes, it can be. But it appears to me to be more relevant to
_folio_ops, any particular reason to move it there? Don't mind
moving it to iomap_readpage_ops.

-- 
- Andrey

