Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 235467A7A69
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Sep 2023 13:27:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695209266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=XpHsNizvelec1zcW5xxDBrnNaFeZBOad68HcE9xlPoQ=;
	b=KjHEBop62DKYt79TSS2kYk52v2TViKxuX87Oqep36rBIc01Paluppe8gKzt22Fy01UEaPS
	AUncaDkb15+1Tozw0YsGEp86lx/x8b2Q1/cn6M6eSfFV2z2+GuPNnc3ml0Ve8101Fpybwx
	XteKo4JcaW9zrvfUYjVnGdA2g600Vgo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-424-BEN2mr8MNAqvEj5pWoOtdw-1; Wed, 20 Sep 2023 07:27:43 -0400
X-MC-Unique: BEN2mr8MNAqvEj5pWoOtdw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1375E811E7B;
	Wed, 20 Sep 2023 11:27:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02FF1492C37;
	Wed, 20 Sep 2023 11:27:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BD68919465B7;
	Wed, 20 Sep 2023 11:27:41 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A3231194658D for <cluster-devel@listman.corp.redhat.com>;
 Wed, 20 Sep 2023 10:17:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8254D492C37; Wed, 20 Sep 2023 10:17:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A391492B05
 for <cluster-devel@redhat.com>; Wed, 20 Sep 2023 10:17:38 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5469A299E74B
 for <cluster-devel@redhat.com>; Wed, 20 Sep 2023 10:17:38 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-209--1ntxgbaO2aqmSOqFuBMxA-1; Wed,
 20 Sep 2023 06:17:34 -0400
X-MC-Unique: -1ntxgbaO2aqmSOqFuBMxA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AD3EA1FF06;
 Wed, 20 Sep 2023 10:17:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8B898132C7;
 Wed, 20 Sep 2023 10:17:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gboIIrzGCmW2EgAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 20 Sep 2023 10:17:32 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id F205EA077D; Wed, 20 Sep 2023 12:17:31 +0200 (CEST)
Date: Wed, 20 Sep 2023 12:17:31 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20230920101731.ym6pahcvkl57guto@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
MIME-Version: 1.0
In-Reply-To: <20230920-leerung-krokodil-52ec6cb44707@brauner>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v7 12/13] ext4: switch to multigrain
 timestamps
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
 Jan Kara <jack@suse.cz>, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, samba-technical@lists.samba.org,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Paulo Alcantara <pc@manguebit.com>, Amir Goldstein <l@gmail.com>,
 Eric Van Hensbergen <ericvh@kernel.org>, bug-gnulib@gnu.org,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Gao Xiang <xiang@kernel.org>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Xi Ruoyao <xry111@linuxfromscratch.org>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, Chao Yu <chao@kernel.org>,
 linux-erofs@lists.ozlabs.org, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Bruno Haible <bruno@clisp.org>,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.cz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 20-09-23 10:41:30, Christian Brauner wrote:
> > > f1 was last written to *after* f2 was last written to. If the timestamp of f1
> > > is then lower than the timestamp of f2, timestamps are fundamentally broken.
> > > 
> > > Many things in user-space depend on timestamps, such as build system
> > > centered around 'make', but also 'find ... -newer ...'.
> > > 
> > 
> > 
> > What does breakage with make look like in this situation? The "fuzz"
> > here is going to be on the order of a jiffy. The typical case for make
> > timestamp comparisons is comparing source files vs. a build target. If
> > those are being written nearly simultaneously, then that could be an
> > issue, but is that a typical behavior? It seems like it would be hard to
> > rely on that anyway, esp. given filesystems like NFS that can do lazy
> > writeback.
> > 
> > One of the operating principles with this series is that timestamps can
> > be of varying granularity between different files. Note that Linux
> > already violates this assumption when you're working across filesystems
> > of different types.
> > 
> > As to potential fixes if this is a real problem:
> > 
> > I don't really want to put this behind a mount or mkfs option (a'la
> > relatime, etc.), but that is one possibility.
> > 
> > I wonder if it would be feasible to just advance the coarse-grained
> > current_time whenever we end up updating a ctime with a fine-grained
> > timestamp? It might produce some inode write amplification. Files that
> 
> Less than ideal imho.
> 
> If this risks breaking existing workloads by enabling it unconditionally
> and there isn't a clear way to detect and handle these situations
> without risk of regression then we should move this behind a mount
> option.
> 
> So how about the following:
> 
> From cb14add421967f6e374eb77c36cc4a0526b10d17 Mon Sep 17 00:00:00 2001
> From: Christian Brauner <brauner@kernel.org>
> Date: Wed, 20 Sep 2023 10:00:08 +0200
> Subject: [PATCH] vfs: move multi-grain timestamps behind a mount option
> 
> While we initially thought we can do this unconditionally it turns out
> that this might break existing workloads that rely on timestamps in very
> specific ways and we always knew this was a possibility. Move
> multi-grain timestamps behind a vfs mount option.
> 
> Signed-off-by: Christian Brauner <brauner@kernel.org>

