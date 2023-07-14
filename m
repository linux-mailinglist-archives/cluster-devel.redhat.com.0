Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE2E753A45
	for <lists+cluster-devel@lfdr.de>; Fri, 14 Jul 2023 13:59:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689335941;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hHYKpItuEcJuo5Jv3chYxiDW/iXWwzUQH5pKsFYaAmw=;
	b=HG1EwY0gxRBLFFuhhQXsUj6o+HJUnb+WCjFWBFUFxne8z7E8OJGZscjz3xbkJ8PQozDgBi
	4A+ZpXBEDZdJ4gcV/fPzXQJvRSt2nI4AcOW3T3zLs+mQawsaId4YK0h52GeQdA65QxGwsw
	f6VsC7wWby0VLXPTuQKmwIhAKgZJ0/E=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-BMumvgckNnWDqLi4S3F0Zg-1; Fri, 14 Jul 2023 07:58:58 -0400
X-MC-Unique: BMumvgckNnWDqLi4S3F0Zg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BEBC3C0D187;
	Fri, 14 Jul 2023 11:58:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5CF940C2063;
	Fri, 14 Jul 2023 11:58:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A6EDE19465A2;
	Fri, 14 Jul 2023 11:58:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ABC821946594 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 14 Jul 2023 11:51:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8112AC57964; Fri, 14 Jul 2023 11:51:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78E79C57963
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 11:51:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D1081C0512C
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 11:51:17 +0000 (UTC)
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-edi3UpinNryKnn1mIEpR6Q-1; Fri, 14 Jul 2023 07:51:16 -0400
X-MC-Unique: edi3UpinNryKnn1mIEpR6Q-1
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-440cb3204feso309518137.1
 for <cluster-devel@redhat.com>; Fri, 14 Jul 2023 04:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689335476; x=1691927476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hHYKpItuEcJuo5Jv3chYxiDW/iXWwzUQH5pKsFYaAmw=;
 b=FIeEKfA65k3f/p0Q6HwlI9Tl81SBEHui3enKSC3rgvNUQKirJ/+/3YqTa/EIsjuKSE
 m5A0ryJBZCLela+of/F/kJWTFXwLCpydoXgiBw8Tyllw9N5lSnqH7VEcMBHZe035zX4m
 HsRtSuMyqagcniJ+dCIpgSNpeBeiq7uKI7SPfUV6HxJa9PtxZ8k1HTw5jkzq712sast4
 7z4gSVXH7nL7euJMTN2zOgslwwpVkwvjay+pzKDAfqlbmIl6WGSdtJEH4KvZbhq4URYD
 rzkMK4D6mWPNYYvfX4P0R/mhiLWCbFR3AU6VPgX+5yDhQ3pp+Bz57vCS3aSXTh7GgsSg
 6/Qw==
X-Gm-Message-State: ABy/qLb6rdy3cHLLk3C8nThLP4CGcc1vsTL+4E1o+ZJXUr0MFI6ZAvEx
 fnZiHnDDfMUH7PfZZp21/6w3pM2aDjSLivjdba6MCszjgmsm+yR3dY2wIdlKOdRrFplsmj35jR0
 5we7rFbGAVI17whaCRnkFH0ATbpv9OnqgEa0u4g==
X-Received: by 2002:a05:6102:356d:b0:443:6a86:7cdb with SMTP id
 bh13-20020a056102356d00b004436a867cdbmr2336846vsb.26.1689335475694; 
 Fri, 14 Jul 2023 04:51:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEjAug34qhiq9imIKX0hj5b4gr40mdR/NGOFzRruEDaaBApIulRCMsngeXKHA4c6mKq6RlNDiK1p89T/CJQsZ8=
X-Received: by 2002:a05:6102:356d:b0:443:6a86:7cdb with SMTP id
 bh13-20020a056102356d00b004436a867cdbmr2336824vsb.26.1689335475401; Fri, 14
 Jul 2023 04:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <202307132107.2ce4ea2f-oliver.sang@intel.com>
 <20230713150923.GA28246@lst.de> <ZLAZn_SBmoIFG5F5@yuki>
In-Reply-To: <ZLAZn_SBmoIFG5F5@yuki>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 14 Jul 2023 13:50:58 +0200
Message-ID: <CAASaF6xbgSf+X+SF8wLjFrsMA4=XxHti0SXDZQP1ZqdGYp4aUQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Fri, 14 Jul 2023 11:58:57 +0000
Subject: Re: [Cluster-devel] [LTP] [linus:master] [iomap] 219580eea1:
 ltp.writev07.fail
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, Ilya Dryomov <idryomov@gmail.com>,
 Miklos Szeredi <mszeredi@redhat.com>, Chao Yu <chao@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, ltp@lists.linux.it,
 lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, kernel test robot <oliver.sang@intel.com>,
 Anna Schumaker <anna@kernel.org>, oe-lkp@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>, Hannes Reinecke <hare@suse.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 13, 2023 at 5:38=E2=80=AFPM Cyril Hrubis <chrubis@suse.cz> wrot=
