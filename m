Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4264B8CD0
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Feb 2022 16:46:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645026371;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=v7ZKxwFoNH/SJ4J8yFJK+e5gpHBgW4J7jQrPrISn/cE=;
	b=OIxLxYAaXc5SUEP/itHcxf8Rleuk5Um0kTNryExJtdTerUsVOHQiwiuluAN7ngbmPOlcD/
	A4+vxoUaGzx/zB8Z22aXI5slFuZMbqgF9cLHgBrE71QIL8hTIkFNuXzpq/uCOKHXiqeVzS
	ELqhWoW5lt4u7PTiDRIK+EtOOR3Dh84=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-DYz6MeMNPha-c9Bp94WRHw-1; Wed, 16 Feb 2022 10:46:09 -0500
X-MC-Unique: DYz6MeMNPha-c9Bp94WRHw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88A4C1054F9A;
	Wed, 16 Feb 2022 15:46:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6535B2BCDB;
	Wed, 16 Feb 2022 15:46:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 722CA18095C9;
	Wed, 16 Feb 2022 15:46:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21GFjvkT022497 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 10:45:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B889E7D725; Wed, 16 Feb 2022 15:45:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49B147D729;
	Wed, 16 Feb 2022 15:45:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 16 Feb 2022 10:45:51 -0500
Message-Id: <20220216154551.2993470-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Subject: [Cluster-devel] [PATCH dlm/next] fs: dlm: fix plock invalid read
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch fixes an invalid read showed by KASAN. A unlock will allocate a
"struct plock_op" and a followed send_op() will append it to a global
send_list data structure. In some cases a followed dev_read() moves it
to recv_list and dev_write() will cast it to "struct plock_xop" and access
fields which are only available in those structures. At this point an
invalid read happens by accessing those fields.

To fix this issue the "callback" field is moved to "struct plock_op" to
indicate that a cast to "plock_xop" is allowed and does the additional
"plock_xop" handling if set.

Example of the KASAN output which showed the invalid read:

