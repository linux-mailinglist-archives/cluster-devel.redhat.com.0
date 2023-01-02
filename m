Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.145.221.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1579665BD07
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Jan 2023 10:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672737702;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=VKni3axtbNsIaOYSfvcxB01yYn9jHVhRlG8S6Dkom8M=;
	b=IYOEbcOloosOQx2M7XvMFWkpbXreek+5/+De2OlvLpFWj35XwPO7cqWGqrjP97brmur6IC
	bUsSFn0p4PyIa8o+w6owH4PaeAl5y2RfkBfb7BGINQfff6vSaqDqc0H6xkQwkIHh6Vb+Cz
	ajXyYqU8zRE05Spe+L/gkhdu2NtBUVs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-GeLKG0fLMlGOBXfzk4JR5A-1; Tue, 03 Jan 2023 04:21:41 -0500
X-MC-Unique: GeLKG0fLMlGOBXfzk4JR5A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BAE053C1014B;
	Tue,  3 Jan 2023 09:21:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACC89492C14;
	Tue,  3 Jan 2023 09:21:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 91DAF1946594;
	Tue,  3 Jan 2023 09:21:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 004611946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  2 Jan 2023 21:20:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C3B312166B29; Mon,  2 Jan 2023 21:20:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB2592166B26
 for <cluster-devel@redhat.com>; Mon,  2 Jan 2023 21:20:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97CCB8F6E83
 for <cluster-devel@redhat.com>; Mon,  2 Jan 2023 21:20:46 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-RmR52pK5MaWzva2B3g-aDA-1; Mon, 02 Jan 2023 16:20:44 -0500
X-MC-Unique: RmR52pK5MaWzva2B3g-aDA-1
Received: by mail-il1-f199.google.com with SMTP id
 z19-20020a921a53000000b0030b90211df1so18143024ill.2
 for <cluster-devel@redhat.com>; Mon, 02 Jan 2023 13:20:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VKni3axtbNsIaOYSfvcxB01yYn9jHVhRlG8S6Dkom8M=;
 b=TzjfCGFkVzKZbH0mNs1mmyLII3ipVdwZW00Agmzcgo0OsWJe+U32BBKvxdXydgtNrR
 r6N+Vco8ancC4SZkg18dgdXx1FNDpUMoYXX2Pcf6a4+z94d5UcE1//nuVWuEicOSZZfz
 HTNALzLYgMkS0t/PaXpOh8spSHCYMo4KvYfWgfBq9GqTC0LIacbofsxHu6mRIRK7GN5P
 Qbo0P0J2v0Tn5LSvdw/mm+5XloXJyGbkK/GIhHlQQ/nHa2YXWTnOJXipxpBqxKFYPx6v
 TdIC5MAveMzOB3VevVU3nw6DPZY911l8wgNPaEVWAXWyz+wWV5GOPMmL58FmlmrU/VQG
 Todw==
X-Gm-Message-State: AFqh2krieFoA6GSg+jofq+9RUFWc701SPzFbpW4FD2Cck7kv5ibnFtZF
 t7ZTnDXANkLa9UQus8AElWdMNf0RBoHcqIkzkZgJSuV6mCnN
X-Google-Smtp-Source: AMrXdXsJQmoTrqkC+H/AsL3a183ZPlchS9mHxsCv1cHB0vIhG52se79EkZSU3tefXroDh6OBg5KZo6DBDmAxr5zlMKZLpvNHslP6
MIME-Version: 1.0
X-Received: by 2002:a92:b10:0:b0:302:f72b:202b with SMTP id
 b16-20020a920b10000000b00302f72b202bmr4320239ilf.96.1672694444282; Mon, 02
 Jan 2023 13:20:44 -0800 (PST)
Date: Mon, 02 Jan 2023 13:20:44 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000002b5e2405f14e860f@google.com>
From: syzbot <syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Tue, 03 Jan 2023 09:21:37 +0000
Subject: [Cluster-devel] [syzbot] [gfs2?] KASAN: use-after-free Read in
 qd_unlock (2)
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    1b929c02afd3 Linux 6.2-rc1
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1799c250480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=68e0be42c8ee4bb4
dashboard link: https://syzkaller.appspot.com/bug?extid=3f6a670108ce43356017
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14c4ea18480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1359b338480000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2d8c5072480f/disk-1b929c02.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/46687f1395db/vmlinux-1b929c02.xz
kernel image: https://storage.googleapis.com/syzbot-assets/26f1afa5ec00/bzImage-1b929c02.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/35edd581b491/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com

R10: 0000000000000000 R11: 0000000000000246 R12: 00007f2c431103d0
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
 </TASK>
==================================================================
BUG: KASAN: use-after-free in instrument_atomic_read include/linux/instrumented.h:72 [inline]
BUG: KASAN: use-after-free in _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
BUG: KASAN: use-after-free in qd_unlock+0x30/0x2d0 fs/gfs2/quota.c:490
Read of size 8 at addr ffff888073997090 by task syz-executor221/5069

