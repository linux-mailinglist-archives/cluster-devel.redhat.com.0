Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D4656DDA
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 17:37:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCDB1AC2C2;
	Wed, 26 Jun 2019 15:37:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9782F5D71C;
	Wed, 26 Jun 2019 15:37:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EC301806B0E;
	Wed, 26 Jun 2019 15:37:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QFaiSB030543 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 11:36:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B0F96012E; Wed, 26 Jun 2019 15:36:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 941456012D
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 15:36:42 +0000 (UTC)
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8EC3223890
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 15:36:17 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5QFXoje151326; Wed, 26 Jun 2019 15:35:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
	h=date : from : to : cc
	: subject : message-id : references : mime-version : content-type :
	in-reply-to; s=corp-2018-07-02;
	bh=9G5PiDG0S7gskQAEA+1rG18NFPpT+WoUOG9H+94vGJo=;
	b=Mr0csDp/6gFDwuuR4WcTjSwEQhZRUvDp0wq3YeKCIR/ppK1h93X/GLwv9+Y3cvXAo/We
	nBBPCWspqpkQf8Ya9/6yEHadZ9h5/AK9JEwgQLT2OJ63YoS19u03moZ7UXD928KK75Tw
	IYGgl4G6FFtMYGPdEh6jhDWXC8Gi+dRHPoIK4U9EU9fQhY9zQayETLpTGjqGl7XpA008
	xvtm1tvTyzmAnCbVLIgcaAr+22UL4c7SemsbRVUkLI8sB/S8GoHCuFEiRRnlmAb3SWPf
	RtSXc0WG3A/565vb1OMt7fUapvm0eYSNFeeM5VPPlY8RA+hUmYz247kCS97awaKxof1X
	1A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
	by userp2130.oracle.com with ESMTP id 2t9brtb5ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2019 15:35:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
	by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id
	x5QFZWnl185666; Wed, 26 Jun 2019 15:35:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by aserp3030.oracle.com with ESMTP id 2t9accs0fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 26 Jun 2019 15:35:48 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
	by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x5QFZlgQ186348;
	Wed, 26 Jun 2019 15:35:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3030.oracle.com with ESMTP id 2t9accs0fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2019 15:35:47 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5QFZjvI031893;
	Wed, 26 Jun 2019 15:35:45 GMT
Received: from localhost (/10.159.137.246)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 26 Jun 2019 08:35:45 -0700
Date: Wed, 26 Jun 2019 08:35:42 -0700
From: "Darrick J. Wong" <darrick.wong@oracle.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20190626153542.GE5171@magnolia>
References: <156151632209.2283456.3592379873620132456.stgit@magnolia>
	<156151633829.2283456.834142172527987802.stgit@magnolia>
	<20190626041133.GB32272@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626041133.GB32272@ZenIV.linux.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9299
	signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
	adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
	definitions=main-1906260182
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.39]); Wed, 26 Jun 2019 15:36:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Wed, 26 Jun 2019 15:36:28 +0000 (UTC) for IP:'156.151.31.86'
	DOMAIN:'userp2130.oracle.com' HELO:'userp2130.oracle.com'
	FROM:'darrick.wong@oracle.com' RCPT:''
X-RedHat-Spam-Score: -102.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_PASS, SPF_NONE, UNPARSEABLE_RELAY,
	USER_IN_WHITELIST) 156.151.31.86 userp2130.oracle.com 156.151.31.86
	userp2130.oracle.com <darrick.wong@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-btrfs@vger.kernel.org, yuchao0@huawei.com, clm@fb.com,
	adilger.kernel@dilger.ca, matthew.garrett@nebula.com,
	linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
	linux-ext4@vger.kernel.org, josef@toxicpanda.com,
	reiserfs-devel@vger.kernel.org, dsterba@suse.com,
	jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
	linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 2/5] vfs: create a generic checking
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 26 Jun 2019 15:37:45 +0000 (UTC)

On Wed, Jun 26, 2019 at 05:11:33AM +0100, Al Viro wrote:
> On Tue, Jun 25, 2019 at 07:32:18PM -0700, Darrick J. Wong wrote:
> > --- a/fs/btrfs/ioctl.c
> > +++ b/fs/btrfs/ioctl.c
> > @@ -373,10 +373,9 @@ static int check_xflags(unsigned int flags)
> >  static int btrfs_ioctl_fsgetxattr(struct file *file, void __user *arg)
> >  {
> >  	struct btrfs_inode *binode = BTRFS_I(file_inode(file));
> > -	struct fsxattr fa;
> > -
> > -	memset(&fa, 0, sizeof(fa));
> > -	fa.fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags);
> > +	struct fsxattr fa = {
> > +		.fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags),
> > +	};
> 
> Umm...  Sure, there's no padding, but still - you are going to copy that thing
> to userland...  How about
> 
> static inline void simple_fill_fsxattr(struct fsxattr *fa, unsigned xflags)
> {
> 	memset(fa, 0, sizeof(*fa));
> 	fa->fsx_xflags = xflags;
> }
> 
> and let the compiler optimize the crap out?

The v2 series used to do that, but Christoph complained that having a
helper for a two-line memset and initialization was silly[1] so now we
have this version.

I don't mind reinstating it as a static inline helper, but I'd like some
input from any of the btrfs developers (or you, Al) about which form is
preferred.

--D

[1] https://lkml.org/lkml/2019/6/25/533

