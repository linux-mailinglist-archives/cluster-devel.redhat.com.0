Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEAA716DCE
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 21:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685475822;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=61jSLilvI6Kq8tZP1TgtpGiMrTcQZMGT4z3p0LusAeA=;
	b=IIvBiBdkhDiIAbNDj7FWDnp0Er1/co+E6hJvyvcThGxeFwVfdDnF2cOdl/I7VYTgSMQPvN
	7EDIdt58bB4Oyg+8vIYXG2FxsUUZeSbo3dLSkq/X4BJlsMPiTC19C2IiRAErWFYZ0l94vc
	n+bJpuz4eSrnzGuKiMujwJuLzAa7t3k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-hdpXO66gMwyklHovXnAAMQ-1; Tue, 30 May 2023 15:43:39 -0400
X-MC-Unique: hdpXO66gMwyklHovXnAAMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A20D7185A793;
	Tue, 30 May 2023 19:43:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5CFD940CFD47;
	Tue, 30 May 2023 19:43:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E5BFA19465BC;
	Tue, 30 May 2023 19:43:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AC6F819465A0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 19:43:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 930482166B26; Tue, 30 May 2023 19:43:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5346B2166B25;
 Tue, 30 May 2023 19:43:34 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 34UJhY4b022142; Tue, 30 May 2023 15:43:34 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 34UJhXMb022117; Tue, 30 May 2023 15:43:33 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 30 May 2023 15:43:33 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <snitzer@kernel.org>
In-Reply-To: <ZHYbIYxGbcXbpvIK@redhat.com>
Message-ID: <alpine.LRH.2.21.2305301527410.18906@file01.intranet.prod.int.rdu2.redhat.com>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
 <20230502101934.24901-17-johannes.thumshirn@wdc.com>
 <alpine.LRH.2.21.2305301045220.3943@file01.intranet.prod.int.rdu2.redhat.com>
 <ZHYbIYxGbcXbpvIK@redhat.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v5 16/20] dm-crypt: check if adding
 pages to clone bio fails
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
Cc: "axboe @ kernel . dk" <axboe@kernel.dk>, shaggy@kernel.org,
 damien.lemoal@wdc.com, kch@nvidia.com, song@kernel.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, linux-raid@vger.kernel.org,
 jfs-discussion@lists.sourceforge.net, willy@infradead.org, ming.lei@redhat.com,
 cluster-devel@redhat.com, linux-mm@kvack.org, dm-devel@redhat.com,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, hch@lst.de
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII



On Tue, 30 May 2023, Mike Snitzer wrote:

> On Tue, May 30 2023 at 11:13P -0400,
> Mikulas Patocka <mpatocka@redhat.com> wrote:
> 
> > Hi
> > 
> > I nack this. This just adds code that can't ever be executed.
> > 
> > dm-crypt already allocates enough entries in the vector (see "unsigned int 
> > nr_iovecs = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;"), so bio_add_page can't 
> > fail.
> > 
> > If you want to add __must_check to bio_add_page, you should change the 
> > dm-crypt code to:
> > if (!bio_add_page(clone, page, len, 0)) {
> > 	WARN(1, "this can't happen");
> > 	return NULL;
> > }
> > and not write recovery code for a can't-happen case.
> 
> Thanks for the review Mikulas. But the proper way forward, in the
> context of this patchset, is to simply change bio_add_page() to
> __bio_add_page()
> 
> Subject becomes: "dm crypt: use __bio_add_page to add single page to clone bio"
> 
> And header can explain that "crypt_alloc_buffer() already allocates
> enough entries in the clone bio's vector, so bio_add_page can't fail".
> 
> Mike

Yes, __bio_add_page would look nicer. But bio_add_page can merge adjacent 
pages into a single bvec entry and __bio_add_page can't (I don't know how 
often the merging happens or what is the performance implication of 
non-merging).

I think that for the next merge window, we can apply this patch: 
https://listman.redhat.com/archives/dm-devel/2023-May/054046.html
which makes this discussion irrelevant. (you can change bio_add_page to 
__bio_add_page in it)

Mikukas

