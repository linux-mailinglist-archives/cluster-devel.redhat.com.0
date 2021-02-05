Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E846D3110A9
	for <lists+cluster-devel@lfdr.de>; Fri,  5 Feb 2021 20:04:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612551879;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tI9dKm2fDPdncLUu24ZoTpRpNf25gpm7z2NrRKT5sIs=;
	b=GAdvvMxr8rHVUZ5aau/I1sfghdU9Em5NOKYCou/EJuAhsQAcLpsfdQclb9ITICBJ8R5jEh
	NyPXzQrJDf0IWluhl+RlMfRHSZJeHVE5PMqvwFtqJQKwPx3XqwsW5FF0OUujDFjBsPFm48
	mN8GvqaSZVajD/A6rpQ4B1KmlGB6RJQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-443-ZA0YTMy1MFS2u2BIJRclmA-1; Fri, 05 Feb 2021 14:04:37 -0500
X-MC-Unique: ZA0YTMy1MFS2u2BIJRclmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0FAF803F47;
	Fri,  5 Feb 2021 19:04:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3996C5D71D;
	Fri,  5 Feb 2021 19:04:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92EBF18095CB;
	Fri,  5 Feb 2021 19:04:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 115J4RGJ011851 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 5 Feb 2021 14:04:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7565C60C5F; Fri,  5 Feb 2021 19:04:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B3B460BF1;
	Fri,  5 Feb 2021 19:04:24 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9167518095CA;
	Fri,  5 Feb 2021 19:04:24 +0000 (UTC)
Date: Fri, 5 Feb 2021 14:04:22 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: Andrew Price <anprice@redhat.com>,
	Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <976578814.52144351.1612551862541.JavaMail.zimbra@redhat.com>
In-Reply-To: <20210205171018.1677127-3-anprice@redhat.com>
References: <20210205171018.1677127-1-anprice@redhat.com>
	<20210205171018.1677127-3-anprice@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.118, 10.4.195.3]
Thread-Topic: gfs2: Add trusted xattr support
Thread-Index: tzuAGznsmoOQhJlZmgyLFXRpzd8eSA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 2/2] gfs2: Add trusted xattr support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Comments below.

----- Original Message -----
> From: Andreas Gruenbacher <agruenba@redhat.com>
> 
> Add support for an additional filesystem version (sb_fs_format = 1802).
> When a filesystem with the new version is mounted, the filesystem
> supports "trusted.*" xattrs.
> 
> In addition, version 1802 filesystems implement a form of forward
> compatibility for xattrs: when xattrs with an unknown prefix (ea_type)
> are found on a version 1802 filesystem, those attributes are not shown
> by listxattr, and they are not accessible by getxattr, setxattr, or
> removexattr.
> 
> This mechanism might turn out to be what we need in the future, but if
> not, we can always bump the filesystem version and break compatibility
> instead.
> 
> Signed-off-by: Andrew Price <anprice@redhat.com>

If this is from Andreas, it should have his Signed-off-by:

