Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EAD65BD0A
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Jan 2023 10:21:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672737702;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U1UQUd3vyTkUP8x8Sf6RMJ97c9ni0l2jcysvOfEmp2g=;
	b=RgbwtkvtHZjYJgWkeW2MtYg7LpytIcQXJaOZpvzZZ0FxOu6BCJabNdnquzohpo4PDNas7L
	mNXf0EUU4m2bwVejdR6PHA2asdLDLT+kPoujEDUZ2L0hmM6mOuEv4WD3JJE5WommWcHzKR
	X1VNhG2TiBnhSc3j8ldVxd6UGlNbxt0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-Yxgs9UUTPheud8zgN8EQMw-1; Tue, 03 Jan 2023 04:21:41 -0500
X-MC-Unique: Yxgs9UUTPheud8zgN8EQMw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B52918F6E8B;
	Tue,  3 Jan 2023 09:21:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A018E492C1B;
	Tue,  3 Jan 2023 09:21:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 87ED7194658F;
	Tue,  3 Jan 2023 09:21:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E5BBD1946588 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 24 Dec 2022 04:03:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9A58E492C18; Sat, 24 Dec 2022 04:03:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9268C492C14
 for <cluster-devel@redhat.com>; Sat, 24 Dec 2022 04:03:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71FD78F6E83
 for <cluster-devel@redhat.com>; Sat, 24 Dec 2022 04:03:45 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-365-oku3n-_GMNykfIK1_j3UiQ-1; Fri, 23 Dec 2022 23:03:43 -0500
X-MC-Unique: oku3n-_GMNykfIK1_j3UiQ-1
Received: by mail-il1-f198.google.com with SMTP id
 g3-20020a056e021a2300b00305e3da9585so3576311ile.16
 for <cluster-devel@redhat.com>; Fri, 23 Dec 2022 20:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=U1UQUd3vyTkUP8x8Sf6RMJ97c9ni0l2jcysvOfEmp2g=;
 b=T4Rs+4CGokKMK9nuKr86dbTu9EX4y6/7QckWW4JjAqQrIeNWQ5WAqVYo0ATzqVGYhG
 MOwhferBwL7wCW61Ie513VEQHJ2+TqKeQQoTDpow0MkfUIuOxzjnjML4QoD1qW2e//3A
 RAts3OAxbkqv+dNYB2jsmBVEr8FA3QFYvHt7LvicNlCXmVGsHsWTCHBe5hH3Fi3S0Gl3
 WmcZjXwD+q6yyb6eW7pCghzrRPEvYmj/7typj5giIlxqQthkOL+5+QhxXdEKzBhYyZbK
 mqdQGUF9I8g/878L71CFzzZxZpLG/vluNKOFIQ/3m7Vwn9DFK0o7M179QYb7/DlMYcAl
 Nu7g==
X-Gm-Message-State: AFqh2kpYkEgNzsk2yILFK7qi8C6714+6PJR5g5GCSlMbsT7Zw8UD3gDn
 d1k4RNTYXlr3Q/lJTyIdgUkCch7adVA9NCyeMqk9aF1zyZ4h
X-Google-Smtp-Source: AMrXdXsQ1q0MvPM0cHGlSGHLwvqXS3+yhzNedTL4nqDc2r/iD7KAr4T549QlA7/CB+uevI4qiXcIimnpxSPM/KJmSrLhewoXCyi5
MIME-Version: 1.0
X-Received: by 2002:a02:620e:0:b0:376:2324:bfe1 with SMTP id
 d14-20020a02620e000000b003762324bfe1mr1078019jac.189.1671854622694; Fri, 23
 Dec 2022 20:03:42 -0800 (PST)
Date: Fri, 23 Dec 2022 20:03:42 -0800
In-Reply-To: <000000000000aa6d8005f04d3d00@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e6ec2805f08afc11@google.com>
From: syzbot <syzbot+b9c5afe053a08cd29468@syzkaller.appspotmail.com>
To: agruenba@redhat.com, akpm@linux-foundation.org, brauner@kernel.org, 
 broonie@kernel.org, catalin.marinas@arm.com, cluster-devel@redhat.com, 
 ebiederm@xmission.com, linux-arm-kernel@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, rpeterso@redhat.com, syzkaller-bugs@googlegroups.com, 
 wangkefeng.wang@huawei.com, will@kernel.org, willy@infradead.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Tue, 03 Jan 2023 09:21:37 +0000
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] INFO: task hung in
 gfs2_jhead_process_page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a5541c0811a0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=172de6df880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cbd4e584773e9397
