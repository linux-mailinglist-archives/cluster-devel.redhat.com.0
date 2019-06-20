Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F564CF5A
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Jun 2019 15:47:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2553630860A6;
	Thu, 20 Jun 2019 13:47:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A702F5C1A1;
	Thu, 20 Jun 2019 13:47:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E4E7206D3;
	Thu, 20 Jun 2019 13:47:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KDkquZ000439 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 09:46:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 742525D9E5; Thu, 20 Jun 2019 13:46:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EB305D9D2
	for <cluster-devel@redhat.com>; Thu, 20 Jun 2019 13:46:50 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BAFA3092650
	for <cluster-devel@redhat.com>; Thu, 20 Jun 2019 13:46:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id CAA66AE2C;
	Thu, 20 Jun 2019 13:46:37 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 504A11E434F; Thu, 20 Jun 2019 15:46:37 +0200 (CEST)
Date: Thu, 20 Jun 2019 15:46:37 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190620134637.GG30243@quack2.suse.cz>
References: <156022833285.3227089.11990489625041926920.stgit@magnolia>
	<156022836522.3227089.4353401791178719941.stgit@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156022836522.3227089.4353401791178719941.stgit@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Thu, 20 Jun 2019 13:46:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Thu, 20 Jun 2019 13:46:39 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'jack@suse.cz' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <jack@suse.cz>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org,
	yuchao0@huawei.com, clm@fb.com, adilger.kernel@dilger.ca,
	matthew.garrett@nebula.com, linux-nilfs@vger.kernel.org,
	cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
	josef@toxicpanda.com, reiserfs-devel@vger.kernel.org,
	viro@zeniv.linux.org.uk, dsterba@suse.com, jaegeuk@kernel.org,
	tytso@mit.edu, ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
	linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 4/4] vfs: teach vfs_ioc_fssetxattr_check
 to check extent size hints
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 20 Jun 2019 13:47:24 +0000 (UTC)

