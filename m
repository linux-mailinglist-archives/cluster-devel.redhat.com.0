Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0B40F1B0721
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Apr 2020 13:14:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587381293;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xdOyiXBYnByD60lb5kzwoxQMmUpSiyWgs922AjGrGJk=;
	b=J0kg456SM/6wj3G+gNe0ZbA1AlBjesUsw7+s/MpMdrPwNufBZEuQSukPv1e1T6rLc1v/1c
	/1U3jO2no6aUf3Hs7aDC0CHcSPuJ1NnkEf/EB9eo9qJU6xqe1S6R1/O9Wvng6H7iscHtfR
	SNDlkfjc5zsFzBNNgDg1EMZfdHWWbBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-K8lYB4_xPeyFhAXyelEmZA-1; Mon, 20 Apr 2020 07:14:51 -0400
X-MC-Unique: K8lYB4_xPeyFhAXyelEmZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBC4413F9;
	Mon, 20 Apr 2020 11:14:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1986911E7E4;
	Mon, 20 Apr 2020 11:14:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7C4418089CE;
	Mon, 20 Apr 2020 11:14:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03KBEZBV012994 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 20 Apr 2020 07:14:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 278472026983; Mon, 20 Apr 2020 11:14:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 239C92026FFE
	for <cluster-devel@redhat.com>; Mon, 20 Apr 2020 11:14:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 321518FF67F
	for <cluster-devel@redhat.com>; Mon, 20 Apr 2020 11:14:33 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-436-kv0y4ELhMfiTBtKsJETRsg-1; Mon, 20 Apr 2020 07:14:30 -0400
X-MC-Unique: kv0y4ELhMfiTBtKsJETRsg-1
Received: by mail-ej1-f67.google.com with SMTP id nv1so7577957ejb.0
	for <cluster-devel@redhat.com>; Mon, 20 Apr 2020 04:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=okPBkG9vtS/wVdJh/KDIc+hdg6krV+bND5agW6vUaRM=;
	b=N71jh0gkpztkGFm2vsnH4NzacFTKmDbThBb6Rn12dCfSL1jSPbBBgTvQ+sUOokWYxm
	pHMnkhhMOXhy7/KIoYhASev2ic4CNW1gXpOb0sxia+MB1yuWZMLfDTIdyeR6m00zcIDC
	Env0M85/o0Fkv4aCQJLk32cwJOPMJkZ0Vq5KHguCPhz20NMIZTXw5Rd61pU3bR87wcvJ
	yuDRln8zW7oNE64ah+uJei3VxNaQ5Xs3ynz1KtpDsVfzF+8z7uUt2OYZ0gmcKJtydCp5
	HR+zSZlISusfHIy/LAPU5O1Tq6n/qaJiHqZQl+g8/uGbJk9PjCrd7gKwQHwm80jSNuVr
	wcRg==
X-Gm-Message-State: AGi0PuYla5B8btCKFBXkWxcbITvvm5bgWh2IHesaGhCb0lDTFmNCdpLV
	+xDPFA/tWD+xheWfdbXbDQMKplfeTCkNZBkdvSuorw==
X-Google-Smtp-Source: APiQypIVhtjPPYqBEymAM1SkD4SYcU1V6bmTKvyt+63wSYT0tOjvuXxym8edoJZS6GcpMs4Nq+7PF2DextVY/K9Ax1g=
X-Received: by 2002:a17:906:841a:: with SMTP id
	n26mr16038100ejx.43.1587381268754; 
	Mon, 20 Apr 2020 04:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-25-willy@infradead.org>
In-Reply-To: <20200414150233.24495-25-willy@infradead.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 20 Apr 2020 13:14:17 +0200
Message-ID: <CAJfpegsZF=TFQ67vABkE5ghiZoTZF+=_u8tM5U_P6jZeAmv23A@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03KBEZBV012994
X-loop: cluster-devel@redhat.com
Cc: linux-xfs <linux-xfs@vger.kernel.org>,
	William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v11 24/25] fuse: Convert from readpages
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2020 at 5:08 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>
> Implement the new readahead operation in fuse by using __readahead_batch(=
)
> to fill the array of pages in fuse_args_pages directly.  This lets us
> inline fuse_readpages_fill() into fuse_readahead().
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Dave Chinner <dchinner@redhat.com>
> Reviewed-by: William Kucharski <william.kucharski@oracle.com>
> ---
>  fs/fuse/file.c | 99 ++++++++++++++------------------------------------
>  1 file changed, 27 insertions(+), 72 deletions(-)
>
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 9d67b830fb7a..db82fb29dd39 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -915,84 +915,39 @@ static void fuse_send_readpages(struct fuse_io_args=
 *ia, struct file *file)
