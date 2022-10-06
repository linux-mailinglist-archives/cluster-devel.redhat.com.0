Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4E55F6FE1
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Oct 2022 23:01:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665090108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=jL4T8cJaS/ZJtAUwmKLeCzdUdhnd6AUn6nwXFY3Nd/I=;
	b=WAP0YaB9NEGMrit4xke7IJehw9soBxhu71xbYZXUpVS7Cc+wpsV0iwVFMt1xKngx1bNMCf
	g2T41qCyIkC+T4C29V/jZ7AGVcO7RTp3uubx9Kf49mypjC4ij188P7q21WrNICxbzGKQpM
	VcV6gIcAu+K7oFwiQIkAT+5Leb5kDtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-WQxRxPK6Of-cBk3ihtVDyw-1; Thu, 06 Oct 2022 17:01:47 -0400
X-MC-Unique: WQxRxPK6Of-cBk3ihtVDyw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E80C4811E87;
	Thu,  6 Oct 2022 21:01:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B26009D494;
	Thu,  6 Oct 2022 21:01:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1CF6A1946A4A;
	Thu,  6 Oct 2022 21:01:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1B31D1946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Oct 2022 21:01:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EF969404705F; Thu,  6 Oct 2022 21:01:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E84EB404704A
 for <cluster-devel@redhat.com>; Thu,  6 Oct 2022 21:01:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAD293810798
 for <cluster-devel@redhat.com>; Thu,  6 Oct 2022 21:01:40 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-251-a7-22uSsP9yxOTwgKqNv9A-1; Thu, 06 Oct 2022 17:01:39 -0400
X-MC-Unique: a7-22uSsP9yxOTwgKqNv9A-1
Received: by mail-wm1-f69.google.com with SMTP id
 n32-20020a05600c3ba000b003b5054c71faso3173339wms.9
 for <cluster-devel@redhat.com>; Thu, 06 Oct 2022 14:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jL4T8cJaS/ZJtAUwmKLeCzdUdhnd6AUn6nwXFY3Nd/I=;
 b=SognF/wjpt5J4bk2vY4VoA/ImYGYr9GkCzCGsW1hst7I2j5zuBt9caKKei6xS1Ylyb
 ErXiPUeoO6JzqebEUnid6LOWCXnbm4ocBj8QDPsFnXyi4//Vv7Kk/FK8t4l7uMmaOkss
 zbLaWSg17b2ywG/j/Y0B6Kn9sC2uUq8B1dIu5PthabKqmIVTYzYFYDgPNl6Ee0YjIkDp
 jKrgsfS2HjkmYkFifhuFJ4cQpNqN7FP8W7mVPEGfSesKSPNWW/gM3/qlrIgdhesJrRh/
 BfHm8TOkOZvdAr55/+KQTXkQNNq5hOMO3zg7wYUaH1wqiIa6VPPbjxVfwTXOtCOtEB5T
 hk6Q==
X-Gm-Message-State: ACrzQf0/KWaJCvMAY1ps4dgtC2GUkDeAqJvp5puEcQqvlOhMEC472RIC
 XW52Xby9+1FSrMQESL0eDXs08l9wxdVZfjEGbIA5EooFZbyI7XBA8GrLuCXJ9vW4RJtGWXeXdMW
 F1v/xq1rzNTHRxlbXFPszkHH/PNzhfQnpAVkT7Q==
X-Received: by 2002:a5d:4e09:0:b0:22e:3a03:a860 with SMTP id
 p9-20020a5d4e09000000b0022e3a03a860mr1140008wrt.289.1665090098395; 
 Thu, 06 Oct 2022 14:01:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM40Ux9xxUcUTTEnhMZyDf3D9NoolSlifmn/znupTNOfoGthVFKhBZBTktlmsdCmwPZxOD9gQD+AhuPAQLmhuac=
X-Received: by 2002:a5d:4e09:0:b0:22e:3a03:a860 with SMTP id
 p9-20020a5d4e09000000b0022e3a03a860mr1140003wrt.289.1665090098200; Thu, 06
 Oct 2022 14:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221006155606.687350-1-aahringo@redhat.com>
