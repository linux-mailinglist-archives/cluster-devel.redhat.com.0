Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E154660C8FF
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Oct 2022 11:54:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666691654;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TLlHx01ePLtrMaaeNMCBOsu8fQMuVd+x6oG4xiXZbNE=;
	b=c7EZQ1tp7Flg0krPvGU+tTGII28/KMXRKimfjAxNB3ADLhq0mKCmqG3yYS9ahDKdbANn6G
	XkUzjkm0TxKaPbqHRQFqAIx6dQNZb45Bt2w/RugEDd4U/PIUV4i/nrDJvbVpCnGgIULqdL
	SgaOfh7IgX2344y3StMC8Su97XdlQ74=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-N625ZTHwPry4d6umrdG1lA-1; Tue, 25 Oct 2022 05:54:11 -0400
X-MC-Unique: N625ZTHwPry4d6umrdG1lA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DD371C08784;
	Tue, 25 Oct 2022 09:54:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1D7140C6E13;
	Tue, 25 Oct 2022 09:54:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 474291946A40;
	Tue, 25 Oct 2022 09:54:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B375D1946597 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 25 Oct 2022 09:54:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A3FF52166B2B; Tue, 25 Oct 2022 09:54:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C6E22166B2A
 for <cluster-devel@redhat.com>; Tue, 25 Oct 2022 09:54:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D452101A54E
 for <cluster-devel@redhat.com>; Tue, 25 Oct 2022 09:54:06 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-167-5TYhyBuoNrmqva_0ClgP3w-1; Tue, 25 Oct 2022 05:54:05 -0400
X-MC-Unique: 5TYhyBuoNrmqva_0ClgP3w-1
Received: by mail-qv1-f69.google.com with SMTP id
 d8-20020a0cfe88000000b004bb65193fdcso3117586qvs.12
 for <cluster-devel@redhat.com>; Tue, 25 Oct 2022 02:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TLlHx01ePLtrMaaeNMCBOsu8fQMuVd+x6oG4xiXZbNE=;
 b=EGWSc7jz4TZYg5Oi3EwUgyg4TdBmb+cvZxJ0R14wvl/KX+/f+271a5A0Dq+5ZwimJ7
 Bhc9pSGLAPjnaAb3wQ9EMqn8U8me7o7tL4jITaptrPb5c3Y6WjhoBegbT3wvEIbg2aGK
 2xHtBFNQakD9zAt43hzbArwYwQiwTn3RisIflWlb57yaTq8eFkH0juJEYwNmbRJL3T2D
 OmyrEeq/82bNlnQ9YL7PxKoqf8CimP6BXLkaTw5Gspd2uJ67/T2v0uGjVqZmua7l8D4S
 X44IwCTyk7CuVreFwfoXB5ltaxkxXWy2AqLx2qjBwzJS0s+u+py3CcYqBF5pHNXb8jpP
 qUSA==
X-Gm-Message-State: ACrzQf22EMXpfiM1IbaNXz4Wf6Yi3lYFMqyNRJQ4taceSLqChPQEf+oD
 VRX8T2boZwHOXSCgTMv3l3PsIhjLYt1sRmnGgyj10X5GtQwNfjV4q3nlJDKluwM1v+5p3HIBMMW
 hTZMNCPqPngyJv6JvFGNq/g==
X-Received: by 2002:ac8:5a46:0:b0:39c:eb97:6904 with SMTP id
 o6-20020ac85a46000000b0039ceb976904mr31344356qta.488.1666691644535; 
 Tue, 25 Oct 2022 02:54:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Ap+KjJvmL7sOCne8CQXEg8wHyoh7FQjDtMPGlgssfv//7DtBjkCX2VU7bAQZbQ5U+dbH5Lw==
X-Received: by 2002:ac8:5a46:0:b0:39c:eb97:6904 with SMTP id
 o6-20020ac85a46000000b0039ceb976904mr31344350qta.488.1666691644314; 
 Tue, 25 Oct 2022 02:54:04 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 h12-20020a05620a400c00b006e702033b15sm1817336qko.66.2022.10.25.02.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 02:54:03 -0700 (PDT)
Message-ID: <9555d914-1d5a-e8aa-a67c-e84bd869e312@redhat.com>
Date: Tue, 25 Oct 2022 10:54:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: agruenba@redhat.com, rpeterso@redhat.com
References: <0000000000008954f305eb9d9f7c@google.com>
From: Andrew Price <anprice@redhat.com>
In-Reply-To: <0000000000008954f305eb9d9f7c@google.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [syzbot] WARNING in gfs2_ri_update
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
Cc: cluster-devel@redhat.com,
 syzbot <syzbot+f8bc4176e51e87e0928f@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/10/2022 12:11, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    440b7895c990 Merge tag 'mm-hotfixes-stable-2022-10-20' of ..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=128087a4880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=afc317c0f52ce670
