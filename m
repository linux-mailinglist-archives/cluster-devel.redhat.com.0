Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBD5F9C46
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Oct 2022 11:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665395684;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Mhx3CAe2+dSGVGWbh5A0XVveuC07dpAoSZWx+kYbg0U=;
	b=TgTbAD4frR6ByI7fnXZNhzPBL2lFzbwNe+LwiLuknL4V6rQm/OP5SvVBuRJBgVowOrNIXz
	6/6f1cxu4Z1SfdA/ISLn4hpFUqITO/Y6G60Kz8Bak7iaUMc+zMYYsI2Bq1eWkUo/uq1lDJ
	hPZhbQ1aEu+fNjVEgfseQ6/Slj3LwX8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62--LIteZ7vPi-5FZ4KkwqbSg-1; Mon, 10 Oct 2022 05:54:41 -0400
X-MC-Unique: -LIteZ7vPi-5FZ4KkwqbSg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB45B95D691;
	Mon, 10 Oct 2022 09:54:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C323492B07;
	Mon, 10 Oct 2022 09:54:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 194751946A4F;
	Mon, 10 Oct 2022 09:54:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6EADC1946595 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 10 Oct 2022 07:37:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5C16840C6EC3; Mon, 10 Oct 2022 07:37:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5462140C6EC2
 for <cluster-devel@redhat.com>; Mon, 10 Oct 2022 07:37:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 336553826243
 for <cluster-devel@redhat.com>; Mon, 10 Oct 2022 07:37:38 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-190-Ma0xt2KbMginlvZPctl6fQ-1; Mon, 10 Oct 2022 03:37:36 -0400
X-MC-Unique: Ma0xt2KbMginlvZPctl6fQ-1
Received: by mail-io1-f69.google.com with SMTP id
 s3-20020a5eaa03000000b006bbdfc81c6fso2606414ioe.4
 for <cluster-devel@redhat.com>; Mon, 10 Oct 2022 00:37:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mhx3CAe2+dSGVGWbh5A0XVveuC07dpAoSZWx+kYbg0U=;
 b=hiC3Fa+vhRPtCJw0luC77/GAVJSf5i7MbCe0ROchpF0l9Ji5o2Z5r+hFgvZ+/uyYn7
 y0oKnC+yoyI43St1fSpMLWCwRsaKTReY3U8H28ojwXZYgsOedgyPKd2uNwrj2EtmLVrL
 i61ZYgscpknF8A6GNvu2zqKs4ab06JVB9Ji+b8czq9O6sPhDBCftKetKFudgICPmHgAq
 sieVJfKmWquIviEHzAjQ2YLjh6DkfUA3fF5mthBii3AShw4DC6NJo7AHuhW7l08FEwmN
 rPd+gi3YB6/H/+GMC/qT3hsBWLmRp13fH317E7di0NRtn/L252IMCCMmK4aZp0oUsF0u
 5Aog==
X-Gm-Message-State: ACrzQf1NNGDzZYsQHZDPkzgdZ/tPMLZSe47GZNRtPK/OsOWxtklXIebt
 ZYJ0UyGUskH8QEl1ZLpHYS1c9MclpKKC5pO3LqWi1COHDjBH
X-Google-Smtp-Source: AMsMyM4g1E9ZRPIwsQpQcy3XeKFlctSI65giWudHqqlyV0jYuZ/1ZxdHp18oL3P1SuDdkR3ASaxbdeHzyGBZJIgFwpWGDEtq1xNp
MIME-Version: 1.0
X-Received: by 2002:a92:2c0e:0:b0:2f5:64eb:34a4 with SMTP id
 t14-20020a922c0e000000b002f564eb34a4mr8462513ile.188.1665387455933; Mon, 10
 Oct 2022 00:37:35 -0700 (PDT)
Date: Mon, 10 Oct 2022 00:37:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b9753505eaa93b18@google.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Mon, 10 Oct 2022 09:54:37 +0000
Subject: [Cluster-devel] [syzbot] possible deadlock in freeze_super (2)
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

