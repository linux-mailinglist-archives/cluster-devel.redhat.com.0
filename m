Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4141655EE9
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 04:36:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E4867104C1;
	Wed, 26 Jun 2019 02:36:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAF6F6012E;
	Wed, 26 Jun 2019 02:36:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB4831806B18;
	Wed, 26 Jun 2019 02:36:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5Q2XgEQ015961 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 22:33:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C13C35D71B; Wed, 26 Jun 2019 02:33:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCC075D719
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 02:33:40 +0000 (UTC)
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE5D5308FC4E
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 02:33:18 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5Q2SxLv123573; Wed, 26 Jun 2019 02:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : from : to :
	cc : date : message-id : in-reply-to : references : mime-version :
	content-type : content-transfer-encoding; s=corp-2018-07-02;
	bh=h0lWCLVuyu0P/36h1LaiA53s/qIbwAY/ZQm2+JFVybY=;
	b=WVzGJQhS0xFxS9ZetgIjbt11O8dEzX+ntxaHJA/Dp/fXfdPu7h/tulaSw1kwfk0cARJ2
	6P7+LaBlGhrlBlTBixL7H1joLQrl5v0O8Wq+iChywtxq2zREmo1SZZsiPwhchYHf5vcY
	R0rhHWm3t8w9kIzGZYGPtpv/6JW+V9DMY/ig7caUEniKBDHwAAFFsm07Eaqv5HMAGarc
	SKeFMzwagbIiY2I+pTgKcZn6a1g5ugBqrBvCiKUeVmttxdxpA1/1SINzfxzwgoTvWkZP
	UjKlu1lIQbbY9YDXdOtJshWXzjUfBugIbz/OPW6NC+6WJf+WV9PZRfD4hUj2cSIcQL/8
	JQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
	by userp2120.oracle.com with ESMTP id 2t9cyqfh8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2019 02:32:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
	by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5Q2WaOO021358; Wed, 26 Jun 2019 02:32:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3030.oracle.com with ESMTP id 2t99f47112-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 26 Jun 2019 02:32:52 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5Q2WqQI021725;
	Wed, 26 Jun 2019 02:32:52 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3030.oracle.com with ESMTP id 2t99f4710w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2019 02:32:52 +0000
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5Q2Wovl012016;
	Wed, 26 Jun 2019 02:32:50 GMT
Received: from localhost (/10.159.230.235)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 25 Jun 2019 19:32:50 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
	darrick.wong@oracle.com, shaggy@kernel.org, ard.biesheuvel@linaro.org, 
	josef@toxicpanda.com, hch@infradead.org, clm@fb.com,
	adilger.kernel@dilger.ca, jk@ozlabs.org, jack@suse.com,
	dsterba@suse.com, jaegeuk@kernel.org, viro@zeniv.linux.org.uk
Date: Tue, 25 Jun 2019 19:32:47 -0700
Message-ID: <156151636789.2283456.3835262849301472968.stgit@magnolia>
In-Reply-To: <156151632209.2283456.3592379873620132456.stgit@magnolia>
References: <156151632209.2283456.3592379873620132456.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=961
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906260027
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Wed, 26 Jun 2019 02:33:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 26 Jun 2019 02:33:28 +0000 (UTC) for IP:'156.151.31.85'
	DOMAIN:'userp2120.oracle.com' HELO:'userp2120.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.85 userp2120.oracle.com 156.151.31.85
	userp2120.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	reiserfs-devel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH 5/5] vfs: only allow FSSETXATTR to set DAX
 flag on files and dirs
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 26 Jun 2019 02:36:25 +0000 (UTC)

From: Darrick J. Wong <darrick.wong@oracle.com>

The DAX flag only applies to files and directories, so don't let it get
set for other types of files.

Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
---
 fs/inode.c |    8 ++++++++
 1 file changed, 8 insertions(+)


diff --git a/fs/inode.c b/fs/inode.c
index 670d5408d022..f08711b34341 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2259,6 +2259,14 @@ int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
 	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
 		return -EINVAL;
 
+	/*
+	 * It is only valid to set the DAX flag on regular files and
+	 * directories on filesystems.
+	 */
+	if ((fa->fsx_xflags & FS_XFLAG_DAX) &&
+	    !(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode)))
+		return -EINVAL;
+
 	/* Extent size hints of zero turn off the flags. */
 	if (fa->fsx_extsize == 0)
 		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);

