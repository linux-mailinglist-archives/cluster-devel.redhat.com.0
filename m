Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE6C3D198B
	for <lists+cluster-devel@lfdr.de>; Thu, 22 Jul 2021 00:04:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-mVbmk1uLO_uf2puQrhZiJQ-1; Wed, 21 Jul 2021 18:04:45 -0400
X-MC-Unique: mVbmk1uLO_uf2puQrhZiJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2779800D62;
	Wed, 21 Jul 2021 22:04:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4360E5C1A3;
	Wed, 21 Jul 2021 22:04:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB0544BB7C;
	Wed, 21 Jul 2021 22:04:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16LM4VPt026460 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 21 Jul 2021 18:04:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 90666FED3B; Wed, 21 Jul 2021 22:04:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B2DDFED33
	for <cluster-devel@redhat.com>; Wed, 21 Jul 2021 22:04:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BE8718A01A5
	for <cluster-devel@redhat.com>; Wed, 21 Jul 2021 22:04:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-582-SKpzpJnfMLW_x1kSi6w2ZA-1;
	Wed, 21 Jul 2021 18:04:26 -0400
X-MC-Unique: SKpzpJnfMLW_x1kSi6w2ZA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FA3261208;
	Wed, 21 Jul 2021 21:58:02 +0000 (UTC)
Date: Wed, 21 Jul 2021 14:58:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: syzbot <syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com>
Message-Id: <20210721145801.8ca097bc1d9ad3d0018517bd@linux-foundation.org>
In-Reply-To: <000000000000b25bb805c798a1a5@google.com>
References: <000000000000b25bb805c798a1a5@google.com>
Mime-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
	cluster-devel@redhat.com, linux-mm@kvack.org
Subject: Re: [Cluster-devel] [syzbot] WARNING in __set_page_dirty
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

(cc gfs2 maintainers)

On Tue, 20 Jul 2021 19:07:25 -0700 syzbot <syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com> wrote:

> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    d936eb238744 Revert "Makefile: Enable -Wimplicit-fallthrou..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1512834a300000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f1b998c1afc13578
> dashboard link: https://syzkaller.appspot.com/bug?extid=0d5b462a6f07447991b3
> userspace arch: i386
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283 inode_to_wb include/linux/backing-dev.h:283 [inline]
> WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283 account_page_dirtied mm/page-writeback.c:2435 [inline]
> WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283 __set_page_dirty+0xace/0x1070 mm/page-writeback.c:2483
> Modules linked in:
> CPU: 0 PID: 8696 Comm: syz-executor.0 Not tainted 5.14.0-rc1-syzkaller #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
> RIP: 0010:inode_to_wb include/linux/backing-dev.h:283 [inline]
> RIP: 0010:account_page_dirtied mm/page-writeback.c:2435 [inline]
> RIP: 0010:__set_page_dirty+0xace/0x1070 mm/page-writeback.c:2483
> Code: a8 01 00 00 be ff ff ff ff 48 8d 78 70 e8 0a bf 8c 07 31 ff 89 c3 89 c6 e8 3f af d8 ff 85 db 0f 85 ac f7 ff ff e8 f2 a7 d8 ff <0f> 0b e9 a0 f7 ff ff e8 e6 a7 d8 ff 4c 8d 75 08 48 b8 00 00 00 00
> RSP: 0000:ffffc90000e578a0 EFLAGS: 00010093
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> RDX: ffff888013d71c40 RSI: ffffffff819cdfce RDI: 0000000000000003
> RBP: ffffea0001de0240 R08: 0000000000000000 R09: ffff888019819e07
> R10: ffffffff819cdfc1 R11: 0000000000000000 R12: 0000000000000293
> R13: ffff888078a38c90 R14: ffff888019819e00 R15: ffff888019819c58
> FS:  0000000000000000(0000) GS:ffff88802ca00000(0063) knlGS:0000000009b20380
> CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> CR2: 00007fd805161390 CR3: 000000004c16a000 CR4: 0000000000150ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  mark_buffer_dirty+0x49a/0x5e0 fs/buffer.c:1108
>  gfs2_unpin+0x123/0xd10 fs/gfs2/lops.c:111
>  buf_lo_after_commit+0x140/0x210 fs/gfs2/lops.c:750
>  lops_after_commit fs/gfs2/lops.h:49 [inline]
>  gfs2_log_flush+0x162b/0x2940 fs/gfs2/log.c:1108
>  do_sync+0x5ab/0xcd0 fs/gfs2/quota.c:967
>  gfs2_quota_sync+0x2e2/0x660 fs/gfs2/quota.c:1310
>  gfs2_sync_fs+0x40/0xb0 fs/gfs2/super.c:711
>  __sync_filesystem fs/sync.c:39 [inline]

Seems that gfs2_unpin() is running mark_buffer_dirty() against a bh
which is attached to a non-upto-date page.

>  sync_filesystem fs/sync.c:64 [inline]
>  sync_filesystem+0x105/0x260 fs/sync.c:48
>  generic_shutdown_super+0x70/0x370 fs/super.c:448
>  kill_block_super+0x97/0xf0 fs/super.c:1395
>  gfs2_kill_sb+0x104/0x160 fs/gfs2/ops_fstype.c:1682
>  deactivate_locked_super+0x94/0x160 fs/super.c:335
>  deactivate_super+0xad/0xd0 fs/super.c:366
>  cleanup_mnt+0x3a2/0x540 fs/namespace.c:1136
>  task_work_run+0xdd/0x1a0 kernel/task_work.c:164
>  tracehook_notify_resume include/linux/tracehook.h:189 [inline]
>  exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
>  exit_to_user_mode_prepare+0x27e/0x290 kernel/entry/common.c:209
>  __syscall_exit_to_user_mode_work kernel/entry/common.c:291 [inline]
>  syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:302
>  __do_fast_syscall_32+0x72/0xf0 arch/x86/entry/common.c:181
>  do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:203
>  entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
> RIP: 0023:0xf7f86549
> Code: 03 74 c0 01 10 05 03 74 b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
> RSP: 002b:00000000ffeb89bc EFLAGS: 00000296 ORIG_RAX: 0000000000000034
> RAX: 0000000000000000 RBX: 00000000ffeb8a60 RCX: 0000000000000002
> RDX: 000000000816c000 RSI: 0000000000000000 RDI: 00000000080ea118
> RBP: 00000000ffeb8a60 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
> 

