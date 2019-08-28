Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1922C9FDEF
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Aug 2019 11:10:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0D2B4308FC22;
	Wed, 28 Aug 2019 09:10:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A0A460BEC;
	Wed, 28 Aug 2019 09:10:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DDD324F30;
	Wed, 28 Aug 2019 09:10:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7S8wVZn026158 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Aug 2019 04:58:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BF2E45C72D; Wed, 28 Aug 2019 08:58:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx23.extmail.prod.ext.phx2.redhat.com
	[10.5.110.64])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A32B5C1D6;
	Wed, 28 Aug 2019 08:58:25 +0000 (UTC)
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B669102BB38;
	Wed, 28 Aug 2019 08:58:24 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id t15so544200ybg.7;
	Wed, 28 Aug 2019 01:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZkpFpnYPlZJ9QcxAWETe0exvhhGufV9GcXx8KPl75dQ=;
	b=c/7IxRS5bV7/Y1D6aqVDN4h5XY8CLwleVTKbXnD1xvkPuYpdCL6KG1pUCZedAgswVL
	jl/Y/H3TL3Y7v26WGEvK2/K7kQDXltg3Gh1B2bsEXgA+f3ZfuZKs0Owowo137ADQO4O+
	cpzdYN/uTyuwxI00FWQlSRJrDeSiVoypEr2jK5PPgACNzrThi9kqlMgnjpNIbvs06isz
	sSk1xx9N3A6v0UgaCkxeg+WxsqAscnJ0NMP/ilLoKpdluNCBKsgYaS4spNoOe+kfNZNB
	7XBDgWqpy6pn08EBwgtZBm+9GjktdL94w9YatMNYYgi1jW7re8aGyyVgQPga7XhLViSE
	j9Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZkpFpnYPlZJ9QcxAWETe0exvhhGufV9GcXx8KPl75dQ=;
	b=d7u5ccdDrBiP5f3nRYTdrdN0fFAwKAoUe/cDBDDhdAuN1oi9NsODoLKTNiQnZgtcNF
	z35IOi1aieHfj0DI2OEshDeaQx9uHayuAItaGs8my8gYLHh5PgH6GZV9uFfvXddTXCWV
	XrreUGJrP25YHX8nMioywlugm1XwFOYlE2Sjf8LAJJ9wh71w+RvVdrq1PO6GjczZbZs0
	TojbB9gJ1Tz1Hb4xcJDQ+VmUhctMbgLwXyhF5Enh2tk1AbTf/pVMern69sOjkR6ggi1w
	pSiGD2fBcEwrBN0x7oUVHEEzco6E0mJ/fnIWzNMLCNXNuRPGgwGjbUAzxQfsrOiUt3DP
	7BvA==
X-Gm-Message-State: APjAAAWXkDwEoY6jA7gj1c0JIdmXV8c1NVnpJ++saDwSXp6UIrUo5KGi
	GlsAXA0zIekPMTxaFoRAte8j2UIWw/x/yL578dA=
X-Google-Smtp-Source: APXvYqzSub2GIlA5tBXI/WsJGtSH+6zioYqDGzlUhxxxj30lJtRuCO2Hlbsd4xVOf5z0HjodsXgoZMdYp6cwy9sWUoQ=
X-Received: by 2002:a25:c486:: with SMTP id u128mr2051352ybf.428.1566982703595;
	Wed, 28 Aug 2019 01:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190820180716.129882-1-salyzyn@android.com>
	<20190827141952.GB10098@quack2.suse.cz>
