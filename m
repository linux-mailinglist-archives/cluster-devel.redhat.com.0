Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8222DC9EB1
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Oct 2019 14:45:34 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4052F3086E21;
	Thu,  3 Oct 2019 12:45:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 381B05D9DC;
	Thu,  3 Oct 2019 12:45:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 325F54E58A;
	Thu,  3 Oct 2019 12:45:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x930JDiL030279 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 2 Oct 2019 20:19:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC3F16012C; Thu,  3 Oct 2019 00:19:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C672560464
	for <cluster-devel@redhat.com>; Thu,  3 Oct 2019 00:19:11 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
	[209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B490583F3B
	for <cluster-devel@redhat.com>; Thu,  3 Oct 2019 00:19:08 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id k13so2149518ioc.11
	for <cluster-devel@redhat.com>; Wed, 02 Oct 2019 17:19:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=peIUdpB0uufhb2WaI0hkt8u3mVPMxGwg5KAkuWXKJEM=;
	b=DRKquYSBG75n1Bg2DFm4cKbzjAyUnsw6rS+goGZx5QZGjjQ7u32Yvj7v57W35Fd+a1
	7EZMVSAIVNfWL+WVWeKIzd14nKGCDjS8cDBwUEoBrMBfPkNTxhTNfqr5ku9Gez3FDEpJ
	ar+ex5ZzHSC8attXkgWUKifYWSqmiB2weTZRW+cSTIoSOBOIWHO1IxGkgLSHBoFZImWf
	rGnsfpGmOjyF8LVitwvBQp01yFLSr6qfezJmRCBrj7QInE/J8peCMt+AZt9hqGUSP9/q
	Ou8xWEosprBCldJSNJTN8ZqhysIB6BrJ43TwIyLc7hSrnzy6cLfrZwKXimuJOlj9u5lS
	u7jw==
X-Gm-Message-State: APjAAAWCt9LBw9ZWLzGDxlZEiPJXwMDDTGszV6JbM7HrTb0O2Vqs31SH
	/ppCS4PlrUV50JEGncT3TjJeRRHuHul97AduX0/ZK4d66euR
X-Google-Smtp-Source: APXvYqyDPxvxHfZLOmI4rcw7jNQszi606WcLVjtl/4QRIX2H67TfAThskc/5+vGFskM40Iac4RX5Nh5xvZCdimiWlmK447iG2BST
MIME-Version: 1.0
X-Received: by 2002:a02:7405:: with SMTP id o5mr6859365jac.44.1570061948007;
	Wed, 02 Oct 2019 17:19:08 -0700 (PDT)
Date: Wed, 02 Oct 2019 17:19:08 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000afc1b40593f68888@google.com>
From: syzbot <syzbot+c2fdfd2b783754878fb6@syzkaller.appspotmail.com>
To: agruenba@redhat.com, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org, rpeterso@redhat.com,
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 03 Oct 2019 00:19:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Thu, 03 Oct 2019 00:19:08 +0000 (UTC) for IP:'209.85.166.69'
	DOMAIN:'mail-io1-f69.google.com' HELO:'mail-io1-f69.google.com'
	FROM:'3fD6VXQkbAEEv12ndoohudsslg.jrrjohxvhufrqwhqw.frp@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com'
	RCPT:''
X-RedHat-Spam-Score: 0.579  (FROM_LOCAL_HEX, HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.69 mail-io1-f69.google.com 209.85.166.69
	mail-io1-f69.google.com
	<3fD6VXQkbAEEv12ndoohudsslg.jrrjohxvhufrqwhqw.frp@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Thu, 03 Oct 2019 08:44:16 -0400
Subject: [Cluster-devel] memory leak in gfs2_init_fs_context
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 03 Oct 2019 12:45:33 +0000 (UTC)

Hello,

syzbot found the following crash on:

HEAD commit:    f1f2f614 Merge branch 'next-integrity' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15569c05600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e93436f92b0cfde
dashboard link: https://syzkaller.appspot.com/bug?extid=c2fdfd2b783754878fb6
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10327c05600000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=105c9fd5600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+c2fdfd2b783754878fb6@syzkaller.appspotmail.com

udit: type=1400 audit(1569701659.045:64): avc:  denied  { map } for   
pid=6842 comm="syz-executor375" path="/root/syz-executor375626622"  
dev="sda1" ino=16502 scontext=unconfined_u:system_r:insmod_t:s0-s0:c0.c1023  
tcontext=unconfined_u:object_r:user_home_t:s0 tclass=file permissive=1
executing program
executing program
BUG: memory leak
unreferenced object 0xffff88810fd9a500 (size 256):
   comm "syz-executor375", pid 6845, jiffies 4294941255 (age 13.550s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000462ab467>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<00000000462ab467>] slab_post_alloc_hook mm/slab.h:586 [inline]
     [<00000000462ab467>] slab_alloc mm/slab.c:3319 [inline]
     [<00000000462ab467>] kmem_cache_alloc_trace+0x145/0x2c0 mm/slab.c:3548
     [<00000000b1a62211>] kmalloc include/linux/slab.h:552 [inline]
     [<00000000b1a62211>] kzalloc include/linux/slab.h:686 [inline]
     [<00000000b1a62211>] gfs2_init_fs_context+0x25/0x90  
fs/gfs2/ops_fstype.c:1543
     [<00000000db94ecb4>] gfs2_meta_init_fs_context+0x17/0x40  
fs/gfs2/ops_fstype.c:1608
     [<0000000077df5577>] alloc_fs_context+0x174/0x200 fs/fs_context.c:293
     [<000000008d5e3681>] fs_context_for_mount+0x25/0x30 fs/fs_context.c:307
     [<0000000030bafbdb>] __do_sys_fsopen fs/fsopen.c:137 [inline]
     [<0000000030bafbdb>] __se_sys_fsopen fs/fsopen.c:115 [inline]
     [<0000000030bafbdb>] __x64_sys_fsopen+0xa9/0x1a0 fs/fsopen.c:115
     [<00000000974fed69>] do_syscall_64+0x73/0x1f0  
arch/x86/entry/common.c:290
     [<00000000299e0e1b>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

BUG: memory leak
unreferenced object 0xffff88810fd9a200 (size 256):
   comm "syz-executor375", pid 6846, jiffies 4294941838 (age 7.720s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
   backtrace:
     [<00000000462ab467>] kmemleak_alloc_recursive  
include/linux/kmemleak.h:43 [inline]
     [<00000000462ab467>] slab_post_alloc_hook mm/slab.h:586 [inline]
     [<00000000462ab467>] slab_alloc mm/slab.c:3319 [inline]
     [<00000000462ab467>] kmem_cache_alloc_trace+0x145/0x2c0 mm/slab.c:3548
     [<00000000b1a62211>] kmalloc include/linux/slab.h:552 [inline]
     [<00000000b1a62211>] kzalloc include/linux/slab.h:686 [inline]
     [<00000000b1a62211>] gfs2_init_fs_context+0x25/0x90  
fs/gfs2/ops_fstype.c:1543
     [<00000000db94ecb4>] gfs2_meta_init_fs_context+0x17/0x40  
fs/gfs2/ops_fstype.c:1608
     [<0000000077df5577>] alloc_fs_context+0x174/0x200 fs/fs_context.c:293
     [<000000008d5e3681>] fs_context_for_mount+0x25/0x30 fs/fs_context.c:307
     [<0000000030bafbdb>] __do_sys_fsopen fs/fsopen.c:137 [inline]
     [<0000000030bafbdb>] __se_sys_fsopen fs/fsopen.c:115 [inline]
     [<0000000030bafbdb>] __x64_sys_fsopen+0xa9/0x1a0 fs/fsopen.c:115
     [<00000000974fed69>] do_syscall_64+0x73/0x1f0  
arch/x86/entry/common.c:290
     [<00000000299e0e1b>] entry_SYSCALL_64_after_hwframe+0x44/0xa9



---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches

