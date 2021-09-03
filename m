Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4FE40026C
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Sep 2021 17:36:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-GsGA9IWsNs-srqMq-8QFHQ-1; Fri, 03 Sep 2021 11:36:29 -0400
X-MC-Unique: GsGA9IWsNs-srqMq-8QFHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D448835DE7;
	Fri,  3 Sep 2021 15:36:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F122B5D9FC;
	Fri,  3 Sep 2021 15:36:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B36244A5A;
	Fri,  3 Sep 2021 15:36:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 183F8YfI031983 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Sep 2021 11:08:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9AFF310BC2AC; Fri,  3 Sep 2021 15:08:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96DC9117C2D4
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 15:08:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6F9B811E7F
	for <cluster-devel@redhat.com>; Fri,  3 Sep 2021 15:08:31 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
	[209.85.222.178]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-55-LCQCvYcJPyG-RDlD-k35Zg-1; Fri, 03 Sep 2021 11:08:28 -0400
X-MC-Unique: LCQCvYcJPyG-RDlD-k35Zg-1
Received: by mail-qk1-f178.google.com with SMTP id m21so6048003qkm.13;
	Fri, 03 Sep 2021 08:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=dfVAyRi3egcPmrpkkX6mL213sIGpEaRWvxdiTkq+xW8=;
	b=MHUJ52uO5lAp3DKW86oEG5i9xgwtlmhKHcjagH5sIbtOYmZ8Dw7E+zWuZgm5c6m9f5
	bLg5tmIA3AEAhFaC3LQJu1+A9hWiBPgpEvcpbbRPubz3b7LvcPRDib1T6Ac7jXa6ZFaY
	+hSoAOLEJ8fTz+gLadfJiDuVNZENOCLf/aMhcapAq8wBwYr9WC5lbao7E2fHCiwTGh6J
	VqJzB6q88SCjrHVc/UN9XzKCcAq+kq7nS6aUiUxcHth0mI3V54ZQoWWspthv5oxrODEr
	qYgcxEXKP6S4aTTVUNyafcnX6MWqtu/aE0GEonymMdMLd9HAPjryA6YFA7AUJvWhRhxc
	pFcw==
X-Gm-Message-State: AOAM530cdHA6vzwPvGJ1dZGT/gTTovSshJ7YQfOn/gSkS/Nw1w6cGAkb
	Mw3wh0Co2mKs+M4AYYkC35tLs/wcDH+YCwia1xOyG50lix0=
X-Google-Smtp-Source: ABdhPJxOxNoEKZDrnzr5I27hdDLrYAI3fzlDltFTJm77mMKSv9gWkp9I05ZDbo+9/cQzt6JSbVvTx3kldRbLUD+SG7w=
X-Received: by 2002:a05:620a:2844:: with SMTP id
	h4mr3924402qkp.388.1630681707290; 
	Fri, 03 Sep 2021 08:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210827164926.1726765-1-agruenba@redhat.com>
In-Reply-To: <20210827164926.1726765-1-agruenba@redhat.com>
From: Filipe Manana <fdmanana@gmail.com>
Date: Fri, 3 Sep 2021 16:07:51 +0100
Message-ID: <CAL3q7H709FSbHtinPRqe6XtZEvhmkSVBhFHUGMiVDW7Ngb3wrQ@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 183F8YfI031983
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 03 Sep 2021 11:27:42 -0400
Cc: kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
	cluster-devel@redhat.com, Jan Kara <jack@suse.cz>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v7 00/19] gfs2: Fix mmap + page fault
	deadlocks
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: fdmanana@gmail.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, Aug 27, 2021 at 5:51 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> Hi all,
>
> here's another update on top of v5.14-rc7.  Changes:
>
>  * Some of the patch descriptions have been improved.
>
>  * Patch "gfs2: Eliminate ip->i_gh" has been moved further to the front.
>
> At this point, I'm not aware of anything that still needs fixing,

Hi, thanks for doing this.

In btrfs we also have a deadlock (after the conversion to use iomap
for direct IO) triggered by your recent test case for fstests,
generic/647 [1].
Even though we can fix it in btrfs without touching iomap, iov_iter,
etc, it would be too complex for such a rare and exotic case (a user
passing a buffer for a direct IO read/write that is memory mapped to
the same file range of the operation is very uncommon at least). But
this patchset would make the fix much simpler and cleaner.

