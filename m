Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BBA55E8E
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 04:33:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B855F80F7C;
	Wed, 26 Jun 2019 02:33:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFCD16085B;
	Wed, 26 Jun 2019 02:33:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 48D493D87;
	Wed, 26 Jun 2019 02:33:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5Q2X66T015128 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 22:33:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B41ED5D9C6; Wed, 26 Jun 2019 02:33:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE97E5D9C5
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 02:33:03 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 068CBC057E65
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 02:32:48 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5Q2T27N116704; Wed, 26 Jun 2019 02:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=subject : from : to :
	cc : date : message-id : mime-version : content-type :
	content-transfer-encoding; s=corp-2018-07-02;
	bh=cAdDQjLmw3paRsCYayAMtBFRH59fRNc4vYLBHuqjsSA=;
	b=fhD2ePrRwz/tNVnG2b1N2SxWwBCi3qxAJ9ScLeOvuVkLhycNeHtLXg/o3eL41275woj8
	ae1pnoc9gndxX+yPAgYKkLzMLpobHgcGQ7u78YZOh1Ap4HyoVxmhrN6K2mnHKlN0MyOd
	OhBevmeNR6hVZ8huHdvp8I/MYGLascpA2Nj3UglocjM5tT8AyX8aGLlXg9ilLp8JGPs/
	BuVhOxq4datwVQrCjXZzkXwLRSy9DeWUHsvP4OQepO7T/089VH31yaMyMT5TpZ60nQhL
	1SkoakCcrrCOOp8D6xl2gCyf9HGardzMlnRRr/ecDAzrAgD4E1/UxtQCn7f5gt8MOlS/
	Pw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 2t9brt7mhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2019 02:32:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5Q2VdiA148291; Wed, 26 Jun 2019 02:32:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 2t9acceh35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 26 Jun 2019 02:32:13 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5Q2WDPn149893;
	Wed, 26 Jun 2019 02:32:13 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3030.oracle.com with ESMTP id 2t9acceh32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2019 02:32:13 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5Q2W500019982;
	Wed, 26 Jun 2019 02:32:05 GMT
Received: from localhost (/10.159.230.235)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 25 Jun 2019 19:32:04 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
	darrick.wong@oracle.com, shaggy@kernel.org, ard.biesheuvel@linaro.org, 
	josef@toxicpanda.com, hch@infradead.org, clm@fb.com,
	adilger.kernel@dilger.ca, jk@ozlabs.org, jack@suse.com,
	dsterba@suse.com, jaegeuk@kernel.org, viro@zeniv.linux.org.uk
Date: Tue, 25 Jun 2019 19:32:02 -0700
Message-ID: <156151632209.2283456.3592379873620132456.stgit@magnolia>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=863
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906260027
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Wed, 26 Jun 2019 02:32:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Wed, 26 Jun 2019 02:32:57 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.4  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE,
	UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, linux-kernel@vger.kernel.org,
	reiserfs-devel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: [Cluster-devel] [PATCH v3 0/5] vfs: clean up SETFLAGS and
 FSSETXATTR option processing
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 26 Jun 2019 02:33:47 +0000 (UTC)

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

