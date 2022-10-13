Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE135FDCC8
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Oct 2022 17:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665673337;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=61lrL0z1ygxGVikDSISn8ZJPFTRdiiY1NbOxA+fanWc=;
	b=LQ7OEPjpjaFI3FJMPmJOt3tyjKOHdOviPwFSptBAneh/Paya+Npy3hD1dZ9zhYHMI/fOJo
	PfsK/NKcnDuT+B44ni2Is60BW1DUc9SJ7HaEfBYXNrsbDNQe2upPIW91yhnNnjt986SjQb
	Teslk9/BtAGfR1jgLspHsP5b/HoSovQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-4-r5gQjrNUWMpVXOfGWJNg-1; Thu, 13 Oct 2022 11:02:14 -0400
X-MC-Unique: 4-r5gQjrNUWMpVXOfGWJNg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13D5785A5B6;
	Thu, 13 Oct 2022 15:02:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1766D40C2089;
	Thu, 13 Oct 2022 15:02:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A005319465A0;
	Thu, 13 Oct 2022 15:02:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C383F1946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Oct 2022 14:58:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A6BA340C83C5; Thu, 13 Oct 2022 14:58:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F89440C83AD
 for <cluster-devel@redhat.com>; Thu, 13 Oct 2022 14:58:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8045B857FAC
 for <cluster-devel@redhat.com>; Thu, 13 Oct 2022 14:58:46 +0000 (UTC)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-381-ANWMV_KwNqawWJZFkMKTwA-1; Thu, 13 Oct 2022 10:58:44 -0400
X-MC-Unique: ANWMV_KwNqawWJZFkMKTwA-1
Received: by mail-il1-f199.google.com with SMTP id
 n14-20020a056e02100e00b002f9e283e850so1657855ilj.9
 for <cluster-devel@redhat.com>; Thu, 13 Oct 2022 07:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=61lrL0z1ygxGVikDSISn8ZJPFTRdiiY1NbOxA+fanWc=;
 b=nHnJtLJQmDX5viE1QR5lij+T6Y0i356KMqd4D6GODiYd36v3/6zRGGuE1z7gVbQ6AW
 yQlJCg9qF+2XDTJ9gLnZa9UaS82oaImb7dN2169fRBvI8MqyFrkEV05jhAk+cuS5FeSD
 ol1BfRAGF2jVs6fhbjMJYvgHXkcab6nYbytR56vDKVuca6FuJ4ZZz676c+v2+TmMBf45
 5Kl/L8I38vHApqu2b+QT/WZNPX6oCITIrZoaHzXrZN6B3pwfUvPgcuxODVdavd2Vvzqk
 SIzlW/os2hOM3j28M50GUCUx4IShwO4039h54K24shYeqEcfzNl4kFulPA8YM0/TX1mN
 /CTA==
X-Gm-Message-State: ACrzQf2MvDqmMhpFsTd5+ym5uTOpr9koy1JmV2Klgmj+zmjOtHOlouxC
 VwfMZNE3yjbzLhL4C7/NcqcnIoTFtFLF1tpAHStqigFf2uKJ
X-Google-Smtp-Source: AMsMyM5ETVAavyu10jJ+JwfKiYNU4c0y6MwdJoBF4+3vH5ThQX6NgQkAUf3QevsoIHGqpy/s3JmEKZ+AKONqNbOI2xmtmK5i0VsP
MIME-Version: 1.0
X-Received: by 2002:a05:6602:134f:b0:6a4:cd04:7842 with SMTP id
 i15-20020a056602134f00b006a4cd047842mr140695iov.172.1665673123563; Thu, 13
 Oct 2022 07:58:43 -0700 (PDT)
Date: Thu, 13 Oct 2022 07:58:43 -0700
In-Reply-To: <000000000000b409e205eaea8714@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d790e505eaebbe23@google.com>
From: syzbot <syzbot+87a187973530ac822e3c@syzkaller.appspotmail.com>
To: agruenba@redhat.com, anprice@redhat.com, cluster-devel@redhat.com, 
 linux-kernel@vger.kernel.org, rpeterso@redhat.com, 
 syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Thu, 13 Oct 2022 15:02:08 +0000
Subject: Re: [Cluster-devel] [syzbot] UBSAN: shift-out-of-bounds in
 gfs2_getbuf
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    55be6084c8e0 Merge tag 'timers-core-2022-10-05' of git://g..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=176500c2880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c29b6436e994d72e
dashboard link: https://syzkaller.appspot.com/bug?extid=87a187973530ac822e3c
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=174eb6aa880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1118d5a4880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c8f5131ab57d/disk-55be6084.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/77167f226f35/vmlinux-55be6084.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/930c28d03062/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+87a187973530ac822e3c@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 264192
gfs2: fsid=loop0: Trying to join cluster "lock_nolock", "loop0"
gfs2: fsid=loop0: Now mounting FS (format 1801)...
================================================================================
UBSAN: shift-out-of-bounds in fs/gfs2/meta_io.c:128:16
shift exponent 4294967293 is too large for 64-bit type 'u64' (aka 'unsigned long long')
CPU: 1 PID: 3612 Comm: syz-executor373 Not tainted 6.0.0-syzkaller-09589-g55be6084c8e0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e3/0x2cb lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:151 [inline]
 __ubsan_handle_shift_out_of_bounds+0x3a6/0x420 lib/ubsan.c:322
 gfs2_getbuf+0x759/0x7d0 fs/gfs2/meta_io.c:128
 gfs2_meta_read+0x16a/0x910 fs/gfs2/meta_io.c:265
 gfs2_meta_buffer+0x195/0x400 fs/gfs2/meta_io.c:491
 gfs2_meta_inode_buffer fs/gfs2/meta_io.h:72 [inline]
 gfs2_inode_refresh+0xd6/0xdc0 fs/gfs2/glops.c:472
 gfs2_instantiate+0x15e/0x220 fs/gfs2/glock.c:515
 gfs2_glock_holder_ready fs/gfs2/glock.c:1303 [inline]
 gfs2_glock_wait+0x1d9/0x2a0 fs/gfs2/glock.c:1323
 gfs2_glock_nq_init fs/gfs2/glock.h:263 [inline]
 gfs2_lookupi+0x411/0x5f0 fs/gfs2/inode.c:306
 gfs2_lookup_simple+0xec/0x170 fs/gfs2/inode.c:258
 init_journal+0x1c3/0x2310 fs/gfs2/ops_fstype.c:739
 init_inodes+0xdc/0x340 fs/gfs2/ops_fstype.c:882
 gfs2_fill_super+0x1be3/0x2710 fs/gfs2/ops_fstype.c:1240
 get_tree_bdev+0x400/0x620 fs/super.c:1323
 gfs2_get_tree+0x50/0x210 fs/gfs2/ops_fstype.c:1323
 vfs_get_tree+0x88/0x270 fs/super.c:1530
 do_new_mount+0x289/0xad0 fs/namespace.c:3040
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount+0x2e3/0x3d0 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f7caad9342a
Code: 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc97eb3c68 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f7caad9342a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffc97eb3c80
RBP: 00007ffc97eb3c80 R08: 00007ffc97eb3cc0 R09: 0000555556b512c0
R10: 0000000000000008 R11: 0000000000000282 R12: 0000000000000004
R13: 00007ffc97eb3cc0 R14: 0000000000000001 R15: 0000000020000218
 </TASK>
================================================================================

