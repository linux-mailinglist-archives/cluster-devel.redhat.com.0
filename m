Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 757A6749CC3
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Jul 2023 14:54:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688648076;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=cyRNkRr4x2S0cotxCG+Bajl7f74yxmpWi2w7F2ZKRmw=;
	b=AIA3+TuoMC61yau/Dr1QffCaWpYLYDhwoQemlXvbgnEY3yBNWXb8592HELio3lJCIp/ncO
	P5YyaB6TvKlJXaeZ4aLDeVOQuGiQg3ZfY9sSLh5ssjvVJNibpLwo+Vp8FUu/C3n1spBzYu
	eHW1PqV8b5dyz1yP+knZ+fAghdcam0g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-bphpb3kLPeWBZdRi7eMbnQ-1; Thu, 06 Jul 2023 08:54:33 -0400
X-MC-Unique: bphpb3kLPeWBZdRi7eMbnQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2635738149BD;
	Thu,  6 Jul 2023 12:54:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE7374CD0C8;
	Thu,  6 Jul 2023 12:54:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6EBE819465A0;
	Thu,  6 Jul 2023 12:54:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 70F1E1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  6 Jul 2023 12:54:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 392DCF5CE3; Thu,  6 Jul 2023 12:54:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31A09F5CFB
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 12:54:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 092CB29DD984
 for <cluster-devel@redhat.com>; Thu,  6 Jul 2023 12:54:28 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-157-VeduWygjN_implZ7He8mvQ-1; Thu,
 06 Jul 2023 08:54:24 -0400
X-MC-Unique: VeduWygjN_implZ7He8mvQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C55B41FE7B;
 Thu,  6 Jul 2023 12:54:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B35DC138FC;
 Thu,  6 Jul 2023 12:54:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Wzy3K365pmSARQAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 06 Jul 2023 12:54:22 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 3C75FA0707; Thu,  6 Jul 2023 14:54:22 +0200 (CEST)
