Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 024F664B9D8
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Dec 2022 17:34:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670949187;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Nzcefoxpg77f8NRJkj+YK7P0MI1lkm4SAhWKpjm0eRA=;
	b=Ok3GxOuB7RQYgagg/1nRhRIL7Z/vXFtYICjc59NLao+XZ8R5MMLWgNCaEoH/JqJ5E108g9
	sZ5sdB9AfrqhRpVu524RVA+WBubAyvxVR9q5r4eV/G/cacyUKd6qy56ykgviQqt7b9jVth
	khSxUXBvdnkvjUva8wl1VZ2qiatICNw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-30-fEOvoLDWOSa0KoyX9kvkrQ-1; Tue, 13 Dec 2022 11:33:04 -0500
X-MC-Unique: fEOvoLDWOSa0KoyX9kvkrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 389F11C087A1;
	Tue, 13 Dec 2022 16:33:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 763B42026D68;
	Tue, 13 Dec 2022 16:33:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6AA2619465A0;
	Tue, 13 Dec 2022 16:32:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2396A1946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 13 Dec 2022 11:42:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B23A22026D76; Tue, 13 Dec 2022 11:42:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AAF6C2026D68
 for <cluster-devel@redhat.com>; Tue, 13 Dec 2022 11:42:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CF13803D4B
 for <cluster-devel@redhat.com>; Tue, 13 Dec 2022 11:42:39 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-348-SVh9obtjPGm2KBFiUA2ZMA-1; Tue, 13 Dec 2022 06:42:37 -0500
X-MC-Unique: SVh9obtjPGm2KBFiUA2ZMA-1
Received: by mail-io1-f70.google.com with SMTP id
 l22-20020a05660227d600b006dfa191ca8aso1692562ios.20
 for <cluster-devel@redhat.com>; Tue, 13 Dec 2022 03:42:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nzcefoxpg77f8NRJkj+YK7P0MI1lkm4SAhWKpjm0eRA=;
 b=f7qCWtodO7dPZRd5YlXWmjPcbvv6n9mlmroQmXRI8e55QylooettiTEhCHWpyhudQA
 3gvcga3cwyADh+OZW34yViGlTK26MBkdqscxKluCFvBYVw9RQNmsv5WoRHQfNeayOLm8
 9EzoJCn3jIWTO7/x9O0DKuqTz7Ca3NY1dv8WOYWBK78MwjEfiVAXUYqI09leMrR04K2q
 XrSmd/rRAqbHhq+x793X3wAJDIhuEC8uhb7oS6v2m65fLHIIo92oCp6JMHIyM097nIWP
 OfShGkN3lk0G6DWjZquIqjnLYBFEA/nL2RwtlWeL97LlfM7g/B+EbWg6Gm5JDoKSyrpD
 h/EA==
X-Gm-Message-State: ANoB5pnEx0b5FY677VBoHPkm8pL9yxBCvzXbd08+1LWUCb1NDKxd8aM/
 4/VHecIiBBzdju6iwMYmdYK373wk7uyahH632/dDucgt8Scu
X-Google-Smtp-Source: AA0mqf6pWHrieU2RXJM1g31rjSEXEFbmUh7tFyfL9gEtfq7Vz9eE+FxGQKfblbb5LNXMIi5O23gZQ98OEUJOqZmxjBHfCW6X4JS9
MIME-Version: 1.0
X-Received: by 2002:a6b:d117:0:b0:6a3:a0cf:ea32 with SMTP id
 l23-20020a6bd117000000b006a3a0cfea32mr37861276iob.155.1670931757069; Tue, 13
 Dec 2022 03:42:37 -0800 (PST)
Date: Tue, 13 Dec 2022 03:42:37 -0800
In-Reply-To: <000000000000839ff805e9f9e286@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d2fe7205efb41d2c@google.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Tue, 13 Dec 2022 16:32:52 +0000
Subject: Re: [Cluster-devel] [syzbot] general protection fault in do_xmote
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    764822972d64 Merge tag 'nfsd-6.2' of git://git.kernel.org/..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1428fb0b880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c59170b68d26a55
dashboard link: https://syzkaller.appspot.com/bug?extid=ececff266234ba40fe13
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14ce69c0480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1016950b880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0c840c19749d/disk-76482297.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bdfd51618ae0/vmlinux-76482297.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fef17b5d4d6d/bzImage-76482297.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/a114b1cb5db6/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ececff266234ba40fe13@syzkaller.appspotmail.com

