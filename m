Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA025FDB9E
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Oct 2022 15:53:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665669188;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6CgdoHBqjiIu54Bh2pKl/m/OACsimqC4EZ1Br51DoPQ=;
	b=c3YzkG9cR150c0QTNONmgqi5Gq5wQGbTE8n9xushFsu08AvIV+3l92VF/e/QrWbHLHUqWT
	aahCxRAAmwMAVlQqJevXdw//8P6FfHYJEdvGrLZcNhfOGrWH87og0MoyzQudzACsUCJG1/
	CfwLnRleEiDOR1iZZw+e8vzOOzAB6OM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-gCZoXGtgNSuVD7UWXnPz6Q-1; Thu, 13 Oct 2022 09:53:05 -0400
X-MC-Unique: gCZoXGtgNSuVD7UWXnPz6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEE2E38149B5;
	Thu, 13 Oct 2022 13:53:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8472B40C83BA;
	Thu, 13 Oct 2022 13:53:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 660E319465A0;
	Thu, 13 Oct 2022 13:53:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A7C651946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Oct 2022 13:53:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 42BDD200C0EA; Thu, 13 Oct 2022 13:53:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C14E200C0DF
 for <cluster-devel@redhat.com>; Thu, 13 Oct 2022 13:53:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E4193C11059
 for <cluster-devel@redhat.com>; Thu, 13 Oct 2022 13:53:03 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-FG8LTUDJPVeTki3pa1kV0Q-1; Thu, 13 Oct 2022 09:53:01 -0400
X-MC-Unique: FG8LTUDJPVeTki3pa1kV0Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 2-20020a05600c268200b003c4290989e1so861109wmt.2
 for <cluster-devel@redhat.com>; Thu, 13 Oct 2022 06:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6CgdoHBqjiIu54Bh2pKl/m/OACsimqC4EZ1Br51DoPQ=;
 b=xyi35/2JJAn/XWb/oCvFpRzVXKoHN+XWPDU4N8hkUtrYfMkY74SMFLCHVet2ETbcG/
 6FCUevgrNXNOqj5eK3gBxl1x4eeFDiXO27Ng3ULnS+rb1GUZuc43LXEbGvpMelGCbsy0
 JBFgtvzInRBVde50uRjjwbMzwacoggrAR2Uc29fuxI6MV+b+m/Mpte6jsWmcTpOC8Hxx
 bOVlOPgxjVjlK/Y0zZpkhpKAjbiASHjY4CTnMBXWzWXQPsAXhyK6+1kDXoAbw7k8K8qO
 4yo9swKjXV0UwDH7h0un8XjxWJrxeA8A0kB/KagUu9KN6DGToUUvQqxmtXB/+ieXWBZv
 KwCQ==
X-Gm-Message-State: ACrzQf1mvsBkdtaiqy+OHl6S1f2yVX7RhEYEcgn4py1/ARw2TAnUlFUG
 qz+oZ5WoN/BLDQYwH5FulKYJQRf/etWhNPVAfAQIGLzg/FrfBksS06lR8Ozb+VrQET77zBfRNIz
 kiF7fRh7Yltek1OGC9QPuqg==
X-Received: by 2002:a7b:cb8b:0:b0:3c5:9825:6f01 with SMTP id
 m11-20020a7bcb8b000000b003c598256f01mr6788436wmi.156.1665669180724; 
 Thu, 13 Oct 2022 06:53:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM63g07TR2PeauePQcxWx5DlyrDYFjZbmSyUboxQqqCe50kuZeVLsQAf1B5PkH1E0wWNSq1kBw==
X-Received: by 2002:a7b:cb8b:0:b0:3c5:9825:6f01 with SMTP id
 m11-20020a7bcb8b000000b003c598256f01mr6788421wmi.156.1665669180495; 
 Thu, 13 Oct 2022 06:53:00 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a056000038300b00231910fa71asm2025152wrf.57.2022.10.13.06.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 06:52:59 -0700 (PDT)
Message-ID: <234e8b7e-1646-3bd0-1c3b-0936ddcb93bf@redhat.com>
Date: Thu, 13 Oct 2022 14:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
To: syzbot <syzbot+87a187973530ac822e3c@syzkaller.appspotmail.com>
References: <000000000000b409e205eaea8714@google.com>
From: Andrew Price <anprice@redhat.com>
In-Reply-To: <000000000000b409e205eaea8714@google.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Cc: cluster-devel@redhat.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/10/2022 14:31, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    493ffd6605b2 Merge tag 'ucount-rlimits-cleanups-for-v5.19'..

