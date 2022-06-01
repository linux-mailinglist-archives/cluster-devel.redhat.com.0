Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF289539BE0
	for <lists+cluster-devel@lfdr.de>; Wed,  1 Jun 2022 06:02:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654056152;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SRn5mOID9roqoRMzvYPRc89MGvzZg/y/10U7va/3BxU=;
	b=aZa4fgDy4fFQeLhoHa2jxxbkQmNZgchsi4w4HsvYW05jakHb6xP5LhjrP9L43GQuIXeVNz
	sW6O7u0hltSbgpT913E4REuKqjAFnrfHnoU2bGVUN0k2zmpc6NtwNaUbio3KyNUxHPOp9n
	reFCYA5ELKAQV1YyFbIdWmYB6+hbZ7s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-7KM8tNukMUiplWA0yMsEhQ-1; Wed, 01 Jun 2022 00:02:28 -0400
X-MC-Unique: 7KM8tNukMUiplWA0yMsEhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80A0780B71A;
	Wed,  1 Jun 2022 04:02:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 049941410DDB;
	Wed,  1 Jun 2022 04:02:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C8B5A1947071;
	Wed,  1 Jun 2022 04:02:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 66155194706A for <cluster-devel@listman.corp.redhat.com>;
 Wed,  1 Jun 2022 04:02:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 54EA610725; Wed,  1 Jun 2022 04:02:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 50DC38287E
 for <cluster-devel@redhat.com>; Wed,  1 Jun 2022 04:02:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35A413806656
 for <cluster-devel@redhat.com>; Wed,  1 Jun 2022 04:02:23 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-208-g2y9jSzbPXeqYMcewNv2Dg-1; Wed, 01 Jun 2022 00:02:22 -0400
X-MC-Unique: g2y9jSzbPXeqYMcewNv2Dg-1
Received: by mail-qt1-f197.google.com with SMTP id
 t14-20020a05622a01ce00b002ff91ea4445so455428qtw.2
 for <cluster-devel@redhat.com>; Tue, 31 May 2022 21:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SRn5mOID9roqoRMzvYPRc89MGvzZg/y/10U7va/3BxU=;
 b=PZi+ntBuiIcgp+hnObdPLt+WGC0sN3YG8tkp4m4l04JfPDz6j53RJBRdndUt/z8DF2
 H98vD4AILZu3KTPG3NqIsMLqcigycNUbmDbaho92rpFZtjqBElytPKwR0Pd0HEaOFUgw
 lnDBfMUb8wBKn9CdUWXc6fF5GP5Tz6c+YUCvGZokGqTOEyW1W//3G79VoKgdiNDvTszR
 biQ1rRK3c0aHMPjOuXHVf2Bi6pu9wQHAwYwVJHW334sEEkx0YHFYAYr/YsSJMPTsmUbs
 8VpWhvDKfjOAkhDEL4OZwd0vn58rNyDibUWFU7QOJfHtO4PaSywLE0XqnG8UIL7KL5Qf
 Fc5Q==
X-Gm-Message-State: AOAM533WYAcvhbeVF/N8OWKgms+VrZOSURiucCn/PLExgebT3KpHhyJg
 Sjy1aM+a0F0gBRHAIA5Zta9+9+cGq+6TZ2496GeK1bAgXiEjw8NOcChr4if4KOBY6Q9+tU5PApM
 REW5mqakMH7bFyPjzL/nDM7ea/dPD+VNz+I1WIQ==
X-Received: by 2002:a05:6214:c29:b0:45a:fedd:7315 with SMTP id
 a9-20020a0562140c2900b0045afedd7315mr52148083qvd.59.1654056141476; 
 Tue, 31 May 2022 21:02:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEgISFJpwXhHkUde9imJgZrjiBXN27Wl/fc6ti0uZvWPnYnUMrdxzBOmVLbRA42HUFkU/Pl7xJs/dRd5/i5ys=
X-Received: by 2002:a05:6214:c29:b0:45a:fedd:7315 with SMTP id
 a9-20020a0562140c2900b0045afedd7315mr52148077qvd.59.1654056141237; Tue, 31
 May 2022 21:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220530145528.1264681-1-aahringo@redhat.com>
 <20220530145528.1264681-3-aahringo@redhat.com>
