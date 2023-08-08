Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAE3773982
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Aug 2023 12:03:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691488980;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=0HEDf4nPJ+iNrPUKPUVl/LvlxLOjZZAZpje52YEl2Wk=;
	b=PO/DajLKqdNgRaKzKz/jtiBh2+wfqEdnLTrrgMebyUB3x1nOMvyEm2ks5H7RFZxLmY73ON
	wU0A+gxwYdJp5B8O1IkYnIqAw+kNCw9YbnCobV3vGK4+hJHSZUjsK933NJvRf3NAvtPVWF
	LF5kLW4505XSznhuPdP1RYMGJJz4N1Y=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-683-eFSUylmHMNGBqcW1shvaig-1; Tue, 08 Aug 2023 06:02:55 -0400
X-MC-Unique: eFSUylmHMNGBqcW1shvaig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 247DF3C100B2;
	Tue,  8 Aug 2023 10:02:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C27382166B2A;
	Tue,  8 Aug 2023 10:02:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 934061946589;
	Tue,  8 Aug 2023 10:02:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A45C71946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  8 Aug 2023 10:02:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 28A104EA54; Tue,  8 Aug 2023 10:02:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2086B4E3D1
 for <cluster-devel@redhat.com>; Tue,  8 Aug 2023 10:02:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0CE31C09A52
 for <cluster-devel@redhat.com>; Tue,  8 Aug 2023 10:02:46 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-gpXoB59iOW2s4ZGikqloqQ-1; Tue,
 08 Aug 2023 06:02:43 -0400
X-MC-Unique: gpXoB59iOW2s4ZGikqloqQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 948FE21E30;
 Tue,  8 Aug 2023 10:02:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A0F613451;
 Tue,  8 Aug 2023 10:02:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9CbJHcAS0mQYKgAAMHmgww
 (envelope-from <jack@suse.cz>); Tue, 08 Aug 2023 10:02:40 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 055A7A0769; Tue,  8 Aug 2023 12:02:40 +0200 (CEST)
