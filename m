Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C5E5306AD
	for <lists+cluster-devel@lfdr.de>; Mon, 23 May 2022 01:11:55 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-hERamykGO768iRoaojKbhQ-1; Sun, 22 May 2022 19:11:52 -0400
X-MC-Unique: hERamykGO768iRoaojKbhQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 493403C11720;
	Sun, 22 May 2022 23:11:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 03168492C3B;
	Sun, 22 May 2022 23:11:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2FC98194705B;
	Sun, 22 May 2022 23:11:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6452E1947058 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 22 May 2022 23:11:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4175640E6A44; Sun, 22 May 2022 23:11:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D96140E6A42
 for <cluster-devel@redhat.com>; Sun, 22 May 2022 23:11:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 255A3101AA42
 for <cluster-devel@redhat.com>; Sun, 22 May 2022 23:11:45 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-Gib3oytjNmOoC9jD7_syGA-1; Sun, 22 May 2022 19:11:42 -0400
X-MC-Unique: Gib3oytjNmOoC9jD7_syGA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nsujN-00FfOn-R7; Sun, 22 May 2022 23:11:25 +0000
Date: Mon, 23 May 2022 00:11:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: syzbot <syzbot+8d1d62bfb63d6a480be1@syzkaller.appspotmail.com>
Message-ID: <YorDHW5UmHuTq+2c@casper.infradead.org>
References: <000000000000f121b705df9f5a0a@google.com>
MIME-Version: 1.0
In-Reply-To: <000000000000f121b705df9f5a0a@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: Re: [Cluster-devel] [syzbot] WARNING in folio_account_dirtied
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, linux-mm@kvack.org, akpm@linux-foundation.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 22, 2022 at 01:13:22PM -0700, syzbot wrote:
> HEAD commit:    ef1302160bfb Merge tag 'sound-5.18' of git://git.kernel.or..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17626629f00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d84df8e1a4c4d5a4
> dashboard link: https://syzkaller.appspot.com/bug?extid=8d1d62bfb63d6a480be1
> compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> Unfortunately, I don't have any reproducer for this issue yet.

Hmm.  This looks like a gfs2 issue.  Adding maintainers.

> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+8d1d62bfb63d6a480be1@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 19258 at include/linux/backing-dev.h:264 folio_account_dirtied+0x61a/0x720 mm/page-writeback.c:2448

This is:

        WARN_ON_ONCE(debug_locks &&
                     (!lockdep_is_held(&inode->i_lock) &&
                      !lockdep_is_held(&inode->i_mapping->i_pages.xa_lock) &&
                      !lockdep_is_held(&inode->i_wb->list_lock)));

The comment says:

 * The caller must be
 * holding either @inode->i_lock, the i_pages lock, or the
 * associated wb's list_lock.

IIRC, gfs2 plays some fun games with mapping->host and inode->i_mapping,
so maybe there's something the VFS is trying to do for it that isn't
working as expected.

A similar problem was recently encountered and fixed with nilfs2.
https://lore.kernel.org/all/CAKFNMonQtBe=pjrUuACqzKL36RTWmvoULwzD9NCP7PET8B73bQ@mail.gmail.com/
https://lore.kernel.org/all/1647867427-30498-1-git-send-email-konishi.ryusuke@gmail.com/

This is the first time I recall seeing it with gfs2.

> Modules linked in:
> CPU: 1 PID: 19258 Comm: syz-executor.3 Not tainted 5.18.0-rc7-syzkaller-00015-gef1302160bfb #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:inode_to_wb include/linux/backing-dev.h:261 [inline]
> RIP: 0010:folio_account_dirtied+0x61a/0x720 mm/page-writeback.c:2448
> Code: ff ff e9 6e fd ff ff e8 c4 6d d2 ff 4c 89 f7 4c 89 e6 48 83 c4 18 5b 41 5c 41 5d 41 5e 41 5f 5d e9 eb af 29 00 e8 a6 6d d2 ff <0f> 0b 43 80 3c 3c 00 0f 85 36 fd ff ff e9 39 fd ff ff 48 c7 c1 f4
> RSP: 0018:ffffc90002e5f840 EFLAGS: 00010093
> RAX: ffffffff81b3a75a RBX: 0000000000000000 RCX: ffff8880795c9d80
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffff888140c8ef80 R08: ffffffff81b3a71e R09: fffff940003cd8c9
> R10: fffff940003cd8c9 R11: 1ffffd40003cd8c8 R12: 1ffff11028191df0
> R13: 0000000000000001 R14: ffffea0001e6c640 R15: dffffc0000000000
> FS:  0000555556a2c400(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000c0157c0000 CR3: 0000000034a53000 CR4: 00000000003506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 000000000000003b DR6: 00000000ffff0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  __folio_mark_dirty+0x125/0x260 mm/page-writeback.c:2499
>  __set_page_dirty include/linux/pagemap.h:1008 [inline]
>  mark_buffer_dirty+0x263/0x560 fs/buffer.c:1105
>  gfs2_unpin+0x116/0xa40 fs/gfs2/lops.c:111
>  buf_lo_after_commit+0x172/0x1d0 fs/gfs2/lops.c:747
>  lops_after_commit fs/gfs2/lops.h:49 [inline]
>  gfs2_log_flush+0x1258/0x2770 fs/gfs2/log.c:1108
>  do_sync+0xbe7/0xe60 fs/gfs2/quota.c:967
>  gfs2_quota_sync+0x3da/0x8b0 fs/gfs2/quota.c:1310
>  gfs2_sync_fs+0x49/0xb0 fs/gfs2/super.c:642
>  sync_filesystem+0xe8/0x220 fs/sync.c:56
>  generic_shutdown_super+0x6b/0x300 fs/super.c:445
>  kill_block_super+0x79/0xd0 fs/super.c:1394
>  deactivate_locked_super+0xa7/0xf0 fs/super.c:332
>  cleanup_mnt+0x452/0x500 fs/namespace.c:1186
>  task_work_run+0x146/0x1c0 kernel/task_work.c:164
>  resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
>  exit_to_user_mode_loop+0x134/0x160 kernel/entry/common.c:169
>  exit_to_user_mode_prepare+0xad/0x110 kernel/entry/common.c:201
>  __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
>  syscall_exit_to_user_mode+0x2e/0x70 kernel/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x7f1c2e88a557
> Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fff1b126788 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f1c2e88a557
> RDX: 00007fff1b12685a RSI: 000000000000000a RDI: 00007fff1b126850
> RBP: 00007fff1b126850 R08: 00000000ffffffff R09: 00007fff1b126620
> R10: 0000555556a2d8b3 R11: 0000000000000246 R12: 00007f1c2e8e21f8
> R13: 00007fff1b127910 R14: 0000555556a2d810 R15: 00007fff1b127950
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 

