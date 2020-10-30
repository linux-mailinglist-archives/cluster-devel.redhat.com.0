Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6064A2A290F
	for <lists+cluster-devel@lfdr.de>; Mon,  2 Nov 2020 12:25:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-sPDqR90TPBeVjdcBoqJ9QA-1; Mon, 02 Nov 2020 06:25:30 -0500
X-MC-Unique: sPDqR90TPBeVjdcBoqJ9QA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D3CC802B72;
	Mon,  2 Nov 2020 11:25:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2994946;
	Mon,  2 Nov 2020 11:25:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D95218C7B4;
	Mon,  2 Nov 2020 11:25:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09UMiM54028621 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Oct 2020 18:44:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C7A1F5AD5; Fri, 30 Oct 2020 22:44:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66F36F5AD3
	for <cluster-devel@redhat.com>; Fri, 30 Oct 2020 22:44:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1377A185A790
	for <cluster-devel@redhat.com>; Fri, 30 Oct 2020 22:44:20 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
	[209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-520-pUQcxYvNMsm8HYvs3U9yLg-1; Fri, 30 Oct 2020 18:44:17 -0400
X-MC-Unique: pUQcxYvNMsm8HYvs3U9yLg-1
Received: by mail-il1-f198.google.com with SMTP id p17so5715288ilb.5
	for <cluster-devel@redhat.com>; Fri, 30 Oct 2020 15:44:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=tbbGq5aNlO9degpAN1D8DlynwJQJHs0cUXencP4MFxc=;
	b=WutZ/77uY6o9G6MLDWpiBB7e9EePhPbTEXPUKWC5khFkPu2TvrFrtCtTinEgKCHsvk
	fzJWsE2XI4ScdlIH8nBmgdRg2TQwO2wCtlBl+Qh4h/Di2WnIVTllGSfldulV0dvNSiIG
	Yyy+gEXOxZf4uvjoFIhQLwvXNs/9wfl9VP61ZkA6njH88EeQNWqiZch+Zvgq6WGz2PDH
	Rd21/dgJ479ocmw+QSq2/v5DY/D8UPN/S8sC39SDmvQa0I81siyJTTeYCReNpA3ms6Da
	+YZNk60nyrfBhlwkn+SYPkticE8k5eIhRWoakUADYGwq3aKquPO4ufENuHrliNoPcG6d
	allg==
X-Gm-Message-State: AOAM532W+1DaiMgbmAscHVFEKjG16gCZAEQMDRpWf4OIFGdp8PVh0ZZq
	JP8MnQQ7nIoqe6RfCqspa3EiVrL35Mp13wzDCX1I+fZvQwU4
X-Google-Smtp-Source: ABdhPJyLd3gde0CNV+gdHb3xqkQpujTtiIJVGrNoovHxAjXich8pF+WsgaMZXT0i7FgPCE11ykuuYCp12nWKtcO6EmQvaBOTxQat
MIME-Version: 1.0
X-Received: by 2002:a6b:3f88:: with SMTP id m130mr3434557ioa.78.1604097856950; 
	Fri, 30 Oct 2020 15:44:16 -0700 (PDT)
Date: Fri, 30 Oct 2020 15:44:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f2d59c05b2eb22e0@google.com>
From: syzbot <syzbot+938b0fd3a48bf32ef1f1@syzkaller.appspotmail.com>
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
X-Mailman-Approved-At: Mon, 02 Nov 2020 06:25:18 -0500
Subject: [Cluster-devel] INFO: task hung in gfs2_gl_hash_clear
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    07e08873 Merge tag 'fallthrough-fixes-clang-5.10-rc2' of g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11483132500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb6c2acf60eb5bfd
dashboard link: https://syzkaller.appspot.com/bug?extid=938b0fd3a48bf32ef1f1
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+938b0fd3a48bf32ef1f1@syzkaller.appspotmail.com

INFO: task syz-executor.0:12142 blocked for more than 143 seconds.
      Not tainted 5.10.0-rc1-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor.0  state:D stack:25896 pid:12142 ppid:  8475 flags:0x00004004
Call Trace:
 context_switch kernel/sched/core.c:3774 [inline]
 __schedule+0x893/0x2130 kernel/sched/core.c:4523
 schedule+0xcf/0x270 kernel/sched/core.c:4601
 schedule_timeout+0x148/0x250 kernel/time/timer.c:1876
 gfs2_gl_hash_clear+0x240/0x270 fs/gfs2/glock.c:1989
 gfs2_fill_super+0x1e81/0x23f0 fs/gfs2/ops_fstype.c:1233
 get_tree_bdev+0x421/0x740 fs/super.c:1344
 gfs2_get_tree+0x4a/0x270 fs/gfs2/ops_fstype.c:1256
 vfs_get_tree+0x89/0x2f0 fs/super.c:1549
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x13ad/0x20c0 fs/namespace.c:3205
 do_mount fs/namespace.c:3218 [inline]
 __do_sys_mount fs/namespace.c:3426 [inline]
 __se_sys_mount fs/namespace.c:3403 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3403
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x46090a
Code: Unable to access opcode bytes at RIP 0x4608e0.
RSP: 002b:00007f9ee56a8a88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f9ee56a8b20 RCX: 000000000046090a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f9ee56a8ae0
RBP: 00007f9ee56a8ae0 R08: 00007f9ee56a8b20 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 0000000020000200 R15: 0000000020047a20

Showing all locks held in the system:
2 locks held by kworker/u4:1/21:
1 lock held by khungtaskd/1643:
 #0: ffffffff8b337060 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:6259
1 lock held by systemd-journal/4882:
1 lock held by in:imklog/8120:
 #0: ffff8880134e75f0 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100 fs/file.c:932
1 lock held by syz-executor.0/12142:
 #0: ffff88805df5c0e0 (&type->s_umount_key#62/1){+.+.}-{3:3}, at: alloc_super+0x1b8/0xa80 fs/super.c:229

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 1643 Comm: khungtaskd Not tainted 5.10.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:118
 nmi_cpu_backtrace.cold+0x44/0xd7 lib/nmi_backtrace.c:105
 nmi_trigger_cpumask_backtrace+0x1b3/0x230 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:209 [inline]
 watchdog+0xd43/0xfa0 kernel/hung_task.c:295
 kthread+0x3af/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 4882 Comm: systemd-journal Not tainted 5.10.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0033:0x7f3f056c561d
Code: f9 79 f1 ff 83 f8 06 0f 8e bd fd ff ff 48 83 ec 08 4c 8d 0d 6d a1 02 00 4c 8d 05 ae fe 03 00 53 b9 1e 03 00 00 e9 eb fe ff ff <49> 83 f8 10 75 0c 49 89 45 00 45 31 e4 e9 94 fd ff ff 31 d2 4d 89
RSP: 002b:00007ffe73800a50 EFLAGS: 00000246
RAX: 00007f3f02e08798 RBX: 00000000002b2798 RCX: 0000000000000040
RDX: 0000000000000001 RSI: 00007f3f05705480 RDI: 000056506c959140
RBP: 000056506c958ea0 R08: 0000000000000065 R09: 000056506c959140
R10: c68c15b713e34dde R11: 836311406455d5a5 R12: 0000000000000001
R13: 00007ffe73800ac8 R14: 0000000000000000 R15: 00007ffe73800a50
FS:  00007f3f059d68c0 GS:  0000000000000000


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