e:
>
> Hi!
> > I can't reproduce this on current mainline.  Is this a robust failure
> > or flapping test?  Especiall as the FAIL conditions look rather
> > unrelated.

It's consistently reproducible for me on xfs with HEAD at:
eb26cbb1a754 ("Merge tag 'platform-drivers-x86-v6.5-2' of
git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86")

>
> Actually the test is spot on, the difference is that previously the
> error was returned form the iomap_file_buffered_write() only if we
> failed with the first buffer from the iov, now we always return the
> error and we do not advance the offset.
>
> The change that broke it:
>
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 063133ec77f4..550525a525c4 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -864,16 +864,19 @@ iomap_file_buffered_write(struct kiocb *iocb, struc=
t iov_iter *i,
>                 .len            =3D iov_iter_count(i),
>                 .flags          =3D IOMAP_WRITE,
>         };
> -       int ret;
> +       ssize_t ret;
>
>         if (iocb->ki_flags & IOCB_NOWAIT)
>                 iter.flags |=3D IOMAP_NOWAIT;
>
>         while ((ret =3D iomap_iter(&iter, ops)) > 0)
>                 iter.processed =3D iomap_write_iter(&iter, i);
> -       if (iter.pos =3D=3D iocb->ki_pos)
> +
> +       if (unlikely(ret < 0))
>                 return ret;
> -       return iter.pos - iocb->ki_pos;
> +       ret =3D iter.pos - iocb->ki_pos;
> +       iocb->ki_pos +=3D ret;
> +       return ret;
>  }
>
> I suppose that we shoudl fix is with something as:
>
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index adb92cdb24b0..bfb39f7bc303 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -872,11 +872,12 @@ iomap_file_buffered_write(struct kiocb *iocb, struc=
t iov_iter *i,
>         while ((ret =3D iomap_iter(&iter, ops)) > 0)
>                 iter.processed =3D iomap_write_iter(&iter, i);
>
> +       iocb->ki_pos +=3D iter.pos - iocb->ki_pos;
> +
>         if (unlikely(ret < 0))
>                 return ret;
> -       ret =3D iter.pos - iocb->ki_pos;
> -       iocb->ki_pos +=3D ret;
> -       return ret;
> +
> +       return iter.pos - iocb->ki_pos;

Replacing "ret" with "iter.pos - iocb->ki_pos" here doesn't look
equivalent to original,
because you already updated "iocb->ki_pos" few lines above.

Wouldn't it be enough to bring the old condition back?

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index adb92cdb24b0..7cc9f7274883 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -872,7 +872,7 @@ iomap_file_buffered_write(struct kiocb *iocb,
struct iov_iter *i,
        while ((ret =3D iomap_iter(&iter, ops)) > 0)
                iter.processed =3D iomap_write_iter(&iter, i);

-       if (unlikely(ret < 0))
+       if (unlikely(iter.pos =3D=3D iocb->ki_pos))
                return ret;
        ret =3D iter.pos - iocb->ki_pos;
        iocb->ki_pos +=3D ret;

(with hunk above applied)
# ./writev07
tst_test.c:1526: TINFO: Timeout per run is 0h 00m 30s
writev07.c:50: TINFO: starting test with initial file offset: 0
writev07.c:94: TINFO: writev() has written 64 bytes
writev07.c:105: TPASS: file has expected content
writev07.c:116: TPASS: offset at 64 as expected
writev07.c:50: TINFO: starting test with initial file offset: 65
writev07.c:94: TINFO: writev() has written 64 bytes
writev07.c:105: TPASS: file has expected content
writev07.c:116: TPASS: offset at 129 as expected
writev07.c:50: TINFO: starting test with initial file offset: 4096
writev07.c:94: TINFO: writev() has written 64 bytes
writev07.c:105: TPASS: file has expected content
writev07.c:116: TPASS: offset at 4160 as expected
writev07.c:50: TINFO: starting test with initial file offset: 4097
writev07.c:94: TINFO: writev() has written 64 bytes
writev07.c:105: TPASS: file has expected content
writev07.c:116: TPASS: offset at 4161 as expected




>  }
>  EXPORT_SYMBOL_GPL(iomap_file_buffered_write);
>
>
> --
> Cyril Hrubis
> chrubis@suse.cz
>
> --
> Mailing list info: https://lists.linux.it/listinfo/ltp
>

