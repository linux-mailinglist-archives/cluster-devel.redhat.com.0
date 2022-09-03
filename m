Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B41FD5AC021
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Sep 2022 19:38:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662226712;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xX2O58QMupv9rWIX/wz0TD9J8Ed7HqVnisBNPZl6V04=;
	b=TGrURqwEC9Zh6x1ank2GMLDUAAiWYtQ3RwiEnqeUHDhOcKQ2AEzAtxXDqUW/QJ14LJqP7O
	2EHIR6CBJr53m9F5cAjF433gLE7W/ujRbulSSWNJHBNgq7zGTbJlK1IRtcxOSosfQieBst
	p7kxSBZpk3hZuD1RtUjLYY0z4+XPEz0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-SosNnIbkMN2ywr-ckCCZ_g-1; Sat, 03 Sep 2022 13:38:29 -0400
X-MC-Unique: SosNnIbkMN2ywr-ckCCZ_g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28DB485A58A;
	Sat,  3 Sep 2022 17:38:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E348945DB;
	Sat,  3 Sep 2022 17:38:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F2F671940342;
	Sat,  3 Sep 2022 17:38:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DD9581946A42 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  3 Sep 2022 17:38:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D15D91415138; Sat,  3 Sep 2022 17:38:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDC3E1415137
 for <cluster-devel@redhat.com>; Sat,  3 Sep 2022 17:38:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B80B13C025C0
 for <cluster-devel@redhat.com>; Sat,  3 Sep 2022 17:38:27 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-396-Fuda52wiNn6mAcoUNPRLoQ-1; Sat, 03 Sep 2022 13:38:26 -0400
X-MC-Unique: Fuda52wiNn6mAcoUNPRLoQ-1
Received: by mail-lj1-f181.google.com with SMTP id r27so4826240ljn.0
 for <cluster-devel@redhat.com>; Sat, 03 Sep 2022 10:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xX2O58QMupv9rWIX/wz0TD9J8Ed7HqVnisBNPZl6V04=;
 b=g/Ih7Kot5JrEqbliYfUq9lPKja0aMipJkkQy3AYF6WdSQ0RZHjeoKPH2nq5wSNEYgN
 8psNK+aLafh6fa+CiYs2He6LD/SthuIoUTMl7Xfzbj0hQo752N+R1BJISza6xjD2Lj/j
 fZsclEjcBHbQZd4Qvik25wB/nwlm0cVszr9Xyj61L8QlOY/pzgtz+jeaCF3PTxyj7DMC
 YHBq9il7O+kGtF96xdSy2MXbqWT5jDGeHgOaxiAyR30hsh/ZchpTYDFzUlmg1eZAh91v
 jKXzDDqkt+5EMdSon+Od6ef3F+6hFjun6dkJRE7EeptA3OqL6RLiN4T4Qzb+Ts7yDaU9
 1HqA==
X-Gm-Message-State: ACgBeo0MJsijLo8wyz4C2tYlA0lTyVcSvCCy1cMsD3TEo4NS6OKsoGSH
 bQ4+tgunMStGwiol0xLtIzzE4pR2X92Rhc3UyD5j553wUxo=
X-Google-Smtp-Source: AA6agR7+UPXECkLr9xecEnlHY9jJP9Sk53/z1csaRMZh+iBcI4PkxC6eajktqUCZxUcf8SInATP1uw7iY4QjQlwWETk=
X-Received: by 2002:a2e:b8d5:0:b0:25f:e94d:10a2 with SMTP id
 s21-20020a2eb8d5000000b0025fe94d10a2mr13425885ljp.274.1662226704352; Sat, 03
 Sep 2022 10:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220901220138.182896-1-vishal.moola@gmail.com>
 <20220901220138.182896-19-vishal.moola@gmail.com>
In-Reply-To: <20220901220138.182896-19-vishal.moola@gmail.com>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Sun, 4 Sep 2022 02:38:06 +0900
Message-ID: <CAKFNMo=YwdFOQNUuwNvYn6u41C8A2M905-nDkEFRejPZ2_svYg@mail.gmail.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 18/23] nilfs2: Convert
 nilfs_lookup_dirty_data_buffers() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 2, 2022 at 7:07 AM Vishal Moola (Oracle) wrote:
>
> Convert function to use folios throughout. This is in preparation for
> the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/nilfs2/segment.c | 29 ++++++++++++++++-------------
>  1 file changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
> index 0afe0832c754..e95c667bdc8f 100644
> --- a/fs/nilfs2/segment.c
> +++ b/fs/nilfs2/segment.c
> @@ -680,7 +680,7 @@ static size_t nilfs_lookup_dirty_data_buffers(struct inode *inode,
>                                               loff_t start, loff_t end)
>  {
>         struct address_space *mapping = inode->i_mapping;
> -       struct pagevec pvec;
> +       struct folio_batch fbatch;
>         pgoff_t index = 0, last = ULONG_MAX;
>         size_t ndirties = 0;
>         int i;
> @@ -694,23 +694,26 @@ static size_t nilfs_lookup_dirty_data_buffers(struct inode *inode,
>                 index = start >> PAGE_SHIFT;
>                 last = end >> PAGE_SHIFT;
>         }
> -       pagevec_init(&pvec);
> +       folio_batch_init(&fbatch);
>   repeat:
>         if (unlikely(index > last) ||
> -           !pagevec_lookup_range_tag(&pvec, mapping, &index, last,
> -                               PAGECACHE_TAG_DIRTY))
> +             !filemap_get_folios_tag(mapping, &index, last,
> +                     PAGECACHE_TAG_DIRTY, &fbatch))
>                 return ndirties;
>
> -       for (i = 0; i < pagevec_count(&pvec); i++) {
> +       for (i = 0; i < folio_batch_count(&fbatch); i++) {
>                 struct buffer_head *bh, *head;
> -               struct page *page = pvec.pages[i];
> +               struct folio *folio = fbatch.folios[i];
>
> -               lock_page(page);
> -               if (!page_has_buffers(page))
> -                       create_empty_buffers(page, i_blocksize(inode), 0);
> -               unlock_page(page);

> +               head = folio_buffers(folio);
> +               folio_lock(folio);

Could you please swap these two lines to keep the "head" check in the lock?

Thanks,
Ryusuke Konishi


> +               if (!head) {
> +                       create_empty_buffers(&folio->page, i_blocksize(inode), 0);
> +                       head = folio_buffers(folio);
> +               }
> +               folio_unlock(folio);
>
> -               bh = head = page_buffers(page);
> +               bh = head;
>                 do {
>                         if (!buffer_dirty(bh) || buffer_async_write(bh))
>                                 continue;
> @@ -718,13 +721,13 @@ static size_t nilfs_lookup_dirty_data_buffers(struct inode *inode,
>                         list_add_tail(&bh->b_assoc_buffers, listp);
>                         ndirties++;
>                         if (unlikely(ndirties >= nlimit)) {
> -                               pagevec_release(&pvec);
> +                               folio_batch_release(&fbatch);
>                                 cond_resched();
>                                 return ndirties;
>                         }
>                 } while (bh = bh->b_this_page, bh != head);
>         }
> -       pagevec_release(&pvec);
> +       folio_batch_release(&fbatch);
>         cond_resched();
>         goto repeat;
>  }
> --
> 2.36.1
>

