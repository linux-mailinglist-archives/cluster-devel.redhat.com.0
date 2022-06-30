Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E333656206A
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Jun 2022 18:38:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656607086;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=IcWzBGmd5zZp0WxQBYsneB6E8zWmcy5CxnK6uyIIvQI=;
	b=VPeNUbgHd6a/iYr21e/F3y8oH07iSaitcffAsTsSew199LaVZiKV2YKCv/llwMyvZ+rLRD
	qHYdAcvqbreYPXFY13z/3puxgzD335vaX5c6VP4wd8izWlxaOIQQ25KchtdwmNYXAhWlym
	B/upm1X4hSn4c52R0mYdAMKyKubQkFw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-Dca24QVzMj6ihvpElzf9Pg-1; Thu, 30 Jun 2022 12:38:00 -0400
X-MC-Unique: Dca24QVzMj6ihvpElzf9Pg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0DBD802D1C;
	Thu, 30 Jun 2022 16:37:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C9772112131B;
	Thu, 30 Jun 2022 16:37:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 34D521947064;
	Thu, 30 Jun 2022 16:37:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4193C1947058 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Jun 2022 16:37:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 206AF1410F3B; Thu, 30 Jun 2022 16:37:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C1D41410DD8
 for <cluster-devel@redhat.com>; Thu, 30 Jun 2022 16:37:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 02F811C0CE6E
 for <cluster-devel@redhat.com>; Thu, 30 Jun 2022 16:37:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335--kQ1LAMRPBCqQvKWKpe1AQ-1; Thu, 30 Jun 2022 12:37:56 -0400
X-MC-Unique: -kQ1LAMRPBCqQvKWKpe1AQ-1
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1o6wKA-00FI8t-RT; Thu, 30 Jun 2022 15:43:31 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 435FB30027E;
 Thu, 30 Jun 2022 17:43:20 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 21DCD285D6B9E; Thu, 30 Jun 2022 17:43:20 +0200 (CEST)
Date: Thu, 30 Jun 2022 17:43:20 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <Yr3EmEcO1AMFRlLA@hirez.programming.kicks-ass.net>
References: <20220630135934.1799248-1-aahringo@redhat.com>
 <20220630135934.1799248-2-aahringo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220630135934.1799248-2-aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [RFC 1/2] refcount: add __cond_lock() for
 conditional lock refcount API
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
Cc: mark.rutland@arm.com, torvalds@linux-foundation.org, boqun.feng@gmail.com,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 linux-sparse@vger.kernel.org, thunder.leizhen@huawei.com,
 jacob.e.keller@intel.com, akpm@linux-foundation.org, will@kernel.org,
 luc.vanoostenryck@gmail.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 30, 2022 at 09:59:33AM -0400, Alexander Aring wrote:
> This patch adds the __cond_lock() macro to refcounts conditional lock
> API. Currently sparse cannot detect the conditional lock handling of
> refcount_dec_and_lock() functionality and prints a context imbalance
> warning like:
> 
> warning: context imbalance in 'put_rsb' - unexpected unlock
> 
> with this patch and having the refcount_dec_and_lock() functionality
> inside the if condition to decide whenever doing unlock or not the
> warning disappears.
> 
> The patch follows a similar naming scheme like raw_spin_trylock() by
> adding a "raw_" prefix to refcount_dec_and_lock() functionality and
> introduce a macro for the replaced functions that uses __cond_lock()
> to signal that an acquire depends on the return value of the passed
> function.
> 
> A cast to bool seems to be necessary because __cond_lock() does return a
> non-boolean scalar type.

I hate the __cond_lock() think with a passions. Please just fix sparse
to not suck.

