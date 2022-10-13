Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C36065FDAED
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Oct 2022 15:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665668033;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=05yTZzt7l+nsO6UN+9J4a/o+4SSnUtyqkvsF9nkb/gc=;
	b=KXdr4fVkH3SWKGwH+M2l3PMBeUeUdAy+XAA93p2NSB2vMslAcFkui92TvbUZOLS2iMpHhH
	MXNga87gLGk0okHkQzctLS9+UlTCem3TfZgNgBbO3Z4o1U7E9ky1oASR1SUJCfvtZW7cNc
	RvyrXA2fBySl7wBS8u+xOt2gyb4w2/s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-JZI6gbMZNWKXpD6TycGN2g-1; Thu, 13 Oct 2022 09:33:50 -0400
X-MC-Unique: JZI6gbMZNWKXpD6TycGN2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F69582DFC7;
	Thu, 13 Oct 2022 13:33:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB4A540C83AD;
	Thu, 13 Oct 2022 13:33:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9659719465A0;
	Thu, 13 Oct 2022 13:33:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1B4CD1946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Oct 2022 13:31:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 08A34200E290; Thu, 13 Oct 2022 13:31:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0266A200D8D4
 for <cluster-devel@redhat.com>; Thu, 13 Oct 2022 13:31:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8CCC882858
 for <cluster-devel@redhat.com>; Thu, 13 Oct 2022 13:31:55 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-58-PFS5CkssNl6vguiAF1rG4w-1; Thu, 13 Oct 2022 09:31:44 -0400
X-MC-Unique: PFS5CkssNl6vguiAF1rG4w-1
Received: by mail-io1-f72.google.com with SMTP id
 x21-20020a5d9455000000b006bc1172e639so1053630ior.18
 for <cluster-devel@redhat.com>; Thu, 13 Oct 2022 06:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=05yTZzt7l+nsO6UN+9J4a/o+4SSnUtyqkvsF9nkb/gc=;
 b=PFYnb15fJiQuwFXS4WwiAzLSFN62EanWyzfPr8QEaIk1azDqfrJrChywjAc4rmPgXS
 kCdnD4CJmqsczCx4xIqvuwws4THnd22CfDWmR7obxpeqEnHKlArEz/63og4iECajVou6
 DRzyI8OGIWgwcH9fagND4JwCQg2yc81vduj+erCJ/6HgtvxMUD7AUcsaPLpgGnaTRCW8
 rUq02aWbtWafD/p8S4xXKa29QG1F/aXVrqQGr6Xzprps0iuUwKofZigwqMddFjIK7RrY
 dfiR79u9pUYpBmpk/Y3cCM92vvLaOFZ786YpNou8r13ChlEqonfmtVjiVY75U1N4rn6A
 vZ8g==
X-Gm-Message-State: ACrzQf1s0JUwuTq3P87yQx1ITqPR4yVlq3fFumFnUEJJKSOFzhIP7bQg
 rAQTFtdvAYxu26WP7R12KIil/yaM0b0D86tjglU3v6ap1U5q
X-Google-Smtp-Source: AMsMyM4XaxRNNsRmTQWxF5QyVM6yJo9toIB6Bnk2r9GPyjBXzPWvYtqZ8qQakW1+jHGmNeGJe9Fe3rzblpg8L6ubn/I5Jizpgrnh
MIME-Version: 1.0
X-Received: by 2002:a92:c0c9:0:b0:2f9:ae60:164c with SMTP id
 t9-20020a92c0c9000000b002f9ae60164cmr19046ilf.28.1665667903520; Thu, 13 Oct
 2022 06:31:43 -0700 (PDT)
Date: Thu, 13 Oct 2022 06:31:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b409e205eaea8714@google.com>
From: syzbot <syzbot+87a187973530ac822e3c@syzkaller.appspotmail.com>
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
X-Mailman-Approved-At: Thu, 13 Oct 2022 13:33:31 +0000
Subject: [Cluster-devel] [syzbot] UBSAN: shift-out-of-bounds in gfs2_getbuf
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

Hello,

syzbot found the following issue on:

HEAD commit:    493ffd6605b2 Merge tag 'ucount-rlimits-cleanups-for-v5.19'..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14620252880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d19f5d16783f901
dashboard link: https://syzkaller.appspot.com/bug?extid=87a187973530ac822e3c
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f1ff6481e26f/disk-493ffd66.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/101bd3c7ae47/vmlinux-493ffd66.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+87a187973530ac822e3c@syzkaller.appspotmail.com

================================================================================
UBSAN: shift-out-of-bounds in fs/gfs2/meta_io.c:128:16
shift exponent 4294967293 is too large for 64-bit type 'u64' (aka 'unsigned long long')
CPU: 0 PID: 10195 Comm: syz-executor.3 Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x28e lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:151 [inline]
 __ubsan_handle_shift_out_of_bounds+0x33d/0x3b0 lib/ubsan.c:322
 gfs2_getbuf+0x759/0x7d0 fs/gfs2/meta_io.c:128
 gfs2_meta_read+0x153/0x910 fs/gfs2/meta_io.c:265
 gfs2_meta_buffer+0x153/0x3a0 fs/gfs2/meta_io.c:491
 gfs2_meta_inode_buffer fs/gfs2/meta_io.h:72 [inline]
 gfs2_inode_refresh+0xab/0xe90 fs/gfs2/glops.c:472
 gfs2_instantiate+0x15e/0x220 fs/gfs2/glock.c:515
 gfs2_glock_holder_ready fs/gfs2/glock.c:1303 [inline]
 gfs2_glock_wait+0x1d9/0x2a0 fs/gfs2/glock.c:1323
 gfs2_glock_nq_init fs/gfs2/glock.h:263 [inline]
 gfs2_lookupi+0x40c/0x650 fs/gfs2/inode.c:306
 gfs2_lookup_simple+0xec/0x170 fs/gfs2/inode.c:258
 init_journal+0x19b/0x22c0 fs/gfs2/ops_fstype.c:739
 init_inodes+0xdc/0x340 fs/gfs2/ops_fstype.c:882
 gfs2_fill_super+0x1ad8/0x2610 fs/gfs2/ops_fstype.c:1240
 get_tree_bdev+0x400/0x620 fs/super.c:1323
 gfs2_get_tree+0x50/0x210 fs/gfs2/ops_fstype.c:1323
 vfs_get_tree+0x88/0x270 fs/super.c:1530
 do_new_mount+0x289/0xad0 fs/namespace.c:3040
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f0eed68cada
Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f0eee73cf88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 00007f0eed68cada
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f0eee73cfe0
RBP: 00007f0eee73d020 R08: 00007f0eee73d020 R09: 0000000020000000
R10: 0000000000000008 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 00007f0eee73cfe0 R15: 0000000020000080
 </TASK>
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

