Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7095FBBCF
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Oct 2022 22:06:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665518802;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=l2fjLHj4AizGsdQ3rUWzzJN2TYcfP94NYRiXnGsKpTo=;
	b=FnboPfhYptBN86Eth8QeIowpsa7n0L8MEMZ6QdnsOWK91YymbhFfNBreurcDAkKGCEx+5S
	DzoIfYy2sNMhVX4CIKFv4O+VsqyYWzepQsFSpQjHoTTnIAraAJs4hVAwmAkZAOS7YMIKBI
	1nsu3z/U4eS2XjSVQJp5TArmXcC52kk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-FwnZcF69Nk2qwCaWLGfuCg-1; Tue, 11 Oct 2022 16:06:39 -0400
X-MC-Unique: FwnZcF69Nk2qwCaWLGfuCg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB576811E75;
	Tue, 11 Oct 2022 20:06:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACD424B4019;
	Tue, 11 Oct 2022 20:06:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7C29119465A2;
	Tue, 11 Oct 2022 20:06:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 09E76194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 20:06:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DB51BC15BAB; Tue, 11 Oct 2022 20:06:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D32EAC15BA4
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 20:06:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0468101CC6B
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 20:06:36 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-4_v5evT3NNa9TFphtLxR-A-1; Tue, 11 Oct 2022 16:06:34 -0400
X-MC-Unique: 4_v5evT3NNa9TFphtLxR-A-1
Received: by mail-pg1-f173.google.com with SMTP id q1so5379725pgl.11
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 13:06:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l2fjLHj4AizGsdQ3rUWzzJN2TYcfP94NYRiXnGsKpTo=;
 b=YGqaspgZIrTg7+bivjwT5uP8q4SS0pS8o1Y/KgW00DNSSYA3w77RVhqBbfgHtiBCd/
 vqEphMx/gf6btXZndwR0Y3cUQfjv5Y8JD9dXHJ41fF1e5gy3wJWGXQXghaTDP2kyGC2B
 bATXEdMvcNDIyMffIYqsrh9JtBr3OO9LkFu9Y8KN0m1675VpnfUneP9PSkO2XgXTrANP
 JCA9jjEgjN2qvKdZyJ6Fe2l9ond461O4aWQ49L4uD4cX6q8BaoS1Hgee4dKjhUP/MD+0
 kVhdXfsE1cS3tkbv5HAkSCGH8p5zsWWHictKB+HxxU6tpTBl9klD88aICnnzw1ZdUUId
 0l3A==
X-Gm-Message-State: ACrzQf3LmgTagq8BT7ZYQbh8+0wVRTrCXkzUzAurWOjPCq6LlR+uAbsT
 O72+p5pIq+OjOKqfzAF6/mcqOg==
X-Google-Smtp-Source: AMsMyM4TEOHwtoixNT7awm8qgMYy7OR8kAYaGhOZ+lGYZBmQ5oaFWN17ZCj7GIEYqz2AiIVmhn1OCA==
X-Received: by 2002:aa7:96e6:0:b0:562:6f4e:151 with SMTP id
 i6-20020aa796e6000000b005626f4e0151mr26788185pfq.35.1665518793741; 
 Tue, 11 Oct 2022 13:06:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a170902d50a00b0016dc6279ab7sm6861285plg.149.2022.10.11.13.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 13:06:33 -0700 (PDT)
Date: Tue, 11 Oct 2022 13:06:32 -0700
From: Kees Cook <keescook@chromium.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Message-ID: <202210111305.743F591@keescook>
References: <Y0W5jkiXUkpNl4ap@mail.google.com>
 <Y0XMP2RMkE4MWNPE@mail.google.com>
MIME-Version: 1.0
In-Reply-To: <Y0XMP2RMkE4MWNPE@mail.google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v4] [next] dlm: replace one-element
 array with fixed size array
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 12, 2022 at 09:04:15AM +1300, Paulo Miguel Almeida wrote:
> One-element arrays are deprecated. So, replace one-element array with
> fixed size array member in struct dlm_ls, and refactor the rest of the
> code, accordingly.
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/228
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836
> Link: https://lore.kernel.org/lkml/Y0W5jkiXUkpNl4ap@mail.google.com/
> 
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
> Changelog:
> 
> v4: resend patch using the right version number. Req: Gustavo Silva
> v3: replace one-element array with a fixed size array. Req: Kees Cook
> v2: patch resent as I had an issue with a <CRLF> char in my mail client
> v1: https://lore.kernel.org/lkml/Y0ICbf8tCtXMn+W0@mail.google.com/
> ---
>  fs/dlm/dlm_internal.h | 2 +-
>  fs/dlm/lockspace.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
> index e34c3d2639a5..94fadb619ba0 100644
> --- a/fs/dlm/dlm_internal.h
> +++ b/fs/dlm/dlm_internal.h
> @@ -670,7 +670,7 @@ struct dlm_ls {
>  	void			*ls_ops_arg;
>  
>  	int			ls_namelen;
> -	char			ls_name[1];
> +	char			ls_name[DLM_LOCKSPACE_LEN + 1];
>  };
>  
>  /*
> diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
> index bae050df7abf..23de0d47cbc1 100644
> --- a/fs/dlm/lockspace.c
> +++ b/fs/dlm/lockspace.c
> @@ -473,7 +473,7 @@ static int new_lockspace(const char *name, const char *cluster,
>  
>  	error = -ENOMEM;
>  
> -	ls = kzalloc(sizeof(struct dlm_ls) + namelen, GFP_NOFS);
> +	ls = kzalloc(sizeof(struct dlm_ls), GFP_NOFS);
                     ^^^^^^^^^^^^^^^^^^^^
I think you forgot the suggestion Gustavo had here. :) Preferred style would
be:
	sizeof(*ls)

-- 
Kees Cook

