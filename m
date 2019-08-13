Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1638D8B2DA
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Aug 2019 10:48:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10F2B30224A8;
	Tue, 13 Aug 2019 08:48:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BED6C1001DC2;
	Tue, 13 Aug 2019 08:48:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDFAD24FDF;
	Tue, 13 Aug 2019 08:48:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7D8mCWX026483 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Aug 2019 04:48:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7180E8247B; Tue, 13 Aug 2019 08:48:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84A965B681;
	Tue, 13 Aug 2019 08:48:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31B4B315C013;
	Tue, 13 Aug 2019 08:48:05 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4E6C720679;
	Tue, 13 Aug 2019 08:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565686084;
	bh=dgkNfsoGvEEUqkSMoKhZo00QGi0KOqUYD1qh2seiDX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YExtdyLDmV5g6i2jgGccJIQ9lpJD2qunpsOWx/skQdmvZBvdutmEsdbbDFgUnYiW9
	lXvB0C/oMwnRrAFZnyypCC3r55bOvbM5/MOv8GxdUmBrJYIbb3l/0Xsrf+14ZRwh2E
	PJJHiAbOF9zt2xlZLKfEtULVL5ySMo91nAG/3xII=
Date: Tue, 13 Aug 2019 10:48:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mark Salyzyn <salyzyn@android.com>
Message-ID: <20190813084801.GA972@kroah.com>
References: <20190812193320.200472-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812193320.200472-1-salyzyn@android.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 13 Aug 2019 08:48:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 13 Aug 2019 08:48:05 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'gregkh@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -5.001  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<gregkh@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
	linux-unionfs@vger.kernel.org,
	David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Eric Paris <eparis@parisplace.org>, netdev@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
	Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
	Sage Weil <sage@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
	Richard Weinberger <richard@nod.at>,
	Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
	James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
	selinux@vger.kernel.org, linux-integrity@vger.kernel.org,
	Vyacheslav Dubeyko <slava@dubeyko.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	kernel-team@android.com, linux-mm@kvack.org,
	devel@lists.orangefs.org, Serge Hallyn <serge@hallyn.com>,
	Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?=
	<ernesto.mnd.fernandez@gmail.com>, linux-cifs@vger.kernel.org,
	Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>,
	reiserfs-devel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	linux-mtd@lists.infradead.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Paul Moore <paul@paul-moore.com>, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Mathieu Malaterre <malat@debian.org>, Stephen Smalley <sds@tycho.nsa.gov>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
	Steve French <sfrench@samba.org>, linux-security-module@vger.kernel.org,
	ocfs2-devel@oss.oracle.com, Jan Kara <jack@suse.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-btrfs@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [PATCH] Add flags option to get xattr method
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 13 Aug 2019 08:48:21 +0000 (UTC)

On Mon, Aug 12, 2019 at 12:32:49PM -0700, Mark Salyzyn wrote:
> --- a/include/linux/xattr.h
> +++ b/include/linux/xattr.h
> @@ -30,10 +30,10 @@ struct xattr_handler {
>  	const char *prefix;
>  	int flags;      /* fs private flags */
>  	bool (*list)(struct dentry *dentry);
> -	int (*get)(const struct xattr_handler *, struct dentry *dentry,
> +	int (*get)(const struct xattr_handler *handler, struct dentry *dentry,
>  		   struct inode *inode, const char *name, void *buffer,
> -		   size_t size);
> -	int (*set)(const struct xattr_handler *, struct dentry *dentry,
> +		   size_t size, int flags);
> +	int (*set)(const struct xattr_handler *handler, struct dentry *dentry,
>  		   struct inode *inode, const char *name, const void *buffer,
>  		   size_t size, int flags);

Wow, 7 arguments.  Isn't there some nice rule of thumb that says once
you get more then 5, a function becomes impossible to understand?

Surely this could be a structure passed in here somehow, that way when
you add the 8th argument in the future, you don't have to change
everything yet again?  :)

I don't have anything concrete to offer as a replacement fix for this,
but to me this just feels really wrong...

thanks,

greg k-h

