Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B483263A80B
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Nov 2022 13:18:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669637917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FXqRuXYuGUoJFgGF+ex++PGvqKyl+qDrq/iTVDy8jNw=;
	b=a8b+bH+XrsUSEtAjzNHxNNyzrSu6PbUE+6GIcTd4sy2IRGG3PsssdXaJIn1PaofxgK65AJ
	eOw00yvbzKKSI8UKRk6qKZ91O27D7H8x18O4gs0bN8lx1PCVDwj2IO350LIET6MHFxp76s
	DyFiCzfEBOzRLoYOyy1z0r6yTXIImCY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-aQybPsdQNVus4WQ9x1XMRA-1; Mon, 28 Nov 2022 07:18:34 -0500
X-MC-Unique: aQybPsdQNVus4WQ9x1XMRA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E707C1C006AD;
	Mon, 28 Nov 2022 12:18:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ECB4740C6EC2;
	Mon, 28 Nov 2022 12:18:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B792B1946594;
	Mon, 28 Nov 2022 12:18:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8486C1946587 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Nov 2022 13:20:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 72E0A1415137; Fri, 25 Nov 2022 13:20:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BDC91415121
 for <cluster-devel@redhat.com>; Fri, 25 Nov 2022 13:20:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50C648027F5
 for <cluster-devel@redhat.com>; Fri, 25 Nov 2022 13:20:53 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-68-diz3zGyMMkWiV2qdlxnzEQ-1; Fri, 25 Nov 2022 08:20:49 -0500
X-MC-Unique: diz3zGyMMkWiV2qdlxnzEQ-1
Received: by mail-il1-f198.google.com with SMTP id
 j20-20020a056e02219400b00300a22a7fe0so2877210ila.3
 for <cluster-devel@redhat.com>; Fri, 25 Nov 2022 05:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FXqRuXYuGUoJFgGF+ex++PGvqKyl+qDrq/iTVDy8jNw=;
 b=fZ1IZO4DmcSKhxuaWkSMOkKCsQ2Ws96a1xXSKGgxZrpxZ/pGMRx1J5ws/yV49xQF3J
 vs3KIg/hYfBscZ6wqheIDwOyZpuVKgFjs7vfFo+RtGBTWjDRrbhK18IvbWbXXurxYgEH
 rU3ISw+SEYqhCRApCnMzHLxdtwZ3dRxjnxHOXjtFS9K7NdNxfoqA9vk5BfIFcl4XxYcY
 o5mOCuuRVfsuyLzQ9O7FVDW1COdNjR9owZlbG1w4WQlYrThNtVyxUJPVdrz2xEf6jBAB
 gs52v5Bg+ZzKMC6EFLejnon621ED5v8SWJb4XW2wAu7nPp8F9SSDp3NYQ8F7A9LDP7oi
 T/wQ==
X-Gm-Message-State: ANoB5pljZ1iKrDS2Pu8lm3rhPrSjGn8iv2Pz6aokulzdMbGx9h8nJjgh
 aqHcwPcSldUn+7sNkc9I9hBbv2OSp53to9WLafMMhrXFaXKX
X-Google-Smtp-Source: AA0mqf6+3MsCevf+kGZRVM3HZLTbTF4ur77N/dqqUhaBqYmH3ON0dDjtE+elHsHRMWahzekuLsUIS93tzTaECj/Uiu86nQJAhFwO
MIME-Version: 1.0
X-Received: by 2002:a02:93ab:0:b0:363:738a:bb7c with SMTP id
 z40-20020a0293ab000000b00363738abb7cmr8494468jah.227.1669382448987; Fri, 25
 Nov 2022 05:20:48 -0800 (PST)
