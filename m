Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4963176E0D6
	for <lists+cluster-devel@lfdr.de>; Thu,  3 Aug 2023 09:06:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691046403;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=NOZI/l3L3KOSwr33UWCYkZpjITeZur6tmYRYTjntZV0=;
	b=LUWudqdZwGQm36K6OpEI13HLIZQ6PfnMzkKeHkr1yK5RnzrM39IFXgWUZc4ccdsil5GRCy
	LehxtNN6lRGWfu23zCWhFn7h4S3RmFKXv4EgN3bM45CTlL78Qpx4UJAFcELsdwqqtrd6ho
	bTo4gLVIgI1IzAzWeWfJmEPGDIh5lr8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-vbRKM9CcNNaY1QKvPJ7w_g-1; Thu, 03 Aug 2023 03:06:38 -0400
X-MC-Unique: vbRKM9CcNNaY1QKvPJ7w_g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A415101A54E;
	Thu,  3 Aug 2023 07:06:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86164492B03;
	Thu,  3 Aug 2023 07:06:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0DBF01946A79;
	Thu,  3 Aug 2023 07:06:23 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 63C381946A45 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  3 Aug 2023 07:06:21 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4C370F7FB4; Thu,  3 Aug 2023 07:06:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4489EF7FA6
 for <cluster-devel@redhat.com>; Thu,  3 Aug 2023 07:06:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2463F1C05AA2
 for <cluster-devel@redhat.com>; Thu,  3 Aug 2023 07:06:21 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-7mDFOnqxPFukWla4bDtrqA-1; Thu, 03 Aug 2023 03:06:15 -0400
X-MC-Unique: 7mDFOnqxPFukWla4bDtrqA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9037661C17;
 Thu,  3 Aug 2023 07:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8B8C433C7;
 Thu,  3 Aug 2023 07:05:58 +0000 (UTC)
Date: Thu, 3 Aug 2023 09:05:55 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230803-mulmig-rennen-adbe9b2a6608@brauner>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-5-a794c2b7abca@kernel.org>
 <20230802174853.GC11352@frogsfrogsfrogs>
 <16f46a9e6d88582d53d31a320589a7ba9d232e0c.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <16f46a9e6d88582d53d31a320589a7ba9d232e0c.camel@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v6 5/7] xfs: switch to multigrain
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Aug 02, 2023 at 02:21:49PM -0400, Jeff Layton wrote:
> On Wed, 2023-08-02 at 10:48 -0700, Darrick J. Wong wrote:
> > On Tue, Jul 25, 2023 at 10:58:18AM -0400, Jeff Layton wrote:
> > > Enable multigrain timestamps, which should ensure that there is an
> > > apparent change to the timestamp whenever it has been written after
> > > being actively observed via getattr.
> > > 
> > > Also, anytime the mtime changes, the ctime must also change, and those
> > > are now the only two options for xfs_trans_ichgtime. Have that function
> > > unconditionally bump the ctime, and ASSERT that XFS_ICHGTIME_CHG is
> > > always set.
> > > 
> > > Signed-off-by: Jeff Layton <jlayton@kernel.org>
> > > ---
> > >  fs/xfs/libxfs/xfs_trans_inode.c | 6 +++---
> > >  fs/xfs/xfs_iops.c               | 4 ++--
> > >  fs/xfs/xfs_super.c              | 2 +-
> > >  3 files changed, 6 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/fs/xfs/libxfs/xfs_trans_inode.c b/fs/xfs/libxfs/xfs_trans_inode.c
> > > index 6b2296ff248a..ad22656376d3 100644
> > > --- a/fs/xfs/libxfs/xfs_trans_inode.c
> > > +++ b/fs/xfs/libxfs/xfs_trans_inode.c
> > > @@ -62,12 +62,12 @@ xfs_trans_ichgtime(
> > >  	ASSERT(tp);
> > >  	ASSERT(xfs_isilocked(ip, XFS_ILOCK_EXCL));
> > >  
> > > -	tv = current_time(inode);
> > > +	/* If the mtime changes, then ctime must also change */
> > > +	ASSERT(flags & XFS_ICHGTIME_CHG);
> > >  
> > > +	tv = inode_set_ctime_current(inode);
> > >  	if (flags & XFS_ICHGTIME_MOD)
> > >  		inode->i_mtime = tv;
> > > -	if (flags & XFS_ICHGTIME_CHG)
> > > -		inode_set_ctime_to_ts(inode, tv);
> > >  	if (flags & XFS_ICHGTIME_CREATE)
> > >  		ip->i_crtime = tv;
> > >  }
> > > diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
> > > index 3a9363953ef2..3f89ef5a2820 100644
> > > --- a/fs/xfs/xfs_iops.c
> > > +++ b/fs/xfs/xfs_iops.c
> > > @@ -573,10 +573,10 @@ xfs_vn_getattr(
> > >  	stat->gid = vfsgid_into_kgid(vfsgid);
> > >  	stat->ino = ip->i_ino;
> > >  	stat->atime = inode->i_atime;
> > > -	stat->mtime = inode->i_mtime;
> > > -	stat->ctime = inode_get_ctime(inode);
> > >  	stat->blocks = XFS_FSB_TO_BB(mp, ip->i_nblocks + ip->i_delayed_blks);
> > >  
> > > +	fill_mg_cmtime(request_mask, inode, stat);
> > 
> > Huh.  I would've thought @stat would come first since that's what we're
> > acting upon, but ... eh. :)
> > 
> > If everyone else is ok with the fill_mg_cmtime signature,
> > Acked-by: Darrick J. Wong <djwong@kernel.org>
> > 
> > 
> 
> Good point. We can change the signature. I think xfs is the only caller
> outside of the generic vfs right now, and it'd be best to do it now.
> 
> Christian, would you prefer that I send an updated series, or patches on
> top of vfs.ctime that can be folded in?

Let's fold instead of inundate everyone with almost 100 patches.
When I'll apply I'll remind everyone where the series can be pulled
from anyway.

