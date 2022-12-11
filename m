Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6D864B9D9
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Dec 2022 17:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670949260;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=f5qgcerx3Vj6Wa6NeDWtuCgq/K/ALlOEmy7+WWRKZ4M=;
	b=Gi8B7Op+bIJZrU3zynRZrg0tzGZmGOJtety1lYNZBJBKEM1GAy7Lwu3Q3f4NGj6MERl/dv
	Znxr0hLvCv9XVeqifz0hDz6bF72opWLNkq9/sZOXmrNBDrmSoXN+hcWKh+NUGBqGrgYN8+
	ETrjxrbYqLQx7PSz8IvPb6W5mmqEZWg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-CsSmcRJEMlOK8WdOizH0OQ-1; Tue, 13 Dec 2022 11:33:04 -0500
X-MC-Unique: CsSmcRJEMlOK8WdOizH0OQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3826D29324B0;
	Tue, 13 Dec 2022 16:33:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E33CB4039F6B;
	Tue, 13 Dec 2022 16:33:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7777819465A8;
	Tue, 13 Dec 2022 16:32:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D0F9A1947060 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 11 Dec 2022 08:45:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9055C40C6EC3; Sun, 11 Dec 2022 08:45:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8863940C6EC2
 for <cluster-devel@redhat.com>; Sun, 11 Dec 2022 08:45:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D18A101A54E
 for <cluster-devel@redhat.com>; Sun, 11 Dec 2022 08:45:37 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-215-7RoNcY67O5yMyReEOb2w1w-1; Sun, 11 Dec 2022 03:45:35 -0500
X-MC-Unique: 7RoNcY67O5yMyReEOb2w1w-1
Received: by mail-il1-f197.google.com with SMTP id
 k6-20020a92c246000000b003035797fa8cso3091601ilo.8
 for <cluster-devel@redhat.com>; Sun, 11 Dec 2022 00:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f5qgcerx3Vj6Wa6NeDWtuCgq/K/ALlOEmy7+WWRKZ4M=;
 b=B9u8uKg29CYN5rZnVmJmidPfOBY+NyV41FnSEpuFNIA6mcfHSgVUP8qsDU7wUmndRx
 GHyYI7jITiBQKGou4k/QkWogLgdcTNEnhlBBLD0KCUbVnbv8LzVLtfHd7tJj6tcA3SKY
 Ecx+TRrLXhLrivOqRLVwYf21ehISxBxn+F4cmhaCrRvDPT3V2olsvw0xiA/V9dWM0P5e
 syUNesIi+zl4XO/3fkiAeDZFBU/yoWzUAgJRdKIuFlJfmWKsyAznqJObw+Dh4uUCgxQW
 +wxBTfLXo2qzglLPOl+jfRze/CBuz3n91n+xBjajZeqgHx2/AJ/XHwYYoOkK0yBHyDMD
 paBQ==
X-Gm-Message-State: ANoB5plwY9UCz/2hamTZZxotQi9GCujjXqj9+RJlioZ0nDmOOE8Se+7z
 6N+7tYvlnBisQ0Ya8C8Fz0XdTxvvWkxrL0DluJnOidMho2oB
X-Google-Smtp-Source: AA0mqf6JuYcddMUyQ/erCSxEFnAPqYSVM3gYrUn9lylBQ32nF5BTKgcXAY0RBeKgVSYyy88U6/6hh4uld36/nSxDTNTVSZgvQWlZ
MIME-Version: 1.0
X-Received: by 2002:a92:d0f:0:b0:300:c3d4:e9f5 with SMTP id
 15-20020a920d0f000000b00300c3d4e9f5mr36073009iln.317.1670748334581; Sun, 11
 Dec 2022 00:45:34 -0800 (PST)
Date: Sun, 11 Dec 2022 00:45:34 -0800
In-Reply-To: <0000000000007e22cb05dd7cbada@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fdf1b505ef896889@google.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Tue, 13 Dec 2022 16:32:52 +0000
Subject: Re: [Cluster-devel] [syzbot] BUG: sleeping function called from
 invalid context in do_page_fault (3)
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a5541c0811a0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=127e776d880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cbd4e584773e9397
dashboard link: https://syzkaller.appspot.com/bug?extid=2845b2dfa28dec36e215
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1578ffdf880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b7702208fb9/disk-a5541c08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec0153ec051/vmlinux-a5541c08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6f8725ad290a/Image-a5541c08.gz.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/59313e0459cb/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/1afee1432fbe/mount_4.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2845b2dfa28dec36e215@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0:  H: s:?? f:pn e:-32768 p:0 [(none)] preempt_count+0x10/0x24 arch/arm64/include/asm/preempt.h:12
BUG: sleeping function called from invalid context at arch/arm64/mm/fault.c:599
in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 3596, name: syz-executor.0
preempt_count: 0, expected: 0
RCU nest depth: 1, expected: 0
3 locks held by syz-executor.0/3596:
 #0: ffff0000d0712d10 (&type->i_mutex_dir_key#8){.+.+}-{3:3}, at: inode_lock_shared include/linux/fs.h:766 [inline]
 #0: ffff0000d0712d10 (&type->i_mutex_dir_key#8){.+.+}-{3:3}, at: open_last_lookups fs/namei.c:3480 [inline]
 #0: ffff0000d0712d10 (&type->i_mutex_dir_key#8){.+.+}-{3:3}, at: path_openat+0x2e4/0x11c4 fs/namei.c:3711
 #1: ffff80000d4a4640 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire+0x10/0x4c include/linux/rcupdate.h:303
 #2: ffff0000d51feb48 (&mm->mmap_lock){++++}-{3:3}, at: mmap_read_trylock include/linux/mmap_lock.h:136 [inline]
 #2: ffff0000d51feb48 (&mm->mmap_lock){++++}-{3:3}, at: do_page_fault+0x1ec/0x79c arch/arm64/mm/fault.c:589
CPU: 1 PID: 3596 Comm: syz-executor.0 Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
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
 pid_nr include/linux/pid.h:185 [inline]
 dump_holder fs/gfs2/glock.c:2337 [inline]
 gfs2_dump_glock+0x518/0x904 fs/gfs2/glock.c:2447
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
Unable to handle kernel paging request at virtual address 000003fda9bf7ccd
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004

