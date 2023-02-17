Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B5369A35F
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Feb 2023 02:25:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676597149;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=2KCcTtkttjSPWCZ8J2pIM8FuhqtDwA8g92ySmC4Fckk=;
	b=SDih0Y19gjnDiLNZnhCjasSXLPyy5o/B2Hyg2i5QOgSiWfUJ7u3+VJImQwuWSaAOCNjfaY
	SzFc2AKBYz45dpTyNF+jLD09PER6ilK4bW4KPqoFTsWzhLzaZFHjbQr9oxXP1VXUutT73L
	8P+vWoatUBkNBk1zeqC30j/tuxf65QY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-zBqOPqYoMB6jo0Ed9xyxyQ-1; Thu, 16 Feb 2023 20:25:45 -0500
X-MC-Unique: zBqOPqYoMB6jo0Ed9xyxyQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91F531C05AF6;
	Fri, 17 Feb 2023 01:25:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 38515492B15;
	Fri, 17 Feb 2023 01:25:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EA5CF194658D;
	Fri, 17 Feb 2023 01:25:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B26591946588 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 17 Feb 2023 01:25:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8ED50400D79D; Fri, 17 Feb 2023 01:25:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 874B240C945A
 for <cluster-devel@redhat.com>; Fri, 17 Feb 2023 01:25:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 667F21C05AF4
 for <cluster-devel@redhat.com>; Fri, 17 Feb 2023 01:25:42 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-2Ws7qvyMNamOJaaABeTHHg-1; Thu, 16 Feb 2023 20:25:41 -0500
X-MC-Unique: 2Ws7qvyMNamOJaaABeTHHg-1
Received: by mail-ed1-f69.google.com with SMTP id
 s3-20020a50ab03000000b0049ec3a108beso3741606edc.7
 for <cluster-devel@redhat.com>; Thu, 16 Feb 2023 17:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2KCcTtkttjSPWCZ8J2pIM8FuhqtDwA8g92ySmC4Fckk=;
 b=7dtKG/N6nc8A8TWvZ5gb2Wy67D/uBAIsghaDr1qQkG4oYQLfyhB10kwuiOayaKlZui
 lwb0ynOoq52JTcJ0b9tJtBb/NQLq8+/YZY0Df3UUfrqxgfuFPFaccw7O1/pEL6TpAHsz
 p1AAg3olFXpTnIl7EL+a4HGR6WsLN1FqcfD6YIEWw//7vJpgYySXgvDCfi36QiRmA/CD
 DuM83ExcDInBS/WjpH2lkhSgyNSgKmbkqE9QAfNufCzW37nqcnvzDKb4MXDFg3INgKDh
 vqCDLxG9DTE6o4lxM62HSh56s8JBWbF6zhNUFVUpSrJdhRVv3A6TNVqBaKqIxi75a/UJ
 Zw3w==
X-Gm-Message-State: AO0yUKWppLdBc3sHPKg/D6Z7wn3BAbs8aMVuvVuVHGQNCPpIzjcoRSVi
 UVti8XwB4rSDoCb8z3Ymgb5Sa4kw8ncdGZHgXEywm3y8LkOzgw6CoDXtqfa2w1BB70HqnQmaK+5
 /krSiY+ZhGzzhJn/LA62GyIQqT+nN3uD3pK38wkDOA3A=
X-Received: by 2002:a17:906:2495:b0:8b1:78b8:4207 with SMTP id
 e21-20020a170906249500b008b178b84207mr1077974ejb.3.1676597139216; 
 Thu, 16 Feb 2023 17:25:39 -0800 (PST)
X-Google-Smtp-Source: AK7set8dT6AxwGcTzOCGlSkjNuv2pHXbVlEaOBWXVPeJn/CGCPJ5fhVA6WB+3CL+BeTPfFjmBqGPQPYE3idEGpP+4gM=
X-Received: by 2002:a17:906:2495:b0:8b1:78b8:4207 with SMTP id
 e21-20020a170906249500b008b178b84207mr1077963ejb.3.1676597138769; Thu, 16 Feb
 2023 17:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20230217010620.3273276-1-aahringo@redhat.com>
