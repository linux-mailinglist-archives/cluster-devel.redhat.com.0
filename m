Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id BA2A0423A8D
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Oct 2021 11:29:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-vJXDHmwHPjK8ZPNxhZUT1w-1; Wed, 06 Oct 2021 05:29:54 -0400
X-MC-Unique: vJXDHmwHPjK8ZPNxhZUT1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F57419057A1;
	Wed,  6 Oct 2021 09:29:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 189F760853;
	Wed,  6 Oct 2021 09:29:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E6A04E58F;
	Wed,  6 Oct 2021 09:29:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1968oYIn018001 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 6 Oct 2021 04:50:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F2D101111C7A; Wed,  6 Oct 2021 08:50:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C90701111C73
	for <cluster-devel@redhat.com>; Wed,  6 Oct 2021 08:50:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27EF7106655B
	for <cluster-devel@redhat.com>; Wed,  6 Oct 2021 08:50:20 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-586-xWKAhxVaNnSM5Ewm4OR4Mw-1; Wed, 06 Oct 2021 04:50:18 -0400
X-MC-Unique: xWKAhxVaNnSM5Ewm4OR4Mw-1
Received: by mail-pg1-f172.google.com with SMTP id m21so1846138pgu.13;
	Wed, 06 Oct 2021 01:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=LxKB3Z4BeksT4+ri8p3FaoCWWPOgr+gZjaYw4P86Xr8=;
	b=20lnBhJbCJh0H6DFdQkhLKtTCOMhXy5YTubUlSLNZhheBS89pybEyP7QD5HZpgi/XQ
	WBnvU2KGa1I6Qx0VKwNn1xl05++bTUQi1lflUz0Lcq2S6xOlQhlVZvD0tV+EGeA/MYw9
	uYX5h5Gd+ZoLtNfHoDs7KvcDj4gFDIFnpvTqXOKGq6jlOY1WED5bRCNTMDbr/OMnmgK1
	dnI9ukCAHqfuRYfuTl0YpX3RBSC3xImvIPQxczGIM2KgUmIRgYNvs76PxP4AguhIKFMf
	5fA9B8rmBPS8SErX8wR1Q1Xs77pfdruTP7FS8q3MXcCpWPF4OXJOOmFoaQd0IWeMWleZ
	5EYw==
X-Gm-Message-State: AOAM533ZpeCAoQTpEcN67o4AwwxmOOFRKJqoz5R+Eo7uDwz44+FJiRd9
	VeFZ1V4P94viYden3Hw/CdUok6txpCPnaQ/MwVs1nIXLp/RRkio=
X-Google-Smtp-Source: ABdhPJyoNc3LWpNUEkZVvte9LOhwYpwfuiD10xHcG/aqb9r50ClL/HDoTtO5p2AU8a3RMnCXreNY8w2lr0DQtmIdL4g=
X-Received: by 2002:a65:6389:: with SMTP id h9mr19768206pgv.83.1633510216787; 
	Wed, 06 Oct 2021 01:50:16 -0700 (PDT)
MIME-Version: 1.0
From: Hao Sun <sunhao.th@gmail.com>
Date: Wed, 6 Oct 2021 16:50:05 +0800
Message-ID: <CACkBjsbEcdArgkRDy0QVegPoDCUPNGDikPCa_hBprEQb-6TThQ@mail.gmail.com>
To: rpeterso@redhat.com, agruenba@redhat.com, cluster-devel@redhat.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	akpm@linux-foundation.org, Linux MM <linux-mm@kvack.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 06 Oct 2021 05:22:48 -0400
Subject: [Cluster-devel] WARNING in __set_page_dirty
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

When using Healer to fuzz the latest Linux kernel, the following crash
was triggered.

HEAD commit: 0513e464f900 Merge tag 'perf-tools-fixes-for-v5.15-2021-09-27'
git tree: upstream
console output:
https://drive.google.com/file/d/1Tqtv5Qcx5LDPwnv7b2uJS2bilqpGfipG/view?usp=sharing
kernel config: https://drive.google.com/file/d/1Jqhc4DpCVE8X7d-XBdQnrMoQzifTG5ho/view?usp=sharing

