Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39FD87923DC
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Sep 2023 17:18:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693927112;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zmaWqdjOtt9j6z//ErR2j9KoqmwRo3rNHVaNiamOmos=;
	b=dd69rqF7rXQRfNQvQxxv+9+T9dxIHGc+gdjobA96dsWGgiYZKeA6JJBynsmbp/TbpGszud
	yl3caIzGvG+WkwJp8jeTl/TPw+Kg2B5iQqEg7aa6KXobJRnhV4PvExTjqmjdUyWLcPKNVw
	I0uIuprTH4E6oX6iOOS/E/StBXi3d/Q=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-heIS-kg_MOOHiKLVWyQdQA-1; Tue, 05 Sep 2023 11:18:28 -0400
X-MC-Unique: heIS-kg_MOOHiKLVWyQdQA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC34038210A2;
	Tue,  5 Sep 2023 15:18:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B370846F522;
	Tue,  5 Sep 2023 15:18:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4C0761946597;
	Tue,  5 Sep 2023 15:18:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B23AB1946589 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  5 Sep 2023 15:10:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9FD211182ED; Tue,  5 Sep 2023 15:10:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98413C124A
 for <cluster-devel@redhat.com>; Tue,  5 Sep 2023 15:10:11 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B36358B14DD
 for <cluster-devel@redhat.com>; Tue,  5 Sep 2023 15:10:08 +0000 (UTC)
