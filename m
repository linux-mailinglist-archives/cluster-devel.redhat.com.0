Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 629BD65BD0C
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Jan 2023 10:21:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672737705;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8TrQckoKvz3w5GOc/SCODLpLecT+ozdvYKg/HaqgeK4=;
	b=fIYp6gig+hlklVSNKKw4djKIVuueHy0lGvluMDiGPtKSe/4bchavnMIUL94gZsdgh00o4j
	/KHns0xAtXs1WAhbKaJPOP+NtD3M9DTcopMxEY0KOFD++WDZgLHXzb4JIo6Z+Wpd20rvki
	+U4h9ZwIAaEo2wsscMLzJ/TgvL/fga8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-Hrlq5SeyPdSAusAn2bTXGw-1; Tue, 03 Jan 2023 04:21:41 -0500
X-MC-Unique: Hrlq5SeyPdSAusAn2bTXGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8E338027FE;
	Tue,  3 Jan 2023 09:21:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E82272166B29;
	Tue,  3 Jan 2023 09:21:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7BC341946597;
	Tue,  3 Jan 2023 09:21:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DD5C81946586 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 25 Dec 2022 15:51:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C1C33492C18; Sun, 25 Dec 2022 15:51:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA89E492C14
 for <cluster-devel@redhat.com>; Sun, 25 Dec 2022 15:51:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F6E6811E6E
 for <cluster-devel@redhat.com>; Sun, 25 Dec 2022 15:51:50 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-166-ubUzcxcTPimd8Giu8JQgBA-1; Sun, 25 Dec 2022 10:51:46 -0500
X-MC-Unique: ubUzcxcTPimd8Giu8JQgBA-1
Received: by mail-il1-f198.google.com with SMTP id
 i14-20020a056e020d8e00b003034b93bd07so5796700ilj.14
 for <cluster-devel@redhat.com>; Sun, 25 Dec 2022 07:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8TrQckoKvz3w5GOc/SCODLpLecT+ozdvYKg/HaqgeK4=;
 b=hh4wc60veAq6doYH1tdtMdv4OYx0ZCgIxanW3tUQ9LadWYyOd0VugOOEA/d9M4dCQq
 Nw+a/bvN/az4ELYIi6LItrAAgHIpAMG/VU+aJq6OdY4GfJwiXuCnOttH19hBG3w+9gIQ
 qcPxnfIDJkqlSsb69pG7cz8QW59CssH3H5LMO69+1UI7q55qekYO+imsyM80+Cu4Fm3A
 2eyzip4tnuBZcbYDRDYG6hFkNLeim4DohfeTM071rlbwDsK8bcPNvJd4nP6WOq1DTUOG
 oiEvntva65rQTOQ1yfxsbr4zfM17R2XnY8mtP0BZPAbau+OXj+mWXVZG+5Ghi3N+rwSp
 W2sw==
X-Gm-Message-State: AFqh2koE19n3u/dYTCOfDAYNbr6VIZNu+M69UrMreofWa9BqVvcqmXIc
 MA8LB7cy/zG/ZoSYoxlil7bDroNqBH06a5LEMaTTK+vNPuc4
X-Google-Smtp-Source: AMrXdXvM/RGYXZpLup5ds5LVkKHdP6YaO5O1eaHxdKwrZOGkSbuuMGAMEGLbnA6vkfvY05fTo1gXqRhyl9LLp0VBv9lZ5sgSD26V
MIME-Version: 1.0
X-Received: by 2002:a92:cf43:0:b0:30b:c00c:24ce with SMTP id
 c3-20020a92cf43000000b0030bc00c24cemr1614093ilr.94.1671983506130; Sun, 25 Dec
 2022 07:51:46 -0800 (PST)
