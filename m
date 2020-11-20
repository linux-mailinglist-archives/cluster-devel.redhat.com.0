Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECE32BABE7
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Nov 2020 15:34:42 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-IpknejFgNg2pCTBg-kRejg-1; Fri, 20 Nov 2020 09:34:39 -0500
X-MC-Unique: IpknejFgNg2pCTBg-kRejg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1021F18C43C9;
	Fri, 20 Nov 2020 14:34:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81EA419C71;
	Fri, 20 Nov 2020 14:34:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 672CC5002C;
	Fri, 20 Nov 2020 14:34:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AK8gODV016273 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 03:42:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5A37FE77A1; Fri, 20 Nov 2020 08:42:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54729E5B1D
	for <cluster-devel@redhat.com>; Fri, 20 Nov 2020 08:42:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53CD4186E122
	for <cluster-devel@redhat.com>; Fri, 20 Nov 2020 08:42:21 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
	[209.85.166.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-383-EnBVTaOcPGqeAlGAaaGC-A-1; Fri, 20 Nov 2020 03:42:18 -0500
X-MC-Unique: EnBVTaOcPGqeAlGAaaGC-A-1
Received: by mail-io1-f72.google.com with SMTP id j10so6891563iog.22
	for <cluster-devel@redhat.com>; Fri, 20 Nov 2020 00:42:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=mewp/Fhh0sUOZyUminT5HeGbtwpozji8nNrEqkSN9sA=;
	b=rwmeSTRs9SsbyCqLpCaRgCe6EMTYVIeh1pSsVm/byCW9s+O9d/3FlJvjUn+WbaIbyB
	3Lxvo1B0JMFwUciBrdMbFjQNGBRcCzI4axdTyEybAUo4zsiFEmgPR19Lh7dlosd4f6OS
	OIhOR3QpOEYPOI8lkQZPeMZdf+JeBZ69AXk97aUWslFkZT6yzY2W4Fqf+ziDFsrZKY8O
	T+pjuBj8ZopmuAFEqlTGWAM3rmoVar8+ZBaLqX8XpyLRuxTc8//ANheNVvabX/WvJBUi
	PMdlUchlc/ntAxM8V1H+PL5DeSmLVcBi4dpCN/BlwIWIkD7MpCOIRM3jYDQTSLqHaFA/
	pfLg==
X-Gm-Message-State: AOAM531ALZjDoNgwqfnRpAT6nxSWd/h4hrxi4QjcMxdu/I7qhcASfz/K
	XwxPtJDA+o1Dx3jMYTEyUX78yMQN2LTWz+EAF08Waaiod4Ih
X-Google-Smtp-Source: ABdhPJz2kyGMHo/CfKs9S8pAbHA1KUN5H7SKQF7pIHjRk2bUDqP4ptFswplccsj2TJ71F+DY9Q6TWAWuurWx1Z12uO2LHwrUd4oS
MIME-Version: 1.0
X-Received: by 2002:a92:dc02:: with SMTP id t2mr25459633iln.82.1605861738052; 
	Fri, 20 Nov 2020 00:42:18 -0800 (PST)
Date: Fri, 20 Nov 2020 00:42:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000074835105b485d25c@google.com>
From: syzbot <syzbot+e3f23ce40269a4c9053a@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 20 Nov 2020 09:34:25 -0500
Subject: [Cluster-devel] general protection fault in gfs2_ri_update
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    92edc4ae Add linux-next specific files for 20201113
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1564a81c500000
kernel config:  https://syzkaller.appspot.com/x/.config?x=79ad4f8ad2d96176
dashboard link: https://syzkaller.appspot.com/bug?extid=e3f23ce40269a4c9053a
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e3f23ce40269a4c9053a@syzkaller.appspotmail.com

gfs2: fsid=syz:syz: Now mounting FS...
gfs2: fsid=syz:syz.0: journal 0 mapped with 1 extents in 0ms
gfs2: fsid=syz:syz.0: first mount done, others may mount
general protection fault, probably for non-canonical address 0xdffffc000000000e: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000070-0x0000000000000077]
CPU: 0 PID: 5537 Comm: syz-executor.4 Not tainted 5.10.0-rc3-next-20201113-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:set_rgrp_preferences fs/gfs2/rgrp.c:960 [inline]
RIP: 0010:gfs2_ri_update+0x289/0x520 fs/gfs2/rgrp.c:988
Code: e0 48 83 c4 18 5b 5d 41 5c 41 5d 41 5e 41 5f c3 e8 3c e7 22 fe 49 8d 7f 74 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 68
RSP: 0018:ffffc9000175f7e0 EFLAGS: 00010203
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffc900122b2000
RDX: 000000000000000e RSI: ffffffff834dace4 RDI: 0000000000000074
RBP: ffff8880680847d0 R08: 0000000000000000 R09: ffff8880680847d3
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000000 R14: ffff8880680847cc R15: 0000000000000000
FS:  00007fccb3d41700(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055af34aaf000 CR3: 0000000025b49000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 gfs2_rindex_update+0x3ce/0x450 fs/gfs2/rgrp.c:1028
 init_inodes+0x1ddf/0x2650 fs/gfs2/ops_fstype.c:885
 gfs2_fill_super+0x199c/0x23f0 fs/gfs2/ops_fstype.c:1184
 get_tree_bdev+0x421/0x740 fs/super.c:1344
 gfs2_get_tree+0x4a/0x270 fs/gfs2/ops_fstype.c:1260
 vfs_get_tree+0x89/0x2f0 fs/super.c:1549
 do_new_mount fs/namespace.c:2896 [inline]
 path_mount+0x12ae/0x1e70 fs/namespace.c:3227
 do_mount fs/namespace.c:3240 [inline]
 __do_sys_mount fs/namespace.c:3448 [inline]
 __se_sys_mount fs/namespace.c:3425 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3425
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x46090a
Code: b8 a6 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 ad 89 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 8a 89 fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007fccb3d40a88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fccb3d40b20 RCX: 000000000046090a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fccb3d40ae0
RBP: 00007fccb3d40ae0 R08: 00007fccb3d40b20 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 0000000020000200 R15: 0000000020047a20
Modules linked in:
---[ end trace 30aa056702410d7c ]---
RIP: 0010:set_rgrp_preferences fs/gfs2/rgrp.c:960 [inline]
RIP: 0010:gfs2_ri_update+0x289/0x520 fs/gfs2/rgrp.c:988
Code: e0 48 83 c4 18 5b 5d 41 5c 41 5d 41 5e 41 5f c3 e8 3c e7 22 fe 49 8d 7f 74 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 <0f> b6 14 02 48 89 f8 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 68
RSP: 0018:ffffc9000175f7e0 EFLAGS: 00010203
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffc900122b2000
RDX: 000000000000000e RSI: ffffffff834dace4 RDI: 0000000000000074
RBP: ffff8880680847d0 R08: 0000000000000000 R09: ffff8880680847d3
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000000 R14: ffff8880680847cc R15: 0000000000000000
FS:  00007fccb3d41700(0000) GS:ffff8880b9e00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055af34a29900 CR3: 0000000025b49000 CR4: 00000000001506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

