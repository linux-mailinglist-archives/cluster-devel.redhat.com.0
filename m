Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3517756E5
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Aug 2023 12:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691575875;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=euRkiTcIdkOt5o+kTCcVlHWtPHYJF4t7fGIBYV8zpHM=;
	b=O4gA5mVeBhRGsDcQPRh9ZXO1t6tKvyEqNrwwXVccmxfebvwaEoVqLdCxRM8w8GKJ3JZZh/
	U9Emc5OTCPVBj1y/kO95ayd7gv2Sxfd9GAwEBGlGoTdYnfdmYmaJQWewfESHNgSMYvRAgu
	fOlQ6AS5mI9HkEUiwklPcc+TW2mQtcg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-wOgxPwtfP1CCkeIKOwwGIg-1; Wed, 09 Aug 2023 06:11:10 -0400
X-MC-Unique: wOgxPwtfP1CCkeIKOwwGIg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 045D680CC34;
	Wed,  9 Aug 2023 10:11:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5965492C13;
	Wed,  9 Aug 2023 10:11:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 540161946594;
	Wed,  9 Aug 2023 10:11:07 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E9AE51946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 10:11:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A3856C15BB8; Wed,  9 Aug 2023 10:11:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BBE5C15BAE
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 10:11:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C9C5299E741
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 10:11:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-Sh8ORDbxPJmz2AadA25nzA-1; Wed, 09 Aug 2023 06:11:03 -0400
X-MC-Unique: Sh8ORDbxPJmz2AadA25nzA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F082630EB;
 Wed,  9 Aug 2023 10:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD92C433C7;
 Wed,  9 Aug 2023 10:10:54 +0000 (UTC)
Message-ID: <52bead1d6a33fec89944b96e2ec20d1ea8747a9a.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Date: Wed, 09 Aug 2023 06:10:53 -0400
In-Reply-To: <87msz08vc7.fsf@mail.parknet.co.jp>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-5-d1dec143a704@kernel.org>
 <87msz08vc7.fsf@mail.parknet.co.jp>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v7 05/13] fat: make fat_update_time get
 its own timestamp
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
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, "Darrick
 J. Wong" <djwong@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 Yue Hu <huyue2@gl0jj8bn.sched.sma.tdnsstic1.cn>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, linux-xfs@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, linux-unionfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 Ilya Dryomov <idryomov@gmail.com>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 codalist@telemann.coda.cs.cmu.edu, Shyam Prasad N <sprasad@microsoft.com>,
 Amir Goldstein <amir73il@gmail.com>, Kees Cook <keescook@chromium.org>,
 ocfs2-devel@lists.linux.dev, Chao Yu <chao@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 Jan Harkes <jaharkes@cs.cmu.edu>, Christian Brauner <brauner@kernel.org>,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-08-09 at 17:37 +0900, OGAWA Hirofumi wrote:
> Jeff Layton <jlayton@kernel.org> writes:
>=20
> > Also, it may be that things have changed by the time we get to calling
> > fat_update_time after checking inode_needs_update_time. Ensure that we
> > attempt the i_version bump if any of the S_* flags besides S_ATIME are
> > set.
>=20
> I'm not sure what it meaning though, this is from
> generic_update_time(). Are you going to change generic_update_time()
> too? If so, it doesn't break lazytime feature?
>=20

Yes. generic_update_time is also being changed in a similar fashion.
This shouldn't break the lazytime feature: lazytime is all about how and
when timestamps get written to disk. This work is all about which
clocksource the timestamps originally come from.

> Thanks.
>=20
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > ---
> >  fs/fat/misc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/fs/fat/misc.c b/fs/fat/misc.c
> > index 67006ea08db6..8cab87145d63 100644
> > --- a/fs/fat/misc.c
> > +++ b/fs/fat/misc.c
> > @@ -347,14 +347,14 @@ int fat_update_time(struct inode *inode, struct t=
imespec64 *now, int flags)
> >  =09=09return 0;
> > =20
> >  =09if (flags & (S_ATIME | S_CTIME | S_MTIME)) {
> > -=09=09fat_truncate_time(inode, now, flags);
> > +=09=09fat_truncate_time(inode, NULL, flags);
> >  =09=09if (inode->i_sb->s_flags & SB_LAZYTIME)
> >  =09=09=09dirty_flags |=3D I_DIRTY_TIME;
> >  =09=09else
> >  =09=09=09dirty_flags |=3D I_DIRTY_SYNC;
> >  =09}
> > =20
> > -=09if ((flags & S_VERSION) && inode_maybe_inc_iversion(inode, false))
> > +=09if ((flags & (S_VERSION|S_CTIME|S_MTIME)) && inode_maybe_inc_iversi=
on(inode, false))
> >  =09=09dirty_flags |=3D I_DIRTY_SYNC;
> > =20
> >  =09__mark_inode_dirty(inode, dirty_flags);
>=20

--=20
Jeff Layton <jlayton@kernel.org>