> ---
>  fs/gfs2/ops_fstype.c             | 14 +++++++++-
>  fs/gfs2/super.h                  |  4 ++-
>  fs/gfs2/xattr.c                  | 48 +++++++++++++++++++++++++++++---
>  include/uapi/linux/gfs2_ondisk.h |  5 ++--
>  4 files changed, 63 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
> index 52fe78378faa..64ad19bb978c 100644
> --- a/fs/gfs2/ops_fstype.c
> +++ b/fs/gfs2/ops_fstype.c
> @@ -489,6 +489,19 @@ static int init_sb(struct gfs2_sbd *sdp, int silent)
>  		goto out;
>  	}
>  
> +	switch(sdp->sd_sb.sb_fs_format) {
> +	case GFS2_FS_FORMAT_MAX:
> +		sb->s_xattr = gfs2_xattr_handlers_max;
> +		break;
> +
> +	case GFS2_FS_FORMAT_MIN:
> +		sb->s_xattr = gfs2_xattr_handlers_min;
> +		break;
> +
> +	default:
> +		BUG();
> +	}
> +
>  	/* Set up the buffer cache and SB for real */
>  	if (sdp->sd_sb.sb_bsize < bdev_logical_block_size(sb->s_bdev)) {
>  		ret = -EINVAL;
> @@ -1109,7 +1122,6 @@ static int gfs2_fill_super(struct super_block *sb,
> struct fs_context *fc)
>  	sb->s_op = &gfs2_super_ops;
>  	sb->s_d_op = &gfs2_dops;
>  	sb->s_export_op = &gfs2_export_ops;
> -	sb->s_xattr = gfs2_xattr_handlers;
>  	sb->s_qcop = &gfs2_quotactl_ops;
>  	sb->s_quota_types = QTYPE_MASK_USR | QTYPE_MASK_GRP;
>  	sb_dqopt(sb)->flags |= DQUOT_QUOTA_SYS_FILE;
> diff --git a/fs/gfs2/super.h b/fs/gfs2/super.h
> index 977079693bdc..08e502dec7ec 100644
> --- a/fs/gfs2/super.h
> +++ b/fs/gfs2/super.h
> @@ -58,7 +58,9 @@ extern struct file_system_type gfs2meta_fs_type;
>  extern const struct export_operations gfs2_export_ops;
>  extern const struct super_operations gfs2_super_ops;
>  extern const struct dentry_operations gfs2_dops;
> -extern const struct xattr_handler *gfs2_xattr_handlers[];
> +
> +extern const struct xattr_handler *gfs2_xattr_handlers_max[];
> +extern const struct xattr_handler **gfs2_xattr_handlers_min;
>  
>  #endif /* __SUPER_DOT_H__ */
>  
> diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
> index 9d7667bc4292..a860a144f3d4 100644
> --- a/fs/gfs2/xattr.c
> +++ b/fs/gfs2/xattr.c
> @@ -70,6 +70,20 @@ static int ea_check_size(struct gfs2_sbd *sdp, unsigned
> int nsize, size_t dsize)
>  	return 0;
>  }
>  
> +bool gfs2_eatype_valid(struct gfs2_sbd *sdp, u8 type)

This should be "static bool".

