Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE0E6340B9
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Nov 2022 17:02:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669132923;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FyFmpCbDj8SY6mbbs6IR7GSkVbHICa/WwOJS5wT0u4M=;
	b=hUzYG1GMXcWLzWbNvtPCwRvq6MsQ6vLMuP4JkhynbQPnUX89UiJgedtqcvITU8yb39R5qj
	HAHUhdu66Uk69kvli1HGljLII55UT7yCrD/EUQMDe0zG5whhVxn4Fv1gW/I2RTibPpZtDa
	5BHkU0tpgBaVbqhYKj4wJiVUXOgv+GA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-qvXqUA-kMWin6rGF2wvn6w-1; Tue, 22 Nov 2022 11:02:00 -0500
X-MC-Unique: qvXqUA-kMWin6rGF2wvn6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8802986EB32;
	Tue, 22 Nov 2022 16:01:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B89562166B2E;
	Tue, 22 Nov 2022 16:01:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 073FA194658D;
	Tue, 22 Nov 2022 16:01:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ACC761946587 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Nov 2022 15:52:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8C0B540C83D9; Tue, 22 Nov 2022 15:52:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 846CF40C83AD
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 15:52:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6944229AA2F3
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 15:52:47 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-78AplJOBMfOWmCDM7WzkJA-1; Tue, 22 Nov 2022 10:52:41 -0500
X-MC-Unique: 78AplJOBMfOWmCDM7WzkJA-1
Received: by mail-il1-f197.google.com with SMTP id
 x10-20020a056e021bca00b00302b6c0a683so6728541ilv.23
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 07:52:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FyFmpCbDj8SY6mbbs6IR7GSkVbHICa/WwOJS5wT0u4M=;
 b=UsbFJjyPOfd4U23E0megNFpr5RpdjXdESj/mFob6WFoTOTdovIB9hCKjOpC/z0Pmkt
 eS8wZJkul45uQWd/w1Rtj/fbCOG0m44MYzZgIltfOJiwOmykqmUPFcyBYKAdfD70ZYsu
 w7vCZRqOdg55s43j6zW8KJ22R2lds78+3jxOw3O8rPWbWM2IfQGD9WN9tE/B/MMTUluA
 B4YD9ZvLRQUILmUNLDGsf2DjohJ6AvBT6JV9m5sym78pNOZDY390G/YD/ebhzrRc5Tz9
 qt9WEp8nMajH0aJKVlrQebqzknO+kw27sYz9S5tE/KJM9is3GR3nvDmCugLlnFe2AR4j
 onCw==
X-Gm-Message-State: ANoB5pl6pfR9KJ5e0JAiqPWMyvkKVTrobY5WSOBM3IM6Iewy8B8XNsyb
 HHQaJYWQi+xrTmeibRRuiP2ZvDg4uYBT1PePFxaPoD+ZShta
X-Google-Smtp-Source: AA0mqf7oHqwWD89saT3KJILzQ2ZJzy10H/9z6Df7FDbqUCDtjgyJuUD2sPpZn434D1GrYx9RIMUoNb3kAV60M3wyThvHa/2ylmSF
MIME-Version: 1.0
X-Received: by 2002:a02:6d54:0:b0:376:24f6:d0f4 with SMTP id
 e20-20020a026d54000000b0037624f6d0f4mr3496277jaf.206.1669132358411; Tue, 22
 Nov 2022 07:52:38 -0800 (PST)
