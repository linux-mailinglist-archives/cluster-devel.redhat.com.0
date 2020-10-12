Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4D09528B621
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Oct 2020 15:26:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-k-vhJWmIPiCFzDND4-Geww-1; Mon, 12 Oct 2020 09:26:11 -0400
X-MC-Unique: k-vhJWmIPiCFzDND4-Geww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D65CA18C5208;
	Mon, 12 Oct 2020 13:26:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C2331002C01;
	Mon, 12 Oct 2020 13:26:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F08B5181A06C;
	Mon, 12 Oct 2020 13:26:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CDASsE032263 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 09:10:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 982DC114B9A7; Mon, 12 Oct 2020 13:10:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9016E114B9C7
	for <cluster-devel@redhat.com>; Mon, 12 Oct 2020 13:10:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FF318007DF
	for <cluster-devel@redhat.com>; Mon, 12 Oct 2020 13:10:25 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
	[209.85.166.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-580-oP6pr-hHMyG4Dmu_ejqw7Q-1; Mon, 12 Oct 2020 09:10:22 -0400
X-MC-Unique: oP6pr-hHMyG4Dmu_ejqw7Q-1
Received: by mail-io1-f69.google.com with SMTP id y70so10527910iof.1
	for <cluster-devel@redhat.com>; Mon, 12 Oct 2020 06:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=ty+a1LZxl17gReBYzjTIEx2+QFoT3DIs5fUkSnxzBxs=;
	b=r07/SNE14Y0kOIaKCucEOBvjPU4eKD2CWKFryzMn7YxzPUCsBtD8o6n4lUoAVrns1y
	rjKxLmFah0sajNyN9i7w6HrGQfUGX8SPhVlpt7s447QdcMKOLcXFM03SlVlpWgkrULJh
	enlVkx5pECTzR3Jg1QyM23djFGVhKS5yNt1WRdYP9c+xjZu6zQ18gWDsowumoVcMWOJL
	JhU2SXdW7/Cof+Ku2gnuWjI+0h5uFoUfUnfia0XLQHJHMcOb3DSUCVFSW9Q83jIuv//W
	A2ygaNA3numj2GApn7hIHyamLtOyrjgpSCluS+SJb6+T5d1h/uP/9Yp6+wb9XL4uiVny
	m2ow==
X-Gm-Message-State: AOAM533G58vKzJR64/1pq8m9PnKpdXnW0liMDUyiSjaEvB2SZrPRTb4P
	PJYgC8LFKtJs/dbeU0xf3uiPhJB+vvO6vGggsZOrGFp5aRuo
X-Google-Smtp-Source: ABdhPJyNZvFhmmuyQWlSXrAhghAZG2nABU8cIhFSLaGFhf+Ic89VxBQYh9e5I6CsSoB0ajJmtJhvAwvqrbmux4Td+kv8UMIq9eFN
MIME-Version: 1.0
X-Received: by 2002:a02:2ac1:: with SMTP id w184mr19540608jaw.44.1602508221256;
	Mon, 12 Oct 2020 06:10:21 -0700 (PDT)
Date: Mon, 12 Oct 2020 06:10:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000471ab405b179056d@google.com>
From: syzbot <syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 12 Oct 2020 09:26:00 -0400
Subject: [Cluster-devel] UBSAN: array-index-out-of-bounds in init_sb
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

HEAD commit:    6f2f486d Merge tag 'spi-fix-v5.9-rc8' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16887cab900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c06bcf3cc963d91c
dashboard link: https://syzkaller.appspot.com/bug?extid=a5e2482a693e6b1e444b
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1081031b900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=133c359f900000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15f3f320500000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17f3f320500000
console output: https://syzkaller.appspot.com/x/log.txt?x=13f3f320500000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com

gfs2: fsid=loop0: Trying to join cluster "lock_nolock", "loop0"
gfs2: fsid=loop0: Now mounting FS...
================================================================================
UBSAN: array-index-out-of-bounds in fs/gfs2/ops_fstype.c:342:21
index 11 is out of range for type 'u64 [11]'
CPU: 0 PID: 6887 Comm: syz-executor693 Not tainted 5.9.0-rc8-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x198/0x1fd lib/dump_stack.c:118
 ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
 __ubsan_handle_out_of_bounds.cold+0x62/0x6c lib/ubsan.c:356
 gfs2_read_sb fs/gfs2/ops_fstype.c:342 [inline]
 init_sb+0xc37/0xd30 fs/gfs2/ops_fstype.c:479
 gfs2_fill_super+0x1796/0x254a fs/gfs2/ops_fstype.c:1096
 get_tree_bdev+0x421/0x740 fs/super.c:1342
 gfs2_get_tree+0x4a/0x270 fs/gfs2/ops_fstype.c:1201
 vfs_get_tree+0x89/0x2f0 fs/super.c:1547
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x1387/0x20a0 fs/namespace.c:3192
 do_mount fs/namespace.c:3205 [inline]
 __do_sys_mount fs/namespace.c:3413 [inline]
 __se_sys_mount fs/namespace.c:3390 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3390
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x446dba
Code: b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 fd ad fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 da ad fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007ffcd944f138 EFLAGS: 00000293 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffcd944f190 RCX: 0000000000446dba
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffcd944f150
RBP: 00007ffcd944f150 R08: 00007ffcd944f190 R09: 00007ffc00000015
R10: 0000000002200000 R11: 0000000000000293 R12: 0000000000000001
R13: 0000000000000004 R14: 0000000000000003 R15: 0000000000000003
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