Received: from mail-pj1-f77.google.com (mail-pj1-f77.google.com
 [209.85.216.77]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-OK0a13HTPiOhIiC8yYUEYg-1; Tue, 05 Sep 2023 11:10:05 -0400
X-MC-Unique: OK0a13HTPiOhIiC8yYUEYg-1
Received: by mail-pj1-f77.google.com with SMTP id
 98e67ed59e1d1-26b752bc74fso2491371a91.2
 for <cluster-devel@redhat.com>; Tue, 05 Sep 2023 08:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693926600; x=1694531400;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zmaWqdjOtt9j6z//ErR2j9KoqmwRo3rNHVaNiamOmos=;
 b=SI3n9gs+gc9iEQFbbQyzd+Ov6hoNv5SXxCCD7hX0BooQCih6oGMwvksfbJj/otpzQm
 KA2VUc4pWQmpxyZ8BcJSwmq52Wa5pxXac0FY57nj2ann29X+IWcUJpHt6Sh3tV7AzhpC
 iHsQuJvbRHEJbLUfp1nAHf88FNyR8TOaOD4hxSyaELVeOs39WAkD1fXzhxOMdnjs9Nr+
 BVeFkm+i4xqyAW+VUw7KvBYWSmZFW2/pSp3MEV20QtL3H2tJCrC75jJANLGa9J42IF8k
 K4LhkG8L4w6wdWSjFlGAWUVRTFDyADzVtlBwC97attmw6iNGaVS3mUOJdXWhiO1apXeZ
 PfuQ==
X-Gm-Message-State: AOJu0YypO2BTlYIzbtn9zA32bb8H8IW1vSSNK5LeYc3ZyGmGZ+S/i66M
 08gZaLSSEZ4kLr6DvkfbXnzqg43+AsA+gOuXGtUWqv1Rs+Pv
X-Google-Smtp-Source: AGHT+IEmuaB2xmUxHtmQZ3alrUy3R1NLKvFYpm/C9UXlkG59HS+rOQkSaNz31B+GxxonH1/yXR4WbaVewoWWNyrik2gWFJOsYwei
MIME-Version: 1.0
X-Received: by 2002:a17:90a:ba0b:b0:26d:ae3:f6a4 with SMTP id
 s11-20020a17090aba0b00b0026d0ae3f6a4mr3045072pjr.5.1693926600763; Tue, 05 Sep
 2023 08:10:00 -0700 (PDT)
Date: Tue, 05 Sep 2023 08:10:00 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005071ca06049e05f0@google.com>
From: syzbot <syzbot+f695093038cdf1175371@syzkaller.appspotmail.com>
To: agruenba@redhat.com, cluster-devel@redhat.com, 
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rpeterso@redhat.com, syzkaller-bugs@googlegroups.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 05 Sep 2023 15:18:24 +0000
Subject: [Cluster-devel] [syzbot] [gfs2?] BUG: sleeping function called from
 invalid context in gfs2_flush_delete_work
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    99d99825fc07 Merge tag 'nfs-for-6.6-1' of git://git.linux-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=114e462fa80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=30b036635ccf91ce
dashboard link: https://syzkaller.appspot.com/bug?extid=f695093038cdf1175371
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13536d8fa80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13aeb870680000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-99d99825.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ce6af6f13dfd/vmlinux-99d99825.xz
kernel image: https://storage.googleapis.com/syzbot-assets/10b5fe4e45b5/bzImage-99d99825.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/6bbc32f93f62/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f695093038cdf1175371@syzkaller.appspotmail.com

loop0: rw=1, sector=3280942697285464, nr_sectors = 8 limit=32768
gfs2: fsid=syz:syz.0: Error 10 writing to journal, jid=0
gfs2: fsid=syz:syz.0: fatal: I/O error(s)
gfs2: fsid=syz:syz.0: about to withdraw this file system
BUG: sleeping function called from invalid context at fs/gfs2/glock.c:2081
in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 5143, name: syz-executor333
preempt_count: 1, expected: 0
RCU nest depth: 0, expected: 0
INFO: lockdep is turned off.
Preemption disabled at:
[<0000000000000000>] 0x0
CPU: 1 PID: 5143 Comm: syz-executor333 Not tainted 6.5.0-syzkaller-09276-g99d99825fc07 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x125/0x1b0 lib/dump_stack.c:106
 __might_resched+0x3c3/0x5e0 kernel/sched/core.c:10187
 glock_hash_walk fs/gfs2/glock.c:2081 [inline]
 gfs2_flush_delete_work+0x1f6/0x2b0 fs/gfs2/glock.c:2108
 gfs2_make_fs_ro+0x460/0x740 fs/gfs2/super.c:550
 signal_our_withdraw fs/gfs2/util.c:153 [inline]
 gfs2_withdraw+0xc2e/0x10c0 fs/gfs2/util.c:334
 gfs2_ail1_empty+0x8cc/0xab0 fs/gfs2/log.c:377
 gfs2_flush_revokes+0x6b/0x90 fs/gfs2/log.c:815
 revoke_lo_before_commit+0x22/0x640 fs/gfs2/lops.c:868
 lops_before_commit fs/gfs2/lops.h:40 [inline]
 gfs2_log_flush+0x105e/0x27f0 fs/gfs2/log.c:1101
 gfs2_write_inode+0x24a/0x4b0 fs/gfs2/super.c:453
 write_inode fs/fs-writeback.c:1456 [inline]
 __writeback_single_inode+0xa81/0xe70 fs/fs-writeback.c:1668
 writeback_single_inode+0x2af/0x590 fs/fs-writeback.c:1724
 sync_inode_metadata+0xa5/0xe0 fs/fs-writeback.c:2786
 gfs2_fsync+0x218/0x380 fs/gfs2/file.c:761
 vfs_fsync_range+0x141/0x220 fs/sync.c:188
 generic_write_sync include/linux/fs.h:2625 [inline]
 gfs2_file_write_iter+0xd97/0x10c0 fs/gfs2/file.c:1150
 call_write_iter include/linux/fs.h:1985 [inline]
 do_iter_readv_writev+0x21e/0x3c0 fs/read_write.c:735
 do_iter_write+0x17f/0x830 fs/read_write.c:860
 vfs_iter_write+0x7a/0xb0 fs/read_write.c:901
 iter_file_splice_write+0x698/0xbf0 fs/splice.c:736
 do_splice_from fs/splice.c:933 [inline]
 direct_splice_actor+0x118/0x180 fs/splice.c:1142
 splice_direct_to_actor+0x347/0xa30 fs/splice.c:1088
 do_splice_direct+0x1af/0x280 fs/splice.c:1194
 do_sendfile+0xb88/0x1390 fs/read_write.c:1254
 __do_sys_sendfile64 fs/read_write.c:1322 [inline]
 __se_sys_sendfile64 fs/read_write.c:1308 [inline]
 __x64_sys_sendfile64+0x1d6/0x220 fs/read_write.c:1308
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f47de46e6b9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff21f08188 EFLAGS: 00000246 ORIG_RAX: 0000000000000028
RAX: ffffffffffffffda RBX: 00007fff21f08358 RCX: 00007f47de46e6b9
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000007
RBP: 00007f47de4f3610 R08: 00007fff21f08358 R09: 00007fff21f08358
R10: 0001000000201004 R11: 0000000000000246 R12: 0000000000000001
R13: 00007fff21f08348 R14: 0000000000000001 R15: 0000000000000001
 </TASK>
BUG: scheduling while atomic: syz-executor333/5143/0x00000002
INFO: lockdep is turned off.
Modules linked in:
Preemption disabled at:
[<0000000000000000>] 0x0


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

If you want to overwrite bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

