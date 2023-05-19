Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 255DF70A19C
	for <lists+cluster-devel@lfdr.de>; Fri, 19 May 2023 23:20:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684531239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QDW6L5XcQGm718KjhEwJ0qelmoF6zHK3o1HR0XotUW4=;
	b=KwyuAPlWSxmqAdoElvI6bUCwaipWh3930qM2sJNGWWLujuzDbrvVVybGvt8CYIdADmRjBM
	It0VCeXPi8xOoyQP3XmQJPZHgtuTBD6L9pZM6IeC08I8JSPLmZdN1ZGNsNk7+pzmhzYUqQ
	ajrM5x1soZqFMuiyU8jR5Zokep/7rJw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-OnzrD3fqPXeMVQUvIsalNA-1; Fri, 19 May 2023 17:20:35 -0400
X-MC-Unique: OnzrD3fqPXeMVQUvIsalNA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDBE629DD99E;
	Fri, 19 May 2023 21:20:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3CF2C140E954;
	Fri, 19 May 2023 21:20:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D800A19465B7;
	Fri, 19 May 2023 21:20:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E350B19465A4 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 19 May 2023 21:20:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5CEAD140E955; Fri, 19 May 2023 21:20:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55CAD140E954
 for <cluster-devel@redhat.com>; Fri, 19 May 2023 21:20:25 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3910A101A531
 for <cluster-devel@redhat.com>; Fri, 19 May 2023 21:20:25 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-gO_wlodAMjmMi1Q7RNXrBw-1; Fri, 19 May 2023 17:20:23 -0400
X-MC-Unique: gO_wlodAMjmMi1Q7RNXrBw-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-506a7b4f141so4512523a12.2
 for <cluster-devel@redhat.com>; Fri, 19 May 2023 14:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684531222; x=1687123222;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QDW6L5XcQGm718KjhEwJ0qelmoF6zHK3o1HR0XotUW4=;
 b=jTy9Buq07ZlgO7hwWVP+FqF8H2riYCNB02rYLOmsY2pJvoUVMSQkQkgZs8KEF+YY0C
 o2UKz40khgAiOuY3+mEDPfXt15JlMBLvMfXps2b2MbfI0v49vHCqEJPoOHf/PUdn2po+
 9uob2YLJnm1nsGI+/s+IOq21jTFI+wcDRmsmUie3e9se62ylqBxN3LomYzS1fPgSu5lS
 RIJcXbt7w9d0QBUoaELaq3c4yQZYSUbcE24wivAIddY1RvZiBHBEEuXjERq3PdCHaXBH
 scz6PGzW9rD8vwuRzdLpi7hdf7zJmFSJ22Dck67E2EXZ7/becZgucUnHOqbV86muQq0l
 Kiug==
X-Gm-Message-State: AC+VfDwXsnnMuX//x8HE2FwQRm/KyvmI+FMO6m+yuMxVeL2mWU5CXpBx
 QWgPDcpbCxDLstlZBp1vtxt2OlBGsxkphnFmZCDI1wqDLryCfHYDwvg+utYGegpyh4+okSmkJee
 zIUIajLWCpT4+XBKxV9LKbcaI7gLNtKHv4aW6Dw==
X-Received: by 2002:aa7:ccc6:0:b0:510:6ccf:84aa with SMTP id
 y6-20020aa7ccc6000000b005106ccf84aamr3521173edt.32.1684531222576; 
 Fri, 19 May 2023 14:20:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wIzt5Cy1icVhOGc2ztAmVv/6PXSB4C74oLH1vbhp7Obnssq3hv+O6tIkFXSXaPO8wqHUtoEcGIzr+wdv+pX0=
X-Received: by 2002:aa7:ccc6:0:b0:510:6ccf:84aa with SMTP id
 y6-20020aa7ccc6000000b005106ccf84aamr3521162edt.32.1684531222310; Fri, 19 May
 2023 14:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230519152128.65272-1-aahringo@redhat.com>
 <20230519152128.65272-5-aahringo@redhat.com>
