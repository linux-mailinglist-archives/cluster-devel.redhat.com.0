Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6D12F3D5AED
	for <lists+cluster-devel@lfdr.de>; Mon, 26 Jul 2021 16:02:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-r1IubgFvMQKyxMkpPT2IKA-1; Mon, 26 Jul 2021 10:02:34 -0400
X-MC-Unique: r1IubgFvMQKyxMkpPT2IKA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33E858030D7;
	Mon, 26 Jul 2021 14:02:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E9AA6E6E9;
	Mon, 26 Jul 2021 14:02:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E459B180BAB0;
	Mon, 26 Jul 2021 14:02:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16QE1EuK000623 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 26 Jul 2021 10:01:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6BA791004029; Mon, 26 Jul 2021 14:01:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65AE91111A45
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 14:01:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41E9389C7DE
	for <cluster-devel@redhat.com>; Mon, 26 Jul 2021 14:01:08 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-12-hDWogrFPP8Su79yleqOLHw-1;
	Mon, 26 Jul 2021 10:01:01 -0400
X-MC-Unique: hDWogrFPP8Su79yleqOLHw-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id B008867373; Mon, 26 Jul 2021 16:00:58 +0200 (CEST)
Date: Mon, 26 Jul 2021 16:00:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bob Peterson <rpeterso@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20210726140058.GA9206@lst.de>
MIME-Version: 1.0
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] gfs2 hang in xfstests generic/361
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I noticed this hang while testing the iomap_iter series on gfs2,
but it also reproduces on 5.14-rc3.  This is running locally with
"-O -p lock_nolock":

