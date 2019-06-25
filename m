Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 898E45556A
	for <lists+cluster-devel@lfdr.de>; Tue, 25 Jun 2019 19:05:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD85E30024AD;
	Tue, 25 Jun 2019 17:05:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F82E5D9C5;
	Tue, 25 Jun 2019 17:05:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E94061806B16;
	Tue, 25 Jun 2019 17:04:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PH2K9h027606 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 13:02:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B6ED1608D0; Tue, 25 Jun 2019 17:02:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF959608CA
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 17:02:17 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4747D30C319D
	for <cluster-devel@redhat.com>; Tue, 25 Jun 2019 17:02:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 75B9FAF7A;
	Tue, 25 Jun 2019 17:02:04 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id DA730DA8F6; Tue, 25 Jun 2019 19:02:48 +0200 (CEST)
Date: Tue, 25 Jun 2019 19:02:48 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20190625170248.GS8917@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz, Christoph Hellwig <hch@infradead.org>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
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
References: <156116136742.1664814.17093419199766834123.stgit@magnolia>
	<156116138952.1664814.16552129914959122837.stgit@magnolia>
	<20190625105725.GB26085@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625105725.GB26085@infradead.org>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Tue, 25 Jun 2019 17:02:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Tue, 25 Jun 2019 17:02:06 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'dsterba@suse.cz'
	RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <dsterba@suse.cz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-btrfs@vger.kernel.org, yuchao0@huawei.com, clm@fb.com,
	adilger.kernel@dilger.ca, matthew.garrett@nebula.com,
	linux-nilfs@vger.kernel.org, "Darrick J. Wong" <darrick.wong@oracle.com>,
	cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
	josef@toxicpanda.com, reiserfs-devel@vger.kernel.org,
	viro@zeniv.linux.org.uk, dsterba@suse.com, jaegeuk@kernel.org,
	tytso@mit.edu, ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
	linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 2/4] vfs: create a generic checking
 function for FS_IOC_FSSETXATTR
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
Reply-To: dsterba@suse.cz
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 25 Jun 2019 17:05:24 +0000 (UTC)

On Tue, Jun 25, 2019 at 03:57:25AM -0700, Christoph Hellwig wrote:
> On Fri, Jun 21, 2019 at 04:56:29PM -0700, Darrick J. Wong wrote:
> > From: Darrick J. Wong <darrick.wong@oracle.com>
> > 
> > Create a generic checking function for the incoming FS_IOC_FSSETXATTR
> > fsxattr values so that we can standardize some of the implementation
> > behaviors.
> > 
> > Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> > Reviewed-by: Jan Kara <jack@suse.cz>
> > ---
> >  fs/btrfs/ioctl.c   |   21 +++++++++-------
> >  fs/ext4/ioctl.c    |   27 ++++++++++++++------
> >  fs/f2fs/file.c     |   26 ++++++++++++++-----
> >  fs/inode.c         |   17 +++++++++++++
> >  fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++++++++++----------------------
> >  include/linux/fs.h |    3 ++
> >  6 files changed, 111 insertions(+), 53 deletions(-)
> > 
> > 
> > diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> > index f408aa93b0cf..7ddda5b4b6a6 100644
> > --- a/fs/btrfs/ioctl.c
> > +++ b/fs/btrfs/ioctl.c
> > @@ -366,6 +366,13 @@ static int check_xflags(unsigned int flags)
> >  	return 0;
> >  }
> >  
> > +static void __btrfs_ioctl_fsgetxattr(struct btrfs_inode *binode,
> > +				     struct fsxattr *fa)
> > +{
> > +	memset(fa, 0, sizeof(*fa));
> > +	fa->fsx_xflags = btrfs_inode_flags_to_xflags(binode->flags);
> 
> Is there really much of a point in this helper? Epeciall as
> the zeroing could easily be done in the variable declaration
> line using
> 
> 	struct fsxattr fa = { };

Agreed, not counting the initialization the wrapper is merely another
name for btrfs_inode_flags_to_xflags. I also find it slightly confusing
that __btrfs_ioctl_fsgetxattr name is too close to the ioctl callback
implementation btrfs_ioctl_fsgetxattr but only does some initialization.

