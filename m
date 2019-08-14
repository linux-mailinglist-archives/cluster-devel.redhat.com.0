Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B55258D1A7
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Aug 2019 13:00:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E505F3CA1F;
	Wed, 14 Aug 2019 11:00:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B812B891A1;
	Wed, 14 Aug 2019 11:00:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA98E18005A4;
	Wed, 14 Aug 2019 11:00:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7EB0XC9013788 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Aug 2019 07:00:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3488C88B2C; Wed, 14 Aug 2019 11:00:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4554B88B37;
	Wed, 14 Aug 2019 11:00:28 +0000 (UTC)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D01FC08E280;
	Wed, 14 Aug 2019 11:00:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id A5401ADCC;
	Wed, 14 Aug 2019 11:00:23 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 81D741E4200; Wed, 14 Aug 2019 13:00:22 +0200 (CEST)
Date: Wed, 14 Aug 2019 13:00:22 +0200
From: Jan Kara <jack@suse.cz>
To: Mark Salyzyn <salyzyn@android.com>
Message-ID: <20190814110022.GB26273@quack2.suse.cz>
References: <20190813145527.26289-1-salyzyn@android.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813145527.26289-1-salyzyn@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Wed, 14 Aug 2019 11:00:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 14 Aug 2019 11:00:25 +0000 (UTC) for IP:'195.135.220.15'
	DOMAIN:'mx2.suse.de' HELO:'mx1.suse.de' FROM:'jack@suse.cz' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 195.135.220.15 mx2.suse.de 195.135.220.15
	mx2.suse.de <jack@suse.cz>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Phillip Lougher <phillip@squashfs.org.uk>, linux-xfs@vger.kernel.org,
	Martin Brandenburg <martin@omnibond.com>, samba-technical@lists.samba.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Chao Yu <yuchao0@huawei.com>, Mimi Zohar <zohar@linux.ibm.com>,
	Adrian Hunter <adrian.hunter@intel.com>, linux-mm@kvack.org,
	Chris Mason <clm@fb.com>, netdev@vger.kernel.org,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Eric Paris <eparis@parisplace.org>, linux-f2fs-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, Stephen Smalley <sds@tycho.nsa.gov>,
	Mike Marshall <hubcap@omnibond.com>, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
	Sage Weil <sage@redhat.com>, "Darrick J. Wong" <darrick.wong@oracle.com>,
	Richard Weinberger <richard@nod.at>,
	Mark Fasheh <mark@fasheh.com>, linux-unionfs@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
	Joseph Qi <joseph.qi@linux.alibaba.com>, linux-integrity@vger.kernel.org,
	Vyacheslav Dubeyko <slava@dubeyko.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	v9fs-developer@lists.sourceforge.net,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	kernel-team@android.com, devel@lists.orangefs.org,
	Serge Hallyn <serge@hallyn.com>, Gao Xiang <gaoxiang25@huawei.com>,
	Eric Van Hensbergen <ericvh@gmail.com>, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Josef Bacik <josef@toxicpanda.com>,
	reiserfs-devel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
	David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	selinux@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
	David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>, linux-fsdevel@vger.kernel.org,
	Artem Bityutskiy <dedekind1@gmail.com>,
	Mathieu Malaterre <malat@debian.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Tyler Hicks <tyhicks@canonical.com>,
	Steve French <sfrench@samba.org>, Ernesto =?iso-8859-1?Q?A=2E_Fern=E1ndez?=
	<ernesto.mnd.fernandez@gmail.com>, linux-btrfs@vger.kernel.org,
	linux-security-module@vger.kernel.org, Jan Kara <jack@suse.com>,
	Tejun Heo <tj@kernel.org>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com,
	Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [Cluster-devel] [PATCH v2] Add flags option to get xattr method
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 14 Aug 2019 11:00:46 +0000 (UTC)

On Tue 13-08-19 07:55:06, Mark Salyzyn wrote:
...
> diff --git a/fs/xattr.c b/fs/xattr.c
> index 90dd78f0eb27..71f887518d6f 100644
> --- a/fs/xattr.c
> +++ b/fs/xattr.c
...
>  ssize_t
>  __vfs_getxattr(struct dentry *dentry, struct inode *inode, const char *name,
> -	       void *value, size_t size)
> +	       void *value, size_t size, int flags)
>  {
>  	const struct xattr_handler *handler;
> -
> -	handler = xattr_resolve_name(inode, &name);
> -	if (IS_ERR(handler))
> -		return PTR_ERR(handler);
> -	if (!handler->get)
> -		return -EOPNOTSUPP;
> -	return handler->get(handler, dentry, inode, name, value, size);
> -}
> -EXPORT_SYMBOL(__vfs_getxattr);
> -
> -ssize_t
> -vfs_getxattr(struct dentry *dentry, const char *name, void *value, size_t size)
> -{
> -	struct inode *inode = dentry->d_inode;
>  	int error;
>  
> +	if (flags & XATTR_NOSECURITY)
> +		goto nolsm;

Hum, is it OK for XATTR_NOSECURITY to skip even the xattr_permission()
check? I understand that for reads of security xattrs it actually does not
matter in practice but conceptually that seems wrong to me as
XATTR_NOSECURITY is supposed to skip just security-module checks to avoid
recursion AFAIU.

> diff --git a/include/uapi/linux/xattr.h b/include/uapi/linux/xattr.h
> index c1395b5bd432..1216d777d210 100644
> --- a/include/uapi/linux/xattr.h
> +++ b/include/uapi/linux/xattr.h
> @@ -17,8 +17,9 @@
>  #if __UAPI_DEF_XATTR
>  #define __USE_KERNEL_XATTR_DEFS
>  
> -#define XATTR_CREATE	0x1	/* set value, fail if attr already exists */
> -#define XATTR_REPLACE	0x2	/* set value, fail if attr does not exist */
> +#define XATTR_CREATE	 0x1	/* set value, fail if attr already exists */
> +#define XATTR_REPLACE	 0x2	/* set value, fail if attr does not exist */
> +#define XATTR_NOSECURITY 0x4	/* get value, do not involve security check */
>  #endif

It seems confusing to export XATTR_NOSECURITY definition to userspace when
that is kernel-internal flag. I'd just define it in include/linux/xattr.h
somewhere from the top of flags space (like 0x40000000).

Otherwise the patch looks OK to me (cannot really comment on the security
module aspect of this whole thing though).

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

