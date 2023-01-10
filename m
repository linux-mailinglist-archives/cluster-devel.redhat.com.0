Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BF9663BA2
	for <lists+cluster-devel@lfdr.de>; Tue, 10 Jan 2023 09:48:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673340511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=dEXzLuaqvTyI+z3V9E2DV7LmLQn86nVlheB/UL+EEQQ=;
	b=K5xAODJSTSq0ugvVTj6aSs7di+VCCQO7DwP6kpihzSIyLQm628rOXD7kNmZ0nevw6wW+TY
	K5cLRk9hFszKas5lsNoiHqiZ4l6nAOZUZoSZxZulO3FRybOyWXwDUeuqj6zVPWIM9Suzyh
	u6hMi9y+x8s1PEcESASqoilA4K906/8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-F52K7E4yO7q4GFvMOwCnOw-1; Tue, 10 Jan 2023 03:48:26 -0500
X-MC-Unique: F52K7E4yO7q4GFvMOwCnOw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45F3C18E6208;
	Tue, 10 Jan 2023 08:48:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AB0BF2026D4B;
	Tue, 10 Jan 2023 08:48:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 608E8194037D;
	Tue, 10 Jan 2023 08:48:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 094CA1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Jan 2023 08:48:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EA8D44240D; Tue, 10 Jan 2023 08:48:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E31A6422FE
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 08:48:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B1AD3814942
 for <cluster-devel@redhat.com>; Tue, 10 Jan 2023 08:48:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-147-hBQnj1g6OB2ewUYlWKXlEg-1; Tue, 10 Jan 2023 03:48:21 -0500
X-MC-Unique: hBQnj1g6OB2ewUYlWKXlEg-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pFAIp-005trf-CU; Tue, 10 Jan 2023 08:48:15 +0000
Date: Tue, 10 Jan 2023 00:48:15 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y70mT0Ptuy9s/une@infradead.org>
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-7-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230108194034.1444764-7-agruenba@redhat.com>
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
Subject: Re: [Cluster-devel] [RFC v6 06/10] iomap: Add __iomap_get_folio
 helper
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jan 08, 2023 at 08:40:30PM +0100, Andreas Gruenbacher wrote:
> +static struct folio *__iomap_get_folio(struct iomap_iter *iter, loff_t pos,
> +		size_t len)
> +{
> +	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
> +
> +	if (page_ops && page_ops->page_prepare)
> +		return page_ops->page_prepare(iter, pos, len);
> +	else
> +		return iomap_get_folio(iter, pos);

Nit: No need for an else after the return.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