Date: Tue, 22 Nov 2022 07:52:38 -0800
In-Reply-To: <000000000000824da605e9521001@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004e6dba05ee112956@google.com>
From: syzbot <syzbot+70f4e455dee59ab40c80@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 22 Nov 2022 16:01:48 +0000
Subject: Re: [Cluster-devel] [syzbot] kernel BUG in gfs2_glock_nq (2)
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    eb7081409f94 Linux 6.1-rc6
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=15d40efd880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8cdf448d3b35234
dashboard link: https://syzkaller.appspot.com/bug?extid=70f4e455dee59ab40c80
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=156d55fd880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14946075880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4a019f55c517/disk-eb708140.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/eb36e890aa8b/vmlinux-eb708140.xz
kernel image: https://storage.googleapis.com/syzbot-assets/feee2c23ec64/bzImage-eb708140.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/595931ddaae3/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+70f4e455dee59ab40c80@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: new: gfs2_quota_sync+0x3da/0x8b0 fs/gfs2/quota.c:1318
gfs2: fsid=syz:syz.0: pid: 3642
gfs2: fsid=syz:syz.0: lock type: 8 req lock state : 1
gfs2: fsid=syz:syz.0: G:  s:EX n:8/1 f:qb t:EX d:EX/0 a:0 v:0 r:5 m:20 p:0
gfs2: fsid=syz:syz.0:  H: s:EX f:cH e:0 p:3642 [syz-executor297] gfs2_quota_sync+0x3da/0x8b0 fs/gfs2/quota.c:1318
------------[ cut here ]------------
kernel BUG at fs/gfs2/glock.c:1560!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 3642 Comm: syz-executor297 Not tainted 6.1.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:add_to_queue fs/gfs2/glock.c:1560 [inline]
RIP: 0010:gfs2_glock_nq+0x1661/0x1890 fs/gfs2/glock.c:1585
Code: 0f b7 4d 00 48 c7 c7 00 42 3e 8b 48 8b 74 24 20 89 da 31 c0 e8 9c bf da 06 31 ff 48 8b 74 24 28 ba 01 00 00 00 e8 6f 7b ff ff <0f> 0b 89 d9 80 e1 07 fe c1 38 c1 0f 8c 94 ee ff ff 48 89 df e8 06
RSP: 0018:ffffc90003baf898 EFLAGS: 00010246
RAX: 366be81aeeac0c00 RBX: 0000000000000008 RCX: ffff88807253d7c0
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffff888027cb365a R08: ffffffff83b90f42 R09: fffffbfff1d2f2de
R10: fffffbfff1d2f2de R11: 1ffffffff1d2f2dd R12: ffff888027cb3638
R13: ffff888073045340 R14: ffff888027cb3630 R15: 1ffff11004f966c3
FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000562ec3072000 CR3: 00000000714f0000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 gfs2_glock_nq_init fs/gfs2/glock.h:264 [inline]
 do_sync+0x3b1/0xc80 fs/gfs2/quota.c:910
 gfs2_quota_sync+0x3da/0x8b0 fs/gfs2/quota.c:1318
 gfs2_sync_fs+0x49/0xb0 fs/gfs2/super.c:643
 sync_filesystem+0xe8/0x220 fs/sync.c:56
 generic_shutdown_super+0x6b/0x310 fs/super.c:474
 kill_block_super+0x79/0xd0 fs/super.c:1428
 deactivate_locked_super+0xa7/0xf0 fs/super.c:332
 cleanup_mnt+0x494/0x520 fs/namespace.c:1186
 task_work_run+0x243/0x300 kernel/task_work.c:179
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x664/0x2070 kernel/exit.c:820
 do_group_exit+0x1fd/0x2b0 kernel/exit.c:950
 __do_sys_exit_group kernel/exit.c:961 [inline]
 __se_sys_exit_group kernel/exit.c:959 [inline]
 __x64_sys_exit_group+0x3b/0x40 kernel/exit.c:959
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f9613abc989
Code: Unable to access opcode bytes at 0x7f9613abc95f.
RSP: 002b:00007ffe22a048c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f9613b6d330 RCX: 00007f9613abc989
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000001
RBP: 0000000000000001 R08: ffffffffffffffc0 R09: 000000000003b2d3
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f9613b6d330
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:add_to_queue fs/gfs2/glock.c:1560 [inline]
RIP: 0010:gfs2_glock_nq+0x1661/0x1890 fs/gfs2/glock.c:1585
Code: 0f b7 4d 00 48 c7 c7 00 42 3e 8b 48 8b 74 24 20 89 da 31 c0 e8 9c bf da 06 31 ff 48 8b 74 24 28 ba 01 00 00 00 e8 6f 7b ff ff <0f> 0b 89 d9 80 e1 07 fe c1 38 c1 0f 8c 94 ee ff ff 48 89 df e8 06
RSP: 0018:ffffc90003baf898 EFLAGS: 00010246
RAX: 366be81aeeac0c00 RBX: 0000000000000008 RCX: ffff88807253d7c0
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000000
RBP: ffff888027cb365a R08: ffffffff83b90f42 R09: fffffbfff1d2f2de
R10: fffffbfff1d2f2de R11: 1ffffffff1d2f2dd R12: ffff888027cb3638
R13: ffff888073045340 R14: ffff888027cb3630 R15: 1ffff11004f966c3
FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000562ec3072000 CR3: 00000000714f0000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400

