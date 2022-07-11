Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B608856D410
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jul 2022 06:49:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657514968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3o2B0xrreOjJ1WyCQfROaLeP80HBP0AC5FzinGdZ0R8=;
	b=Kze/oFTbC7zaWsaDCzeCdQ2DtKEyczQ1PoKdqVAVw9YuPw8e9zdsg65sx0CtkS3eV7pD1F
	M1Pzbse1lRVacBrX3Agvh8oNBRS5TVCfa3o/tl9Gwioc35Gw0avLljZkwfngKarOA6oZcB
	gnfsYna/BSnBGCf3sveVffa7pakMkM8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-_pBx7WKdM4CnWmEqe2pokg-1; Mon, 11 Jul 2022 00:49:17 -0400
X-MC-Unique: _pBx7WKdM4CnWmEqe2pokg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E68993803900;
	Mon, 11 Jul 2022 04:49:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6FB5DC15D40;
	Mon, 11 Jul 2022 04:49:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E7CC01947054;
	Mon, 11 Jul 2022 04:49:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2A8211947040 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 11 Jul 2022 04:49:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 02EA32026D07; Mon, 11 Jul 2022 04:49:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F18172026D64
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 04:49:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3E6D85A583
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 04:49:12 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-bFCTC248NFWPCEk8GSg4Qw-1; Mon, 11 Jul 2022 00:49:11 -0400
X-MC-Unique: bFCTC248NFWPCEk8GSg4Qw-1
X-IronPort-AV: E=Sophos;i="5.92,262,1650902400"; d="scan'208";a="205328134"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Jul 2022 12:47:53 +0800
IronPort-SDR: jBgGHc6Oe6WWJtsn/az9NmkOSnSS/+z7bjJLYjbNyVFJbv3kDk3TPg2M1pJtv1QmEbCIf1jBap
 31bixqnfdbqgOb3NdW6zaIzbv+zwSbHzlZhHdTAFgGaVaM4qtqIqrVULpHbOchOghnFqJOXbEG
 GAXqoYvlvDKt7L3Hx+KS+5HDQ2acyNIUyyA0Evabh11nD3EdDxZYI2789mXyGG1zuROKpFwX8i
 gY4n58Up7cZ8IjDiPeKHeJ4K3bmXEiBvssxNJ7AH3eWwFhpTN8wwwMoMer8mNpirNb33HpvgCk
 EHtOb1er/L2ih9/VdT+1ytDt
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jul 2022 21:04:53 -0700
IronPort-SDR: KbBFYPrKGuu4SPq9XJDBm7eFYGJSUjirFQtxSd8aJ+cfytAHRdI+HZ/O2btHu9XkSDrVctktf/
 ttcdhyW/qlIHO/6dQ4EVlfdJMs/vh0I1HCm7QQgEbKyqh/Z1HodNjujPPVIvm4gfXmwB9WAelS
 plDJsVr1dKkcONpoRvkCV/ifrs2sY1Byjv++OBg/mORAcdWKsxJBNAnSP6eylYtCcF7nTaxuF8
 r0DSYctTIY6m1OaeiO1Jt6dMW0+4cl6DD0xhfum/jdupNtnIGoDenEJWKjMTN0rFpqXVuXN/wq
 RR8=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jul 2022 21:47:55 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LhBG20bHRz1Rwnx
 for <cluster-devel@redhat.com>; Sun, 10 Jul 2022 21:47:54 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id hO1h0JDyrptg for <cluster-devel@redhat.com>;
 Sun, 10 Jul 2022 21:47:53 -0700 (PDT)
Received: from [10.225.163.114] (unknown [10.225.163.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LhBG00pFFz1RtVk;
 Sun, 10 Jul 2022 21:47:51 -0700 (PDT)
Message-ID: <3b411188-50ec-4844-73c3-afed8dd3fcf2@opensource.wdc.com>
Date: Mon, 11 Jul 2022 13:47:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: Christoph Hellwig <hch@lst.de>, Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>
References: <20220711041459.1062583-1-hch@lst.de>
 <20220711041459.1062583-4-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220711041459.1062583-4-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH 3/4] zonefs: remove ->writepage
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
Cc: cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/11/22 13:14, Christoph Hellwig wrote:
> ->writepage is only used for single page writeback from memory reclaim,
> and not called at all for cgroup writeback.  Follow the lead of XFS
> and remove ->writepage and rely entirely on ->writepages.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/zonefs/super.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 053299758deb9..062c3f1da0327 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -232,13 +232,6 @@ static const struct iomap_writeback_ops zonefs_writeback_ops = {
>  	.map_blocks		= zonefs_write_map_blocks,
>  };
>  
> -static int zonefs_writepage(struct page *page, struct writeback_control *wbc)
> -{
> -	struct iomap_writepage_ctx wpc = { };
> -
> -	return iomap_writepage(page, wbc, &wpc, &zonefs_writeback_ops);
> -}
> -
>  static int zonefs_writepages(struct address_space *mapping,
>  			     struct writeback_control *wbc)
>  {
> @@ -266,7 +259,6 @@ static int zonefs_swap_activate(struct swap_info_struct *sis,
>  static const struct address_space_operations zonefs_file_aops = {
>  	.read_folio		= zonefs_read_folio,
>  	.readahead		= zonefs_readahead,
> -	.writepage		= zonefs_writepage,
>  	.writepages		= zonefs_writepages,
>  	.dirty_folio		= filemap_dirty_folio,
>  	.release_folio		= iomap_release_folio,

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

