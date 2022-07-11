Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D947C56D411
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jul 2022 06:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657514971;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=R7QgoyTegjGvEQe4dRTTiyApPh845GyqKMJfo86kmW8=;
	b=jUoOIiWpboG0Kjd/zkVQMNyH15VAwBXsNr2pIP23PEZ5Uf7FcxzR9N7gB4PpXnZZ7LQqkQ
	lySmyPpDtiglAEeQMWhJspWXvO8uX209OGretWpcRMd7AA0QyCy6dn/kZBb6y4Lihgj85+
	ODawODrHnMeeiulcTZbSGTxA1KzQDXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-YIB7AB5iMUe5uMHqD57Cyg-1; Mon, 11 Jul 2022 00:49:27 -0400
X-MC-Unique: YIB7AB5iMUe5uMHqD57Cyg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 080398032EA;
	Mon, 11 Jul 2022 04:49:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F05681121314;
	Mon, 11 Jul 2022 04:49:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 955301947054;
	Mon, 11 Jul 2022 04:49:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3AEA41947040 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 11 Jul 2022 04:49:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1941F40D282E; Mon, 11 Jul 2022 04:49:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1447540D2827
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 04:49:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57927801231
 for <cluster-devel@redhat.com>; Mon, 11 Jul 2022 04:49:23 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-s4QKJ0kWNLyL0vpW0Mojrg-1; Mon, 11 Jul 2022 00:49:15 -0400
X-MC-Unique: s4QKJ0kWNLyL0vpW0Mojrg-1
X-IronPort-AV: E=Sophos;i="5.92,262,1650902400"; d="scan'208";a="317462893"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Jul 2022 12:48:11 +0800
IronPort-SDR: l/vfAZEQ6ynhA+O7dHMZDClvVL9NONcjv14FIsiyhXKrhkkhz77aPtVUfiLnf1lpc+WiP1CP4f
 6sCzQ0zX3VhUCHLpmHmN+R1pFV79Lg3wf+2otfiGgMkD9x0s6XJkAhPNXVJCpeGiKGCwZJuqhm
 +3xfNAq9g69K9rnyIdwT0tJTSuV0/wMhawwOFLLh2BuWD3w0WwEqYPIizqicXbO2o9fJxRfcZM
 Zbo6N3ehLWWmVgqIwfTg4SLDpt0AAZ0cC+9Io/7f66efd6FOMPRgLkygZuH0pl3Eqm1lfXLmfA
 GzX5zWScNoq3hzm8aDmYugAj
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jul 2022 21:05:10 -0700
IronPort-SDR: 2wP1aW/EkBBA1De3ZGTQp8s6A3z8dMu3ybDBV/EQZh7zO9/kq8AgV0psedXLvBEn/f7GAZeLKg
 lw+uLmJarsfvPviPfJD98tLKqVpCB0ucVrYGfOdnKVH5JbtFN4e6TgP2XHPhNHmtNXI0Yzs0FI
 dqNP0cWDeD1MjaonRR9+GOiiDPfGQ4F/LjbnPMciItlmln2lP78Qr2SaU1K/Tea5jyNDEufz14
 MUGVVRs5/JBWL4uCXPYJviAnsdvMboegVdGhSVmlNSS3gfCYP8jI57Qxvlfa1vNCkDv8kjMzN7
 8cc=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Jul 2022 21:48:11 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LhBGL6n7Bz1Rwnm
 for <cluster-devel@redhat.com>; Sun, 10 Jul 2022 21:48:10 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 6kJRip84wHWE for <cluster-devel@redhat.com>;
 Sun, 10 Jul 2022 21:48:10 -0700 (PDT)
Received: from [10.225.163.114] (unknown [10.225.163.114])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LhBGK07lNz1RtVk;
 Sun, 10 Jul 2022 21:48:08 -0700 (PDT)
Message-ID: <ae8f3075-f13e-1ce6-4bdd-86926cf3ded2@opensource.wdc.com>
Date: Mon, 11 Jul 2022 13:48:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
To: Christoph Hellwig <hch@lst.de>, Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>
References: <20220711041459.1062583-1-hch@lst.de>
 <20220711041459.1062583-5-hch@lst.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220711041459.1062583-5-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 4/4] iomap: remove iomap_writepage
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/11/22 13:14, Christoph Hellwig wrote:
> Unused now.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/iomap/buffered-io.c | 15 ---------------
>  include/linux/iomap.h  |  3 ---
>  2 files changed, 18 deletions(-)
> 
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index d2a9f699e17ed..1bac8bda40d0c 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -1518,21 +1518,6 @@ iomap_do_writepage(struct page *page, struct writeback_control *wbc, void *data)
>  	return 0;
>  }
>  
> -int
> -iomap_writepage(struct page *page, struct writeback_control *wbc,
> -		struct iomap_writepage_ctx *wpc,
> -		const struct iomap_writeback_ops *ops)
> -{
> -	int ret;
> -
> -	wpc->ops = ops;
> -	ret = iomap_do_writepage(page, wbc, wpc);
> -	if (!wpc->ioend)
> -		return ret;
> -	return iomap_submit_ioend(wpc, wpc->ioend, ret);
> -}
> -EXPORT_SYMBOL_GPL(iomap_writepage);
> -
>  int
>  iomap_writepages(struct address_space *mapping, struct writeback_control *wbc,
>  		struct iomap_writepage_ctx *wpc,
> diff --git a/include/linux/iomap.h b/include/linux/iomap.h
> index e552097c67e0b..911888560d3eb 100644
> --- a/include/linux/iomap.h
> +++ b/include/linux/iomap.h
> @@ -303,9 +303,6 @@ void iomap_finish_ioends(struct iomap_ioend *ioend, int error);
>  void iomap_ioend_try_merge(struct iomap_ioend *ioend,
>  		struct list_head *more_ioends);
>  void iomap_sort_ioends(struct list_head *ioend_list);
> -int iomap_writepage(struct page *page, struct writeback_control *wbc,
> -		struct iomap_writepage_ctx *wpc,
> -		const struct iomap_writeback_ops *ops);
>  int iomap_writepages(struct address_space *mapping,
>  		struct writeback_control *wbc, struct iomap_writepage_ctx *wpc,
>  		const struct iomap_writeback_ops *ops);

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

