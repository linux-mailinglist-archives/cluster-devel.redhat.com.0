Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1DD76D908
	for <lists+cluster-devel@lfdr.de>; Wed,  2 Aug 2023 22:56:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691009767;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EDk6G7Vk2ZwSwCm3qfgRCtZgoNCb/lRe8sVvAFVQm90=;
	b=B+2JgYUekNbkbWxPGMei0LOkad8Q6uaUbaEM72/sHoMni4yjotr0zNqfT3wiCvUYuKA/Vk
	6rD8WBZ0S1G5KS3dAzMcRKq80AoRcJblJk7x/pSCPwipFGPILLH0AgIIZYyEkljBe82yHs
	alyHHiZOt20M+oHxTewukTdtBvLw3iY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-pjcmQW8COieauHVtE31fRw-1; Wed, 02 Aug 2023 16:56:05 -0400
X-MC-Unique: pjcmQW8COieauHVtE31fRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC32E3813F2F;
	Wed,  2 Aug 2023 20:56:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACAFBF7FA4;
	Wed,  2 Aug 2023 20:56:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3A10E1946A79;
	Wed,  2 Aug 2023 20:56:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 13A901946A45 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  2 Aug 2023 20:54:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A0047492CA6; Wed,  2 Aug 2023 20:54:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97B82492B03
 for <cluster-devel@redhat.com>; Wed,  2 Aug 2023 20:54:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 781EA104458A
 for <cluster-devel@redhat.com>; Wed,  2 Aug 2023 20:54:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-0ZWWd74cO8eZi3aQBu3aYQ-1; Wed, 02 Aug 2023 16:54:19 -0400
X-MC-Unique: 0ZWWd74cO8eZi3aQBu3aYQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1CF4F61B13;
 Wed,  2 Aug 2023 20:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241AAC433C7;
 Wed,  2 Aug 2023 20:54:11 +0000 (UTC)
Message-ID: <ccc52562305bd1a1affb14e94a1cc08433eb8316.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Jan Kara <jack@suse.cz>
Date: Wed, 02 Aug 2023 16:54:09 -0400
In-Reply-To: <20230802193537.vtuuwuwazocjbatv@quack3>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-2-a794c2b7abca@kernel.org>
 <20230802193537.vtuuwuwazocjbatv@quack3>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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
 linux-xfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
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
 Jan Harkes <jaharkes@cs.cmu.edu>, Christian Brauner <brauner@kernel.org>,
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
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-08-02 at 21:35 +0200, Jan Kara wrote:
> On Tue 25-07-23 10:58:15, Jeff Layton wrote:
> > The VFS always uses coarse-grained timestamps when updating the ctime
> > and mtime after a change. This has the benefit of allowing filesystems
> > to optimize away a lot metadata updates, down to around 1 per jiffy,
> > even when a file is under heavy writes.
> >=20
> > Unfortunately, this has always been an issue when we're exporting via
> > NFSv3, which relies on timestamps to validate caches. A lot of changes
> > can happen in a jiffy, so timestamps aren't sufficient to help the
> > client decide to invalidate the cache. Even with NFSv4, a lot of
> > exported filesystems don't properly support a change attribute and are
> > subject to the same problems with timestamp granularity. Other
> > applications have similar issues with timestamps (e.g backup
> > applications).
> >=20
> > If we were to always use fine-grained timestamps, that would improve th=
e
> > situation, but that becomes rather expensive, as the underlying
> > filesystem would have to log a lot more metadata updates.
> >=20
> > What we need is a way to only use fine-grained timestamps when they are
> > being actively queried.
> >=20
> > POSIX generally mandates that when the the mtime changes, the ctime mus=
t
> > also change. The kernel always stores normalized ctime values, so only
> > the first 30 bits of the tv_nsec field are ever used.
> >=20
> > Use the 31st bit of the ctime tv_nsec field to indicate that something
> > has queried the inode for the mtime or ctime. When this flag is set,
> > on the next mtime or ctime update, the kernel will fetch a fine-grained
> > timestamp instead of the usual coarse-grained one.
> >=20
> > Filesytems can opt into this behavior by setting the FS_MGTIME flag in
> > the fstype. Filesystems that don't set this flag will continue to use
> > coarse-grained timestamps.
> >=20
> > Later patches will convert individual filesystems to use the new
> > infrastructure.
> >=20
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/inode.c         | 98 ++++++++++++++++++++++++++++++++++++++--------=
--------
> >  fs/stat.c          | 41 +++++++++++++++++++++--
> >  include/linux/fs.h | 45 +++++++++++++++++++++++--
> >  3 files changed, 151 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/fs/inode.c b/fs/inode.c
> > index d4ab92233062..369621e7faf5 100644
> > --- a/fs/inode.c
> > +++ b/fs/inode.c
> > @@ -1919,6 +1919,21 @@ int inode_update_time(struct inode *inode, struc=
t timespec64 *time, int flags)
> >  }
> >  EXPORT_SYMBOL(inode_update_time);
> > =20
> > +/**
> > + * current_coarse_time - Return FS time
> > + * @inode: inode.
> > + *
> > + * Return the current coarse-grained time truncated to the time
> > + * granularity supported by the fs.
> > + */
> > +static struct timespec64 current_coarse_time(struct inode *inode)
> > +{
> > +=09struct timespec64 now;
> > +
> > +=09ktime_get_coarse_real_ts64(&now);
> > +=09return timestamp_truncate(now, inode);
> > +}
> > +
> >  /**
> >   *=09atime_needs_update=09-=09update the access time
> >   *=09@path: the &struct path to update
> > @@ -1952,7 +1967,7 @@ bool atime_needs_update(const struct path *path, =
struct inode *inode)
> >  =09if ((mnt->mnt_flags & MNT_NODIRATIME) && S_ISDIR(inode->i_mode))
> >  =09=09return false;
> > =20
> > -=09now =3D current_time(inode);
> > +=09now =3D current_coarse_time(inode);
> > =20
> >  =09if (!relatime_need_update(mnt, inode, now))
> >  =09=09return false;
> > @@ -1986,7 +2001,7 @@ void touch_atime(const struct path *path)
> >  =09 * We may also fail on filesystems that have the ability to make pa=
rts
> >  =09 * of the fs read only, e.g. subvolumes in Btrfs.
> >  =09 */
> > -=09now =3D current_time(inode);
> > +=09now =3D current_coarse_time(inode);
> >  =09inode_update_time(inode, &now, S_ATIME);
> >  =09__mnt_drop_write(mnt);
> >  skip_update:
>=20
> There are also calls in fs/smb/client/file.c:cifs_readpage_worker() and i=
n
> fs/ocfs2/file.c:ocfs2_update_inode_atime() that should probably use
> current_coarse_time() to avoid needless querying of fine grained
> timestamps. But see below...
>=20

