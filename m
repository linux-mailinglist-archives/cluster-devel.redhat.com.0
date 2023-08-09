Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EBF77687C
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Aug 2023 21:21:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691608883;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vuRLPJqHHB4jKbIejrjNY+b9NF+LaeumSqgXikGIlQ4=;
	b=R1A5S5bnWxknt6/KFwIuvxObUhCQu05RgBlFNH+ZpT0qrfIZUzsSf88p9jr52HPNJ7pf8N
	qgizUdA2xfu4Fc8VRCgfWKU1FsI/xCi08KCDBuOoHnsPshxT796IZdzX11qyZ0xL/PRc2B
	GWBKbneRTzvikWxmVZu89rb2wQ/DgKs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-679-Y6bn8K0xNLOGHv_O_r4NQQ-1; Wed, 09 Aug 2023 15:21:20 -0400
X-MC-Unique: Y6bn8K0xNLOGHv_O_r4NQQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 055F381F46A;
	Wed,  9 Aug 2023 19:21:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86FDB492B0F;
	Wed,  9 Aug 2023 19:21:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D05A519465A0;
	Wed,  9 Aug 2023 19:21:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F35FD1946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 19:05:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DC5EE5CC00; Wed,  9 Aug 2023 19:05:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D45195CC02
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 19:05:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B81A6857A84
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 19:05:38 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-Aczlj4x4P1W457GnfmOIyw-1; Wed, 09 Aug 2023 15:05:32 -0400
X-MC-Unique: Aczlj4x4P1W457GnfmOIyw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1E99E6446B;
 Wed,  9 Aug 2023 19:05:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5CFC433C8;
 Wed,  9 Aug 2023 19:05:22 +0000 (UTC)
Message-ID: <cbc98eb171d6ccacb24213af7d0ae91094d39780.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Mike Marshall <hubcap@omnibond.com>, Christian Brauner <brauner@kernel.org>
Date: Wed, 09 Aug 2023 15:05:21 -0400
In-Reply-To: <CAOg9mST=WFAjEwS9eNi_huoUpBvPy3R3fbFVTLUeFZAv6BJEEQ@mail.gmail.com>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-8-d1dec143a704@kernel.org>
 <20230809-segeln-pflaumen-460b81bd2d3a@brauner>
 <CAOg9mST=WFAjEwS9eNi_huoUpBvPy3R3fbFVTLUeFZAv6BJEEQ@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v7 08/13] fs: drop the timespec64
 argument from update_time
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
 linux-mtd@lists.infradead.org, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
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
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes. It's in Christian's vfs.ctime branch:

https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=3Dvfs.ct=
ime

On Wed, 2023-08-09 at 14:38 -0400, Mike Marshall wrote:
> I've been following this patch on fsdevel... is there a
> remote I could fetch with a branch that has this in it?
>=20
> -Mike
>=20
> On Wed, Aug 9, 2023 at 8:32=E2=80=AFAM Christian Brauner <brauner@kernel.=
org> wrote:
> >=20
> > On Mon, Aug 07, 2023 at 03:38:39PM -0400, Jeff Layton wrote:
> > > Now that all of the update_time operations are prepared for it, we ca=
n
> > > drop the timespec64 argument from the update_time operation. Do that =
and
> > > remove it from some associated functions like inode_update_time and
> > > inode_needs_update_time.
> > >=20
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  fs/bad_inode.c           |  3 +--
> > >  fs/btrfs/inode.c         |  3 +--
> > >  fs/btrfs/volumes.c       |  4 +---
> > >  fs/fat/fat.h             |  3 +--
> > >  fs/fat/misc.c            |  2 +-
> > >  fs/gfs2/inode.c          |  3 +--
> > >  fs/inode.c               | 30 +++++++++++++-----------------
> > >  fs/overlayfs/inode.c     |  2 +-
> > >  fs/overlayfs/overlayfs.h |  2 +-
> > >  fs/ubifs/file.c          |  3 +--
> > >  fs/ubifs/ubifs.h         |  2 +-
> > >  fs/xfs/xfs_iops.c        |  1 -
> > >  include/linux/fs.h       |  4 ++--
> >=20
> > This was missing the conversion of fs/orangefs orangefs_update_time()
> > causing the build to fail. So at some point kbuild will yell here.
> > Fwiw, I've fixed that up in-tree.

Cheers,
--=20
Jeff Layton <jlayton@kernel.org>

