Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A8170B327
	for <lists+cluster-devel@lfdr.de>; Mon, 22 May 2023 04:23:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684722180;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6gCnSvHg5O9ml4/OuYzbyOxwskor4dFbbIHvczRVaEk=;
	b=REeWKdf9lzZyIHyVKrpZsiCIRrbz9D8MagpyLqrq07J/FVP2VaIj6iDWs2rGveImhxeTXN
	C1ogJ9mGXH/f5Jjo4r2Vfv6Gl3k2CPTWA18Xpf3wefJd2jFTXKhfykZWRr3LHM1CHHq5H9
	PtZ+h3xKGToV2QSwJ/Njrns4a6j/SSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-KZvu2BoBO2K-uZC_JBgQEA-1; Sun, 21 May 2023 22:22:57 -0400
X-MC-Unique: KZvu2BoBO2K-uZC_JBgQEA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2027A8007D9;
	Mon, 22 May 2023 02:22:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14905492B0A;
	Mon, 22 May 2023 02:22:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C8EE819465A2;
	Mon, 22 May 2023 02:22:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 45155194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 22 May 2023 02:22:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 21E0B40D1B62; Mon, 22 May 2023 02:22:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ADAF40D1B61
 for <cluster-devel@redhat.com>; Mon, 22 May 2023 02:22:54 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2A1438025F0
 for <cluster-devel@redhat.com>; Mon, 22 May 2023 02:22:53 +0000 (UTC)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-3gmCUHztNIO9A_lgUPxcKg-1; Sun, 21 May 2023 22:22:52 -0400
X-MC-Unique: 3gmCUHztNIO9A_lgUPxcKg-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-53488b6a929so1563988a12.0
 for <cluster-devel@redhat.com>; Sun, 21 May 2023 19:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684722171; x=1687314171;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6gCnSvHg5O9ml4/OuYzbyOxwskor4dFbbIHvczRVaEk=;
 b=P0jJBpRTe73ird08k8eXC6gilG8x5BY4A+Wbo+2NkapT96B6ydwBna8AHQzK4xxUcK
 SyTmldtXQlIpZF1/lYJ+v4Vz8FDOaRLwkdm4CEAWFqj2yCj3lSYRiOQBCc3agfqnfZjm
 CIS50fXqCl/Lg+H1tE4cQdQCIZ+oKDhoLbfT1sj9BVFRBY53tQ9WHc/M8H5PZikyh/R3
 i/Qwe/vjndsYYt2ahs5mFCFs0WXZ6al0ZXV5MJVKx4W2gR3s2PXzDlHGJBhqyJ25wEe6
 23R7z6ktOqFk3dIL66CvDlJ8LofJZKl1CJwpGRAMWuSZBNl58AJ4nRP6rGKpBZtd7Y73
 hyDQ==
X-Gm-Message-State: AC+VfDwtzq2aPyWHThX6/Bwa4Z/b6gx/aKo0Z7WZb+d/m/VvOd1sMJEv
 1isXzYqXHDZ4pkcJJU1OGJp9bSTCnX3Ov9Fghe09XzpLunYAJZzFyEFydlxUpglQuMkvs5mH2Oh
 O5NanbqoPn0Hb9sTp9bnlhQ==
X-Received: by 2002:a05:6a20:428a:b0:10b:e54f:1c00 with SMTP id
 o10-20020a056a20428a00b0010be54f1c00mr597191pzj.57.1684722171603; 
 Sun, 21 May 2023 19:22:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6YIe9VLQS6yzKMQ0WkmEEqdfd17sZ9Y4FgV9G2cXXtS6sfNqDs6Fii9g74G57D4O2vtAJBpQ==
X-Received: by 2002:a05:6a20:428a:b0:10b:e54f:1c00 with SMTP id
 o10-20020a056a20428a00b0010be54f1c00mr597169pzj.57.1684722171305; 
 Sun, 21 May 2023 19:22:51 -0700 (PDT)
Received: from [10.72.12.68] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a631d16000000b0050be8e0b94csm3281962pgd.90.2023.05.21.19.22.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 19:22:50 -0700 (PDT)
Message-ID: <25ae2aff-daab-eaa3-19dd-aa5e56c9b6f1@redhat.com>
Date: Mon, 22 May 2023 10:22:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
References: <20230519093521.133226-1-hch@lst.de>
 <20230519093521.133226-4-hch@lst.de>