In-Reply-To: <20190827141952.GB10098@quack2.suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 28 Aug 2019 11:58:12 +0300
Message-ID: <CAOQ4uxgVWyiEV2s3KNT40jkUjEkn_v2MN5Z--HW=LoA_aZwNOw@mail.gmail.com>
To: Mark Salyzyn <salyzyn@android.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.64]);
	Wed, 28 Aug 2019 08:58:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]);
	Wed, 28 Aug 2019 08:58:24 +0000 (UTC) for IP:'209.85.219.196'
	DOMAIN:'mail-yb1-f196.google.com'
	HELO:'mail-yb1-f196.google.com' FROM:'amir73il@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.099  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.219.196 mail-yb1-f196.google.com 209.85.219.196
	mail-yb1-f196.google.com <amir73il@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.64
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 28 Aug 2019 05:10:15 -0400
Cc: Latchesar Ionkov <lucho@ionkov.net>, Eric Sandeen <sandeen@sandeen.net>,
	Mike Marshall <hubcap@omnibond.com>, linux-xfs <linux-xfs@vger.kernel.org>,
	James Morris <jmorris@namei.org>, devel@lists.orangefs.org,
	Eric Van Hensbergen <ericvh@gmail.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Mathieu Malaterre <malat@debian.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Kleikamp <shaggy@kernel.org>, linux-doc@vger.kernel.org,
	Jeff Layton <jlayton@kernel.org>, Chao Yu <yuchao0@huawei.com>,
	Mimi Zohar <zohar@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>,
	CIFS <linux-cifs@vger.kernel.org>, Paul Moore <paul@paul-moore.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Hugh Dickins <hughd@google.com>, kernel-team@android.com,
	selinux@vger.kernel.org, Brian Foster <bfoster@redhat.com>,
	reiserfs-devel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Miklos Szeredi <miklos@szeredi.hu>, linux-f2fs-devel@lists.sourceforge.net,
	linux-integrity <linux-integrity@vger.kernel.org>,
	Martin Brandenburg <martin@omnibond.com>,
	Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
	linux-afs@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Vyacheslav Dubeyko <slava@dubeyko.com>,
	Allison Henderson <allison.henderson@oracle.com>,
	Ilya Dryomov <idryomov@gmail.com>, Ext4 <linux-ext4@vger.kernel.org>,
	Stephen Smalley <sds@tycho.nsa.gov>, Serge Hallyn <serge@hallyn.com>,
	Gao Xiang <gaoxiang25@huawei.com>,
	Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
	Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
	Linux MM <linux-mm@kvack.org>,
	samba-technical <samba-technical@lists.samba.org>,
	Steve French <sfrench@samba.org>, Tejun Heo <tj@kernel.org>,
	linux-erofs@lists.ozlabs.org, Anna Schumaker <anna.schumaker@netapp.com>,
	ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
	Jan Kara <jack@suse.cz>, Eric Biggers <ebiggers@google.com>,
	Dominique Martinet <asmadeus@codewreck.org>, Jeff Mahoney <jeffm@suse.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	David Howells <dhowells@redhat.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>, devel@driverdev.osuosl.org,
	"J. Bruce Fields" <bfields@redhat.com>,
	Sage Weil <sage@redhat.com>, Richard Weinberger <richard@nod.at>,
	Mark Fasheh <mark@fasheh.com>, =?UTF-8?Q?Ernesto_A=2E_Fern=C3=A1ndez?=
	<ernesto.mnd.fernandez@gmail.com>, cluster-devel@redhat.com,
	v9fs-developer@lists.sourceforge.net,
	Bharath Vedartham <linux.bhar@gmail.com>,
	Jann Horn <jannh@google.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	Artem Bityutskiy <dedekind1@gmail.com>, Netdev <netdev@vger.kernel.org>,
	overlayfs <linux-unionfs@vger.kernel.org>, stable <stable@vger.kernel.org>,
	Tyler Hicks <tyhicks@canonical.com>,
	LSM List <linux-security-module@vger.kernel.org>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	David Woodhouse <dwmw2@infradead.org>,
	Linux Btrfs <linux-btrfs@vger.kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [PATCH v7] Add flags option to get xattr method
	paired to __vfs_getxattr
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 28 Aug 2019 09:10:24 +0000 (UTC)

On Wed, Aug 28, 2019 at 11:15 AM Jan Kara via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On Tue 20-08-19 11:06:48, Mark Salyzyn wrote:
> > diff --git a/Documentation/filesystems/Locking b/Documentation/filesystems/Locking
> > index 204dd3ea36bb..e2687f21c7d6 100644
> > --- a/Documentation/filesystems/Locking
> > +++ b/Documentation/filesystems/Locking
> > @@ -101,12 +101,10 @@ of the locking scheme for directory operations.
> >  ----------------------- xattr_handler operations -----------------------
> >  prototypes:
> >       bool (*list)(struct dentry *dentry);
> > -     int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
> > -                struct inode *inode, const char *name, void *buffer,
> > -                size_t size);
> > -     int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
> > -                struct inode *inode, const char *name, const void *buffer,
> > -                size_t size, int flags);
> > +     int (*get)(const struct xattr_handler *handler,
> > +                struct xattr_gs_flags);
> > +     int (*set)(const struct xattr_handler *handler,
> > +                struct xattr_gs_flags);
>
> The prototype here is really "struct xattr_gs_flags *args", isn't it?
> Otherwise feel free to add:
>
> Reviewed-by: Jan Kara <jack@suse.cz>
>
> for the ext2, ext4, ocfs2, reiserfs, and the generic fs/* bits.
>
>                                                                 Honza

Mark,

That's some CC list you got there... but I never got any of your
patches because they did not
reach fsdevel list.

Did you get a rejection message from ML server?

Thanks,
Amir.

