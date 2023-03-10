Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AEF6B3715
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 08:07:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678432067;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=zt7XM7Q2E6nSsgXSaNZ7sw95AuhMvRlgS0V/dEu9zEk=;
	b=Im5HAm0cJ4FKZQur37lL9UbpoW58S7opeOrZQa1zPNrNqDfFCGl0ByIvki4GoNLzwBBq/y
	8JAbbj0oscFaoZC1xRMIFq0B+67fFCHVegAL9O6mpR+z5YH0XV0h6rqKGaMQ3IU2fXgh1D
	v8ALx36/NABMNt/Fcy3bhmppHQjkxF4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-BDgmqmPGMkKThguXOcZ_wA-1; Fri, 10 Mar 2023 02:07:43 -0500
X-MC-Unique: BDgmqmPGMkKThguXOcZ_wA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2498884340;
	Fri, 10 Mar 2023 07:07:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 923B2C15BAD;
	Fri, 10 Mar 2023 07:07:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4F8751946A49;
	Fri, 10 Mar 2023 07:07:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8B5BC1946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 07:07:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D4AC0140EBF6; Fri, 10 Mar 2023 07:07:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CCD45140EBF4
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 07:07:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC1AF3823A12
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 07:07:33 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-ge_KSyUqOy-BEvTzLcGi1w-1; Fri, 10 Mar 2023 02:07:31 -0500
X-MC-Unique: ge_KSyUqOy-BEvTzLcGi1w-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id DE68868BEB; Fri, 10 Mar 2023 08:00:24 +0100 (CET)
Date: Fri, 10 Mar 2023 08:00:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Naoya Horiguchi <naoya.horiguchi@linux.dev>
Message-ID: <20230310070023.GA13563@lst.de>
References: <20230121065755.1140136-1-hch@lst.de>
 <20230121065755.1140136-8-hch@lst.de> <20230310043137.GA1624890@u2004>
