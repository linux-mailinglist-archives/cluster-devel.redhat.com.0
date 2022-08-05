Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E5858AFFF
	for <lists+cluster-devel@lfdr.de>; Fri,  5 Aug 2022 20:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659725186;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=33psrDbLQcz80OXZGf4m0xuRZp3k1qHgg5uYxePgt0c=;
	b=HeQmWWSeVhKSwkEsC7qwogpsB9umrqY880mb8W8XcKlkmiYQ0rCqvpiQ5G+5S+NQKKvjt+
	i/ky/qKQin3TjU2ZJrN24CWmJ7A7NMRnlrWo2KAyXn0iTzo5zsAO2VVVvSjRSI24c6ia7o
	W6euJ898r1QTYR6N3TSSjEp0D9zWFdw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-JBOVGX9JPCm9X6_2oS0mNg-1; Fri, 05 Aug 2022 14:46:21 -0400
X-MC-Unique: JBOVGX9JPCm9X6_2oS0mNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8ED8D85A586;
	Fri,  5 Aug 2022 18:46:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F8221410DDA;
	Fri,  5 Aug 2022 18:46:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 118DE1932220;
	Fri,  5 Aug 2022 18:46:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 349711932216 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  5 Aug 2022 18:46:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 28498C27D95; Fri,  5 Aug 2022 18:46:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2487FC15D4F
 for <cluster-devel@redhat.com>; Fri,  5 Aug 2022 18:46:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CF0938107F2
 for <cluster-devel@redhat.com>; Fri,  5 Aug 2022 18:46:18 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-LVRrswXgML6GnZoKfY4jgQ-1; Fri, 05 Aug 2022 14:46:16 -0400
X-MC-Unique: LVRrswXgML6GnZoKfY4jgQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 s26-20020a05622a1a9a00b003427c5de47aso2261665qtc.5
 for <cluster-devel@redhat.com>; Fri, 05 Aug 2022 11:46:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=33psrDbLQcz80OXZGf4m0xuRZp3k1qHgg5uYxePgt0c=;
 b=6NaA0CFIg5eTFoX+zOEiGJCM6CjJ3QPDspT7/ce7fenKSufwGi2f6Z0eW4VR+qQ5Bn
 K2O4NXOBwq9N35NJ7D9x8HuioO5OoG24TB9Njpx5RtSuAin+C4W5IM3a56aCUVIbmhw/
 udDC0U3f6sG+jfY8zP4b7EBEDHI4wTvLDqp4NTrnzM6X5GC1S3X0bLFZiNpABwnLVVFL
 zAzqKBilbv+A6W1U9cAtVPLqrkKMeMIqFFLv7NJIxQm5mKFIpzFFadYJG/bFUJH8tAXL
 rbAppAH2gwmYBy3m1eIB/zGVoBOhQwv4nna3BodGwrWvH90OOhc/p7KhaBvZf1pztJUJ
 mvZw==
X-Gm-Message-State: ACgBeo3wP2vrtGSFo7Uu58t3Bbfl9ESVxi9Tb5tFwPUecxQloNvfZ8Hb
 DrMII+P2QrYW3tqXm0Sv4eO0qUz/Vt7kMYLvyOr+T/wwkDhhUwl8S+C/8cl0hjUGH9xtePTbq1Y
 +d/Z9J8bhxVFOayHI9gQuDU56lZ+QQCvEsNzLLA==
X-Received: by 2002:a05:622a:38e:b0:342:e878:5575 with SMTP id
 j14-20020a05622a038e00b00342e8785575mr2297806qtx.291.1659725176326; 
 Fri, 05 Aug 2022 11:46:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7fBNQ+Y3xaqg/jBOnAnfn9sNwc8YQkUbHfhAw7ji8tGjCI2a5JmH0qrOh3T2RbwX+z2Tay3NEmvvnZGC9KljI=
X-Received: by 2002:a05:622a:38e:b0:342:e878:5575 with SMTP id
 j14-20020a05622a038e00b00342e8785575mr2297787qtx.291.1659725176118; Fri, 05
 Aug 2022 11:46:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220725203835.860277-1-aahringo@redhat.com>
 <20220725203835.860277-4-aahringo@redhat.com>
In-Reply-To: <20220725203835.860277-4-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 5 Aug 2022 14:46:05 -0400
Message-ID: <CAK-6q+hRU2EUPQVt3jpnRXZc_iQ8NBHDtxyR=z7DpEBrHUdF0w@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH dlm/next 3/5] fs: dlm: trace user space
 callbacks
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
Cc: linux-raid@vger.kernel.org, joseph.qi@linux.alibaba.com, mark@fasheh.com,
 cluster-devel <cluster-devel@redhat.com>, song@kernel.org, jlbec@evilplan.org,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Jul 25, 2022 at 4:38 PM Alexander Aring <aahringo@redhat.com> wrote:
...
> --- a/include/trace/events/dlm.h
> +++ b/include/trace/events/dlm.h
> @@ -92,9 +92,10 @@ TRACE_EVENT(dlm_lock_start,
>  TRACE_EVENT(dlm_lock_end,
>
>         TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, void *name,
> -                unsigned int namelen, int mode, __u32 flags, int error),
> +                unsigned int namelen, int mode, __u32 flags, int error,
> +                bool kernel_lock),
>
> -       TP_ARGS(ls, lkb, name, namelen, mode, flags, error),
> +       TP_ARGS(ls, lkb, name, namelen, mode, flags, error, kernel_lock),
>
>         TP_STRUCT__entry(
>                 __field(__u32, ls_id)
> @@ -122,14 +123,16 @@ TRACE_EVENT(dlm_lock_end,
>                         memcpy(__get_dynamic_array(res_name), name,
>                                __get_dynamic_array_len(res_name));
>
> -               /* return value will be zeroed in those cases by dlm_lock()
> -                * we do it here again to not introduce more overhead if
> -                * trace isn't running and error reflects the return value.
> -                */
> -               if (error == -EAGAIN || error == -EDEADLK)
> -                       __entry->error = 0;
> -               else
> -                       __entry->error = error;
> +               if (kernel_lock) {
> +                       /* return value will be zeroed in those cases by dlm_lock()
> +                        * we do it here again to not introduce more overhead if
> +                        * trace isn't running and error reflects the return value.
> +                        */
> +                       if (error == -EAGAIN || error == -EDEADLK)
> +                               __entry->error = 0;
> +                       else
> +                               __entry->error = error;

I need to investigate why my user space block calls drop all weird
error numbers... We need to assign this value for user space locks as
well. I will remove the else branch and move the handling above to all
other field assignments and if it's kernel lock there is a special
handling which is different on kernel locks only... this handling is
still required.

- Alex

