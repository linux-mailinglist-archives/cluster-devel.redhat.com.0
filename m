Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8313605F91
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Oct 2022 14:00:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666267246;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0vv0g5Hf0bDXF9rf4LbrVovhSHtbDdHpYzUlhBOmk0E=;
	b=ciMuWpmlFCdgrjBva7exSeqWyZ4C5vFNkOvj4POurOnNFLUyZMOISMENKVjge7xycGTmvf
	NustOzv6eLrvB9XgX8ymEoatTXyV/73uhdfn/yVNWGOEY9lwjldg7ItAQm+63Louixjdkb
	mu9jW34MidU/RthTt/yXJiS3/q6Q05E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-4Y4pLf96MVGPWf0gE2P9tw-1; Thu, 20 Oct 2022 08:00:43 -0400
X-MC-Unique: 4Y4pLf96MVGPWf0gE2P9tw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4310864761;
	Thu, 20 Oct 2022 12:00:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30BCE4047A6;
	Thu, 20 Oct 2022 12:00:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BA9A419465A0;
	Thu, 20 Oct 2022 12:00:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6159A1946595 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Oct 2022 06:16:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ECCD5111CD38; Thu, 20 Oct 2022 06:16:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E50E2111CD36
 for <cluster-devel@redhat.com>; Thu, 20 Oct 2022 06:16:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AC9F887407
 for <cluster-devel@redhat.com>; Thu, 20 Oct 2022 06:16:56 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-2-CsQgJDO4NCquLqZXfbuKFQ-1; Thu, 20 Oct 2022 02:16:49 -0400
X-MC-Unique: CsQgJDO4NCquLqZXfbuKFQ-1
Received: by mail-il1-f200.google.com with SMTP id
 z4-20020a921a44000000b002f8da436b83so19160768ill.19
 for <cluster-devel@redhat.com>; Wed, 19 Oct 2022 23:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0vv0g5Hf0bDXF9rf4LbrVovhSHtbDdHpYzUlhBOmk0E=;
 b=n4cvMEGTSptctI1mNlIEMz8TIJsdiFppLsu97ICxkhEIYOj5XwQXQ3Ms7uf85At81Z
 Zz5WvGDOXWXeD61o5nU84bgj1+GEsRCdGDvszEaG1xZcdQxlVotfKAkiE9ujHVOwMCmQ
 FWj1lNxb+phPKNFr0Eixuj3h6LLv5wwGkpUxkOW+1vw0sTTaAuniywkkHW++v8mQrY5G
 fKh2qWGIxTLyKojLqERcksKybhf7m5WBrcMa31pDMBD4VJyxFC1iZGDjqWCR91enOQd/
 LCzEnliftbZP2GQSRkt2nMeY/pc8Cg2T4uAVH7R44M/x+ECd6+lKPVg/y2tmXTxMXsfa
 qaRQ==
X-Gm-Message-State: ACrzQf03gf/5zQsbLE4h/WNod582FEL7zfGiCjUZGaorGDEqJYpwtWtR
 01QJNXul5Ha2dS1ciue0p0RK8rIk1Hyq+5cvxx4rDeelCQPC
X-Google-Smtp-Source: AMsMyM6j+9TtjoaJUYpUPpYNDY1++MYiTnFj3C5I807Q44YlHw+HnHfvSqp9XSY1w8SbWLIyswQgte5lJkbg3tF+TKXCBKDLrP+i
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:170b:b0:2fc:59ab:bcd2 with SMTP id
 u11-20020a056e02170b00b002fc59abbcd2mr8701132ill.74.1666246608396; Wed, 19
 Oct 2022 23:16:48 -0700 (PDT)
Date: Wed, 19 Oct 2022 23:16:48 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000033a7b505eb714534@google.com>
From: syzbot <syzbot+a159cc6676345e04ff7d@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Thu, 20 Oct 2022 12:00:38 +0000
Subject: [Cluster-devel] [syzbot] INFO: task hung in __gfs2_trans_begin
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

HEAD commit:    493ffd6605b2 Merge tag 'ucount-rlimits-cleanups-for-v5.19'..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13aa22ba880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d19f5d16783f901
dashboard link: https://syzkaller.appspot.com/bug?extid=a159cc6676345e04ff7d
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15fbd70c880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14dceee2880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f1ff6481e26f/disk-493ffd66.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/101bd3c7ae47/vmlinux-493ffd66.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/510833e7acb6/mount_1.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a159cc6676345e04ff7d@syzkaller.appspotmail.com

