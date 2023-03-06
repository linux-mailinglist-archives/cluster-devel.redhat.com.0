Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 555926ACB19
	for <lists+cluster-devel@lfdr.de>; Mon,  6 Mar 2023 18:46:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678124779;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GxC+zrdwXsUzP44JUUIxQpsBssHdZyrJhaBghz1c1gU=;
	b=KVUW45DVm2HtWOYjmJPXH7LrBShh4ZmSJGCrFDLufN8uQ9vBpv5HrDi/RtICG8pStfDpM9
	1JD2LtumG5OX/bqLv0i+n6mwRnriCsjQkUxEufk/m1JFez2n3LNNFdeAR3Nqz2Sqz55kmp
	0GW1yJtTYTnMzGFmvRT0g6z/06qHbyY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-WLbeyWdxOouhHK4jzvOCGA-1; Mon, 06 Mar 2023 12:46:16 -0500
X-MC-Unique: WLbeyWdxOouhHK4jzvOCGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA7C7877CAC;
	Mon,  6 Mar 2023 17:46:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9026E112132E;
	Mon,  6 Mar 2023 17:46:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8E71E1946594;
	Mon,  6 Mar 2023 17:46:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BF012194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon,  6 Mar 2023 17:44:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8D044492B00; Mon,  6 Mar 2023 17:44:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84EA7492C3E
 for <cluster-devel@redhat.com>; Mon,  6 Mar 2023 17:44:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 643A93810B05
 for <cluster-devel@redhat.com>; Mon,  6 Mar 2023 17:44:40 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-x3xKx4bsPiqsWvBq08INOg-1; Mon, 06 Mar 2023 12:44:38 -0500
X-MC-Unique: x3xKx4bsPiqsWvBq08INOg-1
Received: by mail-il1-f197.google.com with SMTP id
 d3-20020a056e02050300b00317999dcfb1so5717552ils.4
 for <cluster-devel@redhat.com>; Mon, 06 Mar 2023 09:44:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678124678;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GxC+zrdwXsUzP44JUUIxQpsBssHdZyrJhaBghz1c1gU=;
 b=PT5xpI1IYZB++zhQYmB+incqqPCCv6ofMf8YF+A6pO64l2SNHOWFST+CsvsW4ebVqL
 QPcIlheZekml7bii5XKZ4zJDXZvqnzo+JVW+ztVler0ifQH7hnC6ZrAALB5lUJC8HK2F
 ztgmOL9l/aSOb8mKCdCmcx6/r4zSUPOkTY9zI8WT54eY20GzJBPUJnpQ349A2O+kscxB
 5pnL9P601v/RZ4TV3il1//F6UXH+eJZdGYJ+3cXLNlMKlPVjTUUuz7mm7HAv2rJ2ig65
 cLasc1TIOx9O+9mZZy7/SWVJoOa4bnF0iju5CPqD3fMXFC/KI3scHFCq+C/c81/EbWTg
 vvvQ==
X-Gm-Message-State: AO0yUKXKhY0UGAiKLi434n3oBayRuUdYjTMoQHUEcsu8Z+1Yi0HYiAYP
 nS8N6Lpkkpf29VSNNctNqnR26msSmN0v4nnFhirsFpmF+8az
X-Google-Smtp-Source: AK7set8D7ryF6B/fTcEs0INTehKt1eBhyExL24efZlk2flFqqijq2W7GcIB19I/LaZV8Aqr2GE5pch7I9igSwSclUbhQ67mupoNx
MIME-Version: 1.0
X-Received: by 2002:a6b:c894:0:b0:74d:4df6:2530 with SMTP id
 y142-20020a6bc894000000b0074d4df62530mr7982376iof.2.1678124677897; Mon, 06
 Mar 2023 09:44:37 -0800 (PST)
Date: Mon, 06 Mar 2023 09:44:37 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000050a49105f63ed997@google.com>
From: syzbot <syzbot+427fed3295e9a7e887f2@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:46:06 +0000
Subject: [Cluster-devel] [syzbot] [cluster?] general protection fault in
 gfs2_dump_glock (2)
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    f915322fe014 Merge tag 'v6.3-p2' of git://git.kernel.org/p..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16f297b0c80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dc0f7cfe5b32efe2
dashboard link: https://syzkaller.appspot.com/bug?extid=427fed3295e9a7e887f2
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11a8b9bcc80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11955f54c80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/ad716bf3cfc2/disk-f915322f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3dda0fefb7a2/vmlinux-f915322f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/009b2977ab37/bzImage-f915322f.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/6c7bfd847dac/mount_2.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+427fed3295e9a7e887f2@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0:  H: s:SH f:H e:0 p:6113 [syz-executor409] __gfs2_lookup+0xa4/0x270 fs/gfs2/inode.c:888
==================================================================
BUG: KASAN: vmalloc-out-of-bounds in gfs2_dump_glock+0x14b3/0x1ad0
Read of size 8 at addr ffffc90005957720 by task syz-executor409/6095

CPU: 0 PID: 6095 Comm: syz-executor409 Not tainted 6.2.0-syzkaller-13563-gf915322fe014 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:319 [inline]
 print_report+0x163/0x540 mm/kasan/report.c:430
 kasan_report+0x176/0x1b0 mm/kasan/report.c:536
 gfs2_dump_glock+0x14b3/0x1ad0
 gfs2_consist_inode_i+0xf5/0x110 fs/gfs2/util.c:465
 gfs2_dirent_scan+0x512/0x640 fs/gfs2/dir.c:602
 gfs2_dirent_search+0x30e/0x8c0 fs/gfs2/dir.c:850
 gfs2_dir_search+0xb2/0x2f0 fs/gfs2/dir.c:1650
 gfs2_lookupi+0x460/0x5d0 fs/gfs2/inode.c:332
 __gfs2_lookup+0xa4/0x270 fs/gfs2/inode.c:888
 gfs2_atomic_open+0x9e/0x230 fs/gfs2/inode.c:1292
 atomic_open fs/namei.c:3279 [inline]
 lookup_open fs/namei.c:3387 [inline]
 open_last_lookups fs/namei.c:3484 [inline]
 path_openat+0x103c/0x3170 fs/namei.c:3712
 do_filp_open+0x234/0x490 fs/namei.c:3742
 do_sys_openat2+0x13f/0x500 fs/open.c:1348
 do_sys_open fs/open.c:1364 [inline]
 __do_sys_open fs/open.c:1372 [inline]
 __se_sys_open fs/open.c:1368 [inline]
 __x64_sys_open+0x225/0x270 fs/open.c:1368
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7ff0f3f00b39
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 91 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ff0f3ea4208 EFLAGS: 00000246 ORIG_RAX: 0000000000000002
RAX: ffffffffffffffda RBX: 00007ff0f3f90788 RCX: 00007ff0f3f00b39
RDX: 0000000000000008 RSI: 0000000000000002 RDI: 0000000020000280
RBP: 00007ff0f3f90780 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007ff0f3f9078c
R13: 00007fffdfd2a3af R14: 00007ff0f3ea4300 R15: 0000000000022000
 </TASK>

Memory state around the buggy address:
 ffffc90005957600: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90005957680: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
>ffffc90005957700: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
                               ^
 ffffc90005957780: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 ffffc90005957800: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

