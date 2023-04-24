Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E07C6ED55C
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 21:28:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682364513;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cC2m6cj4by0ic+ocHcPEbRFoxwEEiKQQoS0Ge1Avf1U=;
	b=YmkDaDL5UBo1+O1wn+s4pqdtiNq2v/ktaBdlwqD1UL/BzOxawDqL4cIuBr2HOWQxmaDIQg
	eTUOslsNymN4tKjc1PApObh0asww/t7T1gh6yo/0Ff+KX4nXarhowpR28GsCIAtPAZaNMC
	SV2cjHax3PqQGrbDq0UKrNnhswGWodQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-tL8oTW7DMcqeplkd4ObCsQ-1; Mon, 24 Apr 2023 15:28:32 -0400
X-MC-Unique: tL8oTW7DMcqeplkd4ObCsQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EF8E185A7A2;
	Mon, 24 Apr 2023 19:28:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2A4852166B2A;
	Mon, 24 Apr 2023 19:28:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B90CE1946595;
	Mon, 24 Apr 2023 19:28:29 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B16BF194658D for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 18:55:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5A4C340C6E68; Mon, 24 Apr 2023 18:55:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 535CB40C6E67
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 18:55:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F8C8101A54F
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 18:55:13 +0000 (UTC)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-k9BaICHyM6CNN86SrdGUyA-1; Mon, 24 Apr 2023 14:55:09 -0400
X-MC-Unique: k9BaICHyM6CNN86SrdGUyA-1
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-246819e2cdaso4715447a91.2
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 11:55:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682362508; x=1684954508;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cC2m6cj4by0ic+ocHcPEbRFoxwEEiKQQoS0Ge1Avf1U=;
 b=c5CNKLWoYURjzgq9PtPSoi26RBPe28lx8P4Qy51ayGZ0A2+CcZWgxbHJ07BNTtqDMn
 /qI/hrPGZYI1BGmrwd+JBVQNlReP0zQw0YfQQaRZJmV7DWMQf6lA87jufAk3Um4IdBLH
 68D7dS/duRwhHmng2eTPCBZuayPeoDUT/STDJM1p63AKj5VXU7juxyS/2HYORtuZik0+
 bWjMeetKUmWz/qFYG9P9Dp+MEU3qpfiY+Xif7d59akJaUAEZWC/Kv/qG4RzrNmHsV621
 g25K7Q1W8jF5WE8zETNJzWH7D0bSEeWDiXJwyrCjOrxxlFayu/QxRdnJZ8mQEtrHSIH4
 Lekw==
X-Gm-Message-State: AAQBX9cxsJ4zuT+gkvS7GKItLpwuyvJVPDRHfhNjvMwpecCW866oQo3V
 P3aZ+/Eg7q/OcZXnZ7Of2JqpzKsEY9L6fQcV59UoKlon+p0mMH+LMghUAYmLisqzgWXO8gRIDvL
 pvUqzMo5EMYyDE0FTb59pwLnJGyGFyRJ2o/izFw==
X-Received: by 2002:a17:90b:3a8d:b0:23e:f855:79ed with SMTP id
 om13-20020a17090b3a8d00b0023ef85579edmr14646830pjb.28.1682362508594; 
 Mon, 24 Apr 2023 11:55:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350bw6UUmfa7x2kgzI/S3M36kQcMIx/LORGs9afdrTUJulizrDq8UK+lWvA5A9k5nXONeKEERR5M4Fbn0vBOkkLM=
X-Received: by 2002:a17:90b:3a8d:b0:23e:f855:79ed with SMTP id
 om13-20020a17090b3a8d00b0023ef85579edmr14646811pjb.28.1682362508271; Mon, 24
 Apr 2023 11:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-6-hch@lst.de>
In-Reply-To: <20230424054926.26927-6-hch@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 24 Apr 2023 20:54:56 +0200
Message-ID: <CAHc6FU7tuLJk1JEHdmK7VmEuvuG2sMg1=D9qYJAuhn2ES4NFAA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 05/17] filemap: update ki_pos in
 generic_perform_write
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
Cc: Jens Axboe <axboe@kernel.dk>, cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 "Darrick J. Wong" <djwong@kernel.org>, ceph-devel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, David Howells <dhowells@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 24, 2023 at 8:22=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
> All callers of generic_perform_write need to updated ki_pos, move it into
> common code.

