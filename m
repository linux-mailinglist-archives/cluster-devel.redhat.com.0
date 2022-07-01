Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 056C4562EC1
	for <lists+cluster-devel@lfdr.de>; Fri,  1 Jul 2022 10:48:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656665321;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mY2YJsRE/yBS43tn1f7s0RHEEaTIk2g/RfTS1WyV6ug=;
	b=csjDByWIPprT+B8hNDDZGuVsmH+16KXO7jSE8bdOFyYUz7j06JfNKVCkJi2k8RE9+rDsA2
	ipsrPww3V77gKEkRGYk6CWew0N0gIC0l4VRETvu8Po2Dcz8KQWPXKOO9f/4k1AIYfa/8n6
	vibg5dKUFagngZPRjlrRwgvgjMBVPKk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-SIqyBXOFMyyr4Gb9roXUkg-1; Fri, 01 Jul 2022 04:48:36 -0400
X-MC-Unique: SIqyBXOFMyyr4Gb9roXUkg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 481F929DD9B8;
	Fri,  1 Jul 2022 08:48:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7581A40336E;
	Fri,  1 Jul 2022 08:48:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E035A1947074;
	Fri,  1 Jul 2022 08:48:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AF4DE1947058 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  1 Jul 2022 08:48:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9DCF3C08087; Fri,  1 Jul 2022 08:48:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 995DEC28115
 for <cluster-devel@redhat.com>; Fri,  1 Jul 2022 08:48:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 802A7299E768
 for <cluster-devel@redhat.com>; Fri,  1 Jul 2022 08:48:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-Wou6tUrDPGGzhbCctjuUXg-1; Fri, 01 Jul 2022 04:48:30 -0400
X-MC-Unique: Wou6tUrDPGGzhbCctjuUXg-1
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o7CJb-00FdrR-AC; Fri, 01 Jul 2022 08:47:52 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 63D90980017; Fri,  1 Jul 2022 10:47:49 +0200 (CEST)
Date: Fri, 1 Jul 2022 10:47:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Yr60tWxN4P568x3W@worktop.programming.kicks-ass.net>
References: <20220630135934.1799248-1-aahringo@redhat.com>
 <CAHk-=wjZfO9hGqJ2_hGQG3U_XzSh9_XaXze=HgPdvJbgrvASfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjZfO9hGqJ2_hGQG3U_XzSh9_XaXze=HgPdvJbgrvASfA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [RFC 0/2] refcount: attempt to avoid imbalance
 warnings
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
Cc: Mark Rutland <mark.rutland@arm.com>, Boqun Feng <boqun.feng@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 cluster-devel <cluster-devel@redhat.com>,
 Sparse Mailing-list <linux-sparse@vger.kernel.org>, thunder.leizhen@huawei.com,
 jacob.e.keller@intel.com, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 30, 2022 at 09:34:10AM -0700, Linus Torvalds wrote:

Not commenting on sparse, since I'm not much qualified there, however,

>  include/linux/compiler_types.h | 2 ++
>  include/linux/refcount.h       | 6 +++---
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
> index d08dfcb0ac68..4f2a819fd60a 100644
> --- a/include/linux/compiler_types.h
> +++ b/include/linux/compiler_types.h
> @@ -24,6 +24,7 @@ static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
>  /* context/locking */
>  # define __must_hold(x)	__attribute__((context(x,1,1)))
>  # define __acquires(x)	__attribute__((context(x,0,1)))
> +# define __cond_acquires(x) __attribute__((context(x,0,-1)))
>  # define __releases(x)	__attribute__((context(x,1,0)))
>  # define __acquire(x)	__context__(x,1)
>  # define __release(x)	__context__(x,-1)
> @@ -50,6 +51,7 @@ static inline void __chk_io_ptr(const volatile void __iomem *ptr) { }
>  /* context/locking */
>  # define __must_hold(x)
>  # define __acquires(x)
> +# define __cond_acquires(x)
>  # define __releases(x)
>  # define __acquire(x)	(void)0
>  # define __release(x)	(void)0
> diff --git a/include/linux/refcount.h b/include/linux/refcount.h
> index b8a6e387f8f9..a62fcca97486 100644
> --- a/include/linux/refcount.h
> +++ b/include/linux/refcount.h
> @@ -361,9 +361,9 @@ static inline void refcount_dec(refcount_t *r)
>  
>  extern __must_check bool refcount_dec_if_one(refcount_t *r);
>  extern __must_check bool refcount_dec_not_one(refcount_t *r);
> -extern __must_check bool refcount_dec_and_mutex_lock(refcount_t *r, struct mutex *lock);
> -extern __must_check bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock);
> +extern __must_check bool refcount_dec_and_mutex_lock(refcount_t *r, struct mutex *lock) __cond_acquires(lock);
> +extern __must_check bool refcount_dec_and_lock(refcount_t *r, spinlock_t *lock) __cond_acquires(lock);
>  extern __must_check bool refcount_dec_and_lock_irqsave(refcount_t *r,
>  						       spinlock_t *lock,
> -						       unsigned long *flags);
> +						       unsigned long *flags) __cond_acquires(lock);
>  #endif /* _LINUX_REFCOUNT_H */


YES!, thank you!

