Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F30E6AE3EE
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Mar 2023 16:08:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678201682;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RTYnXq37uoN394QqLGZXYttCFm6XJ3t4CN0RE75GqWc=;
	b=TeMwQqpuM77xEDE1SmvSqBslNckMZa/rhTh+CXgKHOlRanzhn+IAIIzWBE7NVfY/NuYZT9
	8TUwweSlE8Shez8FSFlJEPMoW6tsZP5aa73+KhMTISaBnuJoA0C3E4t4hnmRXt9cR5BCse
	FSf0VthiExtt87B2Yy2vbLJ/AyBVzYs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-Lc0mOwF7N8CJszA-NREphQ-1; Tue, 07 Mar 2023 10:07:56 -0500
X-MC-Unique: Lc0mOwF7N8CJszA-NREphQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3A383C14871;
	Tue,  7 Mar 2023 15:07:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA2C640B40E4;
	Tue,  7 Mar 2023 15:07:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C41A19465A8;
	Tue,  7 Mar 2023 15:07:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E19E91946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 15:07:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CD2EFC15BAD; Tue,  7 Mar 2023 15:07:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C582BC15BA0
 for <cluster-devel@redhat.com>; Tue,  7 Mar 2023 15:07:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD3BD280559D
 for <cluster-devel@redhat.com>; Tue,  7 Mar 2023 15:07:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-hk-Vm_Q4MOmlqsJErC-oCQ-1; Tue, 07 Mar 2023 10:06:40 -0500
X-MC-Unique: hk-Vm_Q4MOmlqsJErC-oCQ-1
Received: from [46.183.103.17] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pZYOL-000q28-FV; Tue, 07 Mar 2023 14:34:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Hugh Dickins <hughd@google.com>
Date: Tue,  7 Mar 2023 15:34:03 +0100
Message-Id: <20230307143410.28031-1-hch@lst.de>
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
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] return an ERR_PTR from __filemap_get_folio v3
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Note that the shmem patches in here are non-trivial and I would appreicate
a careful review from Hugh.

Changes since v2:
 - rebased to v6.3-rc which includes a couple of new callsites

Changes since v1:
 - drop the patches to check for errors in btrfs and gfs2
 - document the new calling conventions for the wrappers around
   __filemap_get_folio
 - rebased against the iomap changes in latest linux-next

Diffstat
 fs/afs/dir.c             |   10 +++----
 fs/afs/dir_edit.c        |    2 -
 fs/afs/write.c           |    4 +-
 fs/ext4/inode.c          |    2 -
 fs/ext4/move_extent.c    |    8 ++---
 fs/hugetlbfs/inode.c     |    2 -
 fs/iomap/buffered-io.c   |   11 +-------
 fs/netfs/buffered_read.c |    4 +-
 fs/nfs/file.c            |    4 +-
 fs/nilfs2/page.c         |    6 ++--
 include/linux/pagemap.h  |   15 +++++------
 include/linux/shmem_fs.h |    1 
 mm/filemap.c             |   27 ++++++++-----------
 mm/folio-compat.c        |    4 +-
 mm/huge_memory.c         |    5 +--
 mm/hugetlb.c             |    6 ++--
 mm/memcontrol.c          |    2 -
 mm/mincore.c             |    2 -
 mm/shmem.c               |   64 +++++++++++++++++++----------------------------
 mm/swap_state.c          |   17 ++++++------
 mm/swapfile.c            |    4 +-
 mm/truncate.c            |   15 +++++------
 22 files changed, 99 insertions(+), 116 deletions(-)

