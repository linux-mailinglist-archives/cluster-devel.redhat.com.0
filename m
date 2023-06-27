Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D27C673FAE6
	for <lists+cluster-devel@lfdr.de>; Tue, 27 Jun 2023 13:18:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687864694;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VD4gCHSw4USDEh9b2CAEXtZoeo6S0MoZYWWqACPYVs8=;
	b=Q0Fkd5MD59zUKh/uhpQZmW+YosNXyuuhHm95ebmtNuwt5QitMB7ktMe32seJ/c6Reb1Qf+
	RW7kmLD+/ponpO6skepNvAo9idKjdHBY0EcYceZKkHg6ZH8xWL37nbqNsvs3qWradQrK5n
	0aGmQCWNpzT1bPhDZRyN4YUanrG6qv0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-UJDfIiEtNSC5DiTFaFB2cQ-1; Tue, 27 Jun 2023 07:18:07 -0400
X-MC-Unique: UJDfIiEtNSC5DiTFaFB2cQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72D1A3811817;
	Tue, 27 Jun 2023 11:18:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B0A5111F3B0;
	Tue, 27 Jun 2023 11:18:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C869B1946589;
	Tue, 27 Jun 2023 11:18:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 962D71946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 27 Jun 2023 11:11:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 502AB40C206F; Tue, 27 Jun 2023 11:11:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 484EB40C2063
 for <cluster-devel@redhat.com>; Tue, 27 Jun 2023 11:11:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27F9E3C100AC
 for <cluster-devel@redhat.com>; Tue, 27 Jun 2023 11:11:57 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-SLz8E72rNE2U--lMbteSnQ-1; Tue, 27 Jun 2023 07:11:51 -0400
X-MC-Unique: SLz8E72rNE2U--lMbteSnQ-1
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3113dabc549so6129102f8f.1; 
 Tue, 27 Jun 2023 04:11:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687864309; x=1690456309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VD4gCHSw4USDEh9b2CAEXtZoeo6S0MoZYWWqACPYVs8=;
 b=D3W6LwL5ZBc2Zigrhfdx+tLPn/if+3YJ3Ke7HLc9S/PRN4sQALJJvPneQ92U6ippvW
 RORfrjQBcRWkTE4nNZeJC+4WNAKXzUusp9nIdgdnbk4KYiKXB+QDq/GwiDEnoQi3BFr4
 QYg63M+qNGfzAj+VBLMQue2H/bMLi4MK58AIvbU4OzSCkxrl9TTkrvyug41EMthu3b0X
 n1YyLrAPMLdbgz21wmSfcD8oE5Y/zj56GJFrhTHIUy6w8m9ZCKq2XdwSqa1vvOXBkQbV
 Y9PP87MPLMFIKa+uZk0RaxDmI5SS2poKZonqYzzZS5oBHUkt7ZmqnEDohQ2WRqDTaKef
 movA==
X-Gm-Message-State: AC+VfDzOvqf7u7IYZQCEKiyD1KHuNWF0u5LJ5VugdFVURzGN8WN8976e
 /8svJWkrB/B+s1QGWPYKxPT0Bzd7HC4=
X-Google-Smtp-Source: ACHHUZ5tDsQRE5joHqQ26TB+UzFNw2k0+hPWY5eFAUhisyYyCd/yGIMjITkKe3p4A3SuFoK8uRLFtQ==
X-Received: by 2002:adf:e585:0:b0:307:8879:6cc1 with SMTP id
 l5-20020adfe585000000b0030788796cc1mr33160184wrm.71.1687864309194; 
 Tue, 27 Jun 2023 04:11:49 -0700 (PDT)
Received: from suse.localnet (host-79-12-109-185.retail.telecomitalia.it.
 [79.12.109.185]) by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm3479235wrx.59.2023.06.27.04.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 04:11:48 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, cluster-devel@redhat.com,
 Deepak R Varma <drv@mailo.com>
Date: Tue, 27 Jun 2023 13:11:46 +0200
Message-ID: <1905283.taCxCBeP46@suse>
In-Reply-To: <ZJiUKeVy7G6ZkX80@bu2204.myguest.virtualbox.org>
References: <ZJiUKeVy7G6ZkX80@bu2204.myguest.virtualbox.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 27 Jun 2023 11:18:02 +0000
Subject: Re: [Cluster-devel] [PATCH] gfs2: Replace deprecated kmap_atomic()
 by kmap_local_page()
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
Cc: Deepak R Varma <drv@mailo.com>, Ira Weiny <ira.weiny@intel.com>,
 linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On domenica 25 giugno 2023 21:23:21 CEST Deepak R Varma wrote:
> kmap_atomic() is deprecated in favor of kmap_local_{folio,page}().
> 
> Therefore, replace kmap_atomic() with kmap_local_folio() in
> gfs2_internal_read() and stuffed_readpage().
> 
> kmap_atomic() disables page-faults and preemption (the latter only for
> !PREEMPT_RT kernels), However, the code within the mapping/un-mapping in
> gfs2_internal_read() and stuffed_readpage() does not depend on the
> above-mentioned side effects.
> 
> Therefore, a mere replacement of the old API with the new one is all that
> is required (i.e., there is no need to explicitly add any calls to
> pagefault_disable() and/or preempt_disable()).
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
> Note: The Patch is build tested only. I will be happy to run recommended
> testing with some guidance if required.
> 
>  fs/gfs2/aops.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 3b41542d6697..7bd92054d353 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -432,10 +432,10 @@ static int stuffed_readpage(struct gfs2_inode *ip,
> struct page *page) if (error)
>  		return error;
> 
> -	kaddr = kmap_atomic(page);
> +	kaddr = kmap_local_page(page);
>  	memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
>  	memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
> -	kunmap_atomic(kaddr);
> +	kunmap_local(kaddr);
>  	flush_dcache_page(page);
>  	brelse(dibh);
>  	SetPageUptodate(page);
> @@ -498,12 +498,12 @@ int gfs2_internal_read(struct gfs2_inode *ip, char 
*buf,
> loff_t *pos, continue;
>  			return PTR_ERR(page);
>  		}
> -		p = kmap_atomic(page);
> +		p = kmap_local_page(page);
>  		amt = size - copied;
>  		if (offset + size > PAGE_SIZE)
>  			amt = PAGE_SIZE - offset;
>  		memcpy(buf + copied, p + offset, amt);

How about using memcpy_from_page()? 

Fabio

> -		kunmap_atomic(p);
> +		kunmap_local(p);
>  		put_page(page);
>  		copied += amt;
>  		index++;
> --
> 2.34.1




