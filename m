Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E722555C3
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jun 2019 19:19:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA6013003E61;
	Tue, 25 Jun 2019 17:19:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FD2F5C237;
	Tue, 25 Jun 2019 17:19:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2DB54206D1;
	Tue, 25 Jun 2019 17:18:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PHHvDa019431 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 13:17:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5309E5D9DE; Tue, 25 Jun 2019 17:17:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CC6C5D9D6
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 17:17:54 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E14143082E6A
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 17:17:12 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5PHDjnK112356; Tue, 25 Jun 2019 17:16:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to :
	subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=8YOHqT1H5m87NYapYKi5uOloFdOjAQsayzwyn6FBGsU=;
	b=kRLzMzcD4dDTxKKrIatPNQ8UbCC6dJVjee0v4WI+ASaqAGwEtXxAYgVRxpW7bi2F0kdN
	+8BkhOTIe/oZhPnAYc1tUS8V4kAmfxQ6VRRo827Ml89rmcehwrL0IvipIkWsyxIORYzM
	dFZwu3TFJ2jAetMYP79ISwOmGkO6y3D31aAPNJXhXBih2Gr5GYQy3VEltfIlToeYcYTA
	OPEtp5J5s9kqXfLt+XUPAuzKiT8ERVsbjZlleEopgqvRqrrBmDlDLaWMStCqCoAydaCU
	P+tj3IggCOnLZs/3nlNDQyjq5pVdz1NFvQtV5k0sEbhsON1T5kYdVRGZQlOdlAbybMLW
	JQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 2t9brt5t2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2019 17:16:24 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5PHFVC3141059; Tue, 25 Jun 2019 17:16:23 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 2t9acc7vvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 25 Jun 2019 17:16:23 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5PHGMB9143216;
	Tue, 25 Jun 2019 17:16:22 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3030.oracle.com with ESMTP id 2t9acc7vvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2019 17:16:22 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5PHGJxo007776;
	Tue, 25 Jun 2019 17:16:19 GMT
Received: from localhost (/67.169.218.210)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 25 Jun 2019 10:16:19 -0700
Date: Tue, 25 Jun 2019 10:16:16 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: dsterba@suse.cz, Christoph Hellwig <hch@infradead.org>,
	matthew.garrett@nebula.com, yuchao0@huawei.com, tytso@mit.edu,
	shaggy@kernel.org, ard.biesheuvel@linaro.org, josef@toxicpanda.com,
	clm@fb.com, adilger.kernel@dilger.ca, jk@ozlabs.org, jack@suse.com,
	dsterba@suse.com, jaegeuk@kernel.org, viro@zeniv.linux.org.uk,
	cluster-devel@redhat.com, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
	reiserfs-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Message-ID: <20190625171616.GB2230847@magnolia>
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
	<156116138952.1664814.16552129914959122837.stgit@magnolia>
	<20190625105725.GB26085@infradead.org>
	<20190625170248.GS8917@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625170248.GS8917@twin.jikos.cz>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906250130
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Tue, 25 Jun 2019 17:17:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Tue, 25 Jun 2019 17:17:44 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -100.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, SPF_NONE, UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 2/4] vfs: create a generic checking
 function for FS_IOC_FSSETXATTR
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Tue, 25 Jun 2019 17:19:44 +0000 (UTC)

On Tue, Jun 25, 2019 at 07:02:48PM +0200, David Sterba wrote:
> On Tue, Jun 25, 2019 at 03:57:25AM -0700, Christoph Hellwig wrote:
> > On Fri, Jun 21, 2019 at 04:56:29PM -0700, Darrick J. Wong wrote:
> > > From: Darrick J. Wong <darrick.wong@oracle.com>
> > > 
> > > Create a generic checking function for the incoming FS_IOC_FSSETXATTR
> > > fsxattr values so that we can standardize some of the implementation
> > > behaviors.
> > > 
> > > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > > Reviewed-by: Jan Kara <jack@suse.cz>
> > > ---
> > >  fs/btrfs/ioctl.c   |   21 +++++++++-------
> > >  fs/ext4/ioctl.c    |   27 ++++++++++++++------
> > >  fs/f2fs/file.c     |   26 ++++++++++++++-----
> > >  fs/inode.c         |   17 +++++++++++++
> > >  fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++++++++++----------------------
> > >  include/linux/fs.h |    3 ++
> > >  6 files changed, 111 insertions(+), 53 deletions(-)
> > > 
> > > 
> > > diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> > > index f408aa93b0cf..7ddda5b4b6a6 100644
> > > --- a/fs/btrfs/ioctl.c
> > > +++ b/fs/btrfs/ioctl.c
> > > @@ -366,6 +366,13 @@ static int check_xflags(unsigned int flags)
> > >  	return 0;
> > >  }
> > >  
> > > +static void __btrfs_ioctl_fsgetxattr(struct btrfs_inode *binode,
> > > +				     struct fsxattr *fa)
> > > +{
> > > +	memset(fa, 0, sizeof(*fa));
> > > +	fa->fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags);
> > 
> > Is there really much of a point in this helper? Epeciall as
> > the zeroing could easily be done in the variable declaration
> > line using
> > 
> > 	struct fsxattr fa = { };
> 
> Agreed, not counting the initialization the wrapper is merely another
> name for btrfs_inode_flags_to_xflags. I also find it slightly confusing
> that __btrfs_ioctl_fsgetxattr name is too close to the ioctl callback
> implementation btrfs_ioctl_fsgetxattr but only does some initialization.

Ok; it's easily enough changed to:

	struct fsxattr old_fa = {
		.fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags),
	};

--D

