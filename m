Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 154B7655CB7
	for <lists+cluster-devel@lfdr.de>; Sun, 25 Dec 2022 10:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671959565;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FdSkeieNG1bC63s9lF5RGovWFIFuWTP7A8qZ4msnCck=;
	b=Hj9m8aD9Dv5XlLWe/pPt4qGVTJgQRwIvnsfO6J/Ierw/jvMUG7RIivZfKevzUtdMJQkklz
	qZvBPTn4zbuowYtl+gpe+fwdwz51KC28UClAKFQQ17UA0sdRWqgXQKXRiVzQ1n7OLSEeOc
	Lu4E1KWjfXw5hiesEDBWrZGkI9Y9t8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-Gh7B0mAINZakrKersVx5Fw-1; Sun, 25 Dec 2022 04:12:39 -0500
X-MC-Unique: Gh7B0mAINZakrKersVx5Fw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29F0E185A78B;
	Sun, 25 Dec 2022 09:12:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 797651121315;
	Sun, 25 Dec 2022 09:12:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA91E194658F;
	Sun, 25 Dec 2022 09:12:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 05B701946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 25 Dec 2022 09:12:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9005140E949; Sun, 25 Dec 2022 09:12:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1777140EBF6
 for <cluster-devel@redhat.com>; Sun, 25 Dec 2022 09:12:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6CDF185A78B
 for <cluster-devel@redhat.com>; Sun, 25 Dec 2022 09:12:34 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-80-tOSVGUjjO-e31Dl-sZo_aA-1; Sun,
 25 Dec 2022 04:12:29 -0500
X-MC-Unique: tOSVGUjjO-e31Dl-sZo_aA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1p9N3a-005rKQ-22; Sun, 25 Dec 2022 09:12:34 +0000
Date: Sun, 25 Dec 2022 09:12:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Y6gUAtg4MZC2ZG6v@casper.infradead.org>
References: <20221216150626.670312-1-agruenba@redhat.com>
 <20221216150626.670312-5-agruenba@redhat.com>
 <Y6XDhb2IkNOdaT/t@infradead.org>
 <CAHpGcMLzTrn3ZUB4S8gjpz+aGj+R1hAu38m-PL5rVj-W-0G2ZA@mail.gmail.com>
 <Y6ao9tiimcg/DFGl@infradead.org>
MIME-Version: 1.0
In-Reply-To: <Y6ao9tiimcg/DFGl@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
Cc: cluster-devel@redhat.com, "Darrick J . Wong" <djwong@kernel.org>,
 Andreas =?iso-8859-1?Q?Gr=FCnbacher?= <andreas.gruenbacher@gmail.com>,
 linux-xfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Dec 23, 2022 at 11:23:34PM -0800, Christoph Hellwig wrote:
> On Fri, Dec 23, 2022 at 10:05:05PM +0100, Andreas Grünbacher wrote:
> > > I'd name this __iomap_get_folio to match __filemap_get_folio.
> > 
> > I was looking at it from the filesystem point of view: this helper is
> > meant to be used in ->folio_prepare() handlers, so
> > iomap_folio_prepare() seemed to be a better name than
> > __iomap_get_folio().
> 
> Well, I think the right name for the methods that gets a folio is
> probably ->folio_get anyway.

For the a_ops, the convention I've been following is:

folio_mark_dirty()
 -> aops->dirty_folio()
   -> iomap_dirty_folio()

ie VERB_folio() as the name of the operation, and MODULE_VERB_folio()
as the implementation.  Seems to work pretty well.

