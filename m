Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E3166DBA7
	for <lists+cluster-devel@lfdr.de>; Tue, 17 Jan 2023 11:56:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673952991;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=06T1vl54lAZuVMBbzUV7FY6XKJgLq5iaKZfvALwZhcA=;
	b=R9TTLKkm0tbwR43ZkPCI1AzFF8BRQnwZNBT0C0gjJ91t5F4S1KiPqHnhk0xZB9Fu7KSTWD
	Z7+9eHOfbqX7Ye8c/GP2j/5Jv1I5005tQZqiY50Vy42GUinG4NlfCmP6v7ia6Hh9u86sUV
	m9K+U7v6QdSCuAPkAJwVOG3GcM5Lfv8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-Zt-OqHqbOtOcj6ea91yM-g-1; Tue, 17 Jan 2023 05:56:27 -0500
X-MC-Unique: Zt-OqHqbOtOcj6ea91yM-g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE5C829ABA18;
	Tue, 17 Jan 2023 10:56:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24B3C492B01;
	Tue, 17 Jan 2023 10:56:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D7B1D19465B5;
	Tue, 17 Jan 2023 10:56:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6D0E819465A3 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 17 Jan 2023 10:26:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 26BD3C15BAE; Tue, 17 Jan 2023 10:26:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F0A8C15BA0
 for <cluster-devel@redhat.com>; Tue, 17 Jan 2023 10:26:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F35C53C11A01
 for <cluster-devel@redhat.com>; Tue, 17 Jan 2023 10:26:53 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-volVOwJOPB-7LeesD-uNDg-1; Tue, 17 Jan 2023 05:26:52 -0500
X-MC-Unique: volVOwJOPB-7LeesD-uNDg-1
Received: by mail-il1-f197.google.com with SMTP id
 r6-20020a92cd86000000b00304b2d1c2d7so22556653ilb.11
 for <cluster-devel@redhat.com>; Tue, 17 Jan 2023 02:26:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=06T1vl54lAZuVMBbzUV7FY6XKJgLq5iaKZfvALwZhcA=;
 b=p5JY+nEW/KHni0OQf8u+2YMsmEgRUdXzL4V2r2cCylJQGZ9+i0qYD8DRXslC1miJY2
 tHsSI+H3p2UMwdKvN1TxkGPMEHzA+OxZTgs13Bl2yFPSbGD5hrZUKJn3wXu9cp8KIMcv
 QwIkwyOlTNZqiS9+DfTgnYvw2xEDLg9SGhYhAN4tJ2JhtN4ACv8H0qN5/IKi0fnUg1dA
 AEcU/wrPIkhiBuuTAtUZbdW4KBFdRtp0g7XeI/C/MkK7QhTovqHM+EGmCRMfpdLxYlsH
 qynYue4+729eUmuqHkLySk907ZWSBA0sQ7rSOx0SMvGqu6ir++TiVN9124cn5aMHb90h
 S4yg==
X-Gm-Message-State: AFqh2kpKwOVVszvVVXreLqo2eTo8VY4mNV1HiumQ6fL9AYKD7ymznHuH
 JWB9To2a/0NRecMjM1f+1N9AVw0VXPooTxpC/79boLIORm59
X-Google-Smtp-Source: AMrXdXuuOnACt3l10ysPKVDqo4fzE8RfeLoAH0AYVjk4cDk4L+byfMPKQ5N3dFZhBVdLvlxXCUuR9N31TTe4jcz5CMDkg//zqabJ
MIME-Version: 1.0
X-Received: by 2002:a92:c98f:0:b0:30f:b7f:1aee with SMTP id
 y15-20020a92c98f000000b0030f0b7f1aeemr257311iln.221.1673951211619; Tue, 17
 Jan 2023 02:26:51 -0800 (PST)
Date: Tue, 17 Jan 2023 02:26:51 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000570e0305f273235d@google.com>
From: syzbot <syzbot+cdb448c6e82c20d7960c@syzkaller.appspotmail.com>
To: agruenba@redhat.com, cluster-devel@redhat.com, 
 linux-kernel@vger.kernel.org, rpeterso@redhat.com, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 17 Jan 2023 10:56:24 +0000