If you fix this issue, please add the following tag to the commit:
Reported-by: Hao Sun <sunhao.th@gmail.com>

------------[ cut here ]------------
WARNING: CPU: 0 PID: 19902 at ./include/linux/backing-dev.h:286
inode_to_wb include/linux/backing-dev.h:283 [inline]
WARNING: CPU: 0 PID: 19902 at ./include/linux/backing-dev.h:286
account_page_dirtied mm/page-writeback.c:2452 [inline]
WARNING: CPU: 0 PID: 19902 at ./include/linux/backing-dev.h:286
__set_page_dirty+0x50b/0x6e0 mm/page-writeback.c:2500
Modules linked in:
CPU: 0 PID: 19902 Comm: syz-executor Not tainted 5.15.0-rc3+ #21
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
RIP: 0010:inode_to_wb include/linux/backing-dev.h:283 [inline]
RIP: 0010:account_page_dirtied mm/page-writeback.c:2452 [inline]
RIP: 0010:__set_page_dirty+0x50b/0x6e0 mm/page-writeback.c:2500
Code: fc ff ff e8 d7 0a f1 ff 49 8b 87 a8 01 00 00 be ff ff ff ff 48
8d 78 70 e8 a2 42 de 02 85 c0 0f 85 18 fc ff ff e8 b5 0a f1 ff <0f> 0b
e9 0c fc ff ff e8 a9 0a f1 ff 48 89 ef e8 f1 ea d8 00 48 8b
RSP: 0018:ffffc90003e7bd08 EFLAGS: 00010093
RAX: 0000000000000000 RBX: ffffea000083a140 RCX: 0000000000000000
RDX: ffff88810e1b8000 RSI: ffffffff814686ab RDI: ffffffff853ccbb6
RBP: ffff88800ce0bec8 R08: 0000000000000001 R09: 0000000000000000
R10: ffffc90003e7bbb8 R11: 0000000000000003 R12: ffff8881100ecc98
R13: ffff8881045ac000 R14: 0000000000000293 R15: ffff88800ce0bec8
FS:  00007f72d08c8700(0000) GS:ffff88807dc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000003 CR3: 000000001a0a6000 CR4: 0000000000750ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000600
PKRU: 55555554
Call Trace:
 mark_buffer_dirty+0x1d4/0x2b0 fs/buffer.c:1108
 gfs2_unpin+0x74/0x460 fs/gfs2/lops.c:111
 buf_lo_after_commit+0x6b/0x80 fs/gfs2/lops.c:750
 lops_after_commit fs/gfs2/lops.h:49 [inline]
 gfs2_log_flush+0x9ba/0x1050 fs/gfs2/log.c:1108
 gfs2_sync_fs+0x3c/0x50 fs/gfs2/super.c:644
 sync_fs_one_sb+0x40/0x50 fs/sync.c:81
 iterate_supers+0xa7/0x130 fs/super.c:695
 ksys_sync+0x60/0xc0 fs/sync.c:116
 __do_sys_sync+0xa/0x10 fs/sync.c:125
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x34/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x200008ca
Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 98 4a 2a e9 2c b8 b6 4c 0f 05 <bf> 00
00 40 00 c4 a3 7b f0 c5 01 41 e2 e9 c4 22 e9 aa bb 3c 00 00
RSP: 002b:00007f72d08c7ba8 EFLAGS: 00000a83 ORIG_RAX: 00000000000000a2
RAX: ffffffffffffffda RBX: 0000000000000009 RCX: 00000000200008ca
RDX: 0000000000004c01 RSI: 0000000000000003 RDI: 0000000000400000
RBP: 00000000000000eb R08: 0000000000000005 R09: 0000000000000006
R10: 0000000000000007 R11: 0000000000000a83 R12: 000000000000000b
R13: 000000000000000c R14: 000000000000000d R15: 00007ffe4f7c7800

