Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A75F7162100
	for <lists+cluster-devel@lfdr.de>; Tue, 18 Feb 2020 07:37:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582007868;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VPskQlM//p7QeK5r1mDkcrH/Kim1EtwCLe4ncxcmteM=;
	b=g5ImKofwDaxoc53eM5gD2Mueh18fKfX53Q1pMFTOvv5ZxRn4B39s/3FzpKCZYDTBKIoO+b
	0U7m6v05NvZ64ZDeah0q1dIsOSZ64EiJoyW1X3fnYGbfDO+KnwzCZe9Z7ueTzgmf6ogIZC
	08yGk+motYRfyUEuY3DixZic2y1Ddoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140--3-BL2YxMF6ct38lktUSLA-1; Tue, 18 Feb 2020 01:37:46 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE5A91005516;
	Tue, 18 Feb 2020 06:37:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DAD05C1B0;
	Tue, 18 Feb 2020 06:37:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14AC635AEF;
	Tue, 18 Feb 2020 06:37:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01I6behV030485 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 01:37:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5A628D960E; Tue, 18 Feb 2020 06:37:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 561B0D9602
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 06:37:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E21268032A1
	for <cluster-devel@redhat.com>; Tue, 18 Feb 2020 06:37:37 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-165-yT_aEpFuOgq8ljGu190Zpw-1; Tue, 18 Feb 2020 01:37:35 -0500
Received: from dread.disaster.area (pa49-179-138-28.pa.nsw.optusnet.com.au
	[49.179.138.28])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 76F237EA064;
	Tue, 18 Feb 2020 17:37:33 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1j3wVg-0006PR-Ey; Tue, 18 Feb 2020 17:37:32 +1100
Date: Tue, 18 Feb 2020 17:37:32 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200218063732.GP10776@dread.disaster.area>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-18-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-18-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=W5xGqiek c=1 sm=1 tr=0
	a=zAxSp4fFY/GQY8/esVNjqw==:117 a=zAxSp4fFY/GQY8/esVNjqw==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=l697ptgUJYAA:10
	a=JfrnYn6hAAAA:8 a=yPCof4ZbAAAA:8 a=20KFwNOVAAAA:8 a=7-415B0cAAAA:8
	a=VP4A6UuYfbXrVXFT8kYA:9 a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22
	a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: yT_aEpFuOgq8ljGu190Zpw-1
X-MC-Unique: -3-BL2YxMF6ct38lktUSLA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01I6behV030485
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, Junxiao Bi <junxiao.bi@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 10/19] fs: Convert mpage_readpages to
	mpage_readahead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 17, 2020 at 10:45:58AM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Implement the new readahead aop and convert all callers (block_dev,
> exfat, ext2, fat, gfs2, hpfs, isofs, jfs, nilfs2, ocfs2, omfs, qnx6,
> reiserfs & udf).  The callers are all trivial except for GFS2 & OCFS2.
>=20
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Junxiao Bi <junxiao.bi@oracle.com> # ocfs2
> ---
>  drivers/staging/exfat/exfat_super.c |  7 +++---
>  fs/block_dev.c                      |  7 +++---
>  fs/ext2/inode.c                     | 10 +++-----
>  fs/fat/inode.c                      |  7 +++---
>  fs/gfs2/aops.c                      | 23 ++++++-----------
>  fs/hpfs/file.c                      |  7 +++---
>  fs/iomap/buffered-io.c              |  2 +-
>  fs/isofs/inode.c                    |  7 +++---
>  fs/jfs/inode.c                      |  7 +++---
>  fs/mpage.c                          | 38 +++++++++--------------------
>  fs/nilfs2/inode.c                   | 15 +++---------
>  fs/ocfs2/aops.c                     | 34 ++++++++++----------------
>  fs/omfs/file.c                      |  7 +++---
>  fs/qnx6/inode.c                     |  7 +++---
>  fs/reiserfs/inode.c                 |  8 +++---
>  fs/udf/inode.c                      |  7 +++---
>  include/linux/mpage.h               |  4 +--
>  mm/migrate.c                        |  2 +-
>  18 files changed, 73 insertions(+), 126 deletions(-)

That's actually pretty simple changeover. Nothing really scary
there. :)

Reviewed-by: Dave Chinner <dchinner@redhat.com>

--=20
Dave Chinner
david@fromorbit.com


