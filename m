Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 524BA787BF4
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 01:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692919397;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4oo63TkSrkUX+Z3NHo9KF69Jc5ETG4Wg8FbWNIW5HOw=;
	b=UkbgrNjOU+Dlu7JWBRn788lkBHHmCj95up3ZTWSCdchxVU/5Ai6rrU0XYZp+U7h1ApaZ7V
	ztpiqtBK64fP4QJIJ7l3WBU4vTeQyc4iLGPOeBqDB3aM0hHIvzKoWM3w/QRlYvoTLLlDe3
	TlGO+FS4+7sxgQRScSuVBSgUp7o2KiY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-9XvWDYOkO0CYa36GtzOO2w-1; Thu, 24 Aug 2023 19:23:14 -0400
X-MC-Unique: 9XvWDYOkO0CYa36GtzOO2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F166C3802263;
	Thu, 24 Aug 2023 23:23:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E4089C1602B;
	Thu, 24 Aug 2023 23:23:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 14D0F19465B1;
	Thu, 24 Aug 2023 23:23:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EF5EF1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 23:23:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B04F940D283C; Thu, 24 Aug 2023 23:23:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A857C40D283A
 for <cluster-devel@redhat.com>; Thu, 24 Aug 2023 23:23:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A7A71C08977
 for <cluster-devel@redhat.com>; Thu, 24 Aug 2023 23:23:09 +0000 (UTC)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-Yh4nfLybNp63QsvAuhtg0A-1; Thu, 24 Aug 2023 19:23:02 -0400
X-MC-Unique: Yh4nfLybNp63QsvAuhtg0A-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a355cf318so22445466b.2
 for <cluster-devel@redhat.com>; Thu, 24 Aug 2023 16:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692919381; x=1693524181;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4oo63TkSrkUX+Z3NHo9KF69Jc5ETG4Wg8FbWNIW5HOw=;
 b=XNnSga9YKWY2ryoGvOfnnJJieE63EunWGMdJmiLKi0riXhLcGp7WFGikJaTPI5v/Eo
 vbgwQhJJYoKp2amomirO4YgdS1ihH+6IM5gzB+4DFOF6tgcSmtkAVys+mmaEnA5efbIJ
 SRT4lBLTf7Q6VAL6ujlX2LNM4KjOMqqwFWIoWQVusWCDNgFfUwAL+vDULNZBzm0jflhG
 J/t7/+HNM6ZsuSX91nmFgYPyaF+ep2wL7on4IoqvCcvC+7Hi7ZikBCKLnkijkjffASHy
 flra6tyaxbt1vd7Vru2CzO1sOSb+2LHWS4hmQGgnQd/C3iJGXMPmivPrNfmZjke8y7oM
 KRwg==
X-Gm-Message-State: AOJu0Yx35nzgnWS/qR3yhHk6cApFhiOhVb3+up2IPQ0a46Ng431VmExt
 6Hf+WFFMJo4cNIeV2z4pWGX/y+kknJ21ePrGgBczU9h7xgAO1Ai+xUsZG64QgOCK0Kdt7ko2Aog
 B7V8NDfnv7Yay4keV/QyQ9JdU+sNOgCCgDNkN2w==
X-Received: by 2002:aa7:d058:0:b0:522:1d23:a1f8 with SMTP id
 n24-20020aa7d058000000b005221d23a1f8mr13107657edo.26.1692919381647; 
 Thu, 24 Aug 2023 16:23:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyonal6KJXOHQzqJw6u6txpCMUSkvPsWd2+q/9hdd4MMAPVBbG6Dzlwj9iMdQ6wjV/yHRkcNpT8c3m1nQB+Vg=
X-Received: by 2002:aa7:d058:0:b0:522:1d23:a1f8 with SMTP id
 n24-20020aa7d058000000b005221d23a1f8mr13107650edo.26.1692919381376; Thu, 24
 Aug 2023 16:23:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230824205142.2732984-1-aahringo@redhat.com>
In-Reply-To: <20230824205142.2732984-1-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 24 Aug 2023 19:22:49 -0400
Message-ID: <CAK-6q+iUe1=68LFv=BVd4MxVhtPf=jGPRFfXXNopEB2J+gjWqg@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH dlm/next] dlm: fix plock lookup when
 using multiple lockspaces
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
Cc: cluster-devel@redhat.com, bmarson@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 24, 2023 at 4:51=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
>
> This patch fixes an issues when concurrent fcntl() syscalls are
> executing on two different gfs2 filesystems. Each gfs2 filesystem
> creates an DLM lockspace, it seems that VFS only allows fcntl() syscalls
> at one time on a per filesystem basis. However if there are two
> filesystems and we executing fcntl() syscalls our lookup mechanism on the
> global plock op list does not work anymore.
>
> It can be reproduced with two mounted gfs2 filesystems using DLM
> locking. Then call stress-ng --fcntl 32 on each mount point. The kernel
> log will show several:
>
> WARNING: CPU: 4 PID: 943 at fs/dlm/plock.c:574 dev_write+0x15c/0x590
>
> because we have a sanity check if it's was really the meant original
> plock op when dev_write() does a lookup. This patch adds just a
> additional check for fsid to find the right plock op which is an
> indicator that the recv_list should be on a per lockspace basis and not
> globally defined. After this patch the sanity check never warned again
> that the wrong plock op was being looked up.
>
> Cc: stable@vger.kernel.org
> Reported-by: Barry Marson <bmarson@redhat.com>
> Fixes: 57e2c2f2d94c ("fs: dlm: fix mismatch of plock results from userspa=
ce")
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/plock.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
> index 00e1d802a81c..e6b4c1a21446 100644
> --- a/fs/dlm/plock.c
> +++ b/fs/dlm/plock.c
> @@ -556,7 +556,8 @@ static ssize_t dev_write(struct file *file, const cha=
r __user *u, size_t count,
>                 op =3D plock_lookup_waiter(&info);
>         } else {
>                 list_for_each_entry(iter, &recv_list, list) {
> -                       if (!iter->info.wait) {
> +                       if (!iter->info.wait &&
> +                           iter->info.fsid =3D=3D info.fsid) {
>                                 op =3D iter;
>                                 break;
>                         }
> @@ -568,8 +569,7 @@ static ssize_t dev_write(struct file *file, const cha=
r __user *u, size_t count,
>                 if (info.wait)
>                         WARN_ON(op->info.optype !=3D DLM_PLOCK_OP_LOCK);
>                 else
> -                       WARN_ON(op->info.fsid !=3D info.fsid ||
> -                               op->info.number !=3D info.number ||
> +                       WARN_ON(op->info.number !=3D info.number ||

Please drop this patch as I was curious where the per
lockspace/filesystem locking is for fcntl(). The answer is, it does
not exist... I added here also checks to compare start and end fields.
The lookup does not work, even with this patch applied.  It's because
several fcntl() races to put something into send_list and it gets out
of order and we can't assume that recv_list contains the order of
fcntl() calls. We need to compare all fields to match a correct one
which needs to be granted.

The reason why I probably never saw it is because those fields in my
tests are always the same and we simply don't compare all fields on
the sanity check.

- Alex

