Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDB4618FBD
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Nov 2022 06:00:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667538041;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RbsKwk2Ze0a5EYeW42rZ4T7BWU2ghCIbOlL+4KjCrSA=;
	b=G75F68YFTywddq8NJ+EYO4HJE/rryM+oyoWEbVI1kUW/9VadIJ4KN0w8lT6Kc4Y4nNrSqv
	2eDjN4XLYZbdm6KC4NKriaZ6HDA0taTfiKkYlt86jz1GT1QbiaDPimU6XQHbTCNoReYFsG
	TAUckoHbFxo6DzKBJdj5GSvntvv8YjM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-FcfJM_jFPvGXcv8-zJvAPQ-1; Fri, 04 Nov 2022 01:00:37 -0400
X-MC-Unique: FcfJM_jFPvGXcv8-zJvAPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08EFF38107A2;
	Fri,  4 Nov 2022 05:00:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 214C52024CBF;
	Fri,  4 Nov 2022 05:00:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DB2E519465B2;
	Fri,  4 Nov 2022 05:00:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 860DB1946594 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  4 Nov 2022 05:00:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 40AC7111F3CB; Fri,  4 Nov 2022 05:00:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38D88111F3B6
 for <cluster-devel@redhat.com>; Fri,  4 Nov 2022 05:00:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1360F86EB23
 for <cluster-devel@redhat.com>; Fri,  4 Nov 2022 05:00:34 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-cxEeqgR8P5eSEsuiLEbSCw-1; Fri, 04 Nov 2022 01:00:30 -0400
X-MC-Unique: cxEeqgR8P5eSEsuiLEbSCw-1
Received: by mail-pg1-f178.google.com with SMTP id 128so3489084pga.1;
 Thu, 03 Nov 2022 22:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RbsKwk2Ze0a5EYeW42rZ4T7BWU2ghCIbOlL+4KjCrSA=;
 b=y7cp7pxT12y5CZrIjkvbxZN9jGgM9Eaq55iwf0mABuN+/zNv5BRwPNUaGG3gvbG5eU
 l1Gg5Wv3j+8BId2sqmNo2H+2j3Kq+8W2lRkIYRs6P0Ac5592yrv2xeDH6fNptxE0I4ce
 ojwJvQK9Ay4wPRkHlNfOG710qYgWQrr1qzNMMLZfIUZ2e91nXiekS3XbFmnPt7sCVlG3
 lZhVp/Rtcw3413OI2CUeAJqxxzxQON0jIu9K2s3JDtLUJCuc+gfBYECltPiDmU3YXGxo
 uRM5vajb+Pv9/evkNlw7taB7LqnKcPKm0zkkeX1rHqG9FIk1/nRNHFySWcj9hUMerdei
 Rx0Q==
X-Gm-Message-State: ACrzQf0o/YLn2jif0uMFes3Iu7OCycNAG80MHXTg80a5ya7iihYTTxlq
 uo7yUjrYI4/EjsMMhJsgKnht6guZngZFadzF
X-Google-Smtp-Source: AMsMyM4j1xPj2Iui456ebdwBJaC4wCNuIKpEFlws2n1lOFGR5OsDZ89KfBpXvz0TsIH42WasFCiXQQ==
X-Received: by 2002:a63:dc45:0:b0:43c:b43f:5228 with SMTP id
 f5-20020a63dc45000000b0043cb43f5228mr267639pgj.58.1667538028712; 
 Thu, 03 Nov 2022 22:00:28 -0700 (PDT)
Received: from mail.google.com (125-237-50-34-fibre.sparkbb.co.nz.
 [125.237.50.34]) by smtp.gmail.com with ESMTPSA id
 d16-20020a63ed10000000b00459a36795cbsm1569438pgi.42.2022.11.03.22.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 22:00:28 -0700 (PDT)
Date: Fri, 4 Nov 2022 18:00:22 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>, cluster-devel@redhat.com
Message-ID: <Y2ScZqWnJKe7J6NR@mail.google.com>
References: <202210111305.743F591@keescook> <Y0XQsqdRzlrSpgOh@mail.google.com>
MIME-Version: 1.0
In-Reply-To: <Y0XQsqdRzlrSpgOh@mail.google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH v5] [next] dlm: replace one-element
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
Cc: linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 12, 2022 at 09:23:14AM +1300, Paulo Miguel Almeida wrote:
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
> v5: use preferred sizeof style. Req: Gustavo Silva
> v4: resend patch using the right version number. Req: Gustavo Silva
> v3: replace one-element array with a fixed size array. Req: Kees Cook
> v2: patch resent as I had an issue with a <CRLF> char in my mail client
> v1: https://lore.kernel.org/lkml/Y0ICbf8tCtXMn+W0@mail.google.com/
> ---
> 
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
> index bae050df7abf..9479c8110979 100644
> --- a/fs/dlm/lockspace.c
> +++ b/fs/dlm/lockspace.c
> @@ -473,7 +473,7 @@ static int new_lockspace(const char *name, const char *cluster,
>  
>  	error = -ENOMEM;
>  
> -	ls = kzalloc(sizeof(struct dlm_ls) + namelen, GFP_NOFS);
> +	ls = kzalloc(sizeof(*ls), GFP_NOFS);
>  	if (!ls)
>  		goto out;
>  	memcpy(ls->ls_name, name, namelen);
> -- 
> 2.37.3
> 

Christine, David,

Just following up on this patch. Is there anything that either of you
want me change for this patch to be merged?

thanks!

- Paulo A.

