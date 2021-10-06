Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 23362423D88
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Oct 2021 14:16:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633522614;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pO4PlWo7HtXIXRFXm7PKxdfb4eUPK7D//T+BQxzSe24=;
	b=cVnzD0hagC346JBfeIdN+1yLXhKLAG+aVV6iSrcRFvtmjUECiXJ8qmGcm1omU7mMx6ouUc
	PyK1tLZjZeSGP28C2Va2uRzgKxqO4lLCBk5vVUNKgsn4fAn2Qri7yA6rzORcf2xoSWr14e
	fw3o/gfv/cv+1EhasfSjspxw7KGPnhY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-A86n0iaENImvITh99Leb5g-1; Wed, 06 Oct 2021 08:16:52 -0400
X-MC-Unique: A86n0iaENImvITh99Leb5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3853100CCC0;
	Wed,  6 Oct 2021 12:16:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33D1519736;
	Wed,  6 Oct 2021 12:16:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6690857DC2;
	Wed,  6 Oct 2021 12:16:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 196CEkw9008229 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 6 Oct 2021 08:14:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A29C82EF9F; Wed,  6 Oct 2021 12:14:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 993B74E6A1
	for <cluster-devel@redhat.com>; Wed,  6 Oct 2021 12:14:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7CB3899EC3
	for <cluster-devel@redhat.com>; Wed,  6 Oct 2021 12:14:37 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
	[209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-540-KkvVY1ayM_aVCkZD3SO21w-1; Wed, 06 Oct 2021 08:14:36 -0400
X-MC-Unique: KkvVY1ayM_aVCkZD3SO21w-1
Received: by mail-io1-f71.google.com with SMTP id
	k20-20020a5d97d4000000b005da6f3b7dc7so1963801ios.1
	for <cluster-devel@redhat.com>; Wed, 06 Oct 2021 05:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:references:from:in-reply-to
	:content-transfer-encoding;
	bh=pO4PlWo7HtXIXRFXm7PKxdfb4eUPK7D//T+BQxzSe24=;
	b=8HgCjBcLhaeVGoH9RnJa/+zlvRb8Jw6Fomafuz7iCsH6Zph95+vpJJbJRMhOOxt5nt
	LDHsGcA0WajSnOw993yEJW9/nieP3DWnOK2ROMeQYsVdO3/ZGtb1xDEmnvPi/Q4smODY
	zu29yr5ThhGod+G7KBxvLedVd/eJ1vQCz5dQhkgnxdeaGQ0vtjG9tLdZ0fYhvDBEqVem
	zvDPheF62qym37AoM+voi968tZ1H8uX3NdVsV1IRG+RYvxPSZK0C4vCpAtL8xWZzPBQC
	Hakme0L1Gs2Rfk75U0Y+BUZPOrkuOHt1G8Vj6qkoUDHNqPra+kQybclhjebyUsVgTaqz
	zb9A==
X-Gm-Message-State: AOAM530RAmjN+5LTMbL+rp4QLasSbtUASEKELAB1tOJAVrI3UNoJ4THh
	DPgVVJz6F1t2d6bQIx7FQ8HQJ+fEcuOZoJGCZrJNvvDIWVpQF+pWmx5U5JhU84cU+W7UPMAYZoj
	yUW+Ob6qIXlb8tVdlkW7wgg==
X-Received: by 2002:a02:998a:: with SMTP id a10mr6959462jal.23.1633522475345; 
	Wed, 06 Oct 2021 05:14:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUzM5RufE+kX+JI2YU2VehZCyjN0dYG5quERcJmLyHP4rvBAFs45Zc48/UnZnKXY676Eimsw==
X-Received: by 2002:a02:998a:: with SMTP id a10mr6959444jal.23.1633522475012; 
	Wed, 06 Oct 2021 05:14:35 -0700 (PDT)
Received: from [172.16.0.19] ([172.87.10.244])
	by smtp.gmail.com with ESMTPSA id
	a5sm13238251ilf.27.2021.10.06.05.14.34
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 06 Oct 2021 05:14:34 -0700 (PDT)
Message-ID: <cf8bc8dd-8e16-3590-a714-51203e6f4ba9@redhat.com>
Date: Wed, 6 Oct 2021 07:14:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.1.0
To: Hao Sun <sunhao.th@gmail.com>, agruenba@redhat.com,
	cluster-devel@redhat.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	akpm@linux-foundation.org, Linux MM <linux-mm@kvack.org>
References: <CACkBjsbEcdArgkRDy0QVegPoDCUPNGDikPCa_hBprEQb-6TThQ@mail.gmail.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <CACkBjsbEcdArgkRDy0QVegPoDCUPNGDikPCa_hBprEQb-6TThQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] WARNING in __set_page_dirty
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/6/21 3:50 AM, Hao Sun wrote:
> Hello,
> 
> When using Healer to fuzz the latest Linux kernel, the following crash
> was triggered.
> 
> HEAD commit: 0513e464f900 Merge tag 'perf-tools-fixes-for-v5.15-2021-09-27'
> git tree: upstream
> console output:
> https://drive.google.com/file/d/1Tqtv5Qcx5LDPwnv7b2uJS2bilqpGfipG/view?usp=sharing
> kernel config: https://drive.google.com/file/d/1Jqhc4DpCVE8X7d-XBdQnrMoQzifTG5ho/view?usp=sharing
> 
> If you fix this issue, please add the following tag to the commit:
> Reported-by: Hao Sun <sunhao.th@gmail.com>
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 19902 at ./include/linux/backing-dev.h:286
> inode_to_wb include/linux/backing-dev.h:283 [inline]
> WARNING: CPU: 0 PID: 19902 at ./include/linux/backing-dev.h:286
> account_page_dirtied mm/page-writeback.c:2452 [inline]
> WARNING: CPU: 0 PID: 19902 at ./include/linux/backing-dev.h:286
> __set_page_dirty+0x50b/0x6e0 mm/page-writeback.c:2500
> Modules linked in:
> CPU: 0 PID: 19902 Comm: syz-executor Not tainted 5.15.0-rc3+ #21
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> RIP: 0010:inode_to_wb include/linux/backing-dev.h:283 [inline]
> RIP: 0010:account_page_dirtied mm/page-writeback.c:2452 [inline]
> RIP: 0010:__set_page_dirty+0x50b/0x6e0 mm/page-writeback.c:2500
> Code: fc ff ff e8 d7 0a f1 ff 49 8b 87 a8 01 00 00 be ff ff ff ff 48
> 8d 78 70 e8 a2 42 de 02 85 c0 0f 85 18 fc ff ff e8 b5 0a f1 ff <0f> 0b
> e9 0c fc ff ff e8 a9 0a f1 ff 48 89 ef e8 f1 ea d8 00 48 8b
> RSP: 0018:ffffc90003e7bd08 EFLAGS: 00010093
> RAX: 0000000000000000 RBX: ffffea000083a140 RCX: 0000000000000000
> RDX: ffff88810e1b8000 RSI: ffffffff814686ab RDI: ffffffff853ccbb6
> RBP: ffff88800ce0bec8 R08: 0000000000000001 R09: 0000000000000000
> R10: ffffc90003e7bbb8 R11: 0000000000000003 R12: ffff8881100ecc98
> R13: ffff8881045ac000 R14: 0000000000000293 R15: ffff88800ce0bec8
> FS:  00007f72d08c8700(0000) GS:ffff88807dc00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000003 CR3: 000000001a0a6000 CR4: 0000000000750ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000600
> PKRU: 55555554
> Call Trace:
>   mark_buffer_dirty+0x1d4/0x2b0 fs/buffer.c:1108
>   gfs2_unpin+0x74/0x460 fs/gfs2/lops.c:111
>   buf_lo_after_commit+0x6b/0x80 fs/gfs2/lops.c:750
>   lops_after_commit fs/gfs2/lops.h:49 [inline]
>   gfs2_log_flush+0x9ba/0x1050 fs/gfs2/log.c:1108
>   gfs2_sync_fs+0x3c/0x50 fs/gfs2/super.c:644
>   sync_fs_one_sb+0x40/0x50 fs/sync.c:81
>   iterate_supers+0xa7/0x130 fs/super.c:695
>   ksys_sync+0x60/0xc0 fs/sync.c:116
>   __do_sys_sync+0xa/0x10 fs/sync.c:125
>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>   do_syscall_64+0x34/0xb0 arch/x86/entry/common.c:80
>   entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x200008ca
> Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 00 00 00 00 00 00 00 00 00 00 00 98 4a 2a e9 2c b8 b6 4c 0f 05 <bf> 00
> 00 40 00 c4 a3 7b f0 c5 01 41 e2 e9 c4 22 e9 aa bb 3c 00 00
> RSP: 002b:00007f72d08c7ba8 EFLAGS: 00000a83 ORIG_RAX: 00000000000000a2
> RAX: ffffffffffffffda RBX: 0000000000000009 RCX: 00000000200008ca
> RDX: 0000000000004c01 RSI: 0000000000000003 RDI: 0000000000400000
> RBP: 00000000000000eb R08: 0000000000000005 R09: 0000000000000006
> R10: 0000000000000007 R11: 0000000000000a83 R12: 000000000000000b
> R13: 000000000000000c R14: 000000000000000d R15: 00007ffe4f7c7800
> 
Hi,

This is a long-standing problem we've known about for years, and there
has been a long-standing discussion about it. I've made some attempts to
fix it, but none have been satisfactory. Some people in the upstream
community insist there should be a 1:1 correspondence between inodes
and address spaces (which is the root of the problem), but there seems
to be no documentation to back that up. What we do know well is this
scenario, which does indeed make that assumption. While we ponder the
problem, it seems to cause no harm unless you have lockdep set, so it's
never been our highest priority to fix.

Regards,

Bob Peterson
GFS2 File System

