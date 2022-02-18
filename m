Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 448A54BB08A
	for <lists+cluster-devel@lfdr.de>; Fri, 18 Feb 2022 05:09:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-FuoTB1Z3OueRodSrfPfKEQ-1; Thu, 17 Feb 2022 23:09:15 -0500
X-MC-Unique: FuoTB1Z3OueRodSrfPfKEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 143A01006AA0;
	Fri, 18 Feb 2022 04:09:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39ECB4D70F;
	Fri, 18 Feb 2022 04:09:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A18A84BB7C;
	Fri, 18 Feb 2022 04:09:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21I48xRd028371 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Feb 2022 23:08:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8A40040E80EC; Fri, 18 Feb 2022 04:08:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85F7240E80E8
	for <cluster-devel@redhat.com>; Fri, 18 Feb 2022 04:08:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D3C61C05B13
	for <cluster-devel@redhat.com>; Fri, 18 Feb 2022 04:08:59 +0000 (UTC)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-501-1P_OOSu0PfGUm9N-XYG2sQ-1; Thu, 17 Feb 2022 23:08:55 -0500
X-MC-Unique: 1P_OOSu0PfGUm9N-XYG2sQ-1
Received: from cwcc.thunk.org (pool-108-7-220-252.bstnma.fios.verizon.net
	[108.7.220.252]) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21I48c9R019411
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 17 Feb 2022 23:08:39 -0500
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id A4C4115C34C8; Thu, 17 Feb 2022 23:08:38 -0500 (EST)
Date: Thu, 17 Feb 2022 23:08:38 -0500
From: "Theodore Ts'o" <tytso@mit.edu>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <Yg8bxiz02WBGf6qO@mit.edu>
References: <Yg0m6IjcNmfaSokM@google.com>
	<82d0f4e4-c911-a245-4701-4712453592d9@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <82d0f4e4-c911-a245-4701-4712453592d9@nvidia.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Christoph Hellwig <hch@lst.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [REPORT] kernel BUG at fs/ext4/inode.c:2620 -
	page_buffers()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 17, 2022 at 05:06:45PM -0800, John Hubbard wrote:
> Yes. And looking at the pair of backtraces below, this looks very much
> like another aspect of the "get_user_pages problem" [1], originally
> described in Jan Kara's 2018 email [2].

Hmm... I just posted my analysis, which tracks with yours; but I had
forgotten about Jan's 2018 e-mail on the matter.

> I'm getting close to posting an RFC for the direct IO conversion to
> FOLL_PIN, but even after that, various parts of the kernel (reclaim,
> filesystems/block layer) still need to be changed so as to use
> page_maybe_dma_pinned() to help avoid this problem. There's a bit
> more than that, actually.

The challenge is that fixing this "the right away" is probably not
something we can backport into an LTS kernel, whether it's 5.15 or
5.10... or 4.19.

The only thing which can probably survive getting backported is
something like this.  It won't make the right thing happen if someone
is trying to RDMA or call process_vm_writev() into a file-backed
memory region --- but I'm not sure I care.  Certainly if the goal is
to make Android kernels, I'm pretty sure they are't either using RDMA,
and I suspect they are probably masking out the process_vm_writev(2)
system call (at least, for Android O and newer).  So if the goal is to
just to close some Syzbot bugs, what do folks think about this?

     	      	   	  	     	- Ted

commit 7711b1fda6f7f04274fa1cba6f092410262b0296
Author: Theodore Ts'o <tytso@mit.edu>
Date:   Thu Feb 17 22:54:03 2022 -0500

    ext4: work around bugs in mm/gup.c that can cause ext4 to BUG()
    
    [un]pin_user_pages_remote is dirtying pages without properly warning
    the file system in advance (or faulting in the file data if the page
    is not yet in the page cache).  This was noted by Jan Kara in 2018[1]
    and more recently has resulted in bug reports by Syzbot in various
    Android kernels[2].
    
    Fixing this for real is non-trivial, and will never be backportable
    into stable kernels.  So this is a simple workaround that stops the
    kernel from BUG()'ing.  The changed pages will not be properly written
    back, but given that the current gup code is missing the "read" in
    "read-modify-write", the dirty page in the page cache might contain
    corrupted data anyway.
    
    [1] https://www.spinics.net/lists/linux-mm/msg142700.html
    [2] https://lore.kernel.org/r/Yg0m6IjcNmfaSokM@google.com
    
    Reported-by: syzbot+d59332e2db681cf18f0318a06e994ebbb529a8db@syzkaller.appspotmail.com
    Reported-by: Lee Jones <lee.jones@linaro.org>
    Signed-off-by: Theodore Ts'o <tytso@mit.edu>

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 01c9e4f743ba..3b2f336a90d1 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1993,6 +1993,15 @@ static int ext4_writepage(struct page *page,
 	else
 		len = PAGE_SIZE;
 
+	/* Should never happen but for buggy gup code */
+	if (!page_has_buffers(page)) {
+		ext4_warning_inode(inode,
+		   "page %lu does not have buffers attached", page->index);
+		ClearPageDirty(page);
+		unlock_page(page);
+		return 0;
+	}
+
 	page_bufs = page_buffers(page);
 	/*
 	 * We cannot do block allocation or other extent handling in this
@@ -2594,6 +2603,14 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 			wait_on_page_writeback(page);
 			BUG_ON(PageWriteback(page));
 
+			/* Should never happen but for buggy gup code */
+			if (!page_has_buffers(page)) {
+				ext4_warning_inode(mpd->inode, "page %lu does not have buffers attached", page->index);
+				ClearPageDirty(page);
+				unlock_page(page);
+				continue;
+			}
+
 			if (mpd->map.m_len == 0)
 				mpd->first_page = page->index;
 			mpd->next_page = page->index + 1;

