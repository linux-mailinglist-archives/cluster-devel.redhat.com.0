Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B795430F1
	for <lists+cluster-devel@lfdr.de>; Wed,  8 Jun 2022 15:02:30 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-0iBNE5ICPn6cAFbH7T_5zA-1; Wed, 08 Jun 2022 09:02:28 -0400
X-MC-Unique: 0iBNE5ICPn6cAFbH7T_5zA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C1493806729;
	Wed,  8 Jun 2022 13:02:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7880492C3B;
	Wed,  8 Jun 2022 13:02:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7D9FE1947051;
	Wed,  8 Jun 2022 13:02:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5F69F19452D2 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Jun 2022 19:03:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3AA412BFEAA; Tue,  7 Jun 2022 19:03:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3549690A11
 for <cluster-devel@redhat.com>; Tue,  7 Jun 2022 19:03:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D10E38164E8
 for <cluster-devel@redhat.com>; Tue,  7 Jun 2022 19:03:29 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-q26EEqnKMWaYuYnYpgkZUw-1; Tue, 07 Jun 2022 15:03:17 -0400
X-MC-Unique: q26EEqnKMWaYuYnYpgkZUw-1
Received: by mail-wr1-f44.google.com with SMTP id k16so25416683wrg.7
 for <cluster-devel@redhat.com>; Tue, 07 Jun 2022 12:03:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YvJr1HjhCxOrlCoCkGFSV+IIsFWm48YyeI3AKcRnUIQ=;
 b=3Gv4tPtINlLsfP04wzukDrY88wJY4c252uOYRCiglTHghaP+zlthn+JTzEIep3xZ+k
 sD8BrOJgvGHniNLT4I/QfCHBmQ+Y88YVhnQ+Quey+f4wI7ZwJwFc+QMbim6l54PHcXRo
 r5OovZ3rDuOV6CPGGtspndnaOxnylFR0n0VodJVGVvgfoNQvOvFRWqyoxYOH5mKL4q0h
 xXfAIVD+2YVjcAM8zxbviz+tyRfm72kbfjjjBXpvv91LR0PkCA3qAGvYxiBP5/iqdhGu
 /3+YL5ntTBtL+plHsEOcpdi2b24/rIBL0hX6cxmGuoO3oRkOaapS2c/D19cINno+C11U
 lDQw==
X-Gm-Message-State: AOAM5304FWDFnrs+0yrMpYKWJhIufW2GWRVZr53efQHSSBB7NOn0Gp5K
 HlE7iwjYXSPOqdGC3C3UOlKA24Kh2ULspX1wQ6w=
X-Google-Smtp-Source: ABdhPJzCEhxBgnE2TvKp0j//I+yGIGt10PvMUBcSniQ/uliTPAhBtZXCX4ft7FKRwzuXla8IHTC/85U5DKgXrpVCjbg=
X-Received: by 2002:a5d:62c7:0:b0:216:fa41:2f81 with SMTP id
 o7-20020a5d62c7000000b00216fa412f81mr17337284wrv.249.1654628595478; Tue, 07
 Jun 2022 12:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220606204050.2625949-1-willy@infradead.org>
 <20220606204050.2625949-8-willy@infradead.org>
In-Reply-To: <20220606204050.2625949-8-willy@infradead.org>
From: Anna Schumaker <schumaker.anna@gmail.com>
Date: Tue, 7 Jun 2022 15:02:59 -0400
Message-ID: <CAFX2Jf=ugChaWF0Je=ew_-shhdSJYXy5dkjqsoL=9B37QWv3bA@mail.gmail.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mailman-Approved-At: Wed, 08 Jun 2022 12:54:53 +0000
Subject: Re: [Cluster-devel] [PATCH 07/20] nfs: Convert to migrate_folio
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
Cc: linux-aio@kvack.org, Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 cluster-devel@redhat.com, linux-ntfs-dev@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-ext4@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-xfs <linux-xfs@vger.kernel.org>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 7:37 PM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
>
> Use a folio throughout this function.  migrate_page() will be converted
> later.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Looks fairly straightforward.

Acked-by: Anna Schumaker <Anna.Schumaker@Netapp.com>

> ---
>  fs/nfs/file.c     |  4 +---
>  fs/nfs/internal.h |  6 ++++--
>  fs/nfs/write.c    | 16 ++++++++--------
>  3 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/fs/nfs/file.c b/fs/nfs/file.c
> index 2d72b1b7ed74..549baed76351 100644
> --- a/fs/nfs/file.c
> +++ b/fs/nfs/file.c
> @@ -533,9 +533,7 @@ const struct address_space_operations nfs_file_aops = {
>         .write_end = nfs_write_end,
>         .invalidate_folio = nfs_invalidate_folio,
>         .release_folio = nfs_release_folio,
> -#ifdef CONFIG_MIGRATION
> -       .migratepage = nfs_migrate_page,
> -#endif
> +       .migrate_folio = nfs_migrate_folio,
>         .launder_folio = nfs_launder_folio,
>         .is_dirty_writeback = nfs_check_dirty_writeback,
>         .error_remove_page = generic_error_remove_page,
> diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
> index 8f8cd6e2d4db..437ebe544aaf 100644
> --- a/fs/nfs/internal.h
> +++ b/fs/nfs/internal.h
> @@ -578,8 +578,10 @@ void nfs_clear_pnfs_ds_commit_verifiers(struct pnfs_ds_commit_info *cinfo)
>  #endif
>
>  #ifdef CONFIG_MIGRATION
> -extern int nfs_migrate_page(struct address_space *,
> -               struct page *, struct page *, enum migrate_mode);
> +int nfs_migrate_folio(struct address_space *, struct folio *dst,
> +               struct folio *src, enum migrate_mode);
> +#else
> +#define nfs_migrate_folio NULL
>  #endif
>
>  static inline int
> diff --git a/fs/nfs/write.c b/fs/nfs/write.c
> index 1c706465d090..649b9e633459 100644
> --- a/fs/nfs/write.c
> +++ b/fs/nfs/write.c
> @@ -2119,27 +2119,27 @@ int nfs_wb_page(struct inode *inode, struct page *page)
>  }
>
>  #ifdef CONFIG_MIGRATION
> -int nfs_migrate_page(struct address_space *mapping, struct page *newpage,
> -               struct page *page, enum migrate_mode mode)
> +int nfs_migrate_folio(struct address_space *mapping, struct folio *dst,
> +               struct folio *src, enum migrate_mode mode)
>  {
>         /*
> -        * If PagePrivate is set, then the page is currently associated with
> +        * If the private flag is set, the folio is currently associated with
>          * an in-progress read or write request. Don't try to migrate it.
>          *
>          * FIXME: we could do this in principle, but we'll need a way to ensure
>          *        that we can safely release the inode reference while holding
> -        *        the page lock.
> +        *        the folio lock.
>          */
> -       if (PagePrivate(page))
> +       if (folio_test_private(src))
>                 return -EBUSY;
>
> -       if (PageFsCache(page)) {
> +       if (folio_test_fscache(src)) {
>                 if (mode == MIGRATE_ASYNC)
>                         return -EBUSY;
> -               wait_on_page_fscache(page);
> +               folio_wait_fscache(src);
>         }
>
> -       return migrate_page(mapping, newpage, page, mode);
> +       return migrate_page(mapping, &dst->page, &src->page, mode);
>  }
>  #endif
>
> --
> 2.35.1
>

