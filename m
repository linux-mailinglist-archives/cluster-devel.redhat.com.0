Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E9609E31
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Oct 2022 11:43:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666604616;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lvTCug/WGu2tB0i/Ce81Igi5v0dyO+fR3fhU50OBOLc=;
	b=JHnLuFFXzTJy7bvwculrxJbDfPhfhVMmDSQCsHSNWwsKj5f4Q76GMK8SOOBZ924X5wLXW4
	vEEWm/rnlqkvEyDqQltp3MOcSqpt/5H21/srHps/2sI8qnwSQ57XhXCzjO/54PMM2iS2Ko
	LFTHqoWJPpKVd5Ps0apm0yuPHqy3UMY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-XSZLU3xEPei6pRE3KGn9Hw-1; Mon, 24 Oct 2022 05:43:29 -0400
X-MC-Unique: XSZLU3xEPei6pRE3KGn9Hw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 903CC3C0CD4A;
	Mon, 24 Oct 2022 09:43:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B2FC32166B2A;
	Mon, 24 Oct 2022 09:43:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 00ABA1946595;
	Mon, 24 Oct 2022 09:43:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E9764194658D for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Oct 2022 09:43:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D5525112132E; Mon, 24 Oct 2022 09:43:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDD991121315
 for <cluster-devel@redhat.com>; Mon, 24 Oct 2022 09:43:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADD7785A583
 for <cluster-devel@redhat.com>; Mon, 24 Oct 2022 09:43:08 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-619-mHKCTz-LNwWb07cjlYLnkA-1; Mon, 24 Oct 2022 05:43:05 -0400
X-MC-Unique: mHKCTz-LNwWb07cjlYLnkA-1
Received: by mail-ed1-f42.google.com with SMTP id x2so1758572edd.2;
 Mon, 24 Oct 2022 02:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lvTCug/WGu2tB0i/Ce81Igi5v0dyO+fR3fhU50OBOLc=;
 b=6A9yoLD5M/UYmFN/k5IqvDMk69YCoz3cSsoXMtTdS304lfSA7dcaqGTSQDDkBT93DZ
 ZK5Oi4bNfkvRs+eZE2ncBij0Zh4ZxqBa8BnOmUKI4o2bZmZxzGuQPj+i5y5QFyGkqp2f
 uMGz6sOPJ+nxdepHScQowe2HSDBYChCBOGEDpump2uGPVW1ZtVWxb8COBng3qfPlpSxz
 iBIsI9eVhftA4Y+lbNk9pmmBZUaaPTODZ84hp+y7qo0T0Y5hAxBt/5uOu//+hdeH0reA
 0b3/6ULZU/E9rUCN4QisnBEvrbCX1GD62EKnx7X6qPv7THNthcbc0SHbZ8okfselSMJC
 7ZPg==
X-Gm-Message-State: ACrzQf3bdHrlCyBCJb+atJbNH12+N8e8y7UVl3un41F5PhIEDW/NyCro
 y5ndYqtZVujh20eCmu8jVmaxCKiXCjHc4NigS/U=
X-Google-Smtp-Source: AMsMyM6YCPqmGHU4Yv+WgY3/mBRU+k1PehOBWkGLUn/NSsQx0nMbwe7NvuaZO7bNuImAmiKOzxyNnT5+8WgQudOE70k=
X-Received: by 2002:a05:6402:2949:b0:451:fabf:d88a with SMTP id
 ed9-20020a056402294900b00451fabfd88amr29383306edb.324.1666604583226; Mon, 24
 Oct 2022 02:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221023163945.39920-1-yin31149@gmail.com>
 <20221023163945.39920-5-yin31149@gmail.com>
In-Reply-To: <20221023163945.39920-5-yin31149@gmail.com>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Mon, 24 Oct 2022 11:42:49 +0200
Message-ID: <CAHpGcMK0C6uxuNwhOouHLz7fyCcu=JH63COX_0J72koZk_CS7w@mail.gmail.com>
To: Hawkins Jiawei <yin31149@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH -next 4/5] gfs2: fix possible
 null-ptr-deref when parsing param
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 syzbot+da97a57c5b742d05db51@syzkaller.appspotmail.com,
 cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org, 18801353760@163.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Am So., 23. Okt. 2022 um 18:46 Uhr schrieb Hawkins Jiawei <yin31149@gmail.com>:
> According to commit "vfs: parse: deal with zero length string value",
> kernel will set the param->string to null pointer in vfs_parse_fs_string()
> if fs string has zero length.
>
> Yet the problem is that, gfs2_parse_param() will dereferences the
> param->string, without checking whether it is a null pointer, which may
> trigger a null-ptr-deref bug.
>
> This patch solves it by adding sanity check on param->string
> in gfs2_parse_param().

Yes, but then it dereferences param->string in the error message. That
won't help.

> Reported-by: syzbot+da97a57c5b742d05db51@syzkaller.appspotmail.com
> Tested-by: syzbot+da97a57c5b742d05db51@syzkaller.appspotmail.com
> Cc: agruenba@redhat.com
> Cc: cluster-devel@redhat.com
> Cc: linux-kernel@vger.kernel.org
> Cc: rpeterso@redhat.com
> Cc: syzkaller-bugs@googlegroups.com
> Signed-off-by: Hawkins Jiawei <yin31149@gmail.com>
> ---
>  fs/gfs2/ops_fstype.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index c0cf1d2d0ef5..934746f18c25 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -1446,12 +1446,18 @@ static int gfs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
>
>         switch (o) {
>         case Opt_lockproto:
> +               if (!param->string)
> +                       goto bad_val;
>                 strscpy(args->ar_lockproto, param->string, GFS2_LOCKNAME_LEN);
>                 break;
>         case Opt_locktable:
> +               if (!param->string)
> +                       goto bad_val;
>                 strscpy(args->ar_locktable, param->string, GFS2_LOCKNAME_LEN);
>                 break;
>         case Opt_hostdata:
> +               if (!param->string)
> +                       goto bad_val;
>                 strscpy(args->ar_hostdata, param->string, GFS2_LOCKNAME_LEN);
>                 break;
>         case Opt_spectator:
> @@ -1535,6 +1541,10 @@ static int gfs2_parse_param(struct fs_context *fc, struct fs_parameter *param)
>                 return invalfc(fc, "invalid mount option: %s", param->key);
>         }
>         return 0;
> +
> +bad_val:
> +       return invalfc(fc, "Bad value '%s' for mount option '%s'\n",
> +                      param->string, param->key);
>  }
>
>  static int gfs2_reconfigure(struct fs_context *fc)
> --
> 2.25.1
>

Thanks,
Andreas

