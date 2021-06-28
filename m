Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 51D6C3B67A0
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Jun 2021 19:27:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624901265;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n6U6EhoWKZdEp9mqc61FtXMmGLjx92aWNUsLWc0mHMI=;
	b=FX0A61X53/zR7mcdO0Pp1UAMtKwArpMeRHe8S8OKIBpc6+EFasaIcz7YRz1LmG2EKAtBW8
	A8K4iyihQJCqeoQ8gOH4A6Lk4eWhwsX5+TDQfYiGUDGglsTqw7Whwu2PfJumu8N5s59z+f
	D9qOg8LFQ6ulWVye1yj4AxrLH1nTawI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-ossQYVKcPyWeKUrMidq2Sg-1; Mon, 28 Jun 2021 13:27:44 -0400
X-MC-Unique: ossQYVKcPyWeKUrMidq2Sg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC90B804140;
	Mon, 28 Jun 2021 17:27:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C4B660854;
	Mon, 28 Jun 2021 17:27:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05E944EA2A;
	Mon, 28 Jun 2021 17:27:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SHRXgq017765 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 13:27:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEFEB5D703; Mon, 28 Jun 2021 17:27:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.193.232])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 157A75D6AD;
	Mon, 28 Jun 2021 17:27:28 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Date: Mon, 28 Jun 2021 19:27:25 +0200
Message-Id: <20210628172727.1894503-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, "Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 0/2] iomap: small block problems
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Christoph and all,

the recent gfs2 switch from buffer heads to iomap for managing the
block-to-page mappings in commit 2164f9b91869 ("gfs2: use iomap for
buffered I/O in ordered and writeback mode") broke filesystems with a
block size smaller than the page size.  This haüüens when iomap_page
objects aren't attached to pages in all the right circumstances, or the
iop->upodate bitmap isn't kept in sync with the PageUptodata flag.
There are three instances of this problem:

(1) In iomap_readpage_actor, an iomap_page is attached to the page even
for inline inodes.  This is unnecessary because inline inodes don't need
iomap_page objects.  That alone wouldn't cause any real issues, but when
iomap_read_inline_data copies the inline data into the page, it sets the
PageUptodate flag without setting iop->uptodate, causing an
inconsistency between the two.  This will trigger a WARN_ON in
iomap_page_release.  The fix should be not to allocate iomap_page
objects when reading from inline inodes (patch 1).

(2) When un-inlining an inode, we must allocate a page with an attached
iomap_page object (iomap_page_create) and initialize the iop->uptodate
bitmap (iomap_set_range_uptodate).  We can't currently do that because
iomap_page_create and iomap_set_range_uptodate are not exported.  That
could be fixed by exporting those functions, or by implementing an
additional helper as in patch 2.  Which of the two would you prefer?

(3) We're not yet using iomap_page_mkwrite, so iomap_page objects don't
get created on .page_mkwrite, either.  Part of the reason is that
iomap_page_mkwrite locks the page and then calls into the filesystem for
uninlining and for allocating backing blocks.  This conflicts with the
gfs2 locking order: on gfs2, transactions must be started before locking
any pages.  We can fix that by calling iomap_page_create from
gfs2_page_mkwrite, or by doing the uninlining and allocations before
calling iomap_page_mkwrite.  I've implemented option 2 for now; see
here:

https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/log/?h=for-next.iomap-page-mkwrite

Any thoughts?

Thanks,
Andreas

Andreas Gruenbacher (1):
  iomap: Don't create iomap_page objects for inline files

Bob Peterson (1):
  iomap: Add helper for un-inlining an inline inode

 fs/iomap/buffered-io.c | 28 +++++++++++++++++++++++++++-
 include/linux/iomap.h  |  2 ++
 2 files changed, 29 insertions(+), 1 deletion(-)

-- 
2.26.3

