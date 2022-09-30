Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1885F10F5
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Sep 2022 19:33:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664559229;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=kKwAFRI6H6S4yy+ZsrO+zojsSzh8+YLFFYtXFQ/BEZk=;
	b=ODmKtouO6UTyvQCOYB1q2srStBnf2NcdtoVU2PT5AIxsUCecicQeXTS2LuGbZPieGSwNBB
	DZIqirvMgnoQXHAJXvROlQVV7m1UXi+wPrgH3zLO6egdHbQzgj0HTIQBT2Z1NNS391D4tT
	3x01KFkGPEAVxL6+ut/Z2KoGjarMapk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-IzfnH1z1NOiRuHI0tzrpiQ-1; Fri, 30 Sep 2022 13:33:46 -0400
X-MC-Unique: IzfnH1z1NOiRuHI0tzrpiQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E50AF1C0755D;
	Fri, 30 Sep 2022 17:33:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D3F5492B04;
	Fri, 30 Sep 2022 17:33:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C11B51946A68;
	Fri, 30 Sep 2022 17:33:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5C13E1946A52 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 30 Sep 2022 17:33:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3A03340EFB01; Fri, 30 Sep 2022 17:33:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3162340EFB00
 for <cluster-devel@redhat.com>; Fri, 30 Sep 2022 17:33:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00AB21C07563
 for <cluster-devel@redhat.com>; Fri, 30 Sep 2022 17:33:42 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-MPkg8opLPZib0w2KygR23w-1; Fri, 30 Sep 2022 13:33:40 -0400
X-MC-Unique: MPkg8opLPZib0w2KygR23w-1
Received: by mail-oo1-f51.google.com with SMTP id
 z9-20020a4a4909000000b0047651b95fbdso2678623ooa.5
 for <cluster-devel@redhat.com>; Fri, 30 Sep 2022 10:33:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kKwAFRI6H6S4yy+ZsrO+zojsSzh8+YLFFYtXFQ/BEZk=;
 b=4Fkha73TdOOkBMpqoyl9PQbH4p8UNLEiqHWNAM1ytXo9MC1wjCNHAzOoehMUeP/Jpo
 /FSv9RJvQj3y9dmhryDWUBJjGMl96Iixinj6a1TbfHdg4kelzJdIvamf4yubHR0fhc5V
 r0yzvYX16mComfWfFE3NGSSsWueeXKSQdHJ5fWIb8AxS56X3DzOdGBTo7tGLCNOBL/uC
 BEwp/0YAH9mQW07VTrCLdSCSJw2t5qHUkQWfhMB4wVYL1LWXkNh1Pr1K8HyOyTPLDveD
 OYSe1+fr8UCjK8RB+KoJ0styFcXnq8oE5npZOwnmr4lXpW5r1uac/qnqu4mXYRSAYEoo
 sx1A==
X-Gm-Message-State: ACrzQf1F4t2UUv67fNC+i5Qm38TB+1aE6T64N01e9uCkW+hYAqdQl73j
 dNAsPM0QY7HdvTEGFNhxckA2xgV6FywEwVmxixk=
X-Google-Smtp-Source: AMsMyM4e13ATtfH3+0NSYF/fIXZPdPMCFUMtKS8GkK1jIEg4Cb+gNx36XCgf8ns2P8vpzN68ybP8DHEPoH7e9cxFL+8=
X-Received: by 2002:a9d:6a95:0:b0:65c:77fd:53a with SMTP id
 l21-20020a9d6a95000000b0065c77fd053amr2759522otq.125.1664559217796; Fri, 30
 Sep 2022 10:33:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220912182224.514561-1-vishal.moola@gmail.com>
 <20220912182224.514561-9-vishal.moola@gmail.com>
 <35d965bbc3d27e43d6743fc3a5cb042503a1b7bf.camel@kernel.org>
In-Reply-To: <35d965bbc3d27e43d6743fc3a5cb042503a1b7bf.camel@kernel.org>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Fri, 30 Sep 2022 10:33:26 -0700
Message-ID: <CAOzc2pwMfLzp3HzakyFJBxkD+qYS2wnYUF5xqUHuxTa+CAgu9A@mail.gmail.com>
To: Jeff Layton <jlayton@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v2 08/23] ceph: Convert
 ceph_writepages_start() to use filemap_get_folios_tag()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 9:25 AM Jeff Layton <jlayton@kernel.org> wrote:
