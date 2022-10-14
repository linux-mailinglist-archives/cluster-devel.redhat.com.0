Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BC65FE9C8
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Oct 2022 09:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665733492;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IjAKlOIc9+kUV/2uFXOWSjipZ0QlJBcD+i3sVbc0+lY=;
	b=GAUoko+Bsul9jDECVCOq6kJLfIIocy8PaPqcYyMxmUQ8hEWU90vs+IbYCTHhjE7nXRPQ3m
	FpDY2ikUNzXvN6Fomz2dLJScsIALPuv+7wlaQ4uXuVC0cUFU43OdHBDKfBTQ0HOhZWjZFl
	GLzBYjQDZB41yQDQ3bFMThA9lfRzKBU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-tq7Yvye-N-2NxDm3VUAUiA-1; Fri, 14 Oct 2022 03:44:49 -0400
X-MC-Unique: tq7Yvye-N-2NxDm3VUAUiA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CB40185A792;
	Fri, 14 Oct 2022 07:44:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9CD2A101B542;
	Fri, 14 Oct 2022 07:44:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D584B194658F;
	Fri, 14 Oct 2022 07:44:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 871CD1946587 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 14 Oct 2022 07:44:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 327E44EA52; Fri, 14 Oct 2022 07:44:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A9624EA4A
 for <cluster-devel@redhat.com>; Fri, 14 Oct 2022 07:44:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A80F8027EB
 for <cluster-devel@redhat.com>; Fri, 14 Oct 2022 07:44:41 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-323-g_URH-lrNq-uaQYH1LFYIg-1; Fri,
 14 Oct 2022 03:44:36 -0400
X-MC-Unique: g_URH-lrNq-uaQYH1LFYIg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3B4BB1F74A;
 Fri, 14 Oct 2022 07:35:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13A1A13A4A;
 Fri, 14 Oct 2022 07:35:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3jMPBDURSWPXXQAAMHmgww
 (envelope-from <vbabka@suse.cz>); Fri, 14 Oct 2022 07:35:17 +0000
Message-ID: <931c87d8-5856-e393-7108-66275ee4099a@suse.cz>
Date: Fri, 14 Oct 2022 09:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: Alexander Aring <aahringo@redhat.com>, cl@linux.com
References: <20221011145413.8025-1-aahringo@redhat.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <20221011145413.8025-1-aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCHv2] mm: slab: comment __GFP_ZERO case for
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
Cc: cluster-devel@redhat.com, roman.gushchin@linux.dev,
 linux-kernel@vger.kernel.org, penberg@kernel.org, linux-mm@kvack.org,
 rientjes@google.com, 42.hyeyoo@gmail.com, iamjoonsoo.kim@lge.com,
 akpm@linux-foundation.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/11/22 16:54, Alexander Aring wrote:
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

Hmm, but even with the update, the comment is still rather misleading, no?
- can the caller know if the cache has available objects and thus the flags
are irrelevant, in order to pass flags that are potentially wrong (if there
were no objects)? Not really.
- even if cache has available objects, we'll always end up in
slab_pre_alloc_hook doing might_alloc(flags) which will trigger warnings
(given CONFIG_DEBUG_ATOMIC_SLEEP etc.) if the flags are inappropriate for
given context. So they are still "relevant"

So maybe just delete the whole comment? slub.c doesn't have it, and if any
such comment should exist for kmem_cache_alloc() and contain anything useful
and not misleading, it should be probably in include/linux/slab.h anyway?

> Acked-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> Acked-by: David Rientjes <rientjes@google.com>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
> changes since v2:
>  - don't make a separate sentence for except
> 
>  mm/slab.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/slab.c b/mm/slab.c
> index 10e96137b44f..a86879f42f2e 100644
> --- a/mm/slab.c
> +++ b/mm/slab.c
> @@ -3482,7 +3482,8 @@ void *__kmem_cache_alloc_lru(struct kmem_cache *cachep, struct list_lru *lru,
>   * @flags: See kmalloc().
>   *
>   * Allocate an object from this cache.  The flags are only relevant
> - * if the cache has no available objects.
> + * if the cache has no available objects, except flag __GFP_ZERO which
> + * will zero the returned object.
>   *
>   * Return: pointer to the new object or %NULL in case of error
>   */

