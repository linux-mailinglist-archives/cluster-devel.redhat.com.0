Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FEB4A755B
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Feb 2022 17:04:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643817878;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L6m6EQTsnz5lB6lE0OpNAqnFt6/52jcKfGjS9YQcVjk=;
	b=Osg3iHM1YwpudWK3+VJQuXQqgRhvFjbCDTd6YY0fFoKgtwytQMNKkCcOAdlkghjObWQ2G9
	/GnDg9j+4QDyN/OKKj3OipyXPQy+Ereh2LOg5wwmkfmIe0p2aoJ1l5Bh7Vyo+iCjl/3JGo
	Jjgksi7StnoQjVZD14i9d6GmCMLNB/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-_j45s1anOkaK9vIIAc6HrQ-1; Wed, 02 Feb 2022 11:04:35 -0500
X-MC-Unique: _j45s1anOkaK9vIIAc6HrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 728DB801B32;
	Wed,  2 Feb 2022 16:04:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 569B279A1A;
	Wed,  2 Feb 2022 16:04:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4091C1809CB8;
	Wed,  2 Feb 2022 16:04:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
	[10.11.54.7])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 212G4Ten019277 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Feb 2022 11:04:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 50A8F14582F3; Wed,  2 Feb 2022 16:04:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C66414582E2
	for <cluster-devel@redhat.com>; Wed,  2 Feb 2022 16:04:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28B43108C1A6
	for <cluster-devel@redhat.com>; Wed,  2 Feb 2022 16:04:29 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
	[209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-394-lRJ0cnYlMyWYA-now9oKgw-1; Wed, 02 Feb 2022 11:04:28 -0500
X-MC-Unique: lRJ0cnYlMyWYA-now9oKgw-1
Received: by mail-qv1-f72.google.com with SMTP id
	u15-20020a0cec8f000000b00425d89d8be0so16570640qvo.20
	for <cluster-devel@redhat.com>; Wed, 02 Feb 2022 08:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:from:in-reply-to
	:content-transfer-encoding;
	bh=L6m6EQTsnz5lB6lE0OpNAqnFt6/52jcKfGjS9YQcVjk=;
	b=dFWilJYEHVHVQj7lfsubXAa7B3EDX1pnsU8YdxFyLSNeeEz/R/HGB4LjX1oJdFN5po
	PYPzAqz91d8SKVgSMGRar+779HU1E63W5x+cHch02GLBWzq1bZJXAzA16XUet0cWTedq
	t9ICyf5dgoK3cylnNzEWgTKN7yOhepEFjbxTLd3rYq6C5rJWCDBZmy/4dQKUgPQQ/kG5
	BrjS1kbDJNI4AcoLSfCgmzCkrz+jvJE0Ln00arpae7OHSnoY4euAOSCKmFuIfjGN5MkR
	iLb+AetQvId85nZ2x7Ew9oJcHm7xtzfZnGoDJCGGBWDGyeED8zBIMb4C2Evrt/ceBAZg
	bWBQ==
X-Gm-Message-State: AOAM532vFyEj8O9CRiZf+8FXgspQcNhl0Yrd72iW8AayFyt87YU4rdMN
	JhX5MBNany7vUwWzWhHLXrt9h03IvXv6RaC6EH5kPxv+KapYmF/ZCA9xnp0s4VPMx9ybvlnyZxe
	Czw70x6ipnmtmsBU+TPNaoA==
X-Received: by 2002:a05:622a:d:: with SMTP id
	x13mr23676772qtw.54.1643817866707; 
	Wed, 02 Feb 2022 08:04:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxGgGIGxrU/hFdYkdr4ilAGuMx8SdNk+V9ykzArPfqQjKUDY82mXCMkz50SutAGamgqL+qdOw==
X-Received: by 2002:a05:622a:d:: with SMTP id
	x13mr23676736qtw.54.1643817866262; 
	Wed, 02 Feb 2022 08:04:26 -0800 (PST)
Received: from ?IPV6:2601:883:c200:210:6ae9:ce2:24c9:b87b?
	([2601:883:c200:210:6ae9:ce2:24c9:b87b])
	by smtp.gmail.com with ESMTPSA id
	18sm11652307qka.126.2022.02.02.08.04.25
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 02 Feb 2022 08:04:25 -0800 (PST)
Message-ID: <cc94a478-e64c-513e-2420-ff0e4eba1db9@redhat.com>
Date: Wed, 2 Feb 2022 11:04:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.4.0
To: Andreas Gruenbacher <agruenba@redhat.com>,
	cluster-devel <cluster-devel@redhat.com>
References: <CAHc6FU6+mr5n8ng=P7hNbJjr=yE5YN9LcDHtD1_B10TudgcF-g@mail.gmail.com>
	<20220124172357.554689-3-rpeterso@redhat.com>
	<20220124172357.554689-1-rpeterso@redhat.com>
	<20220202155529.42634-1-agruenba@redhat.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <20220202155529.42634-1-agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Expect -EBUSY after canceling dlm
	locking requests
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/2/22 10:55 AM, Andreas Gruenbacher wrote:
> Due to the asynchronous nature of the dlm api, when we request a pending
> locking request to be canceled with dlm_unlock(DLM_LKF_CANCEL), the
> locking request will either complete before it could be canceled, or the
> cancellation will succeed.  In either case, gdlm_ast will be called once
> and the status will indicate the outcome of the locking request, with
> -DLM_ECANCEL indicating a canceled request.
> 
> Inside dlm, when a locking request completes before its cancel request
> could be processed, gdlm_ast will be called, but the lock will still be
> considered busy until a DLM_MSG_CANCEL_REPLY message completes the
> cancel request.  During that time, successive dlm_lock() or dlm_unlock()
> requests for that lock will return -EBUSY.  In other words, waiting for
> the gdlm_ast call before issuing the next locking request is not enough.
> There is no way of waiting for a cancel request to actually complete,
> either.
> 
> We rarely cancel locking requests, but when we do, we don't know when
> the next locking request for that lock will occur.  This means that any
> dlm_lock() or dlm_unlock() call can potentially return -EBUSY.  When
> that happens, this patch simply repeats the request after a short pause.
> 
> This workaround could be improved upon by tracking for which dlm locks
> cancel requests have been issued, but that isn't strictly necessary and
> it would complicate the code.  We haven't seen -EBUSY errors from dlm
> without cancel requests.
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> ---
>   fs/gfs2/lock_dlm.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
> index 50578f881e6d..2559a79cf14b 100644
> --- a/fs/gfs2/lock_dlm.c
> +++ b/fs/gfs2/lock_dlm.c
> @@ -261,6 +261,7 @@ static int gdlm_lock(struct gfs2_glock *gl, unsigned int req_state,
>   	int req;
>   	u32 lkf;
>   	char strname[GDLM_STRNAME_BYTES] = "";
> +	int error;
>   
>   	req = make_mode(gl->gl_name.ln_sbd, req_state);
>   	lkf = make_flags(gl, flags, req);
> @@ -279,8 +280,14 @@ static int gdlm_lock(struct gfs2_glock *gl, unsigned int req_state,
>   	 * Submit the actual lock request.
>   	 */
>   
> -	return dlm_lock(ls->ls_dlm, req, &gl->gl_lksb, lkf, strname,
> +again:
> +	error = dlm_lock(ls->ls_dlm, req, &gl->gl_lksb, lkf, strname,
>   			GDLM_STRNAME_BYTES - 1, 0, gdlm_ast, gl, gdlm_bast);
> +	if (error == -EBUSY) {
> +		msleep(20);
> +		goto again;
> +	}
> +	return error;
>   }
>   
>   static void gdlm_put_lock(struct gfs2_glock *gl)
> @@ -312,8 +319,14 @@ static void gdlm_put_lock(struct gfs2_glock *gl)
>   		return;
>   	}
>   
> +again:
>   	error = dlm_unlock(ls->ls_dlm, gl->gl_lksb.sb_lkid, DLM_LKF_VALBLK,
>   			   NULL, gl);
> +	if (error == -EBUSY) {
> +		msleep(20);
> +		goto again;
> +	}
> +
>   	if (error) {
>   		fs_err(sdp, "gdlm_unlock %x,%llx err=%d\n",
>   		       gl->gl_name.ln_type,
Hi,

Looks good. If you push it to a temp branch I'll test it.

Bob Peterson