One thing I noticed is that, for direct IO reads, despite setting the
->nofault attribute of the iov_iter to true, we can still get page
faults while in the iomap code.
This happens when reading from holes and unwritten/prealloc extents,
because iomap calls iov_iter_zero() and this seems to ignore the value
of ->nofault.
Is that intentional? I can get around it by surrounding the iomap call
with pagefault_disable() / pagefault_enable(), but it seems odd to do
so, given that iov_iter->nofault was set to true.

[1] https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/commit/?id=d3cbdabffc4cb28850e97bc7bd8a7a1460db94e5

Thanks.

>
>
> The first two patches are independent of the core of this patch queue
> and I've asked the respective maintainers to have a look, but I've not
> heard back from them.  The first patch should just go into Al's tree;
> it's a relatively straight-forward fix.  The second patch really needs
> to be looked at; it might break things:
>
>   iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value
>   powerpc/kvm: Fix kvm_use_magic_page
>
>
> Al and Linus seem to have a disagreement about the error reporting
> semantics that functions fault_in_{readable,writeable} and
> fault_in_iov_iter_{readable,writeable} should have.  I've implemented
> Linus's suggestion of returning the number of bytes not faulted in and I
> think that being able to tell if "nothing", "something" or "everything"
> could be faulted in does help, but I'll live with anything that allows
> us to make progress.
>
>
> The iomap changes should ideally be reviewed by Christoph; I've not
> heard from him about those.
>
>
> Thanks,
> Andreas
>
> Andreas Gruenbacher (16):
>   iov_iter: Fix iov_iter_get_pages{,_alloc} page fault return value
>   powerpc/kvm: Fix kvm_use_magic_page
>   gup: Turn fault_in_pages_{readable,writeable} into
>     fault_in_{readable,writeable}
>   iov_iter: Turn iov_iter_fault_in_readable into
>     fault_in_iov_iter_readable
>   iov_iter: Introduce fault_in_iov_iter_writeable
>   gfs2: Add wrapper for iomap_file_buffered_write
>   gfs2: Clean up function may_grant
>   gfs2: Move the inode glock locking to gfs2_file_buffered_write
>   gfs2: Eliminate ip->i_gh
>   gfs2: Fix mmap + page fault deadlocks for buffered I/O
>   iomap: Fix iomap_dio_rw return value for user copies
>   iomap: Support partial direct I/O on user copy failures
>   iomap: Add done_before argument to iomap_dio_rw
>   gup: Introduce FOLL_NOFAULT flag to disable page faults
>   iov_iter: Introduce nofault flag to disable page faults
>   gfs2: Fix mmap + page fault deadlocks for direct I/O
>
> Bob Peterson (3):
>   gfs2: Eliminate vestigial HIF_FIRST
>   gfs2: Remove redundant check from gfs2_glock_dq
>   gfs2: Introduce flag for glock holder auto-demotion
>
>  arch/powerpc/kernel/kvm.c           |   3 +-
>  arch/powerpc/kernel/signal_32.c     |   4 +-
>  arch/powerpc/kernel/signal_64.c     |   2 +-
>  arch/x86/kernel/fpu/signal.c        |   7 +-
>  drivers/gpu/drm/armada/armada_gem.c |   7 +-
>  fs/btrfs/file.c                     |   7 +-
>  fs/btrfs/ioctl.c                    |   5 +-
>  fs/ext4/file.c                      |   5 +-
>  fs/f2fs/file.c                      |   2 +-
>  fs/fuse/file.c                      |   2 +-
>  fs/gfs2/bmap.c                      |  60 +----
>  fs/gfs2/file.c                      | 245 ++++++++++++++++++--
>  fs/gfs2/glock.c                     | 340 +++++++++++++++++++++-------
>  fs/gfs2/glock.h                     |  20 ++
>  fs/gfs2/incore.h                    |   5 +-
>  fs/iomap/buffered-io.c              |   2 +-
>  fs/iomap/direct-io.c                |  21 +-
>  fs/ntfs/file.c                      |   2 +-
>  fs/xfs/xfs_file.c                   |   6 +-
>  fs/zonefs/super.c                   |   4 +-
>  include/linux/iomap.h               |  11 +-
>  include/linux/mm.h                  |   3 +-
>  include/linux/pagemap.h             |  58 +----
>  include/linux/uio.h                 |   4 +-
>  lib/iov_iter.c                      | 103 +++++++--
>  mm/filemap.c                        |   4 +-
>  mm/gup.c                            | 139 +++++++++++-
>  27 files changed, 785 insertions(+), 286 deletions(-)
>
> --
> 2.26.3
>


-- 
Filipe David Manana,

“Whether you think you can, or you think you can't — you're right.”


