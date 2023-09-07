Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA57984F0
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Sep 2023 11:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694166136;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=6qIVdRmDrLBZvUQgIhZ+mgd7I9aUWm7XLJQ2fXiufrs=;
	b=JU0pkGPC2uvIf8qlZGw2xNjajjJ4ZxwQpZLwSO4NcfRYZ0GLmxbwjP24wpN12QJejp/T5t
	8YYTWL6dehcRw0sG5YfsMd68YLadVWyg2lXmidPW3RlzuG8+9Re/rdQZOEDmQ7MMSvDlk7
	aHCFVb6ZtLcUi+eZXxdvb3ufa6886F8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-qrvDuRHqNkOjbziU12uVZQ-1; Fri, 08 Sep 2023 05:42:13 -0400
X-MC-Unique: qrvDuRHqNkOjbziU12uVZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6CA1280FED1;
	Fri,  8 Sep 2023 09:42:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97B991121314;
	Fri,  8 Sep 2023 09:42:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7DADD1946595;
	Fri,  8 Sep 2023 09:42:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 594B3194658C for <cluster-devel@listman.corp.redhat.com>;
 Thu,  7 Sep 2023 23:04:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 26DF71121318; Thu,  7 Sep 2023 23:04:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E6761121314
 for <cluster-devel@redhat.com>; Thu,  7 Sep 2023 23:04:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F03D6816533
 for <cluster-devel@redhat.com>; Thu,  7 Sep 2023 23:04:07 +0000 (UTC)
Received: from mail-pg1-f205.google.com (mail-pg1-f205.google.com
 [209.85.215.205]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-auI_VpdqO-yOtu571sgs_Q-1; Thu, 07 Sep 2023 19:04:05 -0400
X-MC-Unique: auI_VpdqO-yOtu571sgs_Q-1
Received: by mail-pg1-f205.google.com with SMTP id
 41be03b00d2f7-56f8334c253so1868490a12.0
 for <cluster-devel@redhat.com>; Thu, 07 Sep 2023 16:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694127844; x=1694732644;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6qIVdRmDrLBZvUQgIhZ+mgd7I9aUWm7XLJQ2fXiufrs=;
 b=eKpsF1Xs72V/gIwSPvCPTSiY1W3iO9hNzpxE2v+y5pLkuh/0VxmOoKQfsRWKaz8zN0
 wnVD/ecO2B2eBlCxpJBNaHuv8kvUTyeEyaXV5af7IJZ0fNkDKkZRjErgJ9zftFkAcMyf
 UwFZ1T/lubqoyCmYThoU0CYh1Kmsw4ip6s9P/3tgoiDsZHETp3LmeVwMhsVdR0jib38E
 wQPBQYaCEydfCDLhAFpFbptDwJmpkswHz+erK/i2av8hcrfLK0lkXsc/vVPyOJAAccDg
 bVjZPF66HoHuUDUvZ9rbf20JARBBvOQaUHU3PKwN1iNUvqGTGP3/IpP1nlnbQUu57aSL
 s02A==
X-Gm-Message-State: AOJu0YzlcCoOe90LvUTQ8o+iZP/4uQGB1E/Fa+La5VMAXVsJj05EWq/w
 n4cCcuEcYtgl6HkzgXW67uRuhLEuZ13lHae2MJxqNNbUVE07
X-Google-Smtp-Source: AGHT+IGjFM79VIw0E5WUJx5G1zVppF7bce/T74F7G7tTulEu1jqtVclFnpL+a50hmITRN9O2pAiGamjUDwI3vodd28iu3mpnxdk+
MIME-Version: 1.0
X-Received: by 2002:a17:902:ea0a:b0:1c3:5d5b:e294 with SMTP id
 s10-20020a170902ea0a00b001c35d5be294mr368960plg.7.1694127844341; Thu, 07 Sep
 2023 16:04:04 -0700 (PDT)
Date: Thu, 07 Sep 2023 16:04:04 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005dc3d00604cce08d@google.com>
From: syzbot <syzbot+45a7939b6f493f374ee1@syzkaller.appspotmail.com>
To: agruenba@redhat.com, cluster-devel@redhat.com, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rpeterso@redhat.com, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Fri, 08 Sep 2023 09:42:00 +0000
Subject: [Cluster-devel] [syzbot] [gfs2?] memory leak in gfs2_trans_begin
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3f86ed6ec0b3 Merge tag 'arc-6.6-rc1' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12cda4e7a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fe0cf825f8fbc075
dashboard link: https://syzkaller.appspot.com/bug?extid=45a7939b6f493f374ee1
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16f3a658680000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0a6ca0af2bd5/disk-3f86ed6e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ba67b3d88c83/vmlinux-3f86ed6e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4a64bda3d2e5/bzImage-3f86ed6e.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/6406b55aec21/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+45a7939b6f493f374ee1@syzkaller.appspotmail.com

2023/09/05 14:30:51 executed programs: 30
BUG: memory leak
unreferenced object 0xffff8881214cbc60 (size 144):
  comm "syz-executor.7", pid 5069, jiffies 4294970978 (age 14.110s)
  hex dump (first 32 bytes):
    ae 04 1f 82 ff ff ff ff 02 00 00 00 00 00 00 00  ................
    08 00 00 00 00 00 00 00 06 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff821f3e39>] kmem_cache_zalloc include/linux/slab.h:710 [inline]
    [<ffffffff821f3e39>] gfs2_trans_begin+0x29/0xa0 fs/gfs2/trans.c:115
    [<ffffffff821f04ae>] gfs2_statfs_sync+0x1ae/0x250 fs/gfs2/super.c:298
    [<ffffffff821f0d01>] gfs2_make_fs_ro+0x1b1/0x430 fs/gfs2/super.c:566
    [<ffffffff821f14ac>] gfs2_put_super+0x2bc/0x2d0 fs/gfs2/super.c:623
    [<ffffffff8168f43e>] generic_shutdown_super+0x9e/0x170 fs/super.c:693
    [<ffffffff8168f58d>] kill_block_super+0x1d/0x50 fs/super.c:1646
    [<ffffffff821d4a7f>] gfs2_kill_sb+0x1bf/0x1f0 fs/gfs2/ops_fstype.c:1795
    [<ffffffff8169065a>] deactivate_locked_super+0x4a/0x110 fs/super.c:481
    [<ffffffff816907bc>] deactivate_super fs/super.c:514 [inline]
    [<ffffffff816907bc>] deactivate_super+0x9c/0xb0 fs/super.c:510
    [<ffffffff816cd041>] cleanup_mnt+0x121/0x210 fs/namespace.c:1254
    [<ffffffff812d2b5f>] task_work_run+0x8f/0xe0 kernel/task_work.c:179
    [<ffffffff81361556>] resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
    [<ffffffff81361556>] exit_to_user_mode_loop kernel/entry/common.c:171 [inline]
    [<ffffffff81361556>] exit_to_user_mode_prepare+0x116/0x140 kernel/entry/common.c:204
    [<ffffffff84b29c41>] __syscall_exit_to_user_mode_work kernel/entry/common.c:285 [inline]
    [<ffffffff84b29c41>] syscall_exit_to_user_mode+0x21/0x50 kernel/entry/common.c:296
    [<ffffffff84b25fb4>] do_syscall_64+0x44/0xb0 arch/x86/entry/common.c:86
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd



---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