Date: Thu, 6 Jul 2023 14:54:22 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230706125422.iavvye2tervqsezp@quack3>
References: <20230705185755.579053-1-jlayton@kernel.org>
 <20230705190309.579783-1-jlayton@kernel.org>
 <20230705190309.579783-45-jlayton@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230705190309.579783-45-jlayton@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v2 47/92] gfs2: convert to ctime
 accessor functions
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.cz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 05-07-23 15:01:12, Jeff Layton wrote:
> In later patches, we're going to change how the inode's ctime field is
> used. Switch to using accessor functions instead of raw accesses of
> inode->i_ctime.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/gfs2/acl.c   |  2 +-
>  fs/gfs2/bmap.c  | 11 +++++------
>  fs/gfs2/dir.c   | 15 ++++++++-------
>  fs/gfs2/file.c  |  2 +-
>  fs/gfs2/glops.c |  4 ++--
>  fs/gfs2/inode.c |  8 ++++----
>  fs/gfs2/super.c |  4 ++--
>  fs/gfs2/xattr.c |  8 ++++----
>  8 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/gfs2/acl.c b/fs/gfs2/acl.c
> index a392aa0f041d..443640e6fb9c 100644
> --- a/fs/gfs2/acl.c
> +++ b/fs/gfs2/acl.c
> @@ -142,7 +142,7 @@ int gfs2_set_acl(struct mnt_idmap *idmap, struct dentry *dentry,
>  
>  	ret = __gfs2_set_acl(inode, acl, type);
>  	if (!ret && mode != inode->i_mode) {
> -		inode->i_ctime = current_time(inode);
> +		inode_set_ctime_current(inode);
>  		inode->i_mode = mode;
>  		mark_inode_dirty(inode);
>  	}
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index 8d611fbcf0bd..45ea63f7167d 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -1386,7 +1386,7 @@ static int trunc_start(struct inode *inode, u64 newsize)
>  		ip->i_diskflags |= GFS2_DIF_TRUNC_IN_PROG;
>  
>  	i_size_write(inode, newsize);
> -	ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
> +	ip->i_inode.i_mtime = inode_set_ctime_current(&ip->i_inode);
>  	gfs2_dinode_out(ip, dibh->b_data);
>  
>  	if (journaled)
> @@ -1583,8 +1583,7 @@ static int sweep_bh_for_rgrps(struct gfs2_inode *ip, struct gfs2_holder *rd_gh,
>  
>  			/* Every transaction boundary, we rewrite the dinode
>  			   to keep its di_blocks current in case of failure. */
> -			ip->i_inode.i_mtime = ip->i_inode.i_ctime =
> -				current_time(&ip->i_inode);
> +			ip->i_inode.i_mtime = inode_set_ctime_current(&ip->i_inode);
>  			gfs2_trans_add_meta(ip->i_gl, dibh);
>  			gfs2_dinode_out(ip, dibh->b_data);
>  			brelse(dibh);
> @@ -1950,7 +1949,7 @@ static int punch_hole(struct gfs2_inode *ip, u64 offset, u64 length)
>  		gfs2_statfs_change(sdp, 0, +btotal, 0);
>  		gfs2_quota_change(ip, -(s64)btotal, ip->i_inode.i_uid,
>  				  ip->i_inode.i_gid);
> -		ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
> +		ip->i_inode.i_mtime = inode_set_ctime_current(&ip->i_inode);
>  		gfs2_trans_add_meta(ip->i_gl, dibh);
>  		gfs2_dinode_out(ip, dibh->b_data);
>  		up_write(&ip->i_rw_mutex);
> @@ -1993,7 +1992,7 @@ static int trunc_end(struct gfs2_inode *ip)
>  		gfs2_buffer_clear_tail(dibh, sizeof(struct gfs2_dinode));
>  		gfs2_ordered_del_inode(ip);
>  	}
> -	ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
> +	ip->i_inode.i_mtime = inode_set_ctime_current(&ip->i_inode);
>  	ip->i_diskflags &= ~GFS2_DIF_TRUNC_IN_PROG;
>  
>  	gfs2_trans_add_meta(ip->i_gl, dibh);
> @@ -2094,7 +2093,7 @@ static int do_grow(struct inode *inode, u64 size)
>  		goto do_end_trans;
>  
>  	truncate_setsize(inode, size);
> -	ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
> +	ip->i_inode.i_mtime = inode_set_ctime_current(&ip->i_inode);
>  	gfs2_trans_add_meta(ip->i_gl, dibh);
>  	gfs2_dinode_out(ip, dibh->b_data);
>  	brelse(dibh);
> diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
> index 54a6d17b8c25..1a2afa88f8be 100644
> --- a/fs/gfs2/dir.c
> +++ b/fs/gfs2/dir.c
> @@ -130,7 +130,7 @@ static int gfs2_dir_write_stuffed(struct gfs2_inode *ip, const char *buf,
>  	memcpy(dibh->b_data + offset + sizeof(struct gfs2_dinode), buf, size);
>  	if (ip->i_inode.i_size < offset + size)
>  		i_size_write(&ip->i_inode, offset + size);
> -	ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
> +	ip->i_inode.i_mtime = inode_set_ctime_current(&ip->i_inode);
>  	gfs2_dinode_out(ip, dibh->b_data);
>  
>  	brelse(dibh);
> @@ -227,7 +227,7 @@ static int gfs2_dir_write_data(struct gfs2_inode *ip, const char *buf,
>  
>  	if (ip->i_inode.i_size < offset + copied)
>  		i_size_write(&ip->i_inode, offset + copied);
> -	ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
> +	ip->i_inode.i_mtime = inode_set_ctime_current(&ip->i_inode);
>  
>  	gfs2_trans_add_meta(ip->i_gl, dibh);
>  	gfs2_dinode_out(ip, dibh->b_data);
> @@ -1814,7 +1814,7 @@ int gfs2_dir_add(struct inode *inode, const struct qstr *name,
>  			gfs2_inum_out(nip, dent);
>  			dent->de_type = cpu_to_be16(IF2DT(nip->i_inode.i_mode));
>  			dent->de_rahead = cpu_to_be16(gfs2_inode_ra_len(nip));
> -			tv = current_time(&ip->i_inode);
> +			tv = inode_set_ctime_current(&ip->i_inode);
>  			if (ip->i_diskflags & GFS2_DIF_EXHASH) {
>  				leaf = (struct gfs2_leaf *)bh->b_data;
>  				be16_add_cpu(&leaf->lf_entries, 1);
> @@ -1825,7 +1825,7 @@ int gfs2_dir_add(struct inode *inode, const struct qstr *name,
>  			da->bh = NULL;
>  			brelse(bh);
>  			ip->i_entries++;
> -			ip->i_inode.i_mtime = ip->i_inode.i_ctime = tv;
> +			ip->i_inode.i_mtime = tv;
>  			if (S_ISDIR(nip->i_inode.i_mode))
>  				inc_nlink(&ip->i_inode);
>  			mark_inode_dirty(inode);
> @@ -1876,7 +1876,7 @@ int gfs2_dir_del(struct gfs2_inode *dip, const struct dentry *dentry)
>  	const struct qstr *name = &dentry->d_name;
>  	struct gfs2_dirent *dent, *prev = NULL;
>  	struct buffer_head *bh;
> -	struct timespec64 tv = current_time(&dip->i_inode);
> +	struct timespec64 tv;
>  
>  	/* Returns _either_ the entry (if its first in block) or the
>  	   previous entry otherwise */
> @@ -1896,6 +1896,7 @@ int gfs2_dir_del(struct gfs2_inode *dip, const struct dentry *dentry)
>  	}
>  
>  	dirent_del(dip, bh, prev, dent);
> +	tv = inode_set_ctime_current(&dip->i_inode);
>  	if (dip->i_diskflags & GFS2_DIF_EXHASH) {
>  		struct gfs2_leaf *leaf = (struct gfs2_leaf *)bh->b_data;
>  		u16 entries = be16_to_cpu(leaf->lf_entries);
> @@ -1910,7 +1911,7 @@ int gfs2_dir_del(struct gfs2_inode *dip, const struct dentry *dentry)
>  	if (!dip->i_entries)
>  		gfs2_consist_inode(dip);
>  	dip->i_entries--;
> -	dip->i_inode.i_mtime = dip->i_inode.i_ctime = tv;
> +	dip->i_inode.i_mtime =  tv;
>  	if (d_is_dir(dentry))
>  		drop_nlink(&dip->i_inode);
>  	mark_inode_dirty(&dip->i_inode);
> @@ -1951,7 +1952,7 @@ int gfs2_dir_mvino(struct gfs2_inode *dip, const struct qstr *filename,
>  	dent->de_type = cpu_to_be16(new_type);
>  	brelse(bh);
>  
> -	dip->i_inode.i_mtime = dip->i_inode.i_ctime = current_time(&dip->i_inode);
> +	dip->i_inode.i_mtime = inode_set_ctime_current(&dip->i_inode);
>  	mark_inode_dirty_sync(&dip->i_inode);
>  	return 0;
>  }
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index 1bf3c4453516..ecbfbc6df621 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -260,7 +260,7 @@ static int do_gfs2_set_flags(struct inode *inode, u32 reqflags, u32 mask)
>  	error = gfs2_meta_inode_buffer(ip, &bh);
>  	if (error)
>  		goto out_trans_end;
> -	inode->i_ctime = current_time(inode);
> +	inode_set_ctime_current(inode);
>  	gfs2_trans_add_meta(ip->i_gl, bh);
>  	ip->i_diskflags = new_flags;
>  	gfs2_dinode_out(ip, bh->b_data);
> diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
> index 54319328b16b..aecdac3cfbe1 100644
> --- a/fs/gfs2/glops.c
> +++ b/fs/gfs2/glops.c
> @@ -437,8 +437,8 @@ static int gfs2_dinode_in(struct gfs2_inode *ip, const void *buf)
>  		inode->i_atime = atime;
>  	inode->i_mtime.tv_sec = be64_to_cpu(str->di_mtime);
>  	inode->i_mtime.tv_nsec = be32_to_cpu(str->di_mtime_nsec);
> -	inode->i_ctime.tv_sec = be64_to_cpu(str->di_ctime);
> -	inode->i_ctime.tv_nsec = be32_to_cpu(str->di_ctime_nsec);
> +	inode_set_ctime(inode, be64_to_cpu(str->di_ctime),
> +			be32_to_cpu(str->di_ctime_nsec));
>  
>  	ip->i_goal = be64_to_cpu(str->di_goal_meta);
>  	ip->i_generation = be64_to_cpu(str->di_generation);
> diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
> index 17c994a0c0d0..2ded6c813f20 100644
> --- a/fs/gfs2/inode.c
> +++ b/fs/gfs2/inode.c
> @@ -690,7 +690,7 @@ static int gfs2_create_inode(struct inode *dir, struct dentry *dentry,
>  	set_nlink(inode, S_ISDIR(mode) ? 2 : 1);
>  	inode->i_rdev = dev;
>  	inode->i_size = size;
> -	inode->i_atime = inode->i_mtime = inode->i_ctime = current_time(inode);
> +	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
>  	munge_mode_uid_gid(dip, inode);
>  	check_and_update_goal(dip);
>  	ip->i_goal = dip->i_goal;
> @@ -1029,7 +1029,7 @@ static int gfs2_link(struct dentry *old_dentry, struct inode *dir,
>  
>  	gfs2_trans_add_meta(ip->i_gl, dibh);
>  	inc_nlink(&ip->i_inode);
> -	ip->i_inode.i_ctime = current_time(&ip->i_inode);
> +	inode_set_ctime_current(&ip->i_inode);
>  	ihold(inode);
>  	d_instantiate(dentry, inode);
>  	mark_inode_dirty(inode);
> @@ -1114,7 +1114,7 @@ static int gfs2_unlink_inode(struct gfs2_inode *dip,
>  		return error;
>  
>  	ip->i_entries = 0;
> -	inode->i_ctime = current_time(inode);
> +	inode_set_ctime_current(inode);
>  	if (S_ISDIR(inode->i_mode))
>  		clear_nlink(inode);
>  	else
> @@ -1371,7 +1371,7 @@ static int update_moved_ino(struct gfs2_inode *ip, struct gfs2_inode *ndip,
>  	if (dir_rename)
>  		return gfs2_dir_mvino(ip, &gfs2_qdotdot, ndip, DT_DIR);
>  
> -	ip->i_inode.i_ctime = current_time(&ip->i_inode);
> +	inode_set_ctime_current(&ip->i_inode);
>  	mark_inode_dirty_sync(&ip->i_inode);
>  	return 0;
>  }
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index 9f4d5d6549ee..ec0296b35dfe 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -412,7 +412,7 @@ void gfs2_dinode_out(const struct gfs2_inode *ip, void *buf)
>  	str->di_blocks = cpu_to_be64(gfs2_get_inode_blocks(inode));
>  	str->di_atime = cpu_to_be64(inode->i_atime.tv_sec);
>  	str->di_mtime = cpu_to_be64(inode->i_mtime.tv_sec);
> -	str->di_ctime = cpu_to_be64(inode->i_ctime.tv_sec);
> +	str->di_ctime = cpu_to_be64(inode_get_ctime(inode).tv_sec);
>  
>  	str->di_goal_meta = cpu_to_be64(ip->i_goal);
>  	str->di_goal_data = cpu_to_be64(ip->i_goal);
> @@ -429,7 +429,7 @@ void gfs2_dinode_out(const struct gfs2_inode *ip, void *buf)
>  	str->di_eattr = cpu_to_be64(ip->i_eattr);
>  	str->di_atime_nsec = cpu_to_be32(inode->i_atime.tv_nsec);
>  	str->di_mtime_nsec = cpu_to_be32(inode->i_mtime.tv_nsec);
> -	str->di_ctime_nsec = cpu_to_be32(inode->i_ctime.tv_nsec);
> +	str->di_ctime_nsec = cpu_to_be32(inode_get_ctime(inode).tv_nsec);
>  }
>  
>  /**
> diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
> index 93b36d026bb4..4fea70c0fe3d 100644
> --- a/fs/gfs2/xattr.c
> +++ b/fs/gfs2/xattr.c
> @@ -311,7 +311,7 @@ static int ea_dealloc_unstuffed(struct gfs2_inode *ip, struct buffer_head *bh,
>  		ea->ea_num_ptrs = 0;
>  	}
>  
> -	ip->i_inode.i_ctime = current_time(&ip->i_inode);
> +	inode_set_ctime_current(&ip->i_inode);
>  	__mark_inode_dirty(&ip->i_inode, I_DIRTY_DATASYNC);
>  
>  	gfs2_trans_end(sdp);
> @@ -763,7 +763,7 @@ static int ea_alloc_skeleton(struct gfs2_inode *ip, struct gfs2_ea_request *er,
>  	if (error)
>  		goto out_end_trans;
>  
> -	ip->i_inode.i_ctime = current_time(&ip->i_inode);
> +	inode_set_ctime_current(&ip->i_inode);
>  	__mark_inode_dirty(&ip->i_inode, I_DIRTY_DATASYNC);
>  
>  out_end_trans:
> @@ -888,7 +888,7 @@ static int ea_set_simple_noalloc(struct gfs2_inode *ip, struct buffer_head *bh,
>  	if (es->es_el)
>  		ea_set_remove_stuffed(ip, es->es_el);
>  
> -	ip->i_inode.i_ctime = current_time(&ip->i_inode);
> +	inode_set_ctime_current(&ip->i_inode);
>  	__mark_inode_dirty(&ip->i_inode, I_DIRTY_DATASYNC);
>  
>  	gfs2_trans_end(GFS2_SB(&ip->i_inode));
> @@ -1106,7 +1106,7 @@ static int ea_remove_stuffed(struct gfs2_inode *ip, struct gfs2_ea_location *el)
>  		ea->ea_type = GFS2_EATYPE_UNUSED;
>  	}
>  
> -	ip->i_inode.i_ctime = current_time(&ip->i_inode);
> +	inode_set_ctime_current(&ip->i_inode);
>  	__mark_inode_dirty(&ip->i_inode, I_DIRTY_DATASYNC);
>  
>  	gfs2_trans_end(GFS2_SB(&ip->i_inode));
> -- 
> 2.41.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

