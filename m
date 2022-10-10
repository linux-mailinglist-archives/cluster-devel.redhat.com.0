Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D969C5F973C
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Oct 2022 05:48:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665373702;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=BHae+p8OlAHp+V5lhftHxU9vRo8UGtSzWUWZi2uZEnk=;
	b=PoX16Kc28nv4NFSozl+ggjCfaTgPaORiHhA2UdL9L2/6k1QSm2T1R1bdsYSw27lYOGgtoN
	eZXfR8kvwQpuGMvpv1fwqubxWTb3bEapDHUyN0rBhy476fqUlFego6ne7TqoelpXj02xw9
	D+PcjxvmYbC1wSLiH64oF1DtQtcCGcY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-D7yEXUGNNb-8DmRfVTHqhg-1; Sun, 09 Oct 2022 23:48:17 -0400
X-MC-Unique: D7yEXUGNNb-8DmRfVTHqhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F85F1C05154;
	Mon, 10 Oct 2022 03:48:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D0192166B29;
	Mon, 10 Oct 2022 03:48:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 55B6919465A3;
	Mon, 10 Oct 2022 03:48:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 044351946595 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 10 Oct 2022 03:48:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C0D5CC5092B; Mon, 10 Oct 2022 03:48:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B986CC50929
 for <cluster-devel@redhat.com>; Mon, 10 Oct 2022 03:48:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99226185A7A4
 for <cluster-devel@redhat.com>; Mon, 10 Oct 2022 03:48:13 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-365-qGM_IuHsPqCrvO12GZjlWg-1; Sun, 09 Oct 2022 23:48:11 -0400
X-MC-Unique: qGM_IuHsPqCrvO12GZjlWg-1
Received: by mail-pj1-f43.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so9277500pjo.4
 for <cluster-devel@redhat.com>; Sun, 09 Oct 2022 20:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BHae+p8OlAHp+V5lhftHxU9vRo8UGtSzWUWZi2uZEnk=;
 b=PzPMLlzOiY25NQbPNDf5RB2vS+u158YE40vrYvkhWP6lFjfOhWkh6EXY28nXI1K+R+
 cBKa0OCIxD0Wbowe229JM7aSE1p+s0oCKbQbbn+g3lh/V5rEZkOj6G8NfoF5MdsHz2wU
 ZHOxxkt2f2sUDcyc26BG5RV1CC/ZlvA4/yRrMOlGEa/0iSbbr1JAxF7Q/fm+oS8vSWV1
 hnWdIQUN0BB2QDY05Z9O58CTMQQel5i4w3W075+C4bc+NEVK5/CUgYWFJAD1GjZFlm6q
 pjOQD4EJPoXkp0dbZTxCaYXdg9WbDkLAlVGXu12xxqizgs4rVbTDFFi7GHzi6hks4b0Y
 L5bA==
X-Gm-Message-State: ACrzQf0LV7z8OzZzORmkHpdDULbsTnVFyVvGz5XcSOyLE224rtKKR0Bk
 4asq9BoVFE4RDLbaTwBQ9y1gtA==
X-Google-Smtp-Source: AMsMyM4MXwciU8DYG7uPa2SAOYMKJ8KEgCki82/BHRPDAigNEfSbvZ116To5uehaJ23f51x2THoeFQ==
X-Received: by 2002:a17:903:1205:b0:178:ac4e:70b8 with SMTP id
 l5-20020a170903120500b00178ac4e70b8mr16920946plh.52.1665373690619; 
 Sun, 09 Oct 2022 20:48:10 -0700 (PDT)
Received: from [2620:15c:29:203:5c2c:f18c:2a4e:44d2]
 ([2620:15c:29:203:5c2c:f18c:2a4e:44d2])
 by smtp.gmail.com with ESMTPSA id
 65-20020a630244000000b0045913a96837sm5293845pgc.24.2022.10.09.20.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 20:48:09 -0700 (PDT)
Date: Sun, 9 Oct 2022 20:48:08 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Alexander Aring <aahringo@redhat.com>
In-Reply-To: <20221008020312.1932347-1-aahringo@redhat.com>
Message-ID: <fe5780fe-7d52-53e1-4572-38112c4f69e8@google.com>
References: <20221008020312.1932347-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
 linux-mm@kvack.org, 42.hyeyoo@gmail.com, cl@linux.com, iamjoonsoo.kim@lge.com,
 vbabka@suse.cz
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Oct 2022, Alexander Aring wrote:

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

Minor nit: it's probably better to do "... has no available objects, 
except flag ..." and not seperate sentences.  After that is done, feel 
free to add

	Acked-by: David Rientjes <rientjes@google.com>