On Mon 10-06-19 21:46:05, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> Move the extent size hint checks that aren't xfs-specific to the vfs.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c         |   18 +++++++++++++
>  fs/xfs/xfs_ioctl.c |   70 ++++++++++++++++++++++------------------------------
>  2 files changed, 47 insertions(+), 41 deletions(-)
> 
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 40ecd3a6a188..a3757051fd55 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2214,6 +2214,24 @@ int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
>  			return -EINVAL;
>  	}
>  
> +	/* Check extent size hints. */
> +	if ((fa->fsx_xflags & FS_XFLAG_EXTSIZE) && !S_ISREG(inode->i_mode))
> +		return -EINVAL;
> +
> +	if ((fa->fsx_xflags & FS_XFLAG_EXTSZINHERIT) &&
> +			!S_ISDIR(inode->i_mode))
> +		return -EINVAL;
> +
> +	if ((fa->fsx_xflags & FS_XFLAG_COWEXTSIZE) &&
> +	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
> +		return -EINVAL;
> +
> +	/* Extent size hints of zero turn off the flags. */
> +	if (fa->fsx_extsize == 0)
> +		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
> +	if (fa->fsx_cowextsize == 0)
> +		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL(vfs_ioc_fssetxattr_check);
> diff --git a/fs/xfs/xfs_ioctl.c b/fs/xfs/xfs_ioctl.c
> index 82961de98900..b494e7e881e3 100644
> --- a/fs/xfs/xfs_ioctl.c
> +++ b/fs/xfs/xfs_ioctl.c
> @@ -1201,39 +1201,31 @@ xfs_ioctl_setattr_check_extsize(
>  	struct fsxattr		*fa)
>  {
>  	struct xfs_mount	*mp = ip->i_mount;
> -
> -	if ((fa->fsx_xflags & FS_XFLAG_EXTSIZE) && !S_ISREG(VFS_I(ip)->i_mode))
> -		return -EINVAL;
> -
> -	if ((fa->fsx_xflags & FS_XFLAG_EXTSZINHERIT) &&
> -	    !S_ISDIR(VFS_I(ip)->i_mode))
> -		return -EINVAL;
> +	xfs_extlen_t		size;
> +	xfs_fsblock_t		extsize_fsb;
>  
>  	if (S_ISREG(VFS_I(ip)->i_mode) && ip->i_d.di_nextents &&
>  	    ((ip->i_d.di_extsize << mp->m_sb.sb_blocklog) != fa->fsx_extsize))
>  		return -EINVAL;
>  
> -	if (fa->fsx_extsize != 0) {
> -		xfs_extlen_t    size;
> -		xfs_fsblock_t   extsize_fsb;
> -
> -		extsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_extsize);
> -		if (extsize_fsb > MAXEXTLEN)
> -			return -EINVAL;
> +	if (fa->fsx_extsize == 0)
> +		return 0;
>  
> -		if (XFS_IS_REALTIME_INODE(ip) ||
> -		    (fa->fsx_xflags & FS_XFLAG_REALTIME)) {
> -			size = mp->m_sb.sb_rextsize << mp->m_sb.sb_blocklog;
> -		} else {
> -			size = mp->m_sb.sb_blocksize;
> -			if (extsize_fsb > mp->m_sb.sb_agblocks / 2)
> -				return -EINVAL;
> -		}
> +	extsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_extsize);
> +	if (extsize_fsb > MAXEXTLEN)
> +		return -EINVAL;
>  
> -		if (fa->fsx_extsize % size)
> +	if (XFS_IS_REALTIME_INODE(ip) ||
> +	    (fa->fsx_xflags & FS_XFLAG_REALTIME)) {
> +		size = mp->m_sb.sb_rextsize << mp->m_sb.sb_blocklog;
> +	} else {
> +		size = mp->m_sb.sb_blocksize;
> +		if (extsize_fsb > mp->m_sb.sb_agblocks / 2)
>  			return -EINVAL;
> -	} else
> -		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
> +	}
> +
> +	if (fa->fsx_extsize % size)
> +		return -EINVAL;
>  
>  	return 0;
>  }
> @@ -1259,6 +1251,8 @@ xfs_ioctl_setattr_check_cowextsize(
>  	struct fsxattr		*fa)
>  {
>  	struct xfs_mount	*mp = ip->i_mount;
> +	xfs_extlen_t		size;
> +	xfs_fsblock_t		cowextsize_fsb;
>  
>  	if (!(fa->fsx_xflags & FS_XFLAG_COWEXTSIZE))
>  		return 0;
> @@ -1267,25 +1261,19 @@ xfs_ioctl_setattr_check_cowextsize(
>  	    ip->i_d.di_version != 3)
>  		return -EINVAL;
>  
> -	if (!S_ISREG(VFS_I(ip)->i_mode) && !S_ISDIR(VFS_I(ip)->i_mode))
> -		return -EINVAL;
> -
> -	if (fa->fsx_cowextsize != 0) {
> -		xfs_extlen_t    size;
> -		xfs_fsblock_t   cowextsize_fsb;
> +	if (fa->fsx_cowextsize == 0)
> +		return 0;
>  
> -		cowextsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_cowextsize);
> -		if (cowextsize_fsb > MAXEXTLEN)
> -			return -EINVAL;
> +	cowextsize_fsb = XFS_B_TO_FSB(mp, fa->fsx_cowextsize);
> +	if (cowextsize_fsb > MAXEXTLEN)
> +		return -EINVAL;
>  
> -		size = mp->m_sb.sb_blocksize;
> -		if (cowextsize_fsb > mp->m_sb.sb_agblocks / 2)
> -			return -EINVAL;
> +	size = mp->m_sb.sb_blocksize;
> +	if (cowextsize_fsb > mp->m_sb.sb_agblocks / 2)
> +		return -EINVAL;
>  
> -		if (fa->fsx_cowextsize % size)
> -			return -EINVAL;
> -	} else
> -		fa->fsx_xflags &= ~FS_XFLAG_COWEXTSIZE;
> +	if (fa->fsx_cowextsize % size)
> +		return -EINVAL;
>  
>  	return 0;
>  }
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

