Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6125AD50
	for <lists+cluster-devel@lfdr.de>; Sat, 29 Jun 2019 22:09:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37C7559440;
	Sat, 29 Jun 2019 20:09:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 614765D71D;
	Sat, 29 Jun 2019 20:09:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EDC44EBC8;
	Sat, 29 Jun 2019 20:09:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5TK98r3029711 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 29 Jun 2019 16:09:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9ABA16013D; Sat, 29 Jun 2019 20:09:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 962B96012D
	for <cluster-devel@redhat.com>; Sat, 29 Jun 2019 20:09:06 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D9653DE0D
	for <cluster-devel@redhat.com>; Sat, 29 Jun 2019 20:09:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 20195AD70;
	Sat, 29 Jun 2019 20:09:03 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id AA7D51E3F56; Sat, 29 Jun 2019 22:09:01 +0200 (CEST)
Date: Sat, 29 Jun 2019 22:09:01 +0200
From: Jan Kara <jack@suse.cz>
To: " Darrick J. Wong " <darrick.wong@oracle.com>
Message-ID: <20190629200901.GA18642@quack2.suse.cz>
References: <156174682897.1557318.14418894077683701275.stgit@magnolia>
	<156174687185.1557318.13703922197244050336.stgit@magnolia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156174687185.1557318.13703922197244050336.stgit@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Sat, 29 Jun 2019 20:09:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Sat, 29 Jun 2019 20:09:05 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'jack@suse.cz' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <jack@suse.cz>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-efi@vger.kernel.org, yuchao0@huawei.com, clm@fb.com,
	adilger.kernel@dilger.ca, ocfs2-devel@oss.oracle.com,
	linux-nilfs@vger.kernel.org, cluster-devel@redhat.com,
	linux-ext4@vger.kernel.org, matthew.garrett@nebula.com,
	josef@toxicpanda.com, reiserfs-devel@vger.kernel.org,
	viro@zeniv.linux.org.uk, David Sterba <dsterba@suse.com>,
	jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, jk@ozlabs.org,
	Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 5/5] vfs: only allow FSSETXATTR to set
 DAX flag on files and dirs
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Sat, 29 Jun 2019 20:09:28 +0000 (UTC)

On Fri 28-06-19 11:34:31,  Darrick J. Wong  wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> The DAX flag only applies to files and directories, so don't let it get
> set for other types of files.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 670d5408d022..f08711b34341 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2259,6 +2259,14 @@ int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
>  	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
>  		return -EINVAL;
>  
> +	/*
> +	 * It is only valid to set the DAX flag on regular files and
> +	 * directories on filesystems.
> +	 */
> +	if ((fa->fsx_xflags & FS_XFLAG_DAX) &&
> +	    !(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode)))
> +		return -EINVAL;
> +
>  	/* Extent size hints of zero turn off the flags. */
>  	if (fa->fsx_extsize == 0)
>  		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

