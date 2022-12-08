Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23658648081
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Dec 2022 10:58:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670579893;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pBlwNfuWu0nLKa++Wb5lWHNyk3e/TtAitunaS8JJcWg=;
	b=YAyEsyr+G6klsu7PlHbwFBBkH3SgKSjmfuABCFpZ5aVHTtv+XmksrIwM9ny3v3WSRBhEwd
	zeYOshyVJk26FG7RbwE/Cc+JzWrJzwg6G+OKGLIEwNa2L4tA0JGFr5wFrMDL7XcluHQW+9
	lf+2aOGPN04J9gvbngtYE8dEK3/V8y8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-Rpphhq2oPG6_vlxvGeFHPQ-1; Fri, 09 Dec 2022 04:58:09 -0500
X-MC-Unique: Rpphhq2oPG6_vlxvGeFHPQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EC9A3C0D85E;
	Fri,  9 Dec 2022 09:58:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 686F940C6EC3;
	Fri,  9 Dec 2022 09:58:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2B2C91947049;
	Fri,  9 Dec 2022 09:58:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 33BFC1946A41 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  8 Dec 2022 22:30:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CAF6840C6EC3; Thu,  8 Dec 2022 22:30:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C353740C6EC2
 for <cluster-devel@redhat.com>; Thu,  8 Dec 2022 22:30:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A620A806002
 for <cluster-devel@redhat.com>; Thu,  8 Dec 2022 22:30:44 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-70-YIa6TErwMXKLjISqTIm9vQ-1; Thu, 08 Dec 2022 17:30:40 -0500
X-MC-Unique: YIa6TErwMXKLjISqTIm9vQ-1
Received: by mail-il1-f197.google.com with SMTP id
 x10-20020a056e021bca00b00302b6c0a683so2512048ilv.23
 for <cluster-devel@redhat.com>; Thu, 08 Dec 2022 14:30:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pBlwNfuWu0nLKa++Wb5lWHNyk3e/TtAitunaS8JJcWg=;
 b=SLRh1pxJvTVspFd8lZZU0o1GvsYRHbP+0H0EVY9IhwLwUlJj/ZEuDR8NVkP49GWm9T
 UkPIq9UzJZ4JCSSW+vi85G5qFjY4NXSUbVft8d1T7E+vXfJycUvn8dMUuWR/eVRZJ8RT
 2TkASQ+XdcfgAgCsYW9tHTCGu1FB6tB54MnmFOLY5zbm9SlLXxU9AFUAPcrMOyrKsY0b
 3LWvIoEnag/eNALl3t9Udxcs5aV2jv667MFKqwnDwQktufsHzgNlVrudSr2Jks1PSMVN
 Wigu3Sq57SfisdGg/wxQIe7vVphhw5yfWEYmC7zR8WXPp9UqbuOgxzLTGZAaq79slNe5
 eozw==
X-Gm-Message-State: ANoB5pmC4/BVplhbVtTsbPszsZRz7wrq2V+CeMJaGaKyhbLG+Ut/HVev
 xGjZ2FE3uAQtd8IuarpeQZJ1JQTuU/OIzrK+JAMtKSaeN0kd
X-Google-Smtp-Source: AA0mqf5ykD7HaKCRFlyntLM6zVK4sacyTDvAn4f46YyAhYyI377ryl1vIldDN73iRjZQ2NRt+lpYJ4LfmvM4mk2xLFzcpvpU+dmp
MIME-Version: 1.0
X-Received: by 2002:a05:6638:4122:b0:38a:5e91:5d49 with SMTP id
 ay34-20020a056638412200b0038a5e915d49mr5356228jab.147.1670538640191; Thu, 08
 Dec 2022 14:30:40 -0800 (PST)
Date: Thu, 08 Dec 2022 14:30:40 -0800
In-Reply-To: <0000000000000abae605ef518834@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003b777e05ef58961d@google.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Fri, 09 Dec 2022 09:58:06 +0000
Subject: Re: [Cluster-devel] [syzbot] general protection fault in
 gfs2_get_tree
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    591cd61541b9 Add linux-next specific files for 20221207
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=10edd843880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8b2d3e63e054c24f
dashboard link: https://syzkaller.appspot.com/bug?extid=2be9d17f9de2e7342994
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10dfde7d880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bc862c01ec56/disk-591cd615.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8f9b93f8ed2f/vmlinux-591cd615.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9d5cb636d548/bzImage-591cd615.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/d4c744809640/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2be9d17f9de2e7342994@syzkaller.appspotmail.com

loop1: detected capacity change from 0 to 32768
general protection fault, probably for non-canonical address 0xdffffc000000001c: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x00000000000000e0-0x00000000000000e7]
CPU: 1 PID: 5330 Comm: syz-executor.1 Not tainted 6.1.0-rc8-next-20221207-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:gfs2_get_tree+0xb8/0x270 fs/gfs2/ops_fstype.c:1342
Code: 03 80 3c 02 00 0f 85 9f 01 00 00 4c 8b bb b0 00 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d bf e0 00 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 62 01 00 00 4d 8b b7 e0 00 00 00 48 b8 00 00 00
RSP: 0018:ffffc900049a7d50 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff88802319c000 RCX: 0000000000000000
RDX: 000000000000001c RSI: ffffffff83925ec7 RDI: 00000000000000e0
RBP: ffff88807bed3800 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000094001 R12: 0000000000000000
R13: ffff88802319c0b0 R14: ffff88802319c000 R15: 0000000000000000
FS:  00007f687e332700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f27ec317000 CR3: 0000000021f43000 CR4: 00000000003506e0
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
RIP: 0033:0x7f687d68d60a
Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f687e331f88 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00000000000133e6 RCX: 00007f687d68d60a
RDX: 0000000020013400 RSI: 0000000020013440 RDI: 00007f687e331fe0
RBP: 00007f687e332020 R08: 00007f687e332020 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000020013400
R13: 0000000020013440 R14: 00007f687e331fe0 R15: 00000000200000c0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:gfs2_get_tree+0xb8/0x270 fs/gfs2/ops_fstype.c:1342
Code: 03 80 3c 02 00 0f 85 9f 01 00 00 4c 8b bb b0 00 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d bf e0 00 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 62 01 00 00 4d 8b b7 e0 00 00 00 48 b8 00 00 00
RSP: 0018:ffffc900049a7d50 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff88802319c000 RCX: 0000000000000000
RDX: 000000000000001c RSI: ffffffff83925ec7 RDI: 00000000000000e0
RBP: ffff88807bed3800 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000094001 R12: 0000000000000000
R13: ffff88802319c0b0 R14: ffff88802319c000 R15: 0000000000000000
FS:  00007f687e332700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe54d4e8000 CR3: 0000000021f43000 CR4: 00000000003506e0
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

