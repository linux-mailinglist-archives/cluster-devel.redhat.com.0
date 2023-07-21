Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC9C75C75D
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Jul 2023 15:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689945024;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IRuuam55kdQA4uTTCcFH99bBDP1ucNXuZ2EnP+sxN5A=;
	b=PIwxR57FArGww3y7/LJZTFEknlQg1PKegFDBLBUF1BWbw04i3LhpmLLCoLTHI6lCP6u234
	feQD3K+wmdpCffahJFTMbrynEKB61jK+CgKfleHr2lUoQFgLI6oFofjXKE1qIhy+nk6fQ2
	BMrGqFwtkR8TPKKH3LiqhKLocTdgEeo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-NipHroKBOxGonSPCiFzsBg-1; Fri, 21 Jul 2023 09:10:21 -0400
X-MC-Unique: NipHroKBOxGonSPCiFzsBg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 881FF8F184C;
	Fri, 21 Jul 2023 13:10:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2902166B27;
	Fri, 21 Jul 2023 13:10:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 44E541946A49;
	Fri, 21 Jul 2023 13:10:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E70101946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Jul 2023 13:10:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D0D82492C13; Fri, 21 Jul 2023 13:10:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8A9A4A9004
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 13:10:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC896858290
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 13:10:12 +0000 (UTC)
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-YAmzmtnvMyqZ57IdZinnnA-1; Fri, 21 Jul 2023 09:10:11 -0400
X-MC-Unique: YAmzmtnvMyqZ57IdZinnnA-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-56942667393so18587867b3.2
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 06:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689945010; x=1690549810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRuuam55kdQA4uTTCcFH99bBDP1ucNXuZ2EnP+sxN5A=;
 b=EE030VA5FJgjH7QurVr63znShPqkO2MbbAN8+1K0qb2cuZyDfVXaOpwBflezpbkrc8
 ycGlJ5EYG+We366aamgFVJkz6XI313F7AANnr0OhMwRSopP+RfHbdz8WW9QcndsYQU0Q
 DXkXf99DbBMrS19U/um4RT5FznGOjpySkP7vG5GknHzo44ap5Jxv/0fwEDjaDa9Z3CWt
 CxZsgzxewkKd3LCO30jiMZRrJkwWqA8cO0pJc8UbzVD9YYoPC7XgwlsDUSsP7rR3n8cd
 SO8QUg3ZdlmEhnbUxnmFAjs8Kof+D+zovvi71mWZ3DRbDbogjuObDNwrnD97kTcfyDem
 GfJw==
X-Gm-Message-State: ABy/qLbj9xn18Vz/9yBa8iORUq/Ymh48YrQ+SKfNcn3kG1Y7mrlLV8Qk
 Ymgvzh/s+W0ZD3kkT0E399GzBYodtjGYCEvUNKFvj4TO7YGr4ILkxWW11QhmC0qTx69AO0MZP+n
 XVVtk8f3+RJwU1eIGek78plLS6LRn5XYBOO5QTqScMFkpxRGj
X-Received: by 2002:a81:730b:0:b0:573:44b3:bf7f with SMTP id
 o11-20020a81730b000000b0057344b3bf7fmr1905186ywc.41.1689945010743; 
 Fri, 21 Jul 2023 06:10:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHv8lG+/kKHBBkb4NMfFTdZxi2alLLHEwvMnnmxA1OL8LKq26vNXtveX0RTe+phaj2EJLEcU43p8ZkHvX88Mu4=
X-Received: by 2002:a81:730b:0:b0:573:44b3:bf7f with SMTP id
 o11-20020a81730b000000b0057344b3bf7fmr1905160ywc.41.1689945010438; Fri, 21
 Jul 2023 06:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230720125806.1385279-1-aahringo@redhat.com>
 <20230720125806.1385279-2-aahringo@redhat.com>
In-Reply-To: <20230720125806.1385279-2-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 21 Jul 2023 09:09:59 -0400
Message-ID: <CAK-6q+gaX6v0aiaKB=STd_QWCyujX_bh-7uJ+Kfsu2GRVCCc6g@mail.gmail.com>
To: chuck.lever@oracle.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [RFC v6.5-rc2 2/3] fs: lockd: fix race in async
 lock request handling
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
Cc: cluster-devel@redhat.com, linux-nfs@vger.kernel.org, neilb@suse.de,
 jlayton@kernel.org, Dai.Ngo@oracle.com, tom@talpey.com, kolga@netapp.com,
 anna@kernel.org, trond.myklebust@hammerspace.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 20, 2023 at 8:58=E2=80=AFAM Alexander Aring <aahringo@redhat.co=