Technically, they already devolve to current_coarse_time anyway, but
changing them would allow them to skip the fstype flag check, but I like
your idea below better anyway.

> > @@ -2072,6 +2087,56 @@ int file_remove_privs(struct file *file)
> >  }
> >  EXPORT_SYMBOL(file_remove_privs);
> > =20
> > +/**
> > + * current_mgtime - Return FS time (possibly fine-grained)
> > + * @inode: inode.
> > + *
> > + * Return the current time truncated to the time granularity supported=
 by
> > + * the fs, as suitable for a ctime/mtime change. If the ctime is flagg=
ed
> > + * as having been QUERIED, get a fine-grained timestamp.
> > + */
> > +static struct timespec64 current_mgtime(struct inode *inode)
> > +{
> > +=09struct timespec64 now;
> > +=09atomic_long_t *pnsec =3D (atomic_long_t *)&inode->__i_ctime.tv_nsec=
;
> > +=09long nsec =3D atomic_long_read(pnsec);
> > +
> > +=09if (nsec & I_CTIME_QUERIED) {
> > +=09=09ktime_get_real_ts64(&now);
> > +=09} else {
> > +=09=09struct timespec64 ctime;
> > +
> > +=09=09ktime_get_coarse_real_ts64(&now);
> > +
> > +=09=09/*
> > +=09=09 * If we've recently fetched a fine-grained timestamp
> > +=09=09 * then the coarse-grained one may still be earlier than the
> > +=09=09 * existing one. Just keep the existing ctime if so.
> > +=09=09 */
> > +=09=09ctime =3D inode_get_ctime(inode);
> > +=09=09if (timespec64_compare(&ctime, &now) > 0)
> > +=09=09=09now =3D ctime;
> > +=09}
> > +
> > +=09return timestamp_truncate(now, inode);
> > +}
> > +
> > +/**
> > + * current_time - Return timestamp suitable for ctime update
> > + * @inode: inode to eventually be updated
> > + *
> > + * Return the current time, which is usually coarse-grained but may be=
 fine
> > + * grained if the filesystem uses multigrain timestamps and the existi=
ng
> > + * ctime was queried since the last update.
> > + */
> > +struct timespec64 current_time(struct inode *inode)
> > +{
> > +=09if (is_mgtime(inode))
> > +=09=09return current_mgtime(inode);
> > +=09return current_coarse_time(inode);
> > +}
> > +EXPORT_SYMBOL(current_time);
> > +
>=20
> So if you modify current_time() to handle multigrain timestamps the code
> will be still racy. In particular fill_mg_cmtime() can race with
> inode_set_ctime_current() like:
>=20
> fill_mg_cmtime()=09=09=09=09inode_set_ctime_current()
>   stat->mtime =3D inode->i_mtime;
>   stat->ctime.tv_sec =3D inode->__i_ctime.tv_sec;
> =09=09=09=09=09=09  now =3D current_time();
> =09=09=09=09=09=09=09/* fetches coarse
> =09=09=09=09=09=09=09 * grained timestamp */
>   stat->ctime.tv_nsec =3D atomic_long_fetch_or(I_CTIME_QUERIED, pnsec) &
> =09=09=09=09~I_CTIME_QUERIED;
> =09=09=09=09=09=09  inode_set_ctime(inode, now.tv_sec, now.tv_nsec);
>=20
> and the information about a need for finegrained timestamp update gets
> lost. So what I'd propose is to leave current_time() alone (just always
> reporting coarse grained timestamps) and put all the magic into
> inode_set_ctime_current() only. There we need something like:
>=20
> struct timespec64 inode_set_ctime_current(struct inode *inode)
> {
> =09... variables ...
>=20
> =09nsec =3D READ_ONCE(inode->__i_ctime.tv_nsec);
>  =09if (!(nsec & I_CTIME_QUERIED)) {
> =09=09now =3D current_time(inode);
>=20
> =09=09if (!is_gmtime(inode)) {
> =09=09=09inode_set_ctime_to_ts(inode, now);
> =09=09} else {
> =09=09=09/*
> =09=09=09 * If we've recently fetched a fine-grained
> =09=09=09 * timestamp then the coarse-grained one may still
> =09=09=09 * be earlier than the existing one. Just keep the
> =09=09=09 * existing ctime if so.
> =09=09=09 */
> =09=09=09ctime =3D inode_get_ctime(inode);
> =09=09=09if (timespec64_compare(&ctime, &now) > 0)
> =09=09=09=09now =3D ctime;
>=20
> =09=09=09/*
> =09=09=09 * Ctime updates are generally protected by inode
> =09=09=09 * lock but we could have raced with setting of
> =09=09=09 * I_CTIME_QUERIED flag.
> =09=09=09 */
> =09=09=09if (cmpxchg(&inode->__i_ctime.tv_nsec, nsec,
> =09=09=09=09    now.tv_nsec) !=3D nsec)
> =09=09=09=09goto fine_grained;
> =09=09=09inode->__i_ctime.tv_sec =3D now.tv_sec;
> =09=09}
> =09=09return now;
> =09}
> fine_grained:
> =09ktime_get_real_ts64(&now);
> =09inode_set_ctime_to_ts(inode, now);
>=20
> =09return now;
> }
>=20
> =09=09=09=09=09=09=09=09Honza
>=20

