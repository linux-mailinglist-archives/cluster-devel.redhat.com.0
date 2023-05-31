Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 21040717BD4
	for <lists+cluster-devel@lfdr.de>; Wed, 31 May 2023 11:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685525131;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ISkp7pEP+0sRQxyl+Kb79Eh0f1S6sp18TmXfWBaAyu4=;
	b=UvpF3mR0ZkDnqKKPST4YWZlSQV2F4//OxwrN9N7HGMdHV5Dh4mhIzpXMpMfChg6TZjtXPy
	xaqSx34sgTTYjgEwqEgQdVIRZcr8bcUwWH+LvR1zUANzJhAP7qURmugYbRyPzoucBK6zx+
	/ArcV2uq3PLtyCwMrVEha5oPKFJhlro=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-MTiln_saNEmk_TZZ0PB1ag-1; Wed, 31 May 2023 05:25:28 -0400
X-MC-Unique: MTiln_saNEmk_TZZ0PB1ag-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33A032800C5D;
	Wed, 31 May 2023 09:25:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 270BF492B00;
	Wed, 31 May 2023 09:25:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7C4D919451C0;
	Wed, 31 May 2023 09:25:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE7FD1946595 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 31 May 2023 09:11:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CFED1420AA; Wed, 31 May 2023 09:11:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8993420A8
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 09:11:28 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8E45380350A
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 09:11:28 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-313-_TL2M6E4Pb2-7HU5ujp7Ig-1; Wed, 31 May 2023 05:11:26 -0400
X-MC-Unique: _TL2M6E4Pb2-7HU5ujp7Ig-1
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5149e65c244so4582626a12.3
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 02:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685524285; x=1688116285;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ISkp7pEP+0sRQxyl+Kb79Eh0f1S6sp18TmXfWBaAyu4=;
 b=M02QtZzUdRNIgpZpy0+89bwNJiA+UtS++WqIbJK40dAQe6bIua8OoW+HHul90OSnKK
 Qt35oHKVtPzYzKtirPSinmitXn1xBt0bDsAcuPsfSKdN2bE91CIp+AJQuRiBwLfNr1yy
 YKbQXEBXGzf7vKkf3QesYY3oniEYpDpJz0LQ8teBWC+5c1h/ts0ZYHc/EE5jzECAMFpr
 B7hCFnZAHqTOkxMRclw4mAS50mlepKDdl+9LIjBRRJY30AgiLKfhMoqxAYDd3ybYoa5l
 NC9MjbWxPuKW41CJ9sDyURNnijGN/++pyVNAFQO8N21P6A/Gf+yNqR2OHg0/AwCoXk/T
 f1Yw==
X-Gm-Message-State: AC+VfDzjnKBhji8XqIyNFJE7SmZhAteTbruLmNkJVPUjmdO+RfUJqvlF
 Syhl/uJCdACpbe1FzCEu2VETFmZpCKHfg/0a3kn3cA==
X-Google-Smtp-Source: ACHHUZ7qS7TmWM4+gPdkrDhL0bqZjnQfi2Xy2fkSny6o4W3m4Wn8XiF4R2Jdbdnsml8nAyt9sFK0bEVdcGYNFEZCdMs=
X-Received: by 2002:a17:907:7f23:b0:969:9fd0:7ce7 with SMTP id
 qf35-20020a1709077f2300b009699fd07ce7mr5700403ejc.11.1685524285339; Wed, 31
 May 2023 02:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230531075026.480237-1-hch@lst.de>
 <20230531075026.480237-11-hch@lst.de>
In-Reply-To: <20230531075026.480237-11-hch@lst.de>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 31 May 2023 11:11:13 +0200
Message-ID: <CAJfpegth2z06pAH5K5vxRsy1PqygBD=ShiQxoYGqjmJPvk1-aQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 10/12] fuse: update ki_pos in
 fuse_perform_write
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: szeredi.hu
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 May 2023 at 09:51, Christoph Hellwig <hch@lst.de> wrote:
>
> Both callers of fuse_perform_write need to updated ki_pos, move it into
> common code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> ---
>  fs/fuse/file.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 97d435874b14aa..e60e48bf392d49 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -1329,7 +1329,10 @@ static ssize_t fuse_perform_write(struct kiocb *iocb,
>         fuse_write_update_attr(inode, pos, res);
>         clear_bit(FUSE_I_SIZE_UNSTABLE, &fi->state);
>
> -       return res > 0 ? res : err;
> +       if (!res)
> +               return err;
> +       iocb->ki_pos += res;
> +       return res;
>  }
>
>  static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
> @@ -1341,7 +1344,6 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>         struct inode *inode = mapping->host;
>         ssize_t err;
>         struct fuse_conn *fc = get_fuse_conn(inode);
> -       loff_t endbyte = 0;
>
>         if (fc->writeback_cache) {
>                 /* Update size (EOF optimization) and mode (SUID clearing) */
> @@ -1375,19 +1377,20 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>                 goto out;
>
>         if (iocb->ki_flags & IOCB_DIRECT) {
> -               loff_t pos = iocb->ki_pos;
> +               loff_t pos, endbyte;
> +
>                 written = generic_file_direct_write(iocb, from);
>                 if (written < 0 || !iov_iter_count(from))
>                         goto out;
>
> -               pos += written;
> -
> -               written_buffered = fuse_perform_write(iocb, mapping, from, pos);
> +               written_buffered = fuse_perform_write(iocb, mapping, from,
> +                                                     iocb->ki_pos);
>                 if (written_buffered < 0) {
>                         err = written_buffered;
>                         goto out;
>                 }
> -               endbyte = pos + written_buffered - 1;
> +               pos = iocb->ki_pos - written_buffered;
> +               endbyte = iocb->ki_pos - 1;
>
>                 err = filemap_write_and_wait_range(file->f_mapping, pos,
>                                                    endbyte);
> @@ -1399,17 +1402,11 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>                                          endbyte >> PAGE_SHIFT);
>
>                 written += written_buffered;
> -               iocb->ki_pos = pos + written_buffered;
>         } else {
>                 written = fuse_perform_write(iocb, mapping, from, iocb->ki_pos);
> -               if (written >= 0)
> -                       iocb->ki_pos += written;
>         }
>  out:
>         inode_unlock(inode);
> -       if (written > 0)
> -               written = generic_write_sync(iocb, written);

Why remove generic_write_sync()?  Definitely doesn't belong in this
patch even if there's a good reason.

Sorry, didn't notice this in the last round.

Thanks,
Miklos

