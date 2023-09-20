Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 49BC07A796E
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Sep 2023 12:38:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695206285;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k5Qp2mYLJ+4EC3t3tr9ddz56VFAazH7NzZ1ebC5Fq20=;
	b=E3te78jzO4NSlnnmaNYDNFgX6ekG2qsoUm0cGsvNhahEmuM2+d3ow/Zi30ztDn6YQGdVfU
	hogeCp5J2Yxx0HXYe9Wu+iT4qiAmryDnCaro34jS9a5wZEB1QIDaCQoYN70DFWIW3vRRsN
	ncCMCX8XBl8OqWKGAYMawcytp4l/578=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-CObvrqO7O5G5WLS-gNBO_w-1; Wed, 20 Sep 2023 06:38:01 -0400
X-MC-Unique: CObvrqO7O5G5WLS-gNBO_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6C8A8030A9;
	Wed, 20 Sep 2023 10:38:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80E3D20268CB;
	Wed, 20 Sep 2023 10:37:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 14E5C1946595;
	Wed, 20 Sep 2023 10:37:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A50B9194658D for <cluster-devel@listman.corp.redhat.com>;
 Wed, 20 Sep 2023 10:35:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 90A7640C6EC0; Wed, 20 Sep 2023 10:35:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8932040C6EBF
 for <cluster-devel@redhat.com>; Wed, 20 Sep 2023 10:35:30 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 621CF3C11A09
 for <cluster-devel@redhat.com>; Wed, 20 Sep 2023 10:35:30 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-5Gr2_MZSME2yTMaJTtE2OQ-1; Wed, 20 Sep 2023 06:35:28 -0400
X-MC-Unique: 5Gr2_MZSME2yTMaJTtE2OQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3029961B5F;
 Wed, 20 Sep 2023 10:35:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04647C433C7;
 Wed, 20 Sep 2023 10:35:18 +0000 (UTC)
Message-ID: <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Jan Kara <jack@suse.cz>, Christian Brauner <brauner@kernel.org>
Date: Wed, 20 Sep 2023 06:35:18 -0400
In-Reply-To: <20230920101731.ym6pahcvkl57guto@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
 <20230920101731.ym6pahcvkl57guto@quack3>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
 linux-xfs@vger.kernel.org, "Darrick
 J. Wong" <djwong@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Amir Goldstein <l@gmail.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 bug-gnulib@gnu.org, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 Gao Xiang <xiang@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
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
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-09-20 at 12:17 +0200, Jan Kara wrote:
> On Wed 20-09-23 10:41:30, Christian Brauner wrote:
> > > > f1 was last written to *after* f2 was last written to. If the times=
tamp of f1
> > > > is then lower than the timestamp of f2, timestamps are fundamentall=
y broken.
> > > >=20
> > > > Many things in user-space depend on timestamps, such as build syste=
m
> > > > centered around 'make', but also 'find ... -newer ...'.
> > > >=20
> > >=20
> > >=20
> > > What does breakage with make look like in this situation? The "fuzz"
> > > here is going to be on the order of a jiffy. The typical case for mak=
e
> > > timestamp comparisons is comparing source files vs. a build target. I=
f
> > > those are being written nearly simultaneously, then that could be an
> > > issue, but is that a typical behavior? It seems like it would be hard=
 to
> > > rely on that anyway, esp. given filesystems like NFS that can do lazy
> > > writeback.
> > >=20
> > > One of the operating principles with this series is that timestamps c=
an
> > > be of varying granularity between different files. Note that Linux
> > > already violates this assumption when you're working across filesyste=
ms
> > > of different types.
> > >=20
> > > As to potential fixes if this is a real problem:
> > >=20
> > > I don't really want to put this behind a mount or mkfs option (a'la
> > > relatime, etc.), but that is one possibility.
> > >=20
> > > I wonder if it would be feasible to just advance the coarse-grained
> > > current_time whenever we end up updating a ctime with a fine-grained
> > > timestamp? It might produce some inode write amplification. Files tha=
t
> >=20
> > Less than ideal imho.
> >=20
> > If this risks breaking existing workloads by enabling it unconditionall=
y
> > and there isn't a clear way to detect and handle these situations
> > without risk of regression then we should move this behind a mount
> > option.
> >=20
> > So how about the following:
> >=20
> > From cb14add421967f6e374eb77c36cc4a0526b10d17 Mon Sep 17 00:00:00 2001
> > From: Christian Brauner <brauner@kernel.org>
> > Date: Wed, 20 Sep 2023 10:00:08 +0200
> > Subject: [PATCH] vfs: move multi-grain timestamps behind a mount option
> >=20
> > While we initially thought we can do this unconditionally it turns out
> > that this might break existing workloads that rely on timestamps in ver=
y
> > specific ways and we always knew this was a possibility. Move
> > multi-grain timestamps behind a vfs mount option.
> >=20
> > Signed-off-by: Christian Brauner <brauner@kernel.org>
>=20
> Surely this is a safe choice as it moves the responsibility to the sysadm=
in
> and the cases where finegrained timestamps are required. But I kind of
> wonder how is the sysadmin going to decide whether mgtime is safe for his
> system or not? Because the possible breakage needn't be obvious at the
> first sight...
>=20

