Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E35B0623DA4
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Nov 2022 09:37:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668069453;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6V5hKKGu3v1+LAYo3Y1CZXcFGnq/6skCmrLZL7X5ZHA=;
	b=NckuN4PS1EsR0l1p6fbJVt/aqlojRsppcY9UJ9m38QED7Woi2P4kxSPmMehHGMeH8IlGNd
	mdVgCtMZ3xoNxfYJEDpBBJ/QVZzkt35ZWhqST3N4T26GszSPovIhaxA50f9hh5jEpBPAWq
	lUlKD9B8BhMvOW3pC1yu2rcewWNy8so=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-ZI4epml3OUC70YlIEc-v0w-1; Thu, 10 Nov 2022 03:37:30 -0500
X-MC-Unique: ZI4epml3OUC70YlIEc-v0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CCC59282381C;
	Thu, 10 Nov 2022 08:37:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C72A7140EBF3;
	Thu, 10 Nov 2022 08:37:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9DBAD19465B5;
	Thu, 10 Nov 2022 08:37:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 359AE1946597 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 10 Nov 2022 08:37:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EE9E0C1908D; Thu, 10 Nov 2022 08:37:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7326C1908A
 for <cluster-devel@redhat.com>; Thu, 10 Nov 2022 08:37:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC30F1C0897A
 for <cluster-devel@redhat.com>; Thu, 10 Nov 2022 08:37:26 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-435-TdDAm7_LPIenp20J2tcjpw-1; Thu,
 10 Nov 2022 03:37:18 -0500
X-MC-Unique: TdDAm7_LPIenp20J2tcjpw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BD46233921;
 Thu, 10 Nov 2022 08:37:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8AD121332F;
 Thu, 10 Nov 2022 08:37:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id T5UIITy4bGNERgAAMHmgww
 (envelope-from <vbabka@suse.cz>); Thu, 10 Nov 2022 08:37:16 +0000
Message-ID: <8e4080f8-7021-1c02-56cf-a105a5141abd@suse.cz>
Date: Thu, 10 Nov 2022 09:37:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: Alexander Aring <aahringo@redhat.com>
References: <20221011145413.8025-1-aahringo@redhat.com>
 <931c87d8-5856-e393-7108-66275ee4099a@suse.cz>
 <CAK-6q+ho0+mDP08yXvg7vupC-+GdUUY4zUHdfwU_7Q=B2VbQ-Q@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CAK-6q+ho0+mDP08yXvg7vupC-+GdUUY4zUHdfwU_7Q=B2VbQ-Q@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: cluster-devel@redhat.com, akpm@linux-foundation.org,
 roman.gushchin@linux.dev, linux-kernel@vger.kernel.org, penberg@kernel.org,
 linux-mm@kvack.org, rientjes@google.com, 42.hyeyoo@gmail.com, cl@linux.com,
 iamjoonsoo.kim@lge.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/22 13:59, Alexander Aring wrote:
> Hi,
> 
> On Fri, Oct 14, 2022 at 3:35 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>>
>> On 10/11/22 16:54, Alexander Aring wrote:
>> > This patch will add a comment for the __GFP_ZERO flag case for
>> > kmem_cache_alloc(). As the current comment mentioned that the flags only
>> > matters if the cache has no available objects it's different for the
>> > __GFP_ZERO flag which will ensure that the returned object is always
>> > zeroed in any case.
>> >
>> > I have the feeling I run into this question already two times if the
>> > user need to zero the object or not, but the user does not need to zero
>> > the object afterwards. However another use of __GFP_ZERO and only zero
>> > the object if the cache has no available objects would also make no
>> > sense.
>>
>> Hmm, but even with the update, the comment is still rather misleading, no?
>> - can the caller know if the cache has available objects and thus the flags
>> are irrelevant, in order to pass flags that are potentially wrong (if there
>> were no objects)? Not really.
> 
> No, the caller cannot know it and that's why __GFP_ZERO makes no sense
> if they matter only if the cache has no available objects.
> 
>> - even if cache has available objects, we'll always end up in
>> slab_pre_alloc_hook doing might_alloc(flags) which will trigger warnings
>> (given CONFIG_DEBUG_ATOMIC_SLEEP etc.) if the flags are inappropriate for
>> given context. So they are still "relevant"
>>
> 
> yes, so they are _always_ relevant in the current implementation. Also
> as you said the user doesn't know when they become relevant or not..
> 
>> So maybe just delete the whole comment? slub.c doesn't have it, and if any
>> such comment should exist for kmem_cache_alloc() and contain anything useful
>> and not misleading, it should be probably in include/linux/slab.h anyway?
>>
> 
> ctags brought me there, but this isn't a real argument why it should
> not be in the header file...
> 
> I am not sure about deleting the whole comment as people have an vague
> idea about how kmem_cache works and still need to know for __GFP_ZERO
> that it will always zero the memory, but thinking again somebody will
> make the conclusion it does not make sense as the user doesn't know
> when objects are reused or allocated. Having that in mind and reading
> the current comment was making me do more investigations into the
> internal behaviour to figure out how it works regarding __GFP_ZERO.

So, I did the following, which IMHO resolves the misleading parts and also
mentions __GFP_ZERO. Sounds OK?

https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/commit/?h=slab/for-6.2/cleanups&id=d6a3a7c3f65dfebcbc4872d5912d3465c8e8b051

