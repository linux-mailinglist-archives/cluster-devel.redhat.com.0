Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8090B60B79A
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Oct 2022 21:27:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666639647;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=msuUebF694+hZC0rqt6N8CJWQi+fRr7tKzxI1kK1XSA=;
	b=EO1XvZj30JPclsl4GV88zewAYJzeg6mxbvNijmxQGrXlZBgKj125XHYrzyRSJY/WBbcCxN
	MHOPV1h7hDvim3RYHgU04LKYjGy5Vco33KgNIZnTX8q4FtJjehnGnQnIWACDE4yJe8Ab7w
	KCdCdnFslc64Gahe1u3p3Z3P+j2ADnA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-8vI2MxR-NHy2rB8230yOSA-1; Mon, 24 Oct 2022 15:27:24 -0400
X-MC-Unique: 8vI2MxR-NHy2rB8230yOSA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52311802556;
	Mon, 24 Oct 2022 19:27:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 455F92028E94;
	Mon, 24 Oct 2022 19:27:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1A57E19465B2;
	Mon, 24 Oct 2022 19:27:19 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EB6CA194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Oct 2022 19:27:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CD819492CA4; Mon, 24 Oct 2022 19:27:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C5327492CA5
 for <cluster-devel@redhat.com>; Mon, 24 Oct 2022 19:27:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A310B84854A
 for <cluster-devel@redhat.com>; Mon, 24 Oct 2022 19:27:07 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-BDgrO5RfMGehWK8I9OJH6g-1; Mon, 24 Oct 2022 15:26:53 -0400
X-MC-Unique: BDgrO5RfMGehWK8I9OJH6g-1
Received: by mail-yb1-f175.google.com with SMTP id o70so12121772yba.7
 for <cluster-devel@redhat.com>; Mon, 24 Oct 2022 12:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=msuUebF694+hZC0rqt6N8CJWQi+fRr7tKzxI1kK1XSA=;
 b=HHNofcCAQX/CeDcQk4Vu4Nt/mCfUUnjTYKF8f7OOkG62ZaIvqFOabBMZ1/BNENzOWx
 Lw3zNKUwcIop3AP1tyDlIee5JROTFZnGc/BW768V9WcvuMPZ9kegZCDXlcAu01d+3FQS
 haxZzygsEnWFsqHlo8Ea5c6DIFQFy5YeelGCPHc1xuFpQI//WYAo6uYkOTn6G13LiNFV
 I31G5YtNmlG6fWvN53O8yZq7yVNwXf0MtP2wFnbcy0oSPPz3XaCJYt7XoYumxse+fKVX
 0TWjbhrBmtz6aCPWo2tvZTkecff00Rvt+0EzKWhudfk1HZIxmtubJLKOeW8OODa94UZe
 MQkg==
X-Gm-Message-State: ACrzQf0lkgGz548vdEM8cJV5oGlrZg9qrResMIpOB64aeA+WAAHP9jJy
 o5NCUFQULzumxVBprwp5NeSJd9o/xZyOBn+2YRM=
X-Google-Smtp-Source: AMsMyM5vg8N9dDW35cXYnRV0vMdNWWQOk5I20+pSLu1UdubJKDDQpcDyA6OCK60nRt7T9Q9hMWGXE3CrFggT3+iul/0=
X-Received: by 2002:a5b:9c5:0:b0:6ca:d6da:30c1 with SMTP id
 y5-20020a5b09c5000000b006cad6da30c1mr8707218ybq.372.1666639612737; Mon, 24
 Oct 2022 12:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-11-vishal.moola@gmail.com>
In-Reply-To: <20221017202451.4951-11-vishal.moola@gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Mon, 24 Oct 2022 12:26:41 -0700
Message-ID: <CAOzc2pz53R5ZT0=U8uav9=FL7_rn+6pUrkfeTZ-bx5_3Pac-xg@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v3 10/23] ext4: Convert
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org, tytso@mit.edu,
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

On Mon, Oct 17, 2022 at 1:25 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> Converted the function to use folios throughout. This is in preparation
> for the removal of find_get_pages_range_tag(). Now supports large
> folios.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/ext4/inode.c | 55 ++++++++++++++++++++++++-------------------------
>  1 file changed, 27 insertions(+), 28 deletions(-)
>
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 2b5ef1b64249..69a0708c8e87 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -2572,8 +2572,8 @@ static int ext4_da_writepages_trans_blocks(struct inode *inode)
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
> @@ -2587,18 +2587,17 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
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
> @@ -2612,10 +2611,10 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
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
> @@ -2623,16 +2622,16 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
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
> @@ -2643,33 +2642,33 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
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
>                         /* Add all dirty buffers to mpd */
> -                       lblk = ((ext4_lblk_t)page->index) <<
> +                       lblk = ((ext4_lblk_t)folio->index) <<
>                                 (PAGE_SHIFT - blkbits);
> -                       head = page_buffers(page);
> +                       head = folio_buffers(folio);
>                         err = mpage_process_page_bufs(mpd, head, head, lblk);
>                         if (err <= 0)
>                                 goto out;
>                         err = 0;
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
> 2.36.1
>

Does anyone have some time to look over this ext4 patch this week?
Feedback is appreciated.

