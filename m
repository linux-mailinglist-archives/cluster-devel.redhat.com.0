Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8592B710F0E
	for <lists+cluster-devel@lfdr.de>; Thu, 25 May 2023 17:05:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685027150;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KplMHxrwKxFIh3NafdKXeYGBI6uFXbptgidYK5SSf8c=;
	b=AiVI4tmKcSCFU+zeNoAnlyqRT66PAd/vhpdR1/Mm63oR4CxmaQipvT15WXpe2FwWcQPuAV
	TcGVRss+1PfbNbElHFlPLZo3qWOlrDzcBzgxgpjLEy46DxQaMim74+V3gHdRxIZ9I705x6
	5PERnkhXZn6gloyj13aQEIWM8Vtr/88=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-350-r4fYYhxJO96rTDOIpm8XDw-1; Thu, 25 May 2023 11:05:46 -0400
X-MC-Unique: r4fYYhxJO96rTDOIpm8XDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9708101B04C;
	Thu, 25 May 2023 15:05:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B6751121315;
	Thu, 25 May 2023 15:05:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9F98019465B1;
	Thu, 25 May 2023 15:05:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3585219465A0 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 25 May 2023 15:02:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E5D8C1121315; Thu, 25 May 2023 15:02:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE3811121314
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 15:02:23 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC2CB811761
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 15:02:23 +0000 (UTC)
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-EE7VXPOXO5CDh-FZ1mCeGw-1; Thu, 25 May 2023 11:02:22 -0400
X-MC-Unique: EE7VXPOXO5CDh-FZ1mCeGw-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-255ced12531so1708844a91.2
 for <cluster-devel@redhat.com>; Thu, 25 May 2023 08:02:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685026941; x=1687618941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KplMHxrwKxFIh3NafdKXeYGBI6uFXbptgidYK5SSf8c=;
 b=NlqdUJCSR8Skdz52zCoG2HDtW0ADI95kSSVxlE2pexftyhZYytan5ajoQf2ivumaxi
 F/+VOdqFmsUA/A2yhLS6AFuWZK1RyMl9D8zp7ahtdn8Jj9idRYgwJOHqzS3nja2zR+Fc
 v/8clvWItgDUtcoENR5gE7CgLCLDBAGYaQsDoftxEBWJeme9TqUQF3A14deFw8tY2qLe
 bDQPMCPK5jQFLPB4ijrjck3fdFloOKAj+2nIYrjREjAetRj6ToaeqQ5B2OfwyD60bm3U
 N6RtSLz+DBS4qlQXLJB+tDSyb8yglMuaD3JL7ab0vkOo6Tp5AnqQQ/12rJnqFDVf8sBV
 M/BA==
X-Gm-Message-State: AC+VfDyRjmC/5yuO7/HpwRnr4VWrZI3kKJDPtNmuWIC69QvNHgy4xQGd
 KvXeDKR51gBZtYnOaOQhKTn74nB1qlNDjub1U2JgzDYOwYt0Cs8iENtI0Hfn2MDl+dyyiiNGefO
 d2C0Fm7PuqOBbLgt26GMH3Q2x3rDFwUjD+0zvLQ==
X-Received: by 2002:a17:902:f545:b0:1a6:81fc:b585 with SMTP id
 h5-20020a170902f54500b001a681fcb585mr2193426plf.41.1685026941102; 
 Thu, 25 May 2023 08:02:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7qUdEFy2FQfQhMgr0Qzs3fyWRJaYGwZmRFOXJGEkR62u5XGN1UvQ8uEFgTRf2LVj5O5OQECsdbuAjlYNRsOhk=
X-Received: by 2002:a17:902:f545:b0:1a6:81fc:b585 with SMTP id
 h5-20020a170902f54500b001a681fcb585mr2193384plf.41.1685026940715; Thu, 25 May
 2023 08:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230524160204.1042858-1-aahringo@redhat.com>
