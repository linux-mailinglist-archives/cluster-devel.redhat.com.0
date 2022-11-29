Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D10BE63C950
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Nov 2022 21:31:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669753868;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=4DZsE5XiUZI87HOlyr8oUGdLutA4UCZ/RQ3zHuJElFw=;
	b=S9JZMRc5Dy3CovHurJIuQ32+hlP0qmHyTLicICxJawgXjHONnfot291odTC3fxS0PtZZBP
	jcBtG9GtpYktRt6EuSVJynFRbe3YFK+I8DbOW0V9BwdVVBbmX4y8pHc5uVzZNju47rOJUy
	FuFQVTRYzmggp04BZhA8+p5VcDd/x9o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-JXoNXk4BN1GH0ZaOjULdpA-1; Tue, 29 Nov 2022 15:31:07 -0500
X-MC-Unique: JXoNXk4BN1GH0ZaOjULdpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6AFBA101A588;
	Tue, 29 Nov 2022 20:31:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A551140E80E3;
	Tue, 29 Nov 2022 20:31:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 678611946597;
	Tue, 29 Nov 2022 20:31:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 258B4194658D for <cluster-devel@listman.corp.redhat.com>;
 Tue, 29 Nov 2022 20:31:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D92F32166B33; Tue, 29 Nov 2022 20:31:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1F292166B2D
 for <cluster-devel@redhat.com>; Tue, 29 Nov 2022 20:31:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 967F938343C2
 for <cluster-devel@redhat.com>; Tue, 29 Nov 2022 20:31:03 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-BhrPmuC0NVeqMM2gN4bGMA-1; Tue, 29 Nov 2022 15:30:59 -0500
X-MC-Unique: BhrPmuC0NVeqMM2gN4bGMA-1
Received: by mail-pf1-f169.google.com with SMTP id 21so1674354pfw.4
 for <cluster-devel@redhat.com>; Tue, 29 Nov 2022 12:30:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4DZsE5XiUZI87HOlyr8oUGdLutA4UCZ/RQ3zHuJElFw=;
 b=D3053uqXkK9uzNTjDWq2vALv2+InYLiww68eIZXOfODqhpDQSSe1fV1mNXk++Dh3PH
 xl423/IKDZTQsD/yIW+vHYDZTRisruiValZl0wF/lGpOqzsY8ShbAEc20h2eqRT8oTGa
 AuVV+MwJrj9Do4F6ZavuaiuJICDA3rph6Hcm3EMnMdGhIipgppKmmsgM3a8QeGoE0UBj
 OlUHQ25KsO/alIc1S2emyI49CU6vp8byQkyrGyuf52Mudd7oOXVKBxVe7OPtNjretQPV
 /qL9h4QzDj7Efrj8WM6EBVE5DwQmFu58hnhgbuGsp4bsdJ527S8HsjJzBpK/53/2vIeE
 rpRw==
X-Gm-Message-State: ANoB5pl49WcQ5/6yMHOQCkWiVmLwg6QZuON6ZBi22UG7tDu+ekr1rRYE
 QPsnZA2JIcKCUGyHCPCH5kSPbw==
X-Google-Smtp-Source: AA0mqf5ACAJZHic0fCNYYiNi+cbyRAZ9KueLP2d/X4YoJlWbywhZaRFAA16EnkXF9cmHBKPHsCvbNg==
X-Received: by 2002:a63:4c58:0:b0:476:b165:c83f with SMTP id
 m24-20020a634c58000000b00476b165c83fmr36383662pgl.602.1669753858421; 
 Tue, 29 Nov 2022 12:30:58 -0800 (PST)
Received: from dread.disaster.area (pa49-186-65-106.pa.vic.optusnet.com.au.
 [49.186.65.106]) by smtp.gmail.com with ESMTPSA id
 m4-20020a62a204000000b0056ba7ce4d5asm4140376pff.52.2022.11.29.12.30.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:30:58 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1p07Fm-002YtV-SB; Wed, 30 Nov 2022 07:30:54 +1100
Date: Wed, 30 Nov 2022 07:30:54 +1100
From: Dave Chinner <david@fromorbit.com>
To: syzbot <syzbot+7bb81dfa9cda07d9cd9d@syzkaller.appspotmail.com>
Message-ID: <20221129203054.GF3600936@dread.disaster.area>
References: <000000000000d1663705ee97d4d7@google.com>
MIME-Version: 1.0
In-Reply-To: <000000000000d1663705ee97d4d7@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [syzbot] WARNING in iomap_read_inline_data
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com, djwong@kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Looks like something to do with the gfs2 inline data functionality -
syzbot probably corrupted the resource index inode given the
gfs2_fill_super() context.

cc += cluster-devel@redhat.com.

-Dave.