generic/361 files ... [ 1479.222703] run fstests generic/361 at 2021-07-26 13:57:10
[ 1481.188746] gfs2: fsid=vdc: Trying to join cluster "lock_nolock", "vdc"
[ 1481.190270] gfs2: fsid=vdc: Now mounting FS (format 1801)...
[ 1481.199160] gfs2: fsid=vdc.0: journal 0 mapped with 1 extents in 0ms
[ 1481.202347] gfs2: fsid=vdc.0: jid=0, already locked for use
[ 1481.203368] gfs2: fsid=vdc.0: jid=0: Looking at journal...
[ 1481.269554] gfs2: fsid=vdc.0: jid=0: Journal head lookup took 66ms
[ 1481.270730] gfs2: fsid=vdc.0: jid=0: Done
[ 1481.271802] gfs2: fsid=vdc.0: first mount done, others may mount
[ 1481.371768] loop0: detected capacity change from 0 to 2097152
[ 1482.799919] gfs2: fsid=loop0: Trying to join cluster "lock_nolock", "loop0"
[ 1482.803425] gfs2: fsid=loop0: Now mounting FS (format 1801)...
[ 1482.815215] gfs2: fsid=loop0.0: journal 0 mapped with 1 extents in 0ms
[ 1482.819376] gfs2: fsid=loop0.0: jid=0, already locked for use
[ 1482.822181] gfs2: fsid=loop0.0: jid=0: Looking at journal...
[ 1483.005770] gfs2: fsid=loop0.0: jid=0: Journal head lookup took 183ms
[ 1483.007077] gfs2: fsid=loop0.0: jid=0: Done
[ 1483.007898] gfs2: fsid=loop0.0: first mount done, others may mount
[ 1491.612990] loop: Write error at byte offset 468144128, length 4096.
[ 1491.615612] blk_update_request: I/O error, dev loop0, sector 913152 op 0x1:(WRITE) fl0
[ 1491.617029] loop: Write error at byte offset 468844544, length 4096.
[ 1491.623654] blk_update_request: I/O error, dev loop0, sector 915712 op 0x1:(WRITE) fl0
[ 1491.625416] loop: Write error at byte offset 469622784, length 4096.
[ 1491.630162] loop0: writeback error on inode 16708, offset 398209024, sector 917224
[ 1491.631682] blk_update_request: I/O error, dev loop0, sector 917232 op 0x1:(WRITE) fl0
[ 1491.633448] loop: Write error at byte offset 470933504, length 4096.
[ 1491.641790] blk_update_request: I/O error, dev loop0, sector 919792 op 0x1:(WRITE) fl0
[ 1491.642736] loop: Write error at byte offset 471711744, length 4096.
[ 1491.647210] loop0: writeback error on inode 16708, offset 400293888, sector 921304
[ 1491.648540] blk_update_request: I/O error, dev loop0, sector 921312 op 0x1:(WRITE) fl0
[ 1491.649673] loop: Write error at byte offset 473022464, length 4096.
[ 1491.655308] blk_update_request: I/O error, dev loop0, sector 923872 op 0x1:(WRITE) fl0
[ 1491.656176] loop: Write error at byte offset 473800704, length 4096.
[ 1491.658274] loop0: writeback error on inode 16708, offset 402378752, sector 925384
[ 1491.659257] blk_update_request: I/O error, dev loop0, sector 925392 op 0x1:(WRITE) fl0
[ 1491.660052] loop: Write error at byte offset 475111424, length 4096.
[ 1491.663825] blk_update_request: I/O error, dev loop0, sector 927952 op 0x1:(WRITE) fl0
[ 1491.663872] loop: Write error at byte offset 475889664, length 4096.
[ 1491.666004] loop0: writeback error on inode 16708, offset 404463616, sector 929464
[ 1491.666880] blk_update_request: I/O error, dev loop0, sector 929472 op 0x1:(WRITE) fl0
[ 1491.667670] loop: Write error at byte offset 477200384, length 4096.
[ 1491.671450] blk_update_request: I/O error, dev loop0, sector 932032 op 0x1:(WRITE) fl0
[ 1491.674066] loop0: writeback error on inode 16708, offset 406548480, sector 933544
[ 1491.674488] loop0: writeback error on inode 16708, offset 408633344, sector 937624
[ 1491.676163] loop0: writeback error on inode 16708, offset 410718208, sector 941704
[ 1491.678042] loop0: writeback error on inode 16708, offset 412803072, sector 945784
[ 1491.679677] loop0: writeback error on inode 16708, offset 414887936, sector 949864
[ 1491.681342] loop0: writeback error on inode 16708, offset 416972800, sector 953944
[ 1491.713431] Buffer I/O error on dev loop0, logical block 17192, lost async page write
[ 1491.716453] Buffer I/O error on dev loop0, logical block 17219, lost async page write
[ 1491.717967] Buffer I/O error on dev loop0, logical block 17729, lost async page write
[ 1491.719021] Buffer I/O error on dev loop0, logical block 77399, lost async page write
[ 1491.719333] Buffer I/O error on dev loop0, logical block 18239, lost async page write
[ 1491.720966] Buffer I/O error on dev loop0, logical block 77933, lost async page write
[ 1491.722209] Buffer I/O error on dev loop0, logical block 18749, lost async page write
[ 1491.723602] Buffer I/O error on dev loop0, logical block 78443, lost async page write
[ 1491.724989] Buffer I/O error on dev loop0, logical block 19259, lost async page write
[ 1491.726488] Buffer I/O error on dev loop0, logical block 78953, lost async page write
[ 1491.744459] gfs2: fsid=loop0.0: fatal: I/O error
[ 1491.744459]   block = 17192
[ 1491.744459]   function = gfs2_ail1_empty_one, file = fs/gfs2/log.c, line = 323
[ 1491.747491] gfs2: fsid=loop0.0: fatal: I/O error(s)
[ 1491.748477] gfs2: fsid=loop0.0: about to withdraw this file system
[ 1491.752284] 
[ 1491.752587] =============================
[ 1491.753403] [ BUG: Invalid wait context ]
[ 1491.754122] 5.14.0-rc2+ #47 Not tainted
[ 1491.754860] -----------------------------
[ 1491.755563] kworker/2:1H/1975 is trying to lock:
[ 1491.756370] ffff8881048d0888 (&wq->mutex){+.+.}-{3:3}, at: flush_workqueue+0xc9/0x5f0
[ 1491.757736] other info that might help us debug this:
[ 1491.758622] context-{4:4}
[ 1491.759087] 4 locks held by kworker/2:1H/1975:
[ 1491.759863]  #0: ffff888101717b38 ((wq_completion)glock_workqueue){+.+.}-{0:0}, at: p0
[ 1491.761623]  #1: ffffc900040dfe78
((work_completion)(&(&gl->gl_work)->work)){+.+.}-{00
[ 1491.763528]  #2: ffff88811ce6b000 (&sdp->sd_log_flush_lock){++++}-{3:3}, at: gfs2_log0
[ 1491.765284]  #3: ffff88811ce6ae28 (&sdp->sd_log_lock){+.+.}-{2:2}, at: gfs2_flush_rev0
[ 1491.767064] stack backtrace:
[ 1491.767629] CPU: 2 PID: 1975 Comm: kworker/2:1H Not tainted 5.14.0-rc2+ #47
[ 1491.769000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/04
[ 1491.770641] Workqueue: glock_workqueue glock_work_func
[ 1491.771635] Call Trace:
[ 1491.772101]  dump_stack_lvl+0x45/0x59
[ 1491.772777]  __lock_acquire.cold+0x2a2/0x2be
[ 1491.773529]  ? save_trace+0x3e/0x380
[ 1491.774160]  lock_acquire+0xc9/0x2f0
[ 1491.774815]  ? flush_workqueue+0xc9/0x5f0
[ 1491.775521]  __mutex_lock+0x75/0x870
[ 1491.776151]  ? flush_workqueue+0xc9/0x5f0
[ 1491.776856]  ? flush_workqueue+0xc9/0x5f0
[ 1491.777560]  ? lock_release+0x13c/0x2e0
[ 1491.778234]  flush_workqueue+0xc9/0x5f0
[ 1491.779012]  gfs2_make_fs_ro+0x2b/0x2b0
[ 1491.779687]  gfs2_withdraw.cold+0x16f/0x4bd
[ 1491.780424]  ? gfs2_freeze_lock+0x24/0x60
[ 1491.781129]  gfs2_ail1_empty+0x305/0x310
[ 1491.781821]  gfs2_flush_revokes+0x29/0x40
[ 1491.782526]  revoke_lo_before_commit+0x12/0x1c0
[ 1491.783324]  gfs2_log_flush+0x337/0xb00
[ 1491.784001]  inode_go_sync+0x8e/0x200
[ 1491.784663]  do_xmote+0xd2/0x380
[ 1491.785268]  glock_work_func+0x57/0x130
[ 1491.785944]  process_one_work+0x237/0x560
[ 1491.786660]  worker_thread+0x4d/0x3b0
[ 1491.787307]  ? process_one_work+0x560/0x560
[ 1491.788042]  kthread+0x13f/0x170
[ 1491.788617]  ? set_kthread_struct+0x40/0x40
[ 1491.789352]  ret_from_fork+0x22/0x30
[ 1491.790084] BUG: scheduling while atomic: kworker/2:1H/1975/0x00000002
[ 1491.791316] INFO: lockdep is turned off.
[ 1491.792119] Modules linked in:
[ 1491.792734] Preemption disabled at:
[ 1491.792735] [<0000000000000000>] 0x0
[ 1491.793971] CPU: 2 PID: 1975 Comm: kworker/2:1H Not tainted 5.14.0-rc2+ #47
[ 1491.795160] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/04
[ 1491.796618] Workqueue: glock_workqueue glock_work_func
[ 1491.797531] Call Trace:
[ 1491.797968]  dump_stack_lvl+0x45/0x59
[ 1491.798621]  __schedule_bug.cold+0x9c/0xad
[ 1491.799340]  __schedule+0x8e2/0xbb0
[ 1491.799956]  ? lock_release+0x201/0x2e0
[ 1491.800633]  schedule+0x48/0xf0
[ 1491.801241]  schedule_timeout+0xaf/0x140
[ 1491.802045]  ? trace_hardirqs_on+0x1b/0xe0
[ 1491.802840]  ? destroy_timer_on_stack+0x10/0x10
[ 1491.803658]  gfs2_make_fs_ro+0x249/0x2b0
[ 1491.804417]  ? do_wait_intr_irq+0xa0/0xa0
[ 1491.805141]  gfs2_withdraw.cold+0x16f/0x4bd
[ 1491.805885]  ? gfs2_freeze_lock+0x24/0x60
[ 1491.806685]  gfs2_ail1_empty+0x305/0x310
[ 1491.807495]  gfs2_flush_revokes+0x29/0x40
[ 1491.808281]  revoke_lo_before_commit+0x12/0x1c0
[ 1491.809198]  gfs2_log_flush+0x337/0xb00
[ 1491.809976]  inode_go_sync+0x8e/0x200
[ 1491.810716]  do_xmote+0xd2/0x380
[ 1491.811357]  glock_work_func+0x57/0x130
[ 1491.812116]  process_one_work+0x237/0x560
[ 1491.812882]  worker_thread+0x4d/0x3b0
[ 1491.813612]  ? process_one_work+0x560/0x560
[ 1491.814342]  kthread+0x13f/0x170
[ 1491.814918]  ? set_kthread_struct+0x40/0x40
[ 1491.815647]  ret_from_fork+0x22/0x30

[ 1496.964925] gfs2: fsid=loop0.0: Journal recovery skipped for 0 until next mount.
[ 1496.970088] gfs2: fsid=loop0.0: Glock dequeues delayed: 0
[ 1496.971948] gfs2: fsid=loop0.0: File system withdrawn
[ 1496.973558] CPU: 2 PID: 1975 Comm: kworker/2:1H Tainted: G        W 5.14.0-rc7
[ 1496.976692] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/04
[ 1496.979972] Workqueue: glock_workqueue glock_work_func
[ 1496.981980] Call Trace:
[ 1496.983015]  dump_stack_lvl+0x45/0x59
[ 1496.984674]  gfs2_withdraw.cold+0xd3/0x4bd
[ 1496.986840]  gfs2_ail1_empty+0x305/0x310
[ 1496.988888]  gfs2_flush_revokes+0x29/0x40
[ 1496.990914]  revoke_lo_before_commit+0x12/0x1c0
[ 1496.992965]  gfs2_log_flush+0x337/0xb00
[ 1496.995501]  inode_go_sync+0x8e/0x200
[ 1496.998030]  do_xmote+0xd2/0x380
[ 1496.999681]  glock_work_func+0x57/0x130
[ 1497.001480]  process_one_work+0x237/0x560
[ 1497.003512]  worker_thread+0x4d/0x3b0
[ 1497.005249]  ? process_one_work+0x560/0x560
[ 1497.007208]  kthread+0x13f/0x170
[ 1497.008761]  ? set_kthread_struct+0x40/0x40
[ 1497.010758]  ret_from_fork+0x22/0x30
[ 1502.086199] gfs2: fsid=loop0.0: warning: assertion "gfs2_log_is_empty(sdp)" failed at6
[ 1502.093118] CPU: 1 PID: 31026 Comm: mount Tainted: G        W 5.14.0-rc2+ #47
[ 1502.096754] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/04
[ 1502.100580] Call Trace:
[ 1502.101744]  dump_stack_lvl+0x45/0x59
[ 1502.103470]  gfs2_assert_warn_i.cold+0x2e/0x77
[ 1502.105537]  gfs2_make_fs_ro+0x2a3/0x2b0
[ 1502.107381]  ? do_wait_intr_irq+0xa0/0xa0
[ 1502.109256]  gfs2_reconfigure+0x290/0x3c0
[ 1502.111144]  ? gfs2_freeze_lock+0x24/0x60
[ 1502.113008]  reconfigure_super+0x9f/0x220
[ 1502.114909]  path_mount+0x96a/0xb40
[ 1502.116549]  __x64_sys_mount+0xfe/0x140
[ 1502.118358]  do_syscall_64+0x3b/0x90
[ 1502.120101]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[ 1502.122652] RIP: 0033:0x7f591889dfea
[ 1502.124426] Code: 48 8b 0d a9 0e 0c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 08
[ 1502.133077] RSP: 002b:00007ffde8ccc818 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
[ 1502.136618] RAX: ffffffffffffffda RBX: 000055d76690c970 RCX: 00007f591889dfea
[ 1502.139919] RDX: 000055d76690cb80 RSI: 000055d766910280 RDI: 000055d7669133d0
[ 1502.143309] RBP: 00007f5918beb1c4 R08: 000055d76690cba0 R09: 00007f5918960130
[ 1502.146999] R10: 0000000000200021 R11: 0000000000000246 R12: 0000000000000000
[ 1502.151191] R13: 0000000000200021 R14: 000055d7669133d0 R15: 000055d76690cb80



