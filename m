Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFB4754575
	for <lists+cluster-devel@lfdr.de>; Sat, 15 Jul 2023 01:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689378068;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xA2SFKFW47h/K7YYUZodON0lmABcyisGtc9hpSnJfHA=;
	b=PMJOiZL0L5zlVlGxOEW8MeGvOBGKmB+5ObXIKivzY21wjLt51YEyHPEuNNuNLmwzcJOukx
	p8eGNggTDHqWzI/xBf/6ha7N10o7s4SzYcODRu8/Zf4naEGlC5LbDgMq5DRJMpyjIqkTSY
	c4/dfYoFX2L4o40EBWLHx5RLsSJ5RBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-253-b9znwtStN4q0SjSavk316w-1; Fri, 14 Jul 2023 19:41:04 -0400
X-MC-Unique: b9znwtStN4q0SjSavk316w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D458E1011573;
	Fri, 14 Jul 2023 23:41:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64CAB492C13;
	Fri, 14 Jul 2023 23:41:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 208D51946595;
	Fri, 14 Jul 2023 23:41:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 99C001946587 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 14 Jul 2023 23:41:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5E5C8C2C857; Fri, 14 Jul 2023 23:41:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56805C2C856
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 23:41:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 386F6858290
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 23:41:01 +0000 (UTC)
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-UVGLnR5ENb-MfNUt4GIHmw-1; Fri, 14 Jul 2023 19:40:59 -0400
X-MC-Unique: UVGLnR5ENb-MfNUt4GIHmw-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-57059f90cc5so20493217b3.0
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 16:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689378059; x=1691970059;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xA2SFKFW47h/K7YYUZodON0lmABcyisGtc9hpSnJfHA=;
 b=RKSgAXdvYpv1qZrIUwcQnTy46OQXXqY3YAkrmqmdoR5MKHL94aXZEzWwy8FC3t6Jg9
 p3nFRAK4sgbdIYpHFTHonEkDxk+FLeCdRzYAlkiipGFSF2FFe3sh/JWAsLGURjM3jO0B
 6R50fjP1aJcB1OFD5i3przH2I+sh2lmbTf6/5rMB9LhkaCFPGZVrGbbIF9zo//BJLIAk
 OivRJQ40rRcLkoVhs6JQlQRsbQjylcewTcCDm3cek+o/NEp3d5PUYzPDwNJsRPCF1jPT
 NWGNUZtt2OgCQvI+/2QSQgQtRUu+rYIH7emrC300YaUF41AnANU3H1AsYVzOxdxu/lSg
 i28A==
X-Gm-Message-State: ABy/qLaGE/6KKnCKRl1GNpbi1mJKLqJ8Mr9SBaPn+l4S/iqbiV184zhV
 x67oSTAoPd2hwAMU7IHhgx3oep+z+qpLE3x/4ArlkU0LrouFUtt+ZJlFN0EoVej7SVYKa8L69OR
 5d5itWW1p2xm7bHEdL0LDg6V6ODOH91HGBeYZqA==
X-Received: by 2002:a0d:e5c6:0:b0:576:bfd7:1dac with SMTP id
 o189-20020a0de5c6000000b00576bfd71dacmr5841395ywe.24.1689378059290; 
 Fri, 14 Jul 2023 16:40:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGFR1U1r+iOWq9LG5xJ+j5zphVL8W6yGkoGpCz8p7aKlhTSlLIhprGVAG72NYrRMw4GJ+h8npxiLqmTp60Ag+w=
X-Received: by 2002:a0d:e5c6:0:b0:576:bfd7:1dac with SMTP id
 o189-20020a0de5c6000000b00576bfd71dacmr5841390ywe.24.1689378059101; Fri, 14
 Jul 2023 16:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230713164838.3583052-1-aahringo@redhat.com>
 <20230713164838.3583052-4-aahringo@redhat.com>
In-Reply-To: <20230713164838.3583052-4-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 14 Jul 2023 19:40:47 -0400
Message-ID: <CAK-6q+gNoZw9HSWvKKb2jS1m4W-NxbrsrPE4x_DudmpHiAhw0w@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCHv2 v6.5-rc1 3/3] fs: dlm: allow to
 F_SETLKW getting interrupted
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 13, 2023 at 12:49=E2=80=AFPM Alexander Aring <aahringo@redhat.c=
om> wrote:
>
> This patch implements dlm plock F_SETLKW interruption feature. If the
> pending plock operation is not sent to user space yet it can simple be
> dropped out of the send_list. In case it's already being sent we need to
> try to remove the waiters in dlm user space tool. If it was successful a
> reply with DLM_PLOCK_OP_CANCEL optype instead of DLM_PLOCK_OP_LOCK comes
> back (flag DLM_PLOCK_FL_NO_REPLY was then being cleared in user space)
> to signal the cancellation was successful. If a result with optype
> DLM_PLOCK_OP_LOCK came back then the cancellation was not successful.

There is another use-case for this op that's only used kernel
internally by nfs. It's F_CANCELLK [0]. I will try to implement this
feature as I think the current behaviour is broken [1].
An unlock is not a revert and if the lock request is in waiting state,
unlocking will do exactly nothing.

I am still questioning how the API of [0] is supposed to work as [0]
does not evaluate any return value if it was successfully canceled or
not. Maybe they meant cancel and if it was not successful unlock it,
but an unlock is not a revert and posix locks support up/downgrade
locking e.g. read/write locks. However I think unlocking if
cancellation wasn't successful is meant here.

Besides that, I will change that DLM_PLOCK_OP_CANCEL will always
expect a reply back.

- Alex

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/lockd/svclock.c#n705
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/fs/gfs2/file.c?h=3Dv6.5-rc1#n1439

