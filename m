Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF1864B9D4
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Dec 2022 17:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670949186;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=AFnkrqn569e2OndyNQxNbTLfH9dPwRk1pHBzW5nmI/w=;
	b=A1nThGBenI7/yYVLcv5OUQstxAbX4TqpApUC2uc8DrZ1+rDSdbyxrynwspshRT3y6OpwQn
	qCzBMRpQz2Iyodh3g+EyNDpFK1PSUT5ccBFtMS6BUTekjUwVKVopns+gcmu0poUhLY3RI6
	puWJP4Ct/T3Sz+beSCN/lxpgPeT+dNM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-KdAH3TqbMVSSPt260iwijQ-1; Tue, 13 Dec 2022 11:33:03 -0500
X-MC-Unique: KdAH3TqbMVSSPt260iwijQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3882218E538C;
	Tue, 13 Dec 2022 16:33:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 763BB14152F6;
	Tue, 13 Dec 2022 16:33:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5D4D4194658D;
	Tue, 13 Dec 2022 16:32:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 258051946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Dec 2022 07:03:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EA69C79A1; Mon, 12 Dec 2022 07:03:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E295B53A4
 for <cluster-devel@redhat.com>; Mon, 12 Dec 2022 07:03:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0EEC1C05EB7
 for <cluster-devel@redhat.com>; Mon, 12 Dec 2022 07:03:05 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-499-ov1UZl6hP3K67Vy302VcNg-1; Mon, 12 Dec 2022 02:03:03 -0500
X-MC-Unique: ov1UZl6hP3K67Vy302VcNg-1
Received: by mail-il1-f199.google.com with SMTP id
 i21-20020a056e021d1500b003041b04e3ebso4521968ila.7
 for <cluster-devel@redhat.com>; Sun, 11 Dec 2022 23:03:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AFnkrqn569e2OndyNQxNbTLfH9dPwRk1pHBzW5nmI/w=;
 b=qy70TlVTsFN+KBjGBZfBBU1JptM98mk+Xzapma8s1nBegb0mV/RyeS3OlhDGTYKEH2
 BVcyzDUsmAqtB8Q6Dv2Odbn/ljy9Q2LtskPwnRnL33SRD8nHqc1BWt1GjV63ugFlhxAY
 iNlfZo4vVdDOamuSrAUaMj1gBgaj9g9JY8r4pLTZ/493VmBzFj/fAJuT3o5g/Ms7tYQg
 koHldY5UrUnA5jcghhC6i5RVNZ7BkHbKp/Zi16d1bqss+3mtpwMFB2SYbvztgdftznh0
 VO929xf7JgAw+JxGjvaPUe+TbLwQXiJQ52tSi0WV6XBdGwJLyK+rxT4MxUBHhKPo3lut
 UZsA==
X-Gm-Message-State: ANoB5pkkMK659HF/4uqw2LkCZgXKHz4Cv+5WpA1jUHmR09GErPnLuws0
 u36csv6YEvJVBt4rLeTm1vL3oBDb2rxGGB17AbDFweUg6XMe
X-Google-Smtp-Source: AA0mqf5PdzrCNSZRXvVmes7BxseB0VSlSEGeGI6WU2qojswJ4gAjCDSiz5q9kfodgNuWlGqn9XzMUwAE4gR45S72AHYT7j8P9UH2
MIME-Version: 1.0
X-Received: by 2002:a92:d18e:0:b0:302:ca31:62a1 with SMTP id
 z14-20020a92d18e000000b00302ca3162a1mr35293800ilz.42.1670828582871; Sun, 11
 Dec 2022 23:03:02 -0800 (PST)
Date: Sun, 11 Dec 2022 23:03:02 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000029b00c05ef9c1802@google.com>
From: syzbot <syzbot+092b28923eb79e0f3c41@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 13 Dec 2022 16:32:52 +0000
Subject: [Cluster-devel] [syzbot] WARNING in gfs2_check_blk_type
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4cee37b3a4e6 Merge tag 'mm-hotfixes-stable-2022-12-10-1' o..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14da950b880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d58e7fe7f9cf5e24
dashboard link: https://syzkaller.appspot.com/bug?extid=092b28923eb79e0f3c41
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14f12ddb880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10ebee1f880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/051fc9a10d4a/disk-4cee37b3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c40b15750245/vmlinux-4cee37b3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a25e4bc102fa/bzImage-4cee37b3.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f10d144677a2/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+092b28923eb79e0f3c41@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: first mount done, others may mount
------------[ cut here ]------------
WARNING: CPU: 0 PID: 3635 at fs/gfs2/rgrp.c:2628 gfs2_rbm_from_block fs/gfs2/rgrp.c:279 [inline]
WARNING: CPU: 0 PID: 3635 at fs/gfs2/rgrp.c:2628 gfs2_check_blk_type+0x43d/0x660 fs/gfs2/rgrp.c:2627
Modules linked in:
CPU: 0 PID: 3635 Comm: syz-executor328 Not tainted 6.1.0-rc8-syzkaller-00164-g4cee37b3a4e6 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:gfs2_check_blk_type+0x43d/0x660 fs/gfs2/rgrp.c:2628
Code: 85 c6 01 00 00 8b 1b 89 df 44 89 f6 e8 1c ae cd fd 4c 89 74 24 10 44 39 f3 76 21 e8 6d ac cd fd 45 31 ed eb 6d e8 63 ac cd fd <0f> 0b 41 bf f9 ff ff ff 48 8b 5c 24 18 e9 41 01 00 00 e8 4c ac cd
RSP: 0018:ffffc90003c0f8c0 EFLAGS: 00010293
RAX: ffffffff83bcf389 RBX: 0000000000000012 RCX: ffff88802243ba80
RDX: 0000000000000000 RSI: 0000000000000012 RDI: 0000000000000013
RBP: ffffc90003c0f9d0 R08: ffffffff83bcf37f R09: ffffed100e7a15dd
R10: ffffed100e7a15dd R11: 1ffff1100e7a15dc R12: 1ffff1100ea34806
R13: ffff8880751a4000 R14: 1ffff1100ea34805 R15: 0000000000000013
FS:  0000555556210300(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055bda9265e90 CR3: 000000001d27a000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 gfs2_inode_lookup+0xb66/0xd90 fs/gfs2/inode.c:173
 gfs2_lookup_by_inum+0x4d/0xe0 fs/gfs2/inode.c:241
 gfs2_get_dentry fs/gfs2/export.c:139 [inline]
 gfs2_fh_to_dentry+0x12d/0x1f0 fs/gfs2/export.c:162
 exportfs_decode_fh_raw+0x115/0x600 fs/exportfs/expfs.c:435
 exportfs_decode_fh+0x38/0x70 fs/exportfs/expfs.c:575
 do_handle_to_path fs/fhandle.c:152 [inline]
 handle_to_path fs/fhandle.c:207 [inline]
 do_handle_open+0x485/0x950 fs/fhandle.c:223
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f27f5ae1799
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd97d6fbf8 EFLAGS: 00000246 ORIG_RAX: 0000000000000130
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f27f5ae1799
RDX: 0000000000000000 RSI: 0000000020000100 RDI: 0000000000000004
RBP: 00007f27f5aa1030 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000000124d6 R11: 0000000000000246 R12: 00007f27f5aa10c0
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

