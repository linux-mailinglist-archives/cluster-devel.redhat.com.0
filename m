Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD96278534
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Sep 2020 12:33:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-7XviR8GyNguo6A3s-PzU5A-1; Fri, 25 Sep 2020 06:32:57 -0400
X-MC-Unique: 7XviR8GyNguo6A3s-PzU5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0704956BE3;
	Fri, 25 Sep 2020 10:32:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A9B078827;
	Fri, 25 Sep 2020 10:32:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF59D79FF7;
	Fri, 25 Sep 2020 10:32:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08P9mT6A004928 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 25 Sep 2020 05:48:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 32203100BFEC; Fri, 25 Sep 2020 09:48:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D76E100C290
	for <cluster-devel@redhat.com>; Fri, 25 Sep 2020 09:48:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE6C88008A5
	for <cluster-devel@redhat.com>; Fri, 25 Sep 2020 09:48:26 +0000 (UTC)
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com
	[209.85.166.206]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-591-8Z2OLZkTM6q0qxS_kjnTTQ-1; Fri, 25 Sep 2020 05:48:24 -0400
X-MC-Unique: 8Z2OLZkTM6q0qxS_kjnTTQ-1
Received: by mail-il1-f206.google.com with SMTP id q11so1431846ilt.3
	for <cluster-devel@redhat.com>; Fri, 25 Sep 2020 02:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=akepFshVI5R+mDlwcYOxFWUOHFVZvQS2BgOitw8HPXA=;
	b=EpqoC3pBP6EbOxEjZZlG2p4B9E5+VyFZOUuSB8tpZv3NZxoW6fVNafcZ+j9praA+EO
	oQXtfnmWE74dpt0+VbT+abxQqzGhtCAU7al8+tNJ7/7cFmdaBvctLJQ+HL0E6ZzsUkZA
	LxIMIjnh0kEeRQY0a1k1eyfngvR2DPg9QOQip4BJspBF+4X2/z1x+xNV3yb45eHGXjj7
	Jv+D0OJ6fhxfqErpnjHjDBrMwIyN9PXp32duoaqsxe12Ie/FVjEUdO19N3uZSj+wJg1j
	Cd4ieJibejVXW1EDVdgHbfBp+cInehWxvOjkP4ge6+jZut/5PLtYSEFZ+29TPuDHbnAE
	ImAw==
X-Gm-Message-State: AOAM5307yYx3UdG3XYqPII95VLQ11o3m+KkzF4sZaxRrcSivWVw67hW/
	OmXFd60nHNlRbIoBKnWp0AGP8SgDeL5jcRk9110iqRHJqhkc
X-Google-Smtp-Source: ABdhPJyd+8fiUjXycNa+xjviGHqACF7mSVnxCkQr63M0xUVUXdwkO4/kbmJgpMe1EvkU6WjF6qBMc0NaY7SsXYCtHqEGNiYb/gok
MIME-Version: 1.0
X-Received: by 2002:a92:d08a:: with SMTP id h10mr2510042ilh.109.1601027303722; 
	Fri, 25 Sep 2020 02:48:23 -0700 (PDT)
Date: Fri, 25 Sep 2020 02:48:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b6d7fd05b02037ef@google.com>
From: syzbot <syzbot+50a8a9cf8127f2c6f5df@syzkaller.appspotmail.com>
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
X-Mailman-Approved-At: Fri, 25 Sep 2020 06:32:28 -0400
Subject: [Cluster-devel] general protection fault in gfs2_withdraw
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ba4f184e Linux 5.9-rc6
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a0ccad900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6f192552d75898a1
dashboard link: https://syzkaller.appspot.com/bug?extid=50a8a9cf8127f2c6f5df
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+50a8a9cf8127f2c6f5df@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: fatal: invalid metadata block
  bh = 2072 (magic number)
  function = gfs2_meta_indirect_buffer, file = fs/gfs2/meta_io.c, line = 417
