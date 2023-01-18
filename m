Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D84B167180B
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 10:43:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674035033;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mTpJ9cNrsuABtrc2CMMVqtRMFrq4GM5CqdliOGUWCwM=;
	b=KJu0N8U2GnQN1tIU1iYzm8EXCktk9So4rA/gHZcotTdcQXNOZNkauKGJGzyq1zOeEpxCNT
	cJTZt1nOd3tC4F/3Ko6cKTbpg+fec3HPZg7jUxaMae7PxAzGtDKISTUF3Pr1bYhlHEmJzd
	NNMmx0UhHwewfYBoEd0294lVYDQYxvY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-Avzlqd3xPMG7psTzA5x7og-1; Wed, 18 Jan 2023 04:43:49 -0500
X-MC-Unique: Avzlqd3xPMG7psTzA5x7og-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49AC41C07558;
	Wed, 18 Jan 2023 09:43:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AE832026D4B;
	Wed, 18 Jan 2023 09:43:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 088941946A6D;
	Wed, 18 Jan 2023 09:43:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C3F6319465B7 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 09:43:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A5B6D492B01; Wed, 18 Jan 2023 09:43:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E960492B00
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 09:43:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83C2A3C0E46E
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 09:43:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-136-5zqBuBmFOOKS4pzscYxIAg-1; Wed, 18 Jan 2023 04:43:44 -0500
X-MC-Unique: 5zqBuBmFOOKS4pzscYxIAg-1
Received: from 213-147-167-250.nat.highway.webapn.at ([213.147.167.250]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pI4yk-0009uq-Jk; Wed, 18 Jan 2023 09:43:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>
Date: Wed, 18 Jan 2023 10:43:20 +0100
Message-Id: <20230118094329.9553-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] return an ERR_PTR from __filemap_get_folio
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
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi all,

__filemap_get_folio and its wrappers can return NULL for three different
conditions, which in some cases requires the caller to reverse engineer
the decision making.  This is fixed by returning an ERR_PTR instead of
NULL and thus transporting the reason for the failure.  But to make
that work we first need to ensure that no xa_value special case is
returned and thus return the FGP_ENTRY flag.  It turns out that flag
is barely used and can usually be deal with in a better way.

Note that the shmem patches in here are non-trivial and need some
careful review and testing.

Diffstat
 fs/afs/dir.c             |   10 +++----
 fs/afs/dir_edit.c        |    2 -
 fs/afs/write.c           |    4 +-
 fs/btrfs/disk-io.c       |    2 -
 fs/btrfs/extent_io.c     |    2 +
 fs/ext4/inode.c          |    2 -
 fs/ext4/move_extent.c    |    8 ++---
 fs/gfs2/lops.c           |    2 +
 fs/hugetlbfs/inode.c     |    2 -
 fs/iomap/buffered-io.c   |    6 ++--
 fs/netfs/buffered_read.c |    4 +-
 fs/nilfs2/page.c         |    6 ++--
 include/linux/pagemap.h  |    4 +-
 include/linux/shmem_fs.h |    1 
 mm/filemap.c             |   27 ++++++++-----------
 mm/folio-compat.c        |    4 +-
 mm/huge_memory.c         |    5 +--
 mm/memcontrol.c          |    2 -
 mm/mincore.c             |    2 -
 mm/shmem.c               |   64 +++++++++++++++++++----------------------------
 mm/swap_state.c          |   17 ++++++------
 mm/swapfile.c            |    4 +-
 mm/truncate.c            |   15 +++++------
 23 files changed, 93 insertions(+), 102 deletions(-)