general protection fault, probably for non-canonical address 0xdffffc0000000097: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x00000000000004b8-0x00000000000004bf]
CPU: 1 PID: 1273 Comm: kworker/1:1H Not tainted 6.1.0-syzkaller-03225-g764822972d64 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Workqueue: glock_workqueue glock_work_func
RIP: 0010:is_system_glock fs/gfs2/glock.c:725 [inline]
RIP: 0010:do_xmote+0xdde/0x13d0 fs/gfs2/glock.c:835
Code: 00 48 03 5d 00 48 89 d8 48 c1 e8 03 42 80 3c 30 00 74 08 48 89 df e8 91 e1 27 fe bd b8 04 00 00 48 03 2b 48 89 e8 48 c1 e8 03 <42> 80 3c 30 00 74 08 48 89 ef e8 73 e1 27 fe 4c 8b 64 24 08 4c 39
RSP: 0018:ffffc900061a7b70 EFLAGS: 00010202
RAX: 0000000000000097 RBX: ffff888021dd8718 RCX: ffff888021c93a80
RDX: 0000000000000000 RSI: 0000000000004000 RDI: 0000000000000000
RBP: 00000000000004b8 R08: ffffffff83b7d986 R09: ffffed10043bb016
R10: ffffed10043bb016 R11: 1ffff110043bb015 R12: ffff888075bf0548
R13: 0000000000000818 R14: dffffc0000000000 R15: ffff888021dd8000
FS:  0000000000000000(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020002080 CR3: 000000007a61b000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 glock_work_func+0x2c2/0x450 fs/gfs2/glock.c:1082
 process_one_work+0x877/0xdb0 kernel/workqueue.c:2289
 worker_thread+0xb14/0x1330 kernel/workqueue.c:2436
 kthread+0x266/0x300 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:is_system_glock fs/gfs2/glock.c:725 [inline]
RIP: 0010:do_xmote+0xdde/0x13d0 fs/gfs2/glock.c:835
Code: 00 48 03 5d 00 48 89 d8 48 c1 e8 03 42 80 3c 30 00 74 08 48 89 df e8 91 e1 27 fe bd b8 04 00 00 48 03 2b 48 89 e8 48 c1 e8 03 <42> 80 3c 30 00 74 08 48 89 ef e8 73 e1 27 fe 4c 8b 64 24 08 4c 39
RSP: 0018:ffffc900061a7b70 EFLAGS: 00010202
RAX: 0000000000000097 RBX: ffff888021dd8718 RCX: ffff888021c93a80
RDX: 0000000000000000 RSI: 0000000000004000 RDI: 0000000000000000
RBP: 00000000000004b8 R08: ffffffff83b7d986 R09: ffffed10043bb016
R10: ffffed10043bb016 R11: 1ffff110043bb015 R12: ffff888075bf0548
R13: 0000000000000818 R14: dffffc0000000000 R15: ffff888021dd8000
FS:  0000000000000000(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000020002080 CR3: 000000007e6e4000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	00 48 03             	add    %cl,0x3(%rax)
   3:	5d                   	pop    %rbp
   4:	00 48 89             	add    %cl,-0x77(%rax)
   7:	d8 48 c1             	fmuls  -0x3f(%rax)
   a:	e8 03 42 80 3c       	callq  0x3c804212
   f:	30 00                	xor    %al,(%rax)
  11:	74 08                	je     0x1b
  13:	48 89 df             	mov    %rbx,%rdi
  16:	e8 91 e1 27 fe       	callq  0xfe27e1ac
  1b:	bd b8 04 00 00       	mov    $0x4b8,%ebp
  20:	48 03 2b             	add    (%rbx),%rbp
  23:	48 89 e8             	mov    %rbp,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1) <-- trapping instruction
  2f:	74 08                	je     0x39
  31:	48 89 ef             	mov    %rbp,%rdi
  34:	e8 73 e1 27 fe       	callq  0xfe27e1ac
  39:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
  3e:	4c                   	rex.WR
  3f:	39                   	.byte 0x39

