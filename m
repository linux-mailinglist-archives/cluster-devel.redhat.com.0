Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A53F596C1F
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Aug 2022 11:36:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660728967;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=YzUPbjeAbNgur1Ht6pBiKHByR3ZFjUXrKG6V3HyvA6E=;
	b=K3knhkgychQu2Jq6QxlWgckHbRlI2v24SUnTO7Jr08bfMJHC7aaCOw5f0AwU2r+tSgnGEN
	2AipF14GL2TxcWbXy7nL12PHI1Ra+N8+0Tr9DJA4GnIjZ2QwpsFZuymHCKXpkwn2BPXK8B
	m3z4bNuA1g9jCrb9+IWlyCYTDGmCTLQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-252-5VTJhl6gPZ-55RANYKOZuA-1; Wed, 17 Aug 2022 05:36:04 -0400
X-MC-Unique: 5VTJhl6gPZ-55RANYKOZuA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95A963C0E20C;
	Wed, 17 Aug 2022 09:36:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BE12154D8A0;
	Wed, 17 Aug 2022 09:36:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F1368193F518;
	Wed, 17 Aug 2022 09:36:00 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2EC161946A45 for <cluster-devel@listman.corp.redhat.com>;
 Sat, 13 Aug 2022 20:54:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 035DE2166B29; Sat, 13 Aug 2022 20:54:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3F572166B26
 for <cluster-devel@redhat.com>; Sat, 13 Aug 2022 20:54:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6B63803301
 for <cluster-devel@redhat.com>; Sat, 13 Aug 2022 20:54:30 +0000 (UTC)
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-433-zcOubfKBPoCyWW7c4gNtVg-1; Sat, 13 Aug 2022 16:54:29 -0400
X-MC-Unique: zcOubfKBPoCyWW7c4gNtVg-1
Received: by mail-il1-f197.google.com with SMTP id
 e2-20020a056e020b2200b002e1a5b67e29so2725333ilu.11
 for <cluster-devel@redhat.com>; Sat, 13 Aug 2022 13:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc;
 bh=YzUPbjeAbNgur1Ht6pBiKHByR3ZFjUXrKG6V3HyvA6E=;
 b=0V4Pb2Wq2chjGpgKOLbBxvh4LoXEJ+MVP9ens00ckw3vUq2g+MgmvkfqQkdA9Lh+Xc
 RgM2rXTcrBzFCAzGyR3K2pVVpaIvfG4ZLzKutUq9TucpoZvru2I4ogKqiDoVxnJp3iB+
 BApnEF3+5vFk+JKs2WF0UOytGrsTzvXaKjIG8f+onaHrxvEZfFeh6EE1zoBxAbjbMpT9
 1k2auDHR/sSqmlRYgJ3g72JqUjYUZnfDU79utih+82GKhD/OBnLfPnE6//karczybECj
 +zEP4n1KBGkJLFhnGSEdA5vCHAqggPqJi0gGqQOPGQd5QBJ+m+3LNMeWDJmre6cMZnti
 PavA==
X-Gm-Message-State: ACgBeo3HEIcekuCLP+GzI7ya3JPUl8cku9nXfU15FSv75PKXub1NIo9F
 kLqHi8zNEbFCfBTbmDGZHwjATN6cq0QRmjezdJPdA1C5gONP
X-Google-Smtp-Source: AA6agR6i7PWOd1+KUtybI2x08boV9aewzwY5gOAOB+dtXuQ3US92YUKhdyacV10qfuvyzlYV1yCsACGIuMohu98igVtNcLlv7AQ5
MIME-Version: 1.0
X-Received: by 2002:a6b:4909:0:b0:66a:e3fc:e7b2 with SMTP id
 u9-20020a6b4909000000b0066ae3fce7b2mr3829670iob.29.1660424068230; Sat, 13 Aug
 2022 13:54:28 -0700 (PDT)
Date: Sat, 13 Aug 2022 13:54:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c371f705e6259a38@google.com>
From: syzbot <syzbot+dcf33a7aae997956fe06@syzkaller.appspotmail.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Wed, 17 Aug 2022 09:35:59 +0000
Subject: [Cluster-devel] [syzbot] UBSAN: shift-out-of-bounds in init_sb (3)
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    200e340f2196 Merge tag 'pull-work.dcache' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=150cbda9080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1b664fba5e66c4bf
dashboard link: https://syzkaller.appspot.com/bug?extid=dcf33a7aae997956fe06
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dcf33a7aae997956fe06@syzkaller.appspotmail.com

loop1: detected capacity change from 0 to 37440
gfs2: fsid=syz:syz: Trying to join cluster "lock_nolock", "syz:syz"
gfs2: fsid=syz:syz: Now mounting FS (format 1801)...
================================================================================
UBSAN: shift-out-of-bounds in fs/gfs2/ops_fstype.c:297:19
shift exponent 50331651 is too large for 64-bit type 'unsigned long'
CPU: 0 PID: 30381 Comm: syz-executor.1 Not tainted 5.19.0-syzkaller-02972-g200e340f2196 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e3/0x2cb lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:151 [inline]
 __ubsan_handle_shift_out_of_bounds+0x3a6/0x420 lib/ubsan.c:322
 gfs2_read_sb fs/gfs2/ops_fstype.c:297 [inline]
 init_sb+0x11d6/0x12c0 fs/gfs2/ops_fstype.c:487
 gfs2_fill_super+0x1a3c/0x2750 fs/gfs2/ops_fstype.c:1209
 get_tree_bdev+0x400/0x620 fs/super.c:1292
 gfs2_get_tree+0x50/0x210 fs/gfs2/ops_fstype.c:1325
 vfs_get_tree+0x88/0x270 fs/super.c:1497
 do_new_mount+0x289/0xad0 fs/namespace.c:3040
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount+0x2e3/0x3d0 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x2b/0x70 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fc20ac8a7aa
Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fc20be95f88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 00007fc20ac8a7aa
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fc20be95fe0
RBP: 00007fc20be96020 R08: 00007fc20be96020 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 00007fc20be95fe0 R15: 0000000020047a20
 </TASK>
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