This is a great idea. I'll rework the series along the lines you
suggest. That also answers my earlier question to Christian:

I'll just resend the whole series (it's not very big anyway), and I'll
include the fill_mg_cmtime prototype change.

Cheers,

> >  static int inode_needs_update_time(struct inode *inode, struct timespe=
c64 *now)
> >  {
> >  =09int sync_it =3D 0;
> > @@ -2480,37 +2545,12 @@ struct timespec64 timestamp_truncate(struct tim=
espec64 t, struct inode *inode)
> >  }
> >  EXPORT_SYMBOL(timestamp_truncate);
> > =20
> > -/**
> > - * current_time - Return FS time
> > - * @inode: inode.
> > - *
> > - * Return the current time truncated to the time granularity supported=
 by
> > - * the fs.
> > - *
> > - * Note that inode and inode->sb cannot be NULL.
> > - * Otherwise, the function warns and returns time without truncation.
> > - */
> > -struct timespec64 current_time(struct inode *inode)
> > -{
> > -=09struct timespec64 now;
> > -
> > -=09ktime_get_coarse_real_ts64(&now);
> > -
> > -=09if (unlikely(!inode->i_sb)) {
> > -=09=09WARN(1, "current_time() called with uninitialized super_block in=
 the inode");
> > -=09=09return now;
> > -=09}
> > -
> > -=09return timestamp_truncate(now, inode);
> > -}
> > -EXPORT_SYMBOL(current_time);
> > -
> >  /**
> >   * inode_set_ctime_current - set the ctime to current_time
> >   * @inode: inode
> >   *
> > - * Set the inode->i_ctime to the current value for the inode. Returns
> > - * the current value that was assigned to i_ctime.
> > + * Set the inode->__i_ctime to the current value for the inode. Return=
s
> > + * the current value that was assigned to __i_ctime.
> >   */
> >  struct timespec64 inode_set_ctime_current(struct inode *inode)
> >  {
> > diff --git a/fs/stat.c b/fs/stat.c
> > index 062f311b5386..51effd1c2bc2 100644
> > --- a/fs/stat.c
> > +++ b/fs/stat.c
> > @@ -26,6 +26,37 @@
> >  #include "internal.h"
> >  #include "mount.h"
> > =20
> > +/**
> > + * fill_mg_cmtime - Fill in the mtime and ctime and flag ctime as QUER=
IED
> > + * @request_mask: STATX_* values requested
> > + * @inode: inode from which to grab the c/mtime
> > + * @stat: where to store the resulting values
> > + *
> > + * Given @inode, grab the ctime and mtime out if it and store the resu=
lt
> > + * in @stat. When fetching the value, flag it as queried so the next w=
rite
> > + * will use a fine-grained timestamp.
> > + */
> > +void fill_mg_cmtime(u32 request_mask, struct inode *inode, struct ksta=
t *stat)
> > +{
> > +=09atomic_long_t *pnsec =3D (atomic_long_t *)&inode->__i_ctime.tv_nsec=
;
> > +
> > +=09/* If neither time was requested, then don't report them */
> > +=09if (!(request_mask & (STATX_CTIME|STATX_MTIME))) {
> > +=09=09stat->result_mask &=3D ~(STATX_CTIME|STATX_MTIME);
> > +=09=09return;
> > +=09}
> > +
> > +=09stat->mtime =3D inode->i_mtime;
> > +=09stat->ctime.tv_sec =3D inode->__i_ctime.tv_sec;
> > +=09/*
> > +=09 * Atomically set the QUERIED flag and fetch the new value with
> > +=09 * the flag masked off.
> > +=09 */
> > +=09stat->ctime.tv_nsec =3D atomic_long_fetch_or(I_CTIME_QUERIED, pnsec=
) &
> > +=09=09=09=09=09~I_CTIME_QUERIED;
> > +}
> > +EXPORT_SYMBOL(fill_mg_cmtime);
> > +
> >  /**
> >   * generic_fillattr - Fill in the basic attributes from the inode stru=
ct
> >   * @idmap:=09idmap of the mount the inode was found from
> > @@ -58,8 +89,14 @@ void generic_fillattr(struct mnt_idmap *idmap, u32 r=
equest_mask,
> >  =09stat->rdev =3D inode->i_rdev;
> >  =09stat->size =3D i_size_read(inode);
> >  =09stat->atime =3D inode->i_atime;
> > -=09stat->mtime =3D inode->i_mtime;
> > -=09stat->ctime =3D inode_get_ctime(inode);
> > +
> > +=09if (is_mgtime(inode)) {
> > +=09=09fill_mg_cmtime(request_mask, inode, stat);
> > +=09} else {
> > +=09=09stat->mtime =3D inode->i_mtime;
> > +=09=09stat->ctime =3D inode_get_ctime(inode);
> > +=09}
> > +
> >  =09stat->blksize =3D i_blocksize(inode);
> >  =09stat->blocks =3D inode->i_blocks;
> > =20
> > diff --git a/include/linux/fs.h b/include/linux/fs.h
> > index 42d1434cc427..a0bdbefbf293 100644
> > --- a/include/linux/fs.h
> > +++ b/include/linux/fs.h
> > @@ -1477,15 +1477,43 @@ static inline bool fsuidgid_has_mapping(struct =
super_block *sb,
> >  struct timespec64 current_time(struct inode *inode);
> >  struct timespec64 inode_set_ctime_current(struct inode *inode);
> > =20
> > +/*
> > + * Multigrain timestamps
> > + *
> > + * Conditionally use fine-grained ctime and mtime timestamps when ther=
e
> > + * are users actively observing them via getattr. The primary use-case
> > + * for this is NFS clients that use the ctime to distinguish between
> > + * different states of the file, and that are often fooled by multiple
> > + * operations that occur in the same coarse-grained timer tick.
> > + *
> > + * The kernel always keeps normalized struct timespec64 values in the =
ctime,
> > + * which means that only the first 30 bits of the value are used. Use =
the
> > + * 31st bit of the ctime's tv_nsec field as a flag to indicate that th=
e value
> > + * has been queried since it was last updated.
> > + */
> > +#define I_CTIME_QUERIED=09=09(1L<<30)
> > +
> >  /**
> >   * inode_get_ctime - fetch the current ctime from the inode
> >   * @inode: inode from which to fetch ctime
> >   *
> > - * Grab the current ctime from the inode and return it.
> > + * Grab the current ctime tv_nsec field from the inode, mask off the
> > + * I_CTIME_QUERIED flag and return it. This is mostly intended for use=
 by
> > + * internal consumers of the ctime that aren't concerned with ensuring=
 a
> > + * fine-grained update on the next change (e.g. when preparing to stor=
e
> > + * the value in the backing store for later retrieval).
> > + *
> > + * This is safe to call regardless of whether the underlying filesyste=
m
> > + * is using multigrain timestamps.
> >   */
> >  static inline struct timespec64 inode_get_ctime(const struct inode *in=
ode)
> >  {
> > -=09return inode->__i_ctime;
> > +=09struct timespec64 ctime;
> > +
> > +=09ctime.tv_sec =3D inode->__i_ctime.tv_sec;
> > +=09ctime.tv_nsec =3D inode->__i_ctime.tv_nsec & ~I_CTIME_QUERIED;
> > +
> > +=09return ctime;
> >  }
> > =20
> >  /**
> > @@ -2261,6 +2289,7 @@ struct file_system_type {
> >  #define FS_USERNS_MOUNT=09=098=09/* Can be mounted by userns root */
> >  #define FS_DISALLOW_NOTIFY_PERM=0916=09/* Disable fanotify permission =
events */
> >  #define FS_ALLOW_IDMAP         32      /* FS has been updated to handl=
e vfs idmappings. */
> > +#define FS_MGTIME=09=0964=09/* FS uses multigrain timestamps */
> >  #define FS_RENAME_DOES_D_MOVE=0932768=09/* FS will handle d_move() dur=
ing rename() internally. */
> >  =09int (*init_fs_context)(struct fs_context *);
> >  =09const struct fs_parameter_spec *parameters;
> > @@ -2284,6 +2313,17 @@ struct file_system_type {
> > =20
> >  #define MODULE_ALIAS_FS(NAME) MODULE_ALIAS("fs-" NAME)
> > =20
> > +/**
> > + * is_mgtime: is this inode using multigrain timestamps
> > + * @inode: inode to test for multigrain timestamps
> > + *
> > + * Return true if the inode uses multigrain timestamps, false otherwis=
e.
> > + */
> > +static inline bool is_mgtime(const struct inode *inode)
> > +{
> > +=09return inode->i_sb->s_type->fs_flags & FS_MGTIME;
> > +}
> > +
> >  extern struct dentry *mount_bdev(struct file_system_type *fs_type,
> >  =09int flags, const char *dev_name, void *data,
> >  =09int (*fill_super)(struct super_block *, void *, int));
> > @@ -2919,6 +2959,7 @@ extern void page_put_link(void *);
> >  extern int page_symlink(struct inode *inode, const char *symname, int =
len);
> >  extern const struct inode_operations page_symlink_inode_operations;
> >  extern void kfree_link(void *);
> > +void fill_mg_cmtime(u32 request_mask, struct inode *inode, struct ksta=
t *stat);
> >  void generic_fillattr(struct mnt_idmap *, u32, struct inode *, struct =
kstat *);
> >  void generic_fill_statx_attr(struct inode *inode, struct kstat *stat);
> >  extern int vfs_getattr_nosec(const struct path *, struct kstat *, u32,=
 unsigned int);
> >=20
> > --=20
> > 2.41.0
> >=20

--=20
Jeff Layton <jlayton@kernel.org>