gfs2: fsid=syz:syz.0: about to withdraw this file system
general protection fault, probably for non-canonical address 0xdffffc000000000e: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000070-0x0000000000000077]
CPU: 0 PID: 27118 Comm: syz-executor.0 Not tainted 5.9.0-rc6-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
RIP: 0010:signal_our_withdraw fs/gfs2/util.c:97 [inline]
RIP: 0010:gfs2_withdraw.cold+0xff/0xc0e fs/gfs2/util.c:294
Code: 00 48 c1 e0 2a 80 3c 02 00 0f 85 19 02 00 00 4c 8b bb a0 08 00 00 b8 ff ff 37 00 48 c1 e0 2a 49 8d 7f 70 48 89 fa 48 c1 ea 03 <80> 3c 02 00 74 05 e8 67 6d 68 fe 4d 8b 7f 70 b8 ff ff 37 00 48 c1
RSP: 0018:ffffc900018b73b8 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888059d70000 RCX: ffffc90002639000
RDX: 000000000000000e RSI: ffffffff834e9fdf RDI: 0000000000000070
RBP: ffff888059d7026d R08: 0000000000000038 R09: ffff88802ce318e7
R10: 0000000000000000 R11: 0000000000000000 R12: ffff888059d70050
R13: ffff888059d702f0 R14: ffffffff88cc1320 R15: 0000000000000000
FS:  00007f348fd73700(0000) GS:ffff88802ce00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000b60004 CR3: 000000004a089000 CR4: 0000000000350ef0
DR0: 0000000020000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000600
Call Trace:
 gfs2_meta_check_ii+0x68/0xa0 fs/gfs2/util.c:450
 gfs2_metatype_check_i fs/gfs2/util.h:126 [inline]
 gfs2_meta_indirect_buffer+0x3a3/0x3f0 fs/gfs2/meta_io.c:417
 gfs2_meta_inode_buffer fs/gfs2/meta_io.h:70 [inline]
 gfs2_inode_refresh+0x95/0xdf0 fs/gfs2/glops.c:438
 inode_go_lock+0x309/0x49f fs/gfs2/glops.c:468
 do_promote+0x4a0/0xc10 fs/gfs2/glock.c:390
 finish_xmote+0x4ed/0xf40 fs/gfs2/glock.c:560
 do_xmote+0x812/0xba0 fs/gfs2/glock.c:686
 run_queue+0x323/0x680 fs/gfs2/glock.c:751
 gfs2_glock_nq+0x716/0x11b0 fs/gfs2/glock.c:1410
 gfs2_glock_nq_init fs/gfs2/glock.h:238 [inline]
 gfs2_lookupi+0x314/0x630 fs/gfs2/inode.c:317
 gfs2_lookup_simple+0x99/0xe0 fs/gfs2/inode.c:268
 init_journal fs/gfs2/ops_fstype.c:620 [inline]
 init_inodes+0x367/0x1f40 fs/gfs2/ops_fstype.c:756
 gfs2_fill_super+0x195e/0x254a fs/gfs2/ops_fstype.c:1125
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
RIP: 0033:0x45e5ea
Code: b8 a6 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 6d 9e fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 4a 9e fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007f348fd72aa8 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007f348fd72b40 RCX: 000000000045e5ea
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f348fd72b00
RBP: 00007f348fd72b00 R08: 00007f348fd72b40 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 0000000020000200 R15: 0000000020047a20
Modules linked in:
---[ end trace a1967e7d2c26629b ]---
RIP: 0010:signal_our_withdraw fs/gfs2/util.c:97 [inline]
RIP: 0010:gfs2_withdraw.cold+0xff/0xc0e fs/gfs2/util.c:294
Code: 00 48 c1 e0 2a 80 3c 02 00 0f 85 19 02 00 00 4c 8b bb a0 08 00 00 b8 ff ff 37 00 48 c1 e0 2a 49 8d 7f 70 48 89 fa 48 c1 ea 03 <80> 3c 02 00 74 05 e8 67 6d 68 fe 4d 8b 7f 70 b8 ff ff 37 00 48 c1
RSP: 0018:ffffc900018b73b8 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888059d70000 RCX: ffffc90002639000
RDX: 000000000000000e RSI: ffffffff834e9fdf RDI: 0000000000000070
RBP: ffff888059d7026d R08: 0000000000000038 R09: ffff88802ce318e7
R10: 0000000000000000 R11: 0000000000000000 R12: ffff888059d70050
R13: ffff888059d702f0 R14: ffffffff88cc1320 R15: 0000000000000000
FS:  00007f348fd73700(0000) GS:ffff88802cf00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000256f020 CR3: 000000004a089000 CR4: 0000000000350ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

