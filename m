Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.145.221.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868565BD08
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Jan 2023 10:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672737702;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xbcYa5eQg7Z8jNSA/cnWkeX8JLb+cVTBidKMi6pk1gg=;
	b=BNbX1/dHx5yfiC0b2UOjDzFxdWsMYiFScLtZhyqrYnNOTEzdEorZQC2LLTp4YENZNCm8JI
	eMthKAOyMcuLEtcExBj3firHdMWq4cz0cmJMClMb4rwm0ebBjQDHuBjvvd+obLLjqadjpL
	bMUENdOdsgaCkh5qOcp8KqEo3oGas9I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2--o_uBiR-MQmshpGFQ_Br2w-1; Tue, 03 Jan 2023 04:21:41 -0500
X-MC-Unique: -o_uBiR-MQmshpGFQ_Br2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B5A27180965E;
	Tue,  3 Jan 2023 09:21:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A44BE2026D4B;
	Tue,  3 Jan 2023 09:21:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6F944194658C;
	Tue,  3 Jan 2023 09:21:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3EFC71946594 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 18 Dec 2022 06:01:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 22CDF2026D68; Sun, 18 Dec 2022 06:01:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AE882026D4B
 for <cluster-devel@redhat.com>; Sun, 18 Dec 2022 06:01:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFD81101A521
 for <cluster-devel@redhat.com>; Sun, 18 Dec 2022 06:01:38 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-224-M7eAq_HAPfGHdmj1LM9JeQ-1; Sun, 18 Dec 2022 01:01:35 -0500
X-MC-Unique: M7eAq_HAPfGHdmj1LM9JeQ-1
Received: by mail-il1-f198.google.com with SMTP id
 o10-20020a056e02102a00b003006328df7bso4649804ilj.17
 for <cluster-devel@redhat.com>; Sat, 17 Dec 2022 22:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xbcYa5eQg7Z8jNSA/cnWkeX8JLb+cVTBidKMi6pk1gg=;
 b=h9hlOOhusn3CAweEWE2dash5xY//OWe27T3mTP2+7+KwNida1y8oA8OYWflNvrueII
 /dG7dybVt5Ul6FM2bKjTi2wBKO8gLRtvTi10keShiRf343HxidRhk6Ah5z+KikhLKZpD
 ChuqS8JekNuAsq8nx7UamAp47/Az6kJUUuRwDu8q26C0An8PhONxQrUOrnlIeQIqbfFp
 9/apBo04bFvMSQv6kAu4YmvbaInagVIdc1pDBla8eFHL0QaVVv88Kn/YTbDOMTKQOJpJ
 YFg9i04EqkNhOb4GI5311UzAuvtwEOhB/y6xUaB2p5BC7rgu/yWtbm4NxWFPYR4dTCDK
 NXPg==
X-Gm-Message-State: ANoB5pmphF59pVCKLKotaFZAdECOmz2EwDfTwGxPxTUsePg58VQoMwu9
 Y2j8mLRcO3Mb/tHqAdjEWHbpN5jpAE+Q7okDCPAgrUmWD6kY
X-Google-Smtp-Source: AA0mqf5oSs80u9WQ2kCvE5YeFKbRq/AR38ghYqE+5FqSCqx+wmXjOMWe1dHy+1FftsAFEHtlxdJztKNPGJ0wFCTEOA4f4olKWFPy
MIME-Version: 1.0
X-Received: by 2002:a02:95ca:0:b0:363:ab01:e25f with SMTP id
 b68-20020a0295ca000000b00363ab01e25fmr46256323jai.167.1671343294459; Sat, 17
 Dec 2022 22:01:34 -0800 (PST)
Date: Sat, 17 Dec 2022 22:01:34 -0800
In-Reply-To: <000000000000ab092305e268a016@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005d3b2c05f013ef1d@google.com>
From: syzbot <syzbot+8a5fc6416c175cecea34@syzkaller.appspotmail.com>
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
X-Mailman-Approved-At: Tue, 03 Jan 2023 09:21:37 +0000
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] general protection fault in
 gfs2_evict_inode (2)
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

HEAD commit:    a5541c0811a0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=15551327880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cbd4e584773e9397
dashboard link: https://syzkaller.appspot.com/bug?extid=8a5fc6416c175cecea34
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1718796f880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1735df8f880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b7702208fb9/disk-a5541c08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec0153ec051/vmlinux-a5541c08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6f8725ad290a/Image-a5541c08.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/b4c763067524/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8a5fc6416c175cecea34@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: error recovering journal 0: -5
Unable to handle kernel NULL pointer dereference at virtual address 000000000000008c
Mem abort info:
  ESR = 0x0000000096000006
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x06: level 2 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000006
  CM = 0, WnR = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000010dd7c000
[000000000000008c] pgd=080000010bf77003, p4d=080000010bf77003, pud=080000010a9f1003, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 3071 Comm: syz-executor179 Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : evict_linked_inode fs/gfs2/super.c:1330 [inline]
pc : gfs2_evict_inode+0x6f8/0x918 fs/gfs2/super.c:1385
lr : evict_linked_inode fs/gfs2/super.c:1328 [inline]
lr : gfs2_evict_inode+0x6ec/0x918 fs/gfs2/super.c:1385
sp : ffff80000ff73830
x29: ffff80000ff738a0 x28: 0000000000000000 x27: 0000000000000000
x26: ffff0000cb74c728 x25: 0000000000008004 x24: ffff0000c9b25110
x23: ffff0000cb74c000 x22: ffff0000c9b24e70 x21: ffff0000cb74c000
x20: ffff0000ca579770 x19: ffff0000ca5792c0 x18: 00000000000000c0
x17: ffff80000dda8198 x16: ffff80000dbe6158 x15: ffff0000c407cec0
x14: 00000000000000b8 x13: 00000000ffffffff x12: ffff0000c407cec0
x11: ff80800009278314 x10: 0000000000000000 x9 : ffff800009278314
x8 : 0000000000000000 x7 : ffff80000862aa80 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000001 x1 : 0000000000000000 x0 : ffff0000cb74c000
Call trace:
 evict_linked_inode fs/gfs2/super.c:1330 [inline]
 gfs2_evict_inode+0x6f8/0x918 fs/gfs2/super.c:1385
 evict+0xec/0x334 fs/inode.c:664
 iput_final fs/inode.c:1747 [inline]
 iput+0x2c4/0x324 fs/inode.c:1773
 gfs2_jindex_free+0x10c/0x16c fs/gfs2/super.c:75
 init_journal+0x518/0xcbc fs/gfs2/ops_fstype.c:871
 init_inodes+0x74/0x184 fs/gfs2/ops_fstype.c:889
 gfs2_fill_super+0x630/0x874 fs/gfs2/ops_fstype.c:1247
 get_tree_bdev+0x1e8/0x2a0 fs/super.c:1324
 gfs2_get_tree+0x30/0xc0 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x40/0x140 fs/super.c:1531
 do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
 path_mount+0x358/0x890 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x140 arch/arm64/kernel/syscall.c:197
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
Code: 97ff3736 f94482e8 aa1703e0 2a1f03e1 (b9408d02) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	97ff3736 	bl	0xfffffffffffcdcd8
   4:	f94482e8 	ldr	x8, [x23, #2304]
   8:	aa1703e0 	mov	x0, x23
   c:	2a1f03e1 	mov	w1, wzr
* 10:	b9408d02 	ldr	w2, [x8, #140] <-- trapping instruction

