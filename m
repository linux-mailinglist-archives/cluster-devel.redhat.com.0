Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 51B773B87C2
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Jun 2021 19:33:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-dc180KI-OAytpzsF2Pni0A-1; Wed, 30 Jun 2021 13:33:13 -0400
X-MC-Unique: dc180KI-OAytpzsF2Pni0A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A8C99F936;
	Wed, 30 Jun 2021 17:32:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8577360843;
	Wed, 30 Jun 2021 17:32:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFA4A4EA2F;
	Wed, 30 Jun 2021 17:32:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15UGQYft024353 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 30 Jun 2021 12:26:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28D931000DB8; Wed, 30 Jun 2021 16:26:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B4F111E41D
	for <cluster-devel@redhat.com>; Wed, 30 Jun 2021 16:26:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AC5F1065295
	for <cluster-devel@redhat.com>; Wed, 30 Jun 2021 16:26:29 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
	[209.85.166.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-458-NJHhshbiO-GPwiKe8CUm5Q-1; Wed, 30 Jun 2021 12:26:26 -0400
X-MC-Unique: NJHhshbiO-GPwiKe8CUm5Q-1
Received: by mail-io1-f70.google.com with SMTP id
	p4-20020a5d9c840000b02904fbbc3e404aso2262948iop.11
	for <cluster-devel@redhat.com>; Wed, 30 Jun 2021 09:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
	bh=rim975nXZVZywCYilCGa7/3xyFa5zoe093VUS5CetDo=;
	b=suyWp0HAQVqOWY/DRZD7T0YtLkagny5b1NOqnCVrmuiH6dHtjY0aamx726n5T5MJAT
	q5VLcbyRfM6e6XS4FTIgzC9F63Fhb+ltS6H5Y1tG8+etJzlhrKV8ImnwUMCd3gLaTH1O
	wjT5dEgdPN55WPxOLm1MHunKO7D7eRrRBPkuqY1o0FGR2oce277ZlbpanIa8CEpRA3T0
	Fr6yCx7q1lDs5AiKf54Iva5ikST2aBaLuF/WJRMkmPZuQx96MpzqVc6ZsPVaKG26EebC
	r6AvhaOpEd8wwzdlV+UuUg53kd1yMqSBr+hw6a3YYyALzf7uh7fNAuv9NIcEvJhKqTEp
	nrbw==
X-Gm-Message-State: AOAM533jk8dIkN2UIl1c7OPsYOuXxGCCX9vy5NqQN8GnG7Ip+ZoG5Zzl
	H+4JmZTJ647LMYtjxuRBph2M9SKRH6dhmHd4So1GGkSTgAn9
X-Google-Smtp-Source: ABdhPJyuAAYISWpFuIpXWMRo0V9lQ2ryWt1aE7aRNqU7lu+FrhiNN+1J1fCKXivnvaZvbZ3N5wbFt7ks76sxgkkNmQwbax2cWA3r
MIME-Version: 1.0
X-Received: by 2002:a92:ddc6:: with SMTP id d6mr25187753ilr.51.1625070386323; 
	Wed, 30 Jun 2021 09:26:26 -0700 (PDT)
Date: Wed, 30 Jun 2021 09:26:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001ca9eb05c5fe2f21@google.com>
From: syzbot <syzbot+a498b19f2d8b0d716088@syzkaller.appspotmail.com>
To: agruenba@redhat.com, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org, rpeterso@redhat.com,
	syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 30 Jun 2021 13:32:52 -0400
Subject: [Cluster-devel] [syzbot] UBSAN: shift-out-of-bounds in init_sb
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

Hello,

syzbot found the following issue on:

HEAD commit:    62fb9874 Linux 5.13
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12b490fbd00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e8e1ef25331bf17e
dashboard link: https://syzkaller.appspot.com/bug?extid=a498b19f2d8b0d716088

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a498b19f2d8b0d716088@syzkaller.appspotmail.com

gfs2: fsid=syz:syz: Now mounting FS (format 1801)...
================================================================================
UBSAN: shift-out-of-bounds in fs/gfs2/ops_fstype.c:299:19
shift exponent 100663299 is too large for 64-bit type 'long unsigned int'
CPU: 1 PID: 30834 Comm: syz-executor.4 Not tainted 5.13.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x141/0x1d7 lib/dump_stack.c:120
 ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:327
 gfs2_read_sb fs/gfs2/ops_fstype.c:299 [inline]
 init_sb.cold+0x19/0x109 fs/gfs2/ops_fstype.c:489
 gfs2_fill_super+0x18a6/0x2680 fs/gfs2/ops_fstype.c:1171
 get_tree_bdev+0x440/0x760 fs/super.c:1293
 gfs2_get_tree+0x4a/0x270 fs/gfs2/ops_fstype.c:1273
 vfs_get_tree+0x89/0x2f0 fs/super.c:1498
 do_new_mount fs/namespace.c:2905 [inline]
 path_mount+0x132a/0x1fa0 fs/namespace.c:3235
 do_mount fs/namespace.c:3248 [inline]
 __do_sys_mount fs/namespace.c:3456 [inline]
 __se_sys_mount fs/namespace.c:3433 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3433
 do_syscall_64+0x3a/0xb0 arch/x86/entry/common.c:47
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x467afa
Code: 48 c7 c2 bc ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fd3a69ebfa8 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 0000000000467afa
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fd3a69ec000
RBP: 00007fd3a69ec040 R08: 00007fd3a69ec040 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 00007fd3a69ec000 R15: 0000000020047a20
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

