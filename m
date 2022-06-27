Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FC755B8F0
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Jun 2022 11:29:56 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-5RMiuq_zOp-ubprz7G7eqw-1; Mon, 27 Jun 2022 05:29:52 -0400
X-MC-Unique: 5RMiuq_zOp-ubprz7G7eqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5C73F85A581;
	Mon, 27 Jun 2022 09:29:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87863C15D42;
	Mon, 27 Jun 2022 09:29:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3D303194704A;
	Mon, 27 Jun 2022 09:29:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A1B9A19466DF for <cluster-devel@listman.corp.redhat.com>;
 Mon, 27 Jun 2022 07:11:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8E8B641615A; Mon, 27 Jun 2022 07:11:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AAF6415F5E
 for <cluster-devel@redhat.com>; Mon, 27 Jun 2022 07:11:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73825804022
 for <cluster-devel@redhat.com>; Mon, 27 Jun 2022 07:11:26 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-Ha4HMC4LMbqXU66dh5RRoQ-1; Mon, 27 Jun 2022 03:11:24 -0400
X-MC-Unique: Ha4HMC4LMbqXU66dh5RRoQ-1
Received: by mail-il1-f198.google.com with SMTP id
 i8-20020a056e020d8800b002d931252904so5241842ilj.23
 for <cluster-devel@redhat.com>; Mon, 27 Jun 2022 00:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=dlXIjc1Fz8xnNFqUPA8RuqcnGDzpMp9dQqsY2cW9s0Q=;
 b=I0F7gbrZmXYlywamm/7/t1M4MBGjVj1Prd3T/+CsiLx2ehHtlx7zcSYuk8GJIZnz8k
 bGy+aIhQwSzquVCsYG6J8Nd3YBPorB8aoziI7ejvPxGNSh1ZKPoB6NK3l5YPKdtxG4IU
 vD5Nm+yFzCnveq6UXeBeOItDJX7vYfxLVh79y11EAYi3seEWUybCkdN/vH/BawjXU9MH
 Q+HcVncq5RNPifAK/Rr22N8sKD4X5IOXu7PoCSAiCxL+ye7g4Cd/88td0n7pn7BxOmgh
 Zd3T0KFjnyrpy8jUvKNDwHcRV5JUQ+hmNp+gSIzXhC/ZO5USoPshOAmifaZ9OoGQNXzI
 QFng==
X-Gm-Message-State: AJIora8f8Qy2pUXgdOYDP1ZtUdfD/jDpILrLKvbT/Ht0O+EXif3wDjXx
 SAi2hba7xQAaA5itHIiX9Evb61rRWW0AbgvELQ+Uwu9V+Mi9
X-Google-Smtp-Source: AGRyM1uEqgM9HARc07iExUWF+t/2BiCbz5N40Sn4h7wiB9s1t77N4JufQKYvjQu2eU4f2Dkoyqxv+ZDFRcfoXIk+fZ4KGMcDPeaQ
MIME-Version: 1.0
X-Received: by 2002:a05:6602:27c6:b0:657:7e7a:11f3 with SMTP id
 l6-20020a05660227c600b006577e7a11f3mr6157230ios.40.1656313883590; Mon, 27 Jun
 2022 00:11:23 -0700 (PDT)