We've actually got a similar situation with
iomap_file_buffered_write() and its callers. Would it make sense to
fix that up as well?

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/ceph/file.c | 2 --
>  fs/ext4/file.c | 9 +++------
>  fs/f2fs/file.c | 1 -
>  fs/nfs/file.c  | 1 -
>  mm/filemap.c   | 8 ++++----
>  5 files changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/fs/ceph/file.c b/fs/ceph/file.c
> index f4d8bf7dec88a8..feeb9882ef635a 100644
> --- a/fs/ceph/file.c
> +++ b/fs/ceph/file.c
> @@ -1894,8 +1894,6 @@ static ssize_t ceph_write_iter(struct kiocb *iocb, =
struct iov_iter *from)
>                  * can not run at the same time
>                  */
>                 written =3D generic_perform_write(iocb, from);
> -               if (likely(written >=3D 0))
> -                       iocb->ki_pos =3D pos + written;
>                 ceph_end_io_write(inode);
>         }
>
> diff --git a/fs/ext4/file.c b/fs/ext4/file.c
> index 0b8b4499e5ca18..1026acaf1235a0 100644
> --- a/fs/ext4/file.c
> +++ b/fs/ext4/file.c
> @@ -291,12 +291,9 @@ static ssize_t ext4_buffered_write_iter(struct kiocb=
 *iocb,
>
>  out:
>         inode_unlock(inode);
> -       if (likely(ret > 0)) {
> -               iocb->ki_pos +=3D ret;
> -               ret =3D generic_write_sync(iocb, ret);
> -       }
> -
> -       return ret;
> +       if (unlikely(ret <=3D 0))
> +               return ret;
> +       return generic_write_sync(iocb, ret);
>  }
>
>  static ssize_t ext4_handle_inode_extension(struct inode *inode, loff_t o=
ffset,
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f4ab23efcf85f8..5a9ae054b6da7d 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4511,7 +4511,6 @@ static ssize_t f2fs_buffered_write_iter(struct kioc=
b *iocb,
>         current->backing_dev_info =3D NULL;
>
>         if (ret > 0) {
> -               iocb->ki_pos +=3D ret;
>                 f2fs_update_iostat(F2FS_I_SB(inode), inode,
>                                                 APP_BUFFERED_IO, ret);
>         }
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index 893625eacab9fa..abdae2b29369be 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -666,7 +666,6 @@ ssize_t nfs_file_write(struct kiocb *iocb, struct iov=
_iter *from)
>                 goto out;
>
>         written =3D result;
> -       iocb->ki_pos +=3D written;
>         nfs_add_stats(inode, NFSIOS_NORMALWRITTENBYTES, written);
>
>         if (mntflags & NFS_MOUNT_WRITE_EAGER) {
> diff --git a/mm/filemap.c b/mm/filemap.c
> index 2723104cc06a12..0110bde3708b3f 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3960,7 +3960,10 @@ ssize_t generic_perform_write(struct kiocb *iocb, =
struct iov_iter *i)
>                 balance_dirty_pages_ratelimited(mapping);
>         } while (iov_iter_count(i));
>
> -       return written ? written : status;
> +       if (!written)
> +               return status;
> +       iocb->ki_pos +=3D written;

Could be turned into:
iocb->ki_pos =3D pos;

> +       return written;
>  }
>  EXPORT_SYMBOL(generic_perform_write);
>
> @@ -4039,7 +4042,6 @@ ssize_t __generic_file_write_iter(struct kiocb *ioc=
b, struct iov_iter *from)
>                 endbyte =3D pos + status - 1;
>                 err =3D filemap_write_and_wait_range(mapping, pos, endbyt=
e);
>                 if (err =3D=3D 0) {
> -                       iocb->ki_pos =3D endbyte + 1;
>                         written +=3D status;
>                         invalidate_mapping_pages(mapping,
>                                                  pos >> PAGE_SHIFT,
> @@ -4052,8 +4054,6 @@ ssize_t __generic_file_write_iter(struct kiocb *ioc=
b, struct iov_iter *from)
>                 }
>         } else {
>                 written =3D generic_perform_write(iocb, from);
> -               if (likely(written > 0))
> -                       iocb->ki_pos +=3D written;
>         }
>  out:
>         current->backing_dev_info =3D NULL;
> --
> 2.39.2
>

Thanks,
Andreas

