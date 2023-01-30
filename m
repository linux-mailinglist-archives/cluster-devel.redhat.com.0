Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA6A681C8E
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 22:19:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675113569;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=J8R8gqwflB9m3b1tXXYr6aXLXAghFdW7OyzkuwsyOCM=;
	b=FdjRi1VasQJca3nmbk1l/TyjvzL9j+p1IZuZikVkDEZVXAPW+lshAJwZFuRCmHoMz8mxgY
	LNKLCZM3RqwaWBDTIpTBinwB3RrS51+cfUt5F55inh8FKOT4FK3dCNsfHQEEBNhoKtrr2N
	7uOAiuMlmaBIS2LLA8RqFi8pOGEZN04=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-332-2DIrY7NtMBGQX1yhLAzOMA-1; Mon, 30 Jan 2023 16:19:26 -0500
X-MC-Unique: 2DIrY7NtMBGQX1yhLAzOMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D0DC800B23;
	Mon, 30 Jan 2023 21:19:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E8CDA140EBF5;
	Mon, 30 Jan 2023 21:19:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 858D01946595;
	Mon, 30 Jan 2023 21:19:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6DAB11946589 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 21:19:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C745C15BAE; Mon, 30 Jan 2023 21:19:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85C80C15BAD
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 21:19:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A7931818E47
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 21:19:12 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-4lM9ybdBPNWWlB0ad7EEWw-1; Mon, 30 Jan 2023 16:19:11 -0500
X-MC-Unique: 4lM9ybdBPNWWlB0ad7EEWw-1
Received: by mail-ed1-f69.google.com with SMTP id
 s3-20020a50ab03000000b0049ec3a108beso9022607edc.7
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 13:19:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J8R8gqwflB9m3b1tXXYr6aXLXAghFdW7OyzkuwsyOCM=;
 b=XixpSFds1aVkSe61+MCvvgN3wXEGZg11vAJleGq48Du7bLb5IuGhMeK8TGErZZrOT3
 GsU2aMkGwyT2B96ia8dagdGUomSifE3wUELsvmpp6QpdooMebC1Xd1SMrPm4aEodv6jH
 Yl5ERWlqvGqHATzC0qZ+XHFUe3IDMCzgoHcgA9tmpY5gAolckGCeiJe8ZlHLwFiNyP6T
 L/40e3lFKw9t+iDYblZsCWw6oWN9ObqKHpshcQ2Xgcqm3++t2anteYXbtQMofqjvm9cv
 Ts3wi5HT+Vs5De5jQU9nA5MgDz3WoC3vX3lmkeob7iEJNzdNPVTNn2LTQWCxXfubrO+w
 m85g==
X-Gm-Message-State: AFqh2kqut9jyIpFwbRgtlflzdzNik3MDBmXOwG/lI0Pr6p6rx3Hl3sl4
 9t6PO06Q0oxLoBNXSruHe4ts7e3v5v/qzMGxLunzYwpOb0j9jOTeamnH3TwNnjmCtwUp+e5LVvm
 1UfJ2pVd4BTaIkvJTZ7jhwKWGM48pI/xeJtbKLA==
X-Received: by 2002:a17:906:601:b0:86c:3586:96f1 with SMTP id
 s1-20020a170906060100b0086c358696f1mr8445329ejb.137.1675113549967; 
 Mon, 30 Jan 2023 13:19:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt6owPJLnK3TFCwofzVpwfvXLbQgw3xAIWBZrQzGkG6E9ISgccynoVmLyIGu4JwzVUi8b3/3mGETen2FUpZOQM=
X-Received: by 2002:a17:906:601:b0:86c:3586:96f1 with SMTP id
 s1-20020a170906060100b0086c358696f1mr8445324ejb.137.1675113549759; Mon, 30
 Jan 2023 13:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20230130192437.3330300-1-aahringo@redhat.com>
 <20230130192437.3330300-8-aahringo@redhat.com>