On Tue, Nov 29, 2022 at 12:32:41AM -0800, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    6d464646530f Merge branch 'for-next/core' into for-kernelci
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=121e694b880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=54b747d981acc7b7
> dashboard link: https://syzkaller.appspot.com/bug?extid=7bb81dfa9cda07d9cd9d
> compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=105c8fed880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=170fa303880000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/d75f5f77b3a3/disk-6d464646.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/9382f86e4d95/vmlinux-6d464646.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/cf2b5f0d51dd/Image-6d464646.gz.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/eb9ce7b05830/mount_0.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+7bb81dfa9cda07d9cd9d@syzkaller.appspotmail.com
> 
> gfs2: fsid=syz:syz.0: first mount done, others may mount
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 3072 at fs/iomap/buffered-io.c:226 iomap_read_inline_data+0x274/0x440 fs/iomap/buffered-io.c:226
> Modules linked in:
> CPU: 1 PID: 3072 Comm: syz-executor694 Not tainted 6.1.0-rc6-syzkaller-32662-g6d464646530f #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/30/2022
> pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : iomap_read_inline_data+0x274/0x440 fs/iomap/buffered-io.c:226
> lr : iomap_read_inline_data+0x274/0x440 fs/iomap/buffered-io.c:226
> sp : ffff80000fb9b5a0
> x29: ffff80000fb9b5a0 x28: 0000000000000000 x27: 0000000000000000
> x26: 0000000000000000 x25: ffff80000fb9b6e0 x24: ffff80000fb9b6b8
> x23: ffffffc000000f40 x22: 00000040000000c0 x21: 0000000000001000
> x20: ffff80000fb9b6b8 x19: fffffc0003390a40 x18: fffffffffffffff5
> x17: ffff80000c0cd83c x16: 0000000000000000 x15: 0000000000000000
> x14: 0000000000000000 x13: 0000000000000002 x12: ffff80000d6227e0
> x11: ff808000086c12c4 x10: 0000000000000000 x9 : ffff8000086c12c4
> x8 : ffff0000c6f13480 x7 : ffff80000845ec00 x6 : 0000000000000000
> x5 : ffff0000c6f13480 x4 : 0000000000000000 x3 : 0000000000000002
> x2 : 0000000000000000 x1 : 00000040000000c0 x0 : 0000000000001000
> Call trace:
>  iomap_read_inline_data+0x274/0x440 fs/iomap/buffered-io.c:226
>  iomap_readpage_iter+0xdc/0x7dc fs/iomap/buffered-io.c:269
>  iomap_read_folio+0x114/0x364 fs/iomap/buffered-io.c:343
>  gfs2_read_folio+0x54/0x130 fs/gfs2/aops.c:456
>  filemap_read_folio+0xc4/0x468 mm/filemap.c:2407
>  do_read_cache_folio+0x1c8/0x588 mm/filemap.c:3534
>  do_read_cache_page mm/filemap.c:3576 [inline]
>  read_cache_page+0x40/0x174 mm/filemap.c:3585
>  gfs2_internal_read+0x90/0x304 fs/gfs2/aops.c:494
>  read_rindex_entry fs/gfs2/rgrp.c:906 [inline]
>  gfs2_ri_update+0xb4/0x7e4 fs/gfs2/rgrp.c:1001
>  gfs2_rindex_update+0x1b0/0x21c fs/gfs2/rgrp.c:1051
>  init_inodes+0x11c/0x184 fs/gfs2/ops_fstype.c:917
>  gfs2_fill_super+0x630/0x874 fs/gfs2/ops_fstype.c:1247
>  get_tree_bdev+0x1e8/0x2a0 fs/super.c:1324
>  gfs2_get_tree+0x30/0xc0 fs/gfs2/ops_fstype.c:1330
>  vfs_get_tree+0x40/0x140 fs/super.c:1531
>  do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
>  path_mount+0x358/0x890 fs/namespace.c:3370
>  do_mount fs/namespace.c:3383 [inline]
>  __do_sys_mount fs/namespace.c:3591 [inline]
>  __se_sys_mount fs/namespace.c:3568 [inline]
>  __arm64_sys_mount+0x2c4/0x3c4 fs/namespace.c:3568
>  __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
>  invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
>  el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
>  do_el0_svc+0x48/0x164 arch/arm64/kernel/syscall.c:206
>  el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:637
>  el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
>  el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
> irq event stamp: 104804
> hardirqs last  enabled at (104803): [<ffff80000c090604>] __raw_spin_unlock_irq include/linux/spinlock_api_smp.h:159 [inline]
> hardirqs last  enabled at (104803): [<ffff80000c090604>] _raw_spin_unlock_irq+0x3c/0x70 kernel/locking/spinlock.c:202
> hardirqs last disabled at (104804): [<ffff80000c07d8b4>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:405
> softirqs last  enabled at (104756): [<ffff800009270a7c>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
> softirqs last disabled at (104754): [<ffff800009270a48>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
> ---[ end trace 0000000000000000 ]---
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this issue, for details see:
> https://goo.gl/tpsmEJ#testing-patches
> 

-- 
Dave Chinner
david@fromorbit.com

