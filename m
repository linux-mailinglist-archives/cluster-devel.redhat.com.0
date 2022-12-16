Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A8C64EF1E
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Dec 2022 17:30:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671208236;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=5rY6k+TkStBSKHUWEHUZh6+NC6Q6aDUW2nIr4sNKMfg=;
	b=aPTTnn0nmqhoyCXzUEAfuPhqy8DvVt0Dzc5dGBPonzigho3v7xxnakEgU+P7h88xuHJbO8
	l8RyJG8uiI+2Km8ok4S2iEsI+O2dc/C3Rsk6fSCu1tzXU7ozQJ3dSnrLDRHZtTNF193xt1
	sAnFHRtskS9uwY1n7Y9T7At97vaILRc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-rKxI9rApM9uSOxqc-2Z0rQ-1; Fri, 16 Dec 2022 11:30:33 -0500
X-MC-Unique: rKxI9rApM9uSOxqc-2Z0rQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCA1E885622;
	Fri, 16 Dec 2022 16:30:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8AAA400F58;
	Fri, 16 Dec 2022 16:30:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 87FBE1946A6B;
	Fri, 16 Dec 2022 16:30:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D3A391946594 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Dec 2022 16:30:29 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 78A0C40C945A; Fri, 16 Dec 2022 16:30:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70C2F40C6EC4
 for <cluster-devel@redhat.com>; Fri, 16 Dec 2022 16:30:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58CA4885623
 for <cluster-devel@redhat.com>; Fri, 16 Dec 2022 16:30:29 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-383-kGRQ7nrMNGmJ60nv8kNEow-1; Fri,
 16 Dec 2022 11:30:27 -0500
X-MC-Unique: kGRQ7nrMNGmJ60nv8kNEow-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p6DbK-00FcwU-P0; Fri, 16 Dec 2022 16:30:22 +0000
Date: Fri, 16 Dec 2022 16:30:22 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <Y5ydHlw4orl/gP3a@casper.infradead.org>
References: <20221216150626.670312-1-agruenba@redhat.com>
 <20221216150626.670312-6-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221216150626.670312-6-agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 16, 2022 at 04:06:24PM +0100, Andreas Gruenbacher wrote:
> +	if (page_ops && page_ops->page_prepare)
> +		folio = page_ops->page_prepare(iter, pos, len);
> +	else
> +		folio = iomap_folio_prepare(iter, pos);
> +	if (IS_ERR_OR_NULL(folio)) {
> +		if (!folio)
> +			return (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
> +		return PTR_ERR(folio);

Wouldn't it be cleaner if iomap_folio_prepare() always
returned an ERR_PTR on failure?

