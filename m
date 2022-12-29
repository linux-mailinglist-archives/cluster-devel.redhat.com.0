Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6205E65BD0B
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Jan 2023 10:21:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672737705;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BZWhUOqvVJv7oMXAvzTaUDDWk6sU1KCsBpgr8vlboZQ=;
	b=b4cG+H+rUmDIfU1jP0v/jqOGsp8+LaBfmyk7JFWr5QlVhR2DxjEXb0ktl7kkfSGgoduhDC
	azzRGY8vmYXmAKt848wjmsfZVOasbJmgY9IdWxsA/Q1+OMtgmfVMZF0gBYpu1gIN92bLgb
	6ZRGgpGYKD8qFR6DCfws/EifEhfwEbs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-l6rZzZtiPk-EFnhwHv8YDw-1; Tue, 03 Jan 2023 04:21:41 -0500
X-MC-Unique: l6rZzZtiPk-EFnhwHv8YDw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4B821C02D3B;
	Tue,  3 Jan 2023 09:21:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40618492D8B;
	Tue,  3 Jan 2023 09:21:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3100419465A8;
	Tue,  3 Jan 2023 09:21:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0AA911946586 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 29 Dec 2022 15:58:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1B682140EBF6; Thu, 29 Dec 2022 15:58:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13A5C140EBF5
 for <cluster-devel@redhat.com>; Thu, 29 Dec 2022 15:58:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAA12858F09
 for <cluster-devel@redhat.com>; Thu, 29 Dec 2022 15:58:44 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-DV1lD1JFMRC742DcF-joGg-1; Thu, 29 Dec 2022 10:58:43 -0500
X-MC-Unique: DV1lD1JFMRC742DcF-joGg-1
Received: by mail-il1-f200.google.com with SMTP id
 n15-20020a056e021baf00b0030387c2e1d3so11947183ili.5
 for <cluster-devel@redhat.com>; Thu, 29 Dec 2022 07:58:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BZWhUOqvVJv7oMXAvzTaUDDWk6sU1KCsBpgr8vlboZQ=;
 b=EB1xH4ShGJsat8lmAVQmQy7aegL7RVr7BYTSmPppfNjLytdGflXRVgwYrxaEhqJ8ZK
 PUhSHQ1G0vMtPY1snSbscgAagTD03VvvZr3vvhvyDbQethL8pzY1OBKkEMr07i1Q7H97
 ih06UU4knD+xQvIHzLwt3U9+IWXknyjTEX8KqnMz5NyFRvZPT/TCZzQ+difpMg4PiPhr
 asN13zI6TFtT+zT+MtQGeVW+poGzaMSWQswKbjXB8/Oj4LjtxWRNIBx5dUHLKu/QyUdR
 HxNS8n9ef0FCgX/vzOe9J7ZbG9uEybmZrJG9bdGLmTcW/rmv5RJg8Xqwla0m0DGtAULa
 zqaQ==
X-Gm-Message-State: AFqh2kpFhJMqTz5b61R0XX3rmkExj6HnGzH8L0rEdUN/yIVVptXhsdyQ
 Cg5ghtVKMdpUAHmq+V2bF4A5RFnKynty6N9tEURjzGbgSGaQ
X-Google-Smtp-Source: AMrXdXvMb/TP+vKk1RlbLZ0l7Y8aCbuuq8FtUUFt8g6TaiSOB1Uu8DI3S/s43jyO/jfJCGP4iL1OGNeVOwy9eHDLaDNBMZQ21CDR
MIME-Version: 1.0
X-Received: by 2002:a02:6f04:0:b0:38a:8910:44c6 with SMTP id
 x4-20020a026f04000000b0038a891044c6mr2470581jab.251.1672329522374; Thu, 29
 Dec 2022 07:58:42 -0800 (PST)
