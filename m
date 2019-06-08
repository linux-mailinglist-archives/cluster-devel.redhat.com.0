Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2F139FA5
	for <lists+cluster-devel@lfdr.de>; Sat,  8 Jun 2019 14:20:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9E3953082204;
	Sat,  8 Jun 2019 12:20:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0762810013D9;
	Sat,  8 Jun 2019 12:20:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 735113D87;
	Sat,  8 Jun 2019 12:20:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x58CG7Po004280 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 8 Jun 2019 08:16:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B93E619C58; Sat,  8 Jun 2019 12:16:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.205.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 93A4D19C59;
	Sat,  8 Jun 2019 12:16:04 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, cluster-devel@redhat.com
Date: Sat,  8 Jun 2019 14:16:01 +0200
Message-Id: <20190608121601.4897-1-agruenba@redhat.com>
In-Reply-To: <5c5d673b-57dd-7720-4420-badac31b76c3@citrix.com>
References: <5c5d673b-57dd-7720-4420-badac31b76c3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH 11/12] gfs2: Fix iomap write page
	reclaim deadlock
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Sat, 08 Jun 2019 12:20:46 +0000 (UTC)

Hi Ross,

On Fri, 7 Jun 2019 at 18:21, Ross Lagerwall <ross.lagerwall@citrix.com> wrote:
> On 5/7/19 9:32 PM, Andreas Gruenbacher wrote:
> > Since commit 64bc06bb32ee ("gfs2: iomap buffered write support"), gfs2 is doing
> > buffered writes by starting a transaction in iomap_begin, writing a range of
> > pages, and ending that transaction in iomap_end.  This approach suffers from
> > two problems:
> >
> >    (1) Any allocations necessary for the write are done in iomap_begin, so when
> >    the data aren't journaled, there is no need for keeping the transaction open
> >    until iomap_end.
> >
> >    (2) Transactions keep the gfs2 log flush lock held.  When
> >    iomap_file_buffered_write calls balance_dirty_pages, this can end up calling
> >    gfs2_write_inode, which will try to flush the log.  This requires taking the
> >    log flush lock which is already held, resulting in a deadlock.
> >
> > Fix both of these issues by not keeping transactions open from iomap_begin to
> > iomap_end.  Instead, start a small transaction in page_prepare and end it in
> > page_done when necessary.
> >
> Unfortunately, this patch broke growing gfs2 filesystems. It is easy to
> reproduce:
>
> $ mkfs.gfs2 -t xxx:yyy /dev/xvdb  4369065
> $ mount /dev/xvdb /mnt
> $ gfs2_grow /mnt (doesn't finish)
> FS: Mount point:             /mnt
> FS: Device:                  /dev/xvdb
> FS: Size:                    4369062 (0x42aaa6)
> DEV: Length:                 13107200 (0xc80000)
> The file system will grow by 34133MB.
>
> Looking at the kernel log, I see it hits the following assertion and
> then hangs trying to withdraw the filesystem (which is a separate
> problem, presumably):
>
> gfs2: fsid=xxx:yyy.0: fatal: assertion "(nbuf <= tr->tr_blocks) &&
> (tr->tr_num_revoke <= tr->tr_revokes)" failed
>     function = gfs2_trans_end, file = fs/gfs2/trans.c, line = 117
> gfs2: fsid=xxx:yyy.0: about to withdraw this file system
>
> Rearranging the code so that it prints information about the transaction
> before the failed withdrawal attempt shows:
> gfs2: fsid=xxx:yyy.0: Transaction created at:
> iomap_write_begin.constprop.45+0xbc/0x380
> gfs2: fsid=xxx:yyy.0: blocks=1 revokes=0 reserved=8 touched=1
> gfs2: fsid=xxx:yyy.0: Buf 1/0 Databuf 1/0 Revoke 0/0
>
> Reverting this commit fixes the issue. Tested with git master as of
> today (16d72dd4891fe).

thanks for the error report. This turns out to be a rounding error in
gfs2_iomap_page_prepare; the attached patch should help.

Thanks,
Andreas

---
 fs/gfs2/bmap.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index f42718d..d2a3f038 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -994,9 +994,11 @@ static void gfs2_write_unlock(struct inode *inode)
 static int gfs2_iomap_page_prepare(struct inode *inode, loff_t pos,
 				   unsigned len, struct iomap *iomap)
 {
+	unsigned int blocks;
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
-	return gfs2_trans_begin(sdp, RES_DINODE + (len >> inode->i_blkbits), 0);
+	blocks = (len + i_blocksize(inode) - 1) >> inode->i_blkbits;
+	return gfs2_trans_begin(sdp, RES_DINODE + blocks, 0);
 }
 
 static void gfs2_iomap_page_done(struct inode *inode, loff_t pos,
-- 
1.8.3.1

