Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7657627E8C8
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Sep 2020 14:47:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-6yfi5KNOMqq9E4zFi5Rmdg-1; Wed, 30 Sep 2020 08:47:22 -0400
X-MC-Unique: 6yfi5KNOMqq9E4zFi5Rmdg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77F6B425CE;
	Wed, 30 Sep 2020 12:47:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28C7B1002C1E;
	Wed, 30 Sep 2020 12:47:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 705AC44A5B;
	Wed, 30 Sep 2020 12:47:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08UCdSXq001508 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 30 Sep 2020 08:39:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DA0C32022780; Wed, 30 Sep 2020 12:39:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D497020235B9
	for <cluster-devel@redhat.com>; Wed, 30 Sep 2020 12:39:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65937101A53F
	for <cluster-devel@redhat.com>; Wed, 30 Sep 2020 12:39:26 +0000 (UTC)
Received: from mail-il1-f206.google.com (mail-il1-f206.google.com
	[209.85.166.206]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-587-Ngf1cL6FNc6z8-VOgXQZXw-1; Wed, 30 Sep 2020 08:39:23 -0400
X-MC-Unique: Ngf1cL6FNc6z8-VOgXQZXw-1
Received: by mail-il1-f206.google.com with SMTP id i18so1328593ils.1
	for <cluster-devel@redhat.com>; Wed, 30 Sep 2020 05:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=HqnQ3NKXGLFPLSYTFlYXasihzCjgFi1eenNMqMb4n/0=;
	b=CSPfOjTYbq12wpS+yF8VjwomsNL1+gvrTG7pOWnbHbFrUJzXhnIEt7k9UgJ90jx1rO
	OOeGysW4Sh2Kq7Y3Z1UpZOHhMqbFy9hNqA6pEljYKH1n2EDv58D5nhrDFSQp+8iwMFOQ
	Gm4PEp/PvZjqzFf7AxBpf0WbamFP/Au2TVqSFY3o5XnsxnsqRka4vlOGdQTku/sYjtVm
	7+pWGl6WihX+8UBKAcAqlDTZJDoyXSmjdoydY84pz/bkB1KPT0MNUWpWOzrS3JOANKdN
	H2irJuN0xs790fDaAt5b8p5DFu65owaQbZHmYWEseeEoi/p/0tOWuLr6wT6YeCxdGYre
	cC+A==
X-Gm-Message-State: AOAM532brQoSO9ZcJuQkIZMrGGbS0iisTpbDuZKfwHhpjEirWMrsZPSM
	2PLMzD9G2COlX4cRIXjm7gQa3SBerFKsl6fWzl0yK9Q9Lmtf
X-Google-Smtp-Source: ABdhPJz39cWzawSF9lPfOMXjQPdfXM2hfivrzVb8jS5oJnMfdk5/nkUiGd/Gx+va87Q17yS+GoJVbRm27C0sFoWXS/sVOpinxSeH
MIME-Version: 1.0
X-Received: by 2002:a92:8912:: with SMTP id n18mr1935722ild.134.1601469562813; 
	Wed, 30 Sep 2020 05:39:22 -0700 (PDT)
Date: Wed, 30 Sep 2020 05:39:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006903b205b0873061@google.com>
From: syzbot <syzbot+af90d47a37376844e731@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 30 Sep 2020 08:41:15 -0400
Subject: [Cluster-devel] KASAN: slab-out-of-bounds Write in gfs2_fill_super
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

HEAD commit:    fb0155a0 Merge tag 'nfs-for-5.9-3' of git://git.linux-nfs...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13458c0f900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=adebb40048274f92
dashboard link: https://syzkaller.appspot.com/bug?extid=af90d47a37376844e731
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15c307d3900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1353d58d900000

Bisection is inconclusive: the issue happens on the oldest tested release.

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=106acbbb900000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=126acbbb900000
console output: https://syzkaller.appspot.com/x/log.txt?x=146acbbb900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+af90d47a37376844e731@syzkaller.appspotmail.com

gfs2: fsid=loop0: Trying to join cluster "lock_nolock", "loop0"
gfs2: fsid=loop0: Now mounting FS...
==================================================================
BUG: KASAN: slab-out-of-bounds in gfs2_read_sb fs/gfs2/ops_fstype.c:342 [inline]
BUG: KASAN: slab-out-of-bounds in init_sb fs/gfs2/ops_fstype.c:479 [inline]
BUG: KASAN: slab-out-of-bounds in gfs2_fill_super+0x1db5/0x3fe0 fs/gfs2/ops_fstype.c:1096
Write of size 8 at addr ffff88809073d548 by task syz-executor940/6853

CPU: 1 PID: 6853 Comm: syz-executor940 Not tainted 5.9.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x1d6/0x29e lib/dump_stack.c:118
 print_address_description+0x66/0x620 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report+0x132/0x1d0 mm/kasan/report.c:530
 gfs2_read_sb fs/gfs2/ops_fstype.c:342 [inline]
 init_sb fs/gfs2/ops_fstype.c:479 [inline]
 gfs2_fill_super+0x1db5/0x3fe0 fs/gfs2/ops_fstype.c:1096
 get_tree_bdev+0x3e9/0x5f0 fs/super.c:1342
 gfs2_get_tree+0x4c/0x1f0 fs/gfs2/ops_fstype.c:1201
 vfs_get_tree+0x88/0x270 fs/super.c:1547
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x179d/0x29e0 fs/namespace.c:3192
 do_mount fs/namespace.c:3205 [inline]
 __do_sys_mount fs/namespace.c:3413 [inline]
 __se_sys_mount+0x126/0x180 fs/namespace.c:3390
 do_syscall_64+0x31/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x446dba
Code: b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 fd ad fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 da ad fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007fff4c56e748 EFLAGS: 00000293 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fff4c56e7a0 RCX: 0000000000446dba
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fff4c56e760
RBP: 00007fff4c56e760 R08: 00007fff4c56e7a0 R09: 00007fff00000015
R10: 0000000002200000 R11: 0000000000000293 R12: 0000000000000001
R13: 0000000000000004 R14: 0000000000000003 R15: 0000000000000003

Allocated by task 6853:
 kasan_save_stack mm/kasan/common.c:48 [inline]
 kasan_set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc+0x100/0x130 mm/kasan/common.c:461
 kmem_cache_alloc_trace+0x1e4/0x2e0 mm/slab.c:3554
 kmalloc include/linux/slab.h:554 [inline]
 kzalloc include/linux/slab.h:666 [inline]
 init_sbd fs/gfs2/ops_fstype.c:77 [inline]
 gfs2_fill_super+0xb6/0x3fe0 fs/gfs2/ops_fstype.c:1018
 get_tree_bdev+0x3e9/0x5f0 fs/super.c:1342
 gfs2_get_tree+0x4c/0x1f0 fs/gfs2/ops_fstype.c:1201
 vfs_get_tree+0x88/0x270 fs/super.c:1547
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x179d/0x29e0 fs/namespace.c:3192
 do_mount fs/namespace.c:3205 [inline]
 __do_sys_mount fs/namespace.c:3413 [inline]
 __se_sys_mount+0x126/0x180 fs/namespace.c:3390
 do_syscall_64+0x31/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The buggy address belongs to the object at ffff88809073c000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 5448 bytes inside of
 8192-byte region [ffff88809073c000, ffff88809073e000)
The buggy address belongs to the page:
page:00000000bd4b0b2d refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x9073c
head:00000000bd4b0b2d order:2 compound_mapcount:0 compound_pincount:0
flags: 0xfffe0000010200(slab|head)
raw: 00fffe0000010200 ffffea00028e5608 ffff8880aa441b50 ffff8880aa440a00
raw: 0000000000000000 ffff88809073c000 0000000100000001 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff88809073d400: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88809073d480: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff88809073d500: 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc
                                              ^
 ffff88809073d580: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88809073d600: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

