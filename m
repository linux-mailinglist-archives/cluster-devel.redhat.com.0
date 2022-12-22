Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AA465BD0F
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Jan 2023 10:21:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672737718;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xoLTaF7bFz05baIcH7CpiltlzNkXu6Pa2DUroFSRlgg=;
	b=TVcnN3qskgDWCSMoFXVfcBHTX+89tyh7bePUkbzc+7W3tAoFCjxibdHA7ti/iem657iEQR
	Nm+dIRAwudfxHECJIxtYnPfwvpR3Y02MT4vKPX5+f2r+ZC9Ls4LIY5sEiatPWUNRv6stm2
	Sg9d5tlrD4qfPHNdLjgtZGmlv0zn4+A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-zTYOQ7fjMRqDcc4urx_cKA-1; Tue, 03 Jan 2023 04:21:50 -0500
X-MC-Unique: zTYOQ7fjMRqDcc4urx_cKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D079B8F6E82;
	Tue,  3 Jan 2023 09:21:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C35BD2166B26;
	Tue,  3 Jan 2023 09:21:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9D418194658C;
	Tue,  3 Jan 2023 09:21:49 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 99D4219465A8 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 22 Dec 2022 05:09:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 78AE02166B29; Thu, 22 Dec 2022 05:09:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 709562166B26
 for <cluster-devel@redhat.com>; Thu, 22 Dec 2022 05:09:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EF9E80D629
 for <cluster-devel@redhat.com>; Thu, 22 Dec 2022 05:09:42 +0000 (UTC)
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-73-fJSEiI8EM7uG-uqb6m_ZFA-1; Thu, 22 Dec 2022 00:09:40 -0500
X-MC-Unique: fJSEiI8EM7uG-uqb6m_ZFA-1
Received: by mail-io1-f70.google.com with SMTP id
 o22-20020a6b5a16000000b006e2d564944aso349123iob.7
 for <cluster-devel@redhat.com>; Wed, 21 Dec 2022 21:09:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xoLTaF7bFz05baIcH7CpiltlzNkXu6Pa2DUroFSRlgg=;
 b=shBY+tNpHrfn9OipCI+7nlldChXSBCdHP7Dhvsa7iX5HrTDHakyc9Qc3A+2f0qRmCX
 zWhmNyllP5lOnY7kKOVY8bxPw7J2lI7ILzttMNRvZzaIDDzVeEeWtQhyKf0VgE3TKTMw
 zCJqiOoLcOT5zFnbHtd3/hVI6ORn0QLqABJ8EcklaleQwaIYxnd4B8TlGUJXqcLLSZy5
 LAuejB4kXk/BMyAm/pHJ9xwoIjDoi5UOgG5oLGaj/xfMasTw59D7xhGUmGJSzoM5L3NM
 vgSZzluOd72OOvL06H0VhpviPoyI7xUqtOUcVah+K/Ks24gFjeWNhmXYXMrXXD3laI8I
 NLWw==
X-Gm-Message-State: AFqh2kqYtCh3reOoR94nMDcq8udk5DKbF0ZloHRdXwfZN8D38PInDQpy
 RzoRrxIgxNvgnrsO+Lof3/7uyovvXnEuXiYyyrV+6bbgo6rz
X-Google-Smtp-Source: AMrXdXtaSpr8NtJPEd4STpTcR8xhn4kGEHa8xDExU0fkqH1YZxkrR5JThp2OAQWW5oWnVWDpBxpefH1nL3opwOjD66iNnL1RosyF
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3e0f:b0:38a:b96b:9fd8 with SMTP id
 co15-20020a0566383e0f00b0038ab96b9fd8mr292566jab.193.1671685779289; Wed, 21
 Dec 2022 21:09:39 -0800 (PST)
Date: Wed, 21 Dec 2022 21:09:39 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000cfc7b05f063adba@google.com>
From: syzbot <syzbot+2b5229694171c6846a90@syzkaller.appspotmail.com>
To: agruenba@redhat.com, broonie@kernel.org, catalin.marinas@arm.com, 
 cluster-devel@redhat.com, kaleshsingh@google.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 madvenka@linux.microsoft.com, mark.rutland@arm.com, maz@kernel.org, 
 rpeterso@redhat.com, syzkaller-bugs@googlegroups.com, will@kernel.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Tue, 03 Jan 2023 09:21:48 +0000
Subject: [Cluster-devel] [syzbot] [gfs2?] kernel panic: stack is corrupted
 in gfs2_block_map
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

HEAD commit:    a5541c0811a0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10e77d27880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cbd4e584773e9397
dashboard link: https://syzkaller.appspot.com/bug?extid=2b5229694171c6846a90
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11b39610480000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11a1c6f7880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b7702208fb9/disk-a5541c08.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9ec0153ec051/vmlinux-a5541c08.xz
kernel image: https://storage.googleapis.com/syzbot-assets/6f8725ad290a/Image-a5541c08.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/72be6726ff4f/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2b5229694171c6846a90@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 125323
gfs2: fsid=syz:syz: Trying to join cluster "lock_nolock", "syz:syz"
gfs2: fsid=syz:syz: Now mounting FS (format 1801)...
Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: gfs2_block_map+0x33c/0x408
CPU: 1 PID: 3073 Comm: syz-executor388 Not tainted 6.1.0-rc8-syzkaller-33330-ga5541c0811a0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call trace:
 dump_backtrace+0x1c4/0x1f0 arch/arm64/kernel/stacktrace.c:156
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:163
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x104/0x16c lib/dump_stack.c:106
 dump_stack+0x1c/0x58 lib/dump_stack.c:113
 panic+0x218/0x508 kernel/panic.c:274
 warn_bogus_irq_restore+0x0/0x40 kernel/panic.c:703
 gfs2_block_map+0x33c/0x408
 0x0
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x00000,040e0108,4c017203
Memory Limit: none
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches

