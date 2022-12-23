Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AE16551E8
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Dec 2022 16:07:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671808073;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0TYedYNU8D+NUsXvfS4xuhZ4V3OYraEeUZQLBYD+RCs=;
	b=TozDTaEY1bUFzlKiY5Oabq7bWi2Y/g1lnfGx0Ynnp1kAAASskik9xH9oESQwSB2l+g6vHf
	Ua8v0hcMZ/0As/JFZHJk3XHvuHu86Ze6CxbBJv1ZjQ97cK4IkQTiQ57b5jIIR/xG5LG6ZS
	Wo3YHKFYRp4XpHoHGauH/FIxST9s9y8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-StnILmV7NPaljG4I2zoafw-1; Fri, 23 Dec 2022 10:07:50 -0500
X-MC-Unique: StnILmV7NPaljG4I2zoafw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 162881C0898C;
	Fri, 23 Dec 2022 15:07:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0415A492C14;
	Fri, 23 Dec 2022 15:07:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DCB6119465B6;
	Fri, 23 Dec 2022 15:07:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7511F19465B1 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 23 Dec 2022 15:07:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 541AA51FF; Fri, 23 Dec 2022 15:07:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C23F53AA
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 15:07:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B597811E6E
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 15:07:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-108-oUFXoVn_PpGDm3Nh20yUUg-1; Fri, 23 Dec 2022 10:07:45 -0500
X-MC-Unique: oUFXoVn_PpGDm3Nh20yUUg-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p8je6-009DGB-Qi; Fri, 23 Dec 2022 15:07:38 +0000
Date: Fri, 23 Dec 2022 07:07:38 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y6XEOtT9Gc3p0kd4@infradead.org>
References: <20221216150626.670312-1-agruenba@redhat.com>
 <20221216150626.670312-6-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221216150626.670312-6-agruenba@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [RFC v3 5/7] iomap: Get page in page_prepare
 handler
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
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 16, 2022 at 04:06:24PM +0100, Andreas Gruenbacher wrote:
> Change the iomap ->page_prepare() handler to get and return a locked
> folio instead of doing that in iomap_write_begin().  This allows to
> recover from out-of-memory situations in ->page_prepare(), which
> eliminates the corresponding error handling code in iomap_write_begin().
> The ->page_done() handler is now not called with a NULL folio anymore.

Ah, okay - this is the other half of what I asked for earlier, so
we're aligned.  Sorry for the noise earlier.  I'd still prefer the
naming I suggest, though.

> +	if (page_ops && page_ops->page_prepare)
> +		folio = page_ops->page_prepare(iter, pos, len);
> +	else
> +		folio = iomap_folio_prepare(iter, pos);
> +	if (IS_ERR_OR_NULL(folio)) {
> +		if (!folio)
> +			return (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
> +		return PTR_ERR(folio);
>  	}

Maybe encapsulate this in a iomap_get_folio wrapper just to keep the
symmetry with the done side.