m> wrote:
>
> This patch fixes a race in async lock request handling between adding
> the relevant struct nlm_block to nlm_blocked list after the request was
> sent by vfs_lock_file() and nlmsvc_grant_deferred() does a lookup of the
> nlm_block in the nlm_blocked list. It could be that the async request is
> completed before the nlm_block was added to the list. This would end
> in a -ENOENT and a kernel log message of "lockd: grant for unknown
> block".
>
> To solve this issue we add the nlm_block before the vfs_lock_file() call
> to be sure it has been added when a possible nlmsvc_grant_deferred() is
> called. If the vfs_lock_file() results in an case when it wouldn't be
> added to nlm_blocked list, the nlm_block struct will be removed from
> this list again.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/lockd/svclock.c          | 80 +++++++++++++++++++++++++++----------
>  include/linux/lockd/lockd.h |  1 +
>  2 files changed, 60 insertions(+), 21 deletions(-)
>
> diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
> index 28abec5c451d..62ef27a69a9e 100644
> --- a/fs/lockd/svclock.c
> +++ b/fs/lockd/svclock.c
> @@ -297,6 +297,8 @@ static void nlmsvc_free_block(struct kref *kref)
>
>         dprintk("lockd: freeing block %p...\n", block);
>
> +       WARN_ON_ONCE(block->b_flags & B_PENDING_CALLBACK);
> +
>         /* Remove block from file's list of blocks */
>         list_del_init(&block->b_flist);
>         mutex_unlock(&file->f_mutex);
> @@ -543,6 +545,12 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file =
*file,
>                 goto out;
>         }
>
> +       if (block->b_flags & B_PENDING_CALLBACK)
> +               goto pending_request;
> +
> +       /* Append to list of blocked */
> +       nlmsvc_insert_block(block, NLM_NEVER);
> +
>         if (!wait)
>                 lock->fl.fl_flags &=3D ~FL_SLEEP;
>         mode =3D lock_to_openmode(&lock->fl);
> @@ -552,9 +560,13 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file =
*file,
>         dprintk("lockd: vfs_lock_file returned %d\n", error);
>         switch (error) {
>                 case 0:
> +                       nlmsvc_remove_block(block);

reacting here with nlmsvc_remove_block() assumes that the block was
not being added to the nlm_blocked list before nlmsvc_insert_block()
was called. I am not sure if this is always the case here.

Does somebody see a problem with that?

>                         ret =3D nlm_granted;
>                         goto out;
>                 case -EAGAIN:
> +                       if (!wait)
> +                               nlmsvc_remove_block(block);
> +pending_request:
>                         /*
>                          * If this is a blocking request for an
>                          * already pending lock request then we need
> @@ -565,6 +577,8 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *=
file,
>                         ret =3D async_block ? nlm_lck_blocked : nlm_lck_d=
enied;
>                         goto out;
>                 case FILE_LOCK_DEFERRED:
> +                       block->b_flags |=3D B_PENDING_CALLBACK;
> +
>                         if (wait)
>                                 break;
>                         /* Filesystem lock operation is in progress
> @@ -572,17 +586,16 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file=
 *file,
>                         ret =3D nlmsvc_defer_lock_rqst(rqstp, block);
>                         goto out;
>                 case -EDEADLK:
> +                       nlmsvc_remove_block(block);
>                         ret =3D nlm_deadlock;
>                         goto out;
>                 default:                        /* includes ENOLCK */
> +                       nlmsvc_remove_block(block);
>                         ret =3D nlm_lck_denied_nolocks;
>                         goto out;
>         }
>
>         ret =3D nlm_lck_blocked;
> -
> -       /* Append to list of blocked */
> -       nlmsvc_insert_block(block, NLM_NEVER);
>  out:
>         mutex_unlock(&file->f_mutex);
>         nlmsvc_release_block(block);
> @@ -739,34 +752,59 @@ nlmsvc_update_deferred_block(struct nlm_block *bloc=
k, int result)
>                 block->b_flags |=3D B_TIMED_OUT;
>  }

- Alex

