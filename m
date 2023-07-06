Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BD174D45D
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Jul 2023 13:16:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688987778;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=s3HkeJQHl4QsBqigrw2AyOZVstwcjef6Y+Q4cyGlEL0=;
	b=U+2cEqoyAz2ta7cjvV7KwPUkNVeGHzeihR+MSqOnq3AK4nYj7PndOVJO3KT84Iw3DTbYqc
	Sbl/8g4DFke4XWSeGb27fpRWo8EGOShdebb9l3D7ODeLrn3HFnD8sdg/9sbMvSaxOs1kMu
	BgrZR3s/rMkjIJ9c/K1ADX8zKb616mc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-rPEj7LszP2W3tBGihn0lwQ-1; Mon, 10 Jul 2023 07:16:14 -0400
X-MC-Unique: rPEj7LszP2W3tBGihn0lwQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 528B9835154;
	Mon, 10 Jul 2023 11:16:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C9282166B26;
	Mon, 10 Jul 2023 11:16:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BA5271946A7A;
	Mon, 10 Jul 2023 11:16:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 10D261946588 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Jul 2023 02:18:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 01D814087C6B; Thu,  6 Jul 2023 02:18:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE7144087C6A
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 02:18:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D373D873238
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 02:18:08 +0000 (UTC)
Received: from mail-pl1-f207.google.com (mail-pl1-f207.google.com
 [209.85.214.207]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-uANGGZkYNWiyOqNMV-ZVAw-1; Wed, 05 Jul 2023 22:18:07 -0400
X-MC-Unique: uANGGZkYNWiyOqNMV-ZVAw-1
Received: by mail-pl1-f207.google.com with SMTP id
 d9443c01a7336-1b8b30f781cso939745ad.2
 for <cluster-devel@redhat.com>; Wed, 05 Jul 2023 19:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688609886; x=1691201886;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s3HkeJQHl4QsBqigrw2AyOZVstwcjef6Y+Q4cyGlEL0=;
 b=OPQQn6v9gp1AdSL6Rkis1cs97M/sK4anj26uaQxhn472bqfonHbUFFwzf/zqSen0Al
 6C95y0DQqOl9v39Lc4zSBxTvDZ7olyw6VdF5kqK/XeAV9cw/bQLuUBMLW5QFzWWa0jEy
 x3yidCZqv6FOB/R35NsLF7RMO2wsVHEOgn27SGsmgDvtAdHMdu7+myBA9ju21aONz+0E
 OJlyUYyj9NnvW7e6qVYiEbaeuJo5HLsas17N3spMFsmo8wjwWafKPg0V5nfk6tQMUys0
 QxuJcJE9Bfblg4K7SlnioKm9cPaQdMCcg9YN+TOLxQ8kxKWB6mTThLUHn18x2fvVOJDQ
 /DwA==
X-Gm-Message-State: ABy/qLYp/gFa+Tv02/WrdvjvF2VeMfcH9FECbw8Y/Ui3HfSQjb+sdvnU
 +l533LQMqn/PXB7ZFCpT7UHqb5jvV3zxmdgSrL8BYYZZPW6Q
X-Google-Smtp-Source: APBJJlFKzvbEhwVHAQ31CCemK89sHRJfQnkA1kIRiIRAL0FUmCUZsbtrteTYgL7IgsCwwU4+WyWVV0vmdGWZNJdfjTaiqQOo5+YU
MIME-Version: 1.0
X-Received: by 2002:a17:902:8f96:b0:1ac:3f51:fa64 with SMTP id
 z22-20020a1709028f9600b001ac3f51fa64mr619291plo.13.1688609886159; Wed, 05 Jul
 2023 19:18:06 -0700 (PDT)
Date: Wed, 05 Jul 2023 19:18:06 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006dca4d05ffc82098@google.com>
From: syzbot <syzbot+4ee56df41d0cc0f0783a@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Mon, 10 Jul 2023 11:16:06 +0000
Subject: [Cluster-devel] [syzbot] [gfs2?] memory leak in gfs2_quota_init
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
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f8566aa4f176 Merge tag 'x86-urgent-2023-07-01' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10443370a80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=87bd445ea3f7a661
dashboard link: https://syzkaller.appspot.com/bug?extid=4ee56df41d0cc0f0783a
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=172d3d14a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=143b6648a80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9c2c2ab2bd05/disk-f8566aa4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0af022babece/vmlinux-f8566aa4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e335287813f6/bzImage-f8566aa4.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/2f0686bcdcb4/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4ee56df41d0cc0f0783a@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810aa24000 (size 8192):
  comm "syz-executor334", pid 5004, jiffies 4294954804 (age 12.830s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff8154c55a>] __do_kmalloc_node mm/slab_common.c:984 [inline]
    [<ffffffff8154c55a>] __kmalloc+0x4a/0x120 mm/slab_common.c:998
    [<ffffffff821964d9>] kmalloc include/linux/slab.h:583 [inline]
    [<ffffffff821964d9>] kzalloc include/linux/slab.h:700 [inline]
    [<ffffffff821964d9>] gfs2_quota_init+0xd9/0x770 fs/gfs2/quota.c:1373
    [<ffffffff821a1aef>] gfs2_make_fs_rw+0x11f/0x200 fs/gfs2/super.c:155
    [<ffffffff8218a1cf>] gfs2_reconfigure+0x3cf/0x530 fs/gfs2/ops_fstype.c:1602
    [<ffffffff81665d5c>] reconfigure_super+0x14c/0x3e0 fs/super.c:961
    [<ffffffff816cd5cb>] vfs_fsconfig_locked fs/fsopen.c:254 [inline]
    [<ffffffff816cd5cb>] __do_sys_fsconfig+0x80b/0x8d0 fs/fsopen.c:439
    [<ffffffff84a6bff9>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84a6bff9>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
    [<ffffffff84c0008b>] entry_SYSCALL_64_after_hwframe+0x63/0xcd

BUG: memory leak
unreferenced object 0xffff88810f360000 (size 8192):
  comm "syz-executor334", pid 5007, jiffies 4294955349 (age 7.380s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffff8154c55a>] __do_kmalloc_node mm/slab_common.c:984 [inline]
    [<ffffffff8154c55a>] __kmalloc+0x4a/0x120 mm/slab_common.c:998
    [<ffffffff821964d9>] kmalloc include/linux/slab.h:583 [inline]
    [<ffffffff821964d9>] kzalloc include/linux/slab.h:700 [inline]
    [<ffffffff821964d9>] gfs2_quota_init+0xd9/0x770 fs/gfs2/quota.c:1373
    [<ffffffff821a1aef>] gfs2_make_fs_rw+0x11f/0x200 fs/gfs2/super.c:155
    [<ffffffff8218a1cf>] gfs2_reconfigure+0x3cf/0x530 fs/gfs2/ops_fstype.c:1602
    [<ffffffff81665d5c>] reconfigure_super+0x14c/0x3e0 fs/super.c:961
    [<ffffffff816cd5cb>] vfs_fsconfig_locked fs/fsopen.c:254 [inline]
    [<ffffffff816cd5cb>] __do_sys_fsconfig+0x80b/0x8d0 fs/fsopen.c:439
    [<ffffffff84a6bff9>] do_syscall_x64 arch/x86/entry/common.c:50 [inline]
    [<ffffffff84a6bff9>] do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
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

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