In-Reply-To: <20230524160204.1042858-1-aahringo@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 25 May 2023 17:02:09 +0200
Message-ID: <CAHc6FU7vaQmbwzL7Memu9YpsqXM9Ay4Mj52pDpkG6UdXw6hKVg@mail.gmail.com>
To: Alexander Aring <aahringo@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCHv2 dlm/next] fs: dlm: avoid F_SETLKW
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 6:02=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
> This patch fixes a possible plock op collisions when using F_SETLKW lock
> requests and fsid, number and owner are not enough to identify a result
> for a pending request. The ltp testcases [0] and [1] are examples when
> this is not enough in case of using classic posix locks with threads and
> open filedescriptor posix locks.
>
> The idea to fix the issue here is to place all lock request in order. In
> case of non F_SETLKW lock request (indicated if wait is set or not) the
> lock requests are ordered inside the recv_list. If a result comes back
> the right plock op can be found by the first plock_op in recv_list which
> has not info.wait set. This can be done only by non F_SETLKW plock ops as
> dlm_controld always reads a specific plock op (list_move_tail() from
> send_list to recv_mlist) and write the result immediately back.
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

When the recv_list contains multiple indistinguishable requests, this
can only be because they originated from multiple threads of the same
process. In that case, I agree that it doesn't matter which of those
requests we "complete" in dev_write() as long as we only complete one
request. We do need to compare the additional request fields in
dev_write() to find a suitable request, so that makes sense as well.
We need to compare all of the fields that identify a request (optype,
ex, wait, pid, nodeid, fsid, number, start, end, owner) to find the
"right" request (or in case there is more than one identical request,
a "suitable" request).

The above patch description doesn't match the code anymore, and the
code doesn't fully revert the recv_list splitting of the previous
version.

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
> change since v2:
>  - don't split recv_list into recv_setlkw_list
>
>  fs/dlm/plock.c | 43 ++++++++++++++++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 13 deletions(-)
>
> diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> index 31bc601ee3d8..53d17dbbb716 100644
> --- a/fs/dlm/plock.c
> +++ b/fs/dlm/plock.c
> @@ -391,7 +391,7 @@ static ssize_t dev_read(struct file *file, char __use=
r *u, size_t count,
>                 if (op->info.flags & DLM_PLOCK_FL_CLOSE)
>                         list_del(&op->list);
>                 else
> -                       list_move(&op->list, &recv_list);
> +                       list_move_tail(&op->list, &recv_list);

^ This should be obsolete, but it won't hurt, either.

>                 memcpy(&info, &op->info, sizeof(info));
>         }
>         spin_unlock(&ops_lock);
> @@ -430,19 +430,36 @@ static ssize_t dev_write(struct file *file, const c=
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
> -                               do_callback =3D 1;
> -                       else
> -                               iter->done =3D 1;
> -                       op =3D iter;
> -                       break;
> +       if (info.wait) {

We should be able to use the same list_for_each_entry() loop for
F_SETLKW requests (which have info.wait set) as for all other requests
as far as I can see.

> +               list_for_each_entry(iter, &recv_list, list) {
> +                       if (iter->info.fsid =3D=3D info.fsid &&
> +                           iter->info.number =3D=3D info.number &&
> +                           iter->info.owner =3D=3D info.owner &&
> +                           iter->info.pid =3D=3D info.pid &&
> +                           iter->info.start =3D=3D info.start &&
> +                           iter->info.end =3D=3D info.end &&
> +                           iter->info.ex =3D=3D info.ex &&
> +                           iter->info.wait) {
> +                               op =3D iter;
> +                               break;
> +                       }
>                 }
> +       } else {
> +               list_for_each_entry(iter, &recv_list, list) {
> +                       if (!iter->info.wait) {
> +                               op =3D iter;
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       if (op) {
> +               list_del_init(&op->list);
> +               memcpy(&op->info, &info, sizeof(info));
> +               if (op->data)
> +                       do_callback =3D 1;
> +               else
> +                       op->done =3D 1;
>         }

Can't this code just remain in the list_for_each_entry() loop?

>         spin_unlock(&ops_lock);
>
> --
> 2.31.1
>

Andreas