Date: Sun, 25 Dec 2022 07:51:46 -0800
In-Reply-To: <0000000000007e22cb05dd7cbada@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f40e6d05f0a8fec7@google.com>
From: syzbot <syzbot+2845b2dfa28dec36e215@syzkaller.appspotmail.com>
To: agruenba@redhat.com, boqun.feng@gmail.com, cluster-devel@redhat.com, 
 linux-kernel@vger.kernel.org, longman@redhat.com, mingo@redhat.com, 
 peterz@infradead.org, rpeterso@redhat.com, syzkaller-bugs@googlegroups.com, 
 will@kernel.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Tue, 03 Jan 2023 09:21:37 +0000
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] BUG: sleeping function called
 from invalid context in do_page_fault (3)
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

HEAD commit:    a5541c0811a0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=11b79928480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cbd4e584773e9397
dashboard link: https://syzkaller.appspot.com/bug?extid=2845b2dfa28dec36e215
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=156dcd50480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1337f2e4480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b7702208fb9/disk-a5541c08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec0153ec051/vmlinux-a5541c08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6f8725ad290a/Image-a5541c08.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/9d323fcb08fb/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2845b2dfa28dec36e215@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0:  H: s:SH f:H e:0 p:4002 [syz-executor363] __gfs2_lookup+0x5c/0x1dc fs/gfs2/inode.c:870
BUG: sleeping function called from invalid context at arch/arm64/mm/fault.c:599
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 4011, name: syz-executor363
preempt_count: 0, expected: 0
RCU nest depth: 1, expected: 0
3 locks held by syz-executor363/4011:
 #0: 
ffff0000cfa98dd0
 (
&type->i_mutex_dir_key
#8
){.+.+}-{3:3}
, at: inode_lock_shared include/linux/fs.h:766 [inline]
, at: open_last_lookups fs/namei.c:3480 [inline]
, at: path_openat+0x2e4/0x11c4 fs/namei.c:3711
 #1: 
ffff80000d4a4640
 (
rcu_read_lock
){....}-{1:2}, at: rcu_lock_acquire+0x10/0x4c include/linux/rcupdate.h:303
 #2: 