[ 2064.296453] ==================================================================
[ 2064.304852] BUG: KASAN: slab-out-of-bounds in dev_write+0x52b/0x5a0 [dlm]
[ 2064.306491] Read of size 8 at addr ffff88800ef227d8 by task dlm_controld/7484
[ 2064.308168]
[ 2064.308575] CPU: 0 PID: 7484 Comm: dlm_controld Kdump: loaded Not tainted 5.14.0+ #9
[ 2064.310292] Hardware name: Red Hat KVM, BIOS 0.5.1 01/01/2011
[ 2064.311618] Call Trace:
[ 2064.312218]  dump_stack_lvl+0x56/0x7b
[ 2064.313150]  print_address_description.constprop.8+0x21/0x150
[ 2064.314578]  ? dev_write+0x52b/0x5a0 [dlm]
[ 2064.315610]  ? dev_write+0x52b/0x5a0 [dlm]
[ 2064.316595]  kasan_report.cold.14+0x7f/0x11b
[ 2064.317674]  ? dev_write+0x52b/0x5a0 [dlm]
[ 2064.318687]  dev_write+0x52b/0x5a0 [dlm]
[ 2064.319629]  ? dev_read+0x4a0/0x4a0 [dlm]
[ 2064.320713]  ? bpf_lsm_kernfs_init_security+0x10/0x10
[ 2064.321926]  vfs_write+0x17e/0x930
[ 2064.322769]  ? __fget_light+0x1aa/0x220
[ 2064.323753]  ksys_write+0xf1/0x1c0
[ 2064.324548]  ? __ia32_sys_read+0xb0/0xb0
[ 2064.325464]  do_syscall_64+0x3a/0x80
[ 2064.326387]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[ 2064.327606] RIP: 0033:0x7f807e4ba96f
[ 2064.328470] Code: 89 54 24 18 48 89 74 24 10 89 7c 24 08 e8 39 87 f8 ff 48 8b 54 24 18 48 8b 74 24 10 41 89 c0 8b 7c 24 08 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 31 44 89 c7 48 89 44 24 08 e8 7c 87 f8 ff 48
[ 2064.332902] RSP: 002b:00007ffd50cfe6e0 EFLAGS: 00000293 ORIG_RAX: 0000000000000001
[ 2064.334658] RAX: ffffffffffffffda RBX: 000055cc3886eb30 RCX: 00007f807e4ba96f
[ 2064.336275] RDX: 0000000000000040 RSI: 00007ffd50cfe7e0 RDI: 0000000000000010
[ 2064.337980] RBP: 00007ffd50cfe7e0 R08: 0000000000000000 R09: 0000000000000001
[ 2064.339560] R10: 000055cc3886eb30 R11: 0000000000000293 R12: 000055cc3886eb80
[ 2064.341237] R13: 000055cc3886eb00 R14: 000055cc3886f590 R15: 0000000000000001
[ 2064.342857]
[ 2064.343226] Allocated by task 12438:
[ 2064.344057]  kasan_save_stack+0x1c/0x40
[ 2064.345079]  __kasan_kmalloc+0x84/0xa0
[ 2064.345933]  kmem_cache_alloc_trace+0x13b/0x220
[ 2064.346953]  dlm_posix_unlock+0xec/0x720 [dlm]
[ 2064.348811]  do_lock_file_wait.part.32+0xca/0x1d0
[ 2064.351070]  fcntl_setlk+0x281/0xbc0
[ 2064.352879]  do_fcntl+0x5e4/0xfe0
[ 2064.354657]  __x64_sys_fcntl+0x11f/0x170
[ 2064.356550]  do_syscall_64+0x3a/0x80
[ 2064.358259]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[ 2064.360745]
[ 2064.361511] Last potentially related work creation:
[ 2064.363957]  kasan_save_stack+0x1c/0x40
[ 2064.365811]  __kasan_record_aux_stack+0xaf/0xc0
[ 2064.368100]  call_rcu+0x11b/0xf70
[ 2064.369785]  dlm_process_incoming_buffer+0x47d/0xfd0 [dlm]
[ 2064.372404]  receive_from_sock+0x290/0x770 [dlm]
[ 2064.374607]  process_recv_sockets+0x32/0x40 [dlm]
[ 2064.377290]  process_one_work+0x9a8/0x16e0
[ 2064.379357]  worker_thread+0x87/0xbf0
[ 2064.381188]  kthread+0x3ac/0x490
[ 2064.383460]  ret_from_fork+0x22/0x30
[ 2064.385588]
[ 2064.386518] Second to last potentially related work creation:
[ 2064.389219]  kasan_save_stack+0x1c/0x40
[ 2064.391043]  __kasan_record_aux_stack+0xaf/0xc0
[ 2064.393303]  call_rcu+0x11b/0xf70
[ 2064.394885]  dlm_process_incoming_buffer+0x47d/0xfd0 [dlm]
[ 2064.397694]  receive_from_sock+0x290/0x770 [dlm]
[ 2064.399932]  process_recv_sockets+0x32/0x40 [dlm]
[ 2064.402180]  process_one_work+0x9a8/0x16e0
[ 2064.404388]  worker_thread+0x87/0xbf0
[ 2064.406124]  kthread+0x3ac/0x490
[ 2064.408021]  ret_from_fork+0x22/0x30
[ 2064.409834]
[ 2064.410599] The buggy address belongs to the object at ffff88800ef22780
[ 2064.410599]  which belongs to the cache kmalloc-96 of size 96
[ 2064.416495] The buggy address is located 88 bytes inside of
[ 2064.416495]  96-byte region [ffff88800ef22780, ffff88800ef227e0)
[ 2064.422045] The buggy address belongs to the page:
[ 2064.424635] page:00000000b6bef8bc refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xef22
[ 2064.428970] flags: 0xfffffc0000200(slab|node=0|zone=1|lastcpupid=0x1fffff)
[ 2064.432515] raw: 000fffffc0000200 ffffea0000d68b80 0000001400000014 ffff888001041780
[ 2064.436110] raw: 0000000000000000 0000000080200020 00000001ffffffff 0000000000000000
[ 2064.439813] page dumped because: kasan: bad access detected
[ 2064.442548]
[ 2064.443310] Memory state around the buggy address:
[ 2064.445988]  ffff88800ef22680: 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc
[ 2064.449444]  ffff88800ef22700: 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc
[ 2064.452941] >ffff88800ef22780: 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc
[ 2064.456383]                                                     ^
[ 2064.459386]  ffff88800ef22800: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
[ 2064.462788]  ffff88800ef22880: 00 00 00 00 00 00 00 00 00 00 00 00 fc fc fc fc
[ 2064.466239] ==================================================================