CPU: 1 PID: 5069 Comm: syz-executor221 Not tainted 6.2.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x290 lib/dump_stack.c:106
 print_address_description+0x74/0x340 mm/kasan/report.c:306
 print_report+0x107/0x1f0 mm/kasan/report.c:417
 kasan_report+0xcd/0x100 mm/kasan/report.c:517
 kasan_check_range+0x2a7/0x2e0 mm/kasan/generic.c:189
 instrument_atomic_read include/linux/instrumented.h:72 [inline]
 _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
 qd_unlock+0x30/0x2d0 fs/gfs2/quota.c:490
 gfs2_quota_sync+0x768/0x8b0 fs/gfs2/quota.c:1325
 gfs2_sync_fs+0x49/0xb0 fs/gfs2/super.c:650
 sync_filesystem+0xe8/0x220 fs/sync.c:56
 generic_shutdown_super+0x6b/0x310 fs/super.c:474
 kill_block_super+0x79/0xd0 fs/super.c:1386
 deactivate_locked_super+0xa7/0xf0 fs/super.c:332
 cleanup_mnt+0x494/0x520 fs/namespace.c:1291
 task_work_run+0x243/0x300 kernel/task_work.c:179
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x644/0x2150 kernel/exit.c:867
 do_group_exit+0x1fd/0x2b0 kernel/exit.c:1012
 __do_sys_exit_group kernel/exit.c:1023 [inline]
 __se_sys_exit_group kernel/exit.c:1021 [inline]
 __x64_sys_exit_group+0x3b/0x40 kernel/exit.c:1021
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f2c4308d0c9
Code: Unable to access opcode bytes at 0x7f2c4308d09f.
RSP: 002b:00007ffcdd2f81f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
RAX: ffffffffffffffda RBX: 00007f2c431103d0 RCX: 00007f2c4308d0c9
RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000001
RBP: 0000000000000001 R08: ffffffffffffffc0 R09: 0000000000012550
R10: 0000000000000000 R11: 0000000000000246 R12: 00007f2c431103d0
R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
 </TASK>

Allocated by task 5069:
 kasan_save_stack mm/kasan/common.c:45 [inline]
 kasan_set_track+0x3d/0x60 mm/kasan/common.c:52
 __kasan_slab_alloc+0x65/0x70 mm/kasan/common.c:325
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slab.h:761 [inline]
 slab_alloc_node mm/slub.c:3452 [inline]
 slab_alloc mm/slub.c:3460 [inline]
 __kmem_cache_alloc_lru mm/slub.c:3467 [inline]
 kmem_cache_alloc+0x1b3/0x350 mm/slub.c:3476
 kmem_cache_zalloc include/linux/slab.h:710 [inline]
 qd_alloc+0x51/0x250 fs/gfs2/quota.c:216
 gfs2_quota_init+0x7c4/0x10e0 fs/gfs2/quota.c:1415
 gfs2_make_fs_rw+0x48e/0x590 fs/gfs2/super.c:153
 gfs2_fill_super+0x2357/0x2700 fs/gfs2/ops_fstype.c:1274
 get_tree_bdev+0x400/0x620 fs/super.c:1282
 gfs2_get_tree+0x50/0x210 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x88/0x270 fs/super.c:1489
 do_new_mount+0x289/0xad0 fs/namespace.c:3145
 do_mount fs/namespace.c:3488 [inline]
 __do_sys_mount fs/namespace.c:3697 [inline]
 __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3674
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Freed by task 0:
 kasan_save_stack mm/kasan/common.c:45 [inline]
 kasan_set_track+0x3d/0x60 mm/kasan/common.c:52
 kasan_save_free_info+0x27/0x40 mm/kasan/generic.c:518
 ____kasan_slab_free+0xd6/0x120 mm/kasan/common.c:236
 kasan_slab_free include/linux/kasan.h:177 [inline]
 slab_free_hook mm/slub.c:1781 [inline]
 slab_free_freelist_hook+0x12e/0x1a0 mm/slub.c:1807
 slab_free mm/slub.c:3787 [inline]
 kmem_cache_free+0x94/0x1d0 mm/slub.c:3809
 rcu_do_batch kernel/rcu/tree.c:2246 [inline]
 rcu_core+0x9c1/0x1690 kernel/rcu/tree.c:2506
 __do_softirq+0x277/0x738 kernel/softirq.c:571