In-Reply-To: <20221006155606.687350-1-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 6 Oct 2022 17:01:27 -0400
Message-ID: <CAK-6q+iP7f_QLXBTufF-qTKOSqNtujXJsWH4Yo4ke=9uQqF1Tw@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH dlm/next 1/2] fs: dlm: fix possible
 circular locking dependency
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Oct 6, 2022 at 11:56 AM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch fixes the following false positive circular locking
> dependency:
>
> [   61.272390] ======================================================
> [   61.273416] WARNING: possible circular locking dependency detected
> [   61.274474] 6.0.0+ #1949 Tainted: G        W
> [   61.275318] ------------------------------------------------------
> [   61.276336] umount/1205 is trying to acquire lock:
> [   61.277135] ffffa17e7d1d2158 ((work_completion)(&con->rwork)){+.+.}-{0:0}, at: __flush_work+0x4d/0x4c0
> [   61.278652]
>                but task is already holding lock:
> [   61.279615] ffffa17e07888c80 (&con->sock_mutex){+.+.}-{3:3}, at: close_connection+0x67/0x180
> [   61.281005]
>                which lock already depends on the new lock.
>
> [   61.282375]
>                the existing dependency chain (in reverse order) is:
> [   61.283583]
>                -> #1 (&con->sock_mutex){+.+.}-{3:3}:
> [   61.284595]        lock_acquire+0xd3/0x300
> [   61.285280]        __mutex_lock+0x99/0x1040
> [   61.285955]        mutex_lock_nested+0x1b/0x30
> [   61.286679]        receive_from_sock+0x40/0x350
> [   61.287449]        process_recv_sockets+0x15/0x20
> [   61.288249]        process_one_work+0x286/0x5f0
> [   61.288989]        worker_thread+0x44/0x390
> [   61.289674]        kthread+0x107/0x130
> [   61.290310]        ret_from_fork+0x1f/0x30
> [   61.291006]
>                -> #0 ((work_completion)(&con->rwork)){+.+.}-{0:0}:
> [   61.292215]        check_prevs_add+0x18b/0x1040
> [   61.292980]        __lock_acquire+0x11ec/0x1630
> [   61.293721]        lock_acquire+0xd3/0x300
> [   61.294403]        __flush_work+0x6d/0x4c0
> [   61.295076]        __cancel_work_timer+0x156/0x1e0
> [   61.295855]        cancel_work_sync+0x10/0x20
> [   61.296581]        close_connection+0x12a/0x180
> [   61.297338]        close_connection+0x150/0x180
> [   61.298071]        free_conn+0x21/0xc0
> [   61.298682]        foreach_conn+0x49/0x70
> [   61.299347]        dlm_lowcomms_stop+0x75/0xf0
> [   61.300071]        dlm_release_lockspace+0x3fa/0x520
> [   61.300884]        gdlm_unmount+0x64/0x90
> [   61.301544]        gfs2_lm_unmount+0x37/0x50
> [   61.302262]        gfs2_put_super+0x193/0x220
> [   61.303002]        generic_shutdown_super+0x77/0x130
> [   61.303843]        kill_block_super+0x27/0x50
> [   61.304567]        gfs2_kill_sb+0x68/0x80
> [   61.305254]        deactivate_locked_super+0x32/0x80
> [   61.306054]        deactivate_super+0x59/0x60
> [   61.306760]        cleanup_mnt+0xbd/0x150
> [   61.307431]        __cleanup_mnt+0x12/0x20
> [   61.308109]        task_work_run+0x6f/0xc0
> [   61.308768]        exit_to_user_mode_prepare+0x1c4/0x1d0
> [   61.309633]        syscall_exit_to_user_mode+0x1d/0x50
> [   61.310469]        do_syscall_64+0x46/0x90
> [   61.311139]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [   61.312036]
>                other info that might help us debug this:
>
> [   61.313328]  Possible unsafe locking scenario:
>
> [   61.314316]        CPU0                    CPU1
> [   61.315077]        ----                    ----
> [   61.315814]   lock(&con->sock_mutex);
> [   61.316432]                                lock((work_completion)(&con->rwork));
> [   61.317621]                                lock(&con->sock_mutex);
> [   61.318628]   lock((work_completion)(&con->rwork));
> [   61.319445]
>                 *** DEADLOCK ***
>

I got another one... I will try to make a different approach about the
use of the socket lock. We need it so that a socket doesn't get closed
when we are actually running some workqueue handling... The new
approach will also allow more full duplex dlm lowcomms handling.
Currently it's kind of half-duplex because the socket mutex hangs
around in send and recv(incl. processing)...

- Alex

