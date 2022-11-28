Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F1463A809
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Nov 2022 13:18:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669637917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=1csAodOOfFTg2xybZjeCII0lV5hjMsXkJZLvPjeyoy0=;
	b=OgleNDoV0yW3187HARJYoXPqgNwN+gd4pD+lmG3IZT1cqDBCtb3yEftUGdxYLqA3zQLEai
	nlB0Jb+MLSBSoNYwQxGYJGlapfm6j6UBExeDqkiJuEondsKn+Ryn/vKmTGxf42lPC0A7i4
	UQym7E+Ci+Q+A8oQAETnE8DhqykY4sw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-AFnu6DcrPd-jKt2pml2Bag-1; Mon, 28 Nov 2022 07:18:33 -0500
X-MC-Unique: AFnu6DcrPd-jKt2pml2Bag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7238101A528;
	Mon, 28 Nov 2022 12:18:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 364D52027061;
	Mon, 28 Nov 2022 12:18:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D320119465B5;
	Mon, 28 Nov 2022 12:18:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5F5E01946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 28 Nov 2022 10:21:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2D920492B08; Mon, 28 Nov 2022 10:21:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26A30492B05
 for <cluster-devel@redhat.com>; Mon, 28 Nov 2022 10:21:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C188811732
 for <cluster-devel@redhat.com>; Mon, 28 Nov 2022 10:21:40 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-164-38FZ0pUJNyqaNUKgo5nj7A-1; Mon, 28 Nov 2022 05:21:37 -0500
X-MC-Unique: 38FZ0pUJNyqaNUKgo5nj7A-1
Received: by mail-io1-f72.google.com with SMTP id
 z15-20020a5e860f000000b006c09237cc06so5616051ioj.21
 for <cluster-devel@redhat.com>; Mon, 28 Nov 2022 02:21:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1csAodOOfFTg2xybZjeCII0lV5hjMsXkJZLvPjeyoy0=;
 b=IfXZh4/qDFxOgJSybXnLb0O4zUmQsdxlK+KcE86UM8pbA18AzJh/Fym/n+wReUEPj7
 ymfv4le0kYKiwY64PZv3BN4B75idYdCOLoBsZlSjKpDLcKIJx9wcmsY9Z4Sp9cRapcuR
 9AclsZoVNUY5YTn9/ktZmJD9zT1Sy33M2lXY+itqBsU4Gx/tH8ItZpumWYLSa5G7EA1+
 nYxDoZDmD+pTRp6Befari0pi8OT1RwDVeM79NNgQsTpc7FeZrOQlx79SsvXWrDXSpuUX
 ldlrgqB7enO0ya98fxizNojxCdeqYEMNgU3/iYHgrNE5IK+S8i1nsYC3r386ZRScK0EE
 Fk7Q==
X-Gm-Message-State: ANoB5pm0PQifduX5FyfT8OXFpknAEkXZx0dke9ymSyDylJVsBcYIS6Ex
 t4+QCB0T++7eqLCZlc9eM/VhLbWf8Rpprc2MiGaCxP29LR8L
X-Google-Smtp-Source: AA0mqf6gZGi0RD86hLnTJwpIDE2GuntyPJSbxUcgoIz8JgoDCM1GiVRXrhZviO6dLDkDJA1nD/RLc9afsOn6lJTCm9I/FZEffC3M
MIME-Version: 1.0
X-Received: by 2002:a02:9712:0:b0:363:a1bb:343e with SMTP id
 x18-20020a029712000000b00363a1bb343emr23846504jai.175.1669630897186; Mon, 28
 Nov 2022 02:21:37 -0800 (PST)
