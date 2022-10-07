Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 939EE5F7221
	for <lists+cluster-devel@lfdr.de>; Fri,  7 Oct 2022 02:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665100869;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=LrPvkdNfNntMIlR3spLKPFVEuIn87MEMvPYUN3bXIaE=;
	b=iXf4aoY4pV2tTf1nr42wj9I9yiZsj34PHns6S+S/hXqgS4fMYiBjKGC4BYUv9JuzcTNQms
	7cl7yp3flF6RF48hSgoOraL10dmhbd1TT56N8EygZDXJCmmJXarY7gz1bJytbhseHpwhWV
	bv3Lgeqq6GRDKAqfvq3zEmG3lBS1SZ0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-iT6Y8-hSPS6dO4Id_TKzMA-1; Thu, 06 Oct 2022 20:01:06 -0400
X-MC-Unique: iT6Y8-hSPS6dO4Id_TKzMA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 776B81C068D0;
	Fri,  7 Oct 2022 00:01:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 05ADB49BB67;
	Fri,  7 Oct 2022 00:01:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B2A8B1946A51;
	Fri,  7 Oct 2022 00:01:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D28171946588 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  7 Oct 2022 00:01:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ADADB535939; Fri,  7 Oct 2022 00:01:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6E9E535942
 for <cluster-devel@redhat.com>; Fri,  7 Oct 2022 00:01:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A58329AB3E7
 for <cluster-devel@redhat.com>; Fri,  7 Oct 2022 00:01:02 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-19-vBdT308AN76kSDuoYs7KEQ-1; Thu, 06 Oct 2022 20:00:59 -0400
X-MC-Unique: vBdT308AN76kSDuoYs7KEQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 h129-20020a1c2187000000b003be5419a7e4so1161148wmh.1
 for <cluster-devel@redhat.com>; Thu, 06 Oct 2022 17:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LrPvkdNfNntMIlR3spLKPFVEuIn87MEMvPYUN3bXIaE=;
 b=0kwz+bJK0byHvaEZcwEHPsfnmkGMryWOyQl52kbSid6DvaUk0Rr2Arcw1GmUt8LQK9
 Ev2QQ6Ky/8PvMffXKu0bb0XfSJxnTpzPdqU9jOySt50F/cg2BP9Fp+gOzDgKzsCCKBAI
 B1oSA6rNbOM6oTe/pA53SuOOjb+kSjvF/B89bH4Mhypa1t9cht5wbN+tQGLUh8wHqfxP
 NvYVb+K9oHGIEdHRrUWuP1cxZCEJ7B3VQe4Vy+4mgnTJVvHzUies5MIZ6SPhLnM3Cm/4
 8amfT3PQIsYJwGDRlhrQ82J81VoevdboREtjkwWmHtHDWgcGkQ1VP6Vxv83JvCkt5pcO
 QnzQ==
X-Gm-Message-State: ACrzQf3whX5SkTk/dO9IGHMTc5g0AyzRDTPr7rTy5M3NzCcaKbX9zoY3
 AGVGe6tmEgAGg59L+QiQQpiWdr+QJR2jDDAo5y16/qQxTnHjKC3sMTBiZZbVMxjuhuvPAcuaKQW
 SmxUjA7+JytcGuqpAuWIou8o3+y1cy5Lgj/V3Xw==
X-Received: by 2002:a05:600c:4e15:b0:3b4:a621:b54e with SMTP id
 b21-20020a05600c4e1500b003b4a621b54emr1392007wmq.47.1665100857867; 
 Thu, 06 Oct 2022 17:00:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6gRTq1T7oUadsjMQVcsqfaJnpSZ318MER5DGuCnpQzriBd8FABJ61Pn0eo4sAMxSVjKEcNpBYnpp2m8py66Io=
X-Received: by 2002:a05:600c:4e15:b0:3b4:a621:b54e with SMTP id
 b21-20020a05600c4e1500b003b4a621b54emr1392000wmq.47.1665100857703; Thu, 06
 Oct 2022 17:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221006155606.687350-1-aahringo@redhat.com>
 <CAK-6q+iP7f_QLXBTufF-qTKOSqNtujXJsWH4Yo4ke=9uQqF1Tw@mail.gmail.com>
