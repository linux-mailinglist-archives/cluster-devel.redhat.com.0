Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED28462453E
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Nov 2022 16:10:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668093039;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1aWxEK1TdYDii2f1EVjSrDIOIljR4IPqsIREqMrNiKk=;
	b=KViIW2VpDvlQ6mxpmbPjG0nc99P0ASvBgC4AYrYzlZGmI0s1tsSLaWdD9kWDczLoHU/C9j
	RzPVtdzgU25mTQ2OvWLqSkzccOnZkyI60YoxDftUX2JJvVzo4xdGOcdxdztrXUEJRZ0Kva
	nf8FLKLBHcIDNY9SHOihldtkMrXVCkM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-BbOzbbgJPgCDVjF4MtbKWA-1; Thu, 10 Nov 2022 10:10:36 -0500
X-MC-Unique: BbOzbbgJPgCDVjF4MtbKWA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE8441C05AF0;
	Thu, 10 Nov 2022 15:10:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 195E61415123;
	Thu, 10 Nov 2022 15:10:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 77209194658D;
	Thu, 10 Nov 2022 15:10:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E65691946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 10 Nov 2022 15:10:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CAC1540C83DF; Thu, 10 Nov 2022 15:10:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3B9B40C83DD
 for <cluster-devel@redhat.com>; Thu, 10 Nov 2022 15:10:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7DD31C05AEF
 for <cluster-devel@redhat.com>; Thu, 10 Nov 2022 15:10:30 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-lw7gHbA0MWm3O_xNytUZcg-1; Thu, 10 Nov 2022 10:10:29 -0500
X-MC-Unique: lw7gHbA0MWm3O_xNytUZcg-1
Received: by mail-ej1-f70.google.com with SMTP id
 hq18-20020a1709073f1200b007ade8dd3494so1391116ejc.2
 for <cluster-devel@redhat.com>; Thu, 10 Nov 2022 07:10:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1aWxEK1TdYDii2f1EVjSrDIOIljR4IPqsIREqMrNiKk=;
 b=3CGceM1sueM8Ug6U/ad7wXWApY0CT8N4GxWZ/p6VINjrom0VpBkF8GI7fjG+L8i1UH
 2MR3AmrmBm2zsuOB0ynEzcu5wWcFXll6AjEny/0BKzhD6ltfC4jEvG83sINa95m9CFAe
 E+IVgrTdho7rzczKVKqrnOCqYcxf51sThMZPH4mUt2rWlAvGbdS0rSGM3cUh9+3unjZh
 STrI/gXi6tnm7yRdAeNtyAMiWp6JGGZlYrQZcXAwksvyd79FvcDm7rBXQOTuGQ45ekPb
 unmXlev1QYEw+TmwjvhvrlJXiYn+SYx12tbVRPO6nT9vlp7ORoyEYNlF1AfcyVOKkBXX
 p5Gg==
X-Gm-Message-State: ACrzQf0xdb3tL2TA4l3LsoPFxBAePVIZT2Kd1p5ut7VMoDG8Ybjw0vMs
 zhde6k7zW9GVi2k8loWR9WQapiWthHG8z8DTicldXZq24vMXrP4XzdCzWAD0H2nEgpspYLr7zkb
 IOaypKk8exsLzpCASBF1eA4LPnPCUQiJk5f9vnA==
X-Received: by 2002:a17:906:81c6:b0:7ae:7b1:df60 with SMTP id
 e6-20020a17090681c600b007ae07b1df60mr38174210ejx.87.1668093028292; 
 Thu, 10 Nov 2022 07:10:28 -0800 (PST)
X-Google-Smtp-Source: AMsMyM4XIaD23sHXbkgMz7JfNrC7DMaIxwyr/fbLQzR3FHOgbk5q60dF3e5AlG4GQ109n4AGNYSFAdCCMjjp17Z2dmE=
X-Received: by 2002:a17:906:81c6:b0:7ae:7b1:df60 with SMTP id
 e6-20020a17090681c600b007ae07b1df60mr38174207ejx.87.1668093028133; Thu, 10
 Nov 2022 07:10:28 -0800 (PST)
MIME-Version: 1.0
References: <20221011145413.8025-1-aahringo@redhat.com>
 <931c87d8-5856-e393-7108-66275ee4099a@suse.cz>
 <CAK-6q+ho0+mDP08yXvg7vupC-+GdUUY4zUHdfwU_7Q=B2VbQ-Q@mail.gmail.com>
 <8e4080f8-7021-1c02-56cf-a105a5141abd@suse.cz>
In-Reply-To: <8e4080f8-7021-1c02-56cf-a105a5141abd@suse.cz>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 10 Nov 2022 10:10:16 -0500
Message-ID: <CAK-6q+jLQakekjTEQrzbmjKa6QnQDTziHjAg749qw=0ufmrFdQ@mail.gmail.com>
To: Vlastimil Babka <vbabka@suse.cz>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Nov 10, 2022 at 3:37 AM Vlastimil Babka <vbabka@suse.cz> wrote:
...
>
> So, I did the following, which IMHO resolves the misleading parts and also
> mentions __GFP_ZERO. Sounds OK?
>
> https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/commit/?h=slab/for-6.2/cleanups&id=d6a3a7c3f65dfebcbc4872d5912d3465c8e8b051
>

perfect, thanks!

- Alex

