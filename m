Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6408A60B7BE
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Oct 2022 21:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666639890;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ewURVtEZDzlu0i+gVIVlIwdo2AKdKjYywGZcJK82PeY=;
	b=hOKTKEAQhuXdPw7W1FGz9m+WSimVBAqubkJuo9E11/eXEEkQmQ133bTXS7UILXzMqg9TQ6
	Ty1iDFRK75d/7XKi9SidTiwZlzCVS7zCdnISLYwjtaDNVW9Hkye2gNZWeMMez4Oql6cH6K
	CX9ZFfmVVrqhDWDr+4/AbMuMcWPhWz8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-303-M-W7cAZANOC60TcmJkZm5Q-1; Mon, 24 Oct 2022 15:31:26 -0400
X-MC-Unique: M-W7cAZANOC60TcmJkZm5Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C826101AA46;
	Mon, 24 Oct 2022 19:31:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C38C492B0A;
	Mon, 24 Oct 2022 19:31:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 71CC119465B2;
	Mon, 24 Oct 2022 19:31:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 86A82194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Oct 2022 19:31:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D2E440C2140; Mon, 24 Oct 2022 19:31:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4627640C2064
 for <cluster-devel@redhat.com>; Mon, 24 Oct 2022 19:31:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 285781C0513C
 for <cluster-devel@redhat.com>; Mon, 24 Oct 2022 19:31:24 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
 [209.85.219.171]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-PgaLKLVdPsK7H2RyYf06zA-1; Mon, 24 Oct 2022 15:31:22 -0400
X-MC-Unique: PgaLKLVdPsK7H2RyYf06zA-1
Received: by mail-yb1-f171.google.com with SMTP id y72so12092219yby.13
 for <cluster-devel@redhat.com>; Mon, 24 Oct 2022 12:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ewURVtEZDzlu0i+gVIVlIwdo2AKdKjYywGZcJK82PeY=;
 b=L18VJ/MKFYakmjWIDPZfUx507NZsTV89XfTIqA3qBAOSricLK/bdxNSdOuPYb0bgJt
 doFgSub+9bi7rqwrBKlLwxlPR2fiNVuT9Lv/Rp9sYsCJNSY9DUr8F7YQo0ZUmxVadV+K
 R5b3Xj8CBJenNvnTYxb5h0LzkK834BrldRoq2FrtG4QxKqRGwXUdCDOZ1KO8IXq7W0Mc
 0MG4dPTTHJgSaaUegSmHzNsMoBpWkZuv0PLywFS87SPz8alD7BlU0TjoULvPz9X3S+xs
 83ijHcBP6UMglnU8U3o/BKrT1vH/mXpa0xZZ9mvB6+Pugho/hJI+isfBAcRmb8ftjzFD
 urZQ==
X-Gm-Message-State: ACrzQf1sfASQ2N6jt/PSJrSfNlzPMEZHlwa0N3SHn87GcSFKrG90kNUh
 SEZPhFXCKSw+Kq/LytnKxt919c4IOfSSdOhlmT4=
X-Google-Smtp-Source: AMsMyM6B6fNnp2prURoNrQAhN6Lbp6rH2u1B/iqqAEW6OHySGJ/tzUiCXpuF8+v7sMB52Tmf+g8Xaw+7Yytz7WdTgT4=
X-Received: by 2002:a25:3bd0:0:b0:6ca:6428:ac94 with SMTP id
 i199-20020a253bd0000000b006ca6428ac94mr16397507yba.462.1666639881517; Mon, 24
 Oct 2022 12:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-12-vishal.moola@gmail.com>
In-Reply-To: <20221017202451.4951-12-vishal.moola@gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Mon, 24 Oct 2022 12:31:10 -0700
Message-ID: <CAOzc2pwKoyy4i4zBKhvoKmN8cezUxjDhjYZnK9GLcJniQVPoGA@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 17, 2022 at 1:25 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> Convert function to use a folio_batch instead of pagevec. This is in
> preparation for the removal of find_get_pages_range_tag().
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/f2fs/node.c | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
>
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 983572f23896..e8b72336c096 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1728,12 +1728,12 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>                         unsigned int *seq_id)
>  {
>         pgoff_t index;
> -       struct pagevec pvec;
> +       struct folio_batch fbatch;
>         int ret = 0;
>         struct page *last_page = NULL;
>         bool marked = false;
>         nid_t ino = inode->i_ino;
> -       int nr_pages;
> +       int nr_folios;
>         int nwritten = 0;
>
>         if (atomic) {
> @@ -1742,20 +1742,21 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>                         return PTR_ERR_OR_ZERO(last_page);
>         }
>  retry:
> -       pagevec_init(&pvec);
> +       folio_batch_init(&fbatch);
>         index = 0;
>
> -       while ((nr_pages = pagevec_lookup_tag(&pvec, NODE_MAPPING(sbi), &index,
> -                               PAGECACHE_TAG_DIRTY))) {
> +       while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
> +                                       (pgoff_t)-1, PAGECACHE_TAG_DIRTY,
> +                                       &fbatch))) {
>                 int i;
>
> -               for (i = 0; i < nr_pages; i++) {
> -                       struct page *page = pvec.pages[i];
> +               for (i = 0; i < nr_folios; i++) {
> +                       struct page *page = &fbatch.folios[i]->page;
>                         bool submitted = false;
>
>                         if (unlikely(f2fs_cp_error(sbi))) {
>                                 f2fs_put_page(last_page, 0);
> -                               pagevec_release(&pvec);
> +                               folio_batch_release(&fbatch);
>                                 ret = -EIO;
>                                 goto out;
>                         }
> @@ -1821,7 +1822,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>                                 break;
>                         }
>                 }
> -               pagevec_release(&pvec);
> +               folio_batch_release(&fbatch);
>                 cond_resched();
>
>                 if (ret || marked)
> --
> 2.36.1
>

Following up on these f2fs patches (11/23, 12/23, 13/23, 14/23, 15/23,
16/23). Does anyone have time to review them this week?

