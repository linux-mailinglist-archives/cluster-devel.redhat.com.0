Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 843CB4FE56C
	for <lists+cluster-devel@lfdr.de>; Tue, 12 Apr 2022 17:54:52 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-h59l7rO4NpiHS_vlYKdaag-1; Tue, 12 Apr 2022 11:54:45 -0400
X-MC-Unique: h59l7rO4NpiHS_vlYKdaag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 074833C00113;
	Tue, 12 Apr 2022 15:54:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 158831457F07;
	Tue, 12 Apr 2022 15:54:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AD99E1940374;
	Tue, 12 Apr 2022 15:54:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 05C59194036A for <cluster-devel@listman.corp.redhat.com>;
 Tue, 12 Apr 2022 15:35:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9C3642D3C7; Tue, 12 Apr 2022 15:35:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3A6F42B949
 for <cluster-devel@redhat.com>; Tue, 12 Apr 2022 15:35:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB5681014A76
 for <cluster-devel@redhat.com>; Tue, 12 Apr 2022 15:35:32 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-YH-pxHoxMgGuL75lYv-9mg-1; Tue, 12 Apr 2022 11:35:30 -0400
X-MC-Unique: YH-pxHoxMgGuL75lYv-9mg-1
Received: by mail-io1-f72.google.com with SMTP id
 i19-20020a5d9353000000b006495ab76af6so11869201ioo.0
 for <cluster-devel@redhat.com>; Tue, 12 Apr 2022 08:35:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=vFB2q3OmWhiQQNudfHfmYzHvPNUtRDLTLchmQKtzzv4=;
 b=78cuirg1oXFGs+DZ2JWczaBvRWaWz9MntbZkmgCVBMxj25/kyKP5OTJStAgMZypdWI
 DKGhShxoW9ZMLEwgUDMHIvZAXqf3/FCj/NHoaBwA9H5KCRydz/FKc1CVCnk39Mt1oka6
 +vfcch8LoORl2zTelLAy/WJf83ZiZzFIDCWJ/pq/Txmo8n94A25CZib1ldHJYN7up1KU
 46VwRZTQikhV0xeWNl3kUSv6yA1tEAhUvuIwtk7ljR/UETSKLP0Mw7/xhU70hCyVgWQy
 JRN5/zMk/5wAjf4M4DiSoBdwzi2DAr1C6TwRl0VMjiOdCrEnGJ2NSmxRgtRLSRricxkO
 A5mA==
X-Gm-Message-State: AOAM533IqzlX3joW5Unx5vy8rZbpfdugEWvu8+YZgGSGFZbCqAbVKfVD
 luClrIzlNvXd8cq4z5GK41TzY9eg8IZ0RDTo/5AyJKGKdzpr
X-Google-Smtp-Source: ABdhPJxiW3T4cPnHUlebhxuzAuoK6vmgqOlQrlLtm0eeW8IteKSrpVvy4ub2bGPOMOpK9x1XQ8PNZlaX6bhBIgul+cBrnmnEFiUc
MIME-Version: 1.0
X-Received: by 2002:a92:6a01:0:b0:2b6:87b7:180b with SMTP id
 f1-20020a926a01000000b002b687b7180bmr16780550ilc.82.1649777730124; Tue, 12
 Apr 2022 08:35:30 -0700 (PDT)
Date: Tue, 12 Apr 2022 08:35:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009001e405dc76cfba@google.com>
From: syzbot <syzbot+331b35dba416a8c626ba@syzkaller.appspotmail.com>
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
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Tue, 12 Apr 2022 15:54:04 +0000
Subject: [Cluster-devel] [syzbot] UBSAN: shift-out-of-bounds in init_sb (2)
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ff511c1c68a5 Add linux-next specific files for 20220408
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17921824f00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0168787d544f48e
dashboard link: https://syzkaller.appspot.com/bug?extid=331b35dba416a8c626ba
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+331b35dba416a8c626ba@syzkaller.appspotmail.com

gfs2: fsid=syz:syz: Now mounting FS (format 1801)...
================================================================================
UBSAN: shift-out-of-bounds in fs/gfs2/ops_fstype.c:297:19
shift exponent 50331651 is too large for 64-bit type 'long unsigned int'
CPU: 1 PID: 29651 Comm: syz-executor.0 Not tainted 5.18.0-rc1-next-20220408-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
 ubsan_epilogue+0xb/0x50 lib/ubsan.c:151
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x187 lib/ubsan.c:322
 gfs2_read_sb fs/gfs2/ops_fstype.c:297 [inline]
 init_sb.cold+0x19/0x109 fs/gfs2/ops_fstype.c:488
 gfs2_fill_super+0x18a7/0x28a0 fs/gfs2/ops_fstype.c:1211
 get_tree_bdev+0x440/0x760 fs/super.c:1292
 gfs2_get_tree+0x4a/0x270 fs/gfs2/ops_fstype.c:1327
 vfs_get_tree+0x89/0x2f0 fs/super.c:1497
 do_new_mount fs/namespace.c:3040 [inline]
 path_mount+0x1320/0x1fa0 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3568
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f445ce8a57a
Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f445dfacf88 EFLAGS: 00000206 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 00007f445ce8a57a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f445dfacfe0
RBP: 00007f445dfad020 R08: 00007f445dfad020 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000020000000
R13: 0000000020000100 R14: 00007f445dfacfe0 R15: 0000000020047a20
 </TASK>
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