In-Reply-To: <CAK-6q+iP7f_QLXBTufF-qTKOSqNtujXJsWH4Yo4ke=9uQqF1Tw@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Thu, 6 Oct 2022 20:00:46 -0400
Message-ID: <CAK-6q+g9BX9iyJy4yeY90_AqbeeFbjWwztr1QDCTz=8mYF0nZw@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, Oct 6, 2022 at 5:01 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> Hi,
>
> On Thu, Oct 6, 2022 at 11:56 AM Alexander Aring <aahringo@redhat.com> wrote:
> >
> > This patch fixes the following false positive circular locking
> > dependency:
> >
> > [   61.272390] ======================================================
> > [   61.273416] WARNING: possible circular locking dependency detected
> > [   61.274474] 6.0.0+ #1949 Tainted: G        W
> > [   61.275318] ------------------------------------------------------
> > [   61.276336] umount/1205 is trying to acquire lock:
> > [   61.277135] ffffa17e7d1d2158 ((work_completion)(&con->rwork)){+.+.}-{0:0}, at: __flush_work+0x4d/0x4c0
> > [   61.278652]
> >                but task is already holding lock:
> > [   61.279615] ffffa17e07888c80 (&con->sock_mutex){+.+.}-{3:3}, at: close_connection+0x67/0x180
> > [   61.281005]
> >                which lock already depends on the new lock.
> >
> > [   61.282375]
> >                the existing dependency chain (in reverse order) is:
> > [   61.283583]
> >                -> #1 (&con->sock_mutex){+.+.}-{3:3}:
> > [   61.284595]        lock_acquire+0xd3/0x300
> > [   61.285280]        __mutex_lock+0x99/0x1040
> > [   61.285955]        mutex_lock_nested+0x1b/0x30
> > [   61.286679]        receive_from_sock+0x40/0x350
> > [   61.287449]        process_recv_sockets+0x15/0x20
> > [   61.288249]        process_one_work+0x286/0x5f0
> > [   61.288989]        worker_thread+0x44/0x390
> > [   61.289674]        kthread+0x107/0x130
> > [   61.290310]        ret_from_fork+0x1f/0x30
> > [   61.291006]
> >                -> #0 ((work_completion)(&con->rwork)){+.+.}-{0:0}:
> > [   61.292215]        check_prevs_add+0x18b/0x1040
> > [   61.292980]        __lock_acquire+0x11ec/0x1630
> > [   61.293721]        lock_acquire+0xd3/0x300
> > [   61.294403]        __flush_work+0x6d/0x4c0
> > [   61.295076]        __cancel_work_timer+0x156/0x1e0
> > [   61.295855]        cancel_work_sync+0x10/0x20
> > [   61.296581]        close_connection+0x12a/0x180
> > [   61.297338]        close_connection+0x150/0x180
> > [   61.298071]        free_conn+0x21/0xc0
> > [   61.298682]        foreach_conn+0x49/0x70
> > [   61.299347]        dlm_lowcomms_stop+0x75/0xf0
> > [   61.300071]        dlm_release_lockspace+0x3fa/0x520
> > [   61.300884]        gdlm_unmount+0x64/0x90
> > [   61.301544]        gfs2_lm_unmount+0x37/0x50
> > [   61.302262]        gfs2_put_super+0x193/0x220
> > [   61.303002]        generic_shutdown_super+0x77/0x130
> > [   61.303843]        kill_block_super+0x27/0x50
> > [   61.304567]        gfs2_kill_sb+0x68/0x80
> > [   61.305254]        deactivate_locked_super+0x32/0x80
> > [   61.306054]        deactivate_super+0x59/0x60
> > [   61.306760]        cleanup_mnt+0xbd/0x150
> > [   61.307431]        __cleanup_mnt+0x12/0x20
> > [   61.308109]        task_work_run+0x6f/0xc0
> > [   61.308768]        exit_to_user_mode_prepare+0x1c4/0x1d0
> > [   61.309633]        syscall_exit_to_user_mode+0x1d/0x50
> > [   61.310469]        do_syscall_64+0x46/0x90
> > [   61.311139]        entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > [   61.312036]
> >                other info that might help us debug this:
> >
> > [   61.313328]  Possible unsafe locking scenario:
> >
> > [   61.314316]        CPU0                    CPU1
> > [   61.315077]        ----                    ----
> > [   61.315814]   lock(&con->sock_mutex);
> > [   61.316432]                                lock((work_completion)(&con->rwork));
> > [   61.317621]                                lock(&con->sock_mutex);
> > [   61.318628]   lock((work_completion)(&con->rwork));
> > [   61.319445]
> >                 *** DEADLOCK ***
> >
>
> I got another one... I will try to make a different approach about the
> use of the socket lock. We need it so that a socket doesn't get closed

s/closed/released/

> when we are actually running some workqueue handling... The new
> approach will also allow more full duplex dlm lowcomms handling.
> Currently it's kind of half-duplex because the socket mutex hangs
> around in send and recv(incl. processing)...

internal socket handling will lock as well, but the whole mutex lock
recv/send is around the whole workers loop.

- Alex

