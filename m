Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DCD9438746A
	for <lists+cluster-devel@lfdr.de>; Tue, 18 May 2021 10:53:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-PMDgZSosOCOfLKMiGb5fKw-1; Tue, 18 May 2021 04:53:23 -0400
X-MC-Unique: PMDgZSosOCOfLKMiGb5fKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9ABF17BA0;
	Tue, 18 May 2021 08:53:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 609615C582;
	Tue, 18 May 2021 08:53:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DBBB5534E;
	Tue, 18 May 2021 08:53:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14I8n67k020255 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 May 2021 04:49:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12BBC200E4A4; Tue, 18 May 2021 08:49:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AF5D200E4A7
	for <cluster-devel@redhat.com>; Tue, 18 May 2021 08:49:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50CBC858F0D
	for <cluster-devel@redhat.com>; Tue, 18 May 2021 08:49:02 +0000 (UTC)
Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn
	[202.108.3.20]) by relay.mimecast.com with ESMTP id
	us-mta-474-_iDh2oHjOOKQwm-a6SXfZQ-1; Tue, 18 May 2021 04:48:59 -0400
X-MC-Unique: _iDh2oHjOOKQwm-a6SXfZQ-1
Received: from unknown (HELO localhost.localdomain)([221.199.207.228])
	by sina.com (172.16.97.35) with ESMTP
	id 60A37EE80000126C; Tue, 18 May 2021 16:46:34 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 24507715073860
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+34ba7ddbf3021981a228@syzkaller.appspotmail.com>
Date: Tue, 18 May 2021 16:46:25 +0800
Message-Id: <20210518084625.1200-1-hdanton@sina.com>
In-Reply-To: <00000000000018cf5d05c2949b75@google.com>
References: <00000000000018cf5d05c2949b75@google.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Tue, 18 May 2021 04:53:14 -0400
Cc: Hillf Danton <hdanton@sina.com>, syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [syzbot] KASAN: use-after-free Read in
	gfs2_glock_shrink_scan
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