Date: Mon, 28 Nov 2022 02:21:37 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000886fde05ee853c18@google.com>
From: syzbot <syzbot+9f366abe80cb91810c84@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 28 Nov 2022 12:18:30 +0000
Subject: [Cluster-devel] [syzbot] general protection fault in gfs2_print_dbg
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    faf68e3523c2 Merge tag 'kbuild-fixes-v6.1-4' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16cf6cad880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8d01b6e3197974dd
dashboard link: https://syzkaller.appspot.com/bug?extid=9f366abe80cb91810c84
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3bfa6577f378/disk-faf68e35.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7bf0af58cde3/vmlinux-faf68e35.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3e15d7d640b0/bzImage-faf68e35.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9f366abe80cb91810c84@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000108420: 0000 [#1] PREEMPT SMP KASAN
KASAN: probably user-memory-access in range [0x0000000000842100-0x0000000000842107]
CPU: 0 PID: 16312 Comm: syz-executor.3 Not tainted 6.1.0-rc6-syzkaller-00315-gfaf68e3523c2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:string_nocheck lib/vsprintf.c:643 [inline]
RIP: 0010:string+0x1b5/0x2d0 lib/vsprintf.c:725
Code: 89 de 49 ff ce 31 ed 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 8d 3c 2c 48 89 f8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <0f> b6 04 08 84 c0 75 6a 49 8d 5c 2d 00 45 0f b6 3c 2c 31 ff 44 89
RSP: 0018:ffffc90005fc6990 EFLAGS: 00010003
RAX: 0000000000108420 RBX: ffffffffffffffff RCX: dffffc0000000000
RDX: ffff88807def3a80 RSI: 00000000ffffffff RDI: 0000000000842107
RBP: 0000000000000000 R08: ffffffff8a8cb389 R09: ffffffff8a8c7c8f
R10: 0000000000000012 R11: ffff88807def3a80 R12: 0000000000842107
R13: ffffc90005fc6ee6 R14: fffffffffffffffe R15: 0000000000000000
FS:  00007fa7a6873700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b33622000 CR3: 000000007ba24000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vsnprintf+0x1221/0x1ce0 lib/vsprintf.c:2800
 va_format lib/vsprintf.c:1685 [inline]
 pointer+0x845/0xfa0 lib/vsprintf.c:2431
 vsnprintf+0xe73/0x1ce0 lib/vsprintf.c:2804
 vprintk_store+0x3b0/0x1050 kernel/printk/printk.c:2152
 vprintk_emit+0x9a/0x1e0 kernel/printk/printk.c:2249
 _printk+0xc0/0x100 kernel/printk/printk.c:2289
 gfs2_print_dbg+0x172/0x180 fs/gfs2/glock.c:1456
 dump_holder fs/gfs2/glock.c:2342 [inline]
 gfs2_dump_glock+0x149f/0x1b60 fs/gfs2/glock.c:2447
 gfs2_consist_inode_i+0xf3/0x110 fs/gfs2/util.c:465
 gfs2_dirent_scan+0x535/0x650 fs/gfs2/dir.c:602
 gfs2_dirent_search+0x2ea/0xb10 fs/gfs2/dir.c:850
 gfs2_dir_search+0x8c/0x2a0 fs/gfs2/dir.c:1650
 gfs2_lookupi+0x465/0x650 fs/gfs2/inode.c:323
 __gfs2_lookup+0x8c/0x260 fs/gfs2/inode.c:870
 __lookup_slow+0x266/0x3a0 fs/namei.c:1685
 lookup_slow+0x53/0x70 fs/namei.c:1702
 walk_component+0x2e1/0x410 fs/namei.c:1993
 lookup_last fs/namei.c:2450 [inline]
 path_lookupat+0x17d/0x450 fs/namei.c:2474
 filename_lookup+0x274/0x650 fs/namei.c:2503
 user_path_at_empty+0x40/0x1a0 fs/namei.c:2876
 do_readlinkat+0x10c/0x3d0 fs/stat.c:468
 __do_sys_readlink fs/stat.c:501 [inline]
 __se_sys_readlink fs/stat.c:498 [inline]
 __x64_sys_readlink+0x7b/0x90 fs/stat.c:498
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fa7a5a8c0d9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fa7a6873168 EFLAGS: 00000246 ORIG_RAX: 0000000000000059
RAX: ffffffffffffffda RBX: 00007fa7a5bac120 RCX: 00007fa7a5a8c0d9
RDX: 0000000000000047 RSI: 0000000020000140 RDI: 0000000020000000
RBP: 00007fa7a5ae7ae9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffde5ef481f R14: 00007fa7a6873300 R15: 0000000000022000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:string_nocheck lib/vsprintf.c:643 [inline]
RIP: 0010:string+0x1b5/0x2d0 lib/vsprintf.c:725
Code: 89 de 49 ff ce 31 ed 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 8d 3c 2c 48 89 f8 48 c1 e8 03 48 b9 00 00 00 00 00 fc ff df <0f> b6 04 08 84 c0 75 6a 49 8d 5c 2d 00 45 0f b6 3c 2c 31 ff 44 89
RSP: 0018:ffffc90005fc6990 EFLAGS: 00010003
RAX: 0000000000108420 RBX: ffffffffffffffff RCX: dffffc0000000000
RDX: ffff88807def3a80 RSI: 00000000ffffffff RDI: 0000000000842107
RBP: 0000000000000000 R08: ffffffff8a8cb389 R09: ffffffff8a8c7c8f
R10: 0000000000000012 R11: ffff88807def3a80 R12: 0000000000842107
R13: ffffc90005fc6ee6 R14: fffffffffffffffe R15: 0000000000000000
FS:  00007fa7a6873700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b33622000 CR3: 000000007ba24000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	89 de                	mov    %ebx,%esi
   2:	49 ff ce             	dec    %r14
   5:	31 ed                	xor    %ebp,%ebp
   7:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
   e:	00 00 00
  11:	0f 1f 40 00          	nopl   0x0(%rax)
  15:	49 8d 3c 2c          	lea    (%r12,%rbp,1),%rdi
  19:	48 89 f8             	mov    %rdi,%rax
  1c:	48 c1 e8 03          	shr    $0x3,%rax
  20:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  27:	fc ff df
* 2a:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	75 6a                	jne    0x9c
  32:	49 8d 5c 2d 00       	lea    0x0(%r13,%rbp,1),%rbx
  37:	45 0f b6 3c 2c       	movzbl (%r12,%rbp,1),%r15d
  3c:	31 ff                	xor    %edi,%edi
  3e:	44                   	rex.R
  3f:	89                   	.byte 0x89


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

