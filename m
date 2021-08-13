Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 520113F013F
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Aug 2021 12:05:40 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-b0D66YyVOmaEQXWCUdN3Mw-1; Wed, 18 Aug 2021 06:05:38 -0400
X-MC-Unique: b0D66YyVOmaEQXWCUdN3Mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38F53190B2A0;
	Wed, 18 Aug 2021 10:05:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A391D6091B;
	Wed, 18 Aug 2021 10:05:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 94200181A2A6;
	Wed, 18 Aug 2021 10:05:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17D3UUfM024824 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 12 Aug 2021 23:30:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 296E7202BFA7; Fri, 13 Aug 2021 03:30:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B73200A39F
	for <cluster-devel@redhat.com>; Fri, 13 Aug 2021 03:30:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8798C101A52C
	for <cluster-devel@redhat.com>; Fri, 13 Aug 2021 03:30:27 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
	[209.85.166.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-169-PYd82HwXNoi9prRVzPDJeA-1; Thu, 12 Aug 2021 23:30:25 -0400
X-MC-Unique: PYd82HwXNoi9prRVzPDJeA-1
Received: by mail-il1-f197.google.com with SMTP id
	d17-20020a9287510000b0290223c9088c96so4373409ilm.1
	for <cluster-devel@redhat.com>; Thu, 12 Aug 2021 20:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
	:from:to;
	bh=7MglwI/yX/ewU3i1nPDYLSNM5Et0vKbSBNWk8oJbUeU=;
	b=W3dRr8e+JjS6SIMtsgssgl+Ed2IaRfuq2N0/rVbc7kZb9L9Xq4+fNBg9SAbd6pqpg7
	py7zfgXalFsEE+ORuYB+Tdld6nC0zskNLK973+9eWdOT+dGW3EqXmaUuAzDntMuo4Ysm
	C+6oJPVsCard7GqIbwQlhnE7DybSayjm+wLeE1faau6uGX3BxaZboZVqAMiTVIOiC3Lm
	XbCMvI8WeSgmV+Blamz9JGfj0a5qvTGcE+iyKJ3QIk2e3DCWGJIbRwpYc+E1pfYPwMNl
	bbnV5nquF5/qfiMEsjTLTs1SfsRtGo6LVM2aNqRFTU5jZUuMAlX+ZSa8ehcn9fIZZcXQ
	rcbw==
X-Gm-Message-State: AOAM531EElVZ8UaNVTyJemkPzBQylFHDW9BIE28rRdfxS+OOMj9Rxlp/
	aQwrt0XMxWhQUO9fEmfXuhfe72dYXwbRMxCtohbFDIWz7AH4
X-Google-Smtp-Source: ABdhPJwDa3tKW9uDPQb05kcGCNNCkytknzX2FL2wy4e1UeXCiakil2fVGUCcLKn6CcuEnvGQ5WPhDNeXIN7dLN2G8xcxAosp17LV
MIME-Version: 1.0
X-Received: by 2002:a6b:490d:: with SMTP id u13mr357643iob.176.1628825425086; 
	Thu, 12 Aug 2021 20:30:25 -0700 (PDT)
Date: Thu, 12 Aug 2021 20:30:25 -0700
In-Reply-To: <000000000000b25bb805c798a1a5@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000dd0bf405c96878b9@google.com>
From: syzbot <syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com>
To: agruenba@redhat.com, akpm@linux-foundation.org, cluster-devel@redhat.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, rpeterso@redhat.com,
	swhiteho@redhat.com, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 18 Aug 2021 06:05:28 -0400
Subject: Re: [Cluster-devel] [syzbot] WARNING in __set_page_dirty
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
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    f8fbb47c6e86 Merge branch 'for-v5.14' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=125aadf6300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e3a20bae04b96ccd
dashboard link: https://syzkaller.appspot.com/bug?extid=0d5b462a6f07447991b3
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=122742ee300000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17925381300000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com

NILFS (loop0): segctord starting. Construction interval = 5 seconds, CP frequency < 30 seconds
------------[ cut here ]------------
WARNING: CPU: 0 PID: 8496 at include/linux/backing-dev.h:283 inode_to_wb include/linux/backing-dev.h:283 [inline]
WARNING: CPU: 0 PID: 8496 at include/linux/backing-dev.h:283 account_page_dirtied mm/page-writeback.c:2435 [inline]
WARNING: CPU: 0 PID: 8496 at include/linux/backing-dev.h:283 __set_page_dirty+0xace/0x1070 mm/page-writeback.c:2483
Modules linked in:
CPU: 0 PID: 8496 Comm: segctord Not tainted 5.14.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:inode_to_wb include/linux/backing-dev.h:283 [inline]
RIP: 0010:account_page_dirtied mm/page-writeback.c:2435 [inline]
RIP: 0010:__set_page_dirty+0xace/0x1070 mm/page-writeback.c:2483
Code: a8 01 00 00 be ff ff ff ff 48 8d 78 70 e8 ea 60 8d 07 31 ff 89 c3 89 c6 e8 cf a6 d8 ff 85 db 0f 85 ac f7 ff ff e8 82 9f d8 ff <0f> 0b e9 a0 f7 ff ff e8 76 9f d8 ff 4c 8d 75 08 48 b8 00 00 00 00
RSP: 0018:ffffc9000175f8c8 EFLAGS: 00010093
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff8880263b9c40 RSI: ffffffff819d083e RDI: 0000000000000003
RBP: ffffea000082dac0 R08: 0000000000000000 R09: 0000000000000001
R10: ffffffff819d0831 R11: 0000000000000000 R12: 0000000000000293
R13: ffff888037e60138 R14: ffff888037e60488 R15: ffff888037e602e0
FS:  0000000000000000(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005593610abbe0 CR3: 0000000016882000 CR4: 0000000000350ef0
Call Trace:
 mark_buffer_dirty+0x49a/0x5e0 fs/buffer.c:1108
 nilfs_btree_propagate_p fs/nilfs2/btree.c:1889 [inline]
 nilfs_btree_propagate+0x4ae/0xea0 fs/nilfs2/btree.c:2085
 nilfs_bmap_propagate+0x73/0x170 fs/nilfs2/bmap.c:337
 nilfs_collect_dat_data+0x45/0xd0 fs/nilfs2/segment.c:625
 nilfs_segctor_apply_buffers+0x14a/0x470 fs/nilfs2/segment.c:1009
 nilfs_segctor_scan_file+0x3e4/0x700 fs/nilfs2/segment.c:1058
 nilfs_segctor_collect_blocks fs/nilfs2/segment.c:1224 [inline]
 nilfs_segctor_collect fs/nilfs2/segment.c:1494 [inline]
 nilfs_segctor_do_construct+0x16ee/0x6b20 fs/nilfs2/segment.c:2036
 nilfs_segctor_construct+0x7a7/0xb30 fs/nilfs2/segment.c:2372
 nilfs_segctor_thread_construct fs/nilfs2/segment.c:2480 [inline]
 nilfs_segctor_thread+0x3c3/0xf90 fs/nilfs2/segment.c:2563
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
----------------
Code disassembly (best guess):
   0:	a8 01                	test   $0x1,%al
   2:	00 00                	add    %al,(%rax)
   4:	be ff ff ff ff       	mov    $0xffffffff,%esi
   9:	48 8d 78 70          	lea    0x70(%rax),%rdi
   d:	e8 ea 60 8d 07       	callq  0x78d60fc
  12:	31 ff                	xor    %edi,%edi
  14:	89 c3                	mov    %eax,%ebx
  16:	89 c6                	mov    %eax,%esi
  18:	e8 cf a6 d8 ff       	callq  0xffd8a6ec
  1d:	85 db                	test   %ebx,%ebx
  1f:	0f 85 ac f7 ff ff    	jne    0xfffff7d1
  25:	e8 82 9f d8 ff       	callq  0xffd89fac
  2a:	0f 0b                	ud2     <-- trapping instruction
  2c:	e9 a0 f7 ff ff       	jmpq   0xfffff7d1
  31:	e8 76 9f d8 ff       	callq  0xffd89fac
  36:	4c 8d 75 08          	lea    0x8(%rbp),%r14
  3a:	48                   	rex.W
  3b:	b8 00 00 00 00       	mov    $0x0,%eax

