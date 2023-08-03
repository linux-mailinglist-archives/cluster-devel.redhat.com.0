Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5613276E0EC
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Aug 2023 09:08:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691046484;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=OQElS5Lddlt0o0JlqmEWO0k2hY8bNGlhwCvrjvMV2oM=;
	b=Si8EiwaClA0P61nLNEvw7NMTkDKNkE5BKGGurcCuB7Olj9SssavKFqcIQuZvOpE3tZKRG/
	N3bo5xT5Fdorl6iTM7UlbmeG2O5piniN1JF5K3bHWNFbOIsoFf00eXt+YjijhbKbIJBVdR
	icgdEHq/1CsgvUudHcCrzxOx53s/6uk=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-4UXHjqr3MFOAV-ZL6dzMsg-1; Thu, 03 Aug 2023 03:07:59 -0400
X-MC-Unique: 4UXHjqr3MFOAV-ZL6dzMsg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28DB81C05EA2;
	Thu,  3 Aug 2023 07:07:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18673C5796B;
	Thu,  3 Aug 2023 07:07:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A97E819459F1;
	Thu,  3 Aug 2023 07:07:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6CA491946A45 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  3 Aug 2023 07:07:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3A1B0C5796C; Thu,  3 Aug 2023 07:07:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32E25C5796B
 for <cluster-devel@redhat.com>; Thu,  3 Aug 2023 07:07:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1024080123E
 for <cluster-devel@redhat.com>; Thu,  3 Aug 2023 07:07:44 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-5cemD1FYNJ29mDIJaTi2iA-1; Thu, 03 Aug 2023 03:07:40 -0400
X-MC-Unique: 5cemD1FYNJ29mDIJaTi2iA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 161ED61C2F;
 Thu,  3 Aug 2023 07:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11F6C433C8;
 Thu,  3 Aug 2023 07:07:23 +0000 (UTC)
Date: Thu, 3 Aug 2023 09:07:20 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230803-wellpappe-haargenau-f6cb3e3585d8@brauner>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-2-a794c2b7abca@kernel.org>
 <20230802193537.vtuuwuwazocjbatv@quack3>
 <ccc52562305bd1a1affb14e94a1cc08433eb8316.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <ccc52562305bd1a1affb14e94a1cc08433eb8316.camel@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v6 2/7] fs: add infrastructure for
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
 Jan Kara <jack@suse.cz>, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Dave Chinner <david@fromorbit.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, linux-f2fs-devel@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Anthony Iliopoulos <ailiop@suse.com>, Chao Yu <chao@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Gao Xiang <xiang@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-nfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 02, 2023 at 04:54:09PM -0400, Jeff Layton wrote:
