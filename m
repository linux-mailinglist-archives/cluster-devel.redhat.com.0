Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2D26A9B53
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Mar 2023 17:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677859394;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RtnUjDVDJNknSohokXcCrjfyQ3glDLfRfG4chmiMWno=;
	b=ca6p4IGv5M5QVhLly31k/4bn+doHkFXIAjPd+ap8H9fMhI0gX/kYo4a3JR83lKMQtQVQTH
	qCJubcEPrfHjhfjWCNJC+M3rgfx/roNe1V+1GTe+yF6D2iiGVRx+NMx5B9kjt57uKjKgDH
	a1NPnEHFlrem3BxtgZV48N8cn6Fs+JU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-UAGrmiCeMx6Oq5QMsHJLZw-1; Fri, 03 Mar 2023 11:03:09 -0500
X-MC-Unique: UAGrmiCeMx6Oq5QMsHJLZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 209C685CAB4;
	Fri,  3 Mar 2023 16:03:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDB1FC16029;
	Fri,  3 Mar 2023 16:03:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A1C3919452D0;
	Fri,  3 Mar 2023 16:03:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E864D19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  3 Mar 2023 16:03:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA3F540BC781; Fri,  3 Mar 2023 16:03:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D15BC40C10FA
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 16:02:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EDE085D061
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 16:02:53 +0000 (UTC)
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-AUoJQ2zBO7iASjE7bL74hA-1; Fri, 03 Mar 2023 11:02:52 -0500
X-MC-Unique: AUoJQ2zBO7iASjE7bL74hA-1
Received: by mail-pg1-f197.google.com with SMTP id
 n66-20020a634045000000b004e8c27fa528so868847pga.17
 for <cluster-devel@redhat.com>; Fri, 03 Mar 2023 08:02:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677859370;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RtnUjDVDJNknSohokXcCrjfyQ3glDLfRfG4chmiMWno=;
 b=gAnP6cKEBUG32ziqb3yHVaVYWKV9fnjKnauEJLYBCBeaViKkmDBcm7yOnw+kH17L3v
 FnaItJc+TCpV7zzXQNPl7kfeCtvLMjDu9QuUw/2iQDUT047gIgMmjJfDZP0wez4Fe2mo
 KsLk24UXW3es/HBbQCcjENvXlf3JBv3wNSF8QLk7ydyS9vz62FW7UNU3NfcVGsupfW3H
 iT+mr8AVNFNWqM3JCJuF2cv3E8FGvFNwADaM6kpaHzT8urDRu9dEEE4YoMa8RqJ58D/Q
 c4WMgluDgxBK9HKidHdrU1Ys8X8himVG3Ysl1xiU7RAWdCgh3ScASJ4so3khrrX942Fn
 oB0Q==
X-Gm-Message-State: AO0yUKVe2HRNccl7UQ1V161E33u0Gz2lU9ijhaMGP7JWOrWegMavMg9K
 /6+zx/hniwxG2XFXcZ9almm9WtxQzdOPyF/n8udLLlxo/vPLLZXed5jqve/sfanLMHFFFF18Eiv
 L9y/mgyZ0rSldzc8Ylo+cUvd13Y5sZBQ+TnVl41EaA6A=
X-Received: by 2002:a17:902:f812:b0:19c:140d:aad7 with SMTP id
 ix18-20020a170902f81200b0019c140daad7mr888938plb.4.1677859370625; 
 Fri, 03 Mar 2023 08:02:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9IS0nVdSkcmAzkutw41Cm7ccPwkpKAMyhqpz7D859NMjnY9tXORpc+cjemjVk/FPMHQ3UpbW6RodnsutDhu4Y=
X-Received: by 2002:a17:902:f812:b0:19c:140d:aad7 with SMTP id
 ix18-20020a170902f81200b0019c140daad7mr888924plb.4.1677859370298; Fri, 03 Mar
 2023 08:02:50 -0800 (PST)
