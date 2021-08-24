Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C2B3B3F600C
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Aug 2021 16:18:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629814731;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HKTDJeoAqj1rr1tSLZ9gyP7RHT0a0jkr//OImNglPrk=;
	b=AHwBn1ccm/QIvxrG7u8g0++Alxex5p5v44TCybY37O9hRUO5YueD3UqAaRNvx88UWUQXuj
	zz+9IUrYLqgBcXsEgYLQt0VbzFbNceFB+TJXNkiC5Pw4Kdvyt8WemfBsQPMpwc/2CIR4KE
	54gzC6kxOt1HbtuQUtRRVLnwuvIlmhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-dx0KbUbTNCO9xSsVGmrrCQ-1; Tue, 24 Aug 2021 10:18:49 -0400
X-MC-Unique: dx0KbUbTNCO9xSsVGmrrCQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8366B1853028;
	Tue, 24 Aug 2021 14:18:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7435169FAE;
	Tue, 24 Aug 2021 14:18:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A3D34BB7B;
	Tue, 24 Aug 2021 14:18:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OEIfDH001670 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 10:18:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D05BC216238D; Tue, 24 Aug 2021 14:18:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CACCF21415D0
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 14:18:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A56689C7E2
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 14:18:32 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
	[209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-160-nalxZm54PJO0uiqKu6Hv2w-1; Tue, 24 Aug 2021 10:18:30 -0400
X-MC-Unique: nalxZm54PJO0uiqKu6Hv2w-1
Received: by mail-qv1-f72.google.com with SMTP id
	gw9-20020a0562140f0900b0035decb1dfecso15000378qvb.5
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 07:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HKTDJeoAqj1rr1tSLZ9gyP7RHT0a0jkr//OImNglPrk=;
	b=gB4TPvCXmVE2PxVCkP5neNjLWgYiPNqr1v+JxgRElY/TuxLFPTW4mp4brZ7D3BChdN
	lk/A/WBWzCeTjMvnR5/p7CEM62HUjf28N4Gh0oanPubtXecCZ2K8/2iyDrP2QcxnerGB
	IEfNHoosEwWlIjLMfBMJNxwWXcVzmnP1NwcKPaQHKmAUG5c74OSDcbBJDj+nA1iBT5zh
	US9ygzNR1JHNSqViKz9WP9/1+wECde5hhBX+9lPq9jsf9R9d3YSBlqzSbqM/V2vBZpY+
	v6rorC/FKTxeEiJFr2VY1KSf+GWrGKJ1LkK+hP7Nki3bhJLgh0VWE2tC599p6GeXWBKw
	b4zA==
X-Gm-Message-State: AOAM533yButu8wTOK0U+Z2fHmTKpGkHPknMZ/hHPYRNUFmVjUL3uzWr6
	+cRhley1wAe41Zrm46h1kGFEPrPWgmQ439C2PF7tMvZqpYCsotmsfY7zQ/oY64HR3Q4K5D+hQBN
	BZlMiUBb9p3Cr9VnHa8LBW5DC7S6+LbnzeZgOwQ==
X-Received: by 2002:a37:9e48:: with SMTP id h69mr26838265qke.64.1629814710477; 
	Tue, 24 Aug 2021 07:18:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrHbUapsLsMylesjo5O6r83wsupawM645tpUMcJfvTY6IVUXKVasGd7uaCKii3mw8sXhQo4gjIySvBzCoJrfk=
X-Received: by 2002:a37:9e48:: with SMTP id h69mr26838250qke.64.1629814710270; 
	Tue, 24 Aug 2021 07:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR04MB64883088DB106BD3BC49B216CFC49@AM6PR04MB6488.eurprd04.prod.outlook.com>
	<CAK-6q+jtpogQirTu86nR=pBrAZtaP6b5ouY275GuvXYq0K-1YA@mail.gmail.com>
	<69e3b252-7929-9f4b-7ff4-eef47374e0c1@suse.com>
In-Reply-To: <69e3b252-7929-9f4b-7ff4-eef47374e0c1@suse.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 24 Aug 2021 10:18:18 -0400
Message-ID: <CAK-6q+iqY8iitFW7yewESyQ_0QUYHZP_RsnMwmev+456d758dA@mail.gmail.com>
To: Gang He <ghe@suse.com>
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

On Tue, Aug 24, 2021 at 1:36 AM Gang He <ghe@suse.com> wrote:
>
>
>
> On 2021/8/23 21:49, Alexander Aring wrote:
> > Hi Gang He,
> >
> > On Mon, Aug 23, 2021 at 1:43 AM Gang He <GHe@suse.com> wrote:
> >>
> >> Hello Guys,
> >>
> >> I used kernel 5.13.8, I sometimes encountered the dlm module triggered kernel BUG.
> >
> > What do you exactly do? I would like to test it on a recent upstream
> > version, or you can do it?
> I am not specifically to test the dlm kernel module.
> I am doing ocfs2 related testing with opensuse Tumbleweed, which
> includes a very new kernel version.
> But sometimes the ocfs2 test cases were blocked/aborted, due to this DLM
> problem.
>

I see. What is the ocfs2 test trying to do? Maybe I will be able to
reproduce it.

> >
> >> Since the dlm kernel module is not the latest source code, I am not sure if this problem is fixed, or not.
> >>
> >
> > could be, see below.
> >
> >> The backtrace is as below,
> >>
> >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: remove member 172204615
> >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_members 2 nodes
> >> [Fri Aug 20 16:24:14 2021] dlm: connection 000000005ef82293 got EOF from 172204615
> >
> > here we disconnect from nodeid 172204615.
> >
> >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: generation 4 slots 2 1:172204786 2:172204748
> >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory
> >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory 8 in 1 new
> >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory 1 out 1 messages
> >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_masters
> >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_masters 33587 of 33599
> >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_locks 0 out
> >> [Fri Aug 20 16:24:14 2021] BUG: unable to handle page fault for address: ffffdd99ffd16650
> >> [Fri Aug 20 16:24:14 2021] #PF: supervisor write access in kernel mode
> >> [Fri Aug 20 16:24:14 2021] #PF: error_code(0x0002) - not-present page
> >> [Fri Aug 20 16:24:14 2021] PGD 1040067 P4D 1040067 PUD 19c3067 PMD 19c4067 PTE 0
> >> [Fri Aug 20 16:24:14 2021] Oops: 0002 [#1] SMP PTI
> >> [Fri Aug 20 16:24:14 2021] CPU: 1 PID: 25221 Comm: kworker/u4:1 Tainted: G        W         5.13.8-1-default #1 openSUSE Tumbleweed
> >> [Fri Aug 20 16:24:14 2021] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.9.1-0-gb3ef39f-prebuilt.qemu-project.org 04/01/2014
> >> [Fri Aug 20 16:24:14 2021] Workqueue: dlm_recv process_recv_sockets [dlm]
> >> [Fri Aug 20 16:24:14 2021] RIP: 0010:__srcu_read_unlock+0x15/0x20
> >> [Fri Aug 20 16:24:14 2021] Code: 01 65 48 ff 04 c2 f0 83 44 24 fc 00 44 89 c0 c3 0f 1f 44 00 00 0f 1f 44 00 00 f0 83 44 24 fc 00 48 8b 87 e8 0c 00 00 48 63 f6 <65> 48 ff 44 f0 10 c3 0f 1f 40 00 0f 1f 44 00 00 41 54 49 89 fc 55
> >> [Fri Aug 20 16:24:14 2021] RSP: 0018:ffffbd9a041ebd80 EFLAGS: 00010282
> >> [Fri Aug 20 16:24:14 2021] RAX: 00003cc9c100ec00 RBX: 00000000000000dc RCX: 0000000000000830
> >> [Fri Aug 20 16:24:14 2021] RDX: 0000000000000000 RSI: 0000000000000f48 RDI: ffffffffc06b4420
> >> [Fri Aug 20 16:24:14 2021] RBP: ffffa0d028423974 R08: 0000000000000001 R09: 0000000000000004
> >> [Fri Aug 20 16:24:14 2021] R10: 0000000000000000 R11: 0000000000000000 R12: ffffa0d028425000
> >> [Fri Aug 20 16:24:14 2021] R13: 000000000a43a2f2 R14: ffffa0d028425770 R15: 000000000a43a2f2
> >> [Fri Aug 20 16:24:14 2021] FS:  0000000000000000(0000) GS:ffffa0d03ed00000(0000) knlGS:0000000000000000
> >> [Fri Aug 20 16:24:14 2021] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> [Fri Aug 20 16:24:14 2021] CR2: ffffdd99ffd16650 CR3: 0000000002696000 CR4: 00000000000406e0
> >> [Fri Aug 20 16:24:14 2021] Call Trace:
> >> [Fri Aug 20 16:24:14 2021]  dlm_receive_buffer+0x66/0x150 [dlm]
> >
> > It would be interesting if we got here some message from nodeid
> > 172204615 and I think this is what happens. There is maybe some use
> > after free going on and we should not receive anymore messages from
> > nodeid 172204615.
> > I recently added some dlm tracing infrastructure. It should be simple
> > to add a trace event here, print out the nodeid and compare
> > timestamps.
> >
> > I recently fixed a synchronization issue which is not part of kernel
> > 5.13.8 and has something to do with what you are seeing here.
> > There exists a workaround or a simple test if this really affects you,
> > simply create a dummy lockspace on all nodes so we actually never do
> > any disconnects and look if you are running again into this issue.
> What is this git commit? I do not want to see any kernel (warning) print
> about DLM kernel module. Sometimes, DLM would enter a stuck state after
> the DLM kernel print.

Yes, a BUG() usually makes the kernel in an unusable state. It is not
a warning, it's a serious issue.

> Since there were a few commits in the past weeks, I just wonder if there
> is any regression problem.
>

Possible or they made an existing issue more likely to hit as before.
It would be useful to get the information from which nodeid the
message came that is currently parsed by dlm_receive_buffer().
As I said I experience issues myself on dlm connection termination
which should be fixed on recent upstream. May you can try the
commands:

git cherry-pick 8aa31cbf20ad..7d3848c03e09
git cherry-pick 700ab1c363c7..957adb68b3f7
git cherry-pick 2df6b7627a81

should do a sync to mainline on dlm in v5.13.8. It would be very
interesting if you still experience such problems with those patches.
Please report back.

Normally (and I think also in your case as well) you have lvmlockd
running all the time in the background which leaves lockspaces open
e.g. lvm_global and lvm_$VG. In my opinion that is one reason why most
users didn't hit issues in this area before. Please test it still
without lvmlockd running.

- Alex

