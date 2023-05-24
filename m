Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB8670EEFC
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 09:07:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684912062;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=q4naoP/v86EKmAo+u6ifRRW3QrLb6CXC2bVZOo7DIRg=;
	b=hRsKmXHZ3Fz1Vrg93Vhl+v/fgSVulhKouNFD3OkPRhwsYw4XHmF6dJHw2GYDS8i2Xs/wKF
	I5++xF2i487MYbHcqM7MRjR0mlxJrlk8WwufaoUMbHCD98vZdm0NjEV8n/a+BBgBSNh/ip
	lpEgrE0ablLbFmO6CRi9HC+DY7iMINI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-AOUx71R4NO6yzvuSrAW2tw-1; Wed, 24 May 2023 03:07:39 -0400
X-MC-Unique: AOUx71R4NO6yzvuSrAW2tw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C5C928EC105;
	Wed, 24 May 2023 07:07:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D99661121315;
	Wed, 24 May 2023 07:07:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9E07419465B3;
	Wed, 24 May 2023 07:07:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4A61F19465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 07:07:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EEA94C164EE; Wed, 24 May 2023 07:07:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E771FC164ED
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 07:07:36 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C66DB185A78B
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 07:07:36 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-cwx4a_smM1itW2e5x31bbg-1; Wed, 24 May 2023 03:07:35 -0400
X-MC-Unique: cwx4a_smM1itW2e5x31bbg-1
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-510d9218506so1487865a12.1
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 00:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684912054; x=1687504054;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q4naoP/v86EKmAo+u6ifRRW3QrLb6CXC2bVZOo7DIRg=;
 b=h9Ap6Mgrgwni9CfERBfpzC5KrVA9LRoYgoYsdqssWkMEpf7z+S3YjCkE/x1gkqThel
 O7uAmHh95bSCWSDH86phSfvqP+NKoFRfLW9PPgHojo3WXbSbwV6+CUj8UM8oRfj40Ept
 hAOS3tTSTrx7hsWYNsLzUpY/dBULaimEma1f65mjKbfnLGG8iHmOXli/JOaHnNzcCmYW
 7fZCYUgUYVw7x3hmQzYj28o5GhwY45ih3/OR28YdG8HIlX3o6qz3nwjYQT0SeV9MbD/z
 yDevVXJfK+ZDdn9eN7dggNveMdbpzmCXN7mUVxLXhF3KJiYQQ325RdoNjox/q/P2tw3m
 66xg==
X-Gm-Message-State: AC+VfDxoKBXuYW+OjpDn7MzL6WrkrzcSggXTZlPC+qMaTtJiWJEiUeEs
 jwC9syQAaS/jAa1snBPbJKbHFBVChyvkfQzW/9D0Uw==
X-Google-Smtp-Source: ACHHUZ5nu5V36cLreoQ/PYoDJkXFfcE1oq2Gs17vr1i/RZvs/lgKVxpySwPaw/RHPAbV3ltDCF676sVzrLwNPZ6r1Lg=
X-Received: by 2002:a05:6402:2792:b0:50d:83d4:6174 with SMTP id
 b18-20020a056402279200b0050d83d46174mr1222660ede.12.1684912053956; Wed, 24
 May 2023 00:07:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230524063810.1595778-1-hch@lst.de>
 <20230524063810.1595778-11-hch@lst.de>
In-Reply-To: <20230524063810.1595778-11-hch@lst.de>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 24 May 2023 09:07:22 +0200
Message-ID: <CAJfpeguxVXm2pDeNk9M_S_0+ing1dFstaCfB30WcTRCjwwsJvg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH 10/11] fuse: update ki_pos in
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: szeredi.hu
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 May 2023 at 08:38, Christoph Hellwig <hch@lst.de> wrote:
>
> Both callers of fuse_perform_write need to updated ki_pos, move it into
> common code.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> ---
>  fs/fuse/file.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 97d435874b14aa..90d587a7bdf813 100644
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
> @@ -1375,41 +1378,35 @@ static ssize_t fuse_cache_write_iter(struct kiocb *iocb, struct iov_iter *from)
>                 goto out;
>
>         if (iocb->ki_flags & IOCB_DIRECT) {
> -               loff_t pos = iocb->ki_pos;
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
> +               endbyte = iocb->ki_pos + written_buffered - 1;

Wrong endpos.

>
> -               err = filemap_write_and_wait_range(file->f_mapping, pos,
> +               err = filemap_write_and_wait_range(file->f_mapping,
> +                                                  iocb->ki_pos,

Wrong startpos.

>                                                    endbyte);
>                 if (err)
>                         goto out;
>
>                 invalidate_mapping_pages(file->f_mapping,
> -                                        pos >> PAGE_SHIFT,
> +                                        iocb->ki_pos >> PAGE_SHIFT,

Same here.

>                                          endbyte >> PAGE_SHIFT);
>
>                 written += written_buffered;
> -               iocb->ki_pos = pos + written_buffered;
> +               iocb->ki_pos += written_buffered;

Already added in fuse_perform_write().

>         } else {
>                 written = fuse_perform_write(iocb, mapping, from, iocb->ki_pos);
> -               if (written >= 0)
> -                       iocb->ki_pos += written;
>         }
>  out:
>         inode_unlock(inode);
> -       if (written > 0)
> -               written = generic_write_sync(iocb, written);
> -
>         return written ? written : err;
>  }
>
> --
> 2.39.2
>

