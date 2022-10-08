Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 646125F9C48
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Oct 2022 11:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665395690;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=knSy7HMcW9hIxtzP/QHqpkjPX5uvUVeEAsZZrCBYftM=;
	b=LsnM89mYcTRVe75aYcq4d7/dILJoiTCet5aszO7i3nyxWh/ih7+gn9zhDR1vZOJE/EzbKq
	k6RXApgLblfECajEWSGg4hPf8qtzf9VWH0yA5DyKtRJ3lIzj668GwRUwfec/zn9saVveeX
	FUdd14szJv0tXw3vgaTgZfBpxJVQh4Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-09izkbvxMr2Y1YWD9W2uVA-1; Mon, 10 Oct 2022 05:54:41 -0400
X-MC-Unique: 09izkbvxMr2Y1YWD9W2uVA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAA4E101E153;
	Mon, 10 Oct 2022 09:54:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5680649BB63;
	Mon, 10 Oct 2022 09:54:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 180C31946A4C;
	Mon, 10 Oct 2022 09:54:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8E4C11946A49 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  8 Oct 2022 04:38:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 44727AB5AB; Sat,  8 Oct 2022 04:38:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CE7CAB5AA
 for <cluster-devel@redhat.com>; Sat,  8 Oct 2022 04:38:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D5E83C0ED4E
 for <cluster-devel@redhat.com>; Sat,  8 Oct 2022 04:38:59 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-aGj7aeGnPtCpEr72lItuVQ-1; Sat, 08 Oct 2022 00:38:55 -0400
X-MC-Unique: aGj7aeGnPtCpEr72lItuVQ-1
Received: by mail-pg1-f176.google.com with SMTP id 2so6249290pgl.7;
 Fri, 07 Oct 2022 21:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=knSy7HMcW9hIxtzP/QHqpkjPX5uvUVeEAsZZrCBYftM=;
 b=f1ifLB4gDmQHEGa4j41/V4RBBt6v9JFtnRlMeLRQ21FlUUg9ToUxjFAVZcirBGzt2c
 Vzhogub8OmF9LTVwAnHsFrcDNHQhcAZ6JlEq4ZY1Qa6zuZAJLSFXzE+JS43wSiac4x5O
 GSVL6ZHsflP40qPlyfzOY7PcBM0A92cqxy6rr77jRDdKped5zTkcCxTL0ionoMfrqU3G
 TGGrHaOvWkL/IrUOIwBJzBPYMJGFsJ57GENsrqbtrEvmkz6/1q7LAv/bCWaLaVrQayxM
 jnINS4z/zsfEArVaEtpxzheaKJHhFxXxgT+39Ljar7O+h3KIk2WssOTmFF301rjSggy/
 q3og==
X-Gm-Message-State: ACrzQf0XX+bDZkV/PwdKrEh4TJrcxPSc/brF7rgKu4ILVxRX+oCSMg1h
 cuVDPggp7F4uAHyo/esIDQXoFbIJXZv1Q8dY
X-Google-Smtp-Source: AMsMyM6dMrfJHPQGVen9cJacv4Rm9dU1784g4PuV2+RhUSXl9rTsm4n+ngPuL7ehdjL14Joz/JkaYw==
X-Received: by 2002:a63:4507:0:b0:43c:9cf4:f1d6 with SMTP id
 s7-20020a634507000000b0043c9cf4f1d6mr7674900pga.316.1665203933858; 
 Fri, 07 Oct 2022 21:38:53 -0700 (PDT)
Received: from hyeyoo ([114.29.91.56]) by smtp.gmail.com with ESMTPSA id
 u13-20020a170903124d00b0017f80305239sm2348032plh.136.2022.10.07.21.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 21:38:52 -0700 (PDT)
Date: Sat, 8 Oct 2022 13:38:47 +0900
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <Y0D+1wAMu6HhPmBG@hyeyoo>
References: <20221008020312.1932347-1-aahringo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221008020312.1932347-1-aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Mon, 10 Oct 2022 09:54:37 +0000
Subject: Re: [Cluster-devel] [PATCH] mm: slab: comment __GFP_ZERO case for
 kmem_cache_alloc
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
Cc: cluster-devel@redhat.com, akpm@linux-foundation.org,
 roman.gushchin@linux.dev, linux-kernel@vger.kernel.org, penberg@kernel.org,
 linux-mm@kvack.org, rientjes@google.com, cl@linux.com, iamjoonsoo.kim@lge.com,
 vbabka@suse.cz
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 07, 2022 at 10:03:12PM -0400, Alexander Aring wrote:
> This patch will add a comment for the __GFP_ZERO flag case for
> kmem_cache_alloc(). As the current comment mentioned that the flags only
> matters if the cache has no available objects it's different for the
> __GFP_ZERO flag which will ensure that the returned object is always
> zeroed in any case.
> 
> I have the feeling I run into this question already two times if the
> user need to zero the object or not, but the user does not need to zero
> the object afterwards. However another use of __GFP_ZERO and only zero
> the object if the cache has no available objects would also make no
> sense.
> 
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  mm/slab.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/slab.c b/mm/slab.c
> index 10e96137b44f..7a84c2aae85a 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -3482,7 +3482,8 @@ void *__kmem_cache_alloc_lru(struct kmem_cache *cachep, struct list_lru *lru,
>   * @flags: See kmalloc().
>   *
>   * Allocate an object from this cache.  The flags are only relevant
> - * if the cache has no available objects.
> + * if the cache has no available objects. Except flag __GFP_ZERO which
> + * will zero the returned object.
>   *
>   * Return: pointer to the new object or %NULL in case of error
>   */
> -- 
> 2.31.1
> 

Acked-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>

Thanks!

-- 
Thanks,
Hyeonggon