HEAD commit:    bbed346d5a96 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=16b0403a880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3a4a45d2d827c1e
dashboard link: https://syzkaller.appspot.com/bug?extid=be899d4f10b2a9522dce
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8e91bc79312/disk-bbed346d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c1cb3fb3b77e/vmlinux-bbed346d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+be899d4f10b2a9522dce@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0 Not tainted
------------------------------------------------------
kworker/1:1H/76 is trying to acquire lock:
ffff000122d770e0 (&type->s_umount_key#113){+.+.}-{3:3}, at: freeze_super+0x40/0x1f0 fs/super.c:1696

but task is already holding lock:
ffff80000fb63d80 ((work_completion)(&(&gl->gl_work)->work)){+.+.}-{0:0}, at: process_one_work+0x29c/0x504 kernel/workqueue.c:2264

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 ((work_completion)(&(&gl->gl_work)->work)){+.+.}-{0:0}:
       process_one_work+0x2c4/0x504 kernel/workqueue.c:2265
       worker_thread+0x340/0x610 kernel/workqueue.c:2436
       kthread+0x12c/0x158 kernel/kthread.c:376
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860

-> #1 ((wq_completion)glock_workqueue){+.+.}-{0:0}:
       __flush_workqueue+0xb8/0x6dc kernel/workqueue.c:2809
       gfs2_gl_hash_clear+0x4c/0x1b0 fs/gfs2/glock.c:2207
       gfs2_put_super+0x318/0x390 fs/gfs2/super.c:619
       generic_shutdown_super+0x8c/0x190 fs/super.c:491
       kill_block_super+0x30/0x78 fs/super.c:1427
       gfs2_kill_sb+0x68/0x78
       deactivate_locked_super+0x70/0xe8 fs/super.c:332
       deactivate_super+0xd0/0xd4 fs/super.c:363
       cleanup_mnt+0x1f8/0x234 fs/namespace.c:1186
       __cleanup_mnt+0x20/0x30 fs/namespace.c:1193
       task_work_run+0xc4/0x14c kernel/task_work.c:177
       resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
       do_notify_resume+0x174/0x1f0 arch/arm64/kernel/signal.c:1127
       prepare_exit_to_user_mode arch/arm64/kernel/entry-common.c:137 [inline]
       exit_to_user_mode arch/arm64/kernel/entry-common.c:142 [inline]
       el0_svc+0x9c/0x150 arch/arm64/kernel/entry-common.c:637
       el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
       el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581

-> #0 (&type->s_umount_key#113){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3095 [inline]
       check_prevs_add kernel/locking/lockdep.c:3214 [inline]
       validate_chain kernel/locking/lockdep.c:3829 [inline]
       __lock_acquire+0x1530/0x30a4 kernel/locking/lockdep.c:5053
       lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
       down_write+0x5c/0xcc kernel/locking/rwsem.c:1552
       freeze_super+0x40/0x1f0 fs/super.c:1696
       freeze_go_sync+0x84/0x1a8 fs/gfs2/glops.c:573
       do_xmote+0x180/0x954 fs/gfs2/glock.c:769
       run_queue+0x294/0x3c4 fs/gfs2/glock.c:893
       glock_work_func+0x190/0x288 fs/gfs2/glock.c:1059
       process_one_work+0x2d8/0x504 kernel/workqueue.c:2289
       worker_thread+0x340/0x610 kernel/workqueue.c:2436
       kthread+0x12c/0x158 kernel/kthread.c:376
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860

other info that might help us debug this:

Chain exists of:
  &type->s_umount_key#113 --> (wq_completion)glock_workqueue --> (work_completion)(&(&gl->gl_work)->work)

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock((work_completion)(&(&gl->gl_work)->work));
                               lock((wq_completion)glock_workqueue);
                               lock((work_completion)(&(&gl->gl_work)->work));
  lock(&type->s_umount_key#113);

 *** DEADLOCK ***

2 locks held by kworker/1:1H/76:
 #0: ffff0000c0de2f38 ((wq_completion)glock_workqueue){+.+.}-{0:0}, at: process_one_work+0x270/0x504 kernel/workqueue.c:2262
 #1: ffff80000fb63d80 ((work_completion)(&(&gl->gl_work)->work)){+.+.}-{0:0}, at: process_one_work+0x29c/0x504 kernel/workqueue.c:2264

stack backtrace:
CPU: 1 PID: 76 Comm: kworker/1:1H Not tainted 6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
Workqueue: glock_workqueue glock_work_func
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x54 arch/arm64/kernel/stacktrace.c:163
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 print_circular_bug+0x2c4/0x2c8 kernel/locking/lockdep.c:2053
 check_noncircular+0x14c/0x154 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3095 [inline]
 check_prevs_add kernel/locking/lockdep.c:3214 [inline]
 validate_chain kernel/locking/lockdep.c:3829 [inline]
 __lock_acquire+0x1530/0x30a4 kernel/locking/lockdep.c:5053
 lock_acquire+0x100/0x1f8 kernel/locking/lockdep.c:5666
 down_write+0x5c/0xcc kernel/locking/rwsem.c:1552
 freeze_super+0x40/0x1f0 fs/super.c:1696
 freeze_go_sync+0x84/0x1a8 fs/gfs2/glops.c:573
 do_xmote+0x180/0x954 fs/gfs2/glock.c:769
 run_queue+0x294/0x3c4 fs/gfs2/glock.c:893
 glock_work_func+0x190/0x288 fs/gfs2/glock.c:1059
 process_one_work+0x2d8/0x504 kernel/workqueue.c:2289
 worker_thread+0x340/0x610 kernel/workqueue.c:2436
 kthread+0x12c/0x158 kernel/kthread.c:376
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:860


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

