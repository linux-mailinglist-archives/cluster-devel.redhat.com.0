Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC306558EA
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Dec 2022 08:22:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671866568;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2Fi47Fpyh+tJbjf8+uKyHTOeyVTr+BeFruENq8fY4qs=;
	b=UGb7WmE51RBBxJ97faPWkoXJxTOgcyrxIye7YEAUiqgKfjpo8d0ZoUE0ExFIEf2ICiA7gG
	EmWlnCBjJeCSMu2gKp/0m+3trT/xhNhJJWKmq+Cvpo3KAfwvJFlLNwIt/mf3XXpr33gQl3
	XB5TuEjIJ1rkw0Pvt+HW9JoYr98JQ0M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-CY9V9dOeOoK-Xo4fLwTG3Q-1; Sat, 24 Dec 2022 02:22:44 -0500
X-MC-Unique: CY9V9dOeOoK-Xo4fLwTG3Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 329AD8533DD;
	Sat, 24 Dec 2022 07:22:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59021492B00;
	Sat, 24 Dec 2022 07:22:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 05EE619465B1;
	Sat, 24 Dec 2022 07:22:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5C5B01946588 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 24 Dec 2022 07:22:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3D69251E5; Sat, 24 Dec 2022 07:22:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 355EB53AA
 for <cluster-devel@redhat.com>; Sat, 24 Dec 2022 07:22:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F18F33806713
 for <cluster-devel@redhat.com>; Sat, 24 Dec 2022 07:22:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-Ypvd_Rt3NE24NoSxzJsMWA-1; Sat, 24 Dec 2022 02:22:37 -0500
X-MC-Unique: Ypvd_Rt3NE24NoSxzJsMWA-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p8yrX-00FvxT-9f; Sat, 24 Dec 2022 07:22:31 +0000
Date: Fri, 23 Dec 2022 23:22:31 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <Y6aot0pDtWl/c5Nb@infradead.org>
References: <20221216150626.670312-1-agruenba@redhat.com>
 <20221216150626.670312-3-agruenba@redhat.com>
 <Y6XDAG25Qumt/iyM@infradead.org>
 <CAHpGcMJAnyn_7hHvsPL5GAiwbJs_DX04+Tt0P+6jfi_kb7jGUg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHpGcMJAnyn_7hHvsPL5GAiwbJs_DX04+Tt0P+6jfi_kb7jGUg@mail.gmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Dec 23, 2022 at 09:54:34PM +0100, Andreas Grünbacher wrote:
> > But for the current version I don't really understand why the error
> > unwinding changes here.
> 
> Currently, we have this order of operations in iomap_write_begin():
> 
>   folio_unlock() // folio_put() // iomap_write_failed() // ->page_done()
> 
> and this order in iomap_write_end():
> 
>   folio_unlock() // ->page_done() // folio_put() // iomap_write_failed()
> 
> The unwinding in iomap_write_begin() works because this is the trivial
> case in which nothing happens to the page. We might just as well use
> the same order of operations there as in iomap_write_end() though, and
> when you switch to that, this is what you get.

Please document this in the commit message.

