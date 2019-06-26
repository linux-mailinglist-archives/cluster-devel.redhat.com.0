Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A435688F
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 14:22:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4204230842B0;
	Wed, 26 Jun 2019 12:22:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 911AF1001B11;
	Wed, 26 Jun 2019 12:21:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E59E9E162;
	Wed, 26 Jun 2019 12:21:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QCKpfX031348 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 08:20:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 57A9E100033F; Wed, 26 Jun 2019 12:20:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 525AD100033E
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 12:20:49 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26F8E1806B0E;
	Wed, 26 Jun 2019 12:20:43 +0000 (UTC)
Date: Wed, 26 Jun 2019 08:20:42 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <868182386.37358699.1561551642881.JavaMail.zimbra@redhat.com>
In-Reply-To: <156151633004.2283456.4175543089138173586.stgit@magnolia>
References: <156151632209.2283456.3592379873620132456.stgit@magnolia>
	<156151633004.2283456.4175543089138173586.stgit@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.116.201, 10.4.195.9]
Thread-Topic: create a generic checking and prep function for FS_IOC_SETFLAGS
Thread-Index: 5u1cuSAsKRaw36dS1F+PjLFgFqc7sA==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
	yuchao0@huawei.com, clm@fb.com, adilger kernel <adilger.kernel@dilger.ca>,
	ocfs2-devel@oss.oracle.com, Christoph Hellwig <hch@lst.de>,
	matthew garrett <matthew.garrett@nebula.com>,
	cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
	josef@toxicpanda.com, reiserfs-devel@vger.kernel.org,
	linux-nilfs@vger.kernel.org, viro@zeniv.linux.org.uk,
	dsterba@suse.com, jaegeuk@kernel.org, tytso@mit.edu,
	ard biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
	linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 1/5] vfs: create a generic checking and
 prep function for FS_IOC_SETFLAGS
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Wed, 26 Jun 2019 12:22:20 +0000 (UTC)

----- Original Message -----
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Create a generic function to check incoming FS_IOC_SETFLAGS flag values
> and later prepare the inode for updates so that we can standardize the
> implementations that follow ext4's flag values.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: David Sterba <dsterba@suse.com>
> ---
>  fs/btrfs/ioctl.c    |   13 +++++--------
>  fs/efivarfs/file.c  |   26 +++++++++++++++++---------
>  fs/ext2/ioctl.c     |   16 ++++------------
>  fs/ext4/ioctl.c     |   13 +++----------
>  fs/f2fs/file.c      |    7 ++++---
>  fs/gfs2/file.c      |   42 +++++++++++++++++++++++++++++-------------
>  fs/hfsplus/ioctl.c  |   21 ++++++++++++---------
>  fs/inode.c          |   24 ++++++++++++++++++++++++
>  fs/jfs/ioctl.c      |   22 +++++++---------------
>  fs/nilfs2/ioctl.c   |    9 ++-------
>  fs/ocfs2/ioctl.c    |   13 +++----------
>  fs/orangefs/file.c  |   35 ++++++++++++++++++++++++++---------
>  fs/reiserfs/ioctl.c |   10 ++++------
>  fs/ubifs/ioctl.c    |   13 +++----------
>  include/linux/fs.h  |    3 +++
>  15 files changed, 146 insertions(+), 121 deletions(-)

The gfs2 portion looks correct.

Reviewed-by: Bob Peterson <rpeterso@redhat.com>

Regards,

Bob Peterson

