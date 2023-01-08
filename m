Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 736CC661A0B
	for <lists+cluster-devel@lfdr.de>; Sun,  8 Jan 2023 22:33:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673213599;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=QJgOaIuyYqhKXDJUJknk+fSZ5Pa0AYwz5MAMP9q3MIE=;
	b=X+a0FbOjV3TZW0o1wF2as1V70OcwEMIPmBdten7LXrEeCLsIxOMpejg3K/vitobxt4T2IC
	oNdtdmi3cR/Xb1+JWA+ELqvoj2771l6pU2VDNqwK62um2Go/3qLeAYBjzngF3lVV8NCfHJ
	IdNQd9wfMFncXOoZEngYLdytdWUF7LQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-138-4e9bPEIHOHaQg-2lD74OpA-1; Sun, 08 Jan 2023 16:33:16 -0500
X-MC-Unique: 4e9bPEIHOHaQg-2lD74OpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A77811C05AD7;
	Sun,  8 Jan 2023 21:33:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BA484085721;
	Sun,  8 Jan 2023 21:33:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E41B81947062;
	Sun,  8 Jan 2023 21:33:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3D79C1946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  8 Jan 2023 21:33:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2CBEE2026D68; Sun,  8 Jan 2023 21:33:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2583F2026D4B
 for <cluster-devel@redhat.com>; Sun,  8 Jan 2023 21:33:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 062ED8533AC
 for <cluster-devel@redhat.com>; Sun,  8 Jan 2023 21:33:12 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-MGhZ3reBPjiAQAxkIfVaMQ-1; Sun, 08 Jan 2023 16:33:10 -0500
X-MC-Unique: MGhZ3reBPjiAQAxkIfVaMQ-1
Received: by mail-pf1-f177.google.com with SMTP id d83so2812055pfd.7
 for <cluster-devel@redhat.com>; Sun, 08 Jan 2023 13:33:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QJgOaIuyYqhKXDJUJknk+fSZ5Pa0AYwz5MAMP9q3MIE=;
 b=YX1/y/d/VG+7oZKLTeQyfJTm0NUnlHe6ibz9FpZQS5vgqeeN9JtqUBm5sFlPJ48ERc
 RamXezW+p6Dyk/21z7INmu+rTvp96QpzWkCTGXubM5MP/9t0P6dLHk1YMTl8j4RIucfV
 NePbpqd+EO0+g/P1aOmMIfLkyL5oECnIae//zbO08xQs16cWacld84l4epZfzgT4JS8N
 DshwjYPlcrVc5soy+PYJfgDKaBI/zJuGfmVAh0lyEvz5gWjW1c1E+vGtt+Fa9KlIPI0n
 dB+NWdFUkp1dKwB8fry+8WzDbpTpkIJb3WHC6SSBgosIoJAlG7O+iIicB0OtXQwsADTV
 8Gow==
X-Gm-Message-State: AFqh2koPkvnwl6BL5avYad7a5yJkUK7xGn0HKuKukwvAi02YEOar1TGd
 a7jf+LlY/n69UcAOGMRHlEstHQ==
X-Google-Smtp-Source: AMrXdXuy9YBsvnTXDPu6eykrHHHCfyBjyJt/L4aFAuuIaBmxWa89uFX8ht1hQVCJwiApGqsjy0ZqRg==
X-Received: by 2002:a05:6a00:1c82:b0:587:4171:30c9 with SMTP id
 y2-20020a056a001c8200b00587417130c9mr3550129pfw.18.1673213589019; 
 Sun, 08 Jan 2023 13:33:09 -0800 (PST)
Received: from dread.disaster.area (pa49-186-146-207.pa.vic.optusnet.com.au.
 [49.186.146.207]) by smtp.gmail.com with ESMTPSA id
 a13-20020aa7970d000000b00582197fa7b4sm4631425pfg.7.2023.01.08.13.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 13:33:08 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pEdHt-000kZs-Cn; Mon, 09 Jan 2023 08:33:05 +1100
Date: Mon, 9 Jan 2023 08:33:05 +1100
From: Dave Chinner <david@fromorbit.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20230108213305.GO1971568@dread.disaster.area>
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-5-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230108194034.1444764-5-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [RFC v6 04/10] iomap: Add iomap_get_folio helper
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 "Darrick J . Wong" <djwong@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 08, 2023 at 08:40:28PM +0100, Andreas Gruenbacher wrote:
> Add an iomap_get_folio() helper that gets a folio reference based on
> an iomap iterator and an offset into the address space.  Use it in
> iomap_write_begin().
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> Reviewed-by: Darrick J. Wong <djwong@kernel.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/iomap/buffered-io.c | 39 ++++++++++++++++++++++++++++++---------
>  include/linux/iomap.h  |  1 +
>  2 files changed, 31 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index d4b444e44861..de4a8e5f721a 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -457,6 +457,33 @@ bool iomap_is_partially_uptodate(struct folio *folio, size_t from, size_t count)
>  }
>  EXPORT_SYMBOL_GPL(iomap_is_partially_uptodate);
>  
> +/**
> + * iomap_get_folio - get a folio reference for writing
> + * @iter: iteration structure
> + * @pos: start offset of write
> + *
> + * Returns a locked reference to the folio at @pos, or an error pointer if the
> + * folio could not be obtained.
> + */
> +struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos)
> +{
> +	unsigned fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT | FGP_STABLE | FGP_NOFS;
> +	struct folio *folio;
> +
> +	if (iter->flags & IOMAP_NOWAIT)
> +		fgp |= FGP_NOWAIT;
> +
> +	folio = __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
> +			fgp, mapping_gfp_mask(iter->inode->i_mapping));
> +	if (folio)
> +		return folio;
> +
> +	if (iter->flags & IOMAP_NOWAIT)
> +		return ERR_PTR(-EAGAIN);
> +	return ERR_PTR(-ENOMEM);
> +}
> +EXPORT_SYMBOL_GPL(iomap_get_folio);

Hmmmm.

This is where things start to get complex. I have sent a patch to
fix a problem with iomap_zero_range() failing to zero cached dirty
pages over UNWRITTEN extents, and that requires making FGP_CREAT
optional. This is an iomap bug, and needs to be fixed in the core
iomap code:

https://lore.kernel.org/linux-xfs/20221201005214.3836105-1-david@fromorbit.com/

Essentially, we need to pass fgp flags to iomap_write_begin() need
so the callers can supply a 0 or FGP_CREAT appropriately. This
allows iomap_write_begin() to act only on pre-cached pages rather
than always instantiating a new page if one does not exist in cache.

This allows that iomap_write_begin() to return a NULL folio
successfully, and this is perfectly OK for callers that pass in fgp
= 0 as they are expected to handle a NULL folio return indicating
there was no cached data over the range...

Exposing the folio allocation as an external interface makes bug
fixes like this rather messy - it's taking a core abstraction (iomap
hides all the folio and page cache manipulations from the
filesystem) and punching a big hole in it by requiring filesystems
to actually allocation page cache folios on behalf of the iomap
core.

Given that I recently got major push-back for fixing an XFS-only bug
by walking the page cache directly instead of abstracting it via the
iomap core, punching an even bigger hole in the abstraction layer to
fix a GFS2-only problem is just as bad....

-Dave.
-- 
Dave Chinner
david@fromorbit.com

