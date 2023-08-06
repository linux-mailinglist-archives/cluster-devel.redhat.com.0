Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB45771C0B
	for <lists+cluster-devel@lfdr.de>; Mon,  7 Aug 2023 10:10:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691395856;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rzcx8osA0e3YiROtielZVHWeVQ/ebLv8kPXonOSmF+M=;
	b=RbOeogUGtLVMnNLnRI/6h6TKgbo9rjxdrkpG9rcan2JP0BT9ROwv6iYMS6fFMxLWp8fl0Z
	GCztRYvltjHZUjmBxMQvazmT6EXULoTyWiQPXsyTz3VQdTnFcyFjyiZOt1nfLrQaIarWep
	ZvVgZ+lv87YzBhTXFPOh5fgBOz3/GAU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-9A0dlyRTPs6OT0KekwWo3w-1; Mon, 07 Aug 2023 04:10:52 -0400
X-MC-Unique: 9A0dlyRTPs6OT0KekwWo3w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC97C800B35;
	Mon,  7 Aug 2023 08:10:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65F6D492C13;
	Mon,  7 Aug 2023 08:10:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1DC8E1946589;
	Mon,  7 Aug 2023 08:10:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 507F71946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun,  6 Aug 2023 00:38:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 48D53477F63; Sun,  6 Aug 2023 00:38:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40A064021C9
 for <cluster-devel@redhat.com>; Sun,  6 Aug 2023 00:38:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 034351C03D8E
 for <cluster-devel@redhat.com>; Sun,  6 Aug 2023 00:38:57 +0000 (UTC)
