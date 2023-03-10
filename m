Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 810036B34CA
	for <lists+cluster-devel@lfdr.de>; Fri, 10 Mar 2023 04:24:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678418692;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=11AJMu/0cs/HvqxMiNs1sKMgouvxxTSuRzL9iqx/214=;
	b=bYoY1AOFpnPJ7mupShPA28Qv+0uu7p6xxNIqzpTZYp3ChVI/S6IQXM0xVZERaBZNYDITjw
	gQjyRlQQ9kg89WNP8r+MAkeY5YGY7/W0+HbteWTplxH+LSoxRER3hhrKtbg9rIChBxgF6a
	4v8Tt36W6cawic/mKFFzyHZtYtBPXtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523--uJaaBGlONqSZiR13fY5bA-1; Thu, 09 Mar 2023 22:24:49 -0500
X-MC-Unique: -uJaaBGlONqSZiR13fY5bA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DFA3830F4D;
	Fri, 10 Mar 2023 03:24:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8187B112132D;
	Fri, 10 Mar 2023 03:24:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5EF241946A49;
	Fri, 10 Mar 2023 03:24:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 02B251946597 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 10 Mar 2023 03:24:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D6A45440DE; Fri, 10 Mar 2023 03:24:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEC3E440DD
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 03:24:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0B10857A89
 for <cluster-devel@redhat.com>; Fri, 10 Mar 2023 03:24:47 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-244-4C_YtyGUMaqZy4gPZ_X67Q-1; Thu,
 09 Mar 2023 22:24:41 -0500
X-MC-Unique: 4C_YtyGUMaqZy4gPZ_X67Q-1
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1paTER-00FCSC-2a; Fri, 10 Mar 2023 03:15:47 +0000
Date: Fri, 10 Mar 2023 03:15:47 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <20230310031547.GD3390869@ZenIV>
References: <20230309152127.41427-1-frank.li@vivo.com>
 <20230309152127.41427-2-frank.li@vivo.com>
MIME-Version: 1.0
In-Reply-To: <20230309152127.41427-2-frank.li@vivo.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH v3 2/6] erofs: convert to use
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 09, 2023 at 11:21:23PM +0800, Yangtao Li wrote:
> Use i_blockmask() to simplify code.

Umm...  What's the branchpoint for that series?  Not the mainline -
there we have i_blocksize() open-coded...

> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v3:
> -none
> v2:
> -convert to i_blockmask()
>  fs/erofs/data.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/erofs/data.c b/fs/erofs/data.c
> index 7e8baf56faa5..e9d1869cd4b3 100644
> --- a/fs/erofs/data.c
> +++ b/fs/erofs/data.c
> @@ -380,7 +380,7 @@ static ssize_t erofs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
>  		if (bdev)
>  			blksize_mask = bdev_logical_block_size(bdev) - 1;
>  		else
> -			blksize_mask = i_blocksize(inode) - 1;
> +			blksize_mask = i_blockmask(inode);
>  
>  		if ((iocb->ki_pos | iov_iter_count(to) |
>  		     iov_iter_alignment(to)) & blksize_mask)
> -- 
> 2.25.1
> 