MIME-Version: 1.0
In-Reply-To: <20230310043137.GA1624890@u2004>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 7/7] mm: return an ERR_PTR from
 __filemap_get_folio
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 naoya.horiguchi@nec.com, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 10, 2023 at 01:31:37PM +0900, Naoya Horiguchi wrote:
> On Sat, Jan 21, 2023 at 07:57:55AM +0100, Christoph Hellwig wrote:
> > Instead of returning NULL for all errors, distinguish between:
> > 
> >  - no entry found and not asked to allocated (-ENOENT)
> >  - failed to allocate memory (-ENOMEM)
> >  - would block (-EAGAIN)
> > 
> > so that callers don't have to guess the error based on the passed
> > in flags.
> > 
> > Also pass through the error through the direct callers:
> > filemap_get_folio, filemap_lock_folio filemap_grab_folio
> > and filemap_get_incore_folio.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Hello,
> 
> I found a NULL pointer dereference issue related to this patch,
> so let me share it.
> 
> Here is the bug message (I used akpm/mm-unstable on Mar 9):
> 
> [ 2871.648659] BUG: kernel NULL pointer dereference, address: 0000000000000000
> [ 2871.651286] #PF: supervisor read access in kernel mode
> [ 2871.653231] #PF: error_code(0x0000) - not-present page
> [ 2871.655170] PGD 80000001517dd067 P4D 80000001517dd067 PUD 1491d1067 PMD 0
> [ 2871.657739] Oops: 0000 [#1] PREEMPT SMP PTI
> [ 2871.659329] CPU: 4 PID: 1599 Comm: page-types Tainted: G            E    N 6.3.0-rc1-v6.3-rc1-230309-1629-189-ga71a7+ #36
> [ 2871.663362] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.1-2.fc37 04/01/2014
> [ 2871.666507] RIP: 0010:mincore_page+0x19/0x90
> [ 2871.668086] Code: cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 00 41 54 55 53 e8 92 2b 03 00 48 3d 00 f0 ff ff 77 54 48 89 c3 <48> 8b 00 48 c1 e8 02 89 c5 83 e5 01 75 21 8b 43 34 85 c0 74 47 f0
> [ 2871.678313] RSP: 0018:ffffbe57c203fd00 EFLAGS: 00010207
> [ 2871.681422] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
> [ 2871.685609] RDX: 0000000000000000 RSI: ffff9f59ca1506d8 RDI: ffff9f59ce7c2880
> [ 2871.689599] RBP: 0000000000000000 R08: 00007f9f14200000 R09: ffff9f59c9078508
> [ 2871.693295] R10: 00007f9ed4400000 R11: 0000000000000000 R12: 0000000000000200
> [ 2871.695969] R13: 0000000000000001 R14: ffff9f59c9ef4450 R15: ffff9f59c4ac9000
> [ 2871.699927] FS:  00007f9ed47ee740(0000) GS:ffff9f5abbc00000(0000) knlGS:0000000000000000
> [ 2871.703969] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2871.706689] CR2: 0000000000000000 CR3: 0000000149ffe006 CR4: 0000000000170ee0
> [ 2871.709923] DR0: ffffffff91531760 DR1: ffffffff91531761 DR2: ffffffff91531762
> [ 2871.713424] DR3: ffffffff91531763 DR6: 00000000ffff0ff0 DR7: 0000000000000600
> [ 2871.716758] Call Trace:
> [ 2871.717998]  <TASK>
> [ 2871.719008]  __mincore_unmapped_range+0x6e/0xd0
> [ 2871.721220]  mincore_unmapped_range+0x16/0x30
> [ 2871.723288]  walk_pgd_range+0x485/0x9e0
> [ 2871.725128]  __walk_page_range+0x195/0x1b0
> [ 2871.727224]  walk_page_range+0x151/0x180
> [ 2871.728883]  __do_sys_mincore+0xec/0x2b0
> [ 2871.730707]  do_syscall_64+0x3a/0x90
> [ 2871.732179]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [ 2871.734148] RIP: 0033:0x7f9ed443f4ab
> [ 2871.735548] Code: 73 01 c3 48 8b 0d 75 99 1b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa b8 1b 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 45 99 1b 00 f7 d8 64 89 01 48
> [ 2871.742194] RSP: 002b:00007ffe924d72b8 EFLAGS: 00000206 ORIG_RAX: 000000000000001b
> [ 2871.744787] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f9ed443f4ab
> [ 2871.747186] RDX: 00007ffe92557300 RSI: 0000000000200000 RDI: 00007f9ed4200000
> [ 2871.749404] RBP: 00007ffe92567330 R08: 0000000000000005 R09: 0000000000000000
> [ 2871.751683] R10: 00007f9ed4405d68 R11: 0000000000000206 R12: 00007ffe925674b8
> [ 2871.753925] R13: 0000000000404af1 R14: 000000000040ad78 R15: 00007f9ed4833000
> [ 2871.756493]  </TASK>
> 
> The precedure to reproduce this is (1) punch hole some page in a shmem
> file, then (2) call mincore() over the punch-holed address range. 
> 
> I confirmed that filemap_get_incore_folio() (actually filemap_get_entry()
> inside it) returns NULL in that case, so we unexpectedly enter the following
> if-block for the "not found" case.

Yes.  Please try this fix:

diff --git a/mm/swap_state.c b/mm/swap_state.c
index c7160070b9daa9..b76a65ac28b319 100644
--- a/mm/swap_state.c
+++ b/mm/swap_state.c
@@ -390,6 +390,8 @@ struct folio *filemap_get_incore_folio(struct address_space *mapping,
 	struct swap_info_struct *si;
 	struct folio *folio = filemap_get_entry(mapping, index);
 
+	if (!folio)
+		return ERR_PTR(-ENOENT);
 	if (!xa_is_value(folio))
 		return folio;
 	if (!shmem_mapping(mapping))

