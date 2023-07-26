Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF3676338A
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jul 2023 12:26:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690367204;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RRpOu41E2pQ4DZsemJWxgaiVrzAnYT38MopmIx7xvso=;
	b=SeMM4QjV9cyNAv0fDJE8lVy1WT7Jn5+6259CwNF/yEK4O8DtLFQzet9j7TH4+tBPuO3FT6
	bKSkrdimAWngv29+QyIohMgmo06b0/NDCw9+TCcKmIooapdJtejPwSwYsE7Aw5cgXihlcI
	h9drykDrHt+rlP0U3LIxgp5qhGqfmVE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-Cas9aWF0MSGn7dG2ipOqww-1; Wed, 26 Jul 2023 06:26:39 -0400
X-MC-Unique: Cas9aWF0MSGn7dG2ipOqww-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB966185A78B;
	Wed, 26 Jul 2023 10:26:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1CD25201EC58;
	Wed, 26 Jul 2023 10:26:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D04CD193F51A;
	Wed, 26 Jul 2023 10:26:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 69DC41946A69 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 26 Jul 2023 10:26:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4881A2166B26; Wed, 26 Jul 2023 10:26:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 404142166B25
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 10:26:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22F233C11A01
 for <cluster-devel@redhat.com>; Wed, 26 Jul 2023 10:26:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-_uuWzpEFNoqhAWLKMdB2QQ-1; Wed, 26 Jul 2023 06:26:33 -0400
X-MC-Unique: _uuWzpEFNoqhAWLKMdB2QQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AF2261A40;
 Wed, 26 Jul 2023 10:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DDF4C433C7;
 Wed, 26 Jul 2023 10:26:24 +0000 (UTC)
Message-ID: <9b3292b65d3c63c50e671c47ed90304c4a8d1af9.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Hugh Dickins <hughd@google.com>
Date: Wed, 26 Jul 2023 06:26:23 -0400
In-Reply-To: <42c5bbe-a7a4-3546-e898-3f33bd71b062@google.com>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-3-a794c2b7abca@kernel.org>
 <42c5bbe-a7a4-3546-e898-3f33bd71b062@google.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v6 3/7] tmpfs: bump the
 mtime/ctime/iversion when page becomes writeable
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
 Mark Fasheh <mark@fasheh.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 linux-f2fs-devel@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-07-25 at 18:39 -0700, Hugh Dickins wrote:
> On Tue, 25 Jul 2023, Jeff Layton wrote:
>=20
> > Most filesystems that use the pagecache will update the mtime, ctime,
> > and change attribute when a page becomes writeable. Add a page_mkwrite
> > operation for tmpfs and just use it to bump the mtime, ctime and change
> > attribute.
> >=20
> > This fixes xfstest generic/080 on tmpfs.
>=20
> Huh.  I didn't notice when this one crept into the multigrain series.
>=20
> I'm inclined to NAK this patch: at the very least, it does not belong
> in the series, but should be discussed separately.
>=20
> Yes, tmpfs does not and never has used page_mkwrite, and gains some
> performance advantage from that.  Nobody has ever asked for this
> change before, or not that I recall.
>=20
> Please drop it from the series: and if you feel strongly, or know
> strong reasons why tmpfs suddenly needs to use page_mkwrite now,
> please argue them separately.  To pass generic/080 is not enough.
>=20
> Thanks,
> Hugh
>=20

Dropped.

This was just something I noticed while testing this series. It stood
out since I was particularly watching for timestamp-related test
failures. I don't feel terribly strongly about it.

Thanks!

> >=20
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  mm/shmem.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/mm/shmem.c b/mm/shmem.c
> > index b154af49d2df..654d9a585820 100644
> > --- a/mm/shmem.c
> > +++ b/mm/shmem.c
> > @@ -2169,6 +2169,16 @@ static vm_fault_t shmem_fault(struct vm_fault *v=
mf)
> >  =09return ret;
> >  }
> > =20
> > +static vm_fault_t shmem_page_mkwrite(struct vm_fault *vmf)
> > +{
> > +=09struct vm_area_struct *vma =3D vmf->vma;
> > +=09struct inode *inode =3D file_inode(vma->vm_file);
> > +
> > +=09file_update_time(vma->vm_file);
> > +=09inode_inc_iversion(inode);
> > +=09return 0;
> > +}
> > +
> >  unsigned long shmem_get_unmapped_area(struct file *file,
> >  =09=09=09=09      unsigned long uaddr, unsigned long len,
> >  =09=09=09=09      unsigned long pgoff, unsigned long flags)
> > @@ -4210,6 +4220,7 @@ static const struct super_operations shmem_ops =
=3D {
> > =20
> >  static const struct vm_operations_struct shmem_vm_ops =3D {
> >  =09.fault=09=09=3D shmem_fault,
> > +=09.page_mkwrite=09=3D shmem_page_mkwrite,
> >  =09.map_pages=09=3D filemap_map_pages,
> >  #ifdef CONFIG_NUMA
> >  =09.set_policy     =3D shmem_set_policy,
> > @@ -4219,6 +4230,7 @@ static const struct vm_operations_struct shmem_vm=
_ops =3D {
> > =20
> >  static const struct vm_operations_struct shmem_anon_vm_ops =3D {
> >  =09.fault=09=09=3D shmem_fault,
> > +=09.page_mkwrite=09=3D shmem_page_mkwrite,
> >  =09.map_pages=09=3D filemap_map_pages,
> >  #ifdef CONFIG_NUMA
> >  =09.set_policy     =3D shmem_set_policy,
> >=20
> > --=20
> > 2.41.0

--=20
Jeff Layton <jlayton@kernel.org>

