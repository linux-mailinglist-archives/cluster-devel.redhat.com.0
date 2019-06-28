Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F30A5A3E3
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Jun 2019 20:36:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D533F18DF7A;
	Fri, 28 Jun 2019 18:35:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 761195DD64;
	Fri, 28 Jun 2019 18:35:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1047F1806B16;
	Fri, 28 Jun 2019 18:35:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5SIZMC1026246 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 14:35:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3F252608CA; Fri, 28 Jun 2019 18:35:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 381D060920
	for <cluster-devel@redhat.com>; Fri, 28 Jun 2019 18:35:19 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01BD09C158
	for <cluster-devel@redhat.com>; Fri, 28 Jun 2019 18:35:02 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5SIYTuK114669; Fri, 28 Jun 2019 18:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : from : to :
	cc : date : message-id : in-reply-to : references : mime-version :
	content-type : content-transfer-encoding; s=corp-2018-07-02;
	bh=RJo9HRMvrhDC3/z4MR2nW8aji8vHUz97eCXxdDfB7Qw=;
	b=zfsBPq4VIgYQNsYJJLrQACmJUX2r4WH3O24sII7d3G3YpAp2BPvIaItNZuKFgX8DhxfW
	vXdtmCxGUQAsSnZqhsjZ7kHOL3QYXAeRSerILJ9orq99UK4YmM56dP18DZpACbCT3wN2
	V0UDcy16W4vhh0jil3d+yfPReca3dIRCwA0TQNssA4D+W/GOgk6nez66Cf6ykSiEYYmD
	8T4iOAs7QMyYZCEXLJJXiFCrdLDL866nH1zyubZnV2zumrYW5Op10XIew14erNhQP/4t
	HbOBURZkWTQNo7pA/qgq/oaCbtYUv9E36D5xwci4Dq8czAcUUDO1LB1hSPwSLDRKwbk3
	5g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2120.oracle.com with ESMTP id 2t9cyqxyh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2019 18:34:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5SIXemV001136; Fri, 28 Jun 2019 18:34:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3020.oracle.com with ESMTP id 2tat7e3g5e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 28 Jun 2019 18:34:29 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5SIYS8N002532;
	Fri, 28 Jun 2019 18:34:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 2tat7e3g5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2019 18:34:28 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5SIYQeU021679;
	Fri, 28 Jun 2019 18:34:27 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 28 Jun 2019 11:34:26 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
	darrick.wong@oracle.com, shaggy@kernel.org, ard.biesheuvel@linaro.org, 
	josef@toxicpanda.com, hch@infradead.org, clm@fb.com,
	adilger.kernel@dilger.ca, jk@ozlabs.org, jack@suse.com,
	dsterba@suse.com, jaegeuk@kernel.org, viro@zeniv.linux.org.uk
Date: Fri, 28 Jun 2019 11:34:23 -0700
Message-ID: <156174686376.1557318.5574192602758705361.stgit@magnolia>
In-Reply-To: <156174682897.1557318.14418894077683701275.stgit@magnolia>
References: <156174682897.1557318.14418894077683701275.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9302
	signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=980
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906280210
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Fri, 28 Jun 2019 18:35:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Fri, 28 Jun 2019 18:35:12 +0000 (UTC) for IP:'156.151.31.85'
	DOMAIN:'userp2120.oracle.com' HELO:'userp2120.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.398  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_NONE, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.85 userp2120.oracle.com 156.151.31.85
	userp2120.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-ext4@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH 4/5] vfs: teach vfs_ioc_fssetxattr_check to
 check extent size hints
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 28 Jun 2019 18:36:00 +0000 (UTC)

From: Darrick J. Wong <darrick.wong@oracle.com>

Move the extent size hint checks that aren't xfs-specific to the vfs.

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 fs/inode.c         |   18 +++++++++++++
 fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++------------------------------
 2 files changed, 47 insertions(+), 41 deletions(-)


diff --git a/fs/inode.c b/fs/inode.c
index c4f8fb16f633..670d5408d022 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2247,6 +2247,24 @@ int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
 			return -EINVAL;
 	}
 
+	/* Check extent size hints. */
+	if ((fa->fsx_xflags & FS_XFLAG_EXTSIZE) && !S_ISREG(inode->i_mode))
+		return -EINVAL;
+
+	if ((fa->fsx_xflags & FS_XFLAG_EXTSZINHERIT) &&
+			!S_ISDIR(inode->i_mode))
+		return -EINVAL;
+
+	if ((fa->fsx_xflags & FS_XFLAG_COWEXTSIZE) &&
+	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
+		return -EINVAL;
+
+	/* Extent size hints of zero turn off the flags. */
+	if (fa->fsx_extsize == 0)
+		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
+	if (fa->fsx_cowextsize == 0)
+		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
+
 	return 0;
 }
 EXPORT_SYMBOL(vfs_ioc_fssetxattr_check);
diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
index f494c01342c6..fe29aa61293c 100644
--- a/fs/xfs/xfs_ioctl.c
+++ b/fs/xfs/xfs_ioctl.c
@@ -1200,39 +1200,31 @@ xfs_ioctl_setattr_check_extsize(
 	struct fsxattr		*fa)
 {
 	struct xfs_mount	*mp = ip->i_mount;
-
-	if ((fa->fsx_xflags & FS_XFLAG_EXTSIZE) && !S_ISREG(VFS_I(ip)->i_mode))
-		return -EINVAL;
-
-	if ((fa->fsx_xflags & FS_XFLAG_EXTSZINHERIT) &&
-	    !S_ISDIR(VFS_I(ip)->i_mode))
-		return -EINVAL;
+	xfs_extlen_t		size;
+	xfs_fsblock_t		extsize_fsb;
 
 	if (S_ISREG(VFS_I(ip)->i_mode) && ip->i_d.di_nextents &&
 	    ((ip->i_d.di_extsize << mp->m_sb.sb_blocklog) != fa->fsx_extsize))
 		return -EINVAL;
 
-	if (fa->fsx_extsize != 0) {
-		xfs_extlen_t    size;
-		xfs_fsblock_t   extsize_fsb;
-
-		extsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_extsize);
-		if (extsize_fsb > MAXEXTLEN)
-			return -EINVAL;
+	if (fa->fsx_extsize == 0)
+		return 0;
 
-		if (XFS_IS_REALTIME_INODE(ip) ||
-		    (fa->fsx_xflags & FS_XFLAG_REALTIME)) {
-			size = mp->m_sb.sb_rextsize << mp->m_sb.sb_blocklog;
-		} else {
-			size = mp->m_sb.sb_blocksize;
-			if (extsize_fsb > mp->m_sb.sb_agblocks / 2)
-				return -EINVAL;
-		}
+	extsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_extsize);
+	if (extsize_fsb > MAXEXTLEN)
+		return -EINVAL;
 
-		if (fa->fsx_extsize % size)
+	if (XFS_IS_REALTIME_INODE(ip) ||
+	    (fa->fsx_xflags & FS_XFLAG_REALTIME)) {
+		size = mp->m_sb.sb_rextsize << mp->m_sb.sb_blocklog;
+	} else {
+		size = mp->m_sb.sb_blocksize;
+		if (extsize_fsb > mp->m_sb.sb_agblocks / 2)
 			return -EINVAL;
-	} else
-		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
+	}
+
+	if (fa->fsx_extsize % size)
+		return -EINVAL;
 
 	return 0;
 }
@@ -1258,6 +1250,8 @@ xfs_ioctl_setattr_check_cowextsize(
 	struct fsxattr		*fa)
 {
 	struct xfs_mount	*mp = ip->i_mount;
+	xfs_extlen_t		size;
+	xfs_fsblock_t		cowextsize_fsb;
 
 	if (!(fa->fsx_xflags & FS_XFLAG_COWEXTSIZE))
 		return 0;
@@ -1266,25 +1260,19 @@ xfs_ioctl_setattr_check_cowextsize(
 	    ip->i_d.di_version != 3)
 		return -EINVAL;
 
-	if (!S_ISREG(VFS_I(ip)->i_mode) && !S_ISDIR(VFS_I(ip)->i_mode))
-		return -EINVAL;
-
-	if (fa->fsx_cowextsize != 0) {
-		xfs_extlen_t    size;
-		xfs_fsblock_t   cowextsize_fsb;
+	if (fa->fsx_cowextsize == 0)
+		return 0;
 
-		cowextsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_cowextsize);
-		if (cowextsize_fsb > MAXEXTLEN)
-			return -EINVAL;
+	cowextsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_cowextsize);
+	if (cowextsize_fsb > MAXEXTLEN)
+		return -EINVAL;
 
-		size = mp->m_sb.sb_blocksize;
-		if (cowextsize_fsb > mp->m_sb.sb_agblocks / 2)
-			return -EINVAL;
+	size = mp->m_sb.sb_blocksize;
+	if (cowextsize_fsb > mp->m_sb.sb_agblocks / 2)
+		return -EINVAL;
 
-		if (fa->fsx_cowextsize % size)
-			return -EINVAL;
-	} else
-		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
+	if (fa->fsx_cowextsize % size)
+		return -EINVAL;
 
 	return 0;
 }