Date: Thu, 29 Dec 2022 07:58:42 -0800
In-Reply-To: <000000000000b9753505eaa93b18@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000020f3ac05f0f98f86@google.com>
From: syzbot <syzbot+be899d4f10b2a9522dce@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Tue, 03 Jan 2023 09:21:37 +0000
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] possible deadlock in
 freeze_super (2)
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    1b929c02afd3 Linux 6.2-rc1
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=11447312480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=68e0be42c8ee4bb4
dashboard link: https://syzkaller.appspot.com/bug?extid=be899d4f10b2a9522dce
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14b638c0480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11b17270480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2d8c5072480f/disk-1b929c02.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/46687f1395db/vmlinux-1b929c02.xz
kernel image: https://storage.googleapis.com/syzbot-assets/26f1afa5ec00/bzImage-1b929c02.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/952580c084c8/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+be899d4f10b2a9522dce@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.2.0-rc1-syzkaller #0 Not tainted
------------------------------------------------------
kworker/0:1H/52 is trying to acquire lock:
ffff8880277440e0 (&type->s_umount_key#44){+.+.}-{3:3}, at: freeze_super+0x45/0x420 fs/super.c:1655

but task is already holding lock:
ffffc90000bd7d00 ((work_completion)(&(&gl->gl_work)->work)){+.+.}-{0:0}, at: process_one_work+0x831/0xdb0 kernel/workqueue.c:2264

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 ((work_completion)(&(&gl->gl_work)->work)){+.+.}-{0:0}:
       lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
       process_one_work+0x852/0xdb0 kernel/workqueue.c:2265
       worker_thread+0xb14/0x1330 kernel/workqueue.c:2436
       kthread+0x266/0x300 kernel/kthread.c:376
       ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308

-> #1 ((wq_completion)glock_workqueue){+.+.}-{0:0}:
       lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
       __flush_workqueue+0x178/0x1680 kernel/workqueue.c:2809
       gfs2_gl_hash_clear+0xa3/0x300 fs/gfs2/glock.c:2191
       gfs2_put_super+0x862/0x8d0 fs/gfs2/super.c:627
       generic_shutdown_super+0x130/0x310 fs/super.c:492
       kill_block_super+0x79/0xd0 fs/super.c:1386
       deactivate_locked_super+0xa7/0xf0 fs/super.c:332
       cleanup_mnt+0x494/0x520 fs/namespace.c:1291
       task_work_run+0x243/0x300 kernel/task_work.c:179
       ptrace_notify+0x29a/0x340 kernel/signal.c:2354
       ptrace_report_syscall include/linux/ptrace.h:411 [inline]
       ptrace_report_syscall_exit include/linux/ptrace.h:473 [inline]
       syscall_exit_work+0x8c/0xe0 kernel/entry/common.c:251
       syscall_exit_to_user_mode_prepare+0x63/0xc0 kernel/entry/common.c:278
       __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
       syscall_exit_to_user_mode+0xa/0x60 kernel/entry/common.c:296
       do_syscall_64+0x49/0xb0 arch/x86/entry/common.c:86
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (&type->s_umount_key#44){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3097 [inline]
       check_prevs_add kernel/locking/lockdep.c:3216 [inline]
       validate_chain+0x1898/0x6ae0 kernel/locking/lockdep.c:3831
       __lock_acquire+0x1292/0x1f60 kernel/locking/lockdep.c:5055
       lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
       down_write+0x9c/0x270 kernel/locking/rwsem.c:1562
       freeze_super+0x45/0x420 fs/super.c:1655
       freeze_go_sync+0x178/0x340 fs/gfs2/glops.c:577
       do_xmote+0x34d/0x13d0 fs/gfs2/glock.c:708
       glock_work_func+0x2c2/0x450 fs/gfs2/glock.c:1056
       process_one_work+0x877/0xdb0 kernel/workqueue.c:2289
       worker_thread+0xb14/0x1330 kernel/workqueue.c:2436
       kthread+0x266/0x300 kernel/kthread.c:376
       ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308

other info that might help us debug this:

Chain exists of:
  &type->s_umount_key#44 --> (wq_completion)glock_workqueue --> (work_completion)(&(&gl->gl_work)->work)

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock((work_completion)(&(&gl->gl_work)->work));
                               lock((wq_completion)glock_workqueue);
                               lock((work_completion)(&(&gl->gl_work)->work));
  lock(&type->s_umount_key#44);

 *** DEADLOCK ***

2 locks held by kworker/0:1H/52:
 #0: ffff888018293938 ((wq_completion)glock_workqueue){+.+.}-{0:0}, at: process_one_work+0x7f2/0xdb0
 #1: ffffc90000bd7d00 ((work_completion)(&(&gl->gl_work)->work)
){+.+.}-{0:0}
, at: process_one_work+0x831/0xdb0 kernel/workqueue.c:2264

stack backtrace:
CPU: 0 PID: 52 Comm: kworker/0:1H Not tainted 6.2.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Workqueue: glock_workqueue glock_work_func
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x290 lib/dump_stack.c:106
 check_noncircular+0x2cc/0x390 kernel/locking/lockdep.c:2177
 check_prev_add kernel/locking/lockdep.c:3097 [inline]
 check_prevs_add kernel/locking/lockdep.c:3216 [inline]
 validate_chain+0x1898/0x6ae0 kernel/locking/lockdep.c:3831
 __lock_acquire+0x1292/0x1f60 kernel/locking/lockdep.c:5055
 lock_acquire+0x182/0x3c0 kernel/locking/lockdep.c:5668
 down_write+0x9c/0x270 kernel/locking/rwsem.c:1562
 freeze_super+0x45/0x420 fs/super.c:1655
 freeze_go_sync+0x178/0x340 fs/gfs2/glops.c:577
 do_xmote+0x34d/0x13d0 fs/gfs2/glock.c:708
 glock_work_func+0x2c2/0x450 fs/gfs2/glock.c:1056
 process_one_work+0x877/0xdb0 kernel/workqueue.c:2289
 worker_thread+0xb14/0x1330 kernel/workqueue.c:2436
 kthread+0x266/0x300 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>

