Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 303EA7923DB
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Sep 2023 17:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693927112;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Zptu25zAJQ4Aig1qjwOjOEyFmtuG8Q5eB0pDaPNvFgM=;
	b=IRXAQ/gA1rCHh8de8y/ArDKtt7KujY7w4Hlk7G/VvMIKm5OCbFLA6Y76c2jCnXZ1Y3XqRz
	euE6mUY3qM9ZS6Y7DvMcHw8PrpiY27hP2A5TxwLQWiMjvuVEFGtOjTqrk4HM9OGK/ScEzY
	KL3TujAogj08C4dQlubFZsK2r504pbo=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-465-NUh98kpxP4KUHEvIV_OAXg-1; Tue, 05 Sep 2023 11:18:28 -0400
X-MC-Unique: NUh98kpxP4KUHEvIV_OAXg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC6B31C05B08;
	Tue,  5 Sep 2023 15:18:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3732493110;
	Tue,  5 Sep 2023 15:18:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5A2B819465B7;
	Tue,  5 Sep 2023 15:18:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C9EBC1946589 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  5 Sep 2023 15:10:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AB27A40C105A; Tue,  5 Sep 2023 15:10:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A3F7C40268F0
 for <cluster-devel@redhat.com>; Tue,  5 Sep 2023 15:10:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AF5328004AC
 for <cluster-devel@redhat.com>; Tue,  5 Sep 2023 15:10:12 +0000 (UTC)
