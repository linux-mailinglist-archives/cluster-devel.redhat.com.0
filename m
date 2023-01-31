Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B81B682ED3
	for <lists+cluster-devel@lfdr.de>; Tue, 31 Jan 2023 15:06:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675174016;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=RRZnDLLabWbwWSScMiH2zz357fqdvjTW7mndj4jVZCw=;
	b=gKmjAzxh2PSU42Cefm31LgMcPdhy5tA+qjEiT33nVAErVcUmJWkVUQKH1Waf7zHRtwnXTU
	b+tCz6L4WCyhdZyz4Lj7AwQIGfocw8AxXj+wDLatIBPq0NNgARu6SBashVRGiDRbATuPyH
	CoCzwrOBRDYi/XllGs8i0xKHqMBwTZ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-gYLi-LNQM-6l0W6tQCHhmQ-1; Tue, 31 Jan 2023 09:06:53 -0500
X-MC-Unique: gYLi-LNQM-6l0W6tQCHhmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0ECE385CBE0;
	Tue, 31 Jan 2023 14:06:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB9142166B34;
	Tue, 31 Jan 2023 14:06:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8197F1946594;
	Tue, 31 Jan 2023 14:06:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AF9AA1946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 31 Jan 2023 14:06:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9FB1740C2004; Tue, 31 Jan 2023 14:06:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 96F7440C2064
 for <cluster-devel@redhat.com>; Tue, 31 Jan 2023 14:06:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75AFB1C00407
 for <cluster-devel@redhat.com>; Tue, 31 Jan 2023 14:06:46 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-zkTwwlNyNdGAs1fw1o1vkg-1; Tue, 31 Jan 2023 09:06:45 -0500
X-MC-Unique: zkTwwlNyNdGAs1fw1o1vkg-1
Received: by mail-pl1-f200.google.com with SMTP id
 m7-20020a170902db0700b00194bd3c810aso8357043plx.23
 for <cluster-devel@redhat.com>; Tue, 31 Jan 2023 06:06:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RRZnDLLabWbwWSScMiH2zz357fqdvjTW7mndj4jVZCw=;
 b=b+u6cw6OD1T2U2wDlBq7AEWKsFygfI5EigSYy+krBRg4Y//RtV1l+JPqT1g9nsNE0X
 +Vk0yr5VNC2+6LDYslQoW5zT7nF6Po6TWWXCVAGh26yFie4xGMtmny4AJtqU+VzLK7h3
 v2PnOkQPtB4kwcSwFY3va0WLuOy37IKEvB5jBMyCyISNV2//2mGDqtUxiRA4Tk+tHPW7
 uOULp6M5YV2BOuJF4GWWa81ROpOcIKkb4NYgumgQVQWKxQOyq55BIdl2YAvvP1aBYPVP
 VBEhhc3H+gdxQ+LjosGb1XHAEaOiHSnobs/m+Oq5SINugu5iZA7s0bNB9ta1i3WEVrA9
 KCfg==
X-Gm-Message-State: AO0yUKURA1OAiHZ8eC9cuDSUdZkG47yFPpAHVtzNpWG2tOpJy2E5h7Vf
 fJQFrSo5oCJsNXt5N5OIRDU1YDfTGSYLuUfC2eAGgX7e+mFbNlR5M9y+6frBw+bZQflzMrNY3ln
 Kfc2mj5eWHVd2Q+M/8F4FZxgCY5Fvant7EVzX7w==
X-Received: by 2002:aa7:9478:0:b0:593:b971:2579 with SMTP id
 t24-20020aa79478000000b00593b9712579mr1568240pfq.35.1675174002508; 
 Tue, 31 Jan 2023 06:06:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+IAUtABDohawcLkfAAAXWbVlqH3980hfzTvzX9E+s/uuZbeIKynQi9p95PjmiXPCRh7su8HkycsS6lh3pansU=
X-Received: by 2002:aa7:9478:0:b0:593:b971:2579 with SMTP id
 t24-20020aa79478000000b00593b9712579mr1568235pfq.35.1675174002021; Tue, 31
 Jan 2023 06:06:42 -0800 (PST)
MIME-Version: 1.0
References: <000000000000c921b105ef617f05@google.com>
 <75f056d3-fa52-e399-29cc-4388cae069ff@I-love.SAKURA.ne.jp>