Received: from mail-oa1-f79.google.com (mail-oa1-f79.google.com
 [209.85.160.79]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-aubV31w2NLWxB90S4iMDxw-1; Sat, 05 Aug 2023 20:38:54 -0400
X-MC-Unique: aubV31w2NLWxB90S4iMDxw-1
Received: by mail-oa1-f79.google.com with SMTP id
 586e51a60fabf-1bb6df4eba1so4766117fac.1
 for <cluster-devel@redhat.com>; Sat, 05 Aug 2023 17:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691282334; x=1691887134;
 h=content-transfer-encoding:to:from:subject:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ENFXuACmZMZpQtX2wkxXaz6xdMvAYlZ0UmbIse7Psl4=;
 b=JvHC1FAX5gkHeBUmBBg+3ow2uA9D4LPZY/1bHkLa5mB6Ri6d5CzYXuXokv0IgcFV3h
 P+7JVngrP7UhXrgc1J/Pmq19F9iQqcVQG5Lu35/jHWMIrpddalgiJcx4MtE+cfYGnY9k
 078LG8t+wu50DFDHG32JS8RnMhdUgYnQOls9Z3wKxERTA2y/L/GEiYdiH+d0xks1TTaf
 Zj5nCqH1VlfBkUzu802zaPD/Cct45ADousSzLa7e80T9w9x0DHH+YJPn/a5bE/VQVsOW
 rIshFei5Z/x7SrXJvEZWsiM3n8PN8oz1q0v3L9bnViICwbxMcMYv1qCo0MfuCweKRhpj
 P1TA==
X-Gm-Message-State: AOJu0Yxcw0FWsmZsMSKLGCCGnSKTFs1mz29yd2Njjg3zWy7pMWAbgmMn
 fa1wrJkAxPaqoYLYRYU6JeelGS+h1JlIoJl2P56NUCEFiOey
X-Google-Smtp-Source: AGHT+IGDxYfmsuzOmH678RsV5gUzhAXsWSkYtbkKlAqQ+CAbddXmv8whikeg8KuRG1l3o/oMXFEENzkt9aNsinJhdRydBdnS/N6+
MIME-Version: 1.0
X-Received: by 2002:a05:6870:5aaf:b0:1bf:52d2:aea2 with SMTP id
 dt47-20020a0568705aaf00b001bf52d2aea2mr6246214oab.0.1691282334029; Sat, 05
 Aug 2023 17:38:54 -0700 (PDT)
Date: Sat, 05 Aug 2023 17:38:53 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bc20180602365ab0@google.com>
From: syzbot <syzbot+57e590d90f42e6e925df@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 07 Aug 2023 08:10:41 +0000
Subject: [Cluster-devel] [syzbot] [gfs2?] general protection fault in
 gfs2_lookup_simple
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
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    a73466257270 Add linux-next specific files for 20230801
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D17a48e75a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D8b55cb25bac8948=
c
dashboard link: https://syzkaller.appspot.com/bug?extid=3D57e590d90f42e6e92=
5df
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D1263b929a8000=
0
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D160bbe31a80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d893efe5006c/disk-=
a7346625.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5a2ea2e3ba30/vmlinux-=
a7346625.xz
kernel image: https://storage.googleapis.com/syzbot-assets/66f8ff91348f/bzI=
mage-a7346625.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/e94e695a9f21=
/mount_0.gz

The issue was bisected to:

commit 8f18190e31734e434a650d3435da072f03fe485f
Author: Andreas Gruenbacher <agruenba@redhat.com>
Date:   Wed Jul 26 21:17:53 2023 +0000

    gfs2: Use mapping->gfp_mask for metadata inodes

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1338d136a800=
00
final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D10b8d136a800=
00
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1738d136a80000

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+57e590d90f42e6e925df@syzkaller.appspotmail.com
Fixes: 8f18190e3173 ("gfs2: Use mapping->gfp_mask for metadata inodes")

gfs2: fsid=3Dno=08=EF=BF=BD=C5=A0ar?d: Trying to join cluster "lock_nolock"=
, "no=08=EF=BF=BD=C5=A0ar?d"
gfs2: fsid=3Dno=08=EF=BF=BD=C5=A0ar?d: Now mounting FS (format 1801)...
syz-executor418: attempt to access beyond end of device
loop0: rw=3D12288, sector=3D131072, nr_sectors =3D 8 limit=3D32768
general protection fault, probably for non-canonical address 0xdffffc000000=
0005: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000028-0x000000000000002f]
CPU: 1 PID: 5032 Comm: syz-executor418 Not tainted 6.5.0-rc4-next-20230801-=
syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 07/12/2023
RIP: 0010:gfs2_lookup_simple+0xc6/0x160 fs/gfs2/inode.c:286
Code: 74 24 20 f7 d0 89 44 24 20 e8 66 d3 ff ff 48 85 c0 0f 84 85 00 00 00 =
48 89 c3 e8 e5 01 e3 fd 48 8d 7b 30 48 89 f8 48 c1 e8 03 <42> 80 3c 20 00 7=
5 7b 48 b8 00 00 00 00 00 fc ff df 4c 8b 63 30 49
RSP: 0018:ffffc900039ef848 EFLAGS: 00010206
RAX: 0000000000000005 RBX: fffffffffffffffb RCX: 0000000000000000
RDX: ffff888015bf8000 RSI: ffffffff83a38d4b RDI: 000000000000002b
RBP: 1ffff9200073df09 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: dffffc0000000000
R13: ffffffff8ab99700 R14: ffff888019f94000 R15: ffff8880783f06b8
FS:  00005555558fa380(0000) GS:ffff8880b9900000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000557976244798 CR3: 0000000074978000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 init_journal fs/gfs2/ops_fstype.c:742 [inline]
 init_inodes+0x495/0x2e30 fs/gfs2/ops_fstype.c:885
 gfs2_fill_super+0x1a9e/0x2b10 fs/gfs2/ops_fstype.c:1248
 get_tree_bdev+0x390/0x6a0 fs/super.c:1345
 gfs2_get_tree+0x4e/0x280 fs/gfs2/ops_fstype.c:1333
 vfs_get_tree+0x88/0x350 fs/super.c:1521
 do_new_mount fs/namespace.c:3335 [inline]
 path_mount+0x1492/0x1ed0 fs/namespace.c:3662
 do_mount fs/namespace.c:3675 [inline]
 __do_sys_mount fs/namespace.c:3884 [inline]
 __se_sys_mount fs/namespace.c:3861 [inline]
 __x64_sys_mount+0x293/0x310 fs/namespace.c:3861
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f6d772a2c3a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 5e 04 00 00 66 2e 0f 1f 84 =
00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff3af18918 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fff3af18920 RCX: 00007f6d772a2c3a
RDX: 0000000020000000 RSI: 0000000020000040 RDI: 00007fff3af18920
RBP: 0000000000000004 R08: 00007fff3af18960 R09: 00000000000125fe
R10: 0000000000000819 R11: 0000000000000282 R12: 00007fff3af18960
R13: 0000000000000003 R14: 0000000001000000 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:gfs2_lookup_simple+0xc6/0x160 fs/gfs2/inode.c:286
Code: 74 24 20 f7 d0 89 44 24 20 e8 66 d3 ff ff 48 85 c0 0f 84 85 00 00 00 =
48 89 c3 e8 e5 01 e3 fd 48 8d 7b 30 48 89 f8 48 c1 e8 03 <42> 80 3c 20 00 7=
5 7b 48 b8 00 00 00 00 00 fc ff df 4c 8b 63 30 49
RSP: 0018:ffffc900039ef848 EFLAGS: 00010206
RAX: 0000000000000005 RBX: fffffffffffffffb RCX: 0000000000000000
RDX: ffff888015bf8000 RSI: ffffffff83a38d4b RDI: 000000000000002b
RBP: 1ffff9200073df09 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: dffffc0000000000
R13: ffffffff8ab99700 R14: ffff888019f94000 R15: ffff8880783f06b8
FS:  00005555558fa380(0000) GS:ffff8880b9800000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000564e741eb538 CR3: 0000000074978000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:=0974 24                =09je     0x26
   2:=0920 f7                =09and    %dh,%bh
   4:=09d0 89 44 24 20 e8    =09rorb   -0x17dfdbbc(%rcx)
   a:=0966 d3 ff             =09sar    %cl,%di
   d:=09ff 48 85             =09decl   -0x7b(%rax)
  10:=09c0 0f 84             =09rorb   $0x84,(%rdi)
  13:=0985 00                =09test   %eax,(%rax)
  15:=0900 00                =09add    %al,(%rax)
  17:=0948 89 c3             =09mov    %rax,%rbx
  1a:=09e8 e5 01 e3 fd       =09call   0xfde30204
  1f:=0948 8d 7b 30          =09lea    0x30(%rbx),%rdi
  23:=0948 89 f8             =09mov    %rdi,%rax
  26:=0948 c1 e8 03          =09shr    $0x3,%rax
* 2a:=0942 80 3c 20 00       =09cmpb   $0x0,(%rax,%r12,1) <-- trapping inst=
ruction
  2f:=0975 7b                =09jne    0xac
  31:=0948 b8 00 00 00 00 00 =09movabs $0xdffffc0000000000,%rax
  38:=09fc ff df
  3b:=094c 8b 63 30          =09mov    0x30(%rbx),%r12
  3f:=0949                   =09rex.WB


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisectio=
n

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