Subject: [Cluster-devel] [syzbot] [gfs2?] BUG: sleeping function called from
 invalid context in gfs2_glock_wait
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d532dd102151 Merge tag 'for-6.2-rc4-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16c88b2c480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c3574635786f74ca
dashboard link: https://syzkaller.appspot.com/bug?extid=cdb448c6e82c20d7960c
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16a30e7e480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=164a8ab1480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a644dc38be2c/disk-d532dd10.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/30e89b0598f8/vmlinux-d532dd10.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5bb4bab3f67d/bzImage-d532dd10.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/89f4e64444ce/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cdb448c6e82c20d7960c@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: found 1 quota changes
syz-executor390: attempt to access beyond end of device
loop0: rw=1, sector=131324, nr_sectors = 4 limit=32768
gfs2: fsid=syz:syz.0: Error 10 writing to journal, jid=0
gfs2: fsid=syz:syz.0: fatal: I/O error(s)
gfs2: fsid=syz:syz.0: about to withdraw this file system
BUG: sleeping function called from invalid context at fs/gfs2/glock.c:1316
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 5053, name: syz-executor390
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
4 locks held by syz-executor390/5053:
 #0: ffff88807a14c0e0 (&type->s_umount_key#47){+.+.}-{3:3}, at: deactivate_super+0x96/0xd0 fs/super.c:362
 #1: ffff888023a48b70 (&sdp->sd_quota_sync_mutex){+.+.}-{3:3}, at: gfs2_quota_sync+0x9b/0x8b0 fs/gfs2/quota.c:1302
 #2: ffff888023a49058 (&sdp->sd_log_flush_lock){++++}-{3:3}, at: gfs2_log_flush+0xe7/0x26a0 fs/gfs2/log.c:1034
 #3: ffff888023a48e80 (&sdp->sd_log_lock){+.+.}-{2:2}, at: spin_lock include/linux/spinlock.h:350 [inline]
 #3: ffff888023a48e80 (&sdp->sd_log_lock){+.+.}-{2:2}, at: gfs2_log_lock fs/gfs2/log.h:32 [inline]
 #3: ffff888023a48e80 (&sdp->sd_log_lock){+.+.}-{2:2}, at: gfs2_flush_revokes+0x4e/0x80 fs/gfs2/log.c:805
Preemption disabled at:
[<0000000000000000>] 0x0
CPU: 0 PID: 5053 Comm: syz-executor390 Not tainted 6.2.0-rc4-syzkaller-00009-gd532dd102151 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e3/0x2d0 lib/dump_stack.c:106
 __might_resched+0x538/0x6a0 kernel/sched/core.c:10036
 gfs2_glock_wait+0x52/0x2a0 fs/gfs2/glock.c:1316
 gfs2_glock_nq_init fs/gfs2/glock.h:262 [inline]
 gfs2_freeze_lock+0x5f/0xc0 fs/gfs2/util.c:107
 signal_our_withdraw fs/gfs2/util.c:160 [inline]
 gfs2_withdraw+0x5ab/0x14e0 fs/gfs2/util.c:351
 gfs2_ail1_empty+0x8c9/0x950 fs/gfs2/log.c:368
 gfs2_flush_revokes+0x59/0x80 fs/gfs2/log.c:806
 revoke_lo_before_commit+0x2b/0xcf0 fs/gfs2/lops.c:869
 lops_before_commit fs/gfs2/lops.h:40 [inline]
 gfs2_log_flush+0xc8e/0x26a0 fs/gfs2/log.c:1093
 do_sync+0xa4c/0xc90 fs/gfs2/quota.c:975
 gfs2_quota_sync+0x3da/0x8b0 fs/gfs2/quota.c:1318
 gfs2_sync_fs+0x49/0xb0 fs/gfs2/super.c:650
 sync_filesystem+0xe8/0x220 fs/sync.c:56
 generic_shutdown_super+0x6b/0x310 fs/super.c:474
 kill_block_super+0x79/0xd0 fs/super.c:1386
 deactivate_locked_super+0xa7/0xf0 fs/super.c:332
 cleanup_mnt+0x494/0x520 fs/namespace.c:1291
 task_work_run+0x243/0x300 kernel/task_work.c:179
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x644/0x2150 kernel/exit.c:867
 do_group_exit+0x1fd/0x2b0 kernel/exit.c:1012
 __do_sys_exit_group kernel/exit.c:1023 [inline]
 __se_sys_exit_group kernel/exit.c:1021 [inline]
 __x64_sys_exit_group+0x3b/0x40 kernel/exit.c:1021
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f8d53bb09c9
Code: Unable to access opcode bytes at 0x7f8d53bb099f.
RSP: 002b:00007ffda1438d78 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f8d53c45330 RCX: 00007f8d53bb09c9
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000001
RBP: 0000000000000001 R08: ffffffffffffffc0 R09: 000000000001f6db
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f8d53c45330
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
 </TASK>