On Mon, 17 May 2021 23:13:16 -0700
>Hello,
>
>syzbot found the following issue on:
>
>HEAD commit:    315d9931 Merge tag 'pm-5.13-rc2' of git://git.kernel.org/p..
>git tree:       upstream
>console output: https://syzkaller.appspot.com/x/log.txt?x=126d17b3d00000
>kernel config:  https://syzkaller.appspot.com/x/.config?x=4e950b1ffed48778
>dashboard link: https://syzkaller.appspot.com/bug?extid=34ba7ddbf3021981a228
>userspace arch: i386
>
>Unfortunately, I don't have any reproducer for this issue yet.
>
>IMPORTANT: if you fix the issue, please add the following tag to the commit:
>Reported-by: syzbot+34ba7ddbf3021981a228@syzkaller.appspotmail.com
>
>==================================================================
>BUG: KASAN: use-after-free in __list_del_entry_valid+0xcc/0xf0 lib/list_debug.c:42
>Read of size 8 at addr ffff888074ee8f20 by task khugepaged/1669
>
>CPU: 0 PID: 1669 Comm: khugepaged Not tainted 5.13.0-rc1-syzkaller #0
>Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
>Call Trace:
> __dump_stack lib/dump_stack.c:79 [inline]
> dump_stack+0x141/0x1d7 lib/dump_stack.c:120
> print_address_description.constprop.0.cold+0x5b/0x2f8 mm/kasan/report.c:233
> __kasan_report mm/kasan/report.c:419 [inline]
> kasan_report.cold+0x7c/0xd8 mm/kasan/report.c:436
> __list_del_entry_valid+0xcc/0xf0 lib/list_debug.c:42
> __list_del_entry include/linux/list.h:132 [inline]
> list_del_init include/linux/list.h:204 [inline]
> gfs2_dispose_glock_lru fs/gfs2/glock.c:1777 [inline]
> gfs2_scan_glock_lru fs/gfs2/glock.c:1832 [inline]
> gfs2_glock_shrink_scan fs/gfs2/glock.c:1843 [inline]
> gfs2_glock_shrink_scan+0x69f/0xa80 fs/gfs2/glock.c:1838
> do_shrink_slab+0x42d/0xbd0 mm/vmscan.c:709
> shrink_slab+0x17f/0x6f0 mm/vmscan.c:869
> shrink_node_memcgs mm/vmscan.c:2852 [inline]
> shrink_node+0x8d1/0x1de0 mm/vmscan.c:2967
> shrink_zones mm/vmscan.c:3170 [inline]
> do_try_to_free_pages+0x388/0x14b0 mm/vmscan.c:3225
> try_to_free_pages+0x29f/0x750 mm/vmscan.c:3464
> __perform_reclaim mm/page_alloc.c:4430 [inline]
> __alloc_pages_direct_reclaim mm/page_alloc.c:4451 [inline]
> __alloc_pages_slowpath.constprop.0+0x84e/0x2140 mm/page_alloc.c:4855
> __alloc_pages+0x422/0x500 mm/page_alloc.c:5213
> __alloc_pages_node include/linux/gfp.h:549 [inline]
> khugepaged_alloc_page+0xa0/0x170 mm/khugepaged.c:882
> collapse_huge_page mm/khugepaged.c:1085 [inline]
> khugepaged_scan_pmd mm/khugepaged.c:1368 [inline]
> khugepaged_scan_mm_slot mm/khugepaged.c:2137 [inline]
> khugepaged_do_scan mm/khugepaged.c:2218 [inline]
> khugepaged+0x312b/0x5530 mm/khugepaged.c:2263
> kthread+0x3b1/0x4a0 kernel/kthread.c:313
> ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
>
>Allocated by task 10231:
> kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
> kasan_set_track mm/kasan/common.c:46 [inline]
> set_alloc_info mm/kasan/common.c:428 [inline]
> __kasan_slab_alloc+0x84/0xa0 mm/kasan/common.c:461
> kasan_slab_alloc include/linux/kasan.h:236 [inline]
> slab_post_alloc_hook mm/slab.h:524 [inline]
> slab_alloc_node mm/slub.c:2912 [inline]
> slab_alloc mm/slub.c:2920 [inline]
> kmem_cache_alloc+0x152/0x3a0 mm/slub.c:2925
> gfs2_glock_get+0x20e/0x1100 fs/gfs2/glock.c:1027
> gfs2_inode_lookup+0x2c9/0xb10 fs/gfs2/inode.c:149
> gfs2_dir_search+0x20f/0x2c0 fs/gfs2/dir.c:1665
> gfs2_lookupi+0x475/0x640 fs/gfs2/inode.c:332
> gfs2_lookup_simple+0x99/0xe0 fs/gfs2/inode.c:273
> init_inodes+0x1c79/0x2610 fs/gfs2/ops_fstype.c:880
> gfs2_fill_super+0x1b4a/0x2680 fs/gfs2/ops_fstype.c:1204
> get_tree_bdev+0x440/0x760 fs/super.c:1293
> gfs2_get_tree+0x4a/0x270 fs/gfs2/ops_fstype.c:1273
> vfs_get_tree+0x89/0x2f0 fs/super.c:1498
> do_new_mount fs/namespace.c:2905 [inline]
> path_mount+0x132a/0x1fa0 fs/namespace.c:3235
> do_mount fs/namespace.c:3248 [inline]
> __do_sys_mount fs/namespace.c:3456 [inline]
> __se_sys_mount fs/namespace.c:3433 [inline]
> __ia32_sys_mount+0x27e/0x300 fs/namespace.c:3433
> do_syscall_32_irqs_on arch/x86/entry/common.c:78 [inline]
> __do_fast_syscall_32+0x67/0xe0 arch/x86/entry/common.c:143
> do_fast_syscall_32+0x2f/0x70 arch/x86/entry/common.c:168
> entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
>
>Freed by task 8886:
> kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
> kasan_set_track+0x1c/0x30 mm/kasan/common.c:46
> kasan_set_free_info+0x20/0x30 mm/kasan/generic.c:357
> ____kasan_slab_free mm/kasan/common.c:360 [inline]
> ____kasan_slab_free mm/kasan/common.c:325 [inline]
> __kasan_slab_free+0xfb/0x130 mm/kasan/common.c:368
> kasan_slab_free include/linux/kasan.h:212 [inline]
> slab_free_hook mm/slub.c:1581 [inline]
> slab_free_freelist_hook+0xdf/0x240 mm/slub.c:1606
> slab_free mm/slub.c:3166 [inline]
> kmem_cache_free+0x8a/0x740 mm/slub.c:3182
> gfs2_glock_dealloc+0xcc/0x150 fs/gfs2/glock.c:130
> rcu_do_batch kernel/rcu/tree.c:2558 [inline]
> rcu_core+0x7ab/0x13b0 kernel/rcu/tree.c:2793
> __do_softirq+0x29b/0x9f6 kernel/softirq.c:559
>
>Last potentially related work creation:
> kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
> kasan_record_aux_stack+0xe5/0x110 mm/kasan/generic.c:345
> __call_rcu kernel/rcu/tree.c:3038 [inline]
> call_rcu+0xb1/0x750 kernel/rcu/tree.c:3113
> gfs2_glock_free+0x7cf/0x1080 fs/gfs2/glock.c:170
> glock_work_func+0x2bb/0x3f0 fs/gfs2/glock.c:949
> process_one_work+0x98d/0x1600 kernel/workqueue.c:2275
> worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
> kthread+0x3b1/0x4a0 kernel/kthread.c:313
> ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
>
>Second to last potentially related work creation:
> kasan_save_stack+0x1b/0x40 mm/kasan/common.c:38
> kasan_record_aux_stack+0xe5/0x110 mm/kasan/generic.c:345
> insert_work+0x48/0x370 kernel/workqueue.c:1331
> __queue_work+0x5c1/0xed0 kernel/workqueue.c:1497
> __queue_delayed_work+0x1c8/0x270 kernel/workqueue.c:1644
> queue_delayed_work_on+0x105/0x120 kernel/workqueue.c:1680
> queue_delayed_work include/linux/workqueue.h:522 [inline]
> __gfs2_glock_queue_work+0x2a/0xb0 fs/gfs2/glock.c:245
> gfs2_glock_queue_work fs/gfs2/glock.c:259 [inline]
> do_xmote+0x833/0xbc0 fs/gfs2/glock.c:702
> run_queue+0x323/0x680 fs/gfs2/glock.c:766
> glock_work_func+0xff/0x3f0 fs/gfs2/glock.c:933
> process_one_work+0x98d/0x1600 kernel/workqueue.c:2275
> worker_thread+0x64c/0x1120 kernel/workqueue.c:2421
> kthread+0x3b1/0x4a0 kernel/kthread.c:313
> ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
>
>The buggy address belongs to the object at ffff888074ee8e10
> which belongs to the cache gfs2_glock(aspace) of size 1072
>The buggy address is located 272 bytes inside of
> 1072-byte region [ffff888074ee8e10, ffff888074ee9240)
>The buggy address belongs to the page:
>page:ffffea0001d3ba00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x74ee8
>head:ffffea0001d3ba00 order:3 compound_mapcount:0 compound_pincount:0
>flags: 0x4fff00000010200(slab|head|node=1|zone=1|lastcpupid=0x7ff)
>raw: 04fff00000010200 dead000000000100 dead000000000122 ffff888043ead180
>raw: 0000000000000000 00000000801b001b 00000001ffffffff 0000000000000000
>page dumped because: kasan: bad access detected
>page_owner tracks the page as allocated
>page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd2040(__GFP_IO|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 10231, ts 369366273371, free_ts 369360520013
> prep_new_page mm/page_alloc.c:2358 [inline]
> get_page_from_freelist+0x1033/0x2b60 mm/page_alloc.c:3994
> __alloc_pages_slowpath.constprop.0+0x2ef/0x2140 mm/page_alloc.c:4762
> __alloc_pages+0x422/0x500 mm/page_alloc.c:5213
> alloc_pages+0x18c/0x2a0 mm/mempolicy.c:2272
> alloc_slab_page mm/slub.c:1644 [inline]
> allocate_slab+0x2c5/0x4c0 mm/slub.c:1784
> new_slab mm/slub.c:1847 [inline]
> new_slab_objects mm/slub.c:2593 [inline]
> ___slab_alloc+0x44c/0x7a0 mm/slub.c:2756
> __slab_alloc.constprop.0+0xa7/0xf0 mm/slub.c:2796
> slab_alloc_node mm/slub.c:2878 [inline]
> slab_alloc mm/slub.c:2920 [inline]
> kmem_cache_alloc+0x34b/0x3a0 mm/slub.c:2925
> gfs2_glock_get+0x20e/0x1100 fs/gfs2/glock.c:1027
> gfs2_inode_lookup+0x2c9/0xb10 fs/gfs2/inode.c:149
> gfs2_dir_search+0x20f/0x2c0 fs/gfs2/dir.c:1665
> gfs2_lookupi+0x475/0x640 fs/gfs2/inode.c:332
> gfs2_lookup_simple+0x99/0xe0 fs/gfs2/inode.c:273
> init_statfs fs/gfs2/ops_fstype.c:649 [inline]
> init_journal fs/gfs2/ops_fstype.c:805 [inline]
> init_inodes+0xd8f/0x2610 fs/gfs2/ops_fstype.c:874
> gfs2_fill_super+0x1b4a/0x2680 fs/gfs2/ops_fstype.c:1204
> get_tree_bdev+0x440/0x760 fs/super.c:1293
>page last free stack trace:
> reset_page_owner include/linux/page_owner.h:24 [inline]
> free_pages_prepare mm/page_alloc.c:1298 [inline]
> __free_pages_ok+0x476/0xce0 mm/page_alloc.c:1572
> qlink_free mm/kasan/quarantine.c:146 [inline]
> qlist_free_all+0x5a/0xc0 mm/kasan/quarantine.c:165
> kasan_quarantine_reduce+0x180/0x200 mm/kasan/quarantine.c:272
> __kasan_slab_alloc+0x8e/0xa0 mm/kasan/common.c:438
> kasan_slab_alloc include/linux/kasan.h:236 [inline]
> slab_post_alloc_hook mm/slab.h:524 [inline]
> slab_alloc_node mm/slub.c:2912 [inline]
> slab_alloc mm/slub.c:2920 [inline]
> __kmalloc+0x1f7/0x330 mm/slub.c:4063
> kmalloc include/linux/slab.h:561 [inline]
> tomoyo_realpath_from_path+0xc3/0x620 security/tomoyo/realpath.c:254
> tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
> tomoyo_path_number_perm+0x1d5/0x590 security/tomoyo/file.c:723
> security_path_chmod+0xe0/0x150 security/security.c:1205
> chmod_common+0x156/0x440 fs/open.c:580
> vfs_fchmod fs/open.c:601 [inline]
> __do_sys_fchmod fs/open.c:610 [inline]
> __se_sys_fchmod fs/open.c:604 [inline]
> __x64_sys_fchmod+0x10e/0x190 fs/open.c:604
> do_syscall_64+0x3a/0xb0 arch/x86/entry/common.c:47
> entry_SYSCALL_64_after_hwframe+0x44/0xae
>
>Memory state around the buggy address:
> ffff888074ee8e00: fc fc fa fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff888074ee8e80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>>ffff888074ee8f00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                               ^
> ffff888074ee8f80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ffff888074ee9000: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>==================================================================

When put, glock is removed from lru by calling gfs2_glock_remove_from_lru()
in __gfs2_glock_put(), and check GLF_LRU under lru_lock.

On the shrink scan path, GLF_LRU is cleared under lru_lock but because of
cond_resched_lock(&lru_lock) in gfs2_dispose_glock_lru() progress on the put
side can be made without deleting glock from lru.

Keep GLF_LRU across the race window opened by cond_resched_lock(&lru_lock) to
ensure correct behavior on both sides - clrear GLF_LRU after list_del under
lru_lock.

+++ x/fs/gfs2/glock.c
@@ -1772,6 +1772,7 @@ __acquires(&lru_lock)
 	while(!list_empty(list)) {
 		gl = list_first_entry(list, struct gfs2_glock, gl_lru);
 		list_del_init(&gl->gl_lru);
+		clear_bit(GLF_LRU, &gl->gl_flags);
 		if (!spin_trylock(&gl->gl_lockref.lock)) {
 add_back_to_lru:
 			list_add(&gl->gl_lru, &lru_list);
@@ -1817,7 +1818,6 @@ static long gfs2_scan_glock_lru(int nr)
 		if (!test_bit(GLF_LOCK, &gl->gl_flags)) {
 			list_move(&gl->gl_lru, &dispose);
 			atomic_dec(&lru_count);
-			clear_bit(GLF_LRU, &gl->gl_flags);
 			freed++;
 			continue;
 		}