Date: Mon, 27 Jun 2022 00:11:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ab092305e268a016@google.com>
From: syzbot <syzbot+8a5fc6416c175cecea34@syzkaller.appspotmail.com>
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
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Mailman-Approved-At: Mon, 27 Jun 2022 09:29:48 +0000
Subject: [Cluster-devel] [syzbot] general protection fault in
 gfs2_evict_inode (2)
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ca1fdab7fd27 Merge tag 'efi-urgent-for-v5.19-1' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=102e8560080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=542d3d75f0e6f36f
dashboard link: https://syzkaller.appspot.com/bug?extid=8a5fc6416c175cecea34
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8a5fc6416c175cecea34@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: first mount done, others may mount
general protection fault, probably for non-canonical address 0xdffffc0000000011: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000088-0x000000000000008f]
CPU: 1 PID: 10573 Comm: syz-executor.0 Not tainted 5.19.0-rc3-syzkaller-00038-gca1fdab7fd27 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:evict_linked_inode fs/gfs2/super.c:1329 [inline]
RIP: 0010:gfs2_evict_inode+0xbf2/0x2030 fs/gfs2/super.c:1384
Code: 03 80 3c 02 00 0f 85 bd 13 00 00 48 8b 9d 00 09 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bb 8c 00 00 00 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 e0
RSP: 0018:ffffc90005ae7670 EFLAGS: 00010217
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffc90003a83000
RDX: 0000000000000011 RSI: ffffffff838de301 RDI: 000000000000008c
RBP: ffff88802cd6c000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000001
R13: ffff88802e1a5160 R14: ffff88802e1a5698 R15: ffff88802e1a5610
FS:  00007f4c042c5700(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa58679d090 CR3: 000000007d0e3000 CR4: 0000000000350ee0
Call Trace:
 <TASK>
 evict+0x2ed/0x6b0 fs/inode.c:664
 iput_final fs/inode.c:1744 [inline]
 iput.part.0+0x562/0x820 fs/inode.c:1770
 iput+0x58/0x70 fs/inode.c:1760
 init_journal fs/gfs2/ops_fstype.c:870 [inline]
 init_inodes+0x28c/0x2720 fs/gfs2/ops_fstype.c:924
 gfs2_fill_super+0x1b49/0x28a0 fs/gfs2/ops_fstype.c:1242
 get_tree_bdev+0x440/0x760 fs/super.c:1292
 gfs2_get_tree+0x4a/0x270 fs/gfs2/ops_fstype.c:1325
 vfs_get_tree+0x89/0x2f0 fs/super.c:1497
 do_new_mount fs/namespace.c:3040 [inline]
 path_mount+0x1320/0x1fa0 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x46/0xb0
RIP: 0033:0x7f4c0308a63a
Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4c042c4f88 EFLAGS: 00000206 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 00007f4c0308a63a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f4c042c4fe0
RBP: 00007f4c042c5020 R08: 00007f4c042c5020 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000020000000
R13: 0000000020000100 R14: 00007f4c042c4fe0 R15: 0000000020047a20
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:evict_linked_inode fs/gfs2/super.c:1329 [inline]
RIP: 0010:gfs2_evict_inode+0xbf2/0x2030 fs/gfs2/super.c:1384
Code: 03 80 3c 02 00 0f 85 bd 13 00 00 48 8b 9d 00 09 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bb 8c 00 00 00 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 e0
RSP: 0018:ffffc90005ae7670 EFLAGS: 00010217
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffc90003a83000
RDX: 0000000000000011 RSI: ffffffff838de301 RDI: 000000000000008c
RBP: ffff88802cd6c000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000001
R13: ffff88802e1a5160 R14: ffff88802e1a5698 R15: ffff88802e1a5610
FS:  00007f4c042c5700(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fa58679d090 CR3: 000000007d0e3000 CR4: 0000000000350ee0
----------------
Code disassembly (best guess):
   0:	03 80 3c 02 00 0f    	add    0xf00023c(%rax),%eax
   6:	85 bd 13 00 00 48    	test   %edi,0x48000013(%rbp)
   c:	8b 9d 00 09 00 00    	mov    0x900(%rbp),%ebx
  12:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  19:	fc ff df
  1c:	48 8d bb 8c 00 00 00 	lea    0x8c(%rbx),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx <-- trapping instruction
  2e:	48 89 f8             	mov    %rdi,%rax
  31:	83 e0 07             	and    $0x7,%eax
  34:	83 c0 03             	add    $0x3,%eax
  37:	38 d0                	cmp    %dl,%al
  39:	7c 08                	jl     0x43
  3b:	84 d2                	test   %dl,%dl
  3d:	0f                   	.byte 0xf
  3e:	85 e0                	test   %esp,%eax


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

