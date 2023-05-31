Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7E2717B9F
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 11:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685524796;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=82U6bUpm6YFNkGK5cbhaAjWwDgpxY2X/ujFBNt1W6jk=;
	b=LtsnYKLXWv1wXUcFAfpAkPhopDQAH8xoRHDFlTC+dcl+jAvcSwZewOTwPLywt+uZUmNgdh
	YLQ3f6/i/YFNfGn3UKN83UIqM25kuASTPJTzy5vChq/m7feOisYo3Vl6mLN5vbDL78aoNx
	RgYbOE1lSbpXtU4LxLKXBfNlz1SuulI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-47UgE3lsPwevx9OHTClG8g-1; Wed, 31 May 2023 05:19:52 -0400
X-MC-Unique: 47UgE3lsPwevx9OHTClG8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03EA9185A793;
	Wed, 31 May 2023 09:19:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA8D7C154D7;
	Wed, 31 May 2023 09:19:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AC47A19465A8;
	Wed, 31 May 2023 09:19:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1E9DC1946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 09:02:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 08E2C40BB2D; Wed, 31 May 2023 09:02:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00B58492B00
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 09:02:14 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D57B1858F0F
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 09:02:14 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-9E-yOgDWMvqiHE4C7YekRw-1; Wed, 31 May 2023 05:02:12 -0400
X-MC-Unique: 9E-yOgDWMvqiHE4C7YekRw-1
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-51458e3af68so9164526a12.2
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 02:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685523731; x=1688115731;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=82U6bUpm6YFNkGK5cbhaAjWwDgpxY2X/ujFBNt1W6jk=;
 b=RVdyJdt+Z+/PZ7WX0cRViogz1qkQKIWIuo0ApuMzarhVOe9ULLOzgbTq13ZS/xVJ9n
 JW1TXTLU1b5Hnf+CP9GafheYbJoIRAUuctlY/4h6LxcP5fEkJbVO6XOE6QnXfE1tiehz
 7NdbU0LBhWcAAC5vSUTHPtmqIxuQz0ND2iAJMz8EG6D3W9/87NCRydP6uz4y8f30JIO3
 peH0AhZum02SJMgVlX524tUXsXobBUMIcQEjnLPPQ3sukLBUx6OuGRHUFf8zLV3GpKCp
 6nXpWWiBlf3TPsZyG1C8xx2+7lelMZdz4rB3MmK+gpEi1VynT5otaRuliJGDXnqcmUG6
 euRg==
X-Gm-Message-State: AC+VfDySohrpqeOJu/INnANjj3Ie/mk3w+Y9sgy5BAn/q+f1JrpfaeYI
 PxsxAm5fF+sBbDcVqpHkKOlFI75DWc7C2O17vTBJcw==
X-Google-Smtp-Source: ACHHUZ54ruSZ4ErYRXWiU9UTWeerJcU9a8S+taczm8RKgsna09cTe6RnnExPREASsZbWk52M7ju665X7rMMjOFwIvBg=
X-Received: by 2002:a17:907:3f0d:b0:966:634d:9d84 with SMTP id
 hq13-20020a1709073f0d00b00966634d9d84mr5472507ejc.20.1685523730877; Wed, 31
 May 2023 02:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230531075026.480237-1-hch@lst.de>
 <20230531075026.480237-13-hch@lst.de>
In-Reply-To: <20230531075026.480237-13-hch@lst.de>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 31 May 2023 11:01:59 +0200
Message-ID: <CAJfpegutmdRtz1gPyX7MjrgqP-2186sCxtUiANO=8+EdnrLHrg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 12/12] fuse: use direct_write_fallback
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
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: szeredi.hu
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 May 2023 at 09:51, Christoph Hellwig <hch@lst.de> wrote:
>
> Use the generic direct_write_fallback helper instead of duplicating the
> logic.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> ---
>  fs/fuse/file.c | 24 ++----------------------
>  1 file changed, 2 insertions(+), 22 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 025973ad813e05..7a72dc0a691201 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -1340,7 +1340,6 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>         struct file *file = iocb->ki_filp;
>         struct address_space *mapping = file->f_mapping;
>         ssize_t written = 0;
> -       ssize_t written_buffered = 0;
>         struct inode *inode = mapping->host;
>         ssize_t err;
>         struct fuse_conn *fc = get_fuse_conn(inode);
> @@ -1377,30 +1376,11 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>                 goto out;
>
>         if (iocb->ki_flags & IOCB_DIRECT) {
> -               loff_t pos, endbyte;
> -
>                 written = generic_file_direct_write(iocb, from);
>                 if (written < 0 || !iov_iter_count(from))
>                         goto out;
> -
> -               written_buffered = fuse_perform_write(iocb, from);
> -               if (written_buffered < 0) {
> -                       err = written_buffered;
> -                       goto out;
> -               }
> -               pos = iocb->ki_pos - written_buffered;
> -               endbyte = iocb->ki_pos - 1;
> -
> -               err = filemap_write_and_wait_range(file->f_mapping, pos,
> -                                                  endbyte);
> -               if (err)
> -                       goto out;
> -
> -               invalidate_mapping_pages(file->f_mapping,
> -                                        pos >> PAGE_SHIFT,
> -                                        endbyte >> PAGE_SHIFT);
> -
> -               written += written_buffered;
> +               written = direct_write_fallback(iocb, from, written,
> +                               generic_perform_write(iocb, from));

This should use fuse_perform_write().

Last version of the patch was correct; copy-paste error?

Thanks,
Miklos

