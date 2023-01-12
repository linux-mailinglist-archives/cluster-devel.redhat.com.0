Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 94259667C5E
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 18:16:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673543781;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ueu49HbYyw3uKaxLdkdNJFDLhnVwdUbocDy8yp3uK6U=;
	b=BXXTaMHSFYrpQUpPPe7aa+nbbFbpRIPFUNcnhyC+EVnN/zzZZelTyGK0cByarp0A99sKBN
	/3Hs7mVtZOs5S2s9vh8uIq80UzpRgDb7mYN+3gNf9UIqo9ZP79wQQsYFZzHqcNy9uE9obY
	Y5MiznlRALnZziB035xccwqJuzipiXY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-P3D9TMrONXCHXqYiBE8FSQ-1; Thu, 12 Jan 2023 12:16:18 -0500
X-MC-Unique: P3D9TMrONXCHXqYiBE8FSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7320E857D0D;
	Thu, 12 Jan 2023 17:16:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0D972026D68;
	Thu, 12 Jan 2023 17:16:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5A747194704F;
	Thu, 12 Jan 2023 17:16:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B13FE1946A78 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 17:16:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9B4644078903; Thu, 12 Jan 2023 17:16:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 93EA74078905
 for <cluster-devel@redhat.com>; Thu, 12 Jan 2023 17:16:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74F3B8030CB
 for <cluster-devel@redhat.com>; Thu, 12 Jan 2023 17:16:14 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-399-nTFv9rVvPP2WeVtZgLoTiw-1; Thu, 12 Jan 2023 12:16:12 -0500
X-MC-Unique: nTFv9rVvPP2WeVtZgLoTiw-1
Received: by mail-yb1-f169.google.com with SMTP id p188so19491220yba.5
 for <cluster-devel@redhat.com>; Thu, 12 Jan 2023 09:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ueu49HbYyw3uKaxLdkdNJFDLhnVwdUbocDy8yp3uK6U=;
 b=Q5l8WzcRs2Sa+Bh09/ChZDe4ZE/L6AAsi0oas1B6VHJvfMAUb6bkJTFDajOZ+ECAnc
 HMccghSssJOxJTZEEqhfZuf44Vqc+Eh3Zl29bgsRbjN7OqM5QVBOj3ta14Fp6pEWnwxP
 30gpEdnKERgB637GNYHWYS/w7jDhVxcW6wT27163kbStnbUxXuGhzETPq4bLnWDNAGfW
 20TRG+zlUowJ1oz82XWayp5kBWd1PvqY1IExpLwkcXdEaaKWvPnVQ2pPhDNK1OcKjgF0
 nAs6KeIKmZwwUDZvEt+B+Irv8JTzQ5TTwim1Cn8fDRA1/1p2Ue8aDAw+y7z/kYXGu/QG
 5OYw==
X-Gm-Message-State: AFqh2kru/TcNY8r4E2S07eoHw1m/9MTLo2S1jsxB2g5hx2mz5OVzf3hP
 sDZnL8/Lss7dLIUt2exoPrgrGccygVu2fzYTJgrCV+sn
X-Google-Smtp-Source: AMrXdXt4S29867pWpNEcWUZVtr/uqb3UM4fpVgRhzCkqlx5R6lghcyEfD/1N+9wnCtzwrdSh12ePIMINBFYAmF+ldAs=
X-Received: by 2002:a25:abea:0:b0:762:b86:e82e with SMTP id
 v97-20020a25abea000000b007620b86e82emr8539372ybi.407.1673543771906; Thu, 12
 Jan 2023 09:16:11 -0800 (PST)
MIME-Version: 1.0
References: <20230104211448.4804-1-vishal.moola@gmail.com>
 <20230104211448.4804-11-vishal.moola@gmail.com>
