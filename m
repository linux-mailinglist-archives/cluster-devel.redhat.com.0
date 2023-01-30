Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B009681CA9
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 22:26:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675114012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=QTYEBDkKxfOvmFLsEPffokd79hSMSkPsi14bzTdvKCE=;
	b=UTZoyCoaDU2tnk65DVKY5f6MgaPFnE11lFRJNs24ZQaCVChoV6rQiTdowNASnd2k7wYvYa
	v3+XcYPHbRmnpE1+VDereyIYarVVxegEGwnrJKCuOFMHzNPAsgA5XK+i+QefCtviZQOkKu
	D97R/8LzBRDhxSWvzOhe810fhzKLnfA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-cju-OxTlNgSnWxPhnSTzjw-1; Mon, 30 Jan 2023 16:26:49 -0500
X-MC-Unique: cju-OxTlNgSnWxPhnSTzjw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D28C23C0D85C;
	Mon, 30 Jan 2023 21:26:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C1E1F492B00;
	Mon, 30 Jan 2023 21:26:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A53FF1946594;
	Mon, 30 Jan 2023 21:26:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B98BF1946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 21:26:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 84B88140EBF5; Mon, 30 Jan 2023 21:26:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CBFF1410ED9
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 21:26:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F2EC185A78B
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 21:26:47 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-6yOIGjB4MuStfnsU8dcV0Q-1; Mon, 30 Jan 2023 16:26:46 -0500
X-MC-Unique: 6yOIGjB4MuStfnsU8dcV0Q-1
Received: by mail-ed1-f72.google.com with SMTP id
 s3-20020a50ab03000000b0049ec3a108beso9032093edc.7
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 13:26:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QTYEBDkKxfOvmFLsEPffokd79hSMSkPsi14bzTdvKCE=;
 b=wCaeyKLNPMVac/YfeEqoIDddYE0i4v9Re0Rxfx3kWaSbWVQNEGUA1OwALhBcHK79jX
 YT9kOrYwmmZKTn/6THlAxOKeUa6vl07NtD1rV/U9Ro+QcL16AGd1Ab3fNP69bhVIFktK
 T3xpBU46TZmaUWZ7cXT3qte4vBgu2iCUl8apjICqWyBb4LH5OS1oKduIZ8a84PIuNj3x
 jifTu65YNjN6eHqkhrIKB8J3hXpBIvS0wlvl5/9MezVI4Tw8dNEq29rCOY7JKLkPPMaa
 HoQoLxyPegRZBAV3qYw2KOSLLXYuJQPYhS2fN5ES5VmoX2MxDPK/JrHE/yeQSVefy3GR
 5mvw==
X-Gm-Message-State: AFqh2kqkPOdSNNJ7V6FOdt3SqVM44ztTFqDNG/L0ryj5huRpDjIRT/B2
 Z8FN4HBrt2+abBiwcPoSaJ0cTHatbCVPlVRp3mbiKttQ2q5CKRiHIBsu4OF9L5BmwxnEAK5KPec
 9jI672mp3f9XT02jb/p33ZhwdVE9XaZXzT2u6Mw==
X-Received: by 2002:a17:906:3a5b:b0:870:baa6:676c with SMTP id
 a27-20020a1709063a5b00b00870baa6676cmr8159558ejf.132.1675114004966; 
 Mon, 30 Jan 2023 13:26:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsqXMmMF/gkLDnUMbqQO1L6ERDH0wv2z5IpbTgim/24AHBCwaGxjgZTmv+VDCrfpzxiyBXfR+S85yA0wL0bmKE=
X-Received: by 2002:a17:906:3a5b:b0:870:baa6:676c with SMTP id
 a27-20020a1709063a5b00b00870baa6676cmr8159554ejf.132.1675114004718; Mon, 30
 Jan 2023 13:26:44 -0800 (PST)
MIME-Version: 1.0
References: <20230130192437.3330300-1-aahringo@redhat.com>
 <20230130192437.3330300-6-aahringo@redhat.com>
In-Reply-To: <20230130192437.3330300-6-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 30 Jan 2023 16:26:33 -0500
Message-ID: <CAK-6q+hSED0iuheBmov1a08PpB+Zzt-yd+w65xXTN3icHTBR9A@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH dlm-tool 6/8] dlm_controld: log
 lock/pending/waiter state changes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Jan 30, 2023 at 2:24 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch will trace lock state changes of the used dlm posix locks. In