ffff0000c0e15648
 (
&mm->mmap_lock){++++}-{3:3}, at: mmap_read_trylock include/linux/mmap_lock.h:136 [inline]
&mm->mmap_lock){++++}-{3:3}, at: do_page_fault+0x1ec/0x79c arch/arm64/mm/fault.c:589
CPU: 1 PID: 4011 Comm: syz-executor363 Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:163
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 __might_resched+0x208/0x218 kernel/sched/core.c:9908
 __might_sleep+0x48/0x78 kernel/sched/core.c:9837
 do_page_fault+0x214/0x79c arch/arm64/mm/fault.c:599
 do_translation_fault+0x78/0x194 arch/arm64/mm/fault.c:691
 do_mem_abort+0x54/0x130 arch/arm64/mm/fault.c:827
 el1_abort+0x3c/0x5c arch/arm64/kernel/entry-common.c:367
 el1h_64_sync_handler+0x60/0xac arch/arm64/kernel/entry-common.c:427
 el1h_64_sync+0x64/0x68 arch/arm64/kernel/entry.S:579
 rcu_read_lock include/linux/rcupdate.h:739 [inline]
 dump_holder fs/gfs2/glock.c:2332 [inline]
 gfs2_dump_glock+0x4f4/0x904 fs/gfs2/glock.c:2447
 gfs2_consist_inode_i+0x68/0x88 fs/gfs2/util.c:465
 gfs2_dirent_scan+0x2dc/0x3b4 fs/gfs2/dir.c:602
 gfs2_dirent_search+0x134/0x494 fs/gfs2/dir.c:850
 gfs2_dir_search+0x58/0x130 fs/gfs2/dir.c:1650
 gfs2_lookupi+0x23c/0x354 fs/gfs2/inode.c:323
 __gfs2_lookup+0x5c/0x1dc fs/gfs2/inode.c:870
 gfs2_atomic_open+0x74/0x148 fs/gfs2/inode.c:1274
 atomic_open fs/namei.c:3276 [inline]
 lookup_open fs/namei.c:3384 [inline]
 open_last_lookups fs/namei.c:3481 [inline]
 path_openat+0x67c/0x11c4 fs/namei.c:3711
 do_filp_open+0xdc/0x1b8 fs/namei.c:3741
 do_sys_openat2+0xb8/0x22c fs/open.c:1310
 do_sys_open fs/open.c:1326 [inline]
 __do_sys_openat fs/open.c:1342 [inline]
 __se_sys_openat fs/open.c:1337 [inline]
 __arm64_sys_openat+0xb0/0xe0 fs/open.c:1337
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x140 arch/arm64/kernel/syscall.c:197
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000021
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=0000000113364000
[0000000000000021] pgd=0800000111d8b003, p4d=0800000111d8b003, pud=0800000111d8c003, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 4011 Comm: syz-executor363 Tainted: G        W          6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : pid_is_meaningful fs/gfs2/glock.c:1464 [inline]
pc : dump_holder fs/gfs2/glock.c:2333 [inline]
pc : gfs2_dump_glock+0x4f4/0x904 fs/gfs2/glock.c:2447
lr : rcu_read_lock include/linux/rcupdate.h:739 [inline]
lr : dump_holder fs/gfs2/glock.c:2332 [inline]
lr : gfs2_dump_glock+0x498/0x904 fs/gfs2/glock.c:2447
sp : ffff800013503600
x29: ffff8000135037d0 x28: ffff80000cd3bac3 x27: ffff0000d1c12218
x26: 0000000000000fa2 x25: ffff8000135037a1 x24: ffff0000d07809a0
x23: 0000000000000001 x22: 0000000000000040 x21: ffff80000d4a4640
x20: ffff80000d95c000 x19: ffff0000d0780a20 x18: 00000000000003a2
x17: 000000000000b67e x16: ffff80000dbe6158 x15: ffff0000d07f9a40
x14: 0000000000000000 x13: 00000000ffffffff x12: ffff0000d07f9a40
x11: ff8080000926ce78 x10: 0000000000000000 x9 : ffff80000926ce78
x8 : ffff0000d07f9a40 x7 : ffff800009273590 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000002
x2 : 0000000000000008 x1 : ffff80000ce893cb x0 : 0000000000000001
Call trace:
 rcu_read_lock include/linux/rcupdate.h:739 [inline]
 dump_holder fs/gfs2/glock.c:2332 [inline]
 gfs2_dump_glock+0x4f4/0x904 fs/gfs2/glock.c:2447
 gfs2_consist_inode_i+0x68/0x88 fs/gfs2/util.c:465
 gfs2_dirent_scan+0x2dc/0x3b4 fs/gfs2/dir.c:602
 gfs2_dirent_search+0x134/0x494 fs/gfs2/dir.c:850
 gfs2_dir_search+0x58/0x130 fs/gfs2/dir.c:1650
 gfs2_lookupi+0x23c/0x354 fs/gfs2/inode.c:323
 __gfs2_lookup+0x5c/0x1dc fs/gfs2/inode.c:870
 gfs2_atomic_open+0x74/0x148 fs/gfs2/inode.c:1274
 atomic_open fs/namei.c:3276 [inline]
 lookup_open fs/namei.c:3384 [inline]
 open_last_lookups fs/namei.c:3481 [inline]
 path_openat+0x67c/0x11c4 fs/namei.c:3711
 do_filp_open+0xdc/0x1b8 fs/namei.c:3741
 do_sys_openat2+0xb8/0x22c fs/open.c:1310
 do_sys_open fs/open.c:1326 [inline]
 __do_sys_openat fs/open.c:1342 [inline]
 __se_sys_openat fs/open.c:1337 [inline]
 __arm64_sys_openat+0xb0/0xe0 fs/open.c:1337
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x140 arch/arm64/kernel/syscall.c:197
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
Code: 91178800 9117ec42 391e2688 97bcdabc (794042f4) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	91178800 	add	x0, x0, #0x5e2
   4:	9117ec42 	add	x2, x2, #0x5fb
   8:	391e2688 	strb	w8, [x20, #1929]
   c:	97bcdabc 	bl	0xfffffffffef36afc
* 10:	794042f4 	ldrh	w20, [x23, #32] <-- trapping instruction

