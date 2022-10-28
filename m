Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11535611184
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Oct 2022 14:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666960439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=j6ne5l4wFuW3mDlWTj92zFRxrlKnOY6SlahMV9UlXFU=;
	b=Wr7pl9OB1DG6UAdY9NJIbSiu6m7Quyhw1BIE2ZPP0a+1Ii6T8DfzAlo8XLlkUtt5nCojDr
	83UxkM0wA9CXqK8dGsmw4I1xbWsyorq5jCuihLLhGdur8w/e/awfYjbfPGc/KqdtoJbQgq
	sW1O4oXKdpP4jZWZP861l9jjTvpFKoY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-LIQJlcn9MrebeHZJmkuP8A-1; Fri, 28 Oct 2022 08:33:56 -0400
X-MC-Unique: LIQJlcn9MrebeHZJmkuP8A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43EB5101A588;
	Fri, 28 Oct 2022 12:33:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42C2F2166B26;
	Fri, 28 Oct 2022 12:33:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 115FD19466DF;
	Fri, 28 Oct 2022 12:33:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A74541946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 28 Oct 2022 12:13:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8B66FC15995; Fri, 28 Oct 2022 12:13:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8433BC15BA8
 for <cluster-devel@redhat.com>; Fri, 28 Oct 2022 12:13:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69667811E87
 for <cluster-devel@redhat.com>; Fri, 28 Oct 2022 12:13:53 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-Ay6HA_6IPxCESAqBh9gOng-2; Fri, 28 Oct 2022 08:13:51 -0400
X-MC-Unique: Ay6HA_6IPxCESAqBh9gOng-2
Received: by mail-qt1-f199.google.com with SMTP id
 cf23-20020a05622a401700b003a4fe88a9caso2615465qtb.9
 for <cluster-devel@redhat.com>; Fri, 28 Oct 2022 05:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j6ne5l4wFuW3mDlWTj92zFRxrlKnOY6SlahMV9UlXFU=;
 b=BjgxSe5vegqY+oSy7eB+AoF9VvpLZYPHzbybQQef9m6Mw7HGDsOLy0UBrg5WRYZRGP
 PePmq7ygFRDnCOIpK6+HFZy7MZjws7qTo5yxvmmgFuYFnjiYGpgZvwMD8n947jeYRFdI
 SW7iilwcazHK6IIaT5q9A4p/0XMSOA+ZyXI1PWgCOYyMawwQcbOTkZYmXXAp8D2RlQ4D
 Ve0ahIYhbjSfwdqKhInQsXpVi4/wUY8vCPbJC/0Xf7ozVi32ocBpsgj3nXdzIs7GamBP
 Cc448wooQXNepJ+x+zqG70TWO9MntLlYZxzRCFNn0KacNoLnN6OcW1NDHz8FobzIOy+R
 ijHw==
X-Gm-Message-State: ACrzQf1LvQITgxvSUqZ3uGPB17znckUkOEHzsvlMBGjdYTYM3LiwUErU
 Yd8rRENgEecRjWazaWfLJtSmlooe+Mekibyi6paqYiSywRud
X-Google-Smtp-Source: AMsMyM4q2ydnFVVPRFgahh5a3y2Hk6ZYLuulgKgwoqfWPdZkx26jfpTP2h1x9f7PJf7bsrmQ/8Bsv96gp0UBRSgYz+zz1O+JSDdf
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1450:b0:363:7052:9c30 with SMTP id
 l16-20020a056638145000b0036370529c30mr35103714jad.53.1666959221083; Fri, 28
 Oct 2022 05:13:41 -0700 (PDT)
Date: Fri, 28 Oct 2022 05:13:41 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000003a534305ec1730ec@google.com>
From: syzbot <syzbot+8a4b520a9affc6d8ea56@syzkaller.appspotmail.com>
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
X-Mailman-Approved-At: Fri, 28 Oct 2022 12:33:04 +0000
Subject: [Cluster-devel] [syzbot] kernel BUG in add_to_queue
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    bbed346d5a96 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10f68cb6880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3a4a45d2d827c1e
dashboard link: https://syzkaller.appspot.com/bug?extid=8a4b520a9affc6d8ea56
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8e91bc79312/disk-bbed346d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c1cb3fb3b77e/vmlinux-bbed346d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8a4b520a9affc6d8ea56@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: G:  s:EX n:8/1 f:qb t:EX d:EX/0 a:0 v:0 r:5 m:20 p:0
gfs2: fsid=syz:syz.0:  H: s:EX f:cH e:0 p:3072 [syz-executor.5] gfs2_quota_sync+0xf0/0x204 fs/gfs2/quota.c:1322
------------[ cut here ]------------
kernel BUG at fs/gfs2/glock.c:1521!
Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 3072 Comm: syz-executor.5 Not tainted 6.0.0-rc7-syzkaller-18095-gbbed346d5a96 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : add_to_queue+0x5e0/0x710 fs/gfs2/glock.c:1520
lr : add_to_queue+0x5e0/0x710 fs/gfs2/glock.c:1520
sp : ffff80001367ba40
x29: ffff80001367ba50 x28: ffff000131decee0 x27: ffff0000c91a1b00
x26: 0000000000000040 x25: 0000000000000000 x24: 0000000000000000
x23: 0000000000000000 x22: ffff0000c91a1b00 x21: ffff00012b643270
x20: ffff000131decf18 x19: ffff0001172327f8 x18: 00000000000000c0
x17: 205d352e726f7475 x16: ffff80000db49158 x15: ffff0000c73c1a80
x14: 0000000000000000 x13: 00000000ffffffff x12: ffff0000c73c1a80
x11: ff8080000926b160 x10: 0000000000000000 x9 : 8630f0a241885900
x8 : 8630f0a241885900 x7 : ffff80000819545c x6 : 0000000000000000
x5 : 0000000000000080 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
Call trace:
 add_to_queue+0x5e0/0x710 fs/gfs2/glock.c:1520
 gfs2_glock_nq+0x90/0x220 fs/gfs2/glock.c:1546
 gfs2_glock_nq_init fs/gfs2/glock.h:263 [inline]
 do_sync+0x1dc/0x650 fs/gfs2/quota.c:914
 gfs2_quota_sync+0xf0/0x204 fs/gfs2/quota.c:1322
 gfs2_sync_fs+0x30/0x78 fs/gfs2/super.c:642
 sync_filesystem+0x68/0x134 fs/sync.c:56
 generic_shutdown_super+0x38/0x190 fs/super.c:474
 kill_block_super+0x30/0x78 fs/super.c:1427
 gfs2_kill_sb+0x68/0x78
 deactivate_locked_super+0x70/0xe8 fs/super.c:332
 deactivate_super+0xd0/0xd4 fs/super.c:363
 cleanup_mnt+0x1f8/0x234 fs/namespace.c:1186
 __cleanup_mnt+0x20/0x30 fs/namespace.c:1193
 task_work_run+0xc4/0x14c kernel/task_work.c:177
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 do_notify_resume+0x174/0x1f0 arch/arm64/kernel/signal.c:1127
 prepare_exit_to_user_mode arch/arm64/kernel/entry-common.c:137 [inline]
 exit_to_user_mode arch/arm64/kernel/entry-common.c:142 [inline]
 el0_svc+0x9c/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:654
 el0t_64_sync+0x18c/0x190 arch/arm64/kernel/entry.S:581
Code: 52800022 aa1f03e0 aa1303e1 97fff284 (d4210000) 
---[ end trace 0000000000000000 ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

