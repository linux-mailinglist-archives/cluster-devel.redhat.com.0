Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D996B3F4BDD
	for <lists+cluster-devel@lfdr.de>; Mon, 23 Aug 2021 15:49:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629726569;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=LZPZkxYippsu1lCOLx533ylh2ORQahlDMxoSxv8jTxM=;
	b=YWtQq1SpfqqLWibUeGIcIumdyHIp5gCXGa3ZKkjPdolh8V6heVmWZHev4yqT6YcJZoMbGv
	hvLOH2RMyuRAcyfxVbBpp46t+Qp8ltff3tc0Dy4EQwkRiehasXPW5YuZx9KDx4Yq4HaIeo
	sSIxQfnKYDiKzi/jZ4JNtVeqGKRLbKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-93DYPNRIPpavmTfTE4m_Cw-1; Mon, 23 Aug 2021 09:49:28 -0400
X-MC-Unique: 93DYPNRIPpavmTfTE4m_Cw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7A51801AC5;
	Mon, 23 Aug 2021 13:49:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F26B860BD9;
	Mon, 23 Aug 2021 13:49:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 903A64BB7C;
	Mon, 23 Aug 2021 13:49:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17NDnIxU010015 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 23 Aug 2021 09:49:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F4B3200ACFC; Mon, 23 Aug 2021 13:49:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AB1921568A1
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 13:49:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73A591801387
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 13:49:15 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
	[209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-101-eC6xuHR1NciLO8MOJJkbhg-1; Mon, 23 Aug 2021 09:49:13 -0400
X-MC-Unique: eC6xuHR1NciLO8MOJJkbhg-1
Received: by mail-qv1-f72.google.com with SMTP id
	dv7-20020ad44ee7000000b0036fa79fd337so1987244qvb.6
	for <cluster-devel@redhat.com>; Mon, 23 Aug 2021 06:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LZPZkxYippsu1lCOLx533ylh2ORQahlDMxoSxv8jTxM=;
	b=mLVVhlRPnt7MqmH8Ouybnmqvptm1v0/5GcZMDM/cuR+N4CNdUKOyD4C1GpUr4f4+dI
	TucAmAP5eNABs5q+8E8DsuJLZV1nfSmnj1fT8k8f4wMtLwoh0NedjqOdm4pUb6c2Bpgk
	tXFMcT4wScd6eoGLhRec8jyo1yEadyOjsqE9ixPpGUsajN9OMeVYkbHXapqdYN+1UDJd
	+7swBSpx8kNiI107r9WE01ELr4FP7IkeD1Ld9b6HkIJYDQVvCr8CF+qhD4iFzKwZqIh8
	rO4pxAy3+jDMXh+RC1Au173X2u7jMIu3fJZlcBPhYPi/VBFjeFKjCpByuJdC9AAl2I1H
	FUqQ==
X-Gm-Message-State: AOAM532IyYd2uB867iVMx5wnQM4D5YkTtQ78zDlKc3n2gEjF8xlRvDIc
	+ILJ0pMD6fO7vEw8Ad5TW06Kwf/4gUG2NLgg/NCr66y2a0T9Qt80+b70rKZmjGoig4KSdxu0p4z
	5zmkMgo278FC+pwGUrzO7M52bufFJf/i1ugEBoQ==
X-Received: by 2002:a05:620a:1aa5:: with SMTP id
	bl37mr5584321qkb.84.1629726553528; 
	Mon, 23 Aug 2021 06:49:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytT8paIEvWZ4rsPRX3ah8p3FZYidCytCBvLPqdoTF0DP/suPoY/IIwm9zdR2ds/CxDWqO45gxHB0aqTxxSntc=
X-Received: by 2002:a05:620a:1aa5:: with SMTP id
	bl37mr5584300qkb.84.1629726553286; 
	Mon, 23 Aug 2021 06:49:13 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR04MB64883088DB106BD3BC49B216CFC49@AM6PR04MB6488.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB64883088DB106BD3BC49B216CFC49@AM6PR04MB6488.eurprd04.prod.outlook.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Mon, 23 Aug 2021 09:49:02 -0400
Message-ID: <CAK-6q+jtpogQirTu86nR=pBrAZtaP6b5ouY275GuvXYq0K-1YA@mail.gmail.com>
To: Gang He <GHe@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] FS/DLM module triggered kernel BUG
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Gang He,

On Mon, Aug 23, 2021 at 1:43 AM Gang He <GHe@suse.com> wrote:
>
> Hello Guys,
>
> I used kernel 5.13.8, I sometimes encountered the dlm module triggered kernel BUG.

What do you exactly do? I would like to test it on a recent upstream
version, or you can do it?

> Since the dlm kernel module is not the latest source code, I am not sure if this problem is fixed, or not.
>

could be, see below.

