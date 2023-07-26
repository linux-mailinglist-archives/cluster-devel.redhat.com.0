Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E2A763443
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jul 2023 12:50:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690368602;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tACp4zZQRomUxp2Ki5qludZto0DV8321eB+LAbkOoPw=;
	b=iHB95MrXzZLdID8IAWarwWfMMMAFXhJFfbo2D+tQdRhzBXIyrUq+V6zc8t2V4lMCnRX7j6
	dBAwaBoEvlwIbNMNiBtVfMKV2Mz+pSKh5i2jccG11JAzzCdU+v7clM8aAgCTUi7EqXp5UT
	oqPUfbSh2echwOMPUTeYTJbmTswx4oM=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-sLjdWB2aMzeeFq7TB5cEEg-1; Wed, 26 Jul 2023 06:50:01 -0400
X-MC-Unique: sLjdWB2aMzeeFq7TB5cEEg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 824DC1C29AE6;
	Wed, 26 Jul 2023 10:50:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E4911121330;
	Wed, 26 Jul 2023 10:50:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F0E27193F51A;
	Wed, 26 Jul 2023 10:49:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AD7F81946A69 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 10:49:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 886554094DC1; Wed, 26 Jul 2023 10:49:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 802B34094DC2
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 10:49:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AAA7100813C
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 10:49:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-pvVyRZQlPC2Dh-o8-C5eoA-1; Wed, 26 Jul 2023 06:49:41 -0400
X-MC-Unique: pvVyRZQlPC2Dh-o8-C5eoA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8E6561A6A;
 Wed, 26 Jul 2023 10:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C146FC433C7;
 Wed, 26 Jul 2023 10:49:37 +0000 (UTC)