>
> On Mon, 2022-09-12 at 11:22 -0700, Vishal Moola (Oracle) wrote:
> > Convert function to use folios throughout. This is in preparation for
> > the removal of find_get_pages_range_tag().
> >
> > This change does NOT support large folios. This shouldn't be an issue as
> > of now since ceph only utilizes folios of size 1 anyways, and there is a
> > lot of work to be done on ceph conversions to folios for later patches
> > at some point.
> >
> > Also some minor renaming for consistency.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  fs/ceph/addr.c | 138 +++++++++++++++++++++++++------------------------
> >  1 file changed, 70 insertions(+), 68 deletions(-)
> >
> > diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> > index dcf701b05cc1..33dbe55b08be 100644
> > --- a/fs/ceph/addr.c
> > +++ b/fs/ceph/addr.c
> > @@ -792,7 +792,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >       struct ceph_vino vino = ceph_vino(inode);
> >       pgoff_t index, start_index, end = -1;
> >       struct ceph_snap_context *snapc = NULL, *last_snapc = NULL, *pgsnapc;
> > -     struct pagevec pvec;
> > +     struct folio_batch fbatch;
> >       int rc = 0;
> >       unsigned int wsize = i_blocksize(inode);
> >       struct ceph_osd_request *req = NULL;
> > @@ -821,7 +821,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >       if (fsc->mount_options->wsize < wsize)
> >               wsize = fsc->mount_options->wsize;
> >
> > -     pagevec_init(&pvec);
> > +     folio_batch_init(&fbatch);
> >
> >       start_index = wbc->range_cyclic ? mapping->writeback_index : 0;
> >       index = start_index;
> > @@ -869,9 +869,9 @@ static int ceph_writepages_start(struct address_space *mapping,
> >
> >       while (!done && index <= end) {
> >               int num_ops = 0, op_idx;
> > -             unsigned i, pvec_pages, max_pages, locked_pages = 0;
> > +             unsigned i, nr_folios, max_pages, locked_pages = 0;
> >               struct page **pages = NULL, **data_pages;
> > -             struct page *page;
> > +             struct folio *folio;
> >               pgoff_t strip_unit_end = 0;
> >               u64 offset = 0, len = 0;
> >               bool from_pool = false;
> > @@ -879,28 +879,28 @@ static int ceph_writepages_start(struct address_space *mapping,
> >               max_pages = wsize >> PAGE_SHIFT;
> >
> >  get_more_pages:
> > -             pvec_pages = pagevec_lookup_range_tag(&pvec, mapping, &index,
> > -                                             end, PAGECACHE_TAG_DIRTY);
> > -             dout("pagevec_lookup_range_tag got %d\n", pvec_pages);
> > -             if (!pvec_pages && !locked_pages)
> > +             nr_folios = filemap_get_folios_tag(mapping, &index,
> > +                             end, PAGECACHE_TAG_DIRTY, &fbatch);
> > +             dout("filemap_get_folios_tag got %d\n", nr_folios);
> > +             if (!nr_folios && !locked_pages)
> >                       break;
> > -             for (i = 0; i < pvec_pages && locked_pages < max_pages; i++) {
> > -                     page = pvec.pages[i];
> > -                     dout("? %p idx %lu\n", page, page->index);
> > +             for (i = 0; i < nr_folios && locked_pages < max_pages; i++) {
> > +                     folio = fbatch.folios[i];
> > +                     dout("? %p idx %lu\n", folio, folio->index);
> >                       if (locked_pages == 0)
> > -                             lock_page(page);  /* first page */
> > -                     else if (!trylock_page(page))
> > +                             folio_lock(folio); /* first folio */
> > +                     else if (!folio_trylock(folio))
> >                               break;
> >
> >                       /* only dirty pages, or our accounting breaks */
> > -                     if (unlikely(!PageDirty(page)) ||
> > -                         unlikely(page->mapping != mapping)) {
> > -                             dout("!dirty or !mapping %p\n", page);
> > -                             unlock_page(page);
> > +                     if (unlikely(!folio_test_dirty(folio)) ||
> > +                         unlikely(folio->mapping != mapping)) {
> > +                             dout("!dirty or !mapping %p\n", folio);
> > +                             folio_unlock(folio);
> >                               continue;
> >                       }
> >                       /* only if matching snap context */
> > -                     pgsnapc = page_snap_context(page);
> > +                     pgsnapc = page_snap_context(&folio->page);
> >                       if (pgsnapc != snapc) {
> >                               dout("page snapc %p %lld != oldest %p %lld\n",
> >                                    pgsnapc, pgsnapc->seq, snapc, snapc->seq);
> > @@ -908,11 +908,10 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                                   !ceph_wbc.head_snapc &&
> >                                   wbc->sync_mode != WB_SYNC_NONE)
> >                                       should_loop = true;
> > -                             unlock_page(page);
> > +                             folio_unlock(folio);
> >                               continue;
> >                       }
> > -                     if (page_offset(page) >= ceph_wbc.i_size) {
> > -                             struct folio *folio = page_folio(page);
> > +                     if (folio_pos(folio) >= ceph_wbc.i_size) {
> >
> >                               dout("folio at %lu beyond eof %llu\n",
> >                                    folio->index, ceph_wbc.i_size);
> > @@ -924,25 +923,26 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                               folio_unlock(folio);
> >                               continue;
> >                       }
> > -                     if (strip_unit_end && (page->index > strip_unit_end)) {
> > -                             dout("end of strip unit %p\n", page);
> > -                             unlock_page(page);
> > +                     if (strip_unit_end && (folio->index > strip_unit_end)) {
> > +                             dout("end of strip unit %p\n", folio);
> > +                             folio_unlock(folio);
> >                               break;
> >                       }
> > -                     if (PageWriteback(page) || PageFsCache(page)) {
> > +                     if (folio_test_writeback(folio) ||
> > +                                     folio_test_fscache(folio)) {
> >                               if (wbc->sync_mode == WB_SYNC_NONE) {
> > -                                     dout("%p under writeback\n", page);
> > -                                     unlock_page(page);
> > +                                     dout("%p under writeback\n", folio);
> > +                                     folio_unlock(folio);
> >                                       continue;
> >                               }
> > -                             dout("waiting on writeback %p\n", page);
> > -                             wait_on_page_writeback(page);
> > -                             wait_on_page_fscache(page);
> > +                             dout("waiting on writeback %p\n", folio);
> > +                             folio_wait_writeback(folio);
> > +                             folio_wait_fscache(folio);
> >                       }
> >
> > -                     if (!clear_page_dirty_for_io(page)) {
> > -                             dout("%p !clear_page_dirty_for_io\n", page);
> > -                             unlock_page(page);
> > +                     if (!folio_clear_dirty_for_io(folio)) {
> > +                             dout("%p !clear_page_dirty_for_io\n", folio);
> > +                             folio_unlock(folio);
> >                               continue;
> >                       }
> >
> > @@ -958,7 +958,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                               u32 xlen;
> >
> >                               /* prepare async write request */
> > -                             offset = (u64)page_offset(page);
> > +                             offset = (u64)folio_pos(folio);
> >                               ceph_calc_file_object_mapping(&ci->i_layout,
> >                                                             offset, wsize,
> >                                                             &objnum, &objoff,
> > @@ -966,7 +966,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                               len = xlen;
> >
> >                               num_ops = 1;
> > -                             strip_unit_end = page->index +
> > +                             strip_unit_end = folio->index +
> >                                       ((len - 1) >> PAGE_SHIFT);
> >
> >                               BUG_ON(pages);
> > @@ -981,54 +981,53 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                               }
> >
> >                               len = 0;
> > -                     } else if (page->index !=
> > +                     } else if (folio->index !=
> >                                  (offset + len) >> PAGE_SHIFT) {
> >                               if (num_ops >= (from_pool ?  CEPH_OSD_SLAB_OPS :
> >                                                            CEPH_OSD_MAX_OPS)) {
> > -                                     redirty_page_for_writepage(wbc, page);
> > -                                     unlock_page(page);
> > +                                     folio_redirty_for_writepage(wbc, folio);
> > +                                     folio_unlock(folio);
> >                                       break;
> >                               }
> >
> >                               num_ops++;
> > -                             offset = (u64)page_offset(page);
> > +                             offset = (u64)folio_pos(folio);
> >                               len = 0;
> >                       }
> >
> > -                     /* note position of first page in pvec */
> > +                     /* note position of first page in fbatch */
> >                       dout("%p will write page %p idx %lu\n",
> > -                          inode, page, page->index);
> > +                          inode, folio, folio->index);
> >
> >                       if (atomic_long_inc_return(&fsc->writeback_count) >
> >                           CONGESTION_ON_THRESH(
> >                                   fsc->mount_options->congestion_kb))
> >                               fsc->write_congested = true;
> >
> > -                     pages[locked_pages++] = page;
> > -                     pvec.pages[i] = NULL;
> > +                     pages[locked_pages++] = &folio->page;
> > +                     fbatch.folios[i] = NULL;
> >
> > -                     len += thp_size(page);
> > +                     len += folio_size(folio);
> >               }
> >
> >               /* did we get anything? */
> >               if (!locked_pages)
> > -                     goto release_pvec_pages;
> > +                     goto release_folio_batches;
> >               if (i) {
> >                       unsigned j, n = 0;
> > -                     /* shift unused page to beginning of pvec */
> > -                     for (j = 0; j < pvec_pages; j++) {
> > -                             if (!pvec.pages[j])
> > +                     /* shift unused folio to the beginning of fbatch */
> > +                     for (j = 0; j < nr_folios; j++) {
> > +                             if (!fbatch.folios[j])
> >                                       continue;
> >                               if (n < j)
> > -                                     pvec.pages[n] = pvec.pages[j];
> > +                                     fbatch.folios[n] = fbatch.folios[j];
> >                               n++;
> >                       }
> > -                     pvec.nr = n;
> > -
> > -                     if (pvec_pages && i == pvec_pages &&
> > +                     fbatch.nr = n;
> > +                     if (nr_folios && i == nr_folios &&
> >                           locked_pages < max_pages) {
> > -                             dout("reached end pvec, trying for more\n");
> > -                             pagevec_release(&pvec);
> > +                             dout("reached end of fbatch, trying for more\n");
> > +                             folio_batch_release(&fbatch);
> >                               goto get_more_pages;
> >                       }
> >               }
> > @@ -1056,7 +1055,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                       BUG_ON(IS_ERR(req));
> >               }
> >               BUG_ON(len < page_offset(pages[locked_pages - 1]) +
> > -                          thp_size(page) - offset);
> > +                          folio_size(folio) - offset);
> >
> >               req->r_callback = writepages_finish;
> >               req->r_inode = inode;
> > @@ -1098,7 +1097,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                       set_page_writeback(pages[i]);
> >                       if (caching)
> >                               ceph_set_page_fscache(pages[i]);
> > -                     len += thp_size(page);
> > +                     len += folio_size(folio);
> >               }
> >               ceph_fscache_write_to_cache(inode, offset, len, caching);
> >
> > @@ -1108,7 +1107,7 @@ static int ceph_writepages_start(struct address_space *mapping,
> >                       /* writepages_finish() clears writeback pages
> >                        * according to the data length, so make sure
> >                        * data length covers all locked pages */
> > -                     u64 min_len = len + 1 - thp_size(page);
> > +                     u64 min_len = len + 1 - folio_size(folio);
> >                       len = get_writepages_data_length(inode, pages[i - 1],
> >                                                        offset);
> >                       len = max(len, min_len);
> > @@ -1164,10 +1163,10 @@ static int ceph_writepages_start(struct address_space *mapping,
> >               if (wbc->nr_to_write <= 0 && wbc->sync_mode == WB_SYNC_NONE)
> >                       done = true;
> >
> > -release_pvec_pages:
> > -             dout("pagevec_release on %d pages (%p)\n", (int)pvec.nr,
> > -                  pvec.nr ? pvec.pages[0] : NULL);
> > -             pagevec_release(&pvec);
> > +release_folio_batches:
> > +             dout("folio_batch_release on %d batches (%p)", (int) fbatch.nr,
> > +                             fbatch.nr ? fbatch.folios[0] : NULL);
> > +             folio_batch_release(&fbatch);
> >       }
> >
> >       if (should_loop && !done) {
> > @@ -1180,19 +1179,22 @@ static int ceph_writepages_start(struct address_space *mapping,
> >               if (wbc->sync_mode != WB_SYNC_NONE &&
> >                   start_index == 0 && /* all dirty pages were checked */
> >                   !ceph_wbc.head_snapc) {
> > -                     struct page *page;
> > +                     struct folio *folio;
> >                       unsigned i, nr;
> >                       index = 0;
> >                       while ((index <= end) &&
> > -                            (nr = pagevec_lookup_tag(&pvec, mapping, &index,
> > -                                             PAGECACHE_TAG_WRITEBACK))) {
> > +                             (nr = filemap_get_folios_tag(mapping, &index,
> > +                                             (pgoff_t)-1,
> > +                                             PAGECACHE_TAG_WRITEBACK,
> > +                                             &fbatch))) {
> >                               for (i = 0; i < nr; i++) {
> > -                                     page = pvec.pages[i];
> > -                                     if (page_snap_context(page) != snapc)
> > +                                     folio = fbatch.folios[i];
> > +                                     if (page_snap_context(&folio->page) !=
> > +                                                     snapc)
> >                                               continue;
> > -                                     wait_on_page_writeback(page);
> > +                                     folio_wait_writeback(folio);
> >                               }
> > -                             pagevec_release(&pvec);
> > +                             folio_batch_release(&fbatch);
> >                               cond_resched();
> >                       }
> >               }
>
>
> We have some work in progress to add write helpers to netfslib. Once we
> get those in place, we plan to convert ceph to use them. At that point
> ceph_writepages just goes away.
> I think it'd be best to just wait for that and to just ensure that
> netfslib uses filemap_get_folios_tag and the like where appropriate.
> --
> Jeff Layton <jlayton@kernel.org>

Sounds good, let's do that. That will make the patch a lot simpler, and less
prone to errors. I'll strip this down to the necessary changes in v3.

