Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA33F62F144
	for <lists+cluster-devel@lfdr.de>; Fri, 18 Nov 2022 10:33:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668764023;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=QGBKK5CeZroH7ShS22RxT+oUno0nBpZBVtOcojZZdq8=;
	b=Rntrrrlj9L8EqpwQ5xORPApSQLQEpaelaRVafdOffpLXOrW/gWe2E626h3zhdV/Z4RayPN
	3XEFzMTta1CMfCU6HO+ZKCckjkWPAlPf3l6j1Q6j+lI0jaDsm2ox1WT0jk+URTOkg2XJZB
	MVUmik7LbOYbc0a34VJJww6F499bYFA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-JI-eqGZ5M3SvyCvSVr2Pew-1; Fri, 18 Nov 2022 04:33:40 -0500
X-MC-Unique: JI-eqGZ5M3SvyCvSVr2Pew-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D93F858F13;
	Fri, 18 Nov 2022 09:33:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B90C149BB60;
	Fri, 18 Nov 2022 09:33:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7906B19465B7;
	Fri, 18 Nov 2022 09:33:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EED231946587 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 18 Nov 2022 09:33:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D186B2166B48; Fri, 18 Nov 2022 09:33:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C91392166B29
 for <cluster-devel@redhat.com>; Fri, 18 Nov 2022 09:33:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3A8838123A1
 for <cluster-devel@redhat.com>; Fri, 18 Nov 2022 09:33:35 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-HKdeQbUVMpSUOZzVn9V5EQ-1; Fri, 18 Nov 2022 04:33:34 -0500
X-MC-Unique: HKdeQbUVMpSUOZzVn9V5EQ-1
Received: by mail-oi1-f173.google.com with SMTP id r76so4733840oie.13
 for <cluster-devel@redhat.com>; Fri, 18 Nov 2022 01:33:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QGBKK5CeZroH7ShS22RxT+oUno0nBpZBVtOcojZZdq8=;
 b=EOt0h0k+Zjl8t5q4sU9exq41MKYjrwWhcMvgrU5CYRNR8qfOSI6aZX+GTHTV58stzH
 lnqhX07sFzI1P9tXmLDCf6Osmd4SkaUwnqrvj6DzatU6uK7v9RTbX4lgt5b0eOf6Zhq1
 LlHi/gsK4q3cs4/lFhlewsIPmY2qHH1WIryWiAVMNDGZR8lqeT+Ad+Jc0Q6m8GcCgVCL
 X29VNbmFfM7VInYsNNkZyt2m8A1HsVPqLdbAsfb3uSSmIHzuWjXBFqzj9TL3Ab4yEOHL
 piynK/weA/nTHFP29ikn69430EPWW/a5MQHP/vcXj0b4A0rOYkDlQTXz86n9y2WW3ei+
 tXaA==
X-Gm-Message-State: ANoB5pks3sab1ZjIauIjJ6m3DFRpCpq2Ke5mSmMeiQC9CmmfiCg4fFyc
 l2QAdkmT2yMh4o45qgBPvmXJrlVFGybLT5bbue7ieQ==
X-Google-Smtp-Source: AA0mqf5aztd2DBbnXs+8RJGEawb49ZVGxplcwyUCPb4cQzITs7+khBvuyKHTwgGhgm4oheWUwI/SNygP2yizhCm6p6o=
X-Received: by 2002:aca:1110:0:b0:35a:7e1d:3d72 with SMTP id
 16-20020aca1110000000b0035a7e1d3d72mr5911899oir.233.1668764012778; Fri, 18
 Nov 2022 01:33:32 -0800 (PST)
MIME-Version: 1.0
References: <CAO4mrfd4=HRXMrcdZQUorNaFss3AFfrRxuXWMFT3uh+Dvfwb9g@mail.gmail.com>
 <CAO4mrfdU4oGktM8PPFg66=32N0JSGx=gtG80S89-b66tS3NLVw@mail.gmail.com>
 <CAO4mrfftfwBWbt-a1H3q559jtnv93MQ92kp=DFnA+-pRrSObcw@mail.gmail.com>
