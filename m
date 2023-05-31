Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C19B718EA0
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Jun 2023 00:37:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685572640;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=n3rg9Z09BIl1aIQXz+8gKGwERErjA3Juhruo9wqB2U8=;
	b=BpAzUpd9TIJ6TRyFvM1118v1cUPMsAvUiR6r7A4TVFkdMRFGrySI49NtR54x8rpIUvDA95
	7lDFuAfe4JdRhMjkgVv3MVSDYYo+Im7bMsc/M2rVP/FL7f94qG2f/M6LD5bnEdLhZS4KQf
	Lg1n16E9yFdo3kHZVvbKR129XQyhO/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-37GDmdI_NzS4XEtZHFIsbw-1; Wed, 31 May 2023 18:37:16 -0400
X-MC-Unique: 37GDmdI_NzS4XEtZHFIsbw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DD79801585;
	Wed, 31 May 2023 22:37:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D17B12166B26;
	Wed, 31 May 2023 22:37:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 692A119465BA;
	Wed, 31 May 2023 22:37:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4B51319465A4 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 22:37:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 20D49C154D9; Wed, 31 May 2023 22:37:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 189E9C154D7
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 22:37:12 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1F10185A791
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 22:37:11 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-o2Jjo9qdPoK_thpMXIZM0g-1; Wed, 31 May 2023 18:37:02 -0400
X-MC-Unique: o2Jjo9qdPoK_thpMXIZM0g-1
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-19f0e612589so293421fac.2
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 15:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685572622; x=1688164622;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n3rg9Z09BIl1aIQXz+8gKGwERErjA3Juhruo9wqB2U8=;
 b=HzX1qOsIt4nam52GvX3zBTXdIMZh9u9oBZLKu1VsI2l+TtIXAtfN8y5egXK9um7thx
 e+6zSSyiCf9GCNCeZGvt4uZdxRLHawk7itpb8VdXWrxWFbMNJZFHdwkv1CTIwWlDDe71
 6pn2PRgzc6sNC1d3FT40rVj811+yhf5nVgzF1nnTVZQc9Obp3SWcnFmnVO3oSb8BsNFW
 6kIb4PP/KNBDRYsdHseLkvUb6piya1MPYyhdWtNSN0K2rT9uw4TM1WaayF9oX2aJl3yB
 gNcBfRgDL8rnAkvierBW2Uq+qUqaHNs/MHepUz6y2rUVIXA6p03K1lCnPlCK32kO6vdH
 6PaA==
X-Gm-Message-State: AC+VfDyrAngCBMow3FTk3QU5hgtkJO4FMQNqcE0kNZbXOQsRLCKOanwf
 WkQ2BH3rah66YDlbrQMo+8TzXg==
X-Google-Smtp-Source: ACHHUZ7R3wjvNkmWSbL60I9ylavOeUTJY88g1+p1PDiLJE+SHWNaI13IUYsVS+xjUDM8kOkAj2iUNQ==
X-Received: by 2002:a05:6808:1496:b0:398:2f85:ff7f with SMTP id
 e22-20020a056808149600b003982f85ff7fmr6512900oiw.50.1685572621938; 
 Wed, 31 May 2023 15:37:01 -0700 (PDT)
Received: from dread.disaster.area (pa49-179-0-188.pa.nsw.optusnet.com.au.
 [49.179.0.188]) by smtp.gmail.com with ESMTPSA id
 e12-20020a170902784c00b001b034fafaefsm1948337pln.38.2023.05.31.15.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 15:37:01 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1q4UR9-006HGI-0M;
 Thu, 01 Jun 2023 08:36:59 +1000
Date: Thu, 1 Jun 2023 08:36:59 +1000
From: Dave Chinner <david@fromorbit.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Message-ID: <ZHfMC86ktyLtIxNb@dread.disaster.area>
References: <cover.1685532726.git.johannes.thumshirn@wdc.com>
 <58fa893c24c67340a63323f09a179fefdca07f2a.1685532726.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
In-Reply-To: <58fa893c24c67340a63323f09a179fefdca07f2a.1685532726.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v7 19/20] fs: iomap: use
 bio_add_folio_nofail where possible
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Song Liu <song@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, Mike Snitzer <snitzer@kernel.org>,
 jfs-discussion@lists.sourceforge.net, Matthew Wilcox <willy@infradead.org>,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
 Hannes Reinecke <hare@suse.de>, linux-fsdevel@vger.kernel.org,
 gouha7@uniontech.com, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 31, 2023 at 04:50:42AM -0700, Johannes Thumshirn wrote:
> When the iomap buffered-io code can't add a folio to a bio, it allocates a
> new bio and adds the folio to that one. This is done using bio_add_folio(),
> but doesn't check for errors.
> 
> As adding a folio to a newly created bio can't fail, use the newly
> introduced bio_add_folio_nofail() function.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> ---
>  fs/iomap/buffered-io.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 063133ec77f4..0edab9deae2a 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -312,7 +312,7 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
>  			ctx->bio->bi_opf |= REQ_RAHEAD;
>  		ctx->bio->bi_iter.bi_sector = sector;
>  		ctx->bio->bi_end_io = iomap_read_end_io;
> -		bio_add_folio(ctx->bio, folio, plen, poff);
> +		bio_add_folio_nofail(ctx->bio, folio, plen, poff);
>  	}
>  
>  done:
> @@ -539,7 +539,7 @@ static int iomap_read_folio_sync(loff_t block_start, struct folio *folio,
>  
>  	bio_init(&bio, iomap->bdev, &bvec, 1, REQ_OP_READ);
>  	bio.bi_iter.bi_sector = iomap_sector(iomap, block_start);
> -	bio_add_folio(&bio, folio, plen, poff);
> +	bio_add_folio_nofail(&bio, folio, plen, poff);
>  	return submit_bio_wait(&bio);
>  }
>  
> @@ -1582,7 +1582,7 @@ iomap_add_to_ioend(struct inode *inode, loff_t pos, struct folio *folio,
>  
>  	if (!bio_add_folio(wpc->ioend->io_bio, folio, len, poff)) {
>  		wpc->ioend->io_bio = iomap_chain_bio(wpc->ioend->io_bio);
> -		bio_add_folio(wpc->ioend->io_bio, folio, len, poff);
> +		bio_add_folio_nofail(wpc->ioend->io_bio, folio, len, poff);
>  	}

We lose adjacent page merging with this change.

We've had performance regressions in the past that have been
attributed to either the page allocator not handing out sequential
adjacent pages for sequential writes and/or bios not merging
adjacent pages. Some hardware is much more performant when it only
has to do a single large DMA instead of (potentially) hundreds of
single page DMAs for the same amount of data...

What performance regression testing has been done on this change?

-Dave.
-- 
Dave Chinner
david@fromorbit.com