That's the main reason I really didn't want to go with a mount option.
Documenting that may be difficult. While there is some pessimism around
it, I may still take a stab at just advancing the coarse clock whenever
we fetch a fine-grained timestamp. It'd be nice to remove this option in
the future if that turns out to be feasible.

> If I were a sysadmin, I'd rather opt for something like
> finegrained timestamps + lazytime (if I needed the finegrained timestamps
> functionality). That should avoid the IO overhead of finegrained timestam=
ps
> as well and I'd know I can have problems with timestamps only after a
> system crash.

> I've just got another idea how we could solve the problem: Couldn't we
> always just report coarsegrained timestamp to userspace and provide acces=
s
> to finegrained value only to NFS which should know what it's doing?
>=20

I think that'd be hard. First of all, where would we store the second
timestamp? We can't just truncate the fine-grained ones to come up with
a coarse-grained one. It might also be confusing having nfsd and local
filesystems present different attributes.


> > ---
> >  fs/fs_context.c     | 18 ++++++++++++++++++
> >  fs/inode.c          |  4 ++--
> >  fs/proc_namespace.c |  1 +
> >  fs/stat.c           |  2 +-
> >  include/linux/fs.h  |  4 +++-
> >  5 files changed, 25 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/fs/fs_context.c b/fs/fs_context.c
> > index a0ad7a0c4680..dd4dade0bb9e 100644
> > --- a/fs/fs_context.c
> > +++ b/fs/fs_context.c
> > @@ -44,6 +44,7 @@ static const struct constant_table common_set_sb_flag=
[] =3D {
> >  =09{ "mand",=09SB_MANDLOCK },
> >  =09{ "ro",=09=09SB_RDONLY },
> >  =09{ "sync",=09SB_SYNCHRONOUS },
> > +=09{ "mgtime",=09SB_MGTIME },
> >  =09{ },
> >  };
> > =20
> > @@ -52,18 +53,32 @@ static const struct constant_table common_clear_sb_=
flag[] =3D {
> >  =09{ "nolazytime",=09SB_LAZYTIME },
> >  =09{ "nomand",=09SB_MANDLOCK },
> >  =09{ "rw",=09=09SB_RDONLY },
> > +=09{ "nomgtime",=09SB_MGTIME },
> >  =09{ },
> >  };
> > =20
> > +static inline int check_mgtime(unsigned int token, const struct fs_con=
text *fc)
> > +{
> > +=09if (token !=3D SB_MGTIME)
> > +=09=09return 0;
> > +=09if (!(fc->fs_type->fs_flags & FS_MGTIME))
> > +=09=09return invalf(fc, "Filesystem doesn't support multi-grain timest=
amps");
> > +=09return 0;
> > +}
> > +
> >  /*
> >   * Check for a common mount option that manipulates s_flags.
> >   */
> >  static int vfs_parse_sb_flag(struct fs_context *fc, const char *key)
> >  {
> >  =09unsigned int token;
> > +=09int ret;
> > =20
> >  =09token =3D lookup_constant(common_set_sb_flag, key, 0);
> >  =09if (token) {
> > +=09=09ret =3D check_mgtime(token, fc);
> > +=09=09if (ret)
> > +=09=09=09return ret;
> >  =09=09fc->sb_flags |=3D token;
> >  =09=09fc->sb_flags_mask |=3D token;
> >  =09=09return 0;
> > @@ -71,6 +86,9 @@ static int vfs_parse_sb_flag(struct fs_context *fc, c=
onst char *key)
> > =20
> >  =09token =3D lookup_constant(common_clear_sb_flag, key, 0);
> >  =09if (token) {
> > +=09=09ret =3D check_mgtime(token, fc);
> > +=09=09if (ret)
> > +=09=09=09return ret;
> >  =09=09fc->sb_flags &=3D ~token;
> >  =09=09fc->sb_flags_mask |=3D token;
> >  =09=09return 0;
> > diff --git a/fs/inode.c b/fs/inode.c
> > index 54237f4242ff..fd1a2390aaa3 100644
> > --- a/fs/inode.c
> > +++ b/fs/inode.c
> > @@ -2141,7 +2141,7 @@ EXPORT_SYMBOL(current_mgtime);
> > =20
> >  static struct timespec64 current_ctime(struct inode *inode)
> >  {
> > -=09if (is_mgtime(inode))
> > +=09if (IS_MGTIME(inode))
> >  =09=09return current_mgtime(inode);
> >  =09return current_time(inode);
> >  }
> > @@ -2588,7 +2588,7 @@ struct timespec64 inode_set_ctime_current(struct =
inode *inode)
> >  =09=09now =3D current_time(inode);
> > =20
> >  =09=09/* Just copy it into place if it's not multigrain */
> > -=09=09if (!is_mgtime(inode)) {
> > +=09=09if (!IS_MGTIME(inode)) {
> >  =09=09=09inode_set_ctime_to_ts(inode, now);
> >  =09=09=09return now;
> >  =09=09}
> > diff --git a/fs/proc_namespace.c b/fs/proc_namespace.c
> > index 250eb5bf7b52..08f5bf4d2c6c 100644
> > --- a/fs/proc_namespace.c
> > +++ b/fs/proc_namespace.c
> > @@ -49,6 +49,7 @@ static int show_sb_opts(struct seq_file *m, struct su=
per_block *sb)
> >  =09=09{ SB_DIRSYNC, ",dirsync" },
> >  =09=09{ SB_MANDLOCK, ",mand" },
> >  =09=09{ SB_LAZYTIME, ",lazytime" },
> > +=09=09{ SB_MGTIME, ",mgtime" },
> >  =09=09{ 0, NULL }
> >  =09};
> >  =09const struct proc_fs_opts *fs_infop;
> > diff --git a/fs/stat.c b/fs/stat.c
> > index 6e60389d6a15..2f18dd5de18b 100644
> > --- a/fs/stat.c
> > +++ b/fs/stat.c
> > @@ -90,7 +90,7 @@ void generic_fillattr(struct mnt_idmap *idmap, u32 re=
quest_mask,
> >  =09stat->size =3D i_size_read(inode);
> >  =09stat->atime =3D inode->i_atime;
> > =20
> > -=09if (is_mgtime(inode)) {
> > +=09if (IS_MGTIME(inode)) {
> >  =09=09fill_mg_cmtime(stat, request_mask, inode);
> >  =09} else {
> >  =09=09stat->mtime =3D inode->i_mtime;
> > diff --git a/include/linux/fs.h b/include/linux/fs.h
> > index 4aeb3fa11927..03e415fb3a7c 100644
> > --- a/include/linux/fs.h
> > +++ b/include/linux/fs.h
> > @@ -1114,6 +1114,7 @@ extern int send_sigurg(struct fown_struct *fown);
> >  #define SB_NODEV        BIT(2)=09/* Disallow access to device special =
files */
> >  #define SB_NOEXEC       BIT(3)=09/* Disallow program execution */
> >  #define SB_SYNCHRONOUS  BIT(4)=09/* Writes are synced at once */
> > +#define SB_MGTIME=09BIT(5)=09/* Use multi-grain timestamps */
> >  #define SB_MANDLOCK     BIT(6)=09/* Allow mandatory locks on an FS */
> >  #define SB_DIRSYNC      BIT(7)=09/* Directory modifications are synchr=
onous */
> >  #define SB_NOATIME      BIT(10)=09/* Do not update access times. */
> > @@ -2105,6 +2106,7 @@ static inline bool sb_rdonly(const struct super_b=
lock *sb) { return sb->s_flags
> >  =09=09=09=09=09((inode)->i_flags & (S_SYNC|S_DIRSYNC)))
> >  #define IS_MANDLOCK(inode)=09__IS_FLG(inode, SB_MANDLOCK)
> >  #define IS_NOATIME(inode)=09__IS_FLG(inode, SB_RDONLY|SB_NOATIME)
> > +#define IS_MGTIME(inode)=09__IS_FLG(inode, SB_MGTIME)
> >  #define IS_I_VERSION(inode)=09__IS_FLG(inode, SB_I_VERSION)
> > =20
> >  #define IS_NOQUOTA(inode)=09((inode)->i_flags & S_NOQUOTA)
> > @@ -2366,7 +2368,7 @@ struct file_system_type {
> >   */
> >  static inline bool is_mgtime(const struct inode *inode)
> >  {
> > -=09return inode->i_sb->s_type->fs_flags & FS_MGTIME;
> > +=09return inode->i_sb->s_flags & SB_MGTIME;
> >  }
> > =20
> >  extern struct dentry *mount_bdev(struct file_system_type *fs_type,
> > --=20
> > 2.34.1
> >=20

--=20
Jeff Layton <jlayton@kernel.org>

