Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 17E7E296CFB
	for <lists+cluster-devel@lfdr.de>; Fri, 23 Oct 2020 12:41:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-srVkeWO_O3WeMEp1aUQbkg-1; Fri, 23 Oct 2020 06:41:27 -0400
X-MC-Unique: srVkeWO_O3WeMEp1aUQbkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3AB11020919;
	Fri, 23 Oct 2020 10:41:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D62F10027AB;
	Fri, 23 Oct 2020 10:41:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 247A2180B65D;
	Fri, 23 Oct 2020 10:41:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09N8ROTF031138 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 23 Oct 2020 04:27:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 931EA906B1; Fri, 23 Oct 2020 08:27:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A7D694655
	for <cluster-devel@redhat.com>; Fri, 23 Oct 2020 08:27:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F3CB8007D9
	for <cluster-devel@redhat.com>; Fri, 23 Oct 2020 08:27:21 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
	[209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-290-g9XaxXevNDeDmPDJOJdb0Q-1; Fri, 23 Oct 2020 04:27:17 -0400
X-MC-Unique: g9XaxXevNDeDmPDJOJdb0Q-1
Received: by mail-io1-f72.google.com with SMTP id z23so542568iog.4
	for <cluster-devel@redhat.com>; Fri, 23 Oct 2020 01:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=8IORtxX0sZexCEJAh5QsuNo1gjcH/2au44E6II6Xrgg=;
	b=oQwU3B6fNBiLq0enBGPE0vzQVrOSwJfC9qIcuunNSclMnJNr+YR9ORNjrgZZKzqmKU
	QMjOz9H59BS1uu/4CXKu47j5gA3Mx61By42Roy6lajuDh9Pb9THbyAz1+66q6zgD3Ops
	ZYCUGxkFzChEcn9bbbYp52vbwKli8Zc6fwHA6I/2WNxGWEqfw/BLH+oqBDRdH86ak5rr
	ZnJMshPR80lDI8WuMK1OvlFvLuDzEZmffCbSV5MuSWeBREa6F5O9eY298eLpiJnm5skn
	T4Ob3hoI2OfivMO5j3hq3SoKT4nFEB5La81hEsc0UImYrbkkLGwv5eMm/DNG5lThU9Pf
	EDXg==
X-Gm-Message-State: AOAM533I1L3csjoOuz2h/65MMjxnDPR8luy35SB3rDaB9uNNgqA1COeB
	VsjqpcaGzTVMyAQkZycvYHPH4YWmA02Fvj3ivCWZUUAfNOlp
X-Google-Smtp-Source: ABdhPJwcFuLkSV0FrlfK62pQ1zZbAQQpQ2h8zZvz5R2Ue2eRcVPF8nPR/rLTly6liqIPt2TX/NLgkzHHeTwjt4UlfNfVWIA2v9iL
MIME-Version: 1.0
X-Received: by 2002:a05:6638:92a:: with SMTP id
	10mr1073351jak.125.1603441636134; 
	Fri, 23 Oct 2020 01:27:16 -0700 (PDT)
Date: Fri, 23 Oct 2020 01:27:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000023d24f05b252599e@google.com>
From: syzbot <syzbot+08b6bdbd4c6e64e520ff@syzkaller.appspotmail.com>
To: agruenba@redhat.com, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org, rpeterso@redhat.com,
	syzkaller-bugs@googlegroups.com
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
X-Mailman-Approved-At: Fri, 23 Oct 2020 06:41:17 -0400
Subject: [Cluster-devel] INFO: task can't die in gfs2_gl_hash_clear
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9695c4ff Add linux-next specific files for 20201023
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1337677f900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e4274439d0e6cdfa
dashboard link: https://syzkaller.appspot.com/bug?extid=08b6bdbd4c6e64e520ff
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+08b6bdbd4c6e64e520ff@syzkaller.appspotmail.com

INFO: task syz-executor.4:10332 can't die for more than 143 seconds.
task:syz-executor.4  state:D stack:25896 pid:10332 ppid:  8512 flags:0x00004004
Call Trace:
 context_switch kernel/sched/core.c:3773 [inline]
 __schedule+0x893/0x2130 kernel/sched/core.c:4522
 schedule+0xcf/0x270 kernel/sched/core.c:4600
 schedule_timeout+0x148/0x250 kernel/time/timer.c:1881
 gfs2_gl_hash_clear+0x240/0x270 fs/gfs2/glock.c:1989
 gfs2_fill_super+0x1e81/0x23f0 fs/gfs2/ops_fstype.c:1233
 get_tree_bdev+0x421/0x740 fs/super.c:1344
 gfs2_get_tree+0x4a/0x270 fs/gfs2/ops_fstype.c:1256
 vfs_get_tree+0x89/0x2f0 fs/super.c:1549
 do_new_mount fs/namespace.c:2896 [inline]
 path_mount+0x12ae/0x1e70 fs/namespace.c:3227
 do_mount fs/namespace.c:3240 [inline]
 __do_sys_mount fs/namespace.c:3448 [inline]
 __se_sys_mount fs/namespace.c:3425 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3425
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x4608aa
Code: Unable to access opcode bytes at RIP 0x460880.
RSP: 002b:00007f9dd27eda88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f9dd27edb20 RCX: 00000000004608aa
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f9dd27edae0
RBP: 00007f9dd27edae0 R08: 00007f9dd27edb20 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 0000000020000200 R15: 0000000020047a20
INFO: task syz-executor.4:10332 blocked for more than 143 seconds.
      Not tainted 5.9.0-next-20201023-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.4  state:D stack:25896 pid:10332 ppid:  8512 flags:0x00004004
Call Trace:
 context_switch kernel/sched/core.c:3773 [inline]
 __schedule+0x893/0x2130 kernel/sched/core.c:4522
 schedule+0xcf/0x270 kernel/sched/core.c:4600
 schedule_timeout+0x148/0x250 kernel/time/timer.c:1881
 gfs2_gl_hash_clear+0x240/0x270 fs/gfs2/glock.c:1989
 gfs2_fill_super+0x1e81/0x23f0 fs/gfs2/ops_fstype.c:1233
 get_tree_bdev+0x421/0x740 fs/super.c:1344
 gfs2_get_tree+0x4a/0x270 fs/gfs2/ops_fstype.c:1256
 vfs_get_tree+0x89/0x2f0 fs/super.c:1549
 do_new_mount fs/namespace.c:2896 [inline]
 path_mount+0x12ae/0x1e70 fs/namespace.c:3227
 do_mount fs/namespace.c:3240 [inline]
 __do_sys_mount fs/namespace.c:3448 [inline]
 __se_sys_mount fs/namespace.c:3425 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3425
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x4608aa
Code: Unable to access opcode bytes at RIP 0x460880.
RSP: 002b:00007f9dd27eda88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f9dd27edb20 RCX: 00000000004608aa
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f9dd27edae0
RBP: 00007f9dd27edae0 R08: 00007f9dd27edb20 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 0000000020000200 R15: 0000000020047a20

Showing all locks held in the system:
2 locks held by kworker/u4:1/21:
 #0: ffff8880b9f34cd8 (&rq->lock){-.-.}-{2:2}, at: rq_lock kernel/sched/sched.h:1292 [inline]
 #0: ffff8880b9f34cd8 (&rq->lock){-.-.}-{2:2}, at: __schedule+0x21a/0x2130 kernel/sched/core.c:4440
 #1: ffff8880b9f1ff88 (&per_cpu_ptr(group->pcpu, cpu)->seq){-.-.}-{0:0}, at: psi_task_switch+0x305/0x440 kernel/sched/psi.c:833
1 lock held by khungtaskd/1628:
 #0: ffffffff8b3361a0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:6259
2 locks held by in:imklog/8170:
 #0: ffff8880143794f0 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100 fs/file.c:932
 #1: ffff8880b9f34cd8 (&rq->lock){-.-.}-{2:2}, at: rq_lock kernel/sched/sched.h:1292 [inline]
 #1: ffff8880b9f34cd8 (&rq->lock){-.-.}-{2:2}, at: __schedule+0x21a/0x2130 kernel/sched/core.c:4440
1 lock held by syz-executor.4/10332:
 #0: ffff88802f2c60e0 (&type->s_umount_key#50/1){+.+.}-{3:3}, at: alloc_super+0x201/0xaf0 fs/super.c:229

=============================================

NMI backtrace for cpu 0
CPU: 0 PID: 1628 Comm: khungtaskd Not tainted 5.9.0-next-20201023-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:118
 nmi_cpu_backtrace.cold+0x44/0xd7 lib/nmi_backtrace.c:105
 nmi_trigger_cpumask_backtrace+0x1b3/0x230 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:147 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:253 [inline]
 watchdog+0xd89/0xf30 kernel/hung_task.c:339
 kthread+0x3af/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 PID: 2998 Comm: kworker/1:2 Not tainted 5.9.0-next-20201023-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: events nsim_dev_trap_report_work
RIP: 0010:chacha_permute+0x5a3/0x6f0 lib/crypto/chacha.c:23
Code: 0c 41 c1 c4 08 41 01 dd 44 31 f0 44 89 44 24 14 44 01 e1 45 31 eb c1 c0 07 31 ca 89 4c 24 1c c1 c2 07 41 c1 c3 07 89 44 24 28 <83> 44 24 04 02 89 54 24 24 44 89 5c 24 08 8b 44 24 04 8b 7c 24 38
RSP: 0000:ffffc90001ddf9c0 EFLAGS: 00000002
RAX: 00000000d980da6c RBX: 000000008a97da8b RCX: 00000000b28d400b
RDX: 00000000cc94b0ae RSI: 0000000016ccd74d RDI: 000000008a72d815
RBP: 00000000658b7ed9 R08: 000000008a6c4db3 R09: 000000004afb3d6a
R10: 0000000020685da4 R11: 000000004c778746 R12: 000000000df584d3
R13: 00000000726e3229 R14: 000000009e8f910d R15: 00000000f40eb23e
FS:  0000000000000000(0000) GS:ffff8880b9f00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f25f53d3000 CR3: 0000000010ea5000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 chacha_block_generic+0x98/0x220 lib/crypto/chacha.c:83
 chacha20_block include/crypto/chacha.h:36 [inline]
 _extract_crng+0x12f/0x250 drivers/char/random.c:1010
 extract_crng drivers/char/random.c:1026 [inline]
 _get_random_bytes+0x229/0x670 drivers/char/random.c:1563
 nsim_dev_trap_skb_build drivers/net/netdevsim/dev.c:533 [inline]
 nsim_dev_trap_report drivers/net/netdevsim/dev.c:562 [inline]
 nsim_dev_trap_report_work+0x74e/0xbd0 drivers/net/netdevsim/dev.c:603
 process_one_work+0x933/0x15a0 kernel/workqueue.c:2272
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2418
 kthread+0x3af/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

