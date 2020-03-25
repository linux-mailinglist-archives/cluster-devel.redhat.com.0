Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 53148192470
	for <lists+cluster-devel@lfdr.de>; Wed, 25 Mar 2020 10:43:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585129408;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HOWTEgyEPMe+239zikkVitHTUpUqL+lpJdf3ONfHFO0=;
	b=MASvp06JZVKByk1biWm4sDcL8k5qkB8hmx7GS0zsAsqk3Ck/xkdQg5S+PFelKoM2Mxy1Wg
	NCe1pI/e050uZ0pJEGcO0ddb4bhn06vVcCgHqG0o5br0XhNve5DN3Uj4hTbMe8Q2RCpKHU
	DakJBLJ9B+TEUrY3HO7AuMDycdU+/bM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-tCkJwvfTN-mmsvsa8xPVZQ-1; Wed, 25 Mar 2020 05:43:27 -0400
X-MC-Unique: tCkJwvfTN-mmsvsa8xPVZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4E768014CE;
	Wed, 25 Mar 2020 09:43:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8432FBBBE5;
	Wed, 25 Mar 2020 09:43:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A0DD86380;
	Wed, 25 Mar 2020 09:43:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02P9hDe1031490 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 05:43:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 657DE2063FE5; Wed, 25 Mar 2020 09:43:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6156A2026D67
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 09:43:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AFD51017E42
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 09:43:11 +0000 (UTC)
Received: from mail-il1-f196.google.com (mail-il1-f196.google.com
	[209.85.166.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-42-n1AAIgvFPMe-HRpy7btv6g-1; Wed, 25 Mar 2020 05:43:08 -0400
X-MC-Unique: n1AAIgvFPMe-HRpy7btv6g-1
Received: by mail-il1-f196.google.com with SMTP id m7so1230056ilg.5
	for <cluster-devel@redhat.com>; Wed, 25 Mar 2020 02:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WJC80u+Ifj4HCTJaBhCcmeQxlknM9aDMikhj5e78Hk4=;
	b=awe0SOSuyjW+7NGMB3PCwnkJiUZLKN12sEyhpJm8ovRKprpd5F+S3hAwS8VdWHDKFy
	/Nm0KhE5F0SdbXDupcY1DJ6xT2fYGHMl/0/JqYYKdIT5jJL2wf4y5AZxB6U54+z+J/zA
	7e/VWbB/0He9WtXe1z4lRKiAMjeAsZovl/xHCxDEkQlGVqL9/qSlOlMeueYLK4h7/EZA
	Hnn2zFwTiSUS4J36oonCoqSWDdqCMLnpKUFSjv2+mwq4WQVTDFHEJzZr06GEEJH5kDMQ
	V+pwKfmGqKN8Dkl5wJNQovqMp8Wn33O0hM8dle30eUEJ6+ObAcxlLb/Q0soCBF2ayW8K
	IH6g==
X-Gm-Message-State: ANhLgQ0ZeVF5VU8jMIIY65xqPid37IaI42U+v6bUFRHkU4+QrVZ73ubo
	2zFkTif5Zkzx9l1j3PeqaLGznTwRDYurDRw0Dm7Hcg==
X-Google-Smtp-Source: ADFU+vsgfIWqTVfFvZZGiDAww03tclKMezpcFsmTHkThxRNJbwZiwKmblFARFxQj+PxAwoovscn7WyTAXThKOCyBwVE=
X-Received: by 2002:a92:9fd0:: with SMTP id z77mr2593848ilk.257.1585129387289; 
	Wed, 25 Mar 2020 02:43:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200323202259.13363-1-willy@infradead.org>
	<20200323202259.13363-25-willy@infradead.org>
In-Reply-To: <20200323202259.13363-25-willy@infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 25 Mar 2020 10:42:56 +0100
Message-ID: <CAJfpegu7EFcWrg3bP+-2BX_kb52RrzBCo_U3QKYzUkZfe4EjDA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02P9hDe1031490
X-loop: cluster-devel@redhat.com
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v10 24/25] fuse: Convert from readpages
	to readahead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2020 at 9:23 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>
> Use the new readahead operation in fuse.  Switching away from the
> read_cache_pages() helper gets rid of an implicit call to put_page(),
> so we can get rid of the get_page() call in fuse_readpages_fill().
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Dave Chinner <dchinner@redhat.com>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> ---
>  fs/fuse/file.c | 46 +++++++++++++++++++---------------------------
>  1 file changed, 19 insertions(+), 27 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 9d67b830fb7a..5749505bcff6 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -923,9 +923,8 @@ struct fuse_fill_data {
>         unsigned int max_pages;
>  };
>
> -static int fuse_readpages_fill(void *_data, struct page *page)
> +static int fuse_readpages_fill(struct fuse_fill_data *data, struct page =
*page)
>  {
> -       struct fuse_fill_data *data =3D _data;
>         struct fuse_io_args *ia =3D data->ia;
>         struct fuse_args_pages *ap =3D &ia->ap;
>         struct inode *inode =3D data->inode;
> @@ -941,10 +940,8 @@ static int fuse_readpages_fill(void *_data, struct p=
age *page)
>                                         fc->max_pages);
>                 fuse_send_readpages(ia, data->file);
>                 data->ia =3D ia =3D fuse_io_alloc(NULL, data->max_pages);
> -               if (!ia) {
> -                       unlock_page(page);
> +               if (!ia)
>                         return -ENOMEM;
> -               }
>                 ap =3D &ia->ap;
>         }
>
> @@ -954,7 +951,6 @@ static int fuse_readpages_fill(void *_data, struct pa=
ge *page)
>                 return -EIO;
>         }
>
> -       get_page(page);
>         ap->pages[ap->num_pages] =3D page;
>         ap->descs[ap->num_pages].length =3D PAGE_SIZE;
>         ap->num_pages++;
> @@ -962,37 +958,33 @@ static int fuse_readpages_fill(void *_data, struct =
page *page)
>         return 0;
>  }
>
> -static int fuse_readpages(struct file *file, struct address_space *mappi=
ng,
> -                         struct list_head *pages, unsigned nr_pages)
> +static void fuse_readahead(struct readahead_control *rac)
>  {
> -       struct inode *inode =3D mapping->host;
> +       struct inode *inode =3D rac->mapping->host;
>         struct fuse_conn *fc =3D get_fuse_conn(inode);
>         struct fuse_fill_data data;
> -       int err;
> +       struct page *page;
>
> -       err =3D -EIO;
>         if (is_bad_inode(inode))
> -               goto out;
> +               return;
>
> -       data.file =3D file;
> +       data.file =3D rac->file;
>         data.inode =3D inode;
> -       data.nr_pages =3D nr_pages;
> -       data.max_pages =3D min_t(unsigned int, nr_pages, fc->max_pages);
> -;
> +       data.nr_pages =3D readahead_count(rac);
> +       data.max_pages =3D min_t(unsigned int, data.nr_pages, fc->max_pag=
es);
>         data.ia =3D fuse_io_alloc(NULL, data.max_pages);
> -       err =3D -ENOMEM;
>         if (!data.ia)
> -               goto out;
> +               return;
>
> -       err =3D read_cache_pages(mapping, pages, fuse_readpages_fill, &da=
ta);
> -       if (!err) {
> -               if (data.ia->ap.num_pages)
> -                       fuse_send_readpages(data.ia, file);
> -               else
> -                       fuse_io_free(data.ia);
> +       while ((page =3D readahead_page(rac))) {
> +               if (fuse_readpages_fill(&data, page) !=3D 0)

Shouldn't this unlock + put page on error?

Otherwise looks good.

Thanks,
Miklos


