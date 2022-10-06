Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCFC5F6651
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Oct 2022 14:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665060333;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=o9vPkcMo+2zTJ0H6qnbiLYm2xIJdGkpNd5F08k8zFJI=;
	b=TNgCHC95yyb5b8N4nfnDSgg564ng3Dp5vNI9jGxUrCAiznmWqg1iVAuB0jdsSRpiOcD0L3
	hAD76mPHcVJ9byRVXh1iR3oVI/OSJk8YuhefE3arq0Hrmq6XdKOQoC1wLi6tztuPGe3jUL
	wr3k32ISdAx6c5AhW13vtzGyMBkv8fk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-wdZLUtiyMkC7ZoISD1smZg-1; Thu, 06 Oct 2022 08:45:30 -0400
X-MC-Unique: wdZLUtiyMkC7ZoISD1smZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E21C18ABF8E;
	Thu,  6 Oct 2022 12:45:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D10502166B2F;
	Thu,  6 Oct 2022 12:45:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8B64219465A4;
	Thu,  6 Oct 2022 12:45:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1D9411946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Oct 2022 12:45:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0420649BB6A; Thu,  6 Oct 2022 12:45:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0B3949BB67
 for <cluster-devel@redhat.com>; Thu,  6 Oct 2022 12:45:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3A6B81B081
 for <cluster-devel@redhat.com>; Thu,  6 Oct 2022 12:45:25 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-L7VNReU4OM225E_A7y5JuQ-1; Thu, 06 Oct 2022 08:45:24 -0400
X-MC-Unique: L7VNReU4OM225E_A7y5JuQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a1c3502000000b003b535aacc0bso2545536wma.2
 for <cluster-devel@redhat.com>; Thu, 06 Oct 2022 05:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o9vPkcMo+2zTJ0H6qnbiLYm2xIJdGkpNd5F08k8zFJI=;
 b=hsLkAaAYv79QnCIyCjchwj9ojOQcBpDh1WzYq7YSEjTEa7xBynSyDq02bp9UNnWt2V
 QuZaRKCoEvJoRkJnEXF0I33XtBdSDIzu+Cr0ivn4qcFFXccQdKaenQAhMp5Br74j58ud
 76PAOcoPs4ekHfO1iiOFT/OM2QDnHpFqMHKxqSXZUXUTa6yqkW4AtKfFNi8qokVZWjKI
 i2VVAjzrpyWuVWW5PFXY3cKMBiq9wI18Qs74oUfR6psgK4lCy3vBGc2r30NJv19kXx5I
 4YupwHsgT66tnWGdh8nFjTpSWJAZY6feTQe2jeAHwRZ2rh67UXCsPIjI3TbKwr/wfp5Z
 THcA==
X-Gm-Message-State: ACrzQf2rgGylPqlsvLI6T03cr47KvhEztdyODeEeRJMlLOxz3dC5yuMv
 Qd1Z+FZxUbuIntuhYOPtqe6tlfuksOYTCgpFvY+XUYGlzxvNhsq+jWvWClVCWr1gI3H8oSujFZ5
 axfdAo6h9YGXTFH7THs47If3BeK6ii8+L8yPHHA==
X-Received: by 2002:adf:d203:0:b0:22d:e4f5:5301 with SMTP id
 j3-20020adfd203000000b0022de4f55301mr2965895wrh.88.1665060323417; 
 Thu, 06 Oct 2022 05:45:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM59nAV4EW+ticx30gRqBAGFb3FIjq1Hoci0/suZWCwglXCOkK19H1xNhhINRUSyYNxlQzNfKu8+xrQjEISVPlg=
X-Received: by 2002:adf:d203:0:b0:22d:e4f5:5301 with SMTP id
 j3-20020adfd203000000b0022de4f55301mr2965866wrh.88.1665060322903; Thu, 06 Oct
 2022 05:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20221005192312.4130838-1-aahringo@redhat.com>
 <20221005192312.4130838-2-aahringo@redhat.com>
In-Reply-To: <20221005192312.4130838-2-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 6 Oct 2022 08:45:11 -0400
Message-ID: <CAK-6q+hSdrzTf68kymiyNQ_xu68-6WX8Kx5P78T83tDeCpMRHQ@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCHv2 dlm-tool 2/2] dlm_controld: fix rare
 off by one
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Oct 5, 2022 at 3:23 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> While debugging I came across a rare off by one when the snprintf()
> filled string _exactly_ matched the size (with '\0') and we return the
> bytes written without \0. We will then write a "\n\0" pattern at the
> end but when the string exactly matched there is missing byte in the
> calculation of the "\n\0" pattern because the return value only reduced
> the size by one. To fix that we substract -1 from the return value of
> snprintf() to have at the end two bytes for the "\n\0" pattern. If we
> would hit the case that the buffer exactly matched we truncate the
> string by one byte because we need to fit '\n' and '\0' into the buffer.
> ---
> v2:
>  - remove sob.
>  - only really do the truncate of one byte when the buffer would exact
>    match which is the given size and the returned size + 1 ('\0').
>
>  dlm_controld/logging.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/dlm_controld/logging.c b/dlm_controld/logging.c
> index 2c57138c..bfd7d274 100644
> --- a/dlm_controld/logging.c
> +++ b/dlm_controld/logging.c
> @@ -181,10 +181,14 @@ void log_level(char *name_in, uint32_t level_in, const char *fmt, ...)
>         ret = vsnprintf(log_str + pos, len - pos, fmt, ap);
>         va_end(ap);
>
> -       if (ret >= len - pos)
> +       if (ret >= len - pos) {
>                 pos = len - 1;
> -       else
> -               pos += ret;
> +       } else {
> +               if (ret + 1 == len - pos)
> +                       pos += ret - 1;

I will drop this patch, this case is being handled in the parent if
branch and sets len-1 which truncates the string...

- Alex

