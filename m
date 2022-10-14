Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 665375FEDB5
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Oct 2022 13:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665748789;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=uu1ydqkQUNoqd4AjsuOOEhP4tSswrWwn//sbux1y4Xk=;
	b=hgQjM38gph1cOxzUcb0NnOnWqpbFUoOU2L53ruhziPl2pt5ZcQO4N3kqd4UWckuVZ5u5Rr
	PX/6174lfxVIgJTh10e0y2gPC52NQtehMHwuZeyJiVgXghMx1u8gouUg1tIlF+SQk4jCme
	sPfXGP2XSLV3c04MaeJ/8ClXHFR8mlU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-NHyIISkUOm-23eg5vLgnvw-1; Fri, 14 Oct 2022 07:59:46 -0400
X-MC-Unique: NHyIISkUOm-23eg5vLgnvw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 626AA86EB21;
	Fri, 14 Oct 2022 11:59:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A49F7C15BBD;
	Fri, 14 Oct 2022 11:59:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 60A471946594;
	Fri, 14 Oct 2022 11:59:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3686D1946588 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 14 Oct 2022 11:59:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1288D154D8A9; Fri, 14 Oct 2022 11:59:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AA3B154D8AA
 for <cluster-devel@redhat.com>; Fri, 14 Oct 2022 11:59:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E225B806023
 for <cluster-devel@redhat.com>; Fri, 14 Oct 2022 11:59:41 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-210-uA_D76baOZqG0ow7SR5Oyg-1; Fri, 14 Oct 2022 07:59:38 -0400
X-MC-Unique: uA_D76baOZqG0ow7SR5Oyg-1
Received: by mail-wr1-f71.google.com with SMTP id
 h4-20020adfa4c4000000b0022ec3966c3aso1868570wrb.6
 for <cluster-devel@redhat.com>; Fri, 14 Oct 2022 04:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uu1ydqkQUNoqd4AjsuOOEhP4tSswrWwn//sbux1y4Xk=;
 b=fG6Mq8OCNmn6HgI9p/j4ATvBbUb8eDpRgKCPc2cLZa1NioMq+FQqoo+wL/LY5I8NH9
 cNntRl6+VrDiGe5I7Fwq6gkFXcgy9ZZJ9do3MBz7XGykZzqgzZyPi1mu1zAacCO+ByCH
 R7oUcRpEFNWttTKjpXIf+pvh9y01a/oI2GHuL52tHRnx+OL3Ffuunq19UHa/4GIIqPHW
 xHhu5se3uBhy1s5FOrTNurR5FKEo78IvGprXheafTQEeZkNCW9DXlxLlw6uX4Q1lx9OT
 L2tewBTC4RK4xpej3Cw8HNa+UuzvOBVrlfbhUFPTWwbaLLXDtH1f6iC0IMiZxsh+nTYy
 NEUg==
X-Gm-Message-State: ACrzQf2vjl+6W7Eaki4og0NRHe9ugYBQVqdsXFkdm7KxOkySF99admFJ
 Zt3PC0Cf0HGD+tVl4FTtzB91U/akPv6gf0NVwm2ADs5lssWD5lj5quRThoB6ymJGvOQHRD6/Aq6
 6zF2h3Xmm42/41hceSksdp16xOu7W70twQB4AIg==
X-Received: by 2002:a05:600c:4ed4:b0:3c6:e26d:7f5a with SMTP id
 g20-20020a05600c4ed400b003c6e26d7f5amr3341347wmq.166.1665748777641; 
 Fri, 14 Oct 2022 04:59:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6VkcidPD00XeVGxo5EzU5OXFuhrDWzkM7DNfR1RdP3sRMB84zjVhzTUKaBFpDIM1DX4DqrnNs9nm9FHqWn4BU=
X-Received: by 2002:a05:600c:4ed4:b0:3c6:e26d:7f5a with SMTP id
 g20-20020a05600c4ed400b003c6e26d7f5amr3341338wmq.166.1665748777466; Fri, 14
 Oct 2022 04:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221011145413.8025-1-aahringo@redhat.com>
 <931c87d8-5856-e393-7108-66275ee4099a@suse.cz>
In-Reply-To: <931c87d8-5856-e393-7108-66275ee4099a@suse.cz>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 14 Oct 2022 07:59:26 -0400
Message-ID: <CAK-6q+ho0+mDP08yXvg7vupC-+GdUUY4zUHdfwU_7Q=B2VbQ-Q@mail.gmail.com>
To: Vlastimil Babka <vbabka@suse.cz>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Oct 14, 2022 at 3:35 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>
> On 10/11/22 16:54, Alexander Aring wrote:
> > This patch will add a comment for the __GFP_ZERO flag case for
> > kmem_cache_alloc(). As the current comment mentioned that the flags only
> > matters if the cache has no available objects it's different for the
> > __GFP_ZERO flag which will ensure that the returned object is always
> > zeroed in any case.
> >
> > I have the feeling I run into this question already two times if the
> > user need to zero the object or not, but the user does not need to zero
> > the object afterwards. However another use of __GFP_ZERO and only zero
> > the object if the cache has no available objects would also make no
> > sense.
>
> Hmm, but even with the update, the comment is still rather misleading, no?
> - can the caller know if the cache has available objects and thus the flags
> are irrelevant, in order to pass flags that are potentially wrong (if there
> were no objects)? Not really.

No, the caller cannot know it and that's why __GFP_ZERO makes no sense
if they matter only if the cache has no available objects.

> - even if cache has available objects, we'll always end up in
> slab_pre_alloc_hook doing might_alloc(flags) which will trigger warnings
> (given CONFIG_DEBUG_ATOMIC_SLEEP etc.) if the flags are inappropriate for
> given context. So they are still "relevant"
>

yes, so they are _always_ relevant in the current implementation. Also
as you said the user doesn't know when they become relevant or not..

> So maybe just delete the whole comment? slub.c doesn't have it, and if any
> such comment should exist for kmem_cache_alloc() and contain anything useful
> and not misleading, it should be probably in include/linux/slab.h anyway?
>

ctags brought me there, but this isn't a real argument why it should
not be in the header file...

I am not sure about deleting the whole comment as people have an vague
idea about how kmem_cache works and still need to know for __GFP_ZERO
that it will always zero the memory, but thinking again somebody will
make the conclusion it does not make sense as the user doesn't know
when objects are reused or allocated. Having that in mind and reading
the current comment was making me do more investigations into the
internal behaviour to figure out how it works regarding __GFP_ZERO.

- Alex

