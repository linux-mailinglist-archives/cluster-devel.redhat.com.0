Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B72A2648082
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Dec 2022 10:58:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670579893;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PqyL3Zkum56PasapztT6RN+h5AGYli3g1QCHsg94WBI=;
	b=R2T4N9JGImUKuVKMHslNHRTUCLOHo/Y3lAfWM3mB5PChmD807N95NZClFz68XjokoU4UNe
	qFiIE8eXX9M+c4bqbleQTNZafbWwp7p39svWWT0IAIwEDBXwwWK4Xxr7W6Acbngr4f30RV
	t4Qp+TYBGQsbhmiQkxbuBf/XkMVq9kg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-dguisEwSNU-hhBwRjNX2OA-1; Fri, 09 Dec 2022 04:58:10 -0500
X-MC-Unique: dguisEwSNU-hhBwRjNX2OA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EB6538041C1;
	Fri,  9 Dec 2022 09:58:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C00C40C6EC2;
	Fri,  9 Dec 2022 09:58:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1DA7D1946A7E;
	Fri,  9 Dec 2022 09:58:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0F95D1946A41 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  8 Dec 2022 14:05:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D31F71401C35; Thu,  8 Dec 2022 14:05:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBBAA140EBF5
 for <cluster-devel@redhat.com>; Thu,  8 Dec 2022 14:05:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B04FF3C0DDC1
 for <cluster-devel@redhat.com>; Thu,  8 Dec 2022 14:05:40 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-127-WcCJ-DYuOwm11jzvqMHzug-1; Thu, 08 Dec 2022 09:05:38 -0500
X-MC-Unique: WcCJ-DYuOwm11jzvqMHzug-1
Received: by mail-il1-f199.google.com with SMTP id
 h20-20020a056e021d9400b00300581edaa5so1211224ila.12
 for <cluster-devel@redhat.com>; Thu, 08 Dec 2022 06:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PqyL3Zkum56PasapztT6RN+h5AGYli3g1QCHsg94WBI=;
 b=lrgtHq+UmP6z3kd8AWweURoi/rLgyvYNjMJCvRrdqdAvHmvGv50gURI5NK40npPWLb
 h224T/Lgao9OSxxZrHbSGynic6wjtfs+DOQU6dJoPECTSoeWnEqJd3gyuxsoShfyXnVW
 AvSuBoCYz4I8wDkZSoYB0+lOjX+033IfV5cPLe8nSE4EYzmhcHkWK+eXUThIryRChPVc
 9t7xZuweghu2CtBLZbJKR3vXfTpUOSi024LL5HITnMq8N+Yle7TAGahWdmIYWPXWWfRJ
 rB2eT8Zj4i7iPGURMF8rtV2qHUlyw3oDfT0KNdErplcWLpjOOGiZdkt5LrlIHtHhpjsE
 aKrg==
X-Gm-Message-State: ANoB5pnb0jhxU2QSQVkfXfY2aCSqCNFFHI4pe97xBxW9ofjP+VIyuj+9
 +5XoPZQCMBxYi9eu+Hd7waoJuU0cJrdYkEbGt+BdoUz+//kp
X-Google-Smtp-Source: AA0mqf4NC10xoQLHDIb/AvSxp83JfjIpMb5WYdyyNf2pZegnWJtg706otHpOKYjcC+iDpIUNw+b5Nxr9iFcqfo46F/9e3MFY2I0n
MIME-Version: 1.0
X-Received: by 2002:a02:caad:0:b0:38a:682a:58fc with SMTP id
 e13-20020a02caad000000b0038a682a58fcmr3599373jap.250.1670508337345; Thu, 08
 Dec 2022 06:05:37 -0800 (PST)
