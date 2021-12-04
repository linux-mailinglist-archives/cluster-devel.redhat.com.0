Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 788BA469652
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Dec 2021 14:08:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-KeNC92cmNMGxAPxolw_uNA-1; Mon, 06 Dec 2021 08:08:42 -0500
X-MC-Unique: KeNC92cmNMGxAPxolw_uNA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F37D685C710;
	Mon,  6 Dec 2021 13:08:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 056BE5DF4C;
	Mon,  6 Dec 2021 13:08:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E34971809CB8;
	Mon,  6 Dec 2021 13:08:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B49JSCI012692 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 4 Dec 2021 04:19:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3026A4047279; Sat,  4 Dec 2021 09:19:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C2CB4047272
	for <cluster-devel@redhat.com>; Sat,  4 Dec 2021 09:19:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13E9F803DDA
	for <cluster-devel@redhat.com>; Sat,  4 Dec 2021 09:19:28 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
	[209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-418-W9-Yj4OrNWy1G9qdUvyrcg-1; Sat, 04 Dec 2021 04:19:25 -0500
X-MC-Unique: W9-Yj4OrNWy1G9qdUvyrcg-1
Received: by mail-io1-f72.google.com with SMTP id
	a12-20020a056602148c00b005e7052734adso4353357iow.20
	for <cluster-devel@redhat.com>; Sat, 04 Dec 2021 01:19:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=9ll2+dv6txvyVBKMGb7oQG6GSRkmh/UPBroYyDqMQMQ=;
	b=379IlSlJpN3Lsj/f++XnmJZUsv9lN2FS4TbFhPqHQI9qgO/8dLsU8uNEBeEO0YpQyd
	ZJel0uKvrG3q8e49gP9/HCU9vjPhSOO0XEwb/BCJW585CUhkAx59apG+OntGCBCDPuoE
	5zAx73qbKbU2ilbs9uvjtDzCWOJxJW0VlI242wWSIezBJi+NwcMCGVN0n4HJeI023a/T
	pcdnwK56zvXSidYkiR4ofKmoRVivzgbte8cTwyAi6rAFJwQB84aSbH/UKHWDGh/UBASf
	fIxvZ+aTsvD4kjLY8YN47mPt8OW+ylFHDE45n1+GQ7kU+SfL/EhHcdajubJJupaKyWO8
	D3fQ==
X-Gm-Message-State: AOAM5323llKqAnyeEdj3Jp9Yy488V3H1Impd7v1Ho4CzZ5OGgBYbY+44
	whYaUyoyXw74aaSiU3Jn/N+0J/z/RAqVLfe7A35DGgYO+2ML
X-Google-Smtp-Source: ABdhPJzHEszPnN9doH77fkVKgrJMr3P35YJku9R85MwB5eYC4vNlRDLBe+bo5ZAcJ8msQRRQFqOQvIizPmRKqVf+eBbqySTmWxdJ
MIME-Version: 1.0
X-Received: by 2002:a92:cc50:: with SMTP id t16mr20865092ilq.88.1638609564535; 
	Sat, 04 Dec 2021 01:19:24 -0800 (PST)
Date: Sat, 04 Dec 2021 01:19:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000512d405d24e8531@google.com>
From: syzbot <syzbot+96502fc81e6d27a52341@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 Dec 2021 08:07:23 -0500
Subject: [Cluster-devel] [syzbot] kernel BUG in gfs2_glock_nq
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    136057256686 Linux 5.16-rc2
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15bda5b2b00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bf85c53718a1e697
dashboard link: https://syzkaller.appspot.com/bug?extid=96502fc81e6d27a52341
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+96502fc81e6d27a52341@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: G:  s:EX n:8/1 f:qb t:EX d:EX/0 a:0 v:0 r:5 m:20 p:0
gfs2: fsid=syz:syz.0:  H: s:EX f:cH e:0 p:3725 [syz-executor.1] gfs2_quota_sync+0x2e2/0x660 fs/gfs2/quota.c:1310
------------[ cut here ]------------
kernel BUG at fs/gfs2/glock.c:1548!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 3725 Comm: syz-executor.1 Not tainted 5.16.0-rc2-syzkaller #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
RIP: 0010:add_to_queue fs/gfs2/glock.c:1548 [inline]
RIP: 0010:gfs2_glock_nq.cold+0x2a1/0x2fa fs/gfs2/glock.c:1572
Code: 74 04 3c 03 7e 76 8b 53 18 44 89 e9 4c 89 f6 48 c7 c7 60 58 f6 89 e8 88 3d f3 ff ba 01 00 00 00 4c 89 e6 31 ff e8 10 aa 57 fa <0f> 0b e8 19 64 af f8 4c 8b 04 24 e9 7f fd ff ff 45 31 ff e9 fc fd
RSP: 0000:ffffc90001f1fae8 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff88806f9aec80 RCX: 0000000000000000
RDX: ffff88804b334240 RSI: ffffffff83656106 RDI: ffffffff89f68dc8
RBP: ffff888018610238 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff836560b2 R11: 0000000000000000 R12: ffff88806f9aec80
R13: 0000000000000001 R14: ffff8880765592c0 R15: 0000000000000001
FS:  0000555557540400(0000) GS:ffff88802cb00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004cba71 CR3: 00000000735b2000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 gfs2_glock_nq_init fs/gfs2/glock.h:254 [inline]
 do_sync+0x4b9/0xcf0 fs/gfs2/quota.c:902
 gfs2_quota_sync+0x2e2/0x660 fs/gfs2/quota.c:1310
 gfs2_sync_fs+0x40/0xb0 fs/gfs2/super.c:642
 sync_filesystem fs/sync.c:56 [inline]
 sync_filesystem+0x105/0x260 fs/sync.c:30
 generic_shutdown_super+0x70/0x400 fs/super.c:448
 kill_block_super+0x97/0xf0 fs/super.c:1397
 gfs2_kill_sb+0x104/0x160 fs/gfs2/ops_fstype.c:1735
 deactivate_locked_super+0x94/0x160 fs/super.c:335
 deactivate_super+0xad/0xd0 fs/super.c:366
 cleanup_mnt+0x3a2/0x540 fs/namespace.c:1137
 task_work_run+0xdd/0x1a0 kernel/task_work.c:164
 tracehook_notify_resume include/linux/tracehook.h:189 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
 exit_to_user_mode_prepare+0x27e/0x290 kernel/entry/common.c:207
 __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
 syscall_exit_to_user_mode+0x19/0x60 kernel/entry/common.c:300
 do_syscall_64+0x42/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7ff8eb5b6f57
Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffca9da6618 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007ff8eb5b6f57
RDX: 00007ffca9da66eb RSI: 000000000000000a RDI: 00007ffca9da66e0
RBP: 00007ffca9da66e0 R08: 00000000ffffffff R09: 00007ffca9da64b0
R10: 00005555575418b3 R11: 0000000000000246 R12: 00007ff8eb60f105
R13: 00007ffca9da77a0 R14: 0000555557541810 R15: 00007ffca9da77e0
 </TASK>
Modules linked in:
---[ end trace f8afb8dcf8bb318a ]---
RIP: 0010:add_to_queue fs/gfs2/glock.c:1548 [inline]
RIP: 0010:gfs2_glock_nq.cold+0x2a1/0x2fa fs/gfs2/glock.c:1572
Code: 74 04 3c 03 7e 76 8b 53 18 44 89 e9 4c 89 f6 48 c7 c7 60 58 f6 89 e8 88 3d f3 ff ba 01 00 00 00 4c 89 e6 31 ff e8 10 aa 57 fa <0f> 0b e8 19 64 af f8 4c 8b 04 24 e9 7f fd ff ff 45 31 ff e9 fc fd
RSP: 0000:ffffc90001f1fae8 EFLAGS: 00010282
RAX: 0000000000000000 RBX: ffff88806f9aec80 RCX: 0000000000000000
RDX: ffff88804b334240 RSI: ffffffff83656106 RDI: ffffffff89f68dc8
RBP: ffff888018610238 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff836560b2 R11: 0000000000000000 R12: ffff88806f9aec80
R13: 0000000000000001 R14: ffff8880765592c0 R15: 0000000000000001
FS:  0000555557540400(0000) GS:ffff88802cb00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000004cba71 CR3: 00000000735b2000 CR4: 0000000000150ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