=============================
[ BUG: Invalid wait context ]
6.2.0-rc4-syzkaller-00009-gd532dd102151 #0 Tainted: G        W         
-----------------------------
syz-executor390/5053 is trying to lock:
ffff888019021c88 (&wq->mutex){+.+.}-{3:3}, at: __flush_workqueue+0x1b7/0x16a0 kernel/workqueue.c:2812
other info that might help us debug this:
context-{4:4}
4 locks held by syz-executor390/5053:
 #0: ffff88807a14c0e0 (&type->s_umount_key#47){+.+.}-{3:3}, at: deactivate_super+0x96/0xd0 fs/super.c:362
 #1: ffff888023a48b70 (&sdp->sd_quota_sync_mutex){+.+.}-{3:3}, at: gfs2_quota_sync+0x9b/0x8b0 fs/gfs2/quota.c:1302
 #2: ffff888023a49058 (&sdp->sd_log_flush_lock){++++}-{3:3}, at: gfs2_log_flush+0xe7/0x26a0 fs/gfs2/log.c:1034
 #3: ffff888023a48e80 (&sdp->sd_log_lock){+.+.}-{2:2}, at: spin_lock include/linux/spinlock.h:350 [inline]
 #3: ffff888023a48e80 (&sdp->sd_log_lock){+.+.}-{2:2}, at: gfs2_log_lock fs/gfs2/log.h:32 [inline]
 #3: ffff888023a48e80 (&sdp->sd_log_lock){+.+.}-{2:2}, at: gfs2_flush_revokes+0x4e/0x80 fs/gfs2/log.c:805
stack backtrace:
CPU: 0 PID: 5053 Comm: syz-executor390 Tainted: G        W          6.2.0-rc4-syzkaller-00009-gd532dd102151 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e3/0x2d0 lib/dump_stack.c:106
 print_lock_invalid_wait_context kernel/locking/lockdep.c:4707 [inline]
 check_wait_context kernel/locking/lockdep.c:4768 [inline]
 __lock_acquire+0x14f2/0x1f60 kernel/locking/lockdep.c:5005
 lock_acquire+0x1a7/0x400 kernel/locking/lockdep.c:5668
 __mutex_lock_common+0x1de/0x26c0 kernel/locking/mutex.c:603
 __mutex_lock kernel/locking/mutex.c:747 [inline]
 mutex_lock_nested+0x17/0x20 kernel/locking/mutex.c:799
 __flush_workqueue+0x1b7/0x16a0 kernel/workqueue.c:2812
 gfs2_make_fs_ro+0xd1/0x630 fs/gfs2/super.c:532
 signal_our_withdraw fs/gfs2/util.c:166 [inline]
 gfs2_withdraw+0x5e8/0x14e0 fs/gfs2/util.c:351
 gfs2_ail1_empty+0x8c9/0x950 fs/gfs2/log.c:368
 gfs2_flush_revokes+0x59/0x80 fs/gfs2/log.c:806
 revoke_lo_before_commit+0x2b/0xcf0 fs/gfs2/lops.c:869
 lops_before_commit fs/gfs2/lops.h:40 [inline]
 gfs2_log_flush+0xc8e/0x26a0 fs/gfs2/log.c:1093
 do_sync+0xa4c/0xc90 fs/gfs2/quota.c:975
 gfs2_quota_sync+0x3da/0x8b0 fs/gfs2/quota.c:1318
 gfs2_sync_fs+0x49/0xb0 fs/gfs2/super.c:650
 sync_filesystem+0xe8/0x220 fs/sync.c:56
 generic_shutdown_super+0x6b/0x310 fs/super.c:474
 kill_block_super+0x79/0xd0 fs/super.c:1386
 deactivate_locked_super+0xa7/0xf0 fs/super.c:332
 cleanup_mnt+0x494/0x520 fs/namespace.c:1291
 task_work_run+0x243/0x300 kernel/task_work.c:179
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x644/0x2150 kernel/exit.c:867
 do_group_exit+0x1fd/0x2b0 kernel/exit.c:1012
 __do_sys_exit_group kernel/exit.c:1023 [inline]
 __se_sys_exit_group kernel/exit.c:1021 [inline]
 __x64_sys_exit_group+0x3b/0x40 kernel/exit.c:1021
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f8d53bb09c9
Code: Unable to access opcode bytes at 0x7f8d53bb099f.
RSP: 002b:00007ffda1438d78 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f8d53c45330 RCX: 00007f8d53bb09c9
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000001
RBP: 0000000000000001 R08: ffffffffffffffc0 R09: 000000000001f6db
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f8d53c45330
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
 </TASK>
BUG: scheduling while atomic: syz-executor390/5053/0x00000002
INFO: lockdep is turned off.
Modules linked in:
Preemption disabled at:
[<0000000000000000>] 0x0


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