MIME-Version: 1.0
References: <20230302171441.1509914-13-aahringo@redhat.com>
 <20230303133845.801743-1-agruenba@redhat.com>
 <CAK-6q+gmTae=5xj5Noomy=aVRfwAQgD1C2WJ1=TYEjPWA76cMw@mail.gmail.com>
 <20230303155255.807862-1-agruenba@redhat.com>
In-Reply-To: <20230303155255.807862-1-agruenba@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 3 Mar 2023 17:02:38 +0100
Message-ID: <CAHc6FU4WbLVORRjf2PEwGi-yg9-abpAx7uztq-z43SU6eXqh0g@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH dlm-tool 13/14] dlm_controld: plock log
 lock state
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 3, 2023 at 4:53=E2=80=AFPM Andreas Gruenbacher <agruenba@redhat=
.com> wrote:
> diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
> index 39bdd1f6..588bcaaa 100644
> --- a/dlm_controld/plock.c
> +++ b/dlm_controld/plock.c
> @@ -8,6 +8,7 @@
>
>  #include "dlm_daemon.h"
>  #include <linux/dlm_plock.h>
> +#include <sys/sdt.h>
>
>  /* FIXME: remove this once everyone is using the version of
>   * dlm_plock.h which defines it */
> @@ -211,6 +212,11 @@ static uint64_t dt_usec(const struct timeval *start,=
 const struct timeval *stop)
>  static void plock_print_start_waiter(const struct lockspace *ls,
>                                      struct lock_waiter *w)
>  {
> +       const struct dlm_plock_info *info =3D &w->info;
> +
> +       DTRACE_PROBE7(dlm_controld, plock_wait_begin, info->number, w, in=
fo->start,
> +                     info->end, info->nodeid, info->pid, info->owner);
> +
>         log_plock(ls, "state waiter start %llx %p %llx-%llx %d/%u/%llx",
>                   (unsigned long long)w->info.number,
>                   w,

An additional question I have about those events is which information
to log. We need to be able to identify which inode the request is for
(info->number), the locking range (info->start and info->end), whether
it is read or write lock, and which context in the kernel the request
refers to (this seems to be info->owner, but I'm not entirely sure
about that). The pid may be interesting as well, but are w or
info->nodeid really useful? We should try to avoid exposing
unnecessary implementation details like the addresses of objects
inside dlm_controld.

> @@ -223,6 +229,10 @@ static void plock_print_start_waiter(const struct lo=
ckspace *ls,
>  static void plock_print_end_waiter(const struct lockspace *ls,
>                                    const struct lock_waiter *w)
>  {
> +       const struct dlm_plock_info *info =3D &w->info;
> +
> +       DTRACE_PROBE2(dlm_controld, plock_wait_end, info->number, w);
> +
>         log_plock(ls, "state waiter end %llx %p",
>                   (unsigned long long)w->info.number, w);
>  }
> @@ -230,6 +240,9 @@ static void plock_print_end_waiter(const struct locks=
pace *ls,
>  static void plock_print_start_plock(const struct lockspace *ls, uint64_t=
 number,
>                                     const struct posix_lock *po)
>  {
> +       DTRACE_PROBE8(dlm_controld, plock_lock_begin, number, po, po->ex,=
 po->start,
> +                     po->end, po->nodeid, po->pid, po->owner);
> +
>         log_plock(ls, "state plock start %llx %p %s %llx-%llx %d/%u/%llx"=
,
>                   (unsigned long long)number,
>                   po,
> @@ -243,6 +256,8 @@ static void plock_print_start_plock(const struct lock=
space *ls, uint64_t number,
>  static void plock_print_end_plock(const struct lockspace *ls, uint64_t n=
umber,
>                                   const struct posix_lock *po)
>  {
> +       DTRACE_PROBE1(dlm_controld, pock_lock_end, po);
> +
>         log_plock(ls, "state plock end %llx %p",
>                   (unsigned long long)number, po);
>  }
> --
> 2.39.0
>

Thanks,
Andreas

