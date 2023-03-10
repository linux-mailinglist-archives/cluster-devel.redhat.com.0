Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8F16B34CE
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 04:26:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678418800;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=u8e2ZdAGsrDs5mc8tdhL4wOZzMMIPUZ2NIMj6U1DMDU=;
	b=I9gjGOgW1JO6tSiszupqRMvS18df1SLyGSbQ3OczcmVlZ6J4WWMrwoNKBqfp0DCe7z0/AK
	ak5D5pHikqnEkpRd1boI+ILK1XOemZxvCvdLZdhrgGVZqeEC8cDdH6IzP7XJ6C6Szq9fv7
	OoK8ZAbxKbTi3PDEODDSv9y0djwNT6c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-iTIiD0YVPd-7O-dRmkTbaA-1; Thu, 09 Mar 2023 22:26:37 -0500
X-MC-Unique: iTIiD0YVPd-7O-dRmkTbaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 51633280361F;
	Fri, 10 Mar 2023 03:26:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 40D66C15BA0;
	Fri, 10 Mar 2023 03:26:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DB4721946A49;
	Fri, 10 Mar 2023 03:26:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 816BB1946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 03:26:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 46D102026D68; Fri, 10 Mar 2023 03:26:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F21E2026D4B
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 03:26:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F5C9101A521
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 03:26:34 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-331-pWSGceJrPpm5M0ll5xvvKg-1; Thu,
 09 Mar 2023 22:26:30 -0500
X-MC-Unique: pWSGceJrPpm5M0ll5xvvKg-1
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1paTOV-00FCYB-32; Fri, 10 Mar 2023 03:26:12 +0000
Date: Fri, 10 Mar 2023 03:26:11 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20230310032611.GF3390869@ZenIV>
References: <20230309152127.41427-1-frank.li@vivo.com>
 <20230309152127.41427-5-frank.li@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20230309152127.41427-5-frank.li@vivo.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v3 5/6] ocfs2: convert to use
 i_blockmask()
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
Cc: brauner@kernel.org, tytso@mit.edu, joseph.qi@linux.alibaba.com,
 mark@fasheh.com, chao@kernel.org, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, huyue2@coolpad.com, adilger.kernel@dilger.ca,
 jlbec@evilplan.org, jefflexu@linux.alibaba.com, linux-fsdevel@vger.kernel.org,
 xiang@kernel.org, linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 09, 2023 at 11:21:26PM +0800, Yangtao Li wrote:
> Use i_blockmask() to simplify code. BTW convert ocfs2_is_io_unaligned
> to return bool type.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v3:
> -none
>  fs/ocfs2/file.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
> index efb09de4343d..baefab3b12c9 100644
> --- a/fs/ocfs2/file.c
> +++ b/fs/ocfs2/file.c
> @@ -2159,14 +2159,14 @@ int ocfs2_check_range_for_refcount(struct inode *inode, loff_t pos,
>  	return ret;
>  }
>  
> -static int ocfs2_is_io_unaligned(struct inode *inode, size_t count, loff_t pos)
> +static bool ocfs2_is_io_unaligned(struct inode *inode, size_t count, loff_t pos)
>  {
> -	int blockmask = inode->i_sb->s_blocksize - 1;
> +	int blockmask = i_blockmask(inode);
>  	loff_t final_size = pos + count;
>  
>  	if ((pos & blockmask) || (final_size & blockmask))
> -		return 1;
> -	return 0;
> +		return true;
> +	return false;
>  }

Ugh...
	return (pos | count) & blockmask;
surely?  Conversion to bool will take care of the rest.  Or you could make
that
	return ((pos | count) & blockmask) != 0;

And the fact that the value will be the same (i.e. that ->i_blkbits is never
changed by ocfs2) is worth mentioning in commit message...