$ git describe --contains 493ffd6605b2
next-20221011~172

> git tree:       upstream

It would be useful to know the precise git tree.

> console output: https://syzkaller.appspot.com/x/log.txt?x=14620252880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d19f5d16783f901
> dashboard link: https://syzkaller.appspot.com/bug?extid=87a187973530ac822e3c
> compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/f1ff6481e26f/disk-493ffd66.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/101bd3c7ae47/vmlinux-493ffd66.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+87a187973530ac822e3c@syzkaller.appspotmail.com
> 
> ================================================================================
> UBSAN: shift-out-of-bounds in fs/gfs2/meta_io.c:128:16

         shift = PAGE_SHIFT - sdp->sd_sb.sb_bsize_shift;
         index = blkno >> shift;             /* convert block to page */
         bufnum = blkno - (index << shift);  /* block buf index within 
page */

So likely fixed by commit 670f8ce56dd0632dc29a0322e188cc73ce3c6b92 
"gfs2: Check sb_bsize_shift after reading superblock" which has just 
been merged into mainline, but doesn't appear in next-20221011~172

Andy

> shift exponent 4294967293 is too large for 64-bit type 'u64' (aka 'unsigned long long')
> CPU: 0 PID: 10195 Comm: syz-executor.3 Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
> Call Trace:
>   <TASK>
>   __dump_stack lib/dump_stack.c:88 [inline]
>   dump_stack_lvl+0x1b1/0x28e lib/dump_stack.c:106
>   ubsan_epilogue lib/ubsan.c:151 [inline]
>   __ubsan_handle_shift_out_of_bounds+0x33d/0x3b0 lib/ubsan.c:322
>   gfs2_getbuf+0x759/0x7d0 fs/gfs2/meta_io.c:128
>   gfs2_meta_read+0x153/0x910 fs/gfs2/meta_io.c:265
>   gfs2_meta_buffer+0x153/0x3a0 fs/gfs2/meta_io.c:491
>   gfs2_meta_inode_buffer fs/gfs2/meta_io.h:72 [inline]
>   gfs2_inode_refresh+0xab/0xe90 fs/gfs2/glops.c:472
>   gfs2_instantiate+0x15e/0x220 fs/gfs2/glock.c:515
>   gfs2_glock_holder_ready fs/gfs2/glock.c:1303 [inline]
>   gfs2_glock_wait+0x1d9/0x2a0 fs/gfs2/glock.c:1323
>   gfs2_glock_nq_init fs/gfs2/glock.h:263 [inline]
>   gfs2_lookupi+0x40c/0x650 fs/gfs2/inode.c:306
>   gfs2_lookup_simple+0xec/0x170 fs/gfs2/inode.c:258
>   init_journal+0x19b/0x22c0 fs/gfs2/ops_fstype.c:739
>   init_inodes+0xdc/0x340 fs/gfs2/ops_fstype.c:882
>   gfs2_fill_super+0x1ad8/0x2610 fs/gfs2/ops_fstype.c:1240
>   get_tree_bdev+0x400/0x620 fs/super.c:1323
>   gfs2_get_tree+0x50/0x210 fs/gfs2/ops_fstype.c:1323
>   vfs_get_tree+0x88/0x270 fs/super.c:1530
>   do_new_mount+0x289/0xad0 fs/namespace.c:3040
>   do_mount fs/namespace.c:3383 [inline]
>   __do_sys_mount fs/namespace.c:3591 [inline]
>   __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3568
>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>   do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7f0eed68cada
> Code: 48 c7 c2 b8 ff ff ff f7 d8 64 89 02 b8 ff ff ff ff eb d2 e8 b8 04 00 00 0f 1f 84 00 00 00 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f0eee73cf88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 0000000020000200 RCX: 00007f0eed68cada
> RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007f0eee73cfe0
> RBP: 00007f0eee73d020 R08: 00007f0eee73d020 R09: 0000000020000000
> R10: 0000000000000008 R11: 0000000000000202 R12: 0000000020000000
> R13: 0000000020000100 R14: 00007f0eee73cfe0 R15: 0000000020000080
>   </TASK>
> ================================================================================
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

