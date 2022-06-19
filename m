Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 11727550A8C
	for <lists+cluster-devel@lfdr.de>; Sun, 19 Jun 2022 14:15:21 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-uC89X9HDM8CaSMGWvqjQZw-1; Sun, 19 Jun 2022 08:15:17 -0400
X-MC-Unique: uC89X9HDM8CaSMGWvqjQZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 636A729AB44A;
	Sun, 19 Jun 2022 12:15:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4AB19D7F;
	Sun, 19 Jun 2022 12:15:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4F08B194706D;
	Sun, 19 Jun 2022 12:15:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3F8041947066 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 19 Jun 2022 12:15:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E29E92026985; Sun, 19 Jun 2022 12:15:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DED502026D2D
 for <cluster-devel@redhat.com>; Sun, 19 Jun 2022 12:15:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3E253C025C5
 for <cluster-devel@redhat.com>; Sun, 19 Jun 2022 12:15:11 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-k4ile90oMzOw-SK1DZjgLg-1; Sun, 19 Jun 2022 08:15:09 -0400
X-MC-Unique: k4ile90oMzOw-SK1DZjgLg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1o2tpa-004L4N-DB; Sun, 19 Jun 2022 12:15:06 +0000
Date: Sun, 19 Jun 2022 13:15:06 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yq8TShTaJ6xn6Koi@casper.infradead.org>
References: <20220619070559.GA27401@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220619070559.GA27401@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] gfs2 is unhappy on pagecache/for-next
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
Cc: cluster-devel@redhat.com, linux-mm@kvack.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 19, 2022 at 09:05:59AM +0200, Christoph Hellwig wrote:
> When trying to run xfstests on gfs2 (locally with the lock_nolock
> cluster managed) the first mount already hits this warning in
> inode_to_wb called from mark_buffer_dirty.  This all seems standard
> code from folio_account_dirtied, so not sure what is going there.

I don't think this is new to pagecache/for-next.
https://lore.kernel.org/linux-mm/cf8bc8dd-8e16-3590-a714-51203e6f4ba9@redhat.com/

> 
> [   30.440408] ------------[ cut here ]------------
> [   30.440409] WARNING: CPU: 1 PID: 931 at include/linux/backing-dev.h:261 __folio_mark_dirty+0x2f0/0x380
> [   30.446424] Modules linked in:
> [   30.446828] CPU: 1 PID: 931 Comm: kworker/1:2 Not tainted 5.19.0-rc2+ #1702
> [   30.447714] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/01/2014
> [   30.448770] Workqueue: gfs_recovery gfs2_recover_func
> [   30.449441] RIP: 0010:__folio_mark_dirty+0x2f0/0x380
> [   30.450113] Code: e8 b5 69 12 01 85 c0 0f 85 6a fe ff ff 48 8b 83 a8 01 00 00 be ff ff ff ff 48 8d 78 2
> [   30.452490] RSP: 0018:ffffc90001b77bd0 EFLAGS: 00010046
> [   30.453141] RAX: 0000000000000000 RBX: ffff8881004a3d00 RCX: 0000000000000001
> [   30.454067] RDX: 0000000000000000 RSI: ffffffff82f592db RDI: ffffffff830380ae
> [   30.454970] RBP: ffffea000455f680 R08: 0000000000000001 R09: ffffffff84747570
> [   30.455921] R10: 0000000000000017 R11: ffff88810260b1c0 R12: 0000000000000282
> [   30.456910] R13: ffff88810dd92170 R14: 0000000000000001 R15: 0000000000000001
> [   30.457871] FS:  0000000000000000(0000) GS:ffff88813bd00000(0000) knlGS:0000000000000000
> [   30.458912] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   30.459608] CR2: 00007efc1d5adc80 CR3: 0000000116416000 CR4: 00000000000006e0
> [   30.460564] Call Trace:
> [   30.460871]  <TASK>
> [   30.461130]  mark_buffer_dirty+0x173/0x1d0
> [   30.461687]  update_statfs_inode+0x146/0x187
> [   30.462276]  gfs2_recover_func.cold+0x48f/0x864
> [   30.462875]  ? add_lock_to_list+0x8b/0xf0
> [   30.463337]  ? __lock_acquire+0xf7e/0x1e30
> [   30.463812]  ? lock_acquire+0xd4/0x300
> [   30.464267]  ? lock_acquire+0xe4/0x300
> [   30.464715]  ? gfs2_recover_func.cold+0x217/0x864
> [   30.465334]  process_one_work+0x239/0x550
> [   30.465920]  ? process_one_work+0x550/0x550
> [   30.466485]  worker_thread+0x4d/0x3a0
> [   30.466966]  ? process_one_work+0x550/0x550
> [   30.467509]  kthread+0xe2/0x110
> [   30.467941]  ? kthread_complete_and_exit+0x20/0x20
> [   30.468558]  ret_from_fork+0x22/0x30
> [   30.469047]  </TASK>
> [   30.469346] irq event stamp: 36146
> [   30.469796] hardirqs last  enabled at (36145): [<ffffffff8139185c>] folio_memcg_lock+0x8c/0x180
> [   30.470919] hardirqs last disabled at (36146): [<ffffffff82429799>] _raw_spin_lock_irqsave+0x59/0x60
> [   30.472024] softirqs last  enabled at (33630): [<ffffffff81157307>] __irq_exit_rcu+0xd7/0x130
> [   30.473051] softirqs last disabled at (33619): [<ffffffff81157307>] __irq_exit_rcu+0xd7/0x130
> [   30.474107] ---[ end trace 0000000000000000 ]---
> [   30.475367] ------------[ cut here ]------------
> 
> 

