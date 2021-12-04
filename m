Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6D4469657
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Dec 2021 14:09:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-Hh317IBnNLmXtf0ACJvu6A-1; Mon, 06 Dec 2021 08:09:35 -0500
X-MC-Unique: Hh317IBnNLmXtf0ACJvu6A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2406F802924;
	Mon,  6 Dec 2021 13:09:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14C1722DEF;
	Mon,  6 Dec 2021 13:09:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F8551809C88;
	Mon,  6 Dec 2021 13:09:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B49sKv0015342 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 4 Dec 2021 04:54:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5EAF9C15E73; Sat,  4 Dec 2021 09:54:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A1EDC15E6F
	for <cluster-devel@redhat.com>; Sat,  4 Dec 2021 09:54:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FB8E811E76
	for <cluster-devel@redhat.com>; Sat,  4 Dec 2021 09:54:20 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-85-hGnbBf7BN9un5d_ayfLLzg-1; Sat, 04 Dec 2021 04:54:18 -0500
X-MC-Unique: hGnbBf7BN9un5d_ayfLLzg-1
Received: by mail-io1-f70.google.com with SMTP id
	z21-20020a5e8615000000b005e22e531c8aso4422694ioj.13
	for <cluster-devel@redhat.com>; Sat, 04 Dec 2021 01:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=6BRacZEyRxHIlxqM1e6e2FDlog/Bi3Tc4ToxnAE9B0k=;
	b=T996rV1nPBusT9eDXOGzr69u7elOkHTTQwFAdNGZIcYbLqXc9oteXAHr4GTNBwrZ4h
	8Ncf3FFUisWIVN0qvBOLfNu6jfyU3bv5gLOIGK/3tIHYUGlbGS+enSMzekCW3ucq0YiT
	ax7pLQe3jipU1+2+fwZWR3kmTh5UGi5WOxDTXA2c3uJ5xe+l+zkiBtpnQ+qbArPB0Jq5
	SSAAdAqsrCqxOgeFHp2r+GHN+2f63psZeFZXS3lv+lXlRwwbdoqdkXIbK8xX0XeDIRKd
	3b0eRMfV7dNQd8ievgRky0WU5JKuK6N0vDcrnQC2zjQn931j566lt8qDu1HoudIoZd2e
	NDMQ==
X-Gm-Message-State: AOAM531pMVlIdCgjkItahQNmxGN8t2iUjgBy1sFCEIxbquZO+cirUnz6
	kvsc6hzglP+YXqz6p13NwByAAffkV7mTgYaLiL5r8FLiNzxG
X-Google-Smtp-Source: ABdhPJxy225ujbxOgiVYY383gQxMBC7YzeQDVWfjE9PAI2gtRB/9YTxe4uS9uKXLFWPDZV8fDfAAfpWOUit2s3ZM8/PEFq2EmazO
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b01:: with SMTP id
	i1mr20369909ilv.94.1638611657660; 
	Sat, 04 Dec 2021 01:54:17 -0800 (PST)
Date: Sat, 04 Dec 2021 01:54:17 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c79f2605d24f0151@google.com>
From: syzbot <syzbot+f77e2d1dc867b6accaf9@syzkaller.appspotmail.com>
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
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 Dec 2021 08:07:23 -0500
Subject: [Cluster-devel] [syzbot] general protection fault in
	gfs2_evict_inode
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d4439a1189f9 Merge tag 'hsi-for-5.16' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13fae7cab00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f2760850058fbfb
dashboard link: https://syzkaller.appspot.com/bug?extid=f77e2d1dc867b6accaf9
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f77e2d1dc867b6accaf9@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000206 R12: 0000000020000000
R13: 0000000020000100 R14: 00007f4836721000 R15: 0000000020047a20
 </TASK>