>         fuse_readpages_end(fc, &ap->args, err);
>  }
>
> -struct fuse_fill_data {
> -       struct fuse_io_args *ia;
> -       struct file *file;
> -       struct inode *inode;
> -       unsigned int nr_pages;
> -       unsigned int max_pages;
> -};
> -
> -static int fuse_readpages_fill(void *_data, struct page *page)
> +static void fuse_readahead(struct readahead_control *rac)
>  {
> -       struct fuse_fill_data *data =3D _data;
> -       struct fuse_io_args *ia =3D data->ia;
> -       struct fuse_args_pages *ap =3D &ia->ap;
> -       struct inode *inode =3D data->inode;
> +       struct inode *inode =3D rac->mapping->host;
>         struct fuse_conn *fc =3D get_fuse_conn(inode);
> +       unsigned int i, max_pages, nr_pages =3D 0;
>
> -       fuse_wait_on_page_writeback(inode, page->index);
> -
> -       if (ap->num_pages &&
> -           (ap->num_pages =3D=3D fc->max_pages ||
> -            (ap->num_pages + 1) * PAGE_SIZE > fc->max_read ||
> -            ap->pages[ap->num_pages - 1]->index + 1 !=3D page->index)) {
> -               data->max_pages =3D min_t(unsigned int, data->nr_pages,
> -                                       fc->max_pages);
> -               fuse_send_readpages(ia, data->file);
> -               data->ia =3D ia =3D fuse_io_alloc(NULL, data->max_pages);
> -               if (!ia) {
> -                       unlock_page(page);
> -                       return -ENOMEM;
> -               }
> -               ap =3D &ia->ap;
> -       }
> -
> -       if (WARN_ON(ap->num_pages >=3D data->max_pages)) {
> -               unlock_page(page);
> -               fuse_io_free(ia);
> -               return -EIO;
> -       }
> -
> -       get_page(page);
> -       ap->pages[ap->num_pages] =3D page;
> -       ap->descs[ap->num_pages].length =3D PAGE_SIZE;
> -       ap->num_pages++;
> -       data->nr_pages--;
> -       return 0;
> -}
> -
> -static int fuse_readpages(struct file *file, struct address_space *mappi=
ng,
> -                         struct list_head *pages, unsigned nr_pages)
> -{
> -       struct inode *inode =3D mapping->host;
> -       struct fuse_conn *fc =3D get_fuse_conn(inode);
> -       struct fuse_fill_data data;
> -       int err;
> -
> -       err =3D -EIO;
>         if (is_bad_inode(inode))
> -               goto out;
> +               return;
>
> -       data.file =3D file;
> -       data.inode =3D inode;
> -       data.nr_pages =3D nr_pages;
> -       data.max_pages =3D min_t(unsigned int, nr_pages, fc->max_pages);
> -;
> -       data.ia =3D fuse_io_alloc(NULL, data.max_pages);
> -       err =3D -ENOMEM;
> -       if (!data.ia)
> -               goto out;
> +       max_pages =3D min(fc->max_pages, fc->max_read / PAGE_SIZE);
>
> -       err =3D read_cache_pages(mapping, pages, fuse_readpages_fill, &da=
ta);
> -       if (!err) {
> -               if (data.ia->ap.num_pages)
> -                       fuse_send_readpages(data.ia, file);
> -               else
> -                       fuse_io_free(data.ia);
> +       for (;;) {
> +               struct fuse_io_args *ia;
> +               struct fuse_args_pages *ap;
> +
> +               nr_pages =3D readahead_count(rac) - nr_pages;

Hmm.  I see what's going on here, but it's confusing.   Why is
__readahead_batch() decrementing the readahead count at the start,
rather than at the end?

At the very least it needs a comment about why nr_pages is calculated this =
way.

> +               if (nr_pages > max_pages)
> +                       nr_pages =3D max_pages;
> +               if (nr_pages =3D=3D 0)
> +                       break;
> +               ia =3D fuse_io_alloc(NULL, nr_pages);
> +               if (!ia)
> +                       return;
> +               ap =3D &ia->ap;
> +               nr_pages =3D __readahead_batch(rac, ap->pages, nr_pages);
> +               for (i =3D 0; i < nr_pages; i++) {
> +                       fuse_wait_on_page_writeback(inode,
> +                                                   readahead_index(rac) =
+ i);

What's wrong with ap->pages[i]->index?  Are we trying to wean off using ->i=
ndex?

Thanks,
Miklos


