Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B36DE3F3037
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 17:54:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629474852;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JlZGKQdLiYduLYkrU1ycwzHzZ/QPrtvBjhejt7xEWxE=;
	b=cyNUbXyQej2+27hd8hHjCAAzXJdluG1x0NqN7uWGP+CheUEuDoh/yseBAIDFU0VQusKwsl
	goMl1nS9EWGFmJXv1Se2RmvDlmTDLc/UHJH+k/guvRXuiuo48WJHJwooKcrsubgdYCx/CR
	4x/Kj2XNl7WHmYi7ObhECIe6Vs7scuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-87Njlj07OdKqncMZTVXk-Q-1; Fri, 20 Aug 2021 11:54:11 -0400
X-MC-Unique: 87Njlj07OdKqncMZTVXk-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94FC11008061;
	Fri, 20 Aug 2021 15:54:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87FD1369A;
	Fri, 20 Aug 2021 15:54:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45637181A0F8;
	Fri, 20 Aug 2021 15:54:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KFqUvJ031322 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 11:52:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74C1110545E6; Fri, 20 Aug 2021 15:52:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 700E5117DB38
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 15:52:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3FD989B846
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 15:52:23 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-156-mfhpKXbTNUGREj_EOk4CRg-1; Fri, 20 Aug 2021 11:52:22 -0400
X-MC-Unique: mfhpKXbTNUGREj_EOk4CRg-1
Received: by mail-wm1-f72.google.com with SMTP id
	g70-20020a1c20490000b02902e6753bf473so4994908wmg.0
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 08:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=JlZGKQdLiYduLYkrU1ycwzHzZ/QPrtvBjhejt7xEWxE=;
	b=Nm1LGq/Jd0y0V1yLDq71bkmEfUKJabLsazG75h53pbR9tcPshIs6js9Pq8V4kEFhgR
	PVRIPHvVDZlbENsM7ASFRueWNc6hpBpv5LKm8JCWBRHXln3xgNsi8ZWxCQEMPjzm/kq9
	0kBlEzHeNXqQX614bfZMPlSUBJJwiiEqWtSpKTrujBekvQsIpiG1RvHABeU5lwSayn9b
	bZ1IrdzxuPz9FrBrYV1D5uR2VGMA4/+WP1x5dqIIYKRoS7+UHQxTRpbtZTEORbt+dPpD
	dwV2pip7nFX3zxhphgb13+2BDylaVcf1+pSXZWXhMAcobHZDKsutkVZ80wXWBKVFRk27
	PC6w==
X-Gm-Message-State: AOAM532AKcfndcJy/udoo3s7lpqb+zI4PRbCdqrSQeHTWiLZYkaS+xtH
	emCSm5PahBj/WN97Fq6G5llDAdq4T/nrY79DGajBToZ/2JbGgs0yhrNph1GhRB/fjTC2JPIFlis
	kYUVDwT8ZaxRrBMKeNCh/0g==
X-Received: by 2002:a7b:c112:: with SMTP id w18mr4714047wmi.60.1629474741076; 
	Fri, 20 Aug 2021 08:52:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaJBeCrGw4MnIfr+I5SADEkPPbDd6DJwmXEz/DXBgKbV1Dt/yBLdB7ItdMspgW4ZXDhi9QGA==
X-Received: by 2002:a7b:c112:: with SMTP id w18mr4714020wmi.60.1629474740919; 
	Fri, 20 Aug 2021 08:52:20 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f0a:7f00:fad7:3bc9:69d:31f?
	(p200300d82f0a7f00fad73bc9069d031f.dip0.t-ipconnect.de.
	[2003:d8:2f0a:7f00:fad7:3bc9:69d:31f])
	by smtp.gmail.com with ESMTPSA id
	a18sm10107804wmg.43.2021.08.20.08.52.19
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 20 Aug 2021 08:52:20 -0700 (PDT)
To: Jeff Layton <jlayton@kernel.org>, torvalds@linux-foundation.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210820135707.171001-1-jlayton@kernel.org>
	<20210820135707.171001-2-jlayton@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <0f4f3e65-1d2d-e512-2a6f-d7d63effc479@redhat.com>
Date: Fri, 20 Aug 2021 17:52:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820135707.171001-2-jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 20 Aug 2021 11:54:08 -0400
Cc: bfields@fieldses.org, linux-nfs@vger.kernel.org, linux-doc@vger.kernel.org,
	stable@vger.kernel.org, willy@infradead.org, w@1wt.eu,
	cluster-devel@redhat.com, linux-mm@kvack.org,
	rostedt@goodmis.org, ebiederm@xmission.com, luto@kernel.org,
	v9fs-developer@lists.sourceforge.net, akpm@linux-foundation.org,
	linux-afs@lists.infradead.org, ocfs2-devel@oss.oracle.com,
	viro@zeniv.linux.org.uk
Subject: Re: [Cluster-devel] [PATCH v2 1/2] fs: warn about impending
 deprecation of mandatory locks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.08.21 15:57, Jeff Layton wrote:
> We've had CONFIG_MANDATORY_FILE_LOCKING since 2015 and a lot of distros
> have disabled it. Warn the stragglers that still use "-o mand" that
> we'll be dropping support for that mount option.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>   fs/namespace.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/fs/namespace.c b/fs/namespace.c
> index ab4174a3c802..ffab0bb1e649 100644
> --- a/fs/namespace.c
> +++ b/fs/namespace.c
> @@ -1716,8 +1716,16 @@ static inline bool may_mount(void)
>   }
>   
>   #ifdef	CONFIG_MANDATORY_FILE_LOCKING
> +static bool warned_mand;
>   static inline bool may_mandlock(void)
>   {
> +	if (!warned_mand) {
> +		warned_mand = true;
> +		pr_warn("======================================================\n");
> +		pr_warn("WARNING: the mand mount option is being deprecated and\n");
> +		pr_warn("         will be removed in v5.15!\n");
> +		pr_warn("======================================================\n");
> +	}

Is there a reason not to use pr_warn_once() ?


-- 
Thanks,

David / dhildenb

