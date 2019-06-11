Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D32F13C2AF
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Jun 2019 06:47:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1C67307D91F;
	Tue, 11 Jun 2019 04:47:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD9865D721;
	Tue, 11 Jun 2019 04:47:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E78154D3D;
	Tue, 11 Jun 2019 04:47:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5B4kpMk002361 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 Jun 2019 00:46:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9049119C78; Tue, 11 Jun 2019 04:46:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B46F19C70
	for <cluster-devel@redhat.com>; Tue, 11 Jun 2019 04:46:49 +0000 (UTC)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4FA7458E33
	for <cluster-devel@redhat.com>; Tue, 11 Jun 2019 04:46:22 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
	by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5B4hc6d179818; Tue, 11 Jun 2019 04:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : from : to :
	cc : date : message-id : mime-version : content-type :
	content-transfer-encoding; s=corp-2018-07-02;
	bh=cAdDQjLmw3paRsCYayAMtBFRH59fRNc4vYLBHuqjsSA=;
	b=AnqW+epX9OYHOzw5sTwOrIxO7AnaE4zZ8lKJiAKmrhvGxrpd3f8wxkkZBflgbEq1sOzY
	KV9eHWtYAaDLZEqtrf3ZJguDUBlZ5gkFNbVMpa3eMHo3FyTTFKbmVm7G73D6lbw7s1dS
	5J0Lk/d+rVXhiXXKr/mH872REZ1FpGGZjopVCJKDYW2v1wPRflHiayy7E/k6yaqVysXu
	pMLLiLZptpvWSoeeq4y3wkBrabcsyoDe44zUwkjmFZpE9J0c9WugSVczTNIfBX8CJsY6
	ZMZfEBndl9+QIq5/p+cyhxYC9prtn2PzyyKr32uqZ/hzXp9SjaAVfhiNdQ0vX/gWicFf
	oA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by aserp2130.oracle.com with ESMTP id 2t02hejre6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jun 2019 04:45:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5B4il0Y048614; Tue, 11 Jun 2019 04:45:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by userp3020.oracle.com with ESMTP id 2t1jph7wm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 11 Jun 2019 04:45:43 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5B4jhlt050428;
	Tue, 11 Jun 2019 04:45:43 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by userp3020.oracle.com with ESMTP id 2t1jph7wm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jun 2019 04:45:43 +0000
Received: from abhmp0022.oracle.com (abhmp0022.oracle.com [141.146.116.28])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5B4jZLV002246;
	Tue, 11 Jun 2019 04:45:36 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 10 Jun 2019 21:45:35 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
	darrick.wong@oracle.com, shaggy@kernel.org, ard.biesheuvel@linaro.org, 
	josef@toxicpanda.com, clm@fb.com, adilger.kernel@dilger.ca,
	jk@ozlabs.org, jack@suse.com, dsterba@suse.com, jaegeuk@kernel.org,
	viro@zeniv.linux.org.uk
Date: Mon, 10 Jun 2019 21:45:32 -0700
Message-ID: <156022833285.3227089.11990489625041926920.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=864
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906110033
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Tue, 11 Jun 2019 04:46:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Tue, 11 Jun 2019 04:46:32 +0000 (UTC) for IP:'141.146.126.79'
	DOMAIN:'aserp2130.oracle.com' HELO:'aserp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.409  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE, T_DKIMWL_WL_HIGH,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 141.146.126.79 aserp2130.oracle.com 141.146.126.79
	aserp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	reiserfs-devel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH 0/4] vfs: clean up SETFLAGS and FSSETXATTR
	option processing
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 11 Jun 2019 04:47:37 +0000 (UTC)

Hi all,

The FS_IOC_SETFLAGS and FS_IOC_FSSETXATTR ioctls were promoted from ext4
and XFS, respectively, into the VFS.  However, we didn't promote any of
the parameter checking code from those filesystems, which lead to a mess
where each filesystem open-codes whatever parameter checks they want and
the behavior across filesystems is no longer consistent.

Therefore, create some generic checking functions in the VFS and remove
all the open-coded pieces in each filesystem.  This preserves the
current behavior where a filesystem can choose to ignore fields it
doesn't understand.

If you're going to start using this mess, you probably ought to just
pull from my git trees, which are linked below.

This has been lightly tested with fstests.  Enjoy!
Comments and questions are, as always, welcome.

--D

kernel git tree:
https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git/log/?h=file-ioctl-cleanups