In-Reply-To: <20220530145528.1264681-3-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 1 Jun 2022 00:02:10 -0400
Message-ID: <CAK-6q+g-cPK+WeT1BafiY-ven1a5HsZkdw9vJM0xyazgF-RGuw@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH dlm/next 3/3] fs: dlm: add resource name
 to tracepoints
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, May 30, 2022 at 10:55 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch adds the resource name to dlm tracepoints. In case of
> dlm_lock() we might end in a short time situation (if flags is not
> convert) that a lkb is not associated with a resource at the time
> when the tracepoint is called. Therefore we have a a prioritzation of
> getting the resource name. If the resource in a lkb isn't set we use the
> name and namelen passed as parameter as fallback.
>
> The dlm resource name can be decoded as a string representated ascii
> codec. DLM itself stores the name with as a null terminated array but
> the user does not required to pass a null terminated resource name. To
> have somehow a similar behaviour and the user knows that the resource
> name of the dlm user is ascii codec we store the resource name array in
> a null terminated array but pass the array length for the trace user
> without the null terminated byte. The advantage here is that the user
> can run directly a printf() on the resource name array with a optional
> check on isascii().
>
> The TP_printk() call however use always a hexadecimal string
> representation for the resource name array.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/lock.c              |   4 +-
>  include/trace/events/dlm.h | 134 ++++++++++++++++++++++++++++++++-----
>  2 files changed, 118 insertions(+), 20 deletions(-)
>
> diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> index 226822f49d30..e80d42ba64ae 100644
> --- a/fs/dlm/lock.c
> +++ b/fs/dlm/lock.c
> @@ -3472,7 +3472,7 @@ int dlm_lock(dlm_lockspace_t *lockspace,
>         if (error)
>                 goto out;
>
> -       trace_dlm_lock_start(ls, lkb, mode, flags);
> +       trace_dlm_lock_start(ls, lkb, name, namelen, mode, flags);
>
>         error = set_lock_args(mode, lksb, flags, namelen, 0, ast,
>                               astarg, bast, &args);
> @@ -3487,7 +3487,7 @@ int dlm_lock(dlm_lockspace_t *lockspace,
>         if (error == -EINPROGRESS)
>                 error = 0;
>   out_put:
> -       trace_dlm_lock_end(ls, lkb, mode, flags, error);
> +       trace_dlm_lock_end(ls, lkb, name, namelen, mode, flags, error);
>
>         if (convert || error)
>                 __put_lkb(ls, lkb);
> diff --git a/include/trace/events/dlm.h b/include/trace/events/dlm.h
> index e333176ecfaf..180a24481929 100644
> --- a/include/trace/events/dlm.h
> +++ b/include/trace/events/dlm.h
> @@ -49,38 +49,56 @@
>  /* note: we begin tracing dlm_lock_start() only if ls and lkb are found */
>  TRACE_EVENT(dlm_lock_start,
>
> -       TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, int mode,
> -                __u32 flags),
> +       TP_PROTO(struct dlm_ls *ls, struct dlm_lkb *lkb, void *name,
> +                unsigned int namelen, int mode, __u32 flags),
>
> -       TP_ARGS(ls, lkb, mode, flags),
> +       TP_ARGS(ls, lkb, name, namelen, mode, flags),
>
>         TP_STRUCT__entry(
>                 __field(__u32, ls_id)
>                 __field(__u32, lkb_id)
>                 __field(int, mode)
>                 __field(__u32, flags)
> +               __dynamic_array(unsigned char, res_name,
> +                               lkb->lkb_resource ? lkb->lkb_resource->res_length + 1 : namelen + 1)

I will send a v2 series for this. I think we should remove the
additional byte here and let the user handle it to parse it in some
way and add a null termination on its own (if necessary).
The array length in trace api is encoded in their trace UAPI/data
structure, we can't make it ending '\0' and make the array length
without the null termination. Or we add another field for the length
and have two lengths there, whereas one is -1 of the other... sounds
not right.

However..., I will change that again.

The user should not assume to have a '\0' terminated array here,
_whereas_ in dlm_rsb kernel the user can assume it... but can't assume
it's ascii code.

>         ),
>
>         TP_fast_assign(
> +               struct dlm_rsb *r;
> +               char *c;
> +
>                 __entry->ls_id = ls->ls_global_id;
>                 __entry->lkb_id = lkb->lkb_id;
>                 __entry->mode = mode;
>                 __entry->flags = flags;
> +
> +               r = lkb->lkb_resource;
> +               if (r)
> +                       memcpy(__get_dynamic_array(res_name), r->res_name,
> +                              __get_dynamic_array_len(res_name));
> +               else if (name)
> +                       memcpy(__get_dynamic_array(res_name), name,
> +                              __get_dynamic_array_len(res_name));
> +
> +               c = __get_dynamic_array(res_name);
> +               c[__get_dynamic_array_len(res_name) - 1] = '\0';

Hopefully we can remove this then...

>         ),
>
> -       TP_printk("ls_id=%u lkb_id=%x mode=%s flags=%s",
> +       TP_printk("ls_id=%u lkb_id=%x mode=%s flags=%s res_name=%s",
>                   __entry->ls_id, __entry->lkb_id,
>                   show_lock_mode(__entry->mode),
> -                 show_lock_flags(__entry->flags))
> +                 show_lock_flags(__entry->flags),
> +                 __print_hex_str(__get_dynamic_array(res_name),
> +                                 __get_dynamic_array_len(res_name)))

also wrong that it will always print the 00 byte at the end. :-/

- Alex

