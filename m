Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 31404609F1C
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Oct 2022 12:33:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666607607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=T49Ky00Q6rRNQe4pUU5ynRg2+0qQfgYGOd9OM+3Bnzc=;
	b=PoL/KUZ2y39c3gtQsIHUbVPVNeNMNNclAqKgob/MIfZyxx4iR+37brSy1edxR/vAR+/YoI
	xC47vgp/rIqZd8iBj4HJcFD8zHW/iH5rn30IOJtdl0iGoQbGgFCYYeQvOgxJVD64U/lvov
	HUeqUTnIYNMASTfAPqjETouJCuHsrfI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-247-ZI4y_gInO6iNAAwb-fOUwQ-1; Mon, 24 Oct 2022 06:33:26 -0400
X-MC-Unique: ZI4y_gInO6iNAAwb-fOUwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0134804186;
	Mon, 24 Oct 2022 10:33:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC29E2166B35;
	Mon, 24 Oct 2022 10:33:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 900101946597;
	Mon, 24 Oct 2022 10:33:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 52C8E1946587 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 23 Oct 2022 07:29:48 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B808F492B04; Sun, 23 Oct 2022 07:29:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B108A492B06
 for <cluster-devel@redhat.com>; Sun, 23 Oct 2022 07:29:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEFAA800B30
 for <cluster-devel@redhat.com>; Sun, 23 Oct 2022 07:29:46 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-PDuA7oVqPOCdiUSFgKdz-w-1; Sun, 23 Oct 2022 03:29:45 -0400
X-MC-Unique: PDuA7oVqPOCdiUSFgKdz-w-1
Received: by mail-il1-f199.google.com with SMTP id
 x6-20020a056e021bc600b002fc96f780e7so6811603ilv.10
 for <cluster-devel@redhat.com>; Sun, 23 Oct 2022 00:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T49Ky00Q6rRNQe4pUU5ynRg2+0qQfgYGOd9OM+3Bnzc=;
 b=nXOlJt9FUV5TigYde7IM0x+++7JQXRRWtb/8RJ+fJvORN/xu4D8oLUVXoaW6iKuWF6
 fWbyhWSnCqwhztHpLA4xNhMWxV+m2xR+BM+lwl9nmyxZSzaOpP19HJyP3eTpXgR/i/Pm
 6upjJumIaZqHUXZFz3wehiTamxDQSP81kgysi0G4BodjHHNEYOQ8qxxnQ54bmWibtTiX
 bLfd2rxSJkPBzVUsbectKf09FOMnwcVPmm7o870mfo9SP/7cikLUnDf/M1dU8SAQDiVd
 hsf5obuofwezBhDqYLylwTB9DL3sW+RZ8bZ966MJJ3G+I4NGzlk56uAbj0wUrfvs22L3
 PZqw==
X-Gm-Message-State: ACrzQf1ERX+ZKZnMgPhr6WtfdtvH1x01EM4EQk0KiGU5rRAkQi0Nr5rv
 EM+jC7UiwF3NsPGntk5ocwFsIe/+9c4/vw/pakvJJN1YW7xC
X-Google-Smtp-Source: AMsMyM5embqrGQGEktcVUkIOyI5bNCUz6O1vuIdPBVcD0bynMJG12mHyRGcrPErVP2agfNiwkBEQRAo5rXJtqEo1+lSkqHDb/SQu
MIME-Version: 1.0
X-Received: by 2002:a5e:9806:0:b0:6bc:7de8:239f with SMTP id
 s6-20020a5e9806000000b006bc7de8239fmr17561500ioj.20.1666510184427; Sun, 23
 Oct 2022 00:29:44 -0700 (PDT)