Message-ID: <4d4a9a3c59ed2efe5132c01f08a7719c2ea60f04.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Date: Wed, 26 Jul 2023 06:49:36 -0400
In-Reply-To: <1da81657-2ee1-0ef3-c222-66e00d021c24@linux.alibaba.com>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
 <1da81657-2ee1-0ef3-c222-66e00d021c24@linux.alibaba.com>
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
Subject: Re: [Cluster-devel] [PATCH v6 1/7] fs: pass the request_mask to
 generic_fillattr
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
Cc: Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, codalist@coda.cs.cmu.edu, cluster-devel@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 Anthony Iliopoulos <ailiop@suse.com>, ecryptfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, v9fs@lists.linux.dev,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-07-26 at 17:40 +0800, Joseph Qi wrote:
>=20
> On 7/25/23 10:58 PM, Jeff Layton wrote:
> > generic_fillattr just fills in the entire stat struct indiscriminately
> > today, copying data from the inode. There is at least one attribute
> > (STATX_CHANGE_COOKIE) that can have side effects when it is reported,
> > and we're looking at adding more with the addition of multigrain
> > timestamps.
> >=20
> > Add a request_mask argument to generic_fillattr and have most callers
> > just pass in the value that is passed to getattr. Have other callers
> > (e.g. ksmbd) just pass in STATX_BASIC_STATS. Also move the setting of
> > STATX_CHANGE_COOKIE into generic_fillattr.
> >=20
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/9p/vfs_inode.c       |  4 ++--
> >  fs/9p/vfs_inode_dotl.c  |  4 ++--
> >  fs/afs/inode.c          |  2 +-
> >  fs/btrfs/inode.c        |  2 +-
> >  fs/ceph/inode.c         |  2 +-
> >  fs/coda/inode.c         |  3 ++-
> >  fs/ecryptfs/inode.c     |  5 +++--
> >  fs/erofs/inode.c        |  2 +-
> >  fs/exfat/file.c         |  2 +-
> >  fs/ext2/inode.c         |  2 +-
> >  fs/ext4/inode.c         |  2 +-
> >  fs/f2fs/file.c          |  2 +-
> >  fs/fat/file.c           |  2 +-
> >  fs/fuse/dir.c           |  2 +-
> >  fs/gfs2/inode.c         |  2 +-
> >  fs/hfsplus/inode.c      |  2 +-
> >  fs/kernfs/inode.c       |  2 +-
> >  fs/libfs.c              |  4 ++--
> >  fs/minix/inode.c        |  2 +-
> >  fs/nfs/inode.c          |  2 +-
> >  fs/nfs/namespace.c      |  3 ++-
> >  fs/ntfs3/file.c         |  2 +-
> >  fs/ocfs2/file.c         |  2 +-
> >  fs/orangefs/inode.c     |  2 +-
> >  fs/proc/base.c          |  4 ++--
> >  fs/proc/fd.c            |  2 +-
> >  fs/proc/generic.c       |  2 +-
> >  fs/proc/proc_net.c      |  2 +-
> >  fs/proc/proc_sysctl.c   |  2 +-
> >  fs/proc/root.c          |  3 ++-
> >  fs/smb/client/inode.c   |  2 +-
> >  fs/smb/server/smb2pdu.c | 22 +++++++++++-----------
> >  fs/smb/server/vfs.c     |  3 ++-
> >  fs/stat.c               | 18 ++++++++++--------
> >  fs/sysv/itree.c         |  3 ++-
> >  fs/ubifs/dir.c          |  2 +-
> >  fs/udf/symlink.c        |  2 +-
> >  fs/vboxsf/utils.c       |  2 +-
> >  include/linux/fs.h      |  2 +-
> >  mm/shmem.c              |  2 +-
> >  40 files changed, 70 insertions(+), 62 deletions(-)
> >=20
>=20
> ...
>=20
> > diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
> > index 1b337ebce4df..8184499ae7a5 100644
> > --- a/fs/ocfs2/file.c
> > +++ b/fs/ocfs2/file.c
> > @@ -1319,7 +1319,7 @@ int ocfs2_getattr(struct mnt_idmap *idmap, const =
struct path *path,
> >  =09=09goto bail;
> >  =09}
> > =20
> > -=09generic_fillattr(&nop_mnt_idmap, inode, stat);
> > +=09generic_fillattr(&nop_mnt_idmap, request_mask, inode, stat);
>=20
> For ocfs2 part, looks fine to me.
>=20
> Acked-by: Joseph Qi <joseph.qi@linux.alibaba.com>
>=20
> >  =09/*
> >  =09 * If there is inline data in the inode, the inode will normally no=
t
> >  =09 * have data blocks allocated (it may have an external xattr block)=
.
>=20
> ...
>=20
> > diff --git a/fs/stat.c b/fs/stat.c
> > index 8c2b30af19f5..062f311b5386 100644
> > --- a/fs/stat.c
> > +++ b/fs/stat.c
> > @@ -29,6 +29,7 @@
> >  /**
> >   * generic_fillattr - Fill in the basic attributes from the inode stru=
ct
> >   * @idmap:=09idmap of the mount the inode was found from
> > + * @req_mask=09statx request_mask
>=20
> s/req_mask/request_mask
>=20

Thanks. Fixed in my tree.

> >   * @inode:=09Inode to use as the source
> >   * @stat:=09Where to fill in the attributes
> >   *
> > @@ -42,8 +43,8 @@
> >   * uid and gid filds. On non-idmapped mounts or if permission checking=
 is to be
> >   * performed on the raw inode simply passs @nop_mnt_idmap.
> >   */
> > -void generic_fillattr(struct mnt_idmap *idmap, struct inode *inode,
> > -=09=09      struct kstat *stat)
> > +void generic_fillattr(struct mnt_idmap *idmap, u32 request_mask,
> > +=09=09      struct inode *inode, struct kstat *stat)
> >  {
> >  =09vfsuid_t vfsuid =3D i_uid_into_vfsuid(idmap, inode);
> >  =09vfsgid_t vfsgid =3D i_gid_into_vfsgid(idmap, inode);
> > @@ -61,6 +62,12 @@ void generic_fillattr(struct mnt_idmap *idmap, struc=
t inode *inode,
> >  =09stat->ctime =3D inode_get_ctime(inode);
> >  =09stat->blksize =3D i_blocksize(inode);
> >  =09stat->blocks =3D inode->i_blocks;
> > +
> > +=09if ((request_mask & STATX_CHANGE_COOKIE) && IS_I_VERSION(inode)) {
> > +=09=09stat->result_mask |=3D STATX_CHANGE_COOKIE;
> > +=09=09stat->change_cookie =3D inode_query_iversion(inode);
> > +=09}
> > +
> >  }
> >  EXPORT_SYMBOL(generic_fillattr);
> > =20
> > @@ -123,17 +130,12 @@ int vfs_getattr_nosec(const struct path *path, st=
ruct kstat *stat,
> >  =09stat->attributes_mask |=3D (STATX_ATTR_AUTOMOUNT |
> >  =09=09=09=09  STATX_ATTR_DAX);
> > =20
> > -=09if ((request_mask & STATX_CHANGE_COOKIE) && IS_I_VERSION(inode)) {
> > -=09=09stat->result_mask |=3D STATX_CHANGE_COOKIE;
> > -=09=09stat->change_cookie =3D inode_query_iversion(inode);
> > -=09}
> > -
> >  =09idmap =3D mnt_idmap(path->mnt);
> >  =09if (inode->i_op->getattr)
> >  =09=09return inode->i_op->getattr(idmap, path, stat,
> >  =09=09=09=09=09    request_mask, query_flags);
> > =20
> > -=09generic_fillattr(idmap, inode, stat);
> > +=09generic_fillattr(idmap, request_mask, inode, stat);
> >  =09return 0;
> >  }
> >  EXPORT_SYMBOL(vfs_getattr_nosec);
>=20
> ...
>=20

--=20
Jeff Layton <jlayton@kernel.org>

