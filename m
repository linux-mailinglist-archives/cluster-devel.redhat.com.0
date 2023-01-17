Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E777566DBA6
	for <lists+cluster-devel@lfdr.de>; Tue, 17 Jan 2023 11:56:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673952990;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KJYBrcqUwdRqgvgHo+3fqcuaRSbYa+PJ6bUTeyvavX0=;
	b=SaFUycM3nIP1E4OtuyiJaKMaCKpGOvgYwdMDoVcBFO8SaVrYb9r+hbpNgr4V76PnpvEc1n
	D1sgi19Q9OMxUL4q/iYziwzehfszR6/ZbJgwDRDzqedQxRIJV1wCb/NBtq1BV/Ox4HLDdy
	m0M0u6bfCvosprFLulxbhCy+EsVw6ws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-NbSdSrsvO26mWr-VBFtOiA-1; Tue, 17 Jan 2023 05:56:27 -0500
X-MC-Unique: NbSdSrsvO26mWr-VBFtOiA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5E3718ABF92;
	Tue, 17 Jan 2023 10:56:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 87393492B11;
	Tue, 17 Jan 2023 10:56:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E5FA019465BA;
	Tue, 17 Jan 2023 10:56:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 480A919465A3 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 17 Jan 2023 10:38:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0E30DC15BAD; Tue, 17 Jan 2023 10:38:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0726FC15BA0
 for <cluster-devel@redhat.com>; Tue, 17 Jan 2023 10:38:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6ADD38149AB
 for <cluster-devel@redhat.com>; Tue, 17 Jan 2023 10:38:41 +0000 (UTC)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-FL2vWjqRPk6tKn9KtCspgw-1; Tue, 17 Jan 2023 05:38:40 -0500
X-MC-Unique: FL2vWjqRPk6tKn9KtCspgw-1
Received: by mail-il1-f200.google.com with SMTP id
 z19-20020a921a53000000b0030b90211df1so22319284ill.2
 for <cluster-devel@redhat.com>; Tue, 17 Jan 2023 02:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KJYBrcqUwdRqgvgHo+3fqcuaRSbYa+PJ6bUTeyvavX0=;
 b=6Xj7NjMubvAwhuAfFcK9Gqh/RtTQEp/67+aEuQPQcA7u0wNBeXEJxXsFuuwZCPtjva
 p50CdydvjQAPVnjNmLIPB0uPvjmXq3plrKqCG45p5ajtyiayj4uXaSq1wh+O0hn97mGQ
 FfnkL2wgyF/VFfcxL3QxLDWaoEBTrJN5kN1Kw2oi1WSY7RVM8cVYNXMIDaAIcJGop+dO
 ueiEeN8T4k0xfKXYn1mUABglAokLYTtyIb0Jt94FJzNtPaIJCE33YZifnYWiVujSWfOa
 pmkZZ+4fnRlu5ClIP5yQUxLjsFPGkGufV4S69QmpK9w/AhOS0qnMMPlxDMD98MtRWUNF
 r+YQ==
X-Gm-Message-State: AFqh2kq9sYHBt3HiYqBOsEKsGvpibppWNuqewrPzTPsR3b9UE00zT1MX
 F0dJsZvT2gWqOnZ0BBazwj/76Jiw5MimmwMlayT+rAmUU2om
X-Google-Smtp-Source: AMrXdXtuDg/cf/b17BDJQqrV0DKh0G9mu7eoPQM5tkFdidkp3/cP27/pflxHXRPKAQEImzm4sjUx0YI2mv7roi97eeT2ZsBXII7/
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3e09:b0:3a5:e79b:c8eb with SMTP id
 co9-20020a0566383e0900b003a5e79bc8ebmr201335jab.198.1673951919671; Tue, 17
 Jan 2023 02:38:39 -0800 (PST)
Date: Tue, 17 Jan 2023 02:38:39 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008b105805f2734d55@google.com>
From: syzbot <syzbot+79333ce1ae874ab7ffbb@syzkaller.appspotmail.com>
To: agruenba@redhat.com, cluster-devel@redhat.com, glider@google.com, 
 linux-kernel@vger.kernel.org, rpeterso@redhat.com, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 17 Jan 2023 10:56:24 +0000
Subject: [Cluster-devel] [syzbot] [gfs2?] KMSAN: uninit-value in
 inode_go_dump
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

