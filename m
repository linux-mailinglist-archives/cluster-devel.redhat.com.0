Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6255FBC08
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Oct 2022 22:27:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665520041;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=puG/uuS3doS9CXYUl8FFjYy0R0j+TLESqt0w1aeYy5g=;
	b=jUAigB4Gj4ax2br/7Fbo93+QFGJqTq4ej5TXEPg5q3mNB6RtfV/LMZznh7vuiNkjpEUG+1
	7d5jliDaNdzGoToWJdi4YBs7yx0ZSdZPLC2/ngetf8IaPVoZX5uRcQYcTkdnvnQgReWoj0
	QdNw63qupB3VPeQMyj8eA0BN+UMjCiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-iu3_aQ-6Mt-2dQQaYBrDGA-1; Tue, 11 Oct 2022 16:27:18 -0400
X-MC-Unique: iu3_aQ-6Mt-2dQQaYBrDGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B1FF811E75;
	Tue, 11 Oct 2022 20:27:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F8DB40E9920;
	Tue, 11 Oct 2022 20:27:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DACD019465A2;
	Tue, 11 Oct 2022 20:27:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A8625194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 20:27:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 61C3717584; Tue, 11 Oct 2022 20:27:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A8697AE5
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 20:27:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AEE185A583
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 20:27:16 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-375-dkg7rb5JNZmSokMR_spkaw-1; Tue, 11 Oct 2022 16:27:11 -0400
X-MC-Unique: dkg7rb5JNZmSokMR_spkaw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C87EBB815E9;
 Tue, 11 Oct 2022 20:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95CAC433D6;
 Tue, 11 Oct 2022 20:27:05 +0000 (UTC)
Date: Tue, 11 Oct 2022 15:26:57 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Message-ID: <Y0XRkWvc2uey+IJh@work>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks!
--
Gustavo

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