Surely this is a safe choice as it moves the responsibility to the sysadmin
and the cases where finegrained timestamps are required. But I kind of
wonder how is the sysadmin going to decide whether mgtime is safe for his
system or not? Because the possible breakage needn't be obvious at the
first sight... If I were a sysadmin, I'd rather opt for something like
finegrained timestamps + lazytime (if I needed the finegrained timestamps
functionality). That should avoid the IO overhead of finegrained timestamps
as well and I'd know I can have problems with timestamps only after a
system crash.

I've just got another idea how we could solve the problem: Couldn't we
always just report coarsegrained timestamp to userspace and provide access
to finegrained value only to NFS which should know what it's doing?

								Honza

> ---
>  fs/fs_context.c     | 18 ++++++++++++++++++
>  fs/inode.c          |  4 ++--
>  fs/proc_namespace.c |  1 +
>  fs/stat.c           |  2 +-
>  include/linux/fs.h  |  4 +++-
>  5 files changed, 25 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/fs_context.c b/fs/fs_context.c
> index a0ad7a0c4680..dd4dade0bb9e 100644
> --- a/fs/fs_context.c
> +++ b/fs/fs_context.c
> @@ -44,6 +44,7 @@ static const struct constant_table common_set_sb_flag[] = {
>  	{ "mand",	SB_MANDLOCK },
>  	{ "ro",		SB_RDONLY },
>  	{ "sync",	SB_SYNCHRONOUS },
> +	{ "mgtime",	SB_MGTIME },
>  	{ },
>  };
>  
> @@ -52,18 +53,32 @@ static const struct constant_table common_clear_sb_flag[] = {
>  	{ "nolazytime",	SB_LAZYTIME },
>  	{ "nomand",	SB_MANDLOCK },
>  	{ "rw",		SB_RDONLY },
> +	{ "nomgtime",	SB_MGTIME },
>  	{ },
>  };
>  
> +static inline int check_mgtime(unsigned int token, const struct fs_context *fc)
> +{
> +	if (token != SB_MGTIME)
> +		return 0;
> +	if (!(fc->fs_type->fs_flags & FS_MGTIME))
> +		return invalf(fc, "Filesystem doesn't support multi-grain timestamps");
> +	return 0;
> +}
> +
>  /*
>   * Check for a common mount option that manipulates s_flags.
>   */
>  static int vfs_parse_sb_flag(struct fs_context *fc, const char *key)
>  {
>  	unsigned int token;
> +	int ret;
>  
>  	token = lookup_constant(common_set_sb_flag, key, 0);
>  	if (token) {
> +		ret = check_mgtime(token, fc);
> +		if (ret)
> +			return ret;
>  		fc->sb_flags |= token;
>  		fc->sb_flags_mask |= token;
>  		return 0;
> @@ -71,6 +86,9 @@ static int vfs_parse_sb_flag(struct fs_context *fc, const char *key)
>  
>  	token = lookup_constant(common_clear_sb_flag, key, 0);
>  	if (token) {
> +		ret = check_mgtime(token, fc);
> +		if (ret)
> +			return ret;
>  		fc->sb_flags &= ~token;
>  		fc->sb_flags_mask |= token;
>  		return 0;
> diff --git a/fs/inode.c b/fs/inode.c
> index 54237f4242ff..fd1a2390aaa3 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2141,7 +2141,7 @@ EXPORT_SYMBOL(current_mgtime);
>  
>  static struct timespec64 current_ctime(struct inode *inode)
>  {
> -	if (is_mgtime(inode))
> +	if (IS_MGTIME(inode))
>  		return current_mgtime(inode);
>  	return current_time(inode);
>  }
> @@ -2588,7 +2588,7 @@ struct timespec64 inode_set_ctime_current(struct inode *inode)
>  		now = current_time(inode);
>  
>  		/* Just copy it into place if it's not multigrain */
> -		if (!is_mgtime(inode)) {
> +		if (!IS_MGTIME(inode)) {
>  			inode_set_ctime_to_ts(inode, now);
>  			return now;
>  		}
> diff --git a/fs/proc_namespace.c b/fs/proc_namespace.c
> index 250eb5bf7b52..08f5bf4d2c6c 100644
> --- a/fs/proc_namespace.c
> +++ b/fs/proc_namespace.c
> @@ -49,6 +49,7 @@ static int show_sb_opts(struct seq_file *m, struct super_block *sb)
>  		{ SB_DIRSYNC, ",dirsync" },
>  		{ SB_MANDLOCK, ",mand" },
>  		{ SB_LAZYTIME, ",lazytime" },
> +		{ SB_MGTIME, ",mgtime" },
>  		{ 0, NULL }
>  	};
>  	const struct proc_fs_opts *fs_infop;
> diff --git a/fs/stat.c b/fs/stat.c
> index 6e60389d6a15..2f18dd5de18b 100644
> --- a/fs/stat.c
> +++ b/fs/stat.c
> @@ -90,7 +90,7 @@ void generic_fillattr(struct mnt_idmap *idmap, u32 request_mask,
>  	stat->size = i_size_read(inode);
>  	stat->atime = inode->i_atime;
>  
> -	if (is_mgtime(inode)) {
> +	if (IS_MGTIME(inode)) {
>  		fill_mg_cmtime(stat, request_mask, inode);
>  	} else {
>  		stat->mtime = inode->i_mtime;
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 4aeb3fa11927..03e415fb3a7c 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1114,6 +1114,7 @@ extern int send_sigurg(struct fown_struct *fown);
>  #define SB_NODEV        BIT(2)	/* Disallow access to device special files */
>  #define SB_NOEXEC       BIT(3)	/* Disallow program execution */
>  #define SB_SYNCHRONOUS  BIT(4)	/* Writes are synced at once */
> +#define SB_MGTIME	BIT(5)	/* Use multi-grain timestamps */
>  #define SB_MANDLOCK     BIT(6)	/* Allow mandatory locks on an FS */
>  #define SB_DIRSYNC      BIT(7)	/* Directory modifications are synchronous */
>  #define SB_NOATIME      BIT(10)	/* Do not update access times. */
> @@ -2105,6 +2106,7 @@ static inline bool sb_rdonly(const struct super_block *sb) { return sb->s_flags
>  					((inode)->i_flags & (S_SYNC|S_DIRSYNC)))
>  #define IS_MANDLOCK(inode)	__IS_FLG(inode, SB_MANDLOCK)
>  #define IS_NOATIME(inode)	__IS_FLG(inode, SB_RDONLY|SB_NOATIME)
> +#define IS_MGTIME(inode)	__IS_FLG(inode, SB_MGTIME)
>  #define IS_I_VERSION(inode)	__IS_FLG(inode, SB_I_VERSION)
>  
>  #define IS_NOQUOTA(inode)	((inode)->i_flags & S_NOQUOTA)
> @@ -2366,7 +2368,7 @@ struct file_system_type {
>   */
>  static inline bool is_mgtime(const struct inode *inode)
>  {
> -	return inode->i_sb->s_type->fs_flags & FS_MGTIME;
> +	return inode->i_sb->s_flags & SB_MGTIME;
>  }
>  
>  extern struct dentry *mount_bdev(struct file_system_type *fs_type,
> -- 
> 2.34.1
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