Received: from mail-pl1-f207.google.com (mail-pl1-f207.google.com
 [209.85.214.207]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-118-kTvV9p3yPQ6qgsYIbzjBIQ-1; Tue, 05 Sep 2023 11:10:07 -0400
X-MC-Unique: kTvV9p3yPQ6qgsYIbzjBIQ-1
Received: by mail-pl1-f207.google.com with SMTP id
 d9443c01a7336-1bf24089e4eso35018155ad.1
 for <cluster-devel@redhat.com>; Tue, 05 Sep 2023 08:10:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693926601; x=1694531401;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zptu25zAJQ4Aig1qjwOjOEyFmtuG8Q5eB0pDaPNvFgM=;
 b=lgSejNxwknA6Nk+H1mNmOPpKyJzNRdYVzVF9kAdFo7xMfhCFXd76FoXeLb0lkqzVDT
 y5yXnRO5E74ecj3pVLreKUgNJAe68OwBiZNvcOU/70WXId0SLq011fzjZ52UT+lxTgbQ
 visvJHOX+FnAgj+EGUV2svHizxtj4GmZ+klfm5QnGkawJ1Hh5V59dT6dxhKCUdEcRywJ
 q3vXCvmuI+HlUM3ahViBBjI95NtEwRy52jQgkSzWU30sGLxZg8Oz53K04+LF+/RwnXeK
 lNFMwcWKiOkZNZh7Xpb4ctiYgU2tP4NASDywNCBVt3IfnVPnE7D1eV1okUHXzPl3QYlV
 1Vng==
X-Gm-Message-State: AOJu0Ywo7fzjFzaFX1xd2lsMOQuv/Aa2Cg3dTryZKsab7MVOvZKT6cWv
 YiHeueeS0gvPU3J19UrceVqyxx5n8iTEu5yTsChQeiBPXrRd
X-Google-Smtp-Source: AGHT+IHOaatneJIiY8Vpq/QHv5/A4HITVO5axXAoW2BTmzdBYreEy69CnddsU6RY2cwqhzAkHiAhllo50shJMAPo4h3kdY8zVUTK
MIME-Version: 1.0
X-Received: by 2002:a17:902:cec4:b0:1c1:f658:7cfa with SMTP id
 d4-20020a170902cec400b001c1f6587cfamr4546090plg.9.1693926601194; Tue, 05 Sep
 2023 08:10:01 -0700 (PDT)
Date: Tue, 05 Sep 2023 08:10:01 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000057049306049e0525@google.com>
From: syzbot <syzbot+10c6178a65acf04efe47@syzkaller.appspotmail.com>
To: agruenba@redhat.com, cluster-devel@redhat.com, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rpeterso@redhat.com, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Tue, 05 Sep 2023 15:18:24 +0000
Subject: [Cluster-devel] [syzbot] [gfs2?] BUG: sleeping function called from
 invalid context in glock_hash_walk
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
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3f86ed6ec0b3 Merge tag 'arc-6.6-rc1' of git://git.kernel.o..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1346753fa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ff0db7a15ba54ead
dashboard link: https://syzkaller.appspot.com/bug?extid=10c6178a65acf04efe47
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13e4ea14680000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13f76f10680000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6f4f710c5033/disk-3f86ed6e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/555548fedbdc/vmlinux-3f86ed6e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c06d7c39bbc0/bzImage-3f86ed6e.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/9cc536caad57/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+10c6178a65acf04efe47@syzkaller.appspotmail.com

syz-executor585: attempt to access beyond end of device
loop0: rw=1, sector=3280942697285464, nr_sectors = 8 limit=32768
gfs2: fsid=syz:syz.0: Error 10 writing to journal, jid=0
gfs2: fsid=syz:syz.0: fatal: I/O error(s)
gfs2: fsid=syz:syz.0: about to withdraw this file system
BUG: sleeping function called from invalid context at fs/gfs2/glock.c:2081
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 5030, name: syz-executor585
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
INFO: lockdep is turned off.
Preemption disabled at:
[<0000000000000000>] 0x0
CPU: 0 PID: 5030 Comm: syz-executor585 Not tainted 6.5.0-syzkaller-11704-g3f86ed6ec0b3 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/26/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
 __might_resched+0x5cf/0x780 kernel/sched/core.c:10187
 glock_hash_walk+0x13b/0x1b0 fs/gfs2/glock.c:2081
 gfs2_flush_delete_work+0x1c/0x50 fs/gfs2/glock.c:2108
 gfs2_make_fs_ro+0x109/0x680 fs/gfs2/super.c:550
 signal_our_withdraw fs/gfs2/util.c:153 [inline]
 gfs2_withdraw+0x48a/0x11e0 fs/gfs2/util.c:334
 gfs2_ail1_empty+0x7d0/0x860 fs/gfs2/log.c:377
 gfs2_flush_revokes+0x5e/0x90 fs/gfs2/log.c:815
 revoke_lo_before_commit+0x2c/0x5f0 fs/gfs2/lops.c:868
 lops_before_commit fs/gfs2/lops.h:40 [inline]
 gfs2_log_flush+0xc93/0x25f0 fs/gfs2/log.c:1101
 gfs2_write_inode+0x20e/0x3b0 fs/gfs2/super.c:453
 write_inode fs/fs-writeback.c:1456 [inline]
 __writeback_single_inode+0x69b/0xfa0 fs/fs-writeback.c:1668
 writeback_single_inode+0x21b/0x790 fs/fs-writeback.c:1724
 sync_inode_metadata+0xcc/0x130 fs/fs-writeback.c:2786
 gfs2_fsync+0x1a7/0x340 fs/gfs2/file.c:761
 generic_write_sync include/linux/fs.h:2625 [inline]
 gfs2_file_write_iter+0xb33/0xe60 fs/gfs2/file.c:1159
 do_iter_write+0x84f/0xde0 fs/read_write.c:860
 iter_file_splice_write+0x86d/0x1010 fs/splice.c:736
 do_splice_from fs/splice.c:933 [inline]
 direct_splice_actor+0xea/0x1c0 fs/splice.c:1142
 splice_direct_to_actor+0x376/0x9e0 fs/splice.c:1088
 do_splice_direct+0x2ac/0x3f0 fs/splice.c:1194
 do_sendfile+0x623/0x1070 fs/read_write.c:1254
 __do_sys_sendfile64 fs/read_write.c:1322 [inline]
 __se_sys_sendfile64+0x17c/0x1e0 fs/read_write.c:1308
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fb0ea97bd59
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd9f19f258 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fb0ea97bd59
RDX: 0000000000000000 RSI: 0000000000000008 RDI: 0000000000000007
RBP: 0000000000000246 R08: 0000000000000002 R09: 00005555571844c0
R10: 0000000080000001 R11: 0000000000000246 R12: 00007ffd9f19f280
R13: 00007fb0ea95cac4 R14: 431bde82d7b634db R15: 00007fb0ea9c503b
 </TASK>
BUG: scheduling while atomic: syz-executor585/5030/0x00000002
INFO: lockdep is turned off.
Modules linked in:
Preemption disabled at:
[<0000000000000000>] 0x0


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

