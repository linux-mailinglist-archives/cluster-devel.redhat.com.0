Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 902877666D9
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Jul 2023 10:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690532423;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lX6YGSoycaJbm4O7Y5pBxQR9v7vV+hm4ON2eudkCo74=;
	b=GOje5r7Abp7TW3ldL745T6Zw2nDVpEJXcAGcSlHosBHxuYEp+lhqj+bBRx3fqHsgEYyvXE
	8X8VX8iIDlP0D/zzAcxLG7t3vL+8GXQsQVmcIzawGvA9eY4E8DR1mcEiIkR88RGdCTJfoK
	/j6kT6bxoPYnvqkUbsOiOPDHd81YaZ8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-lu8IW5dUN7GMnNImo8tyrA-1; Fri, 28 Jul 2023 04:20:19 -0400
X-MC-Unique: lu8IW5dUN7GMnNImo8tyrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8BA11C04B61;
	Fri, 28 Jul 2023 08:20:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD4B11121330;
	Fri, 28 Jul 2023 08:20:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A88D31946A6E;
	Fri, 28 Jul 2023 08:20:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 631E31946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 28 Jul 2023 08:20:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D9EC546A3A7; Fri, 28 Jul 2023 08:20:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 87B18492C13;
 Fri, 28 Jul 2023 08:20:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <00000000000045a44b0601802056@google.com>
References: <00000000000045a44b0601802056@google.com>
To: syzbot <syzbot+607aa822c60b2e75b269@syzkaller.appspotmail.com>
MIME-Version: 1.0
Date: Fri, 28 Jul 2023 09:20:08 +0100
Message-ID: <200478.1690532408@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] kernel panic: hung_task:
 blocked tasks (2)
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
Cc: cluster-devel@redhat.com, arnd@arndb.de, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dhowells@redhat.com, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <200477.1690532408.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

syzbot <syzbot+607aa822c60b2e75b269@syzkaller.appspotmail.com> wrote:

> Fixes: 9c8ad7a2ff0b ("uapi, x86: Fix the syscall numbering of the mount A=
PI syscalls [ver #2]")

This would seem unlikely to be the culprit.  It just changes the numbering =
on
the fsconfig-related syscalls.

Running the test program on v6.5-rc3, however, I end up with the test proce=
ss
stuck in the D state:

INFO: task repro-17687f1aa:5551 blocked for more than 120 seconds.
      Not tainted 6.5.0-rc3-build3+ #1448
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:repro-17687f1aa state:D stack:0     pid:5551  ppid:5516   flags:0x0000=
4002
Call Trace:
 <TASK>
 __schedule+0x4a7/0x4f1
 schedule+0x66/0xa1
 schedule_timeout+0x9d/0xd7
 ? __next_timer_interrupt+0xf6/0xf6
 gfs2_gl_hash_clear+0xa0/0xdc
 ? sugov_irq_work+0x15/0x15
 gfs2_put_super+0x19f/0x1d3
 generic_shutdown_super+0x78/0x187
 kill_block_super+0x1c/0x32
 deactivate_locked_super+0x2f/0x61
 cleanup_mnt+0xab/0xcc
 task_work_run+0x6b/0x80
 exit_to_user_mode_prepare+0x76/0xfd
 syscall_exit_to_user_mode+0x14/0x31
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f89aac31dab
RSP: 002b:00007fff43d9b878 EFLAGS: 00000206 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007fff43d9cad8 RCX: 00007f89aac31dab
RDX: 0000000000000000 RSI: 000000000000000a RDI: 00007fff43d9b920
RBP: 00007fff43d9c960 R08: 0000000000000000 R09: 0000000000000073
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 00007fff43d9cae8 R14: 0000000000417e18 R15: 00007f89aad51000
 </TASK>

David