In-Reply-To: <20230104211448.4804-11-vishal.moola@gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 12 Jan 2023 09:16:00 -0800
Message-ID: <CAOzc2pwoY74wdgCn2b=u391BNDmzOQ32e7yDt-ULwoNkhZ_4ig@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org, tytso@mit.edu
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v5 10/23] ext4: Convert
 mpage_prepare_extent_to_map() to use filemap_get_folios_tag()
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
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 1:15 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> Converted the function to use folios throughout. This is in preparation
> for the removal of find_get_pages_range_tag(). Now supports large
> folios. This change removes 11 calls to compound_head().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/ext4/inode.c | 65 ++++++++++++++++++++++++-------------------------
>  1 file changed, 32 insertions(+), 33 deletions(-)
>
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 9d9f414f99fe..fb6cd994e59a 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -2595,8 +2595,8 @@ static bool ext4_page_nomap_can_writeout(struct page *page)
>  static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>  {
>         struct address_space *mapping = mpd->inode->i_mapping;
> -       struct pagevec pvec;
> -       unsigned int nr_pages;
> +       struct folio_batch fbatch;
> +       unsigned int nr_folios;
>         long left = mpd->wbc->nr_to_write;
>         pgoff_t index = mpd->first_page;
>         pgoff_t end = mpd->last_page;
> @@ -2610,18 +2610,17 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>                 tag = PAGECACHE_TAG_TOWRITE;
>         else
>                 tag = PAGECACHE_TAG_DIRTY;
> -
> -       pagevec_init(&pvec);
> +       folio_batch_init(&fbatch);
>         mpd->map.m_len = 0;
>         mpd->next_page = index;
>         while (index <= end) {
> -               nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
> -                               tag);
> -               if (nr_pages == 0)
> +               nr_folios = filemap_get_folios_tag(mapping, &index, end,
> +                               tag, &fbatch);
> +               if (nr_folios == 0)
>                         break;
>
> -               for (i = 0; i < nr_pages; i++) {
> -                       struct page *page = pvec.pages[i];
> +               for (i = 0; i < nr_folios; i++) {
> +                       struct folio *folio = fbatch.folios[i];
>
>                         /*
>                          * Accumulated enough dirty pages? This doesn't apply
> @@ -2635,10 +2634,10 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>                                 goto out;
>
>                         /* If we can't merge this page, we are done. */
> -                       if (mpd->map.m_len > 0 && mpd->next_page != page->index)
> +                       if (mpd->map.m_len > 0 && mpd->next_page != folio->index)
>                                 goto out;
>
> -                       lock_page(page);
> +                       folio_lock(folio);
>                         /*
>                          * If the page is no longer dirty, or its mapping no
>                          * longer corresponds to inode we are writing (which
> @@ -2646,16 +2645,16 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>                          * page is already under writeback and we are not doing
>                          * a data integrity writeback, skip the page
>                          */
> -                       if (!PageDirty(page) ||
> -                           (PageWriteback(page) &&
> +                       if (!folio_test_dirty(folio) ||
> +                           (folio_test_writeback(folio) &&
>                              (mpd->wbc->sync_mode == WB_SYNC_NONE)) ||
> -                           unlikely(page->mapping != mapping)) {
> -                               unlock_page(page);
> +                           unlikely(folio->mapping != mapping)) {
> +                               folio_unlock(folio);
>                                 continue;
>                         }
>
> -                       wait_on_page_writeback(page);
> -                       BUG_ON(PageWriteback(page));
> +                       folio_wait_writeback(folio);
> +                       BUG_ON(folio_test_writeback(folio));
>
>                         /*
>                          * Should never happen but for buggy code in
> @@ -2666,49 +2665,49 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
>                          *
>                          * [1] https://lore.kernel.org/linux-mm/20180103100430.GE4911@quack2.suse.cz
>                          */
> -                       if (!page_has_buffers(page)) {
> -                               ext4_warning_inode(mpd->inode, "page %lu does not have buffers attached", page->index);
> -                               ClearPageDirty(page);
> -                               unlock_page(page);
> +                       if (!folio_buffers(folio)) {
> +                               ext4_warning_inode(mpd->inode, "page %lu does not have buffers attached", folio->index);
> +                               folio_clear_dirty(folio);
> +                               folio_unlock(folio);
>                                 continue;
>                         }
>
>                         if (mpd->map.m_len == 0)
> -                               mpd->first_page = page->index;
> -                       mpd->next_page = page->index + 1;
> +                               mpd->first_page = folio->index;
> +                       mpd->next_page = folio->index + folio_nr_pages(folio);
>                         /*
>                          * Writeout for transaction commit where we cannot
>                          * modify metadata is simple. Just submit the page.
>                          */
>                         if (!mpd->can_map) {
> -                               if (ext4_page_nomap_can_writeout(page)) {
> -                                       err = mpage_submit_page(mpd, page);
> +                               if (ext4_page_nomap_can_writeout(&folio->page)) {
> +                                       err = mpage_submit_page(mpd, &folio->page);
>                                         if (err < 0)
>                                                 goto out;
>                                 } else {
> -                                       unlock_page(page);
> -                                       mpd->first_page++;
> +                                       folio_unlock(folio);
> +                                       mpd->first_page += folio_nr_pages(folio);
>                                 }
>                         } else {
>                                 /* Add all dirty buffers to mpd */
> -                               lblk = ((ext4_lblk_t)page->index) <<
> +                               lblk = ((ext4_lblk_t)folio->index) <<
>                                         (PAGE_SHIFT - blkbits);
> -                               head = page_buffers(page);
> +                               head = folio_buffers(folio);
>                                 err = mpage_process_page_bufs(mpd, head, head,
> -                                                             lblk);
> +                                               lblk);
>                                 if (err <= 0)
>                                         goto out;
>                                 err = 0;
>                         }
> -                       left--;
> +                       left -= folio_nr_pages(folio);
>                 }
> -               pagevec_release(&pvec);
> +               folio_batch_release(&fbatch);
>                 cond_resched();
>         }
>         mpd->scanned_until_end = 1;
>         return 0;
>  out:
> -       pagevec_release(&pvec);
> +       folio_batch_release(&fbatch);
>         return err;
>  }
>
> --
> 2.38.1
>

Could someone review this ext4 patch, please? This is one of the
2 remaining patches that need to be looked at in the series.

