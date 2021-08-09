Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 464463E3FE8
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Aug 2021 08:27:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-KZj-gEQiPAK0_ckXa7L2bw-1; Mon, 09 Aug 2021 02:27:11 -0400
X-MC-Unique: KZj-gEQiPAK0_ckXa7L2bw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB3B01006C80;
	Mon,  9 Aug 2021 06:27:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AABAC1045D29;
	Mon,  9 Aug 2021 06:27:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89543180BAB4;
	Mon,  9 Aug 2021 06:27:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1796R6Nk002532 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Aug 2021 02:27:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 64D8721568AE; Mon,  9 Aug 2021 06:27:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F9A321568A5
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:27:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCC68800883
	for <cluster-devel@redhat.com>; Mon,  9 Aug 2021 06:27:02 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-512-FQe97--SNEqNBGmNFE8wDQ-1; Mon, 09 Aug 2021 02:27:00 -0400
X-MC-Unique: FQe97--SNEqNBGmNFE8wDQ-1
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCyWj-00AgKi-5E; Mon, 09 Aug 2021 06:12:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Date: Mon,  9 Aug 2021 08:12:14 +0200
Message-Id: <20210809061244.1196573-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: nvdimm@lists.linux.dev, cluster-devel@redhat.com,
	Matthew Wilcox <willy@infradead.org>,
	Shiyang Ruan <ruansy.fnst@fujitsu.com>,
	linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, linux-btrfs@vger.kernel.org
Subject: [Cluster-devel] switch iomap to an iterator model v2
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi all,

this series replies the existing callback-based iomap_apply to an iter based
model.  The prime aim here is to simply the DAX reflink support, which
requires iterating through two inodes, something that is rather painful
with the apply model.  It also helps to kill an indirect call per segment
as-is.  Compared to the earlier patchset from Matthew Wilcox that this
series is based upon it does not eliminate all indirect calls, but as the
upside it does not change the file systems at all (except for the btrfs
and gfs2 hooks which have slight prototype changes).


Changes since v1:
 - rebased to the lastes iomap-for-next tree
 - rename iter.c to core.c
 - turn iomap_iter.processed into a s64
 - rename a few variables
 - error out instead of just warn when a loop processed too much data
 - fix the readpage iter return value for inline data
 - better document the iomap_iter() calling conventions

Diffstat:
 b/fs/btrfs/inode.c       |    5 
 b/fs/buffer.c            |    4 
 b/fs/dax.c               |  578 ++++++++++++++++++++++-------------------------
 b/fs/gfs2/bmap.c         |    5 
 b/fs/internal.h          |    4 
 b/fs/iomap/Makefile      |    2 
 b/fs/iomap/buffered-io.c |  359 +++++++++++++----------------
 b/fs/iomap/core.c        |   79 ++++++
 b/fs/iomap/direct-io.c   |  164 ++++++-------
 b/fs/iomap/fiemap.c      |  101 +++-----
 b/fs/iomap/seek.c        |   98 ++++---
 b/fs/iomap/swapfile.c    |   38 +--
 b/fs/iomap/trace.h       |   35 +-
 b/include/linux/iomap.h  |   77 ++++--
 fs/iomap/apply.c         |   99 --------
 15 files changed, 799 insertions(+), 849 deletions(-)

