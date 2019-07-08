Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2ED626D1
	for <lists+cluster-devel@lfdr.de>; Mon,  8 Jul 2019 19:07:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3E62A81DF3;
	Mon,  8 Jul 2019 17:07:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA01C5C46B;
	Mon,  8 Jul 2019 17:07:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A00421833002;
	Mon,  8 Jul 2019 17:07:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x68H6scg030043 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jul 2019 13:06:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DAE252B9CF; Mon,  8 Jul 2019 17:06:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E9735C46B;
	Mon,  8 Jul 2019 17:06:51 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A247C3086201;
	Mon,  8 Jul 2019 17:06:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9CDAE227A81; Mon,  8 Jul 2019 19:06:20 +0200 (CEST)
Date: Mon, 8 Jul 2019 19:06:19 +0200
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20190708170619.GA10526@lst.de>
References: <20190705235622.22368-1-agruenba@redhat.com>
	<20190705235622.22368-3-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190705235622.22368-3-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Greylist: Delayed for 00:47:01 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Mon, 08 Jul 2019 17:06:31 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Mon, 08 Jul 2019 17:06:31 +0000 (UTC) for IP:'213.95.11.211'
	DOMAIN:'verein.lst.de' HELO:'verein.lst.de' FROM:'hch@lst.de'
	RCPT:''
X-RedHat-Spam-Score: 0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 213.95.11.211 verein.lst.de 213.95.11.211
	verein.lst.de <hch@lst.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH 2/2] gfs2: Add support for IOMAP_ZERO
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 08 Jul 2019 17:07:31 +0000 (UTC)

Don't we actually need the write lock for zeroing as well?  Also
I think the alloc helper would be nice to keep, and a little use
of switch might clean things up.  How about something like this
instead?

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index f42718dd292f..8f5a25f507c3 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1027,17 +1027,8 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 	bool unstuff, alloc_required;
 	int ret;
 
-	ret = gfs2_write_lock(inode);
-	if (ret)
-		return ret;
-
 	unstuff = gfs2_is_stuffed(ip) &&
 		  pos + length > gfs2_max_stuffed_size(ip);
-
-	ret = gfs2_iomap_get(inode, pos, length, flags, iomap, mp);
-	if (ret)
-		goto out_unlock;
-
 	alloc_required = unstuff || iomap->type == IOMAP_HOLE;
 
 	if (alloc_required || gfs2_is_jdata(ip))
@@ -1051,7 +1042,7 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 
 		ret = gfs2_quota_lock_check(ip, &ap);
 		if (ret)
-			goto out_unlock;
+			return ret;
 
 		ret = gfs2_inplace_reserve(ip, &ap);
 		if (ret)
@@ -1118,11 +1109,23 @@ static int gfs2_iomap_begin_write(struct inode *inode, loff_t pos,
 out_qunlock:
 	if (alloc_required)
 		gfs2_quota_unlock(ip);
-out_unlock:
-	gfs2_write_unlock(inode);
 	return ret;
 }
 
+static inline bool gfs2_iomap_need_write_lock(unsigned flags)
+{
+	switch (flags & (IOMAP_WRITE | IOMAP_ZERO)) {
+	case IOMAP_WRITE:
+		if (flags & IOMAP_DIRECT)
+			return false;
+		return true;
+	case IOMAP_ZERO:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int gfs2_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
 			    unsigned flags, struct iomap *iomap)
 {
@@ -1133,20 +1136,48 @@ static int gfs2_iomap_begin(struct inode *inode, loff_t pos, loff_t length,
 	iomap->flags |= IOMAP_F_BUFFER_HEAD;
 
 	trace_gfs2_iomap_start(ip, pos, length, flags);
-	if ((flags & IOMAP_WRITE) && !(flags & IOMAP_DIRECT)) {
-		ret = gfs2_iomap_begin_write(inode, pos, length, flags, iomap, &mp);
-	} else {
-		ret = gfs2_iomap_get(inode, pos, length, flags, iomap, &mp);
 
-		/*
-		 * Silently fall back to buffered I/O for stuffed files or if
-		 * we've hot a hole (see gfs2_file_direct_write).
-		 */
-		if ((flags & IOMAP_WRITE) && (flags & IOMAP_DIRECT) &&
-		    iomap->type != IOMAP_MAPPED)
-			ret = -ENOTBLK;
+	if (gfs2_iomap_need_write_lock(flags)) {
+		ret = gfs2_write_lock(inode);
+		if (ret)
+			goto out;
 	}
+
+	ret = gfs2_iomap_get(inode, pos, length, flags, iomap, &mp);
+	if (ret)
+		goto out_unlock;
+
+	switch (flags & (IOMAP_WRITE | IOMAP_ZERO)) {
+	case 0:
+		goto out_unlock;
+	case IOMAP_WRITE:
+		if (flags & IOMAP_DIRECT) {
+			/*
+			 * Silently fall back to buffered I/O for stuffed files
+			 * or if we've got a hole (see gfs2_file_direct_write).
+			 */
+			if (iomap->type != IOMAP_MAPPED)
+				ret = -ENOTBLK;
+			goto out_unlock;
+		}
+		break;
+	case IOMAP_ZERO:
+		if (iomap->type == IOMAP_HOLE)
+			goto out_unlock;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		ret = -EIO;
+		goto out_unlock;
+	}
+
+	ret = gfs2_iomap_begin_write(inode, pos, length, flags, iomap, &mp);
+
+out_unlock:
+	if (ret && gfs2_iomap_need_write_lock(flags))
+		gfs2_write_unlock(inode);
 	release_metapath(&mp);
+out:
 	trace_gfs2_iomap_end(ip, iomap, ret);
 	return ret;
 }
@@ -1157,8 +1188,21 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 
-	if ((flags & (IOMAP_WRITE | IOMAP_DIRECT)) != IOMAP_WRITE)
-		goto out;
+	switch (flags & (IOMAP_WRITE | IOMAP_ZERO)) {
+	case 0:
+		return 0;
+	case IOMAP_WRITE:
+		if (flags & IOMAP_DIRECT)
+			return 0;
+		break;
+	case IOMAP_ZERO:
+		if (iomap->type == IOMAP_HOLE)
+			return 0;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+		return -EIO;
+	}
 
 	if (!gfs2_is_stuffed(ip))
 		gfs2_ordered_add_inode(ip);
@@ -1183,8 +1227,6 @@ static int gfs2_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 	if (ip->i_qadata && ip->i_qadata->qa_qd_num)
 		gfs2_quota_unlock(ip);
 	gfs2_write_unlock(inode);
-
-out:
 	return 0;
 }
 