> combination with the plock logfile we can see state changes over time
> and follow posix locks and their state.
> ---
>  dlm_controld/dlm_daemon.h |   2 +-
>  dlm_controld/logging.c    |   2 +-
>  dlm_controld/plock.c      | 124 +++++++++++++++++++++++++++++---------
>  3 files changed, 97 insertions(+), 31 deletions(-)
>
> diff --git a/dlm_controld/dlm_daemon.h b/dlm_controld/dlm_daemon.h
> index c74f684a..9bf3f621 100644
> --- a/dlm_controld/dlm_daemon.h
> +++ b/dlm_controld/dlm_daemon.h
> @@ -220,7 +220,7 @@ EXTERN struct list_head run_ops;
>  #define LOG_PLOCK 0x00010000
>  #define LOG_NONE  0x00001111
>
> -void log_level(char *name_in, uint32_t level_in, const char *fmt, ...);
> +void log_level(const char *name_in, uint32_t level_in, const char *fmt, ...);
>
>  #define log_error(fmt, args...) log_level(NULL, LOG_ERR, fmt, ##args)
>  #define log_debug(fmt, args...) log_level(NULL, LOG_DEBUG, fmt, ##args)
> diff --git a/dlm_controld/logging.c b/dlm_controld/logging.c
> index 83de2da4..e71fe52c 100644
> --- a/dlm_controld/logging.c
> +++ b/dlm_controld/logging.c
> @@ -175,7 +175,7 @@ static void log_str_to_file(FILE *fp)
>         fflush(fp);
>  }
>
> -void log_level(char *name_in, uint32_t level_in, const char *fmt, ...)
> +void log_level(const char *name_in, uint32_t level_in, const char *fmt, ...)
>  {
>         va_list ap;
>         char name[NAME_ID_SIZE + 2];
> diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
> index 462c9212..77c043fd 100644
> --- a/dlm_controld/plock.c
> +++ b/dlm_controld/plock.c
> @@ -208,6 +208,62 @@ static uint64_t dt_usec(struct timeval *start, struct timeval *stop)
>         return dt;
>  }
>
> +static void plock_print_lock_add_state(const struct lockspace *ls,
> +                                      const struct lock_waiter *w,
> +                                      const char *state)
> +{
> +       log_dlock(ls, "state: add %s %llx %llx-%llx %d/%u/%llx",
> +                 state,
> +                 (unsigned long long)w->info.number,
> +                 (unsigned long long)w->info.start,
> +                 (unsigned long long)w->info.end,
> +                 w->info.nodeid, w->info.pid,
> +                 (unsigned long long)w->info.owner);
> +}
> +
> +static void plock_print_lock_clear_state(const struct lockspace *ls,
> +                                        const struct lock_waiter *w,
> +                                        const char *state)
> +{
> +       log_dlock(ls, "state: clear %s %llx %llx-%llx %d/%u/%llx",
> +                 state,
> +                 (unsigned long long)w->info.number,
> +                 (unsigned long long)w->info.start,
> +                 (unsigned long long)w->info.end,
> +                 w->info.nodeid, w->info.pid,
> +                 (unsigned long long)w->info.owner);
> +}
> +
> +#define plock_print_add_waiter(ls, w) \
> +       plock_print_lock_add_state(ls, w, "waiter")
> +#define plock_print_clear_waiter(ls, w) \
> +       plock_print_lock_clear_state(ls, w, "waiter")
> +
> +#define plock_print_add_pending(ls, w) \
> +       plock_print_lock_add_state(ls, w, "pending")
> +#define plock_print_clear_pending(ls, w) \
> +       plock_print_lock_clear_state(ls, w, "pending")
> +
> +static void plock_print_add_plock(const struct lockspace *ls,
> +                                 const struct posix_lock *plock)

changes *plock to *po, because it's commonly used as *po in other
parts of the code for a struct posix_lock...

> +{
> +       log_dlock(ls, "state: add plock NA %llx-%llx %d/%u/%llx",

removed this NA stuff, there is one attribute which plock doesn't have
but waiter has and I did this as placeholder... it's removed in 8/8 so
I drop to add it.

> +                 (unsigned long long)plock->start,
> +                 (unsigned long long)plock->end,
> +                 plock->nodeid, plock->pid,
> +                 (unsigned long long)plock->owner);
> +}
> +
> +static void plock_print_del_plock(const struct lockspace *ls,
> +                                 const struct posix_lock *plock)
> +{
> +       log_dlock(ls, "state: del plock NA %llx-%llx %d/%u/%llx",
> +                 (unsigned long long)plock->start,
> +                 (unsigned long long)plock->end,
> +                 plock->nodeid, plock->pid,
> +                 (unsigned long long)plock->owner);
> +}

same here.

- Alex