From: Xiubo Li <xiubli@redhat.com>
In-Reply-To: <20230519093521.133226-4-hch@lst.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 03/13] filemap: assign
 current->backing_dev_info in generic_perform_write
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/19/23 17:35, Christoph Hellwig wrote:
> Move the assignment to current->backing_dev_info from the callers into
> generic_perform_write to reduce boiler plate code and reduce the scope
> to just around the page dirtying loop.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   fs/ceph/file.c | 4 ----
>   fs/ext4/file.c | 3 ---
>   fs/f2fs/file.c | 2 --
>   fs/nfs/file.c  | 5 +----
>   mm/filemap.c   | 2 ++
>   5 files changed, 3 insertions(+), 13 deletions(-)
>
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index feeb9882ef635a..767f4dfe7def64 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -1791,9 +1791,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   	else
>   		ceph_start_io_write(inode);
>   
> -	/* We can write back this queue in page reclaim */
> -	current->backing_dev_info = inode_to_bdi(inode);
> -
>   	if (iocb->ki_flags & IOCB_APPEND) {
>   		err = ceph_do_getattr(inode, CEPH_STAT_CAP_SIZE, false);
>   		if (err < 0)
> @@ -1938,7 +1935,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, struct iov_iter *from)
>   		ceph_end_io_write(inode);
>   out_unlocked:
>   	ceph_free_cap_flush(prealloc_cf);
> -	current->backing_dev_info = NULL;
>   	return written ? written : err;
>   }
>   
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 50824831d31def..3cb83a3e2e4a2a 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -29,7 +29,6 @@
>   #include <linux/pagevec.h>
>   #include <linux/uio.h>
>   #include <linux/mman.h>
> -#include <linux/backing-dev.h>
>   #include "ext4.h"
>   #include "ext4_jbd2.h"
>   #include "xattr.h"
> @@ -285,9 +284,7 @@ static ssize_t ext4_buffered_write_iter(struct kiocb *iocb,
>   	if (ret <= 0)
>   		goto out;
>   
> -	current->backing_dev_info = inode_to_bdi(inode);
>   	ret = generic_perform_write(iocb, from);
> -	current->backing_dev_info = NULL;
>   
>   out:
>   	inode_unlock(inode);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 9e3855e43a7a63..7134fe8bd008cb 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4517,9 +4517,7 @@ static ssize_t f2fs_buffered_write_iter(struct kiocb *iocb,
>   	if (iocb->ki_flags & IOCB_NOWAIT)
>   		return -EOPNOTSUPP;
>   
> -	current->backing_dev_info = inode_to_bdi(inode);
>   	ret = generic_perform_write(iocb, from);
> -	current->backing_dev_info = NULL;
>   
>   	if (ret > 0) {
>   		f2fs_update_iostat(F2FS_I_SB(inode), inode,
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index 3cc87ae8473356..e8bb4c48a3210a 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -648,11 +648,8 @@ ssize_t nfs_file_write(struct kiocb *iocb, struct iov_iter *from)
>   	since = filemap_sample_wb_err(file->f_mapping);
>   	nfs_start_io_write(inode);
>   	result = generic_write_checks(iocb, from);
> -	if (result > 0) {
> -		current->backing_dev_info = inode_to_bdi(inode);
> +	if (result > 0)
>   		result = generic_perform_write(iocb, from);
> -		current->backing_dev_info = NULL;
> -	}
>   	nfs_end_io_write(inode);
>   	if (result <= 0)
>   		goto out;
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 4d0ec2fa1c7070..bf693ad1da1ece 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3892,6 +3892,7 @@ ssize_t generic_perform_write(struct kiocb *iocb, struct iov_iter *i)
>   	long status = 0;
>   	ssize_t written = 0;
>   
> +	current->backing_dev_info = inode_to_bdi(mapping->host);
>   	do {
>   		struct page *page;
>   		unsigned long offset;	/* Offset into pagecache page */
> @@ -3956,6 +3957,7 @@ ssize_t generic_perform_write(struct kiocb *iocb, struct iov_iter *i)
>   
>   		balance_dirty_pages_ratelimited(mapping);
>   	} while (iov_iter_count(i));
> +	current->backing_dev_info = NULL;
>   
>   	if (!written)
>   		return status;

LGTM.

Reviewed-by: Xiubo Li <xiubli@redhat.com>

Thanks

- Xiubo


