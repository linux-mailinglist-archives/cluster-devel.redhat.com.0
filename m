Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF406249F8
	for <lists+cluster-devel@lfdr.de>; Thu, 10 Nov 2022 19:52:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668106345;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ahiLR+0HYqx9Hj3q85kkyLXkS2RfP6cywR4r1/bj6Ic=;
	b=ULUr8pplZaoEVuQVxCFP8hhxW0ipZnvZKUxbaqhu95PnbpVyKn88pw8iwtq+mVlaHKDKC7
	slmT3lmYOvdbqn0OqTPV1h6KsJNg+GP9AO0BZ3PC89KwQSHbF1RR7v675AvzTEGyfbi8dS
	BF/pBGVjJ26f1wltYewypYxMvyl9ViY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-PBqwO_v5O4KlWvCRkbdvKA-1; Thu, 10 Nov 2022 13:52:19 -0500
X-MC-Unique: PBqwO_v5O4KlWvCRkbdvKA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB1488041B5;
	Thu, 10 Nov 2022 18:52:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1ABB640C6F73;
	Thu, 10 Nov 2022 18:52:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E49AE194658D;
	Thu, 10 Nov 2022 18:52:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D8E221946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 10 Nov 2022 18:52:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BFE88492B1B; Thu, 10 Nov 2022 18:52:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B86A6492B0F
 for <cluster-devel@redhat.com>; Thu, 10 Nov 2022 18:52:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 387471C1691B
 for <cluster-devel@redhat.com>; Thu, 10 Nov 2022 18:52:06 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-H20QS0FqP22PnhjlHm1L0Q-1; Thu, 10 Nov 2022 13:52:03 -0500
X-MC-Unique: H20QS0FqP22PnhjlHm1L0Q-1
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-333a4a5d495so23757057b3.10
 for <cluster-devel@redhat.com>; Thu, 10 Nov 2022 10:52:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ahiLR+0HYqx9Hj3q85kkyLXkS2RfP6cywR4r1/bj6Ic=;
 b=lJwEW8baYgiiu/6ezMN1WXmtStlAbNJK1npG+s8mE0vDq6crb4EKVhv2AMYwL4fvsj
 lbTi2mb6XWH2pZImHyr/l8Wy8bEc3sxv3OCTp/ZaAnkmWfVZyrtF3MC+NZygRY2zwdBI
 1x8YCvGX/ywpX4yxUOYGX+dgyPjC3jzsTPdTq7bu2knaGMNOyDtBjVRX2/R/RuWQ90CX
 93s7LqpBVp6Dm+ckjMH2kVkwoulFniwCwAcMSFXv0/VSw/6fLPxIJwApJo7Ydlzwo5Xc
 BtyBt47hRLsyOYgM3jfOFAhQ1QDxRkuzCeEs4hhSB//g5g2W8Sp1qqIx8felswSmCOc6
 sVUg==
X-Gm-Message-State: ACrzQf2NAcvGwQMkUhwbdVwpDBP3egJ9e9lj+H2nxkTXZJVdrWFdys7n
 6rSAYz6sSOH6qmObxoVPQKLKWgYer1ZbH1q8QDY=
X-Google-Smtp-Source: AMsMyM6qbhoDq4EuNlT/sFztZuNh18/AZoQGojI1IWj/9MWKt4lI+zofGQOcHJnd2iNJiiAFP0Po3i1fYNOJTKFQ5/8=
X-Received: by 2002:a81:63c6:0:b0:349:37f7:73dd with SMTP id
 x189-20020a8163c6000000b0034937f773ddmr62868232ywb.368.1668106321899; Thu, 10
 Nov 2022 10:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-12-vishal.moola@gmail.com>
 <CAOzc2pwKoyy4i4zBKhvoKmN8cezUxjDhjYZnK9GLcJniQVPoGA@mail.gmail.com>
In-Reply-To: <CAOzc2pwKoyy4i4zBKhvoKmN8cezUxjDhjYZnK9GLcJniQVPoGA@mail.gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 10 Nov 2022 10:51:50 -0800
Message-ID: <CAOzc2pwuUZRK-qMFBhPEENUid-NBSfa9YyJ_FCcFHgwFf4mOuQ@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v3 11/23] f2fs: Convert
 f2fs_fsync_node_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org, chao@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, jaegeuk@kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 24, 2022 at 12:31 PM Vishal Moola <vishal.moola@gmail.com> wrote:
>
> On Mon, Oct 17, 2022 at 1:25 PM Vishal Moola (Oracle)
> <vishal.moola@gmail.com> wrote:
> >
> > Convert function to use a folio_batch instead of pagevec. This is in
> > preparation for the removal of find_get_pages_range_tag().
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > ---
> >  fs/f2fs/node.c | 19 ++++++++++---------
> >  1 file changed, 10 insertions(+), 9 deletions(-)
> >
> > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > index 983572f23896..e8b72336c096 100644
> > --- a/fs/f2fs/node.c
> > +++ b/fs/f2fs/node.c
> > @@ -1728,12 +1728,12 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
> >                         unsigned int *seq_id)
> >  {
> >         pgoff_t index;
> > -       struct pagevec pvec;
> > +       struct folio_batch fbatch;
> >         int ret = 0;
> >         struct page *last_page = NULL;
> >         bool marked = false;
> >         nid_t ino = inode->i_ino;
> > -       int nr_pages;
> > +       int nr_folios;
> >         int nwritten = 0;
> >
> >         if (atomic) {
> > @@ -1742,20 +1742,21 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
> >                         return PTR_ERR_OR_ZERO(last_page);
> >         }
> >  retry:
> > -       pagevec_init(&pvec);
> > +       folio_batch_init(&fbatch);
> >         index = 0;
> >
> > -       while ((nr_pages = pagevec_lookup_tag(&pvec, NODE_MAPPING(sbi), &index,
> > -                               PAGECACHE_TAG_DIRTY))) {
> > +       while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
> > +                                       (pgoff_t)-1, PAGECACHE_TAG_DIRTY,
> > +                                       &fbatch))) {
> >                 int i;
> >
> > -               for (i = 0; i < nr_pages; i++) {
> > -                       struct page *page = pvec.pages[i];
> > +               for (i = 0; i < nr_folios; i++) {
> > +                       struct page *page = &fbatch.folios[i]->page;
> >                         bool submitted = false;
> >
> >                         if (unlikely(f2fs_cp_error(sbi))) {
> >                                 f2fs_put_page(last_page, 0);
> > -                               pagevec_release(&pvec);
> > +                               folio_batch_release(&fbatch);
> >                                 ret = -EIO;
> >                                 goto out;
> >                         }
> > @@ -1821,7 +1822,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
> >                                 break;
> >                         }
> >                 }
> > -               pagevec_release(&pvec);
> > +               folio_batch_release(&fbatch);
> >                 cond_resched();
> >
> >                 if (ret || marked)
> > --
> > 2.36.1
> >
>
> Following up on these f2fs patches (11/23, 12/23, 13/23, 14/23, 15/23,
> 16/23). Does anyone have time to review them this week?

Chao, thank you for taking a look at some of these patches!
If you have time to look over the remaining patches (14, 15, 16)
feedback on those would be appreciated as well.