INFO: task syz-executor714:3609 blocked for more than 143 seconds.
      Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor714 state:D stack:23256 pid: 3609 ppid:  3606 flags:0x00004002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5183 [inline]
 __schedule+0x91f/0xdf0 kernel/sched/core.c:6495
 schedule+0xcb/0x190 kernel/sched/core.c:6571
 rwsem_down_read_slowpath+0x5f9/0x930 kernel/locking/rwsem.c:1087
 __down_read_common+0x54/0x2a0 kernel/locking/rwsem.c:1252
 __gfs2_trans_begin+0x4e4/0x8c0 fs/gfs2/trans.c:87
 gfs2_trans_begin+0x6d/0xe0 fs/gfs2/trans.c:118
 gfs2_write_jdata_pagevec+0x100/0xe20 fs/gfs2/aops.c:220
 gfs2_write_cache_jdata+0x46d/0x7b0 fs/gfs2/aops.c:349
 gfs2_jdata_writepages+0x81/0x150 fs/gfs2/aops.c:391
 do_writepages+0x3c3/0x680 mm/page-writeback.c:2469
 filemap_fdatawrite_wbc+0x11e/0x170 mm/filemap.c:388
 gfs2_ail1_start_one fs/gfs2/log.c:134 [inline]
 gfs2_ail1_flush+0xbc3/0xeb0 fs/gfs2/log.c:214
 gfs2_ail1_start fs/gfs2/log.c:245 [inline]
 empty_ail1_list+0x17f/0x260 fs/gfs2/log.c:977
 gfs2_log_flush+0x212a/0x26a0 fs/gfs2/log.c:1122
 gfs2_kill_sb+0x50/0xd0 fs/gfs2/ops_fstype.c:1725
 deactivate_locked_super+0xa7/0xf0 fs/super.c:331
 cleanup_mnt+0x4ce/0x560 fs/namespace.c:1186
 task_work_run+0x146/0x1c0 kernel/task_work.c:177
 ptrace_notify+0x29a/0x340 kernel/signal.c:2354
 ptrace_report_syscall include/linux/ptrace.h:420 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:482 [inline]
 syscall_exit_work+0x8c/0xe0 kernel/entry/common.c:249
 syscall_exit_to_user_mode_prepare+0x63/0xc0 kernel/entry/common.c:276
 __syscall_exit_to_user_mode_work kernel/entry/common.c:281 [inline]
 syscall_exit_to_user_mode+0xa/0x60 kernel/entry/common.c:294
 do_syscall_64+0x49/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fc8dc1bc527
RSP: 002b:00007fff602f2de8 EFLAGS: 00000206 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007fc8dc1bc527
RDX: 00007fff602f2ea9 RSI: 000000000000000a RDI: 00007fff602f2ea0
RBP: 00007fff602f2ea0 R08: 00000000ffffffff R09: 00007fff602f2c80
R10: 000055555558c653 R11: 0000000000000206 R12: 00007fff602f3f10
R13: 000055555558c5f0 R14: 00007fff602f2e10 R15: 0000000000000005
 </TASK>
INFO: task gfs2_logd:3658 blocked for more than 143 seconds.
      Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:gfs2_logd       state:D stack:29592 pid: 3658 ppid:     2 flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5183 [inline]
 __schedule+0x91f/0xdf0 kernel/sched/core.c:6495
 schedule+0xcb/0x190 kernel/sched/core.c:6571
 rwsem_down_write_slowpath+0xf1c/0x1350 kernel/locking/rwsem.c:1182
 __down_write_common kernel/locking/rwsem.c:1297 [inline]
 __down_write kernel/locking/rwsem.c:1306 [inline]
 down_write+0x163/0x170 kernel/locking/rwsem.c:1553
 gfs2_log_flush+0xe7/0x26a0 fs/gfs2/log.c:1034
 gfs2_logd+0x41f/0xe50 fs/gfs2/log.c:1319
 kthread+0x266/0x300 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>
INFO: task gfs2_quotad:3659 blocked for more than 144 seconds.
      Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:gfs2_quotad     state:D stack:27576 pid: 3659 ppid:     2 flags:0x00004000
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5183 [inline]
 __schedule+0x91f/0xdf0 kernel/sched/core.c:6495
 schedule+0xcb/0x190 kernel/sched/core.c:6571
 rwsem_down_read_slowpath+0x5f9/0x930 kernel/locking/rwsem.c:1087
 __down_read_common+0x54/0x2a0 kernel/locking/rwsem.c:1252
 __gfs2_trans_begin+0x4e4/0x8c0 fs/gfs2/trans.c:87
 gfs2_trans_begin+0x6d/0xe0 fs/gfs2/trans.c:118
 gfs2_statfs_sync+0x37f/0x4c0 fs/gfs2/super.c:294
 quotad_check_timeo fs/gfs2/quota.c:1512 [inline]
 gfs2_quotad+0x485/0xb20 fs/gfs2/quota.c:1554
 kthread+0x266/0x300 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>
