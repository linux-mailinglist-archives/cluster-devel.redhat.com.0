Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4F919161FF9
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 05:56:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582001814;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o2sZCB5XvAxWBiw2EDbgZYDhF9HQhNU8bgIuVXi9OXU=;
	b=YYlR7CD0GnNusSAGOEWUjc0qs2Euh2aSj2Cq94S4xBXLRhrUlWKRx8vGC81WBflsY4wq7U
	cxQ/cqxUZ+L3GBF3DO4kazb91lGdVNrVf8xOnzgQeqLz4JBnPd9fz8x2ddERSNwyzadeo5
	9KJ8NX5CgWoTfUw7uN6MyBzyPEdKn4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-EJ1kfGXpN1ilNhv8N0UXmQ-1; Mon, 17 Feb 2020 23:56:49 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6F34801E67;
	Tue, 18 Feb 2020 04:56:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F37219481;
	Tue, 18 Feb 2020 04:56:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DF1D18089C8;
	Tue, 18 Feb 2020 04:56:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01I4ug9J025098 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 23:56:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D6AC52028CD3; Tue, 18 Feb 2020 04:56:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D18CB2026D67
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 04:56:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A934802084
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 04:56:40 +0000 (UTC)
Received: from mail105.syd.optusnet.com.au (mail105.syd.optusnet.com.au
	[211.29.132.249]) by relay.mimecast.com with ESMTP id
	us-mta-183-Y3tCVN1GOiWYbVF2Kg6kKA-1; Mon, 17 Feb 2020 23:56:37 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail105.syd.optusnet.com.au (Postfix) with ESMTPS id A528E3A263E;
	Tue, 18 Feb 2020 15:56:35 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j3uvy-0005p2-0S; Tue, 18 Feb 2020 15:56:34 +1100
Date: Tue, 18 Feb 2020 15:56:33 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218045633.GH10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=X6os11be c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=IkcTkHD0fZMA:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=i0EeH86SAAAA:8 a=7-415B0cAAAA:8
	a=XVPaj5jkfHni625HrT0A:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
	a=AjGcO6oz07-iQ99wixmX:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: Y3tCVN1GOiWYbVF2Kg6kKA-1
X-MC-Unique: EJ1kfGXpN1ilNhv8N0UXmQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01I4ug9J025098
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 00/19] Change readahead API
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 17, 2020 at 10:45:41AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> This series adds a readahead address_space operation to eventually
> replace the readpages operation.  The key difference is that
> pages are added to the page cache as they are allocated (and
> then looked up by the filesystem) instead of passing them on a
> list to the readpages operation and having the filesystem add
> them to the page cache.  It's a net reduction in code for each
> implementation, more efficient than walking a list, and solves
> the direct-write vs buffered-read problem reported by yu kuai at
> https://lore.kernel.org/linux-fsdevel/20200116063601.39201-1-yukuai3@huaw=
ei.com/
>=20
> The only unconverted filesystems are those which use fscache.
> Their conversion is pending Dave Howells' rewrite which will make the
> conversion substantially easier.

Latest version in your git tree:

$ =E2=96=B6 glo -n 5 willy/readahead
4be497096c04 mm: Use memalloc_nofs_save in readahead path
ff63497fcb98 iomap: Convert from readpages to readahead
26aee60e89b5 iomap: Restructure iomap_readpages_actor
8115bcca7312 fuse: Convert from readpages to readahead
3db3d10d9ea1 f2fs: Convert from readpages to readahead
$

merged into a 5.6-rc2 tree fails at boot on my test vm:

[    2.423116] ------------[ cut here ]------------
[    2.424957] list_add double add: new=3Dffffea000efff4c8, prev=3Dffff8883=
bfffee60, next=3Dffffea000efff4c8.
[    2.428259] WARNING: CPU: 4 PID: 1 at lib/list_debug.c:29 __list_add_val=
id+0x67/0x70
[    2.430617] CPU: 4 PID: 1 Comm: sh Not tainted 5.6.0-rc2-dgc+ #1800
[    2.432405] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
1.12.0-1 04/01/2014
[    2.434744] RIP: 0010:__list_add_valid+0x67/0x70
[    2.436107] Code: c6 4c 89 ca 48 c7 c7 10 41 58 82 e8 55 29 89 ff 0f 0b =
31 c0 c3 48 89 f2 4c 89 c1 48 89 fe 48 c7 c7 60 41 58 82 e8 3b 29 89 ff <0f=
> 0b 31 c7
[    2.441161] RSP: 0000:ffffc900018a3bb0 EFLAGS: 00010082
[    2.442548] RAX: 0000000000000000 RBX: ffffea000efff4c0 RCX: 00000000000=
00256
[    2.444432] RDX: 0000000000000001 RSI: 0000000000000086 RDI: ffffffff828=
8a8b0
[    2.446315] RBP: ffffea000efff4c8 R08: ffffc900018a3a65 R09: 00000000000=
00256
[    2.448199] R10: 0000000000000008 R11: ffffc900018a3a65 R12: ffffea000ef=
ff4c8
[    2.450072] R13: ffff8883bfffee60 R14: 0000000000000010 R15: 00000000000=
00001
[    2.451959] FS:  0000000000000000(0000) GS:ffff8883b9c00000(0000) knlGS:=
0000000000000000
[    2.454083] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    2.455604] CR2: 00000000ffffffff CR3: 00000003b9a37002 CR4: 00000000000=
60ee0
[    2.457484] Call Trace:
[    2.458171]  __pagevec_lru_add_fn+0x15f/0x2c0
[    2.459376]  pagevec_lru_move_fn+0x87/0xd0
[    2.460500]  ? pagevec_move_tail_fn+0x2d0/0x2d0
[    2.461712]  lru_add_drain_cpu+0x8d/0x160
[    2.462787]  lru_add_drain+0x18/0x20
[    2.463757]  shift_arg_pages+0xb8/0x180
[    2.464789]  ? vprintk_emit+0x101/0x1c0
[    2.465813]  ? printk+0x58/0x6f
[    2.466659]  setup_arg_pages+0x205/0x240
[    2.467716]  load_elf_binary+0x34a/0x1560
[    2.468789]  ? get_user_pages_remote+0x159/0x280
[    2.470024]  ? selinux_inode_permission+0x10d/0x1e0
[    2.471323]  ? _raw_read_unlock+0xa/0x20
[    2.472375]  ? load_misc_binary+0x2b2/0x410
[    2.473492]  search_binary_handler+0x60/0xe0
[    2.474634]  __do_execve_file.isra.0+0x512/0x850
[    2.475888]  ? rest_init+0xc6/0xc6
[    2.476801]  do_execve+0x21/0x30
[    2.477671]  try_to_run_init_process+0x10/0x34
[    2.478855]  kernel_init+0xe2/0xfa
[    2.479776]  ret_from_fork+0x1f/0x30
[    2.480737] ---[ end trace e77079de9b22dc6a ]---

I just dropped the ext4 conversion from my local tree so I can boot
the machine and test XFS. Might have some more info when that
crashes and burns...

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


