Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0488341C888
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Sep 2021 17:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632929714;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vpHmmwOLpZ0CyZ+wJr45iSv5iva/JIQ4MyynZJsiGTE=;
	b=RaHePdOlHeZLESuKLsolGVqGM/Ua1AWAgy25PSUJVUzEeVAmTBwQceoZR/de4U6AahtssN
	Pf9FQ2fVBdbSsR/utet0HMCsX9Y/+EDZw1YuofVgt5ZGaJdnsxfVSyvKeWT/50l5nUJepX
	3wx/gGYfVR92u6tYKXEJ0DrcaLgylF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-KjRb5qj1M7WkaAHnw8MGmw-1; Wed, 29 Sep 2021 11:35:12 -0400
X-MC-Unique: KjRb5qj1M7WkaAHnw8MGmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8795835DE1;
	Wed, 29 Sep 2021 15:35:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C6B819C79;
	Wed, 29 Sep 2021 15:35:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD21D1806D02;
	Wed, 29 Sep 2021 15:35:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18TFGagw015418 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 29 Sep 2021 11:16:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 14D7410F26F0; Wed, 29 Sep 2021 15:16:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06E2D1010BA3
	for <cluster-devel@redhat.com>; Wed, 29 Sep 2021 15:16:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 096E6899EC5
	for <cluster-devel@redhat.com>; Wed, 29 Sep 2021 15:16:26 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
	[209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-26-8u-gFpZNOXKYZopz2b4ZwA-1; Wed, 29 Sep 2021 11:16:24 -0400
X-MC-Unique: 8u-gFpZNOXKYZopz2b4ZwA-1
Received: by mail-io1-f69.google.com with SMTP id
	z14-20020a05660229ce00b005d616a6f35aso3196068ioq.23
	for <cluster-devel@redhat.com>; Wed, 29 Sep 2021 08:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=vpHmmwOLpZ0CyZ+wJr45iSv5iva/JIQ4MyynZJsiGTE=;
	b=CmzWTCxOfdjFqgKLslE9pYLOPxHS3C8WuXdhAxXATWdA9KwXLMsXYFgqdc2cErHCRY
	H5Bg+0M9ksxuz5tU3gkah9kGaJVfXtuOjZfxOV0OnfCMVthLWGBZq2y7hmsq5cBewL8/
	T+OYwdrUIX3sw1gxtHv00u1+LAMcaAloyV8lPHQWq/+If08tGE2XpwjGFI+lqq0tTuPP
	zO6ldwvZuxPJMNVfZvapFF9cNJwOEdciBX317V3Z8+HgMkpZVaO3TVx1M8tSoD3yCIZR
	wq3suAqO8rZ844ijs3UknxfLARX+Addi3lOej2Tgjx1DXK/pTFhEEkXblpLsxpIuFBo0
	/O6A==
X-Gm-Message-State: AOAM531tYBEeWzpZYJ6i/Py6bYmZ+8S/F0CWw82DNK7Px8+/Uu/oAc8K
	Tg/WwQ6elojrhVclw1kh10h84B7D0Jb0P198bET5PSDXfpo48QRyQZm6gooJR/sYArW1kfxZq4B
	zkqgTuAwvwfh6fHWryXatdA==
X-Received: by 2002:a05:6638:a2d:: with SMTP id 13mr361591jao.12.1632928583503;
	Wed, 29 Sep 2021 08:16:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrRpJjYF3GKW1oV89AziEYcLzPM1lSZAs23GYMC6ayU2ap3+g3cUYJN9hYXwlBWche8kRlhw==
X-Received: by 2002:a05:6638:a2d:: with SMTP id 13mr361563jao.12.1632928583270;
	Wed, 29 Sep 2021 08:16:23 -0700 (PDT)
Received: from [172.16.0.19] ([172.87.10.244])
	by smtp.gmail.com with ESMTPSA id p16sm68778ilg.73.2021.09.29.08.16.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 29 Sep 2021 08:16:21 -0700 (PDT)
Message-ID: <659ee459-1965-c551-e2f9-4113822d2127@redhat.com>
Date: Wed, 29 Sep 2021 10:16:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.1.0
To: Andreas Gruenbacher <agruenba@redhat.com>
References: <20210929131616.192330-1-rpeterso@redhat.com>
	<20210929144726.2691676-1-agruenba@redhat.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <20210929144726.2691676-1-agruenba@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Save caller ip in
	gfs2_glock_nq_init
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/21 9:47 AM, Andreas Gruenbacher wrote:
> Hi Bob,
> 
> On Wed, Sep 29, 2021 at 3:16 PM Bob Peterson <rpeterso@redhat.com> wrote:
>> Before this patch, when a glock was locked by function gfs2_glock_nq_init,
>> it initializes the holder gh_ip (return address) as gfs2_glock_nq_init.
>> That made it extremely difficult to track down problems because many
>> functions call gfs2_glock_nq_init. This patch changes the function so
>> that it saves gh_ip from the caller of gfs2_glock_nq_init, which makes
>> it easy to backtrack which holder took the lock.
> 
> looks reasonable, but I think we can achieve this more cleanly by
> passing _RET_IP_ to gfs2_holder_init as below.  We want the same kind of
> treatment for gfs2_glock_poke as well, at least theoretically.
> 
> Thanks,
> Andreas
> 
> diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
> index 6dfd33dc206b..ebf541c82635 100644
> --- a/fs/gfs2/glock.c
> +++ b/fs/gfs2/glock.c
> @@ -829,7 +829,7 @@ static void gfs2_glock_poke(struct gfs2_glock *gl)
>   	struct gfs2_holder gh;
>   	int error;
>   
> -	gfs2_holder_init(gl, LM_ST_SHARED, flags, &gh);
> +	__gfs2_holder_init(gl, LM_ST_SHARED, flags, &gh, _RET_IP_);
>   	error = gfs2_glock_nq(&gh);
>   	if (!error)
>   		gfs2_glock_dq(&gh);
> @@ -1126,12 +1126,12 @@ int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
>    *
>    */
>   
> -void gfs2_holder_init(struct gfs2_glock *gl, unsigned int state, u16 flags,
> -		      struct gfs2_holder *gh)
> +void __gfs2_holder_init(struct gfs2_glock *gl, unsigned int state, u16 flags,
> +			struct gfs2_holder *gh, unsigned long ip)
>   {
>   	INIT_LIST_HEAD(&gh->gh_list);
>   	gh->gh_gl = gl;
> -	gh->gh_ip = _RET_IP_;
> +	gh->gh_ip = ip;
>   	gh->gh_owner_pid = get_pid(task_pid(current));
>   	gh->gh_state = state;
>   	gh->gh_flags = flags;
> diff --git a/fs/gfs2/glock.h b/fs/gfs2/glock.h
> index 699c5e95006a..c2b8cc7f5544 100644
> --- a/fs/gfs2/glock.h
> +++ b/fs/gfs2/glock.h
> @@ -188,8 +188,15 @@ extern int gfs2_glock_get(struct gfs2_sbd *sdp, u64 number,
>   extern void gfs2_glock_hold(struct gfs2_glock *gl);
>   extern void gfs2_glock_put(struct gfs2_glock *gl);
>   extern void gfs2_glock_queue_put(struct gfs2_glock *gl);
> -extern void gfs2_holder_init(struct gfs2_glock *gl, unsigned int state,
> -			     u16 flags, struct gfs2_holder *gh);
> +extern void __gfs2_holder_init(struct gfs2_glock *gl, unsigned int state,
> +			       u16 flags, struct gfs2_holder *gh,
> +			       unsigned long ip);
> +
> +static inline void gfs2_holder_init(struct gfs2_glock *gl, unsigned int state,
> +				    u16 flags, struct gfs2_holder *gh) {
> +	__gfs2_holder_init(gl, state, flags, gh, _RET_IP_);
> +}
> +
>   extern void gfs2_holder_reinit(unsigned int state, u16 flags,
>   			       struct gfs2_holder *gh);
>   extern void gfs2_holder_uninit(struct gfs2_holder *gh);
> @@ -239,7 +246,7 @@ static inline int gfs2_glock_nq_init(struct gfs2_glock *gl,
>   {
>   	int error;
>   
> -	gfs2_holder_init(gl, state, flags, gh);
> +	__gfs2_holder_init(gl, state, flags, gh, _RET_IP_);
>   
>   	error = gfs2_glock_nq(gh);
>   	if (error)
> 
Hi Andreas,

I'm not sure I would describe your patch as "more clean" than my 1 line
of code, but I do like your patch, and it makes sense to do it that way.

Can you please add my:
Reviewed-by: Bob Peterson <rpeterso@redhat.com>

and push that? While you're at it, please drop the v1 version of
my patch 9f4754923d87d2 "gfs2: introduce and use new glops 
go_lock_needed" which is replaced by my most recently posted patch.

Looks like I accidentally dropped the "gfs2 PATCH v2" from the subject:
sorry. Or after you review it, if that patch is okay, I can push it
myself. Thanks.

Bob Peterson