INFO: task syz-executor714:3660 blocked for more than 144 seconds.
      Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor714 state:D stack:27064 pid: 3660 ppid:  3608 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5183 [inline]
 __schedule+0x91f/0xdf0 kernel/sched/core.c:6495
 schedule+0xcb/0x190 kernel/sched/core.c:6571
 rwsem_down_read_slowpath+0x5f9/0x930 kernel/locking/rwsem.c:1087
 __down_read_common+0x54/0x2a0 kernel/locking/rwsem.c:1252
 iterate_supers+0xb0/0x1f0 fs/super.c:721
 ksys_sync+0xd5/0x1c0 fs/sync.c:104
 __do_sys_sync+0xa/0x10 fs/sync.c:113
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fc8dc1bb189
RSP: 002b:00007fff602f3ed8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 000000000000e657 RCX: 00007fc8dc1bb189
RDX: 00007fc8dc1baba7 RSI: 0000000000000004 RDI: 00007fc8dc1ff074
RBP: 0000000000000000 R08: 00007fff602f3950 R09: 00007fff602f3f00
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff602f3efc
R13: 00007fff602f3f30 R14: 00007fff602f3f10 R15: 0000000000000005
 </TASK>
INFO: task syz-executor714:3661 blocked for more than 144 seconds.
      Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor714 state:D stack:27288 pid: 3661 ppid:  3610 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5183 [inline]
 __schedule+0x91f/0xdf0 kernel/sched/core.c:6495
 schedule+0xcb/0x190 kernel/sched/core.c:6571
 rwsem_down_read_slowpath+0x5f9/0x930 kernel/locking/rwsem.c:1087
 __down_read_common+0x54/0x2a0 kernel/locking/rwsem.c:1252
 iterate_supers+0xb0/0x1f0 fs/super.c:721
 ksys_sync+0xb7/0x1c0 fs/sync.c:102
 __do_sys_sync+0xa/0x10 fs/sync.c:113
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fc8dc1bb189
RSP: 002b:00007fff602f3ed8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 000000000000e326 RCX: 00007fc8dc1bb189
RDX: 00007fc8dc1baba7 RSI: 0000000000000004 RDI: 00007fc8dc1ff074
RBP: 0000000000000000 R08: 00007fff602f3950 R09: 00007fff602f3f00
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff602f3efc
R13: 00007fff602f3f30 R14: 00007fff602f3f10 R15: 0000000000000005
 </TASK>
INFO: task syz-executor714:3662 blocked for more than 144 seconds.
      Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor714 state:D stack:28088 pid: 3662 ppid:  3612 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5183 [inline]
 __schedule+0x91f/0xdf0 kernel/sched/core.c:6495
 schedule+0xcb/0x190 kernel/sched/core.c:6571
 rwsem_down_read_slowpath+0x5f9/0x930 kernel/locking/rwsem.c:1087
 __down_read_common+0x54/0x2a0 kernel/locking/rwsem.c:1252
 iterate_supers+0xb0/0x1f0 fs/super.c:721
 ksys_sync+0xb7/0x1c0 fs/sync.c:102
 __do_sys_sync+0xa/0x10 fs/sync.c:113
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fc8dc1bb189
RSP: 002b:00007fff602f3ed8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 000000000000e34d RCX: 00007fc8dc1bb189
RDX: 00007fc8dc1baba7 RSI: 0000000000000004 RDI: 00007fc8dc1ff074
RBP: 0000000000000000 R08: 00007fff602f3950 R09: 00007fff602f3f00
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff602f3efc
R13: 00007fff602f3f30 R14: 00007fff602f3f10 R15: 0000000000000005
 </TASK>
INFO: task syz-executor714:3663 blocked for more than 144 seconds.
      Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor714 state:D stack:28088 pid: 3663 ppid:  3607 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5183 [inline]
 __schedule+0x91f/0xdf0 kernel/sched/core.c:6495
 schedule+0xcb/0x190 kernel/sched/core.c:6571
 rwsem_down_read_slowpath+0x5f9/0x930 kernel/locking/rwsem.c:1087
 __down_read_common+0x54/0x2a0 kernel/locking/rwsem.c:1252
 iterate_supers+0xb0/0x1f0 fs/super.c:721
 ksys_sync+0xb7/0x1c0 fs/sync.c:102
 __do_sys_sync+0xa/0x10 fs/sync.c:113
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fc8dc1bb189
RSP: 002b:00007fff602f3ed8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 000000000000e673 RCX: 00007fc8dc1bb189
RDX: 00007fc8dc1baba7 RSI: 0000000000000004 RDI: 00007fc8dc1ff074
RBP: 0000000000000000 R08: 00007fff602f3950 R09: 00007fff602f3f00
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff602f3efc
R13: 00007fff602f3f30 R14: 00007fff602f3f10 R15: 0000000000000005
 </TASK>
