Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A00365BD09
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Jan 2023 10:21:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672737702;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zYUhkFKvY5IbV4RqNVKD9rJbddGx3SRJptJw8BeSSvY=;
	b=BN+I26vkF++WKBfDpR7pP6XaAoQxJUT45uQeAPOmRfysHbxfyVx2x/ZEbQca4sBRjaSf1g
	FalpPJWMmm9D55vMXaAxiKQIQ2ISVvf1YTLAmVJsnel5bJJYPernKn4Chs89VGIryurHTV
	vnvkrWNKvAuPkycBsdvxRngD8FTHFFE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-463-xGrjb71XOhSGM6eSi3M3GQ-1; Tue, 03 Jan 2023 04:21:41 -0500
X-MC-Unique: xGrjb71XOhSGM6eSi3M3GQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6A163C1014A;
	Tue,  3 Jan 2023 09:21:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 74FBD39D6D;
	Tue,  3 Jan 2023 09:21:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E06419465A2;
	Tue,  3 Jan 2023 09:21:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B30FB19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 00:45:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A2B8DC16029; Thu, 22 Dec 2022 00:45:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BCC1C16028
 for <cluster-devel@redhat.com>; Thu, 22 Dec 2022 00:45:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 813CC3804506
 for <cluster-devel@redhat.com>; Thu, 22 Dec 2022 00:45:54 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-582-YZ1c4KOKMY6NZF0Gu4L91A-1; Wed, 21 Dec 2022 19:45:52 -0500
X-MC-Unique: YZ1c4KOKMY6NZF0Gu4L91A-1
Received: by mail-il1-f199.google.com with SMTP id
 j3-20020a056e02154300b00304bc968ef1so263838ilu.4
 for <cluster-devel@redhat.com>; Wed, 21 Dec 2022 16:45:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zYUhkFKvY5IbV4RqNVKD9rJbddGx3SRJptJw8BeSSvY=;
 b=WgCUCA6sdRbOpTPsRHnCdQipHRoWRbWgZjqln1tLKB1ubWPKvU0wei6i9JYFAzOU+T
 DpbSOB4roKNKUb4FjvYpWEV8bTzGeCAX2Jn6ZPl2chcQC2IZzIHIHEnNWywufd3piBfc
 82osstJg7V0PmH7yzUmqLpR9C2xWMYp6svkdO1j3ScvrBCQI1Z/y5SHZyazVSv9B8I8x
 ZJNC8Wln52D8lcHLs6z2f3jpugb6FEJigcL9ZJN4Cb4oaq6uJSunieV0Nhs1gaBUN14G
 ceIHt6sxiDN/lsdFpzEIfG50DqylF6hoNpgnFjkxX+0bbtqauQ9eMCVdXO6XOfCzKpsm
 c9tw==
X-Gm-Message-State: AFqh2kqAOF/ZWoXVJKdp47fS5X8CpIFYs8loDjMELbEnE5UTUrfKp9TD
 cHIO/+q9UEINW08GtR6M8qKVOPUoiYaslaA0Ji0OV/N6Xmnl
X-Google-Smtp-Source: AMrXdXsxMjUq/nIPr6Kdbmfdbfw8EXz556sp/PvVb3oBo6kHw9mYz8aYi6PUQN3iPIbvpYpSIidIYBKNjK0PiuA/9K1pP2LmxPk+
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d86:b0:304:c71d:8e03 with SMTP id
 h6-20020a056e021d8600b00304c71d8e03mr378450ila.274.1671669952042; Wed, 21 Dec
 2022 16:45:52 -0800 (PST)
Date: Wed, 21 Dec 2022 16:45:52 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ac5f1705f05ffd3b@google.com>
From: syzbot <syzbot+45d4691b1ed3c48eba05@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 03 Jan 2023 09:21:37 +0000
Subject: [Cluster-devel] [syzbot] [gfs2?] UBSAN: array-index-out-of-bounds
 in __gfs2_iomap_get
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    77856d911a8c Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=155a6663880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f967143badd2fa39
dashboard link: https://syzkaller.appspot.com/bug?extid=45d4691b1ed3c48eba05
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=160f494f880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=123f9577880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b424d9203f5/disk-77856d91.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/47fd68051834/vmlinux-77856d91.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d3091f087a86/bzImage-77856d91.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/67525acd7f1d/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+45d4691b1ed3c48eba05@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 125323
gfs2: fsid=syz:syz: Trying to join cluster "lock_nolock", "syz:syz"
gfs2: fsid=syz:syz: Now mounting FS (format 1801)...
================================================================================
UBSAN: array-index-out-of-bounds in fs/gfs2/bmap.c:901:46
index 11 is out of range for type 'u64 [11]'
CPU: 0 PID: 5067 Comm: syz-executor164 Not tainted 6.1.0-syzkaller-13031-g77856d911a8c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1b1/0x290 lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:151 [inline]
 __ubsan_handle_out_of_bounds+0xe0/0x110 lib/ubsan.c:282
 __gfs2_iomap_get+0x4a4/0x16e0 fs/gfs2/bmap.c:901
 gfs2_iomap_get fs/gfs2/bmap.c:1399 [inline]
 gfs2_block_map+0x28f/0x7f0 fs/gfs2/bmap.c:1214
 gfs2_write_alloc_required+0x441/0x6e0 fs/gfs2/bmap.c:2322
 gfs2_jdesc_check+0x1b9/0x290 fs/gfs2/super.c:114
 init_journal+0x5a4/0x22c0 fs/gfs2/ops_fstype.c:804
 init_inodes+0xdc/0x340 fs/gfs2/ops_fstype.c:889
 gfs2_fill_super+0x1bb2/0x2700 fs/gfs2/ops_fstype.c:1247
 get_tree_bdev+0x400/0x620 fs/super.c:1282
 gfs2_get_tree+0x50/0x210 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x88/0x270 fs/super.c:1489
 do_new_mount+0x289/0xad0 fs/namespace.c:3145
 do_mount fs/namespace.c:3488 [inline]
 __do_sys_mount fs/namespace.c:3697 [inline]
 __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3674
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f2c63567aca
Code: 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd0e3a28d8 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f2c63567aca
RDX: 0000000020037f40 RSI: 0000000020037f80 RDI: 00007ffd0e3a28e0
RBP: 00007ffd0e3a28e0 R08: 00007ffd0e3a2920 R09: 0000000000043350
R10: 0000000002000011 R11: 0000000000000282 R12: 0000000000000004
R13: 00005555567192c0 R14: 00007ffd0e3a2920 R15: 0000000000000000
 </TASK>
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