In-Reply-To: <20230519152128.65272-5-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 19 May 2023 17:20:11 -0400
Message-ID: <CAK-6q+gmmKqZgsvL_jGVzfd+kQhEvtX=w034j2ORkjQ-Vx7bRA@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH v6.4-rc2 5/5] fs: dlm: avoid F_SETLKW
 plock op lookup collisions
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 19, 2023 at 11:21=E2=80=AFAM Alexander Aring <aahringo@redhat.c=
om> wrote:
>
> This patch fixes a possible plock op collisions when using F_SETLKW lock
> requests and fsid, number and owner are not enough to identify a result
> for a pending request. The ltp testcases [0] and [1] are examples when
> this is not enough in case of using classic posix locks with threads and
> open filedescriptor posix locks.
>
> The idea to fix the issue here is to split recv_list, which contains
> plock ops expecting a result from user space, into a F_SETLKW op
> recv_setlkw_list and for all other commands recv_list. Due DLM user
> space behavior e.g. dlm_controld a request and writing a result back can
> only happen in an ordered way. That means a lookup and iterating over
> the recv_list is not required. To place the right plock op as the first
> entry of recv_list a change to list_move_tail() was made.
>
> This behaviour is for F_SETLKW not possible as multiple waiters can be
> get a result back in an random order. To avoid a collisions in cases
> like [0] or [1] this patch adds more fields to compare the plock
> operations as the lock request is the same. This is also being made in
> NFS to find an result for an asynchronous F_SETLKW lock request [2][3]. W=
e
> still can't find the exact lock request for a specific result if the
> lock request is the same, but if this is the case we don't care the
> order how the identical lock requests get their result back to grant the
> lock.
>
> [0] https://gitlab.com/netcoder/ltp/-/blob/dlm_fcntl_owner_testcase/testc=
ases/kernel/syscalls/fcntl/fcntl40.c
> [1] https://gitlab.com/netcoder/ltp/-/blob/dlm_fcntl_owner_testcase/testc=
ases/kernel/syscalls/fcntl/fcntl41.c
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/include/linux/lockd/lockd.h?h=3Dv6.4-rc1#n373
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/fs/lockd/svclock.c?h=3Dv6.4-rc1#n731
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/plock.c | 47 ++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 34 insertions(+), 13 deletions(-)
>
> diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> index c9e1d5f54194..540a30a342f0 100644
> --- a/fs/dlm/plock.c
> +++ b/fs/dlm/plock.c
> @@ -17,6 +17,7 @@
>  static DEFINE_SPINLOCK(ops_lock);
>  static LIST_HEAD(send_list);
>  static LIST_HEAD(recv_list);
> +static LIST_HEAD(recv_setlkw_list);
>  static DECLARE_WAIT_QUEUE_HEAD(send_wq);
>  static DECLARE_WAIT_QUEUE_HEAD(recv_wq);
>
> @@ -392,10 +393,14 @@ static ssize_t dev_read(struct file *file, char __u=
ser *u, size_t count,
>         spin_lock(&ops_lock);
>         if (!list_empty(&send_list)) {
>                 op =3D list_first_entry(&send_list, struct plock_op, list=
);
> -               if (op->info.flags & DLM_PLOCK_FL_CLOSE)
> +               if (op->info.flags & DLM_PLOCK_FL_CLOSE) {
>                         list_del(&op->list);
> -               else
> -                       list_move(&op->list, &recv_list);
> +               } else {
> +                       if (op->info.wait)
> +                               list_move(&op->list, &recv_setlkw_list);
> +                       else
> +                               list_move_tail(&op->list, &recv_list);
> +               }
>                 memcpy(&info, &op->info, sizeof(info));
>         }
>         spin_unlock(&ops_lock);
> @@ -434,18 +439,34 @@ static ssize_t dev_write(struct file *file, const c=
har __user *u, size_t count,
>                 return -EINVAL;
>
>         spin_lock(&ops_lock);
> -       list_for_each_entry(iter, &recv_list, list) {
> -               if (iter->info.fsid =3D=3D info.fsid &&
> -                   iter->info.number =3D=3D info.number &&
> -                   iter->info.owner =3D=3D info.owner) {
> -                       list_del_init(&iter->list);
> -                       memcpy(&iter->info, &info, sizeof(info));
> -                       if (iter->data)
> +       if (info.wait) {
> +               list_for_each_entry(iter, &recv_setlkw_list, list) {
> +                       if (iter->info.fsid =3D=3D info.fsid &&
> +                           iter->info.number =3D=3D info.number &&
> +                           iter->info.owner =3D=3D info.owner &&
> +                           iter->info.pid =3D=3D info.pid &&
> +                           iter->info.start =3D=3D info.start &&
> +                           iter->info.end =3D=3D info.end) {

There is a missing condition for info.ex, otherwise a lock request for
F_WRLCK and F_RDLCK could be evaluated as the same request. NFS is
doing this check as well by checking on fl1->fl_type  =3D=3D fl2->fl_type,
we don't have fl_type but info.ex which is the only difference in
F_SETLKW to distinguish F_WRLCK and F_RDLCK.

I will send a v2.

- Alex

