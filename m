Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 946E6285E4E
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Oct 2020 13:40:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602070815;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VnpOHvJy8LvAhL+Lm2aOHdven8UGI5jNfFG54RH0lno=;
	b=gDxPRq+GCor8QHm7jXfMNMil3N7cUO9Knc1EcQJ/DeZx4cPSRISXWfrXqnoctDblisQeFf
	MBDplFK6FNhu1r5MfTjMsRMRRFNyOEOC2kBgTmxruiOZZLUoIs9fAlv8er3KEI38UGWLNA
	Oj5sHs+QVvAgk6vnfwwWGwVYd5ujO6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-vZr0tdmhPoOx77d57g47eQ-1; Wed, 07 Oct 2020 07:40:13 -0400
X-MC-Unique: vZr0tdmhPoOx77d57g47eQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F8911018F7D;
	Wed,  7 Oct 2020 11:40:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0890D5C1BD;
	Wed,  7 Oct 2020 11:40:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B233181A869;
	Wed,  7 Oct 2020 11:40:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 097Be8l3004585 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 7 Oct 2020 07:40:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 688265D9F3; Wed,  7 Oct 2020 11:40:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.138] (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C4E675D9E2;
	Wed,  7 Oct 2020 11:40:02 +0000 (UTC)
To: syzbot <syzbot+43fa87986bdd31df9de6@syzkaller.appspotmail.com>,
	agruenba@redhat.com, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org, rpeterso@redhat.com,
	syzkaller-bugs@googlegroups.com
References: <00000000000035788305b1000361@google.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <48e63ee5-7d68-6502-33e0-9ab5489290ce@redhat.com>
Date: Wed, 7 Oct 2020 12:40:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <00000000000035788305b1000361@google.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] general protection fault in gfs2_rgrp_dump
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/10/2020 13:48, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    7575fdda Merge tag 'platform-drivers-x86-v5.9-2' of git://..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14abb7c7900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=de7f697da23057c7
> dashboard link: https://syzkaller.appspot.com/bug?extid=43fa87986bdd31df9de6
> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+43fa87986bdd31df9de6@syzkaller.appspotmail.com
> 
> gfs2: fsid=syz:syz.0: ri_addr = 20
> ri_length = 1
> ri_data0 = 21
> ri_data = 2060
> ri_bitbytes = 0

I could reproduce this by setting ri_bitbytes in the first rindex entry 
to 0. The bug is in the error path.

Patch submitted: 
https://www.redhat.com/archives/cluster-devel/2020-October/msg00008.html

Andy

> start=0 len=0 offset=128
> general protection fault, probably for non-canonical address 0xdffffc0000000020: 0000 [#1] PREEMPT SMP KASAN
> KASAN: null-ptr-deref in range [0x0000000000000100-0x0000000000000107]
> CPU: 1 PID: 19688 Comm: syz-executor.3 Not tainted 5.9.0-rc8-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:gfs2_rgrp_dump+0x3b/0x6c0 fs/gfs2/rgrp.c:2220
> Code: 24 10 48 89 f3 48 89 7c 24 08 48 bd 00 00 00 00 00 fc ff df e8 06 7a 2b fe 48 89 ea 48 81 c3 00 01 00 00 48 89 d8 48 c1 e8 03 <80> 3c 28 00 74 12 48 89 df e8 97 60 6b fe 48 ba 00 00 00 00 00 fc
> RSP: 0018:ffffc90009037758 EFLAGS: 00010202
> RAX: 0000000000000020 RBX: 0000000000000100 RCX: 0000000000040000
> RDX: dffffc0000000000 RSI: 0000000000016753 RDI: 0000000000016754
> RBP: dffffc0000000000 R08: ffffffff83ddd758 R09: fffff52001206efa
> R10: fffff52001206efa R11: 0000000000000000 R12: ffffffff89364b22
> R13: ffff888042e74000 R14: dffffc0000000000 R15: ffffffff89364943
> FS:  00007fb8f261d700(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000016a9e60 CR3: 00000000959d9000 CR4: 00000000001506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   gfs2_consist_rgrpd_i+0xa1/0x110 fs/gfs2/util.c:422
>   compute_bitstructs fs/gfs2/rgrp.c:812 [inline]
>   read_rindex_entry fs/gfs2/rgrp.c:909 [inline]
>   gfs2_ri_update+0xb60/0x1860 fs/gfs2/rgrp.c:986
>   gfs2_rindex_update+0x283/0x320 fs/gfs2/rgrp.c:1032
>   init_inodes fs/gfs2/ops_fstype.c:792 [inline]
>   gfs2_fill_super+0x28e7/0x3fe0 fs/gfs2/ops_fstype.c:1125
>   get_tree_bdev+0x3e9/0x5f0 fs/super.c:1342
>   gfs2_get_tree+0x4c/0x1f0 fs/gfs2/ops_fstype.c:1201
>   vfs_get_tree+0x88/0x270 fs/super.c:1547
>   do_new_mount fs/namespace.c:2875 [inline]
>   path_mount+0x179d/0x29e0 fs/namespace.c:3192
>   do_mount fs/namespace.c:3205 [inline]
>   __do_sys_mount fs/namespace.c:3413 [inline]
>   __se_sys_mount+0x126/0x180 fs/namespace.c:3390
>   do_syscall_64+0x31/0x70 arch/x86/entry/common.c:46
>   entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x46087a
> Code: b8 a6 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 ad 89 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 8a 89 fb ff c3 66 0f 1f 84 00 00 00 00 00
> RSP: 002b:00007fb8f261ca88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 00007fb8f261cb20 RCX: 000000000046087a
> RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fb8f261cae0
> RBP: 00007fb8f261cae0 R08: 00007fb8f261cb20 R09: 0000000020000000
> R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
> R13: 0000000020000100 R14: 0000000020000200 R15: 0000000020047a20
> Modules linked in:
> ---[ end trace 8711b33583174bc7 ]---
> RIP: 0010:gfs2_rgrp_dump+0x3b/0x6c0 fs/gfs2/rgrp.c:2220
> Code: 24 10 48 89 f3 48 89 7c 24 08 48 bd 00 00 00 00 00 fc ff df e8 06 7a 2b fe 48 89 ea 48 81 c3 00 01 00 00 48 89 d8 48 c1 e8 03 <80> 3c 28 00 74 12 48 89 df e8 97 60 6b fe 48 ba 00 00 00 00 00 fc
> RSP: 0018:ffffc90009037758 EFLAGS: 00010202
> RAX: 0000000000000020 RBX: 0000000000000100 RCX: 0000000000040000
> RDX: dffffc0000000000 RSI: 0000000000016753 RDI: 0000000000016754
> RBP: dffffc0000000000 R08: ffffffff83ddd758 R09: fffff52001206efa
> R10: fffff52001206efa R11: 0000000000000000 R12: ffffffff89364b22
> R13: ffff888042e74000 R14: dffffc0000000000 R15: ffffffff89364943
> FS:  00007fb8f261d700(0000) GS:ffff8880ae900000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000016a9e60 CR3: 00000000959d9000 CR4: 00000000001506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 