dashboard link: https://syzkaller.appspot.com/bug?extid=b9c5afe053a08cd29468
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=116fc088480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1756e060480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b7702208fb9/disk-a5541c08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec0153ec051/vmlinux-a5541c08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6f8725ad290a/Image-a5541c08.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/aa84169739f7/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b9c5afe053a08cd29468@syzkaller.appspotmail.com

INFO: task kworker/1:2:2221 blocked for more than 143 seconds.
      Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:2     state:D stack:0     pid:2221  ppid:2      flags:0x00000008
Workqueue: gfs_recovery gfs2_recover_func
Call trace:
 __switch_to+0x180/0x298 arch/arm64/kernel/process.c:555
 context_switch kernel/sched/core.c:5209 [inline]
 __schedule+0x408/0x594 kernel/sched/core.c:6521
 schedule+0x64/0xa4 kernel/sched/core.c:6597
 io_schedule+0x38/0xbc kernel/sched/core.c:8741
 folio_wait_bit_common+0x430/0x97c mm/filemap.c:1296
 folio_wait_bit+0x30/0x40 mm/filemap.c:1440
 folio_wait_locked include/linux/pagemap.h:1022 [inline]
 gfs2_jhead_process_page+0xb4/0x40c fs/gfs2/lops.c:476
 gfs2_find_jhead+0x450/0x50c fs/gfs2/lops.c:594
 gfs2_recover_func+0x278/0xcc8 fs/gfs2/recovery.c:460
 process_one_work+0x2d8/0x504 kernel/workqueue.c:2289
 worker_thread+0x340/0x610 kernel/workqueue.c:2436
 kthread+0x12c/0x158 kernel/kthread.c:376
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:863
INFO: task syz-executor189:3110 blocked for more than 143 seconds.
      Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor189 state:D stack:0     pid:3110  ppid:3109   flags:0x00000009
Call trace:
 __switch_to+0x180/0x298 arch/arm64/kernel/process.c:555
 context_switch kernel/sched/core.c:5209 [inline]
 __schedule+0x408/0x594 kernel/sched/core.c:6521
 schedule+0x64/0xa4 kernel/sched/core.c:6597
 bit_wait+0x18/0x60 kernel/sched/wait_bit.c:199
 __wait_on_bit kernel/sched/wait_bit.c:49 [inline]
 out_of_line_wait_on_bit+0xc8/0x140 kernel/sched/wait_bit.c:64
 wait_on_bit include/linux/wait_bit.h:76 [inline]
 gfs2_recover_journal+0xc0/0x104 fs/gfs2/recovery.c:577
 init_journal+0x930/0xcbc fs/gfs2/ops_fstype.c:835
 init_inodes+0x74/0x184 fs/gfs2/ops_fstype.c:889
 gfs2_fill_super+0x630/0x874 fs/gfs2/ops_fstype.c:1247
 get_tree_bdev+0x1e8/0x2a0 fs/super.c:1324
 gfs2_get_tree+0x30/0xc0 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x40/0x140 fs/super.c:1531
 do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
 path_mount+0x358/0x890 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x140 arch/arm64/kernel/syscall.c:197
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584

Showing all locks held in the system:
1 lock held by rcu_tasks_kthre/11:
 #0: ffff80000d4a4768 (rcu_tasks.tasks_gp_mutex){+.+.}-{3:3}, at: rcu_tasks_one_gp+0x3c/0x450 kernel/rcu/tasks.h:507
1 lock held by rcu_tasks_trace/12:
 #0: ffff80000d4a4db8 (rcu_tasks_trace.tasks_gp_mutex){+.+.}-{3:3}, at: rcu_tasks_one_gp+0x3c/0x450 kernel/rcu/tasks.h:507
1 lock held by khungtaskd/27:
 #0: ffff80000d4a4640 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire+0x4/0x48 include/linux/rcupdate.h:303
2 locks held by kworker/1:2/2221:
 #0: ffff0000c028d138 ((wq_completion)gfs_recovery){+.+.}-{0:0}, at: process_one_work+0x270/0x504 kernel/workqueue.c:2262
 #1: ffff800015de3d80 ((work_completion)(&jd->jd_work)){+.+.}-{0:0}, at: process_one_work+0x29c/0x504 kernel/workqueue.c:2264
2 locks held by getty/2758:
 #0: ffff0000c535f098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x28/0x58 drivers/tty/tty_ldisc.c:244
 #1: ffff80000f6be2f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0x19c/0x89c drivers/tty/n_tty.c:2177
1 lock held by syz-executor189/3110:
 #0: ffff0000cb5ee0e0 (&type->s_umount_key#40/1){+.+.}-{3:3}, at: alloc_super+0xf8/0x430 fs/super.c:228

=============================================