> The backtrace is as below,
>
> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: remove member 172204615
> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_members 2 nodes
> [Fri Aug 20 16:24:14 2021] dlm: connection 000000005ef82293 got EOF from 172204615

here we disconnect from nodeid 172204615.

> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: generation 4 slots 2 1:172204786 2:172204748
> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory
> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory 8 in 1 new
> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory 1 out 1 messages
> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_masters
> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_masters 33587 of 33599
> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_locks 0 out
> [Fri Aug 20 16:24:14 2021] BUG: unable to handle page fault for address: ffffdd99ffd16650
> [Fri Aug 20 16:24:14 2021] #PF: supervisor write access in kernel mode
> [Fri Aug 20 16:24:14 2021] #PF: error_code(0x0002) - not-present page
> [Fri Aug 20 16:24:14 2021] PGD 1040067 P4D 1040067 PUD 19c3067 PMD 19c4067 PTE 0
> [Fri Aug 20 16:24:14 2021] Oops: 0002 [#1] SMP PTI
> [Fri Aug 20 16:24:14 2021] CPU: 1 PID: 25221 Comm: kworker/u4:1 Tainted: G        W         5.13.8-1-default #1 openSUSE Tumbleweed
> [Fri Aug 20 16:24:14 2021] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.9.1-0-gb3ef39f-prebuilt.qemu-project.org 04/01/2014
> [Fri Aug 20 16:24:14 2021] Workqueue: dlm_recv process_recv_sockets [dlm]
> [Fri Aug 20 16:24:14 2021] RIP: 0010:__srcu_read_unlock+0x15/0x20
> [Fri Aug 20 16:24:14 2021] Code: 01 65 48 ff 04 c2 f0 83 44 24 fc 00 44 89 c0 c3 0f 1f 44 00 00 0f 1f 44 00 00 f0 83 44 24 fc 00 48 8b 87 e8 0c 00 00 48 63 f6 <65> 48 ff 44 f0 10 c3 0f 1f 40 00 0f 1f 44 00 00 41 54 49 89 fc 55
> [Fri Aug 20 16:24:14 2021] RSP: 0018:ffffbd9a041ebd80 EFLAGS: 00010282
> [Fri Aug 20 16:24:14 2021] RAX: 00003cc9c100ec00 RBX: 00000000000000dc RCX: 0000000000000830
> [Fri Aug 20 16:24:14 2021] RDX: 0000000000000000 RSI: 0000000000000f48 RDI: ffffffffc06b4420
> [Fri Aug 20 16:24:14 2021] RBP: ffffa0d028423974 R08: 0000000000000001 R09: 0000000000000004
> [Fri Aug 20 16:24:14 2021] R10: 0000000000000000 R11: 0000000000000000 R12: ffffa0d028425000
> [Fri Aug 20 16:24:14 2021] R13: 000000000a43a2f2 R14: ffffa0d028425770 R15: 000000000a43a2f2
> [Fri Aug 20 16:24:14 2021] FS:  0000000000000000(0000) GS:ffffa0d03ed00000(0000) knlGS:0000000000000000
> [Fri Aug 20 16:24:14 2021] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [Fri Aug 20 16:24:14 2021] CR2: ffffdd99ffd16650 CR3: 0000000002696000 CR4: 00000000000406e0
> [Fri Aug 20 16:24:14 2021] Call Trace:
> [Fri Aug 20 16:24:14 2021]  dlm_receive_buffer+0x66/0x150 [dlm]

It would be interesting if we got here some message from nodeid
172204615 and I think this is what happens. There is maybe some use
after free going on and we should not receive anymore messages from
nodeid 172204615.
I recently added some dlm tracing infrastructure. It should be simple
to add a trace event here, print out the nodeid and compare
timestamps.

I recently fixed a synchronization issue which is not part of kernel
5.13.8 and has something to do with what you are seeing here.
There exists a workaround or a simple test if this really affects you,
simply create a dummy lockspace on all nodes so we actually never do
any disconnects and look if you are running again into this issue.

> [Fri Aug 20 16:24:14 2021]  dlm_process_incoming_buffer+0x38/0x90 [dlm]
> [Fri Aug 20 16:24:14 2021]  receive_from_sock+0xd4/0x1f0 [dlm]
> [Fri Aug 20 16:24:14 2021]  process_recv_sockets+0x1a/0x20 [dlm]
> [Fri Aug 20 16:24:14 2021]  process_one_work+0x1df/0x370
> [Fri Aug 20 16:24:14 2021]  worker_thread+0x50/0x400
> [Fri Aug 20 16:24:14 2021]  ? process_one_work+0x370/0x370
> [Fri Aug 20 16:24:14 2021]  kthread+0x127/0x150
> [Fri Aug 20 16:24:14 2021]  ? set_kthread_struct+0x40/0x40
> [Fri Aug 20 16:24:14 2021]  ret_from_fork+0x22/0x30

- Alex

