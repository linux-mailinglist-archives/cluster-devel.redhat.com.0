Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BF975F331
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jul 2023 12:28:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690194535;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8qTOg30Pyyd8rsEqqzfnKH2ivlCUarSSwgeMcDgQLn0=;
	b=UNMuRGlhTDKodtI4M+6Xs32jttn13tX710V0M9NKUN5rOWf0Gjml/dDkDNnalU+SWbUnam
	Ct2I1+M3uMGF4WOYBK1KT8FvDYQ8tOeUotQW+ui13j+z618/IbMI0Euee/rVX55QJrJkX2
	16j4Y1GDywEn9B5tt8EiSfCRdPW0mx8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-qAM2bPO3M1S7D5pRyDVGzQ-1; Mon, 24 Jul 2023 06:28:52 -0400
X-MC-Unique: qAM2bPO3M1S7D5pRyDVGzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8938C1869B0F;
	Mon, 24 Jul 2023 10:28:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C234F7837;
	Mon, 24 Jul 2023 10:28:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0975119543B9;
	Mon, 24 Jul 2023 10:28:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DED4D1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Jul 2023 20:48:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9B321F77B9; Fri, 21 Jul 2023 20:48:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 933DAF6CDC
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 20:48:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F6651C0419B
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 20:48:14 +0000 (UTC)
Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com
 [209.85.210.79]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-w3xgnef7MDe9d0MuiyH0AQ-1; Fri, 21 Jul 2023 16:48:12 -0400
X-MC-Unique: w3xgnef7MDe9d0MuiyH0AQ-1
Received: by mail-ot1-f79.google.com with SMTP id
 46e09a7af769-6b9d8b76be5so4872953a34.1
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 13:48:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689972491; x=1690577291;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8qTOg30Pyyd8rsEqqzfnKH2ivlCUarSSwgeMcDgQLn0=;
 b=j+EsWFvqnnFcrOEzdUx1fQ+9o6xhkWHrFVPLKNveeEbk6s8xLpeszE5HkkqzdeP+/u
 2SvUdxG01TRcPSfrbSbEJoLEdhGLGrykDoRELhHVUQibrb0mDaEbm52AFm+MLc+gI6VN
 fD/fVuJhre9Vj+layq2hJjmYMGjuMxeTu4j2Y6NhWnHqRUUlog5oJeNaEqs4uJXic1f5
 uHh/SIh2yUkBrtXtJUJ8UtQunfL3UTI4f4l6s07LPcy+Ui1EjLbrMZTUAtvbtDMA7daT
 T7ePnTUnDmjlegxD9SMxbj1402v2wyRNhAJXg2prMgvJur/f1m0k5RitOurpqYyhbo9v
 4qsA==
X-Gm-Message-State: ABy/qLbh1rhGv7OkxqJh2L5eu80JrOjt5fLtRGnpomthBYDQmRElmhQB
 oExnWKjitEHbDNuZVglXG50E8Bp3NirbpEFrQIUOQqzFGduC52Vniw==
X-Google-Smtp-Source: APBJJlElBQGXVCLZabwgLaEmLzMHQYKFHWenz4onzfkqO/Quvh8RT0SkcxsUzr4MJ14kIrJG99OR+w3TcFKHqjGUEqFpJ3LCHfkw
MIME-Version: 1.0
X-Received: by 2002:a05:6830:118:b0:6b9:a90e:f515 with SMTP id
 i24-20020a056830011800b006b9a90ef515mr1450617otp.3.1689972491743; Fri, 21 Jul
 2023 13:48:11 -0700 (PDT)
Date: Fri, 21 Jul 2023 13:48:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000cf7de0601056232@google.com>
From: syzbot <syzbot+607aa822c60b2e75b269@syzkaller.appspotmail.com>
To: cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Mon, 24 Jul 2023 10:28:27 +0000
Subject: [Cluster-devel] [syzbot] [gfs2?] kernel panic: hung_task: blocked
 tasks (2)
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
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    fdf0eaf11452 Linux 6.5-rc2
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1797783aa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=27e33fd2346a54b
dashboard link: https://syzkaller.appspot.com/bug?extid=607aa822c60b2e75b269
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11322fb6a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17687f1aa80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0ac950f24d26/disk-fdf0eaf1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/666fcbcfa05d/vmlinux-fdf0eaf1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5bbe73baa630/bzImage-fdf0eaf1.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/85821d156573/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+607aa822c60b2e75b269@syzkaller.appspotmail.com

Kernel panic - not syncing: hung_task: blocked tasks
CPU: 0 PID: 27 Comm: khungtaskd Not tainted 6.5.0-rc2-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/03/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x1b0 lib/dump_stack.c:106
 panic+0x6a4/0x750 kernel/panic.c:340
 check_hung_uninterruptible_tasks kernel/hung_task.c:226 [inline]
 watchdog+0xcf2/0x11b0 kernel/hung_task.c:379
 kthread+0x33a/0x430 kernel/kthread.c:389
 ret_from_fork+0x2c/0x70 arch/x86/kernel/process.c:145
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:296
RIP: 0000:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0000:0000000000000000 EFLAGS: 00000000 ORIG_RAX: 0000000000000000
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