gfs2: fsid=syz:syz.0: can't read journal index: -5
general protection fault, probably for non-canonical address 0xdffffc0000000011: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000088-0x000000000000008f]
CPU: 1 PID: 25372 Comm: syz-executor.3 Not tainted 5.15.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:evict_linked_inode fs/gfs2/super.c:1331 [inline]
RIP: 0010:gfs2_evict_inode+0xbe2/0x2070 fs/gfs2/super.c:1386
Code: 03 80 3c 02 00 0f 85 d0 13 00 00 48 8b 9d 00 09 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bb 8c 00 00 00 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 09 84 d2 74 05 e8
RSP: 0018:ffffc90009bb77c8 EFLAGS: 00010217
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffc9000b53c000
RDX: 0000000000000011 RSI: ffffffff836c5f71 RDI: 000000000000008c
RBP: ffff88803ae28000 R08: 0000000000000000 R09: ffff88807115fb43
R10: ffffffff83666100 R11: 0000000000000000 R12: 0000000000000001
R13: ffff88807115fcb8 R14: ffff8880959e5cd8 R15: ffff8880959e5828
FS:  00007f4836721700(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2fb011f000 CR3: 0000000022ee7000 CR4: 0000000000350ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000600
Call Trace:
 <TASK>
 evict+0x2ed/0x6b0 fs/inode.c:588
 iput_final fs/inode.c:1664 [inline]
 iput.part.0+0x539/0x850 fs/inode.c:1690
 iput+0x58/0x70 fs/inode.c:1680
 dentry_unlink_inode+0x2b1/0x460 fs/dcache.c:376
 __dentry_kill+0x3c0/0x640 fs/dcache.c:582
 dentry_kill fs/dcache.c:708 [inline]
 dput+0x738/0xbc0 fs/dcache.c:888
 gfs2_fill_super+0x2048/0x28a0 fs/gfs2/ops_fstype.c:1296
 get_tree_bdev+0x440/0x760 fs/super.c:1293
 gfs2_get_tree+0x4a/0x270 fs/gfs2/ops_fstype.c:1327
 vfs_get_tree+0x89/0x2f0 fs/super.c:1498
 do_new_mount fs/namespace.c:2988 [inline]
 path_mount+0x1320/0x1fa0 fs/namespace.c:3318
 do_mount fs/namespace.c:3331 [inline]
 __do_sys_mount fs/namespace.c:3539 [inline]
 __se_sys_mount fs/namespace.c:3516 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3516
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f48391ad01a
Code: 48 c7 c2 bc ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4836720fa8 EFLAGS: 00000206 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 00007f48391ad01a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f4836721000
RBP: 00007f4836721040 R08: 00007f4836721040 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000020000000
R13: 0000000020000100 R14: 00007f4836721000 R15: 0000000020047a20
 </TASK>
Modules linked in:
---[ end trace 68c9d12f167f0520 ]---
RIP: 0010:evict_linked_inode fs/gfs2/super.c:1331 [inline]
RIP: 0010:gfs2_evict_inode+0xbe2/0x2070 fs/gfs2/super.c:1386
Code: 03 80 3c 02 00 0f 85 d0 13 00 00 48 8b 9d 00 09 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bb 8c 00 00 00 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 09 84 d2 74 05 e8
RSP: 0018:ffffc90009bb77c8 EFLAGS: 00010217
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffc9000b53c000
RDX: 0000000000000011 RSI: ffffffff836c5f71 RDI: 000000000000008c
RBP: ffff88803ae28000 R08: 0000000000000000 R09: ffff88807115fb43
R10: ffffffff83666100 R11: 0000000000000000 R12: 0000000000000001
R13: ffff88807115fcb8 R14: ffff8880959e5cd8 R15: ffff8880959e5828
FS:  00007f4836721700(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2fb011f000 CR3: 0000000022ee7000 CR4: 0000000000350ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000600
----------------
Code disassembly (best guess):
   0:	03 80 3c 02 00 0f    	add    0xf00023c(%rax),%eax
   6:	85 d0                	test   %edx,%eax
   8:	13 00                	adc    (%rax),%eax
   a:	00 48 8b             	add    %cl,-0x75(%rax)
   d:	9d                   	popfq
   e:	00 09                	add    %cl,(%rcx)
  10:	00 00                	add    %al,(%rax)
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
  39:	7c 09                	jl     0x44
  3b:	84 d2                	test   %dl,%dl
  3d:	74 05                	je     0x44
  3f:	e8                   	.byte 0xe8


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