In-Reply-To: <20230217010620.3273276-1-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 16 Feb 2023 20:25:27 -0500
Message-ID: <CAK-6q+hRnvSJOSvwv6VjbEozf5fQkv+ONL=3VHgbgQUn3GMHqw@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH dlm/next 1/2] fs: dlm: move internal non
 shared flags to bitops
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

On Thu, Feb 16, 2023 at 8:06 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch moves all upper bits of lkb->lkb_flags to lkb->lkb_insflags,
> except DLM_IFL_STUB_MS which needs a special handling. Those upper bits
> are non shared internal flags which should be separated from
> lkb->lkb_flags because they get read, masked and assigned again in
> a non atomic way e.g. in receive_flags(). Due concurrent possible flag
> like dlm_lock()/unlock() or user device handling changes could be
> reverted. When moving to lkb->lkb_insflags we converted all bit
> operations to atomic set/test/clear bit operation functions.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/dlm_internal.h      |  32 +++++------
>  fs/dlm/lock.c              | 114 ++++++++++++++++++-------------------
>  fs/dlm/lockspace.c         |   2 +-
>  fs/dlm/recover.c           |   2 +-
>  fs/dlm/user.c              |  10 ++--
>  include/trace/events/dlm.h |   7 ---
>  6 files changed, 79 insertions(+), 88 deletions(-)
>
> diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
> index b967b4d7d55d..ce0a15858ae3 100644
> --- a/fs/dlm/dlm_internal.h
> +++ b/fs/dlm/dlm_internal.h
> @@ -197,26 +197,25 @@ struct dlm_args {
>  #define DLM_LKSTS_GRANTED      2
>  #define DLM_LKSTS_CONVERT      3
>
> -/* lkb_flags */
> -
> -#define DLM_IFL_MSTCPY         0x00010000
> -#define DLM_IFL_RESEND         0x00020000
> -#define DLM_IFL_DEAD           0x00040000
> -#define DLM_IFL_OVERLAP_UNLOCK  0x00080000
> -#define DLM_IFL_OVERLAP_CANCEL  0x00100000
> -#define DLM_IFL_ENDOFLIFE      0x00200000
> -#ifdef CONFIG_DLM_DEPRECATED_API
> -#define DLM_IFL_WATCH_TIMEWARN 0x00400000
> -#define DLM_IFL_TIMEOUT_CANCEL 0x00800000
> -#endif
> -#define DLM_IFL_DEADLOCK_CANCEL        0x01000000
> -#define DLM_IFL_STUB_MS                0x02000000 /* magic number for m_flags */
> -
>  /* lkb_insflags */
>
>  #define DLM_IFLNS_CB_PENDING   0
> +#define DLM_IFLNS_MSTCPY       1
> +#define DLM_IFLNS_RESEND       2
> +#define DLM_IFLNS_DEAD         3
> +#define DLM_IFLNS_OVERLAP_UNLOCK 4
> +#define DLM_IFLNS_OVERLAP_CANCEL 5
> +#define DLM_IFLNS_ENDOFLIFE    6
> +#ifdef CONFIG_DLM_DEPRECATED_API
> +#define DLM_IFLNS_WATCH_TIMEWARN 7
> +#define DLM_IFLNS_TIMEOUT_CANCEL 8
> +#endif
> +#define DLM_IFLNS_DEADLOCK_CANCEL 9
> +
>
> -/* least significant 2 bytes are message changed, they are full transmitted
> +/* lkb_flags
> + *
> + * least significant 2 bytes are message changed, they are full transmitted
>   * but at receive side only the 2 bytes LSB will be set.
>   *
>   * Even wireshark dlm dissector does only evaluate the lower bytes and note
> @@ -226,6 +225,7 @@ struct dlm_args {
>   */
>  #define DLM_IFL_USER           0x00000001
>  #define DLM_IFL_ORPHAN         0x00000002
> +#define DLM_IFL_STUB_MS                0x00010000
>
>  #define DLM_CB_CAST            0x00000001
>  #define DLM_CB_BAST            0x00000002
> diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> index e1adfa5aed05..b73f809f4012 100644
> --- a/fs/dlm/lock.c
> +++ b/fs/dlm/lock.c
> @@ -250,12 +250,12 @@ static inline int is_remote(struct dlm_rsb *r)
>
>  static inline int is_process_copy(struct dlm_lkb *lkb)
>  {
> -       return (lkb->lkb_nodeid && !(lkb->lkb_flags & DLM_IFL_MSTCPY));
> +       return lkb->lkb_nodeid && !test_bit(DLM_IFLNS_MSTCPY, &lkb->lkb_insflags);
>  }
>
>  static inline int is_master_copy(struct dlm_lkb *lkb)
>  {
> -       return (lkb->lkb_flags & DLM_IFL_MSTCPY) ? 1 : 0;
> +       return test_bit(DLM_IFLNS_MSTCPY, &lkb->lkb_insflags);
>  }
>
>  static inline int middle_conversion(struct dlm_lkb *lkb)
> @@ -273,18 +273,18 @@ static inline int down_conversion(struct dlm_lkb *lkb)
>
>  static inline int is_overlap_unlock(struct dlm_lkb *lkb)
>  {
> -       return lkb->lkb_flags & DLM_IFL_OVERLAP_UNLOCK;
> +       return test_bit(DLM_IFLNS_OVERLAP_UNLOCK, &lkb->lkb_insflags);
>  }
>
>  static inline int is_overlap_cancel(struct dlm_lkb *lkb)
>  {
> -       return lkb->lkb_flags & DLM_IFL_OVERLAP_CANCEL;
> +       return test_bit(DLM_IFLNS_OVERLAP_CANCEL, &lkb->lkb_insflags);
>  }
>
>  static inline int is_overlap(struct dlm_lkb *lkb)
>  {
> -       return (lkb->lkb_flags & (DLM_IFL_OVERLAP_UNLOCK |
> -                                 DLM_IFL_OVERLAP_CANCEL));
> +       return test_bit(DLM_IFLNS_OVERLAP_UNLOCK, &lkb->lkb_insflags) ||
> +              test_bit(DLM_IFLNS_OVERLAP_CANCEL, &lkb->lkb_insflags);
>  }
>
>  static void queue_cast(struct dlm_rsb *r, struct dlm_lkb *lkb, int rv)
> @@ -299,16 +299,12 @@ static void queue_cast(struct dlm_rsb *r, struct dlm_lkb *lkb, int rv)
>  #ifdef CONFIG_DLM_DEPRECATED_API
>         /* if the operation was a cancel, then return -DLM_ECANCEL, if a
>            timeout caused the cancel then return -ETIMEDOUT */
> -       if (rv == -DLM_ECANCEL && (lkb->lkb_flags & DLM_IFL_TIMEOUT_CANCEL)) {
> -               lkb->lkb_flags &= ~DLM_IFL_TIMEOUT_CANCEL;
> +       if (rv == -DLM_ECANCEL && test_and_clear_bit(DLM_IFLNS_TIMEOUT_CANCEL, &lkb->lkb_insflags))
>                 rv = -ETIMEDOUT;
> -       }
>  #endif
>
> -       if (rv == -DLM_ECANCEL && (lkb->lkb_flags & DLM_IFL_DEADLOCK_CANCEL)) {
> -               lkb->lkb_flags &= ~DLM_IFL_DEADLOCK_CANCEL;
> +       if (rv == -DLM_ECANCEL && test_and_clear_bit(DLM_IFLNS_DEADLOCK_CANCEL, &lkb->lkb_insflags))
>                 rv = -EDEADLK;
> -       }
>
>         dlm_add_cb(lkb, DLM_CB_CAST, lkb->lkb_grmode, rv, lkb->lkb_sbflags);
>  }
> @@ -1434,10 +1430,10 @@ static int add_to_waiters(struct dlm_lkb *lkb, int mstype, int to_nodeid)
>         if (lkb->lkb_wait_type || is_overlap_cancel(lkb)) {
>                 switch (mstype) {
>                 case DLM_MSG_UNLOCK:
> -                       lkb->lkb_flags |= DLM_IFL_OVERLAP_UNLOCK;
> +                       set_bit(DLM_IFLNS_OVERLAP_UNLOCK, &lkb->lkb_insflags);
>                         break;
>                 case DLM_MSG_CANCEL:
> -                       lkb->lkb_flags |= DLM_IFL_OVERLAP_CANCEL;
> +                       set_bit(DLM_IFLNS_OVERLAP_CANCEL, &lkb->lkb_insflags);
>                         break;
>                 default:
>                         error = -EBUSY;
> @@ -1481,16 +1477,16 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
>         struct dlm_ls *ls = lkb->lkb_resource->res_ls;
>         int overlap_done = 0;
>
> -       if (is_overlap_unlock(lkb) && (mstype == DLM_MSG_UNLOCK_REPLY)) {
> +       if (mstype == DLM_MSG_UNLOCK_REPLY &&
> +           test_and_clear_bit(DLM_IFLNS_OVERLAP_UNLOCK, &lkb->lkb_insflags)) {
>                 log_debug(ls, "remwait %x unlock_reply overlap", lkb->lkb_id);
> -               lkb->lkb_flags &= ~DLM_IFL_OVERLAP_UNLOCK;
>                 overlap_done = 1;
>                 goto out_del;
>         }
>
> -       if (is_overlap_cancel(lkb) && (mstype == DLM_MSG_CANCEL_REPLY)) {
> +       if (mstype == DLM_MSG_CANCEL_REPLY &&
> +           test_and_clear_bit(DLM_IFLNS_OVERLAP_CANCEL, &lkb->lkb_insflags)) {
>                 log_debug(ls, "remwait %x cancel_reply overlap", lkb->lkb_id);
> -               lkb->lkb_flags &= ~DLM_IFL_OVERLAP_CANCEL;
>                 overlap_done = 1;
>                 goto out_del;
>         }
> @@ -1515,11 +1511,11 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
>
>         if ((mstype == DLM_MSG_CONVERT_REPLY) &&
>             (lkb->lkb_wait_type == DLM_MSG_CONVERT) &&
> -           is_overlap_cancel(lkb) && ms && !ms->m_result) {
> +           ms && !ms->m_result && test_and_clear_bit(DLM_IFLNS_OVERLAP_CANCEL,
> +                                                     &lkb->lkb_insflags)) {
>                 log_debug(ls, "remwait %x convert_reply zap overlap_cancel",
>                           lkb->lkb_id);
>                 lkb->lkb_wait_type = 0;
> -               lkb->lkb_flags &= ~DLM_IFL_OVERLAP_CANCEL;
>                 lkb->lkb_wait_count--;
>                 unhold_lkb(lkb);
>                 goto out_del;
> @@ -1554,7 +1550,7 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
>
>         DLM_ASSERT(lkb->lkb_wait_count, dlm_print_lkb(lkb););
>
> -       lkb->lkb_flags &= ~DLM_IFL_RESEND;
> +       clear_bit(DLM_IFLNS_RESEND, &lkb->lkb_insflags);
>         lkb->lkb_wait_count--;
>         if (!lkb->lkb_wait_count)
>                 list_del_init(&lkb->lkb_wait_reply);
> @@ -1745,7 +1741,7 @@ static void add_timeout(struct dlm_lkb *lkb)
>
>         if (test_bit(LSFL_TIMEWARN, &ls->ls_flags) &&
>             !(lkb->lkb_exflags & DLM_LKF_NODLCKWT)) {
> -               lkb->lkb_flags |= DLM_IFL_WATCH_TIMEWARN;
> +               set_bit(DLM_IFLNS_WATCH_TIMEWARN, &lkb->lkb_insflags);
>                 goto add_it;
>         }
>         if (lkb->lkb_exflags & DLM_LKF_TIMEOUT)
> @@ -1801,7 +1797,7 @@ void dlm_scan_timeout(struct dlm_ls *ls)
>                             wait_us >= (iter->lkb_timeout_cs * 10000))
>                                 do_cancel = 1;
>
> -                       if ((iter->lkb_flags & DLM_IFL_WATCH_TIMEWARN) &&
> +                       if (test_bit(DLM_IFLNS_WATCH_TIMEWARN, &iter->lkb_insflags) &&
>                             wait_us >= dlm_config.ci_timewarn_cs * 10000)
>                                 do_warn = 1;
>
> @@ -1822,7 +1818,7 @@ void dlm_scan_timeout(struct dlm_ls *ls)
>
>                 if (do_warn) {
>                         /* clear flag so we only warn once */
> -                       lkb->lkb_flags &= ~DLM_IFL_WATCH_TIMEWARN;
> +                       clear_bit(DLM_IFLNS_WATCH_TIMEWARN, &lkb->lkb_insflags);
>                         if (!(lkb->lkb_exflags & DLM_LKF_TIMEOUT))
>                                 del_timeout(lkb);
>                         dlm_timeout_warn(lkb);
> @@ -1831,8 +1827,8 @@ void dlm_scan_timeout(struct dlm_ls *ls)
>                 if (do_cancel) {
>                         log_debug(ls, "timeout cancel %x node %d %s",
>                                   lkb->lkb_id, lkb->lkb_nodeid, r->res_name);
> -                       lkb->lkb_flags &= ~DLM_IFL_WATCH_TIMEWARN;
> -                       lkb->lkb_flags |= DLM_IFL_TIMEOUT_CANCEL;
> +                       clear_bit(DLM_IFLNS_WATCH_TIMEWARN, &lkb->lkb_insflags);
> +                       set_bit(DLM_IFLNS_TIMEOUT_CANCEL, &lkb->lkb_insflags);
>                         del_timeout(lkb);
>                         _cancel_lock(r, lkb);
>                 }
> @@ -2830,7 +2826,7 @@ static int validate_lock_args(struct dlm_ls *ls, struct dlm_lkb *lkb,
>                         goto out;
>
>                 rv = -EINVAL;
> -               if (lkb->lkb_flags & DLM_IFL_MSTCPY)
> +               if (test_bit(DLM_IFLNS_MSTCPY, &lkb->lkb_insflags))
>                         goto out;
>
>                 if (args->flags & DLM_LKF_QUECVT &&
> @@ -2908,7 +2904,7 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
>         }
>
>         rv = -EINVAL;
> -       if (lkb->lkb_flags & DLM_IFL_MSTCPY) {
> +       if (test_bit(DLM_IFLNS_MSTCPY, &lkb->lkb_insflags)) {
>                 log_error(ls, "unlock on MSTCPY %x", lkb->lkb_id);
>                 dlm_print_lkb(lkb);
>                 goto out;
> @@ -2919,7 +2915,7 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
>          * locks; return same error as if the lkid had not been found at all
>          */
>
> -       if (lkb->lkb_flags & DLM_IFL_ENDOFLIFE) {
> +       if (test_bit(DLM_IFLNS_ENDOFLIFE, &lkb->lkb_insflags)) {
>                 log_debug(ls, "unlock on ENDOFLIFE %x", lkb->lkb_id);
>                 rv = -ENOENT;
>                 goto out;
> @@ -2937,8 +2933,8 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
>                 /* don't let scand try to do a cancel */
>                 del_timeout(lkb);
>
> -               if (lkb->lkb_flags & DLM_IFL_RESEND) {
> -                       lkb->lkb_flags |= DLM_IFL_OVERLAP_CANCEL;
> +               if (test_bit(DLM_IFLNS_RESEND, &lkb->lkb_insflags)) {
> +                       set_bit(DLM_IFLNS_OVERLAP_CANCEL, &lkb->lkb_insflags);
>                         rv = -EBUSY;
>                         goto out;
>                 }
> @@ -2953,7 +2949,7 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
>                 switch (lkb->lkb_wait_type) {
>                 case DLM_MSG_LOOKUP:
>                 case DLM_MSG_REQUEST:
> -                       lkb->lkb_flags |= DLM_IFL_OVERLAP_CANCEL;
> +                       set_bit(DLM_IFLNS_OVERLAP_CANCEL, &lkb->lkb_insflags);
>                         rv = -EBUSY;
>                         goto out;
>                 case DLM_MSG_UNLOCK:
> @@ -2978,8 +2974,8 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
>                 /* don't let scand try to do a cancel */
>                 del_timeout(lkb);
>
> -               if (lkb->lkb_flags & DLM_IFL_RESEND) {
> -                       lkb->lkb_flags |= DLM_IFL_OVERLAP_UNLOCK;
> +               if (test_bit(DLM_IFLNS_RESEND, &lkb->lkb_insflags)) {
> +                       set_bit(DLM_IFLNS_OVERLAP_UNLOCK, &lkb->lkb_insflags);
>                         rv = -EBUSY;
>                         goto out;
>                 }
> @@ -2987,7 +2983,7 @@ static int validate_unlock_args(struct dlm_lkb *lkb, struct dlm_args *args)
>                 switch (lkb->lkb_wait_type) {
>                 case DLM_MSG_LOOKUP:
>                 case DLM_MSG_REQUEST:
> -                       lkb->lkb_flags |= DLM_IFL_OVERLAP_UNLOCK;
> +                       set_bit(DLM_IFLNS_OVERLAP_UNLOCK, &lkb->lkb_insflags);
>                         rv = -EBUSY;
>                         goto out;
>                 case DLM_MSG_UNLOCK:
> @@ -4016,7 +4012,7 @@ static int receive_request(struct dlm_ls *ls, struct dlm_message *ms)
>                 goto fail;
>
>         receive_flags(lkb, ms);
> -       lkb->lkb_flags |= DLM_IFL_MSTCPY;
> +       set_bit(DLM_IFLNS_MSTCPY, &lkb->lkb_insflags);
>         error = receive_request_args(ls, lkb, ms);
>         if (error) {
>                 __put_lkb(ls, lkb);
> @@ -4496,20 +4492,20 @@ static int receive_request_reply(struct dlm_ls *ls, struct dlm_message *ms)
>                           lkb->lkb_id, result);
>         }
>
> -       if (is_overlap_unlock(lkb) && (result == 0 || result == -EINPROGRESS)) {
> +       if ((result == 0 || result == -EINPROGRESS) &&
> +           test_and_clear_bit(DLM_IFLNS_OVERLAP_UNLOCK, &lkb->lkb_insflags)) {
>                 log_debug(ls, "receive_request_reply %x result %d unlock",
>                           lkb->lkb_id, result);
> -               lkb->lkb_flags &= ~DLM_IFL_OVERLAP_UNLOCK;
> -               lkb->lkb_flags &= ~DLM_IFL_OVERLAP_CANCEL;
> +               clear_bit(DLM_IFLNS_OVERLAP_CANCEL, &lkb->lkb_insflags);
>                 send_unlock(r, lkb);
> -       } else if (is_overlap_cancel(lkb) && (result == -EINPROGRESS)) {
> +       } else if ((result == -EINPROGRESS) &&
> +                  test_and_clear_bit(DLM_IFLNS_OVERLAP_CANCEL, &lkb->lkb_insflags)) {
>                 log_debug(ls, "receive_request_reply %x cancel", lkb->lkb_id);
> -               lkb->lkb_flags &= ~DLM_IFL_OVERLAP_UNLOCK;
> -               lkb->lkb_flags &= ~DLM_IFL_OVERLAP_CANCEL;
> +               clear_bit(DLM_IFLNS_OVERLAP_UNLOCK, &lkb->lkb_insflags);
>                 send_cancel(r, lkb);
>         } else {
> -               lkb->lkb_flags &= ~DLM_IFL_OVERLAP_CANCEL;
> -               lkb->lkb_flags &= ~DLM_IFL_OVERLAP_UNLOCK;
> +               clear_bit(DLM_IFLNS_OVERLAP_CANCEL, &lkb->lkb_insflags);
> +               clear_bit(DLM_IFLNS_OVERLAP_UNLOCK, &lkb->lkb_insflags);
>         }
>   out:
>         unlock_rsb(r);
> @@ -5023,7 +5019,7 @@ static void recover_convert_waiter(struct dlm_ls *ls, struct dlm_lkb *lkb,
>                 unhold_lkb(lkb);
>
>         } else if (lkb->lkb_rqmode >= lkb->lkb_grmode) {
> -               lkb->lkb_flags |= DLM_IFL_RESEND;
> +               set_bit(DLM_IFLNS_RESEND, &lkb->lkb_insflags);
>         }
>
>         /* lkb->lkb_rqmode < lkb->lkb_grmode shouldn't happen since down
> @@ -5087,7 +5083,7 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
>                    resent after recovery is done */
>
>                 if (lkb->lkb_wait_type == DLM_MSG_LOOKUP) {
> -                       lkb->lkb_flags |= DLM_IFL_RESEND;
> +                       set_bit(DLM_IFLNS_RESEND, &lkb->lkb_insflags);
>                         continue;
>                 }
>
> @@ -5123,7 +5119,7 @@ void dlm_recover_waiters_pre(struct dlm_ls *ls)
>                 switch (wait_type) {
>
>                 case DLM_MSG_REQUEST:
> -                       lkb->lkb_flags |= DLM_IFL_RESEND;
> +                       set_bit(DLM_IFLNS_RESEND, &lkb->lkb_insflags);
>                         break;
>
>                 case DLM_MSG_CONVERT:
> @@ -5168,7 +5164,7 @@ static struct dlm_lkb *find_resend_waiter(struct dlm_ls *ls)
>
>         mutex_lock(&ls->ls_waiters_mutex);
>         list_for_each_entry(iter, &ls->ls_waiters, lkb_wait_reply) {
> -               if (iter->lkb_flags & DLM_IFL_RESEND) {
> +               if (test_bit(DLM_IFLNS_RESEND, &iter->lkb_insflags)) {
>                         hold_lkb(iter);
>                         lkb = iter;
>                         break;
> @@ -5217,8 +5213,10 @@ int dlm_recover_waiters_post(struct dlm_ls *ls)
>                 lock_rsb(r);
>
>                 mstype = lkb->lkb_wait_type;
> -               oc = is_overlap_cancel(lkb);
> -               ou = is_overlap_unlock(lkb);
> +               oc = test_and_clear_bit(DLM_IFLNS_OVERLAP_UNLOCK,
> +                                       &lkb->lkb_insflags);
> +               ou = test_and_clear_bit(DLM_IFLNS_OVERLAP_CANCEL,
> +                                       &lkb->lkb_insflags);

oc is cancel, ou is unlock, it got mixed up here...

I will send a v2.

- Alex

