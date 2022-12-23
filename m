Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B77816551CE
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Dec 2022 16:02:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671807768;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=h+SmOW9vIMluWkiAOCy8s6ZiV2yLlIn3ZNFaeXBMSoA=;
	b=eus4YcgJfpVjX8NYCqOb2rYc+Y6oT5QSHSGdzGB4I5Nuwb6pWQfCbMwdgsgjsCU2+vRzKH
	XZQlsX+DPNH6NvdNl+sK28oxUqDpKp80Ln65z3vLteJf9ZF3bUod1ae+0Ib2peWZBF98Ta
	3Ye29pZItS0thXdsLDC3aJw3SXkSqt0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-kbNharb-OaqR_e-W-VsFKA-1; Fri, 23 Dec 2022 10:02:43 -0500
X-MC-Unique: kbNharb-OaqR_e-W-VsFKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 498A51869B6D;
	Fri, 23 Dec 2022 15:02:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33F0340C945A;
	Fri, 23 Dec 2022 15:02:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E0B4719465B6;
	Fri, 23 Dec 2022 15:02:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DDF7619465B1 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 23 Dec 2022 15:02:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 66AE553AA; Fri, 23 Dec 2022 15:02:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F10279A1
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 15:02:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E82381C0A58A
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 15:02:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-37-8K8W7GmyO_CWMG7f5-MGRw-1; Fri, 23 Dec 2022 10:02:26 -0500
X-MC-Unique: 8K8W7GmyO_CWMG7f5-MGRw-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p8jZ2-009A0X-UF; Fri, 23 Dec 2022 15:02:24 +0000
Date: Fri, 23 Dec 2022 07:02:24 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y6XDAG25Qumt/iyM@infradead.org>
References: <20221216150626.670312-1-agruenba@redhat.com>
 <20221216150626.670312-3-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221216150626.670312-3-agruenba@redhat.com>
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
Subject: Re: [Cluster-devel] [RFC v3 2/7] iomap: Add iomap_folio_done helper
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 16, 2022 at 04:06:21PM +0100, Andreas Gruenbacher wrote:
> +static void iomap_folio_done(struct iomap_iter *iter, loff_t pos, size_t ret,
> +		struct folio *folio)
> +{
> +	const struct iomap_page_ops *page_ops = iter->iomap.page_ops;
> +
> +	if (folio)
> +		folio_unlock(folio);
> +	if (page_ops && page_ops->page_done)
> +		page_ops->page_done(iter->inode, pos, ret, &folio->page);
> +	if (folio)
> +		folio_put(folio);
> +}

How is the folio derefence going to work if folio is NULL?

That being said, I really wonder if the current API is the right way to
go.  Can't we just have a ->get_folio method with the same signature as
__filemap_get_folio, and then do the __filemap_get_folio from the file
system and avoid the page/folio == NULL clean path entirely?  Then on
the done side move the unlock and put into the done method as well.

>  	if (!folio) {
>  		status = (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
> -		goto out_no_page;
> +		iomap_folio_done(iter, pos, 0, NULL);
> +		return status;
>  	}
>  
>  	/*
> @@ -656,13 +670,9 @@ static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
>  	return 0;
>  
>  out_unlock:
> -	folio_unlock(folio);
> -	folio_put(folio);
> +	iomap_folio_done(iter, pos, 0, folio);
>  	iomap_write_failed(iter->inode, pos, len);
>  
> -out_no_page:
> -	if (page_ops && page_ops->page_done)
> -		page_ops->page_done(iter->inode, pos, 0, NULL);
>  	return status;

But for the current version I don't really understand why the error
unwinding changes here.

