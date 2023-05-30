Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BAA716839
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 17:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685462267;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ef9UXKlo6HOEzGKOWoRQOx3X1Mv/S3dqqbfR/aqcj1E=;
	b=cxyAhuI/8sBf1I2zjW//MAYbGy9l/HawRLSNXXgetKm6Jz7kW1nB4zeKlcqZJewFrkekfj
	bhajMfOWE9RoriPeANHBqFP1z8fx6lK3iOpakHpys6415Uq1OnuLqQ5EWXLtQjk+HMJXuv
	+84MX9D5ztNFvZthLc6ccijl5mDBZjA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-6cixhDdRNV-L01w7MFMOrw-1; Tue, 30 May 2023 11:57:45 -0400
X-MC-Unique: 6cixhDdRNV-L01w7MFMOrw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02E7538294B9;
	Tue, 30 May 2023 15:57:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5EC2C154D2;
	Tue, 30 May 2023 15:57:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9D58819465A8;
	Tue, 30 May 2023 15:57:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 431F119465A2 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 15:49:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 302312166B25; Tue, 30 May 2023 15:49:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27C842166B26
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 15:49:57 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AC1D101B046
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 15:49:57 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-Yp41RH13PJ6ss2s8rT4ERA-1; Tue, 30 May 2023 11:49:55 -0400
X-MC-Unique: Yp41RH13PJ6ss2s8rT4ERA-1
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-75b14216386so263835785a.0
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 08:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685461795; x=1688053795;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ef9UXKlo6HOEzGKOWoRQOx3X1Mv/S3dqqbfR/aqcj1E=;
 b=aq4n+6nEIHOeYXIrDbU+ghkwbIt/f3yjq5NdJxbbIn1WcvKIvB9is69fmvyZ+LPTp3
 lXAaYN1oXlYfeO3fSqVXjVOE0whFTuohm3UdRL4b2PulMyQIKOsUh/TyAo/W1pUY/+2H
 ICuygW0QLrqOY2jafszYK11r1qCjybD1aNEjRUrqhtPr1brZGujnkEVKjHMhM0T7a0Un
 vGPMsR48ROJTEvgb+ZMAIjpQRccB9eeQLiBz9WHQdBdh6Y3/dpwA1iu/vRhuRtBuCC2C
 mbbO/C4/pAoa82DV7JiM/qDQUnT9x0v+LnzAQ14rq5HMsIskcgicvJO1PRRJDrQbYoxk
 rUZw==
X-Gm-Message-State: AC+VfDwgQNkFaBea3neR3qqa3UThwfuU0z3OnV7hGy73+UMOP1fPaFcC
 nGnGNsNJsorMEsbiupIrvwy9Ozw=
X-Google-Smtp-Source: ACHHUZ7pliMoFycu95ZOXiwcTabY+u351+caH9+LwJwAEUbICb4vYuE61O+IVefjdSw8mai/KPkDog==
X-Received: by 2002:a05:620a:8084:b0:75c:c99d:e416 with SMTP id
 ef4-20020a05620a808400b0075cc99de416mr2289656qkb.49.1685461794842; 
 Tue, 30 May 2023 08:49:54 -0700 (PDT)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net.
 [68.160.166.30]) by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0075b053ab66bsm4135656qkn.50.2023.05.30.08.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 08:49:54 -0700 (PDT)
Date: Tue, 30 May 2023 11:49:53 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <ZHYbIYxGbcXbpvIK@redhat.com>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
 <20230502101934.24901-17-johannes.thumshirn@wdc.com>
 <alpine.LRH.2.21.2305301045220.3943@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.2305301045220.3943@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Tue, 30 May 2023 15:57:41 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 30 2023 at 11:13P -0400,
Mikulas Patocka <mpatocka@redhat.com> wrote:

> 
> 
> On Tue, 2 May 2023, Johannes Thumshirn wrote:
> 
> > Check if adding pages to clone bio fails and if it does retry with
> > reclaim. This mirrors the behaviour of page allocation in
> > crypt_alloc_buffer().
> > 
> > This way we can mark bio_add_pages as __must_check.
> > 
> > Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> > Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> > ---
> >  drivers/md/dm-crypt.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> > index 8b47b913ee83..b234dc089cee 100644
> > --- a/drivers/md/dm-crypt.c
> > +++ b/drivers/md/dm-crypt.c
> > @@ -1693,7 +1693,14 @@ static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned int size)
> >  
> >  		len = (remaining_size > PAGE_SIZE) ? PAGE_SIZE : remaining_size;
> >  
> > -		bio_add_page(clone, page, len, 0);
> > +		if (!bio_add_page(clone, page, len, 0)) {
> > +			mempool_free(page, &cc->page_pool);
> > +			crypt_free_buffer_pages(cc, clone);
> > +			bio_put(clone);
> > +			gfp_mask |= __GFP_DIRECT_RECLAIM;
> > +			goto retry;
> > +
> > +		}
> >  
> >  		remaining_size -= len;
> >  	}
> 
> Hi
> 
> I nack this. This just adds code that can't ever be executed.
> 
> dm-crypt already allocates enough entries in the vector (see "unsigned int 
> nr_iovecs = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;"), so bio_add_page can't 
> fail.
> 
> If you want to add __must_check to bio_add_page, you should change the 
> dm-crypt code to:
> if (!bio_add_page(clone, page, len, 0)) {
> 	WARN(1, "this can't happen");
> 	return NULL;
> }
> and not write recovery code for a can't-happen case.

Thanks for the review Mikulas. But the proper way forward, in the
context of this patchset, is to simply change bio_add_page() to
__bio_add_page()

Subject becomes: "dm crypt: use __bio_add_page to add single page to clone bio"

And header can explain that "crypt_alloc_buffer() already allocates
enough entries in the clone bio's vector, so bio_add_page can't fail".

Mike