> +{
> +	switch(sdp->sd_sb.sb_fs_format) {
> +	case GFS2_FS_FORMAT_MAX:
> +		return true;
> +
> +	case GFS2_FS_FORMAT_MIN:
> +		return type <= GFS2_EATYPE_SECURITY;
> +
> +	default:
> +		return false;
> +	}
> +}
> +
>  typedef int (*ea_call_t) (struct gfs2_inode *ip, struct buffer_head *bh,
>  			  struct gfs2_ea_header *ea,
>  			  struct gfs2_ea_header *prev, void *private);
> @@ -77,6 +91,7 @@ typedef int (*ea_call_t) (struct gfs2_inode *ip, struct
> buffer_head *bh,
>  static int ea_foreach_i(struct gfs2_inode *ip, struct buffer_head *bh,
>  			ea_call_t ea_call, void *data)
>  {
> +	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
>  	struct gfs2_ea_header *ea, *prev = NULL;
>  	int error = 0;
>  
> @@ -89,9 +104,8 @@ static int ea_foreach_i(struct gfs2_inode *ip, struct
> buffer_head *bh,
>  		if (!(bh->b_data <= (char *)ea && (char *)GFS2_EA2NEXT(ea) <=
>  						  bh->b_data + bh->b_size))
>  			goto fail;
> -		if (!GFS2_EATYPE_VALID(ea->ea_type))
> +		if (!gfs2_eatype_valid(sdp, ea->ea_type))
>  			goto fail;
> -
>  		error = ea_call(ip, bh, ea, prev, data);
>  		if (error)
>  			return error;
> @@ -344,6 +358,7 @@ static int ea_list_i(struct gfs2_inode *ip, struct
> buffer_head *bh,
>  		     struct gfs2_ea_header *ea, struct gfs2_ea_header *prev,
>  		     void *private)
>  {
> +	struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
>  	struct ea_list *ei = private;
>  	struct gfs2_ea_request *er = ei->ei_er;
>  	unsigned int ea_size;
> @@ -353,6 +368,8 @@ static int ea_list_i(struct gfs2_inode *ip, struct
> buffer_head *bh,
>  	if (ea->ea_type == GFS2_EATYPE_UNUSED)
>  		return 0;
>  
> +	BUG_ON(ea->ea_type > GFS2_EATYPE_SECURITY &&
> +	       sdp->sd_sb.sb_fs_format == GFS2_FS_FORMAT_MIN);
>  	switch (ea->ea_type) {
>  	case GFS2_EATYPE_USR:
>  		prefix = "user.";
> @@ -366,8 +383,12 @@ static int ea_list_i(struct gfs2_inode *ip, struct
> buffer_head *bh,
>  		prefix = "security.";
>  		l = 9;
>  		break;
> +	case GFS2_EATYPE_TRUSTED:
> +		prefix = "trusted.";
> +		l = 8;
> +		break;
>  	default:
> -		BUG();
> +		return 0;
>  	}
>  
>  	ea_size = l + ea->ea_name_len + 1;
> @@ -1463,7 +1484,25 @@ static const struct xattr_handler
> gfs2_xattr_security_handler = {
>  	.set    = gfs2_xattr_set,
>  };
>  
> -const struct xattr_handler *gfs2_xattr_handlers[] = {
> +static bool
> +gfs2_xattr_trusted_list(struct dentry *dentry)
> +{
> +	return capable(CAP_SYS_ADMIN);
> +}
> +
> +static const struct xattr_handler gfs2_xattr_trusted_handler = {
> +	.prefix = XATTR_TRUSTED_PREFIX,
> +	.flags  = GFS2_EATYPE_TRUSTED,
> +	.list	= gfs2_xattr_trusted_list,
> +	.get    = gfs2_xattr_get,
> +	.set    = gfs2_xattr_set,
> +};
> +
> +const struct xattr_handler *gfs2_xattr_handlers_max[] = {
> +	/* GFS2_FS_FORMAT_MAX */
> +	&gfs2_xattr_trusted_handler,
> +
> +	/* GFS2_FS_FORMAT_MIN */
>  	&gfs2_xattr_user_handler,
>  	&gfs2_xattr_security_handler,
>  	&posix_acl_access_xattr_handler,
> @@ -1471,3 +1510,4 @@ const struct xattr_handler *gfs2_xattr_handlers[] = {
>  	NULL,
>  };
>  
> +const struct xattr_handler **gfs2_xattr_handlers_min =
> gfs2_xattr_handlers_max + 1;
> diff --git a/include/uapi/linux/gfs2_ondisk.h
> b/include/uapi/linux/gfs2_ondisk.h
> index 07e508e6691b..6ec4291bcc7a 100644
> --- a/include/uapi/linux/gfs2_ondisk.h
> +++ b/include/uapi/linux/gfs2_ondisk.h
> @@ -47,7 +47,7 @@
>  #define GFS2_FORMAT_DE		1200
>  #define GFS2_FORMAT_QU		1500
>  /* These are part of the superblock */
> -#define GFS2_FORMAT_FS		1801
> +#define GFS2_FORMAT_FS		1802
>  #define GFS2_FORMAT_MULTI	1900
>  
>  /*
> @@ -389,8 +389,9 @@ struct gfs2_leaf {
>  #define GFS2_EATYPE_USR		1
>  #define GFS2_EATYPE_SYS		2
>  #define GFS2_EATYPE_SECURITY	3
> +#define GFS2_EATYPE_TRUSTED	4
>  
> -#define GFS2_EATYPE_LAST	3
> +#define GFS2_EATYPE_LAST	4
>  #define GFS2_EATYPE_VALID(x)	((x) <= GFS2_EATYPE_LAST)

GFS2_EATYPE_VALID was replaced by the function and isn't used elsewhere,
so this line should be deleted.
And if we do that, we might as well eliminate GFS2_EATYPE_LAST, or,
alternately, use it in the new function.

Bob