HEAD commit:    e919e2b1bc1c Revert "kmsan: disallow CONFIG_KMSAN with CON..
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=11530191480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b63e082c4fda2e77
dashboard link: https://syzkaller.appspot.com/bug?extid=79333ce1ae874ab7ffbb
compiler:       clang version 15.0.0 (https://github.com/llvm/llvm-project.git 610139d2d9ce6746b3c617fb3e2f7886272d26ff), GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5676c9771994/disk-e919e2b1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7f53a1472ca4/vmlinux-e919e2b1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/eb021c0a44de/bzImage-e919e2b1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+79333ce1ae874ab7ffbb@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: G:  s:SH n:2/13 f:qobnN t:SH d:EX/0 a:0 v:0 r:3 m:20 p:1
gfs2: fsid=syz:syz.0:  H: s:SH f:eEcH e:0 p:0 [(none)] init_inodes+0x125/0x510 fs/gfs2/ops_fstype.c:889
=====================================================
BUG: KMSAN: uninit-value in inode_go_dump+0x499/0x4d0 fs/gfs2/glops.c:544
 inode_go_dump+0x499/0x4d0 fs/gfs2/glops.c:544
 gfs2_dump_glock+0x21d1/0x2300 fs/gfs2/glock.c:2379
 gfs2_consist_inode_i+0x19b/0x220 fs/gfs2/util.c:465
 gfs2_dinode_in fs/gfs2/glops.c:460 [inline]
 gfs2_inode_refresh+0x10d9/0x14e0 fs/gfs2/glops.c:480
 inode_go_instantiate+0x6a/0xc0 fs/gfs2/glops.c:499
 gfs2_instantiate+0x253/0x490 fs/gfs2/glock.c:456
 gfs2_glock_holder_ready fs/gfs2/glock.c:1299 [inline]
 gfs2_glock_wait+0x28a/0x3d0 fs/gfs2/glock.c:1319
 gfs2_glock_nq+0x8ce/0xbe0 fs/gfs2/glock.c:1567
 gfs2_glock_nq_init fs/gfs2/glock.h:262 [inline]
 init_journal+0x11f2/0x38e0 fs/gfs2/ops_fstype.c:794
 init_inodes+0x125/0x510 fs/gfs2/ops_fstype.c:889
 gfs2_fill_super+0x3b2d/0x43a0 fs/gfs2/ops_fstype.c:1247
 get_tree_bdev+0x8a3/0xd30 fs/super.c:1282
 gfs2_get_tree+0x58/0x340 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0xa1/0x500 fs/super.c:1489
 do_new_mount+0x694/0x1580 fs/namespace.c:3145
 path_mount+0x71a/0x1eb0 fs/namespace.c:3475
 do_mount fs/namespace.c:3488 [inline]
 __do_sys_mount fs/namespace.c:3697 [inline]
 __se_sys_mount+0x734/0x840 fs/namespace.c:3674
 __ia32_sys_mount+0xdf/0x140 fs/namespace.c:3674
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0xa2/0x100 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/common.c:203
 do_SYSENTER_32+0x1b/0x20 arch/x86/entry/common.c:246
 entry_SYSENTER_compat_after_hwframe+0x70/0x82

Uninit was created at:
 __alloc_pages+0x9f1/0xe80 mm/page_alloc.c:5572
 alloc_pages+0xaae/0xd80 mm/mempolicy.c:2286
 alloc_slab_page mm/slub.c:1851 [inline]
 allocate_slab+0x235/0x1200 mm/slub.c:1998
 new_slab mm/slub.c:2051 [inline]
 ___slab_alloc+0x10c3/0x2d60 mm/slub.c:3193
 __slab_alloc mm/slub.c:3292 [inline]
 __slab_alloc_node mm/slub.c:3345 [inline]
 slab_alloc_node mm/slub.c:3442 [inline]
 slab_alloc mm/slub.c:3460 [inline]
 __kmem_cache_alloc_lru mm/slub.c:3467 [inline]
 kmem_cache_alloc_lru+0x713/0xb60 mm/slub.c:3483
 alloc_inode_sb include/linux/fs.h:3119 [inline]
 gfs2_alloc_inode+0x62/0x210 fs/gfs2/super.c:1440
 alloc_inode+0x83/0x440 fs/inode.c:259
 iget5_locked+0xa5/0x200 fs/inode.c:1241
 gfs2_inode_lookup+0xc7/0x14b0 fs/gfs2/inode.c:124
 gfs2_lookup_root fs/gfs2/ops_fstype.c:462 [inline]
 init_sb+0xf27/0x19d0 fs/gfs2/ops_fstype.c:529
 gfs2_fill_super+0x315b/0x43a0 fs/gfs2/ops_fstype.c:1214
 get_tree_bdev+0x8a3/0xd30 fs/super.c:1282
 gfs2_get_tree+0x58/0x340 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0xa1/0x500 fs/super.c:1489
 do_new_mount+0x694/0x1580 fs/namespace.c:3145
 path_mount+0x71a/0x1eb0 fs/namespace.c:3475
 do_mount fs/namespace.c:3488 [inline]
 __do_sys_mount fs/namespace.c:3697 [inline]
 __se_sys_mount+0x734/0x840 fs/namespace.c:3674
 __ia32_sys_mount+0xdf/0x140 fs/namespace.c:3674
 do_syscall_32_irqs_on arch/x86/entry/common.c:112 [inline]
 __do_fast_syscall_32+0xa2/0x100 arch/x86/entry/common.c:178
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/common.c:203
 do_SYSENTER_32+0x1b/0x20 arch/x86/entry/common.c:246
 entry_SYSENTER_compat_after_hwframe+0x70/0x82

CPU: 0 PID: 5906 Comm: syz-executor.3 Not tainted 6.2.0-rc3-syzkaller-79343-ge919e2b1bc1c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

