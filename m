Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 668445E882F
	for <lists+cluster-devel@lfdr.de>; Sat, 24 Sep 2022 06:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663992733;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=+6X8qWAAUNJQsAsCzoLT3otcxgFqrHWMEMkbJDjCmn4=;
	b=NnL4ZeWUgF1RIbaGuTvc8a5/QXQS3p22nXXuI2dYRUQ1oyKqmlhGWW8ASNFLpyBurWU0HV
	Q/E/XYb3Bo9p92AmGO5VS6x4OKLGyZQJGbrce2I9s6E8CL2u+syKoDhAtLRzyOcyMmF7Iq
	/LatJ+7UyrrTELBqKBhfJlGyysbQ89E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-woK8JVtSMYST5yrWPquamg-1; Sat, 24 Sep 2022 00:12:10 -0400
X-MC-Unique: woK8JVtSMYST5yrWPquamg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CC7E101A5BB;
	Sat, 24 Sep 2022 04:12:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 643B37AE5;
	Sat, 24 Sep 2022 04:12:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2DA9119465B9;
	Sat, 24 Sep 2022 04:12:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C978E19465A4 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 24 Sep 2022 04:12:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B902517585; Sat, 24 Sep 2022 04:12:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B1E507AE5
 for <cluster-devel@redhat.com>; Sat, 24 Sep 2022 04:12:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90C9D101A528
 for <cluster-devel@redhat.com>; Sat, 24 Sep 2022 04:12:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-soA1P3KUMjCsJ1uZS-ilNg-1; Sat, 24 Sep 2022 00:12:05 -0400
X-MC-Unique: soA1P3KUMjCsJ1uZS-ilNg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D6FC6091B;
 Sat, 24 Sep 2022 04:04:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05415C433D6;
 Sat, 24 Sep 2022 04:04:03 +0000 (UTC)
Date: Fri, 23 Sep 2022 23:03:59 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <Yy6Br5dUir4pfcvv@work>
References: <20220924035226.3359297-1-keescook@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20220924035226.3359297-1-keescook@chromium.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH] dlm: Split memcpy() of struct
 dlm_message flexible array
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 23, 2022 at 08:52:26PM -0700, Kees Cook wrote:
> To work around a misbehavior of the compiler's ability to see into
> composite flexible array structs (as detailed in the coming memcpy()
> hardening series[1]), split the memcpy() of the header and the payload
> so no false positive run-time overflow warning will be generated.
> 
> [1] https://lore.kernel.org/linux-hardening/20220901065914.1417829-2-keescook@chromium.org/
> 
> Cc: Christine Caulfield <ccaulfie@redhat.com>
> Cc: David Teigland <teigland@redhat.com>
> Cc: cluster-devel@redhat.com
> Reported-by: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

> ---
>  fs/dlm/requestqueue.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/dlm/requestqueue.c b/fs/dlm/requestqueue.c
> index 036a9a0078f6..63f45c3c53a2 100644
> --- a/fs/dlm/requestqueue.c
> +++ b/fs/dlm/requestqueue.c
> @@ -44,7 +44,8 @@ void dlm_add_requestqueue(struct dlm_ls *ls, int nodeid, struct dlm_message *ms)
>  
>  	e->recover_seq = ls->ls_recover_seq & 0xFFFFFFFF;
>  	e->nodeid = nodeid;
> -	memcpy(&e->request, ms, le16_to_cpu(ms->m_header.h_length));
> +	e->request = *ms;
> +	memcpy(&e->request.m_extra, ms->m_extra, length);
>  
>  	atomic_inc(&ls->ls_requestqueue_cnt);
>  	mutex_lock(&ls->ls_requestqueue_mutex);
> -- 
> 2.34.1
> 

