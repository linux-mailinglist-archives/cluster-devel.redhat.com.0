Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E70C659880
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Dec 2022 13:58:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672405104;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6wGBkXWPpYjazxvcUxjswCd89wx6pPvJfoOTyM3QCW0=;
	b=TeW+mX/cEa1/txA2FsXwrquNklNfooKXPpoHaSxxLngM15Bwz2wv7XrtPdeDviY7pDoGTK
	9BGpmBgjPDj6DB5eAkNe4/JLNg1wVLevyR63KRPTYMbpo8IlXWYmLTh6GiW5y0T27hVK12
	BX9l4SL7GNXxh86OxYsMvk74uFER5j4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-VMxq2rCtNximHrC2e-DZYQ-1; Fri, 30 Dec 2022 07:58:18 -0500
X-MC-Unique: VMxq2rCtNximHrC2e-DZYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A91B2185A794;
	Fri, 30 Dec 2022 12:58:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 006F340C1141;
	Fri, 30 Dec 2022 12:58:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2F1481946589;
	Fri, 30 Dec 2022 12:58:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 314271946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 30 Dec 2022 12:58:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 22B54112132D; Fri, 30 Dec 2022 12:58:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B5DB112132C
 for <cluster-devel@redhat.com>; Fri, 30 Dec 2022 12:58:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F01D885CBEA
 for <cluster-devel@redhat.com>; Fri, 30 Dec 2022 12:58:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-656-bPGi2yqVMTWrF1FYRFaMMw-1; Fri, 30 Dec 2022 07:58:09 -0500
X-MC-Unique: bPGi2yqVMTWrF1FYRFaMMw-1
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pAYmM-0067SQ-6j; Wed, 28 Dec 2022 15:55:42 +0000
Date: Wed, 28 Dec 2022 07:55:42 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Y6xm/sJXHaMxO1HI@infradead.org>
References: <20221216150626.670312-1-agruenba@redhat.com>
 <20221216150626.670312-5-agruenba@redhat.com>
 <Y6XDhb2IkNOdaT/t@infradead.org>
 <CAHpGcMLzTrn3ZUB4S8gjpz+aGj+R1hAu38m-PL5rVj-W-0G2ZA@mail.gmail.com>
 <Y6ao9tiimcg/DFGl@infradead.org>
 <Y6gUAtg4MZC2ZG6v@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y6gUAtg4MZC2ZG6v@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [RFC v3 4/7] iomap: Add iomap_folio_prepare
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
 "Darrick J . Wong" <djwong@kernel.org>,
 Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Dec 25, 2022 at 09:12:34AM +0000, Matthew Wilcox wrote:
> > > I was looking at it from the filesystem point of view: this helper is
> > > meant to be used in ->folio_prepare() handlers, so
> > > iomap_folio_prepare() seemed to be a better name than
> > > __iomap_get_folio().
> > 
> > Well, I think the right name for the methods that gets a folio is
> > probably ->folio_get anyway.
> 
> For the a_ops, the convention I've been following is:
> 
> folio_mark_dirty()
>  -> aops->dirty_folio()
>    -> iomap_dirty_folio()
> 
> ie VERB_folio() as the name of the operation, and MODULE_VERB_folio()
> as the implementation.  Seems to work pretty well.

Yeay, ->get_folio sounds fine if not even better as it matches
filemap_get_folio.