> dashboard link: https://syzkaller.appspot.com/bug?extid=f8bc4176e51e87e0928f
> compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13ed90f2880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16717fc2880000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/105038975fc9/disk-440b7895.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/edd7302c8fc8/vmlinux-440b7895.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/95d6d27d2d50/mount_0.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+f8bc4176e51e87e0928f@syzkaller.appspotmail.com
> 
> gfs2: fsid=syz:syz: Now mounting FS (format 1801)...
> gfs2: fsid=syz:syz.0: journal 0 mapped with 1 extents in 0ms
> gfs2: fsid=syz:syz.0: first mount done, others may mount
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 3611 at mm/page_alloc.c:5530 __alloc_pages+0x30a/0x560 mm/page_alloc.c:5530
> Modules linked in:
> CPU: 1 PID: 3611 Comm: syz-executor282 Not tainted 6.1.0-rc1-syzkaller-00158-g440b7895c990 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/11/2022
> RIP: 0010:__alloc_pages+0x30a/0x560 mm/page_alloc.c:5530
> Code: 5c 24 04 0f 85 f3 00 00 00 44 89 e1 81 e1 7f ff ff ff a9 00 00 04 00 41 0f 44 cc 41 89 cc e9 e3 00 00 00 c6 05 a1 ab 29 0c 01 <0f> 0b 83 fb 0a 0f 86 c8 fd ff ff 31 db 48 c7 44 24 20 0e 36 e0 45
> RSP: 0018:ffffc90003c5f4a0 EFLAGS: 00010246
> RAX: ffffc90003c5f500 RBX: 0000000000000012 RCX: 0000000000000000
> RDX: 0000000000000028 RSI: 0000000000000000 RDI: ffffc90003c5f528
> RBP: ffffc90003c5f5b8 R08: dffffc0000000000 R09: ffffc90003c5f500
> R10: fffff5200078bea5 R11: 1ffff9200078bea0 R12: 0000000000040d40
> R13: 1ffff9200078be9c R14: dffffc0000000000 R15: 1ffff9200078be98
> FS:  0000555555781300(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000005d84c8 CR3: 0000000079874000 CR4: 00000000003506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   <TASK>
>   __alloc_pages_node include/linux/gfp.h:223 [inline]
>   alloc_pages_node include/linux/gfp.h:246 [inline]
>   __kmalloc_large_node+0x8a/0x1a0 mm/slab_common.c:1098
>   __do_kmalloc_node mm/slab_common.c:943 [inline]
>   __kmalloc+0xfe/0x1a0 mm/slab_common.c:968
>   kmalloc_array include/linux/slab.h:628 [inline]
>   kcalloc include/linux/slab.h:659 [inline]
>   compute_bitstructs fs/gfs2/rgrp.c:766 [inline]
>   read_rindex_entry fs/gfs2/rgrp.c:931 [inline]

The fuzzer is writing 16777217 to an rindex entry's ri_length field so 
compute_bitstructs() is asking kmalloc for (16777217 * 40) bytes of 
memory, to which it says nope and dumps a warning.

Simpler version:
# mkfs.gfs2 -p lock_nolock -o align=0 /dev/vdc
# printf '\x01\x00\x00\x01' | dd of=/dev/vdc bs=1 seek=135676008 count=4
# mount /dev/vdc /mnt/test

I have some experimental code to add integrity checking to rindex 
entries[0] that would catch this but it would require an sb_fs_format 
bump before it can treat ri_crc == 0 usefully.

0. 
https://gitlab.com/andyprice/linux/-/commit/4e0557916733e59b2e6795775e94c9b733b51f6b

Andy

>   gfs2_ri_update+0x537/0x17f0 fs/gfs2/rgrp.c:1001
>   gfs2_rindex_update+0x313/0x3f0 fs/gfs2/rgrp.c:1051
>   init_inodes+0x242/0x340 fs/gfs2/ops_fstype.c:917
>   gfs2_fill_super+0x1bb2/0x2700 fs/gfs2/ops_fstype.c:1247
>   get_tree_bdev+0x400/0x620 fs/super.c:1323
>   gfs2_get_tree+0x50/0x210 fs/gfs2/ops_fstype.c:1330
>   vfs_get_tree+0x88/0x270 fs/super.c:1530
>   do_new_mount+0x289/0xad0 fs/namespace.c:3040
>   do_mount fs/namespace.c:3383 [inline]
>   __do_sys_mount fs/namespace.c:3591 [inline]
>   __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3568
>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>   do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7fb4bd4a797a
> Code: 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffc73f0a0b8 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fb4bd4a797a
> RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffc73f0a0d0
> RBP: 00007ffc73f0a0d0 R08: 00007ffc73f0a110 R09: 00005555557812c0
> R10: 0000000000000000 R11: 0000000000000282 R12: 0000000000000004
> R13: 00007ffc73f0a110 R14: 000000000000091b R15: 000000002000dc88
>   </TASK>
> 