Date: Sun, 23 Oct 2022 00:29:44 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008eb80505ebaea3d3@google.com>
From: syzbot <syzbot+da97a57c5b742d05db51@syzkaller.appspotmail.com>
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
X-Mailman-Approved-At: Mon, 24 Oct 2022 10:33:21 +0000
Subject: [Cluster-devel] [syzbot] general protection fault in
 gfs2_parse_param
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4d48f589d294 Add linux-next specific files for 20221021
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15e511ba880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2c4b7d600a5739a6
dashboard link: https://syzkaller.appspot.com/bug?extid=da97a57c5b742d05db51
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e2fbe6880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1146d66a880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0c86bd0b39a0/disk-4d48f589.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/074059d37f1f/vmlinux-4d48f589.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/1c147a66d1a0/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+da97a57c5b742d05db51@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 264192
general protection fault, probably for non-canonical address 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
CPU: 0 PID: 3602 Comm: syz-executor230 Not tainted 6.1.0-rc1-next-20221021-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/11/2022
RIP: 0010:strnlen+0x3b/0x70 lib/string.c:430
Code: 74 3c 48 bb 00 00 00 00 00 fc ff df 49 89 fc 48 89 f8 eb 09 48 83 c0 01 48 39 e8 74 1e 48 89 c2 48 89 c1 48 c1 ea 03 83 e1 07 <0f> b6 14 1a 38 ca 7f 04 84 d2 75 11 80 38 00 75 d9 4c 29 e0 48 83
RSP: 0018:ffffc90003b6fb40 EFLAGS: 00010246
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000040 RDI: 0000000000000000
RBP: 0000000000000040 R08: 0000000000000005 R09: 0000000000000017
R10: 0000000000000002 R11: 000000000008c001 R12: 0000000000000000
R13: 0000000000000000 R14: ffff8880217bf680 R15: ffff88807ccb24d0
FS:  0000555557389300(0000) GS:ffff8880b9a00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000005d84c8 CR3: 0000000026706000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 strnlen include/linux/fortify-string.h:186 [inline]
 strscpy include/linux/fortify-string.h:331 [inline]
 gfs2_parse_param+0x1e6/0xe50 fs/gfs2/ops_fstype.c:1455
 vfs_parse_fs_param fs/fs_context.c:148 [inline]
 vfs_parse_fs_param+0x1f9/0x3c0 fs/fs_context.c:129
 vfs_parse_fs_string+0xdb/0x170 fs/fs_context.c:191
 generic_parse_monolithic+0x16f/0x1f0 fs/fs_context.c:231
 do_new_mount fs/namespace.c:3036 [inline]
 path_mount+0x12de/0x1e20 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fdafa8bc4ba
Code: 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe056c9ee8 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fdafa8bc4ba
RDX: 0000000020000080 RSI: 00000000200000c0 RDI: 00007ffe056c9f00
RBP: 00007ffe056c9f00 R08: 00007ffe056c9f40 R09: 00005555573892c0
R10: 000000000180c082 R11: 0000000000000282 R12: 0000000000000004
R13: 00007ffe056c9f40 R14: 0000000000000002 R15: 0000000020000330
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:strnlen+0x3b/0x70 lib/string.c:430
Code: 74 3c 48 bb 00 00 00 00 00 fc ff df 49 89 fc 48 89 f8 eb 09 48 83 c0 01 48 39 e8 74 1e 48 89 c2 48 89 c1 48 c1 ea 03 83 e1 07 <0f> b6 14 1a 38 ca 7f 04 84 d2 75 11 80 38 00 75 d9 4c 29 e0 48 83
RSP: 0018:ffffc90003b6fb40 EFLAGS: 00010246
RAX: 0000000000000000 RBX: dffffc0000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000040 RDI: 0000000000000000
RBP: 0000000000000040 R08: 0000000000000005 R09: 0000000000000017
R10: 0000000000000002 R11: 000000000008c001 R12: 0000000000000000
R13: 0000000000000000 R14: ffff8880217bf680 R15: ffff88807ccb24d0
FS:  0000555557389300(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000061ba0c CR3: 0000000026706000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	74 3c                	je     0x3e
   2:	48 bb 00 00 00 00 00 	movabs $0xdffffc0000000000,%rbx
   9:	fc ff df
   c:	49 89 fc             	mov    %rdi,%r12
   f:	48 89 f8             	mov    %rdi,%rax
  12:	eb 09                	jmp    0x1d
  14:	48 83 c0 01          	add    $0x1,%rax
  18:	48 39 e8             	cmp    %rbp,%rax
  1b:	74 1e                	je     0x3b
  1d:	48 89 c2             	mov    %rax,%rdx
  20:	48 89 c1             	mov    %rax,%rcx
  23:	48 c1 ea 03          	shr    $0x3,%rdx
  27:	83 e1 07             	and    $0x7,%ecx
* 2a:	0f b6 14 1a          	movzbl (%rdx,%rbx,1),%edx <-- trapping instruction
  2e:	38 ca                	cmp    %cl,%dl
  30:	7f 04                	jg     0x36
  32:	84 d2                	test   %dl,%dl
  34:	75 11                	jne    0x47
  36:	80 38 00             	cmpb   $0x0,(%rax)
  39:	75 d9                	jne    0x14
  3b:	4c 29 e0             	sub    %r12,%rax
  3e:	48                   	rex.W
  3f:	83                   	.byte 0x83


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