Date: Fri, 25 Nov 2022 05:20:48 -0800
In-Reply-To: <0000000000003a534305ec1730ec@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ddc6ce05ee4b637d@google.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Mon, 28 Nov 2022 12:18:30 +0000
Subject: Re: [Cluster-devel] [syzbot] kernel BUG in add_to_queue
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    65762d97e6fa Merge branch 'for-next/perf' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=12198e75880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56d0c7c3a2304e8f
dashboard link: https://syzkaller.appspot.com/bug?extid=8a4b520a9affc6d8ea56
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=146e6e75880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1762a3ed880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/52f702197b30/disk-65762d97.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/72189c2789ce/vmlinux-65762d97.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ec0349196c98/Image-65762d97.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/9fcb4ad786f5/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8a4b520a9affc6d8ea56@syzkaller.appspotmail.com

gfs2: fsid=syz:syz.0: G:  s:EX n:8/1 f:qb t:EX d:EX/0 a:0 v:0 r:5 m:20 p:0
gfs2: fsid=syz:syz.0:  H: s:EX f:cH e:0 p:3074 [syz-executor203] gfs2_quota_sync+0xf0/0x204 fs/gfs2/quota.c:1318
------------[ cut here ]------------
kernel BUG at fs/gfs2/glock.c:1560!
Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
Modules linked in:
CPU: 0 PID: 3074 Comm: syz-executor203 Not tainted 6.1.0-rc6-syzkaller-32653-g65762d97e6fa #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : add_to_queue+0x6ec/0x780 fs/gfs2/glock.c:1559
lr : add_to_queue+0x6ec/0x780 fs/gfs2/glock.c:1559
sp : ffff800012deb950
x29: ffff800012deb960 x28: ffff0000cbfa6e80 x27: ffff0000ccea2000
x26: ffff0000cbfa6e80 x25: 0000000000000400 x24: ffff0000c207a800
x23: 0000000000000000 x22: ffff0000c207a800 x21: ffff0000ccea3270
x20: ffff0000cbfa6eb8 x19: ffff0000c70fc550 x18: 00000000000000c0
x17: 5d333032726f7475 x16: ffff80000dbe6158 x15: ffff0000c4248000
x14: 0000000000000000 x13: 00000000ffffffff x12: ffff0000c4248000
x11: ff8080000926a440 x10: 0000000000000000 x9 : 739e9965397fe700
x8 : 739e9965397fe700 x7 : ffff80000c08e4f4 x6 : 0000000000000000
x5 : 0000000000000080 x4 : 0000000000000001 x3 : 0000000000000000
x2 : 0000000000000000 x1 : 0000000000000001 x0 : 0000000000000000
Call trace:
 add_to_queue+0x6ec/0x780 fs/gfs2/glock.c:1559
 gfs2_glock_nq+0x90/0x220 fs/gfs2/glock.c:1585
 gfs2_glock_nq_init fs/gfs2/glock.h:264 [inline]
 do_sync+0x1dc/0x650 fs/gfs2/quota.c:910
 gfs2_quota_sync+0xf0/0x204 fs/gfs2/quota.c:1318
 gfs2_sync_fs+0x30/0x78 fs/gfs2/super.c:643
 sync_filesystem+0x68/0x134 fs/sync.c:56
 generic_shutdown_super+0x38/0x198 fs/super.c:474
 kill_block_super+0x30/0x78 fs/super.c:1428
 gfs2_kill_sb+0x68/0x78
 deactivate_locked_super+0x70/0xe8 fs/super.c:332
 deactivate_super+0xd0/0xd4 fs/super.c:363
 cleanup_mnt+0x184/0x1c0 fs/namespace.c:1186
 __cleanup_mnt+0x20/0x30 fs/namespace.c:1193
 task_work_run+0x100/0x148 kernel/task_work.c:179
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x2dc/0xcac kernel/exit.c:820
 __arm64_sys_exit_group+0x0/0x18 kernel/exit.c:950
 __do_sys_exit_group kernel/exit.c:961 [inline]
 __se_sys_exit_group kernel/exit.c:959 [inline]
 __wake_up_parent+0x0/0x40 kernel/exit.c:959
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
 el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
Code: 52800022 aa1f03e0 aa1303e1 97fff219 (d4210000) 
---[ end trace 0000000000000000 ]---