In-Reply-To: <75f056d3-fa52-e399-29cc-4388cae069ff@I-love.SAKURA.ne.jp>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 31 Jan 2023 15:06:29 +0100
Message-ID: <CAHc6FU4MACOiGy9=zbh==V7uYHBO7kGpMsqKxjedXJpbcG8esA@mail.gmail.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [syzbot] INFO: task hung in freeze_super (3)
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
Cc: Hillf Danton <hdanton@sina.com>, syzkaller-bugs@googlegroups.com,
 syzbot <syzbot+f51cb4b9afbd87ec06f2@syzkaller.appspotmail.com>,
 cluster-devel@redhat.com, Waiman Long <longman@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

On Wed, Jan 4, 2023 at 3:37 PM Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
> syzbot is reporting hung task at freeze_super() after emitting
> "gfs2: fsid=loop0.0: can't make FS RW: -5" message due to gfs2_find_jhead()
>  from gfs2_make_fs_rw() from gfs2_fill_super() failing with -EIO.
>
> When hung task message is printed, I can observe that glock_workqueue is
> trying to hold type->s_umount_key from glock_workqueue work function
> whereas the reproducer is trying to flush glock_workqueue workqueue with
> type->s_umount_key held; leading to silent deadlock.
>
> [  259.867348] task:kworker/3:1H    state:D stack:13736 pid:2497  ppid:2      flags:0x00004000
> [  259.870666] Workqueue: glock_workqueue glock_work_func
> [  259.872886] Call Trace:
> [  259.874279]  <TASK>
> [  259.875452]  __schedule+0x498/0x590
> [  259.877255]  schedule+0x55/0x90
> [  259.878932]  rwsem_down_write_slowpath+0x385/0x760
> [  259.881206]  freeze_super+0x29/0x1f0
> [  259.883022]  freeze_go_sync+0xa6/0x1f0
> [  259.884905]  do_xmote+0x1ae/0xa60
> [  259.886625]  glock_work_func+0x19a/0x220
> [  259.888559]  process_one_work+0x306/0x530
> [  259.890548]  worker_thread+0x357/0x630
> [  259.892443]  kthread+0x133/0x170
> [  259.894430]  ? rcu_lock_release+0x30/0x30
> [  259.896408]  ? kthread_blkcg+0x60/0x60
> [  259.898289]  ret_from_fork+0x1f/0x30
> [  259.900114]  </TASK>
> [  259.901407] 3 locks held by kworker/3:1H/2497:
> [  259.903534]  #0: ffff88810653c338 ((wq_completion)glock_workqueue){+.+.}-{0:0}, at: process_one_work+0x2a7/0x530
> [  259.907874]  #1: ffffc900013dbe58 ((work_completion)(&(&gl->gl_work)->work)){+.+.}-{0:0}, at: process_one_work+0x2d1/0x530
> [  259.912529]  #2: ffff88812be0d0e0 (&type->s_umount_key#51){+.+.}-{3:3}, at: freeze_super+0x29/0x1f0
>
> [  259.975640] task:a.out           state:D stack:12664 pid:4579  ppid:3638   flags:0x00004006
> [  259.979256] Call Trace:
> [  259.980634]  <TASK>
> [  259.981886]  __schedule+0x498/0x590
> [  259.983653]  schedule+0x55/0x90
> [  259.985291]  schedule_timeout+0x9e/0x1d0
> [  259.987219]  do_wait_for_common+0xff/0x180
> [  259.989212]  ? console_conditional_schedule+0x40/0x40
> [  259.991585]  wait_for_completion+0x4a/0x60
> [  259.993573]  __flush_workqueue+0x360/0x820
> [  259.995584]  gfs2_gl_hash_clear+0x58/0x1b0
> [  259.997579]  ? _raw_spin_unlock_irqrestore+0x43/0xb0
> [  259.999883]  ? lockdep_hardirqs_on+0x99/0x140
> [  260.001970]  gfs2_fill_super+0xe24/0x1110
> [  260.003934]  ? gfs2_reconfigure+0x4d0/0x4d0
> [  260.005955]  get_tree_bdev+0x228/0x2f0
> [  260.007821]  gfs2_get_tree+0x2b/0xe0
> [  260.009620]  vfs_get_tree+0x30/0xe0
> [  260.011570]  do_new_mount+0x1d7/0x540
> [  260.013408]  path_mount+0x3c5/0xb50
> [  260.015176]  __se_sys_mount+0x298/0x2f0
> [  260.017073]  do_syscall_64+0x41/0x90
> [  260.018870]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> [  260.021262] RIP: 0033:0x7fc273f26eae
> [  260.023077] RSP: 002b:00007ffffebc6f38 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
> [  260.026419] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fc273f26eae
> [  260.029573] RDX: 00000000200124c0 RSI: 0000000020012500 RDI: 00007ffffebc6fb0
> [  260.032728] RBP: 00007ffffebc7100 R08: 00007ffffebc6ff0 R09: 0000000000000000
> [  260.035903] R10: 0000000000000000 R11: 0000000000000282 R12: 00007ffffebc7278
> [  260.039063] R13: 0000559922083246 R14: 0000559922097cb8 R15: 00007fc27413b040
> [  260.042241]  </TASK>
> [  260.043522] 1 lock held by a.out/4579:
> [  260.045379]  #0: ffff88812be0d0e0 (&type->s_umount_key#50/1){+.+.}-{3:3}, at: alloc_super+0x102/0x450
>
> It is difficult to reproduce lockdep warning because this is timing dependent.
> So far I was able to reproduce lockdep warning only once.
>
> [  111.928183] [ T4537] gfs2: fsid=loop0.0: can't make FS RW: -5
> [  111.931578] [   T88]
> [  111.937591] [   T88] ======================================================
> [  111.940620] [   T88] WARNING: possible circular locking dependency detected
> [  111.943553] [   T88] 6.2.0-rc1-next-20221226-00002-gc99a3711d8e3-dirty #28 Not tainted
> [  111.946879] [   T88] ------------------------------------------------------
> [  111.949832] [   T88] kworker/2:1H/88 is trying to acquire lock:
> [  111.952383] [   T88] ffff888128ff50e0 (&type->s_umount_key#51){+.+.}-{3:3}, at: freeze_super+0x29/0x1f0
> [  111.956324] [   T88]
> [  111.956324] [   T88] but task is already holding lock:
> [  111.959406] [   T88] ffffc90000bfbe58 ((work_completion)(&(&gl->gl_work)->work)){+.+.}-{0:0}, at: process_one_work+0x2d1/0x530
> [  111.964081] [   T88]
> [  111.964081] [   T88] which lock already depends on the new lock.
> [  111.964081] [   T88]
> [  111.968219] [   T88]
> [  111.968219] [   T88] the existing dependency chain (in reverse order) is:
> [  111.971959] [   T88]
> [  111.971959] [   T88] -> #2 ((work_completion)(&(&gl->gl_work)->work)){+.+.}-{0:0}:
> [  111.976006] [   T88]        process_one_work+0x2f3/0x530
> [  111.978307] [   T88]        worker_thread+0x357/0x630
> [  111.980510] [   T88]        kthread+0x133/0x170
> [  111.982518] [   T88]        ret_from_fork+0x1f/0x30
> [  111.984621] [   T88]
> [  111.984621] [   T88] -> #1 ((wq_completion)glock_workqueue){+.+.}-{0:0}:
> [  111.987992] [   T88]        __flush_workqueue+0x107/0x820
> [  111.990137] [   T88]        gfs2_gl_hash_clear+0x3d/0x1b0
> [  111.992431] [   T88]        gfs2_put_super+0x3a2/0x3f0
> [  111.994399] [   T88]        generic_shutdown_super+0x9a/0x1c0
> [  111.996554] [   T88]        kill_block_super+0x2d/0x70
> [  111.999015] [   T88]        deactivate_locked_super+0x5e/0xb0
> [  112.001467] [   T88]        cleanup_mnt+0x1c9/0x220
> [  112.003591] [   T88]        task_work_run+0xe4/0x130
> [  112.005749] [   T88]        exit_to_user_mode_loop+0x123/0x150
> [  112.008224] [   T88]        exit_to_user_mode_prepare+0xaa/0x130
> [  112.010765] [   T88]        syscall_exit_to_user_mode+0x32/0x70
> [  112.013457] [   T88]        do_syscall_64+0x4d/0x90
> [  112.015811] [   T88]        entry_SYSCALL_64_after_hwframe+0x46/0xb0
> [  112.018497] [   T88]
> [  112.018497] [   T88] -> #0 (&type->s_umount_key#51){+.+.}-{3:3}:
> [  112.021921] [   T88]        __lock_acquire+0x1712/0x33b0
> [  112.024223] [   T88]        lock_acquire+0xd3/0x200
> [  112.026342] [   T88]        down_write+0x3b/0xd0
> [  112.028384] [   T88]        freeze_super+0x29/0x1f0
> [  112.030503] [   T88]        freeze_go_sync+0xa6/0x1f0
> [  112.032651] [   T88]        do_xmote+0x1ae/0xa60
> [  112.034420] [   T88]        glock_work_func+0x19a/0x220
> [  112.036411] [   T88]        process_one_work+0x306/0x530
> [  112.038635] [   T88]        worker_thread+0x357/0x630
> [  112.040702] [   T88]        kthread+0x133/0x170
> [  112.042509] [   T88]        ret_from_fork+0x1f/0x30
> [  112.044388] [   T88]
> [  112.044388] [   T88] other info that might help us debug this:
> [  112.044388] [   T88]
> [  112.048102] [   T88] Chain exists of:
> [  112.048102] [   T88]   &type->s_umount_key#51 --> (wq_completion)glock_workqueue --> (work_completion)(&(&gl->gl_work)->work)
> [  112.048102] [   T88]
> [  112.054316] [   T88]  Possible unsafe locking scenario:
> [  112.054316] [   T88]
> [  112.057425] [   T88]        CPU0                    CPU1
> [  112.059722] [   T88]        ----                    ----
> [  112.062002] [   T88]   lock((work_completion)(&(&gl->gl_work)->work));
> [  112.064732] [   T88]                                lock((wq_completion)glock_workqueue);
> [  112.068131] [   T88]                                lock((work_completion)(&(&gl->gl_work)->work));
> [  112.071852] [   T88]   lock(&type->s_umount_key#51);
> [  112.074014] [   T88]
> [  112.074014] [   T88]  *** DEADLOCK ***
> [  112.074014] [   T88]
> [  112.077358] [   T88] 2 locks held by kworker/2:1H/88:
> [  112.079541] [   T88]  #0: ffff88812530f538 ((wq_completion)glock_workqueue){+.+.}-{0:0}, at: process_one_work+0x2a7/0x530
> [  112.083975] [   T88]  #1: ffffc90000bfbe58 ((work_completion)(&(&gl->gl_work)->work)){+.+.}-{0:0}, at: process_one_work+0x2d1/0x530
> [  112.088673] [   T88]
> [  112.088673] [   T88] stack backtrace:
> [  112.091159] [   T88] CPU: 2 PID: 88 Comm: kworker/2:1H Not tainted 6.2.0-rc1-next-20221226-00002-gc99a3711d8e3-dirty #28
> [  112.095547] [   T88] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
> [  112.099240] [   T88] Workqueue: glock_workqueue glock_work_func
> [  112.101745] [   T88] Call Trace:
> [  112.103257] [   T88]  <TASK>
> [  112.104640] [   T88]  dump_stack_lvl+0xfe/0x190
> [  112.106676] [   T88]  check_noncircular+0x12e/0x140
> [  112.112220] [   T88]  __lock_acquire+0x1712/0x33b0
> [  112.114390] [   T88]  ? __lock_acquire+0x65f/0x33b0
> [  112.116857] [   T88]  lock_acquire+0xd3/0x200
> [  112.118861] [   T88]  ? freeze_super+0x29/0x1f0
> [  112.124130] [   T88]  down_write+0x3b/0xd0
> [  112.127778] [   T88]  ? freeze_super+0x29/0x1f0
> [  112.129819] [   T88]  freeze_super+0x29/0x1f0
> [  112.134526] [   T88]  freeze_go_sync+0xa6/0x1f0
> [  112.136585] [   T88]  do_xmote+0x1ae/0xa60
> [  112.138651] [   T88]  glock_work_func+0x19a/0x220
> [  112.140970] [   T88]  process_one_work+0x306/0x530
> [  112.143112] [   T88]  worker_thread+0x357/0x630
> [  112.145129] [   T88]  kthread+0x133/0x170
> [  112.146954] [   T88]  ? rcu_lock_release+0x30/0x30
> [  112.149534] [   T88]  ? kthread_blkcg+0x60/0x60
> [  112.151495] [   T88]  ret_from_fork+0x1f/0x30
> [  112.153850] [   T88]  </TASK>
> [  256.043767] [   T59] INFO: task kworker/2:1H:88 blocked for more than 141 seconds.
> [  256.049591] [   T59]       Not tainted 6.2.0-rc1-next-20221226-00002-gc99a3711d8e3-dirty #28
> [  256.053325] [   T59] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  256.056783] [   T59] task:kworker/2:1H    state:D stack:12792 pid:88    ppid:2      flags:0x00004000
> [  256.060412] [   T59] Workqueue: glock_workqueue glock_work_func
> [  256.062783] [   T59] Call Trace:
> [  256.064008] [   T59]  <TASK>
> [  256.065150] [   T59]  __schedule+0x498/0x590
> [  256.066916] [   T59]  schedule+0x55/0x90
> [  256.068647] [   T59]  rwsem_down_write_slowpath+0x385/0x760
> [  256.072030] [   T59]  freeze_super+0x29/0x1f0
> [  256.073874] [   T59]  freeze_go_sync+0xa6/0x1f0
> [  256.075760] [   T59]  do_xmote+0x1ae/0xa60
> [  256.077500] [   T59]  glock_work_func+0x19a/0x220
> [  256.079462] [   T59]  process_one_work+0x306/0x530
> [  256.081727] [   T59]  worker_thread+0x357/0x630
> [  256.083619] [   T59]  kthread+0x133/0x170
> [  256.085371] [   T59]  ? rcu_lock_release+0x30/0x30
> [  256.087391] [   T59]  ? kthread_blkcg+0x60/0x60
> [  256.089277] [   T59]  ret_from_fork+0x1f/0x30
> [  256.093784] [   T59]  </TASK>
> [  256.095131] [   T59] INFO: task a.out:4537 blocked for more than 141 seconds.
> [  256.098069] [   T59]       Not tainted 6.2.0-rc1-next-20221226-00002-gc99a3711d8e3-dirty #28
> [  256.101464] [   T59] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [  256.104916] [   T59] task:a.out           state:D stack:12664 pid:4537  ppid:4531   flags:0x00004006
> [  256.108532] [   T59] Call Trace:
> [  256.109916] [   T59]  <TASK>
> [  256.111161] [   T59]  __schedule+0x498/0x590
> [  256.112959] [   T59]  schedule+0x55/0x90
> [  256.114589] [   T59]  schedule_timeout+0x9e/0x1d0
> [  256.116519] [   T59]  do_wait_for_common+0xff/0x180
> [  256.118515] [   T59]  ? console_conditional_schedule+0x40/0x40
> [  256.120860] [   T59]  wait_for_completion+0x4a/0x60
> [  256.122860] [   T59]  __flush_workqueue+0x360/0x820
> [  256.124855] [   T59]  gfs2_gl_hash_clear+0x58/0x1b0
> [  256.126868] [   T59]  ? _raw_spin_unlock_irqrestore+0x43/0xb0
> [  256.129180] [   T59]  ? lockdep_hardirqs_on+0x99/0x140
> [  256.131264] [   T59]  gfs2_fill_super+0xe24/0x1110
> [  256.133222] [   T59]  ? gfs2_reconfigure+0x4d0/0x4d0
> [  256.135239] [   T59]  get_tree_bdev+0x228/0x2f0
> [  256.137296] [   T59]  gfs2_get_tree+0x2b/0xe0
> [  256.139122] [   T59]  vfs_get_tree+0x30/0xe0
> [  256.140879] [   T59]  do_new_mount+0x1d7/0x540
> [  256.142707] [   T59]  path_mount+0x3c5/0xb50
> [  256.144461] [   T59]  __se_sys_mount+0x298/0x2f0
> [  256.146345] [   T59]  do_syscall_64+0x41/0x90
> [  256.148148] [   T59]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> [  256.150484] [   T59] RIP: 0033:0x7faf87b26eae
> [  256.152285] [   T59] RSP: 002b:00007ffdb0d40f68 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
> [  256.155594] [   T59] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007faf87b26eae
> [  256.160847] [   T59] RDX: 00000000200124c0 RSI: 0000000020012500 RDI: 00007ffdb0d40fe0
> [  256.164184] [   T59] RBP: 00007ffdb0d41130 R08: 00007ffdb0d41020 R09: 0000000000000000
> [  256.167404] [   T59] R10: 0000000000000000 R11: 0000000000000282 R12: 00007ffdb0d412a8
> [  256.170913] [   T59] R13: 00005574b9254246 R14: 00005574b9268cb8 R15: 00007faf87da3040
> [  256.174771] [   T59]  </TASK>
> [  256.176029] [   T59] INFO: lockdep is turned off.
> [  256.178522] [   T59] NMI backtrace for cpu 7
> [  256.180317] [   T59] CPU: 7 PID: 59 Comm: khungtaskd Not tainted 6.2.0-rc1-next-20221226-00002-gc99a3711d8e3-dirty #28
> [  256.184614] [   T59] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
> [  256.188220] [   T59] Call Trace:
> [  256.189626] [   T59]  <TASK>
> [  256.190893] [   T59]  dump_stack_lvl+0xfe/0x190
> [  256.194767] [   T59]  nmi_cpu_backtrace+0x25d/0x2c0
> [  256.196804] [   T59]  ? arch_trigger_cpumask_backtrace+0x10/0x10
> [  256.199337] [   T59]  nmi_trigger_cpumask_backtrace+0x11f/0x250
> [  256.202150] [   T59]  watchdog+0x8a5/0x8e0
> [  256.203918] [   T59]  kthread+0x133/0x170
> [  256.205681] [   T59]  ? hungtask_pm_notify+0x90/0x90
> [  256.207783] [   T59]  ? kthread_blkcg+0x60/0x60
> [  256.209689] [   T59]  ret_from_fork+0x1f/0x30
> [  256.211690] [   T59]  </TASK>
> [  256.213052] [   T59] Sending NMI from CPU 7 to CPUs 0-6:
> [  256.215232] [    C4] NMI backtrace for cpu 4 skipped: idling at default_idle+0x13/0x20
> [  256.218391] [    C6] NMI backtrace for cpu 6 skipped: idling at default_idle+0x13/0x20
> [  256.218378] [    C4] INFO: NMI handler (nmi_cpu_backtrace_handler) took too long to run: 3.145 msecs
> [  256.218378] [    C2] NMI backtrace for cpu 2 skipped: idling at default_idle+0x13/0x20
> [  256.218766] [    C0] NMI backtrace for cpu 0 skipped: idling at default_idle+0x13/0x20
> [  256.218889] [    C1] NMI backtrace for cpu 1 skipped: idling at default_idle+0x13/0x20
> [  256.219085] [    C5] NMI backtrace for cpu 5 skipped: idling at default_idle+0x13/0x20
> [  256.219230] [    C3] NMI backtrace for cpu 3 skipped: idling at default_idle+0x13/0x20
>
> I suspect that cleanup is not done appropriately when gfs2_find_jhead() failed.
> Looking into gfs2_make_fs_rw(), I see there are two worrisome things.
>
> One is that gfs2_make_fs_rw() returns an error without calling gfs2_consist(sdp) when
> gfs2_find_jhead() returned an error whereas gfs2_make_fs_rw() returns -EIO after calling
> gfs2_consist(sdp) when head.lh_flags does not contain GFS2_LOG_HEAD_UNMOUNT flag.
>
> Since head.lh_flags is assigned by gfs2_find_jhead(), we might want to call gfs2_consist(sdp)
> when gfs2_find_jhead() returned an error. And actually
>
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -138,7 +138,11 @@ int gfs2_make_fs_rw(struct gfs2_sbd *sdp)
>                 return -EIO;
>
>         error = gfs2_find_jhead(sdp->sd_jdesc, &head, false);
> -       if (error || gfs2_withdrawn(sdp))
> +       if (error) {
> +               gfs2_consist(sdp);
> +               return error;
> +       }
> +       if (gfs2_withdrawn(sdp))
>                 return error;
>
>         if (!(head.lh_flags & GFS2_LOG_HEAD_UNMOUNT)) {
>
> avoids this deadlock. But I don't know when/how to use gfs2_withdraw().
> Please check if this change is appropriate.

This looks fine, except that I don't think the gfs2_withdrawn() is
needed here. I'll post a fix.

> The other worrisome thing is that gfs2_make_fs_rw() is returning 0 (and
> mount operation will continue) when gfs2_withdrawn() == true. Can the caller
> of gfs2_make_fs_rw() survive when call gfs2_make_fs_rw() returned 0 without
> processing gfs2_withdrawn
>
>         /*  Initialize some head of the log stuff  */
>         sdp->sd_log_sequence = head.lh_sequence + 1;
>         gfs2_log_pointers_init(sdp, head.lh_blkno);
>
> lines? Shouldn't the caller of gfs2_make_fs_rw() observe an error when
> gfs2_make_fs_rw() did not execute the
>
>         set_bit(SDF_JOURNAL_LIVE, &sdp->sd_flags);
>
> line due to gfs2_withdrawn() == true?

I agree that gfs2_make_fs_rw() shouldn't report success when it didn't
in fact succeed. I'll fix that as well.

Thanks,
Andreas