In-Reply-To: <20230130192437.3330300-8-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 30 Jan 2023 16:18:58 -0500
Message-ID: <CAK-6q+hNB7s0hqO800vEeKd3ENEuKgXYxU8=ERH0z90oNG-1eQ@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH dlm-tool 8/8] dlm_controld: add time
 diff for state time intervals
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Mon, Jan 30, 2023 at 2:24 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch adds functionality to see how long a posix lock is alive or
> is in waiting or pending state. It can be used to filter out interesting
> locks which are stuck in e.g. waiting state to know that a user space
> process probably has contention on it. The logging information will
> printout additional lock information to do more search and find to get
> more information about it's corosync or kernel communication.
> ---
>  dlm_controld/plock.c | 48 ++++++++++++++++++++++++++++++--------------
>  1 file changed, 33 insertions(+), 15 deletions(-)
>
> diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
> index d83a79d2..20c2a1e9 100644
> --- a/dlm_controld/plock.c
> +++ b/dlm_controld/plock.c
> @@ -72,6 +72,7 @@ struct resource {
>
>  struct posix_lock {
>         struct list_head        list;      /* resource locks or waiters list */
> +       struct timeval          list_time;
>         uint32_t                pid;
>         uint64_t                owner;
>         uint64_t                start;
> @@ -83,6 +84,7 @@ struct posix_lock {
>
>  struct lock_waiter {
>         struct list_head        list;
> +       struct timeval          list_time;
>         uint32_t                flags;
>         struct dlm_plock_info   info;
>  };
> @@ -209,9 +211,11 @@ static uint64_t dt_usec(const struct timeval *start, const struct timeval *stop)
>  }
>
>  static void plock_print_lock_add_state(const struct lockspace *ls,
> -                                      const struct lock_waiter *w,
> +                                      struct lock_waiter *w,
>                                        const char *state)
>  {
> +       gettimeofday(&w->list_time, NULL);
> +
>         log_dlock(ls, "state: add %s %llx %llx-%llx %d/%u/%llx",
>                   state,
>                   (unsigned long long)w->info.number,
> @@ -225,13 +229,20 @@ static void plock_print_lock_clear_state(const struct lockspace *ls,
>                                          const struct lock_waiter *w,
>                                          const char *state)
>  {
> -       log_dlock(ls, "state: clear %s %llx %llx-%llx %d/%u/%llx",
> +       struct timeval now;
> +       uint64_t usec;
> +
> +       gettimeofday(&now, NULL);
> +       usec = dt_usec(&w->list_time, &now);
> +
> +       log_dlock(ls, "state: clear %s %llx %llx-%llx %d/%u/%llx %.3f",
>                   state,
>                   (unsigned long long)w->info.number,
>                   (unsigned long long)w->info.start,
>                   (unsigned long long)w->info.end,
>                   w->info.nodeid, w->info.pid,
> -                 (unsigned long long)w->info.owner);
> +                 (unsigned long long)w->info.owner,
> +                 usec * 1.e-6);
>  }
>
>  #define plock_print_add_waiter(ls, w) \
> @@ -245,23 +256,30 @@ static void plock_print_lock_clear_state(const struct lockspace *ls,
>         plock_print_lock_clear_state(ls, w, "pending")
>
>  static void plock_print_add_plock(const struct lockspace *ls,
> -                                 const struct posix_lock *plock)
> +                                 struct posix_lock *po)
>  {
> -       log_dlock(ls, "state: add plock NA %llx-%llx %d/%u/%llx",
> -                 (unsigned long long)plock->start,
> -                 (unsigned long long)plock->end,
> -                 plock->nodeid, plock->pid,
> -                 (unsigned long long)plock->owner);
> +       gettimeofday(&po->list_time, NULL);
> +       log_dlock(ls, "state: add plock %llx-%llx %d/%u/%llx %.3f",

removed "%.3f" for plock_print_add_plock(), it's only necessary for
clear. We probably need to add some format(printf, 2, 3) gcc attribute
to see such mistakes...

- Alex

