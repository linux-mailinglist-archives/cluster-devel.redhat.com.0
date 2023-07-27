Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30B76434D
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 03:16:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690420610;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=L/bR0Z4HEoIH+TzQDYVYGBt7h8oQojsp2gmutOuIbRc=;
	b=Jl6Z1RYquVuYYMrXBT958A3GFTQS3WysRoMo0tdw0hF6LkZ9qH2AhhgC+IeqU8oXEhMlB8
	9ZGcwWuUie/TOPVzCzioH0bok679Sr65JCCgSAKXDv5KiRlEv3oUc4nSqkn8BzZSp0RfUT
	1FQ8WyuOt4+4u39TYhfb+ItpFERTmsg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-mtt6waRKPSekaJBOHJsjug-1; Wed, 26 Jul 2023 21:16:47 -0400
X-MC-Unique: mtt6waRKPSekaJBOHJsjug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFA95104D520;
	Thu, 27 Jul 2023 01:16:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5C7CE200B41D;
	Thu, 27 Jul 2023 01:16:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 13B641946A72;
	Thu, 27 Jul 2023 01:16:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E0E3D1946A6C for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 01:13:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AF93140C206F; Thu, 27 Jul 2023 01:13:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A85C840C2063
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 01:13:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E17D101A54E
 for <cluster-devel@redhat.com>; Thu, 27 Jul 2023 01:13:13 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-9kcZmQa5PdyMIyl9VrYcgQ-3; Wed, 26 Jul 2023 21:13:12 -0400
X-MC-Unique: 9kcZmQa5PdyMIyl9VrYcgQ-3
Received: from cwcc.thunk.org (pool-173-48-115-64.bstnma.fios.verizon.net
 [173.48.115.64]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 36R19kRN030218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 21:09:47 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 92CFF15C04DF; Wed, 26 Jul 2023 21:09:46 -0400 (EDT)
Date: Wed, 26 Jul 2023 21:09:46 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20230727010946.GD30264@mit.edu>
References: <0000000000002b5e2405f14e860f@google.com>
 <0000000000009655cc060165265f@google.com>
 <CANp29Y7UVO8QGJUC-WB=CT_MKJVUzpJ2pH+e6WAcwqX_4FPgpA@mail.gmail.com>
 <CAA8EJpq2Az=8gLyFY7j3D8-P=PUAo6ydmzvvpkcfNQnA0OCEoA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA8EJpq2Az=8gLyFY7j3D8-P=PUAo6ydmzvvpkcfNQnA0OCEoA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] KASAN: use-after-free Read in
 qd_unlock (2)
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
Cc: syzbot <syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com>,
 konrad.dybcio@linaro.org, andersson@kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, Aleksandr Nogikh <nogikh@google.com>,
 linux-fsdevel@vger.kernel.org, eadavis@sina.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: mit.edu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 26, 2023 at 06:45:55PM +0300, Dmitry Baryshkov wrote:
> > > bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17b48111a80000
  ...
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=3f6a670108ce43356017

> I highly suspect that the bisect was wrong here. The only thing that
> was changed by the mentioned commit is the device tree for the pretty
> obscure platform, which is not 'Google Compute Engine'.

Yeah, it's not even close.  If you take a look at the bisection log
(which is *always* a good idea before you put any faith in the syzbot
bisection), you'd see the following:

testing commit e1c04510f521e853019afeca2a5991a5ef8d6a5b gcc
compiler: gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
kernel signature: f262f513a4ba5708b69a5fdd8c218746223996a8b2134a22f2916d16f23d01e8
run #0: crashed: unregister_netdevice: waiting for DEV to become free
run #1: crashed: unregister_netdevice: waiting for DEV to become free
run #2: crashed: unregister_netdevice: waiting for DEV to become free
run #3: crashed: unregister_netdevice: waiting for DEV to become free
run #4: crashed: unregister_netdevice: waiting for DEV to become free
run #5: crashed: unregister_netdevice: waiting for DEV to become free
run #6: crashed: unregister_netdevice: waiting for DEV to become free
run #7: crashed: unregister_netdevice: waiting for DEV to become free
run #8: crashed: unregister_netdevice: waiting for DEV to become free

This is *nothing* like the problem reported on the dashboard, which is:

BUG: KASAN: use-after-free in instrument_atomic_read include/linux/instrumented.h:72 [inline]
BUG: KASAN: use-after-free in _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
BUG: KASAN: use-after-free in qd_unlock+0x30/0x2d0 fs/gfs2/quota.c:490
Read of size 8 at addr ffff888073997090 by task syz-executor221/5069

where the dereference had a stack trace which looked like this:

 _test_bit include/asm-generic/bitops/instrumented-non-atomic.h:141 [inline]
 qd_unlock+0x30/0x2d0 fs/gfs2/quota.c:490
 gfs2_quota_sync+0x768/0x8b0 fs/gfs2/quota.c:1325
 gfs2_sync_fs+0x49/0xb0 fs/gfs2/super.c:650
 sync_filesystem+0xe8/0x220 fs/sync.c:56
 generic_shutdown_super+0x6b/0x310 fs/super.c:474
 kill_block_super+0x79/0xd0 fs/super.c:1386
 deactivate_locked_super+0xa7/0xf0 fs/super.c:332
 cleanup_mnt+0x494/0x520 fs/namespace.c:1291
 task_work_run+0x243/0x300 kernel/task_work.c:179
 exit_task_work include/linux/task_work.h:38 [inline]
 do_exit+0x644/0x2150 kernel/exit.c:867

and the memory was allocated via this stack trace:

 kmem_cache_alloc+0x1b3/0x350 mm/slub.c:3476
 kmem_cache_zalloc include/linux/slab.h:710 [inline]
 qd_alloc+0x51/0x250 fs/gfs2/quota.c:216
 gfs2_quota_init+0x7c4/0x10e0 fs/gfs2/quota.c:1415
 gfs2_make_fs_rw+0x48e/0x590 fs/gfs2/super.c:153
 gfs2_fill_super+0x2357/0x2700 fs/gfs2/ops_fstype.c:1274
 get_tree_bdev+0x400/0x620 fs/super.c:1282
 gfs2_get_tree+0x50/0x210 fs/gfs2/ops_fstype.c:1330
 vfs_get_tree+0x88/0x270 fs/super.c:1489
 do_new_mount+0x289/0xad0 fs/namespace.c:3145
 do_mount fs/namespace.c:3488 [inline]
 __do_sys_mount fs/namespace.c:3697 [inline]
 __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3674
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80

(And the memory was freed from an RCU path)

					- Ted