Date: Tue, 8 Aug 2023 12:02:39 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230808100239.v7c6lh5yqszercvv@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-9-d1dec143a704@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230807-mgctime-v7-9-d1dec143a704@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v7 09/13] fs: add infrastructure for
 multigrain timestamps
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 linux-xfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 Ilya Dryomov <idryomov@gmail.com>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Amir Goldstein <amir73il@gmail.com>,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.cz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon 07-08-23 15:38:40, Jeff Layton wrote:
> The VFS always uses coarse-grained timestamps when updating the ctime
> and mtime after a change. This has the benefit of allowing filesystems
> to optimize away a lot metadata updates, down to around 1 per jiffy,
> even when a file is under heavy writes.
> 
> Unfortunately, this has always been an issue when we're exporting via
> NFSv3, which relies on timestamps to validate caches. A lot of changes
> can happen in a jiffy, so timestamps aren't sufficient to help the
> client decide to invalidate the cache. Even with NFSv4, a lot of
> exported filesystems don't properly support a change attribute and are
> subject to the same problems with timestamp granularity. Other
> applications have similar issues with timestamps (e.g backup
> applications).
> 
> If we were to always use fine-grained timestamps, that would improve the
> situation, but that becomes rather expensive, as the underlying
> filesystem would have to log a lot more metadata updates.
> 
> What we need is a way to only use fine-grained timestamps when they are
> being actively queried.
> 
> POSIX generally mandates that when the the mtime changes, the ctime must
> also change. The kernel always stores normalized ctime values, so only
> the first 30 bits of the tv_nsec field are ever used.
> 
> Use the 31st bit of the ctime tv_nsec field to indicate that something
> has queried the inode for the mtime or ctime. When this flag is set,
> on the next mtime or ctime update, the kernel will fetch a fine-grained
> timestamp instead of the usual coarse-grained one.
> 
> Filesytems can opt into this behavior by setting the FS_MGTIME flag in
> the fstype. Filesystems that don't set this flag will continue to use
> coarse-grained timestamps.
> 
> Later patches will convert individual filesystems to use the new
> infrastructure.
> 
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c         | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  fs/stat.c          | 41 +++++++++++++++++++++++++--
>  include/linux/fs.h | 46 ++++++++++++++++++++++++++++--
>  3 files changed, 162 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index e50d94a136fe..f55957ac80e6 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2118,10 +2118,52 @@ int file_remove_privs(struct file *file)
>  }
>  EXPORT_SYMBOL(file_remove_privs);
>  
> +/**
> + * current_mgtime - Return FS time (possibly fine-grained)
> + * @inode: inode.
> + *
> + * Return the current time truncated to the time granularity supported by
> + * the fs, as suitable for a ctime/mtime change. If the ctime is flagged
> + * as having been QUERIED, get a fine-grained timestamp.
> + */
> +struct timespec64 current_mgtime(struct inode *inode)
> +{
> +	struct timespec64 now, ctime;
> +	atomic_long_t *pnsec = (atomic_long_t *)&inode->__i_ctime.tv_nsec;
> +	long nsec = atomic_long_read(pnsec);
> +
> +	if (nsec & I_CTIME_QUERIED) {
> +		ktime_get_real_ts64(&now);
> +		return timestamp_truncate(now, inode);
> +	}
> +
> +	ktime_get_coarse_real_ts64(&now);
> +	now = timestamp_truncate(now, inode);
> +
> +	/*
> +	 * If we've recently fetched a fine-grained timestamp
> +	 * then the coarse-grained one may still be earlier than the
> +	 * existing ctime. Just keep the existing value if so.
> +	 */
> +	ctime = inode_get_ctime(inode);
> +	if (timespec64_compare(&ctime, &now) > 0)
> +		now = ctime;
> +
> +	return now;
> +}
> +EXPORT_SYMBOL(current_mgtime);
> +
> +static struct timespec64 current_ctime(struct inode *inode)
> +{
> +	if (is_mgtime(inode))
> +		return current_mgtime(inode);
> +	return current_time(inode);
> +}
> +
>  static int inode_needs_update_time(struct inode *inode)
>  {
>  	int sync_it = 0;
> -	struct timespec64 now = current_time(inode);
> +	struct timespec64 now = current_ctime(inode);
>  	struct timespec64 ctime;
>  
>  	/* First try to exhaust all avenues to not sync */
> @@ -2552,9 +2594,43 @@ EXPORT_SYMBOL(current_time);
>   */
>  struct timespec64 inode_set_ctime_current(struct inode *inode)
>  {
> -	struct timespec64 now = current_time(inode);
> +	struct timespec64 now;
> +	struct timespec64 ctime;
> +
> +	ctime.tv_nsec = READ_ONCE(inode->__i_ctime.tv_nsec);
> +	if (!(ctime.tv_nsec & I_CTIME_QUERIED)) {
> +		now = current_time(inode);
>  
> -	inode_set_ctime(inode, now.tv_sec, now.tv_nsec);
> +		/* Just copy it into place if it's not multigrain */
> +		if (!is_mgtime(inode)) {
> +			inode_set_ctime_to_ts(inode, now);
> +			return now;
> +		}
> +
> +		/*
> +		 * If we've recently updated with a fine-grained timestamp,
> +		 * then the coarse-grained one may still be earlier than the
> +		 * existing ctime. Just keep the existing value if so.
> +		 */
> +		ctime.tv_sec = inode->__i_ctime.tv_sec;
> +		if (timespec64_compare(&ctime, &now) > 0)
> +			return ctime;
> +
> +		/*
> +		 * Ctime updates are usually protected by the inode_lock, but
> +		 * we can still race with someone setting the QUERIED flag.
> +		 * Try to swap the new nsec value into place. If it's changed
> +		 * in the interim, then just go with a fine-grained timestamp.
> +		 */
> +		if (cmpxchg(&inode->__i_ctime.tv_nsec, ctime.tv_nsec,
> +			    now.tv_nsec) != ctime.tv_nsec)
> +			goto fine_grained;
> +		inode->__i_ctime.tv_sec = now.tv_sec;
> +		return now;
> +	}
> +fine_grained:
> +	ktime_get_real_ts64(&now);
> +	inode_set_ctime_to_ts(inode, timestamp_truncate(now, inode));
>  	return now;
>  }
>  EXPORT_SYMBOL(inode_set_ctime_current);
> diff --git a/fs/stat.c b/fs/stat.c
> index 7644e5997035..136711ae72fb 100644
> --- a/fs/stat.c
> +++ b/fs/stat.c
> @@ -26,6 +26,37 @@
>  #include "internal.h"
>  #include "mount.h"
>  
> +/**
> + * fill_mg_cmtime - Fill in the mtime and ctime and flag ctime as QUERIED
> + * @stat: where to store the resulting values
> + * @request_mask: STATX_* values requested
> + * @inode: inode from which to grab the c/mtime
> + *
> + * Given @inode, grab the ctime and mtime out if it and store the result
> + * in @stat. When fetching the value, flag it as queried so the next write
> + * will use a fine-grained timestamp.
> + */
> +void fill_mg_cmtime(struct kstat *stat, u32 request_mask, struct inode *inode)
> +{
> +	atomic_long_t *pnsec = (atomic_long_t *)&inode->__i_ctime.tv_nsec;
> +
> +	/* If neither time was requested, then don't report them */
> +	if (!(request_mask & (STATX_CTIME|STATX_MTIME))) {
> +		stat->result_mask &= ~(STATX_CTIME|STATX_MTIME);
> +		return;
> +	}
> +
> +	stat->mtime = inode->i_mtime;
> +	stat->ctime.tv_sec = inode->__i_ctime.tv_sec;
> +	/*
> +	 * Atomically set the QUERIED flag and fetch the new value with
> +	 * the flag masked off.
> +	 */
> +	stat->ctime.tv_nsec = atomic_long_fetch_or(I_CTIME_QUERIED, pnsec) &
> +					~I_CTIME_QUERIED;
> +}
> +EXPORT_SYMBOL(fill_mg_cmtime);
> +
>  /**
>   * generic_fillattr - Fill in the basic attributes from the inode struct
>   * @idmap:		idmap of the mount the inode was found from
> @@ -58,8 +89,14 @@ void generic_fillattr(struct mnt_idmap *idmap, u32 request_mask,
>  	stat->rdev = inode->i_rdev;
>  	stat->size = i_size_read(inode);
>  	stat->atime = inode->i_atime;
> -	stat->mtime = inode->i_mtime;
> -	stat->ctime = inode_get_ctime(inode);
> +
> +	if (is_mgtime(inode)) {
> +		fill_mg_cmtime(stat, request_mask, inode);
> +	} else {
> +		stat->mtime = inode->i_mtime;
> +		stat->ctime = inode_get_ctime(inode);
> +	}
> +
>  	stat->blksize = i_blocksize(inode);
>  	stat->blocks = inode->i_blocks;
>  
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index a83313f90fe3..455835d0e963 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1474,18 +1474,47 @@ static inline bool fsuidgid_has_mapping(struct super_block *sb,
>  	       kgid_has_mapping(fs_userns, kgid);
>  }
>  
> +struct timespec64 current_mgtime(struct inode *inode);
>  struct timespec64 current_time(struct inode *inode);
>  struct timespec64 inode_set_ctime_current(struct inode *inode);
>  
> +/*
> + * Multigrain timestamps
> + *
> + * Conditionally use fine-grained ctime and mtime timestamps when there
> + * are users actively observing them via getattr. The primary use-case
> + * for this is NFS clients that use the ctime to distinguish between
> + * different states of the file, and that are often fooled by multiple
> + * operations that occur in the same coarse-grained timer tick.
> + *
> + * The kernel always keeps normalized struct timespec64 values in the ctime,
> + * which means that only the first 30 bits of the value are used. Use the
> + * 31st bit of the ctime's tv_nsec field as a flag to indicate that the value
> + * has been queried since it was last updated.
> + */
> +#define I_CTIME_QUERIED		(1L<<30)
> +
>  /**
>   * inode_get_ctime - fetch the current ctime from the inode
>   * @inode: inode from which to fetch ctime
>   *
> - * Grab the current ctime from the inode and return it.
> + * Grab the current ctime tv_nsec field from the inode, mask off the
> + * I_CTIME_QUERIED flag and return it. This is mostly intended for use by
> + * internal consumers of the ctime that aren't concerned with ensuring a
> + * fine-grained update on the next change (e.g. when preparing to store
> + * the value in the backing store for later retrieval).
> + *
> + * This is safe to call regardless of whether the underlying filesystem
> + * is using multigrain timestamps.
>   */
>  static inline struct timespec64 inode_get_ctime(const struct inode *inode)
>  {
> -	return inode->__i_ctime;
> +	struct timespec64 ctime;
> +
> +	ctime.tv_sec = inode->__i_ctime.tv_sec;
> +	ctime.tv_nsec = inode->__i_ctime.tv_nsec & ~I_CTIME_QUERIED;
> +
> +	return ctime;
>  }
>  
>  /**
> @@ -2259,6 +2288,7 @@ struct file_system_type {
>  #define FS_USERNS_MOUNT		8	/* Can be mounted by userns root */
>  #define FS_DISALLOW_NOTIFY_PERM	16	/* Disable fanotify permission events */
>  #define FS_ALLOW_IDMAP         32      /* FS has been updated to handle vfs idmappings. */
> +#define FS_MGTIME		64	/* FS uses multigrain timestamps */
>  #define FS_RENAME_DOES_D_MOVE	32768	/* FS will handle d_move() during rename() internally. */
>  	int (*init_fs_context)(struct fs_context *);
>  	const struct fs_parameter_spec *parameters;
> @@ -2282,6 +2312,17 @@ struct file_system_type {
>  
>  #define MODULE_ALIAS_FS(NAME) MODULE_ALIAS("fs-" NAME)
>  
> +/**
> + * is_mgtime: is this inode using multigrain timestamps
> + * @inode: inode to test for multigrain timestamps
> + *
> + * Return true if the inode uses multigrain timestamps, false otherwise.
> + */
> +static inline bool is_mgtime(const struct inode *inode)
> +{
> +	return inode->i_sb->s_type->fs_flags & FS_MGTIME;
> +}
> +
>  extern struct dentry *mount_bdev(struct file_system_type *fs_type,
>  	int flags, const char *dev_name, void *data,
>  	int (*fill_super)(struct super_block *, void *, int));
> @@ -2918,6 +2959,7 @@ extern void page_put_link(void *);
>  extern int page_symlink(struct inode *inode, const char *symname, int len);
>  extern const struct inode_operations page_symlink_inode_operations;
>  extern void kfree_link(void *);
> +void fill_mg_cmtime(struct kstat *stat, u32 request_mask, struct inode *inode);
>  void generic_fillattr(struct mnt_idmap *, u32, struct inode *, struct kstat *);
>  void generic_fill_statx_attr(struct inode *inode, struct kstat *stat);
>  extern int vfs_getattr_nosec(const struct path *, struct kstat *, u32, unsigned int);
> 
> -- 
> 2.41.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