reproducer in python:

import argparse
import struct
import fcntl
import os

parser = argparse.ArgumentParser()

parser.add_argument('-f', '--file',
		    help='file to use fcntl, must be on dlm lock filesystem e.g. gfs2')

args = parser.parse_args()

f = open(args.file, 'wb+')

lockdata = struct.pack('hhllhh', fcntl.F_WRLCK,0,0,0,0,0)
fcntl.fcntl(f, fcntl.F_SETLK, lockdata)
lockdata = struct.pack('hhllhh', fcntl.F_UNLCK,0,0,0,0,0)
fcntl.fcntl(f, fcntl.F_SETLK, lockdata)

Fixes: 586759f03e2e ("gfs2: nfs lock support for gfs2")
Cc: stable@vger.kernel.org
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/plock.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/plock.c b/fs/dlm/plock.c
index c38b2b8ffd1d..a10d2bcfe75a 100644
--- a/fs/dlm/plock.c
+++ b/fs/dlm/plock.c
@@ -23,11 +23,11 @@ struct plock_op {
 	struct list_head list;
 	int done;
 	struct dlm_plock_info info;
+	int (*callback)(struct file_lock *fl, int result);
 };
 
 struct plock_xop {
 	struct plock_op xop;
-	int (*callback)(struct file_lock *fl, int result);
 	void *fl;
 	void *file;
 	struct file_lock flc;
@@ -129,19 +129,18 @@ int dlm_posix_lock(dlm_lockspace_t *lockspace, u64 number, struct file *file,
 		/* fl_owner is lockd which doesn't distinguish
 		   processes on the nfs client */
 		op->info.owner	= (__u64) fl->fl_pid;
-		xop->callback	= fl->fl_lmops->lm_grant;
+		op->callback	= fl->fl_lmops->lm_grant;
 		locks_init_lock(&xop->flc);
 		locks_copy_lock(&xop->flc, fl);
 		xop->fl		= fl;
 		xop->file	= file;
 	} else {
 		op->info.owner	= (__u64)(long) fl->fl_owner;
-		xop->callback	= NULL;
 	}
 
 	send_op(op);
 
-	if (xop->callback == NULL) {
+	if (!op->callback) {
 		rv = wait_event_interruptible(recv_wq, (op->done != 0));
 		if (rv == -ERESTARTSYS) {
 			log_debug(ls, "dlm_posix_lock: wait killed %llx",
@@ -203,7 +202,7 @@ static int dlm_plock_callback(struct plock_op *op)
 	file = xop->file;
 	flc = &xop->flc;
 	fl = xop->fl;
-	notify = xop->callback;
+	notify = op->callback;
 
 	if (op->info.rv) {
 		notify(fl, op->info.rv);
@@ -436,10 +435,9 @@ static ssize_t dev_write(struct file *file, const char __user *u, size_t count,
 		if (op->info.fsid == info.fsid &&
 		    op->info.number == info.number &&
 		    op->info.owner == info.owner) {
-			struct plock_xop *xop = (struct plock_xop *)op;
 			list_del_init(&op->list);
 			memcpy(&op->info, &info, sizeof(info));
-			if (xop->callback)
+			if (op->callback)
 				do_callback = 1;
 			else
 				op->done = 1;
-- 
2.31.1