In-Reply-To: <CAO4mrfftfwBWbt-a1H3q559jtnv93MQ92kp=DFnA+-pRrSObcw@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 18 Nov 2022 10:33:21 +0100
Message-ID: <CACT4Y+Zub=+V3Yx=wSagYYeybwhbBt66COyTc=OjFAMOibybxg@mail.gmail.com>
To: Wei Chen <harperchen1110@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] BUG: unable to handle kernel NULL pointer
 dereference in gfs2_evict_inode
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
 cluster-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 syzkaller@googlegroups.com, viro@zeniv.linux.org.uk
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Nov 2022 at 09:06, Wei Chen <harperchen1110@gmail.com> wrote:
>
> Dear Linux developers,
>
> The bug persists in upstream Linux v6.0-rc5.

If you fix this, please also add the syzbot tag:

Reported-by: syzbot+8a5fc6416c175cecea34@syzkaller.appspotmail.com
https://lore.kernel.org/all/000000000000ab092305e268a016@google.com/

> R10: 0000000000000000 R11: 0000000000000206 R12: 0000000020000000
> R13: 0000000020000100 R14: 0000000020000200 R15: 0000000020047a20
>  </TASK>
> gfs2: fsid=syz:syz.0: can't read journal index: -5
> BUG: kernel NULL pointer dereference, address: 0000000000000064
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 28908067 P4D 28908067 PUD 28909067 PMD 0
> Oops: 0000 [#1] PREEMPT SMP
> CPU: 0 PID: 14812 Comm: syz-executor.1 Not tainted
> 6.1.0-rc5-63183-gd418a331631b #1
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> Ubuntu-1.8.2-1ubuntu1 04/01/2014
> RIP: 0010:evict_linked_inode fs/gfs2/super.c:1330 [inline]
> RIP: 0010:gfs2_evict_inode+0x449/0xb70 fs/gfs2/super.c:1385
> Code: 00 00 00 48 89 df e8 46 13 5a ff 48 8b bb a8 02 00 00 31 f6 e8
> d8 70 fd ff 48 8b 4c 24 20 31 f6 48 8b 81 b0 05 00 00 48 89 cf <8b> 50
> 64 e8 5f 4b 00 00 31 ff 41 89 c7 89 c6 e8 e3 86 2d ff 45 85
> RSP: 0018:ffff88802aec3a80 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff88800eb70f00 RCX: ffff888028c58000
> RDX: ffffc900092dc000 RSI: 0000000000000000 RDI: ffff888028c58000
> RBP: ffff88802aec3b38 R08: ffffffff81fb50c2 R09: 0000000000000000
> R10: 0000000000000005 R11: 0000000000000000 R12: ffff88800eb71228
> R13: ffff88800eb71078 R14: ffff888028c58000 R15: 0000000000000000
> FS:  00007fd4381ff700(0000) GS:ffff88803ec00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000064 CR3: 0000000028c0f000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000002 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  evict+0x122/0x230 fs/inode.c:664
>  iput_final fs/inode.c:1747 [inline]
>  iput fs/inode.c:1773 [inline]
>  iput+0x317/0x390 fs/inode.c:1759
>  init_journal fs/gfs2/ops_fstype.c:875 [inline]
>  init_inodes+0x433/0xd80 fs/gfs2/ops_fstype.c:889
>  gfs2_fill_super+0x9a2/0xf20 fs/gfs2/ops_fstype.c:1247
>  get_tree_bdev+0x224/0x320 fs/super.c:1324
>  gfs2_get_tree+0x27/0xd0 fs/gfs2/ops_fstype.c:1330
>  vfs_get_tree+0x2c/0x100 fs/super.c:1531
>  do_new_mount fs/namespace.c:3040 [inline]
>  path_mount+0x75c/0x1020 fs/namespace.c:3370
>  do_mount+0xa2/0xc0 fs/namespace.c:3383
>  __do_sys_mount fs/namespace.c:3591 [inline]
>  __se_sys_mount fs/namespace.c:3568 [inline]
>  __x64_sys_mount+0x13e/0x150 fs/namespace.c:3568
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x34/0xb0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x46174a
> Code: b8 a6 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 bd 86 fb ff c3 66
> 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d
> 01 f0 ff ff 0f 83 9a 86 fb ff c3 66 0f 1f 84 00 00 00 00 00
> RSP: 002b:00007fd4381fea78 EFLAGS: 00000206 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 00007fd4381feb10 RCX: 000000000046174a
> RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fd4381fead0
> RBP: 00007fd4381fead0 R08: 00007fd4381feb10 R09: 0000000020000000
> R10: 0000000000000000 R11: 0000000000000206 R12: 0000000020000000
> R13: 0000000020000100 R14: 0000000020000200 R15: 0000000020047a20
>  </TASK>
> Modules linked in:
> CR2: 0000000000000064
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:evict_linked_inode fs/gfs2/super.c:1330 [inline]
> RIP: 0010:gfs2_evict_inode+0x449/0xb70 fs/gfs2/super.c:1385
> Code: 00 00 00 48 89 df e8 46 13 5a ff 48 8b bb a8 02 00 00 31 f6 e8
> d8 70 fd ff 48 8b 4c 24 20 31 f6 48 8b 81 b0 05 00 00 48 89 cf <8b> 50
> 64 e8 5f 4b 00 00 31 ff 41 89 c7 89 c6 e8 e3 86 2d ff 45 85
> RSP: 0018:ffff88802aec3a80 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff88800eb70f00 RCX: ffff888028c58000
> RDX: ffffc900092dc000 RSI: 0000000000000000 RDI: ffff888028c58000
> RBP: ffff88802aec3b38 R08: ffffffff81fb50c2 R09: 0000000000000000
> R10: 0000000000000005 R11: 0000000000000000 R12: ffff88800eb71228
> R13: ffff88800eb71078 R14: ffff888028c58000 R15: 0000000000000000
> FS:  00007fd4381ff700(0000) GS:ffff88803ec00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000064 CR3: 0000000028c0f000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000002 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
> ----------------
> Code disassembly (best guess):
>    0: 00 00                 add    %al,(%rax)
>    2: 00 48 89             add    %cl,-0x77(%rax)
>    5: df e8                 fucomip %st(0),%st
>    7: 46 13 5a ff           rex.RX adc -0x1(%rdx),%r11d
>    b: 48 8b bb a8 02 00 00 mov    0x2a8(%rbx),%rdi
>   12: 31 f6                 xor    %esi,%esi
>   14: e8 d8 70 fd ff       callq  0xfffd70f1
>   19: 48 8b 4c 24 20       mov    0x20(%rsp),%rcx
>   1e: 31 f6                 xor    %esi,%esi
>   20: 48 8b 81 b0 05 00 00 mov    0x5b0(%rcx),%rax
>   27: 48 89 cf             mov    %rcx,%rdi
> * 2a: 8b 50 64             mov    0x64(%rax),%edx <-- trapping instruction
>   2d: e8 5f 4b 00 00       callq  0x4b91
>   32: 31 ff                 xor    %edi,%edi
>   34: 41 89 c7             mov    %eax,%r15d
>   37: 89 c6                 mov    %eax,%esi
>   39: e8 e3 86 2d ff       callq  0xff2d8721
>   3e: 45                   rex.RB
>   3f: 85                   .byte 0x85
>
> Best,
> Wei
>
> On Mon, 31 Oct 2022 at 21:25, Wei Chen <harperchen1110@gmail.com> wrote:
> >
> > Dear Linux developers,
> >
> > Here is the link to the reproducers.
> >
> > C reproducer: https://drive.google.com/file/d/1P9GsW2pvEN_tvn89RYsrgnv2uDz3_6iq/view?usp=share_link
> > Syz reproducer:
> > https://drive.google.com/file/d/1Be-QEZ-hfj_CXhXlSEvzbf3E89HmkVMH/view?usp=share_link
> >
> > The bug persists in the latest commit, v5.15.76 (4f5365f77018). I hope
> > it is helpful to you.
> >
> > [   83.919419][ T6891]   function = gfs2_dirent_scan, file =
> > fs/gfs2/dir.c, line = 602
> > [   83.923713][ T6891] gfs2: fsid=syz:syz.0: about to withdraw this file system
> > [   83.929444][ T6891] gfs2: fsid=syz:syz.0: File system withdrawn
> > [   83.931468][ T6891] CPU: 1 PID: 6891 Comm: a.out Not tainted 5.15.76 #5
> > [   83.933492][ T6891] Hardware name: QEMU Standard PC (i440FX + PIIX,
> > 1996), BIOS rel-1.13.0-48-gd9c812dda519-prebuilt.qemu.org 04/01/2014
> > [   83.936328][ T6891] Call Trace:
> > [   83.937107][ T6891]  <TASK>
> > [   83.937780][ T6891]  dump_stack_lvl+0x8d/0xcf
> > [   83.938843][ T6891]  gfs2_withdraw+0x212/0x730
> > [   83.939908][ T6891]  ? gfs2_dirent_scan+0x158/0x1a0
> > [   83.941070][ T6891]  gfs2_dirent_scan+0x158/0x1a0
> > [   83.942185][ T6891]  ? do_filldir_main.isra.21+0x1e0/0x1e0
> > [   83.943476][ T6891]  ? do_filldir_main.isra.21+0x1e0/0x1e0
> > [   83.944765][ T6891]  gfs2_dirent_search+0x156/0x2b0
> > [   83.945928][ T6891]  gfs2_dir_search+0x4a/0x120
> > [   83.947005][ T6891]  gfs2_lookupi+0x1ec/0x2c0
> > [   83.948042][ T6891]  ? gfs2_lookupi+0x12d/0x2c0
> > [   83.949127][ T6891]  ? gfs2_lookup_simple+0x57/0x90
> > [   83.950403][ T6891]  gfs2_lookup_simple+0x57/0x90
> > [   83.951522][ T6891]  init_inodes+0x6c/0xfd0
> > [   83.952527][ T6891]  ? snprintf+0x66/0x90
> > [   83.953544][ T6891]  ? gfs2_fill_super+0xa4d/0x1080
> > [   83.954695][ T6891]  gfs2_fill_super+0xa4d/0x1080
> > [   83.955809][ T6891]  ? gfs2_glock_nq_num+0x8f/0xe0
> > [   83.956946][ T6891]  ? snprintf+0x66/0x90
> > [   83.957905][ T6891]  ? set_blocksize+0x100/0x130
> > [   83.959011][ T6891]  ? gfs2_reconfigure+0x4c0/0x4c0
> > [   83.960164][ T6891]  ? get_tree_bdev+0x1c9/0x310
> > [   83.961270][ T6891]  get_tree_bdev+0x1c9/0x310
> > [   83.962579][ T6891]  gfs2_get_tree+0x24/0xc0
> > [   83.963992][ T6891]  vfs_get_tree+0x28/0x100
> > [   83.965423][ T6891]  path_mount+0x926/0xce0
> > [   83.966878][ T6891]  ? putname+0x83/0xa0
> > [   83.968251][ T6891]  do_mount+0x92/0xb0
> > [   83.969599][ T6891]  __x64_sys_mount+0xb0/0x120
> > [   83.971115][ T6891]  do_syscall_64+0x34/0xb0
> > [   83.972527][ T6891]  entry_SYSCALL_64_after_hwframe+0x61/0xcb
> > [   83.974433][ T6891] RIP: 0033:0x7f4669d7f48a
> > [   83.975836][ T6891] Code: 48 8b 0d 11 fa 2a 00 f7 d8 64 89 01 48 83
> > c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5
> > 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d de f9 2a 00 f7 d8
> > 64 89 01 48
> > [   83.982060][ T6891] RSP: 002b:00007f466a46bd38 EFLAGS: 00000282
> > ORIG_RAX: 00000000000000a5
> > [   83.984695][ T6891] RAX: ffffffffffffffda RBX: 0000000000000000
> > RCX: 00007f4669d7f48a
> > [   83.986856][ T6891] RDX: 0000000020000000 RSI: 0000000020000100
> > RDI: 00007f466a46be70
> > [   83.988696][ T6891] RBP: 00007f466a46bef0 R08: 00007f466a46bd70
> > R09: 0000000000000000
> > [   83.990534][ T6891] R10: 0000000000000000 R11: 0000000000000282
> > R12: 00007ffd64dee9fe
> > [   83.992369][ T6891] R13: 00007ffd64dee9ff R14: 00007f466a44c000
> > R15: 0000000000000003
> > [   83.994218][ T6891]  </TASK>
> > [   83.997025][ T6891] gfs2: fsid=syz:syz.0: can't lookup journal index: 0
> > [   83.998884][ T6891] BUG: kernel NULL pointer dereference, address:
> > 000000000000008c
> > [   84.000696][ T6891] #PF: supervisor read access in kernel mode
> > [   84.002075][ T6891] #PF: error_code(0x0000) - not-present page
> > [   84.003452][ T6891] PGD 109056067 P4D 109056067 PUD 109057067 PMD 0
> > [   84.004955][ T6891] Oops: 0000 [#1] PREEMPT SMP
> > [   84.006026][ T6891] CPU: 1 PID: 6891 Comm: a.out Not tainted 5.15.76 #5
> > [   84.007585][ T6891] Hardware name: QEMU Standard PC (i440FX + PIIX,
> > 1996), BIOS rel-1.13.0-48-gd9c812dda519-prebuilt.qemu.org 04/01/2014
> > [   84.010444][ T6891] RIP: 0010:gfs2_evict_inode+0x39f/0x910
> > [   84.011742][ T6891] Code: 02 37 ff be 01 00 00 00 48 89 df e8 ab 38
> > 60 ff 48 8b bb b8 04 00 00 31 f6 e8 7d 95 fd ff 49 8b 87 00 09 00 00
> > 31 f6 4c 89 ff <8b> 90 8c 00 00 00 e8 56 43 00 00 85 c0 89 85 60 ff ff
> > ff 75 25 e8
> > [   84.016251][ T6891] RSP: 0018:ffffc900025d3b00 EFLAGS: 00010246
> > [   84.017655][ T6891] RAX: 0000000000000000 RBX: ffff88810cb10650
> > RCX: 0000000000000000
> > [   84.019490][ T6891] RDX: ffff88810ab15340 RSI: 0000000000000000
> > RDI: ffff88810c1bc000
> > [   84.021329][ T6891] RBP: ffffc900025d3bb0 R08: 0000000000000001
> > R09: 0000000000000000
> > [   84.023160][ T6891] R10: ffffc900025d38f8 R11: 0000000000000001
> > R12: ffff88810cb10b88
> > [   84.024992][ T6891] R13: ffff88810cb10878 R14: ffff88810c1bc000
> > R15: ffff88810c1bc000
> > [   84.026825][ T6891] FS:  00007f466a46c700(0000)
> > GS:ffff88813dc00000(0000) knlGS:0000000000000000
> > [   84.028869][ T6891] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   84.030382][ T6891] CR2: 000000000000008c CR3: 000000010c054000
> > CR4: 00000000003506e0
> > [   84.032206][ T6891] DR0: 0000000000000000 DR1: 0000000000000000
> > DR2: 0000000000000000
> > [   84.034034][ T6891] DR3: 0000000000000000 DR6: 00000000fffe0ff0
> > DR7: 0000000000000400
> > [   84.035859][ T6891] Call Trace:
> > [   84.036615][ T6891]  <TASK>
> > [   84.037294][ T6891]  ? find_held_lock+0x2d/0x90
> > [   84.038375][ T6891]  ? gfs2_evict_inode+0x2c7/0x910
> > [   84.039537][ T6891]  ? evict_unlinked_inode+0x380/0x380
> > [   84.040773][ T6891]  ? evict+0xfd/0x1e0
> > [   84.041694][ T6891]  evict+0xfd/0x1e0
> > [   84.042571][ T6891]  ? gfs2_glock_put_eventually+0x40/0x40
> > [   84.043866][ T6891]  iput.part.20+0x217/0x3a0
> > [   84.044949][ T6891]  iput+0x29/0x40
> > [   84.045790][ T6891]  dentry_unlink_inode+0x163/0x170
> > [   84.046971][ T6891]  __dentry_kill+0x137/0x220
> > [   84.048032][ T6891]  ? dput+0x32/0x650
> > [   84.048936][ T6891]  dput+0x42b/0x650
> > [   84.049814][ T6891]  gfs2_fill_super+0xa94/0x1080
> > [   84.050932][ T6891]  ? gfs2_glock_nq_num+0x8f/0xe0
> > [   84.052068][ T6891]  ? snprintf+0x66/0x90
> > [   84.053036][ T6891]  ? set_blocksize+0x100/0x130
> > [   84.054137][ T6891]  ? gfs2_reconfigure+0x4c0/0x4c0
> > [   84.055292][ T6891]  ? get_tree_bdev+0x1c9/0x310
> > [   84.056391][ T6891]  get_tree_bdev+0x1c9/0x310
> > [   84.057457][ T6891]  gfs2_get_tree+0x24/0xc0
> > [   84.058474][ T6891]  vfs_get_tree+0x28/0x100
> > [   84.059489][ T6891]  path_mount+0x926/0xce0
> > [   84.060486][ T6891]  ? putname+0x83/0xa0
> > [   84.061432][ T6891]  do_mount+0x92/0xb0
> > [   84.062353][ T6891]  __x64_sys_mount+0xb0/0x120
> > [   84.063437][ T6891]  do_syscall_64+0x34/0xb0
> > [   84.064455][ T6891]  entry_SYSCALL_64_after_hwframe+0x61/0xcb
> > [   84.065811][ T6891] RIP: 0033:0x7f4669d7f48a
> > [   84.066822][ T6891] Code: 48 8b 0d 11 fa 2a 00 f7 d8 64 89 01 48 83
> > c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5
> > 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d de f9 2a 00 f7 d8
> > 64 89 01 48
> > [   84.071310][ T6891] RSP: 002b:00007f466a46bd38 EFLAGS: 00000282
> > ORIG_RAX: 00000000000000a5
> > [   84.073242][ T6891] RAX: ffffffffffffffda RBX: 0000000000000000
> > RCX: 00007f4669d7f48a
> > [   84.075069][ T6891] RDX: 0000000020000000 RSI: 0000000020000100
> > RDI: 00007f466a46be70
> > [   84.076892][ T6891] RBP: 00007f466a46bef0 R08: 00007f466a46bd70
> > R09: 0000000000000000
> > [   84.078724][ T6891] R10: 0000000000000000 R11: 0000000000000282
> > R12: 00007ffd64dee9fe
> > [   84.080598][ T6891] R13: 00007ffd64dee9ff R14: 00007f466a44c000
> > R15: 0000000000000003
> > [   84.082437][ T6891]  </TASK>
> > [   84.083141][ T6891] Modules linked in:
> > [   84.084084][ T6891] CR2: 000000000000008c
> > [   84.085089][ T6891] ---[ end trace 7249ef596cc64205 ]---
> > [   84.086343][ T6891] RIP: 0010:gfs2_evict_inode+0x39f/0x910
> > [   84.087642][ T6891] Code: 02 37 ff be 01 00 00 00 48 89 df e8 ab 38
> > 60 ff 48 8b bb b8 04 00 00 31 f6 e8 7d 95 fd ff 49 8b 87 00 09 00 00
> > 31 f6 4c 89 ff <8b> 90 8c 00 00 00 e8 56 43 00 00 85 c0 89 85 60 ff ff
> > ff 75 25 e8
> > [   84.092183][ T6891] RSP: 0018:ffffc900025d3b00 EFLAGS: 00010246
> > [   84.093581][ T6891] RAX: 0000000000000000 RBX: ffff88810cb10650
> > RCX: 0000000000000000
> > [   84.095407][ T6891] RDX: ffff88810ab15340 RSI: 0000000000000000
> > RDI: ffff88810c1bc000
> > [   84.097245][ T6891] RBP: ffffc900025d3bb0 R08: 0000000000000001
> > R09: 0000000000000000
> > [   84.099079][ T6891] R10: ffffc900025d38f8 R11: 0000000000000001
> > R12: ffff88810cb10b88
> > [   84.100917][ T6891] R13: ffff88810cb10878 R14: ffff88810c1bc000
> > R15: ffff88810c1bc000
> > [   84.102756][ T6891] FS:  00007f466a46c700(0000)
> > GS:ffff88813dc00000(0000) knlGS:0000000000000000
> > [   84.104808][ T6891] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   84.106320][ T6891] CR2: 000000000000008c CR3: 000000010c054000
> > CR4: 00000000003506e0
> > [   84.108160][ T6891] DR0: 0000000000000000 DR1: 0000000000000000
> > DR2: 0000000000000000
> > [   84.109992][ T6891] DR3: 0000000000000000 DR6: 00000000fffe0ff0
> > DR7: 0000000000000400
> > [   84.111822][ T6891] Kernel panic - not syncing: Fatal exception
> > [   84.113908][ T6891] Kernel Offset: disabled
> > [   84.114912][ T6891] Rebooting in 86400 seconds..
> >
> > Best,
> > Wei
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/CAO4mrfftfwBWbt-a1H3q559jtnv93MQ92kp%3DDFnA%2B-pRrSObcw%40mail.gmail.com.