Date: Thu, 08 Dec 2022 06:05:37 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000abae605ef518834@google.com>
From: syzbot <syzbot+2be9d17f9de2e7342994@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Fri, 09 Dec 2022 09:58:06 +0000
Subject: [Cluster-devel] [syzbot] general protection fault in gfs2_get_tree
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    591cd61541b9 Add linux-next specific files for 20221207
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=172b534d880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8b2d3e63e054c24f
dashboard link: https://syzkaller.appspot.com/bug?extid=2be9d17f9de2e7342994
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bc862c01ec56/disk-591cd615.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8f9b93f8ed2f/vmlinux-591cd615.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9d5cb636d548/bzImage-591cd615.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2be9d17f9de2e7342994@syzkaller.appspotmail.com

loop2: detected capacity change from 0 to 32768
general protection fault, probably for non-canonical address 0xdffffc000000001c: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x00000000000000e0-0x00000000000000e7]
CPU: 0 PID: 25472 Comm: syz-executor.2 Not tainted 6.1.0-rc8-next-20221207-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:gfs2_get_tree+0xb8/0x270 fs/gfs2/ops_fstype.c:1342
Code: 03 80 3c 02 00 0f 85 9f 01 00 00 4c 8b bb b0 00 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d bf e0 00 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 62 01 00 00 4d 8b b7 e0 00 00 00 48 b8 00 00 00
RSP: 0018:ffffc900068b7d50 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888036c15800 RCX: ffffc9001a7a1000
RDX: 000000000000001c RSI: ffffffff83925ec7 RDI: 00000000000000e0
RBP: ffff888076c83200 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff888036c158b0 R14: ffff888036c15800 R15: 0000000000000000
FS:  00007fa57f6a0700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f68252516b0 CR3: 00000000876a2000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 vfs_get_tree+0x8d/0x2f0 fs/super.c:1489
 do_new_mount fs/namespace.c:3145 [inline]
 path_mount+0x132a/0x1e20 fs/namespace.c:3475
 do_mount fs/namespace.c:3488 [inline]
 __do_sys_mount fs/namespace.c:3697 [inline]
 __se_sys_mount fs/namespace.c:3674 [inline]
 __x64_sys_mount+0x283/0x300 fs/namespace.c:3674
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fa57e88d60a
Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fa57f69ff88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00000000000133e6 RCX: 00007fa57e88d60a
RDX: 0000000020013400 RSI: 0000000020013440 RDI: 00007fa57f69ffe0
RBP: 00007fa57f6a0020 R08: 00007fa57f6a0020 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020013400
R13: 0000000020013440 R14: 00007fa57f69ffe0 R15: 00000000200000c0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:gfs2_get_tree+0xb8/0x270 fs/gfs2/ops_fstype.c:1342
Code: 03 80 3c 02 00 0f 85 9f 01 00 00 4c 8b bb b0 00 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d bf e0 00 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 62 01 00 00 4d 8b b7 e0 00 00 00 48 b8 00 00 00
RSP: 0018:ffffc900068b7d50 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888036c15800 RCX: ffffc9001a7a1000
RDX: 000000000000001c RSI: ffffffff83925ec7 RDI: 00000000000000e0
RBP: ffff888076c83200 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff888036c158b0 R14: ffff888036c15800 R15: 0000000000000000
FS:  00007fa57f6a0700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fbc0fb821b8 CR3: 00000000876a2000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	03 80 3c 02 00 0f    	add    0xf00023c(%rax),%eax
   6:	85 9f 01 00 00 4c    	test   %ebx,0x4c000001(%rdi)
   c:	8b bb b0 00 00 00    	mov    0xb0(%rbx),%edi
  12:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  19:	fc ff df
  1c:	49 8d bf e0 00 00 00 	lea    0xe0(%r15),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 62 01 00 00    	jne    0x196
  34:	4d 8b b7 e0 00 00 00 	mov    0xe0(%r15),%r14
  3b:	48                   	rex.W
  3c:	b8                   	.byte 0xb8
  3d:	00 00                	add    %al,(%rax)


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

