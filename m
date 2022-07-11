Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EB0570E36
	for <lists+cluster-devel@lfdr.de>; Tue, 12 Jul 2022 01:23:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657581805;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=/q/fM8pNGaA4sNIIE9f0bEPPvZJEcYT1Nv2gU2H7qnM=;
	b=dMYdGpaoKwxoMe8zos/lp/OUbQWCHwn7A07zJkQyv+Ds9sYeGGOfJM3O8IolEDzo8GVcv4
	RmcgZiUlEZeneSAb2WZW3lliVg9+iGKDzJtqQeYnnfNEb5bz74QYwndkDwcqds03SmP4EE
	cebB1DTAWux5MtkPS6c5BhhVJTbCh60=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-6CV5vNmmPWmN7ok3wxeTtw-1; Mon, 11 Jul 2022 19:23:20 -0400
X-MC-Unique: 6CV5vNmmPWmN7ok3wxeTtw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB7878032EA;
	Mon, 11 Jul 2022 23:23:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 74C1140CF8EA;
	Mon, 11 Jul 2022 23:23:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1BA891947060;
	Mon, 11 Jul 2022 23:23:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 56FF4194705C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 11 Jul 2022 23:23:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2F7B3C15D58; Mon, 11 Jul 2022 23:23:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B020C2811A
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 23:23:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13694101AA47
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 23:23:17 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-PcxuhOAvOeSdJBy63e6Mpg-1; Mon, 11 Jul 2022 19:23:07 -0400
X-MC-Unique: PcxuhOAvOeSdJBy63e6Mpg-1
Received: by mail-qv1-f45.google.com with SMTP id nd6so1476397qvb.6;
 Mon, 11 Jul 2022 16:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/q/fM8pNGaA4sNIIE9f0bEPPvZJEcYT1Nv2gU2H7qnM=;
 b=bGPXaVQ+zOfqjc0aPkiCHzZraTe9svIH5zylzkJ2ka113f/O0RPlWZbfar6VEh3YUt
 cGRXS7vnfHjcwtS4TxpETHqLl02RttRnGv1bPXeug7RS8JuPRAz62tRnDp9XpfhlvyR4
 ElkVvihGNXOq9fe4eXjKXrFB3SuhhbN/s6Ld2D4YekBKocjE8AzATryqzTGEbbSMUXrM
 yElH02XagWADYNgnofDpxEXZOedrqEgJswI0E97++VikAWT3wC4l+wcLIwUtgsP0G/4d
 tQVf06eliciKmecGf0rteaIESmw2Vj5YGSu5//RswEapW68XY5HY+9Jx98LG9t1YQzdu
 RIgg==
X-Gm-Message-State: AJIora+mGSmdLr6d3/GjJO3h8+w7XCEswo4pl+u+8X6FBLysj1C/JFWK
 xyhnwoe87r+LXzIon1U6LSE9DpfgpAK+BM1xp8mZ5/lqIw4=
X-Google-Smtp-Source: AGRyM1vnrYQM46zGtkGWwykcZ+hv0MaP+4jT834HK0M6B1yxWQKb5po7+H4f8Z/wUifUniMK2NXdhZPHi3yjNM0gaJw=
X-Received: by 2002:a05:6214:76d:b0:473:2a39:45fb with SMTP id
 f13-20020a056214076d00b004732a3945fbmr15539693qvz.129.1657581780221; Mon, 11
 Jul 2022 16:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220711041459.1062583-1-hch@lst.de>
 <20220711041459.1062583-3-hch@lst.de>
In-Reply-To: <20220711041459.1062583-3-hch@lst.de>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Tue, 12 Jul 2022 01:22:48 +0200
Message-ID: <CAHpGcMLFwN4toB2KD0EvPAgx3zchpGNfzUWfsJ-8dxmnOieCsQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH 2/4] gfs2: remove ->writepage
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs <linux-xfs@vger.kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 cluster-devel <cluster-devel@redhat.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Johannes Thumshirn <jth@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am Mo., 11. Juli 2022 um 06:16 Uhr schrieb Christoph Hellwig <hch@lst.de>:
> ->writepage is only used for single page writeback from memory reclaim,
> and not called at all for cgroup writeback.  Follow the lead of XFS
> and remove ->writepage and rely entirely on ->writepages.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/gfs2/aops.c | 26 --------------------------
>  1 file changed, 26 deletions(-)
>
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 106e90a365838..0240a1a717f56 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -81,31 +81,6 @@ static int gfs2_get_block_noalloc(struct inode *inode, sector_t lblock,
>         return 0;
>  }
>
> -/**
> - * gfs2_writepage - Write page for writeback mappings
> - * @page: The page
> - * @wbc: The writeback control
> - */
> -static int gfs2_writepage(struct page *page, struct writeback_control *wbc)
> -{
> -       struct inode *inode = page->mapping->host;
> -       struct gfs2_inode *ip = GFS2_I(inode);
> -       struct gfs2_sbd *sdp = GFS2_SB(inode);
> -       struct iomap_writepage_ctx wpc = { };
> -
> -       if (gfs2_assert_withdraw(sdp, gfs2_glock_is_held_excl(ip->i_gl)))
> -               goto out;
> -       if (current->journal_info)
> -               goto redirty;
> -       return iomap_writepage(page, wbc, &wpc, &gfs2_writeback_ops);
> -
> -redirty:
> -       redirty_page_for_writepage(wbc, page);
> -out:
> -       unlock_page(page);
> -       return 0;
> -}
> -
>  /**
>   * gfs2_write_jdata_page - gfs2 jdata-specific version of block_write_full_page
>   * @page: The page to write
> @@ -765,7 +740,6 @@ bool gfs2_release_folio(struct folio *folio, gfp_t gfp_mask)
>  }
>
>  static const struct address_space_operations gfs2_aops = {
> -       .writepage = gfs2_writepage,
>         .writepages = gfs2_writepages,
>         .read_folio = gfs2_read_folio,
>         .readahead = gfs2_readahead,
> --
> 2.30.2
>

This is looking fine, and it has survived a moderate amount of testing already.

Tested-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

It should be possible to remove the .writepage operation in
gfs2_jdata_aops as well, but I must be overlooking something because
that actually breaks things.

Thanks,
Andreas

