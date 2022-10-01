Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F395F3158
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Oct 2022 15:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664804302;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=LUy/tjvgRCWhk1HECUhsa9oaVDHitFE+5z0QHJIJrDk=;
	b=hKOTXVNZ3VESx3e3tjjPN+Uy2hRaFeD7lXVjZ8uP9oBAZla4m4qg6hJTd0KSvJHEobf4zl
	lQch5yXlW06dnbr0x/h1paBq8lRNpZW3bFsAveSi9uBb+oLbeK+Y83x7Q3CChLVFhwqN3S
	AZKQny8AF9RjlxDzlHXgH42kk2Pggd4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-UTF0Fzs8O7atIKxzcQl8VQ-1; Mon, 03 Oct 2022 09:38:21 -0400
X-MC-Unique: UTF0Fzs8O7atIKxzcQl8VQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D6D1882822;
	Mon,  3 Oct 2022 13:38:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 07CCE40C6EC2;
	Mon,  3 Oct 2022 13:38:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C6A4194658C;
	Mon,  3 Oct 2022 13:38:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 563711946588 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  1 Oct 2022 14:25:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 36B9E40C6EC4; Sat,  1 Oct 2022 14:25:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FA9740C6EC2
 for <cluster-devel@redhat.com>; Sat,  1 Oct 2022 14:25:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A041855427
 for <cluster-devel@redhat.com>; Sat,  1 Oct 2022 14:25:44 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-34-SBvspysaPCK3NnWVsWVEzQ-1; Sat, 01 Oct 2022 10:25:40 -0400
X-MC-Unique: SBvspysaPCK3NnWVsWVEzQ-1
Received: by mail-il1-f197.google.com with SMTP id
 x3-20020a056e021ca300b002f855cd264cso5396641ill.7
 for <cluster-devel@redhat.com>; Sat, 01 Oct 2022 07:25:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=LUy/tjvgRCWhk1HECUhsa9oaVDHitFE+5z0QHJIJrDk=;
 b=ahEHMTaEKVx/svsz4QhlvPXH3Y6cZxQGLM2/sHgF21Ale8U9ywtIgEh4/p6hOX70po
 eFGmHSXdjSgqkKCKawxlSEMUkaww/BbQLnk4nL2y+2zC/OHnpHNasEVrk9trxB50+9OW
 kdhYVfsIQdrKNoOQjI6R8FwnJnI7oMQ1J3F+GePF4ijlBzYMjpO/lV10l0q6R9AzXFru
 i0S1aK71Pe+l6owyH23lzcSnVZtKxZiBEvXwDjLMFg9xpmp0VzbjEsPE5gHKJO0nnypC
 8lIh3+a2T6ESB4Fi+8nHhHUtWBGPOZyapWGD7g/hSJuBpzUfKvZlGMw4AIa3mIT2vTW+
 42eg==
X-Gm-Message-State: ACrzQf2XopvPwPvqWZJzPWSXhIk0daaW4AOO7tW86Prex8Ws+sfKseCG
 R3t360fOU6Eq+yz97rY4gaEYXBlscRAcc1QEA/W4cp5E91Uq
X-Google-Smtp-Source: AMsMyM6QKDLIC0PEuC4WQgqNd8jC5wM3xSN89nX9Vre8+QjKAjWbAv3v8+bW8779T+Td2OpQiO7PwTbGNPFGt25H6giu/pZqPCGM
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:16ce:b0:2f9:253c:d3f3 with SMTP id
 14-20020a056e0216ce00b002f9253cd3f3mr6215809ilx.56.1664634339957; Sat, 01 Oct
 2022 07:25:39 -0700 (PDT)
Date: Sat, 01 Oct 2022 07:25:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000839ff805e9f9e286@google.com>
From: syzbot <syzbot+ececff266234ba40fe13@syzkaller.appspotmail.com>
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
X-Mailman-Approved-At: Mon, 03 Oct 2022 13:38:16 +0000
Subject: [Cluster-devel] [syzbot] general protection fault in do_xmote
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

HEAD commit:    c3e0e1e23c70 Merge tag 'irq_urgent_for_v6.0' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11664a70880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a1992c90769e07
dashboard link: https://syzkaller.appspot.com/bug?extid=ececff266234ba40fe13
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ececff266234ba40fe13@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000097: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x00000000000004b8-0x00000000000004bf]
CPU: 2 PID: 70 Comm: kworker/2:1H Not tainted 6.0.0-rc7-syzkaller-00081-gc3e0e1e23c70 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
Workqueue: glock_workqueue glock_work_func
RIP: 0010:is_system_glock fs/gfs2/glock.c:720 [inline]
RIP: 0010:do_xmote+0x492/0xc40 fs/gfs2/glock.c:828
Code: 03 80 3c 02 00 0f 85 2f 07 00 00 4d 8b ad 18 07 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d bd b8 04 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 ed 06 00 00 49 3b ad b8 04 00 00 0f 84 77 05 00
RSP: 0018:ffffc90000aa7c50 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888027624000 RCX: 0000000000000000
RDX: 0000000000000097 RSI: ffffffff8381e370 RDI: 00000000000004b8
RBP: ffff888074ceea90 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: ffff888074ceeaf8 R15: ffff888074ceeab0
FS:  0000000000000000(0000) GS:ffff88802ca00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000990140 CR3: 0000000076461000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 run_queue+0x3cf/0x660 fs/gfs2/glock.c:893
 glock_work_func+0xbe/0x3a0 fs/gfs2/glock.c:1059
 process_one_work+0x991/0x1610 kernel/workqueue.c:2289
 worker_thread+0x665/0x1080 kernel/workqueue.c:2436
 kthread+0x2e4/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:is_system_glock fs/gfs2/glock.c:720 [inline]
RIP: 0010:do_xmote+0x492/0xc40 fs/gfs2/glock.c:828
Code: 03 80 3c 02 00 0f 85 2f 07 00 00 4d 8b ad 18 07 00 00 48 b8 00 00 00 00 00 fc ff df 49 8d bd b8 04 00 00 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 ed 06 00 00 49 3b ad b8 04 00 00 0f 84 77 05 00
RSP: 0018:ffffc90000aa7c50 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888027624000 RCX: 0000000000000000
RDX: 0000000000000097 RSI: ffffffff8381e370 RDI: 00000000000004b8
RBP: ffff888074ceea90 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: ffff888074ceeaf8 R15: ffff888074ceeab0
FS:  0000000000000000(0000) GS:ffff88802ca00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000990140 CR3: 0000000076461000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess), 1 bytes skipped:
   0:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   4:	0f 85 2f 07 00 00    	jne    0x739
   a:	4d 8b ad 18 07 00 00 	mov    0x718(%r13),%r13
  11:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  18:	fc ff df
  1b:	49 8d bd b8 04 00 00 	lea    0x4b8(%r13),%rdi
  22:	48 89 fa             	mov    %rdi,%rdx
  25:	48 c1 ea 03          	shr    $0x3,%rdx
* 29:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2d:	0f 85 ed 06 00 00    	jne    0x720
  33:	49 3b ad b8 04 00 00 	cmp    0x4b8(%r13),%rbp
  3a:	0f                   	.byte 0xf
  3b:	84 77 05             	test   %dh,0x5(%rdi)


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