> On Wed, 2023-08-02 at 21:35 +0200, Jan Kara wrote:
> > On Tue 25-07-23 10:58:15, Jeff Layton wrote:
> > > The VFS always uses coarse-grained timestamps when updating the ctime
> > > and mtime after a change. This has the benefit of allowing filesystems
> > > to optimize away a lot metadata updates, down to around 1 per jiffy,
> > > even when a file is under heavy writes.
> > > 
> > > Unfortunately, this has always been an issue when we're exporting via
> > > NFSv3, which relies on timestamps to validate caches. A lot of changes
> > > can happen in a jiffy, so timestamps aren't sufficient to help the
> > > client decide to invalidate the cache. Even with NFSv4, a lot of
> > > exported filesystems don't properly support a change attribute and are
> > > subject to the same problems with timestamp granularity. Other
> > > applications have similar issues with timestamps (e.g backup
> > > applications).
> > > 
> > > If we were to always use fine-grained timestamps, that would improve the
> > > situation, but that becomes rather expensive, as the underlying
> > > filesystem would have to log a lot more metadata updates.
> > > 
> > > What we need is a way to only use fine-grained timestamps when they are
> > > being actively queried.
> > > 
> > > POSIX generally mandates that when the the mtime changes, the ctime must
> > > also change. The kernel always stores normalized ctime values, so only
> > > the first 30 bits of the tv_nsec field are ever used.
> > > 
> > > Use the 31st bit of the ctime tv_nsec field to indicate that something
> > > has queried the inode for the mtime or ctime. When this flag is set,
> > > on the next mtime or ctime update, the kernel will fetch a fine-grained
> > > timestamp instead of the usual coarse-grained one.
> > > 
> > > Filesytems can opt into this behavior by setting the FS_MGTIME flag in
> > > the fstype. Filesystems that don't set this flag will continue to use
> > > coarse-grained timestamps.
> > > 
> > > Later patches will convert individual filesystems to use the new
> > > infrastructure.
> > > 
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  fs/inode.c         | 98 ++++++++++++++++++++++++++++++++++++++----------------
> > >  fs/stat.c          | 41 +++++++++++++++++++++--
> > >  include/linux/fs.h | 45 +++++++++++++++++++++++--
> > >  3 files changed, 151 insertions(+), 33 deletions(-)
> > > 
> > > diff --git a/fs/inode.c b/fs/inode.c
> > > index d4ab92233062..369621e7faf5 100644
> > > --- a/fs/inode.c
> > > +++ b/fs/inode.c
> > > @@ -1919,6 +1919,21 @@ int inode_update_time(struct inode *inode, struct timespec64 *time, int flags)
> > >  }
> > >  EXPORT_SYMBOL(inode_update_time);
> > >  
> > > +/**
> > > + * current_coarse_time - Return FS time
> > > + * @inode: inode.
> > > + *
> > > + * Return the current coarse-grained time truncated to the time
> > > + * granularity supported by the fs.
> > > + */
> > > +static struct timespec64 current_coarse_time(struct inode *inode)
> > > +{
> > > +	struct timespec64 now;
> > > +
> > > +	ktime_get_coarse_real_ts64(&now);
> > > +	return timestamp_truncate(now, inode);
> > > +}
> > > +
> > >  /**
> > >   *	atime_needs_update	-	update the access time
> > >   *	@path: the &struct path to update
> > > @@ -1952,7 +1967,7 @@ bool atime_needs_update(const struct path *path, struct inode *inode)
> > >  	if ((mnt->mnt_flags & MNT_NODIRATIME) && S_ISDIR(inode->i_mode))
> > >  		return false;
> > >  
> > > -	now = current_time(inode);
> > > +	now = current_coarse_time(inode);
> > >  
> > >  	if (!relatime_need_update(mnt, inode, now))
> > >  		return false;
> > > @@ -1986,7 +2001,7 @@ void touch_atime(const struct path *path)
> > >  	 * We may also fail on filesystems that have the ability to make parts
> > >  	 * of the fs read only, e.g. subvolumes in Btrfs.
> > >  	 */
> > > -	now = current_time(inode);
> > > +	now = current_coarse_time(inode);
> > >  	inode_update_time(inode, &now, S_ATIME);
> > >  	__mnt_drop_write(mnt);
> > >  skip_update:
> > 
> > There are also calls in fs/smb/client/file.c:cifs_readpage_worker() and in
> > fs/ocfs2/file.c:ocfs2_update_inode_atime() that should probably use
> > current_coarse_time() to avoid needless querying of fine grained
> > timestamps. But see below...
> > 
> 
> Technically, they already devolve to current_coarse_time anyway, but
> changing them would allow them to skip the fstype flag check, but I like
> your idea below better anyway.
> 
> > > @@ -2072,6 +2087,56 @@ int file_remove_privs(struct file *file)
> > >  }
> > >  EXPORT_SYMBOL(file_remove_privs);
> > >  
> > > +/**
> > > + * current_mgtime - Return FS time (possibly fine-grained)
> > > + * @inode: inode.
> > > + *
> > > + * Return the current time truncated to the time granularity supported by
> > > + * the fs, as suitable for a ctime/mtime change. If the ctime is flagged
> > > + * as having been QUERIED, get a fine-grained timestamp.
> > > + */
> > > +static struct timespec64 current_mgtime(struct inode *inode)
> > > +{
> > > +	struct timespec64 now;
> > > +	atomic_long_t *pnsec = (atomic_long_t *)&inode->__i_ctime.tv_nsec;
> > > +	long nsec = atomic_long_read(pnsec);
> > > +
> > > +	if (nsec & I_CTIME_QUERIED) {
> > > +		ktime_get_real_ts64(&now);
> > > +	} else {
> > > +		struct timespec64 ctime;
> > > +
> > > +		ktime_get_coarse_real_ts64(&now);
> > > +
> > > +		/*
> > > +		 * If we've recently fetched a fine-grained timestamp
> > > +		 * then the coarse-grained one may still be earlier than the
> > > +		 * existing one. Just keep the existing ctime if so.
> > > +		 */
> > > +		ctime = inode_get_ctime(inode);
> > > +		if (timespec64_compare(&ctime, &now) > 0)
> > > +			now = ctime;
> > > +	}
> > > +
> > > +	return timestamp_truncate(now, inode);
> > > +}
> > > +
> > > +/**
> > > + * current_time - Return timestamp suitable for ctime update
> > > + * @inode: inode to eventually be updated
> > > + *
> > > + * Return the current time, which is usually coarse-grained but may be fine
> > > + * grained if the filesystem uses multigrain timestamps and the existing
> > > + * ctime was queried since the last update.
> > > + */
> > > +struct timespec64 current_time(struct inode *inode)
> > > +{
> > > +	if (is_mgtime(inode))
> > > +		return current_mgtime(inode);
> > > +	return current_coarse_time(inode);
> > > +}
> > > +EXPORT_SYMBOL(current_time);
> > > +
> > 
> > So if you modify current_time() to handle multigrain timestamps the code
> > will be still racy. In particular fill_mg_cmtime() can race with
> > inode_set_ctime_current() like:
> > 
> > fill_mg_cmtime()				inode_set_ctime_current()
> >   stat->mtime = inode->i_mtime;
> >   stat->ctime.tv_sec = inode->__i_ctime.tv_sec;
> > 						  now = current_time();
> > 							/* fetches coarse
> > 							 * grained timestamp */
> >   stat->ctime.tv_nsec = atomic_long_fetch_or(I_CTIME_QUERIED, pnsec) &
> > 				~I_CTIME_QUERIED;
> > 						  inode_set_ctime(inode, now.tv_sec, now.tv_nsec);
> > 
> > and the information about a need for finegrained timestamp update gets
> > lost. So what I'd propose is to leave current_time() alone (just always
> > reporting coarse grained timestamps) and put all the magic into
> > inode_set_ctime_current() only. There we need something like:
> > 
> > struct timespec64 inode_set_ctime_current(struct inode *inode)
> > {
> > 	... variables ...
> > 
> > 	nsec = READ_ONCE(inode->__i_ctime.tv_nsec);
> >  	if (!(nsec & I_CTIME_QUERIED)) {
> > 		now = current_time(inode);
> > 
> > 		if (!is_gmtime(inode)) {
> > 			inode_set_ctime_to_ts(inode, now);
> > 		} else {
> > 			/*
> > 			 * If we've recently fetched a fine-grained
> > 			 * timestamp then the coarse-grained one may still
> > 			 * be earlier than the existing one. Just keep the
> > 			 * existing ctime if so.
> > 			 */
> > 			ctime = inode_get_ctime(inode);
> > 			if (timespec64_compare(&ctime, &now) > 0)
> > 				now = ctime;
> > 
> > 			/*
> > 			 * Ctime updates are generally protected by inode
> > 			 * lock but we could have raced with setting of
> > 			 * I_CTIME_QUERIED flag.
> > 			 */
> > 			if (cmpxchg(&inode->__i_ctime.tv_nsec, nsec,
> > 				    now.tv_nsec) != nsec)
> > 				goto fine_grained;
> > 			inode->__i_ctime.tv_sec = now.tv_sec;
> > 		}
> > 		return now;
> > 	}
> > fine_grained:
> > 	ktime_get_real_ts64(&now);
> > 	inode_set_ctime_to_ts(inode, now);
> > 
> > 	return now;
> > }
> > 
> > 								Honza
> > 
> 
> This is a great idea. I'll rework the series along the lines you
> suggest. That also answers my earlier question to Christian:
> 
> I'll just resend the whole series (it's not very big anyway), and I'll
> include the fill_mg_cmtime prototype change.

Ok, sound good!

