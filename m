Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E4875D05C
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Jul 2023 19:08:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689959307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=IvgM7fAeSHYC3p5TdGbycEnYkwOh0dlzvgB4g2c4AQg=;
	b=SxWr/476syi346xwmnFhXLTjmaH4wXDl3KwnRLFvWBxyxYYjH1kzWobokORX/ezA4d/2mk
	PbaKeHRsejeBZQxxBTq2rqxi6Qwnt2+Vls+LwlCZmnH77tm7vaO2nnNFC8C9onfHcEodo6
	lRcWY7z1kUxJ90fcvRWGzBjNRKQt4g4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-FhYnug52ODuEFBOSKOvyZg-1; Fri, 21 Jul 2023 13:08:24 -0400
X-MC-Unique: FhYnug52ODuEFBOSKOvyZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F7CA82A68C;
	Fri, 21 Jul 2023 17:08:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 139F8C2C858;
	Fri, 21 Jul 2023 17:08:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 95C381946A49;
	Fri, 21 Jul 2023 17:08:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8D0F81946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Jul 2023 17:04:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 483332166B28; Fri, 21 Jul 2023 17:04:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C9492166B26
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 17:04:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1776C857FF8
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 17:04:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-22to6EQENi-8ghjMGuTUUA-1; Fri, 21 Jul 2023 13:04:56 -0400
X-MC-Unique: 22to6EQENi-8ghjMGuTUUA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ED4DA61D2F;
 Fri, 21 Jul 2023 16:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60033C433C8;
 Fri, 21 Jul 2023 16:59:28 +0000 (UTC)
Date: Fri, 21 Jul 2023 12:59:26 -0400
From: Chuck Lever <cel@kernel.org>
To: Alexander Aring <aahringo@redhat.com>
Message-ID: <ZLq5bsR+vpPftY3h@manet.1015granger.net>
References: <20230720125806.1385279-1-aahringo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230720125806.1385279-1-aahringo@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Fri, 21 Jul 2023 17:08:14 +0000
Subject: Re: [Cluster-devel] [RFC v6.5-rc2 1/3] fs: lockd: nlm_blocked list
 race fixes
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
Cc: cluster-devel@redhat.com, linux-nfs@vger.kernel.org, neilb@suse.de,
 jlayton@kernel.org, Dai.Ngo@oracle.com, tom@talpey.com, kolga@netapp.com,
 chuck.lever@oracle.com, anna@kernel.org, trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 20, 2023 at 08:58:04AM -0400, Alexander Aring wrote:
> This patch fixes races when lockd accessing the global nlm_blocked list.
> It was mostly safe to access the list because everything was accessed
> from the lockd kernel thread context but there exists cases like
> nlmsvc_grant_deferred() that could manipulate the nlm_blocked list and
> it can be called from any context.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexander Aring <aahringo@redhat.com>

I agree with Jeff, this one looks fine to apply to nfsd-next. I've done
that so it can get test exposure while we consider 2/3 and 3/3.

I've dropped the "Cc: stable" tag -- since there is no specific bug
report this fix addresses, I will defer the decision about backporting
at least until we have some test experience.


> ---
>  fs/lockd/svclock.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index c43ccdf28ed9..28abec5c451d 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -131,12 +131,14 @@ static void nlmsvc_insert_block(struct nlm_block *block, unsigned long when)
>  static inline void
>  nlmsvc_remove_block(struct nlm_block *block)
>  {
> +	spin_lock(&nlm_blocked_lock);
>  	if (!list_empty(&block->b_list)) {
> -		spin_lock(&nlm_blocked_lock);
>  		list_del_init(&block->b_list);
>  		spin_unlock(&nlm_blocked_lock);
>  		nlmsvc_release_block(block);
> +		return;
>  	}
> +	spin_unlock(&nlm_blocked_lock);
>  }
>  
>  /*
> @@ -152,6 +154,7 @@ nlmsvc_lookup_block(struct nlm_file *file, struct nlm_lock *lock)
>  				file, lock->fl.fl_pid,
>  				(long long)lock->fl.fl_start,
>  				(long long)lock->fl.fl_end, lock->fl.fl_type);
> +	spin_lock(&nlm_blocked_lock);
>  	list_for_each_entry(block, &nlm_blocked, b_list) {
>  		fl = &block->b_call->a_args.lock.fl;
>  		dprintk("lockd: check f=%p pd=%d %Ld-%Ld ty=%d cookie=%s\n",
> @@ -161,9 +164,11 @@ nlmsvc_lookup_block(struct nlm_file *file, struct nlm_lock *lock)
>  				nlmdbg_cookie2a(&block->b_call->a_args.cookie));
>  		if (block->b_file == file && nlm_compare_locks(fl, &lock->fl)) {
>  			kref_get(&block->b_count);
> +			spin_unlock(&nlm_blocked_lock);
>  			return block;
>  		}
>  	}
> +	spin_unlock(&nlm_blocked_lock);
>  
>  	return NULL;
>  }
> @@ -185,16 +190,19 @@ nlmsvc_find_block(struct nlm_cookie *cookie)
>  {
>  	struct nlm_block *block;
>  
> +	spin_lock(&nlm_blocked_lock);
>  	list_for_each_entry(block, &nlm_blocked, b_list) {
>  		if (nlm_cookie_match(&block->b_call->a_args.cookie,cookie))
>  			goto found;
>  	}
> +	spin_unlock(&nlm_blocked_lock);
>  
>  	return NULL;
>  
>  found:
>  	dprintk("nlmsvc_find_block(%s): block=%p\n", nlmdbg_cookie2a(cookie), block);
>  	kref_get(&block->b_count);
> +	spin_unlock(&nlm_blocked_lock);
>  	return block;
>  }
>  
> @@ -317,6 +325,7 @@ void nlmsvc_traverse_blocks(struct nlm_host *host,
>  
>  restart:
>  	mutex_lock(&file->f_mutex);
> +	spin_lock(&nlm_blocked_lock);
>  	list_for_each_entry_safe(block, next, &file->f_blocks, b_flist) {
>  		if (!match(block->b_host, host))
>  			continue;
> @@ -325,11 +334,13 @@ void nlmsvc_traverse_blocks(struct nlm_host *host,
>  		if (list_empty(&block->b_list))
>  			continue;
>  		kref_get(&block->b_count);
> +		spin_unlock(&nlm_blocked_lock);
>  		mutex_unlock(&file->f_mutex);
>  		nlmsvc_unlink_block(block);
>  		nlmsvc_release_block(block);
>  		goto restart;
>  	}
> +	spin_unlock(&nlm_blocked_lock);
>  	mutex_unlock(&file->f_mutex);
>  }
>  
> -- 
> 2.31.1
> 