INFO: task syz-executor714:3664 blocked for more than 145 seconds.
      Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor714 state:D stack:28088 pid: 3664 ppid:  3611 flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5183 [inline]
 __schedule+0x91f/0xdf0 kernel/sched/core.c:6495
 schedule+0xcb/0x190 kernel/sched/core.c:6571
 rwsem_down_read_slowpath+0x5f9/0x930 kernel/locking/rwsem.c:1087
 __down_read_common+0x54/0x2a0 kernel/locking/rwsem.c:1252
 iterate_supers+0xb0/0x1f0 fs/super.c:721
 ksys_sync+0xb7/0x1c0 fs/sync.c:102
 __do_sys_sync+0xa/0x10 fs/sync.c:113
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fc8dc1bb189
RSP: 002b:00007fff602f3ed8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 000000000000e62e RCX: 00007fc8dc1bb189
RDX: 00007fc8dc1baba7 RSI: 0000000000000004 RDI: 00007fc8dc1ff074
RBP: 0000000000000000 R08: 00007fff602f3950 R09: 00007fff602f3f00
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fff602f3efc
R13: 00007fff602f3f30 R14: 00007fff602f3f10 R15: 0000000000000005
 </TASK>
INFO: lockdep is turned off.
NMI backtrace for cpu 0
CPU: 0 PID: 29 Comm: khungtaskd Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x28e lib/dump_stack.c:106
 nmi_cpu_backtrace+0x425/0x450 lib/nmi_backtrace.c:111
 nmi_trigger_cpumask_backtrace+0x169/0x280 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:148 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:212 [inline]
 watchdog+0xcd5/0xd20 kernel/hung_task.c:369
 kthread+0x266/0x300 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 PID: 1081 Comm: kworker/u4:5 Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
Workqueue: events_unbound toggle_allocation_gate
RIP: 0010:__sanitizer_cov_trace_switch+0x0/0x100 kernel/kcov.c:310
Code: 48 83 c8 08 48 c7 04 01 07 00 00 00 48 89 d0 48 83 c8 10 48 89 3c 01 48 83 ca 18 48 89 34 11 4e 89 44 c9 20 c3 0f 1f 44 00 00 <41> 57 41 56 53 48 8b 46 08 48 83 c0 f8 48 c1 c0 3d 48 83 f8 07 0f
RSP: 0018:ffffc9000515f810 EFLAGS: 00000246
RAX: 1ffff92000a2bf00 RBX: 0000000000000001 RCX: 0000000000000000
RDX: ffff8880200fd880 RSI: ffffffff8d1c1900 RDI: 0000000000000001
RBP: 0000000000000000 R08: ffffffff846979e0 R09: ffffc9000515f960
R10: fffff52000a2bf37 R11: 1ffff92000a2bf2c R12: ffffc9000515f960
R13: 0000000000000044 R14: 1ffff92000a2bf39 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055c30a147990 CR3: 000000000c88e000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 insn_get_displacement+0x33b/0x9a0 arch/x86/lib/insn.c:490
 insn_get_immediate+0x427/0x12e0 arch/x86/lib/insn.c:632
 insn_get_length arch/x86/lib/insn.c:707 [inline]
 insn_decode+0x3b0/0x550 arch/x86/lib/insn.c:747
 text_poke_loc_init+0xb3/0x500 arch/x86/kernel/alternative.c:1590
 arch_jump_label_transform_queue+0x70/0xd0 arch/x86/kernel/jump_label.c:138
 __jump_label_update+0x19b/0x3b0 kernel/jump_label.c:447
 static_key_disable_cpuslocked+0xc8/0x1b0 kernel/jump_label.c:207
 static_key_disable+0x16/0x20 kernel/jump_label.c:215
 toggle_allocation_gate+0x3b8/0x450 mm/kfence/core.c:825
 process_one_work+0x877/0xdb0 kernel/workqueue.c:2289
 worker_thread+0xb14/0x1330 kernel/workqueue.c:2436
 kthread+0x266/0x300 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