Last potentially related work creation:
 kasan_save_stack+0x2b/0x50 mm/kasan/common.c:45
 __kasan_record_aux_stack+0xb0/0xc0 mm/kasan/generic.c:488
 __call_rcu_common kernel/rcu/tree.c:2755 [inline]
 call_rcu+0x163/0xa70 kernel/rcu/tree.c:2868
 gfs2_quota_cleanup+0x457/0x6b0 fs/gfs2/quota.c:1479
 gfs2_make_fs_ro+0x517/0x610 fs/gfs2/super.c:560
 signal_our_withdraw fs/gfs2/util.c:166 [inline]
 gfs2_withdraw+0x609/0x1540 fs/gfs2/util.c:351
 gfs2_dinode_in fs/gfs2/glops.c:460 [inline]
 gfs2_inode_refresh+0xb2d/0xf60 fs/gfs2/glops.c:480
 gfs2_instantiate+0x15e/0x220 fs/gfs2/glock.c:456
 gfs2_glock_holder_ready fs/gfs2/glock.c:1299 [inline]
 gfs2_glock_wait+0x1d9/0x2a0 fs/gfs2/glock.c:1319
 gfs2_glock_nq_init fs/gfs2/glock.h:262 [inline]
 do_sync+0x485/0xc80 fs/gfs2/quota.c:916
 gfs2_quota_sync+0x3da/0x8b0 fs/gfs2/quota.c:1318
 gfs2_sync_fs+0x49/0xb0 fs/gfs2/super.c:650
 sync_filesystem+0xe8/0x220 fs/sync.c:56
 generic_shutdown_super+0x6b/0x310 fs/super.c:474
 kill_block_super+0x79/0xd0 fs/super.c:1386
 deactivate_locked_super+0xa7/0xf0 fs/super.c:332
 cleanup_mnt+0x494/0x520 fs/namespace.c:1291
 task_work_run+0x243/0x300 kernel/task_work.c:179
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x644/0x2150 kernel/exit.c:867
 do_group_exit+0x1fd/0x2b0 kernel/exit.c:1012
 __do_sys_exit_group kernel/exit.c:1023 [inline]
 __se_sys_exit_group kernel/exit.c:1021 [inline]
 __x64_sys_exit_group+0x3b/0x40 kernel/exit.c:1021
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

The buggy address belongs to the object at ffff888073997000
 which belongs to the cache gfs2_quotad of size 272
The buggy address is located 144 bytes inside of
 272-byte region [ffff888073997000, ffff888073997110)

The buggy address belongs to the physical page:
page:ffffea0001ce65c0 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x73997
flags: 0xfff00000000200(slab|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000000200 ffff8881461ae500 dead000000000122 0000000000000000
raw: 0000000000000000 00000000800c000c 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Reclaimable, gfp_mask 0x12c50(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY|__GFP_RECLAIMABLE), pid 5069, tgid 5069 (syz-executor221), ts 50927644511, free_ts 12661541703
 prep_new_page mm/page_alloc.c:2531 [inline]
 get_page_from_freelist+0x742/0x7c0 mm/page_alloc.c:4283
 __alloc_pages+0x259/0x560 mm/page_alloc.c:5549
 alloc_slab_page+0xbd/0x190 mm/slub.c:1851
 allocate_slab+0x5e/0x3c0 mm/slub.c:1998
 new_slab mm/slub.c:2051 [inline]
 ___slab_alloc+0x782/0xe20 mm/slub.c:3193
 __slab_alloc mm/slub.c:3292 [inline]
 __slab_alloc_node mm/slub.c:3345 [inline]
 slab_alloc_node mm/slub.c:3442 [inline]
 slab_alloc mm/slub.c:3460 [inline]
 __kmem_cache_alloc_lru mm/slub.c:3467 [inline]
 kmem_cache_alloc+0x268/0x350 mm/slub.c:3476
 kmem_cache_zalloc include/linux/slab.h:710 [inline]
 qd_alloc+0x51/0x250 fs/gfs2/quota.c:216
 gfs2_quota_init+0x7c4/0x10e0 fs/gfs2/quota.c:1415
 gfs2_make_fs_rw+0x48e/0x590 fs/gfs2/super.c:153
 gfs2_fill_super+0x2357/0x2700 fs/gfs2/ops_fstype.c:1274
 get_tree_bdev+0x400/0x620 fs/super.c:1282
 gfs2_get_tree+0x50/0x210 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x88/0x270 fs/super.c:1489
 do_new_mount+0x289/0xad0 fs/namespace.c:3145
 do_mount fs/namespace.c:3488 [inline]
 __do_sys_mount fs/namespace.c:3697 [inline]
 __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3674
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1446 [inline]
 free_pcp_prepare+0x751/0x780 mm/page_alloc.c:1496
 free_unref_page_prepare mm/page_alloc.c:3369 [inline]
 free_unref_page+0x19/0x4c0 mm/page_alloc.c:3464
 free_contig_range+0xa3/0x160 mm/page_alloc.c:9485
 destroy_args+0xfe/0x940 mm/debug_vm_pgtable.c:998
 debug_vm_pgtable+0x43d/0x4a0 mm/debug_vm_pgtable.c:1318
 do_one_initcall+0x1d1/0x410 init/main.c:1306
 do_initcall_level+0x168/0x220 init/main.c:1379
 do_initcalls+0x43/0x90 init/main.c:1395
 kernel_init_freeable+0x428/0x5e0 init/main.c:1634
 kernel_init+0x19/0x2b0 init/main.c:1522
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308

Memory state around the buggy address:
 ffff888073996f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888073997000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888073997080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                         ^
 ffff888073997100: fb fb fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888073997180: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

