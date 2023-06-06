Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC137250C8
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Jun 2023 01:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686093988;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=D2FxAGdDZl5bgEmc1sdGZWqw52ArESB47KTKiPcLPLY=;
	b=AjmUPksUU5QdBf0ubdU4rB/c9K+nOd4upcjvAZAAtVsgcPRuQ3KgyNeB8Ep7uvNfcAHoEx
	16llKFRrXX35lwkl6BSBSyp1wSzJngW40HY+MsmA+pOmLI6TGM0mHRAOze+8AjjoIGVKoR
	YsKqL5JrOBtZKvdcXvs0eCDie9vEl9Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-OHQwZf6JOe2kRuCBzeO17A-1; Tue, 06 Jun 2023 19:26:23 -0400
X-MC-Unique: OHQwZf6JOe2kRuCBzeO17A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 792D2801224;
	Tue,  6 Jun 2023 23:26:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 263D52166B25;
	Tue,  6 Jun 2023 23:26:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E97381946A45;
	Tue,  6 Jun 2023 23:26:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4358119465BA for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 23:26:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EDA6F40D1B68; Tue,  6 Jun 2023 23:26:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E662740D1B66
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 23:26:19 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB9053802132
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 23:26:19 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-2x0cK_r6PvK0hMDPpOZPkg-1; Tue, 06 Jun 2023 19:26:16 -0400
X-MC-Unique: 2x0cK_r6PvK0hMDPpOZPkg-1
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-4f004cc54f4so8401856e87.3; 
 Tue, 06 Jun 2023 16:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686093974; x=1688685974;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D2FxAGdDZl5bgEmc1sdGZWqw52ArESB47KTKiPcLPLY=;
 b=I1PncVpxG/3gqTGxU0qnGd6pwrIVKXxygm5WM+M9oJ1c+eOzp9B3mPGU63D2na7Zmk
 6LkPYouO84a46tUMMwiYAgMS/FOJQfmeSICVMvBs5tUAvpl0yA9BofoQ4hP6+pqCx6jc
 Cpv+HClozaA2HzNrafBtOTagPk4kre3L+ptsNTJdD9AcUlUnjw/NKt8ivkidpIwVhXe+
 6gY8bapSeN/BOCef0M6DULtOH9ix3pHKR1VXKpWPb0ln+/dsol7NwKeGsNCbYusxoLMh
 cQPiBSyJ2TXdsnDAZfzUiRRE2YPb0RStkafQMcKlmnAx9DuS2S/UO7DFpENeh5eeACUj
 qp4A==
X-Gm-Message-State: AC+VfDy16WIIjzWZTLLP54SWIlNGkSnvty+xrHjabLi6tUWWd+DSEO30
 1niwd3XxKNlkxg7bJcVHnZ15TaSwufZr24DJS4TKIakCoreuEQ+B
X-Google-Smtp-Source: ACHHUZ6SfjaRP3YtOFCNS4yCdkaqCJ8teFuVo8Ikffok1F9vmEH88dw9R12b5x5lWvL8FyzMuYNeHdepsTrMY/MYU40=
X-Received: by 2002:a2e:7e03:0:b0:2af:1622:a69 with SMTP id
 z3-20020a2e7e03000000b002af16220a69mr1857907ljc.48.1686093974222; Tue, 06 Jun
 2023 16:26:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230606223346.3241328-1-willy@infradead.org>
 <20230606223346.3241328-8-willy@infradead.org>
In-Reply-To: <20230606223346.3241328-8-willy@infradead.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Wed, 7 Jun 2023 01:26:03 +0200
Message-ID: <CAHpGcMJgZ3ik4NBW5fY-3nZcQRF+GCfJ=S9+mtndokOi8Lc1fA@mail.gmail.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v2 07/14] buffer: Convert
 block_page_mkwrite() to use a folio
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
Cc: Hannes Reinecke <hare@suse.com>, cluster-devel@redhat.com,
 Luis Chamberlain <mcgrof@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="UTF-8"

Am Mi., 7. Juni 2023 um 00:48 Uhr schrieb Matthew Wilcox (Oracle)
<willy@infradead.org>:
> If any page in a folio is dirtied, dirty the entire folio.  Removes a
> number of hidden calls to compound_head() and references to page->mapping
> and page->index.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/buffer.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
>
> diff --git a/fs/buffer.c b/fs/buffer.c
> index d8c2c000676b..f34ed29b1085 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -2564,38 +2564,37 @@ EXPORT_SYMBOL(block_commit_write);
>  int block_page_mkwrite(struct vm_area_struct *vma, struct vm_fault *vmf,
>                          get_block_t get_block)
>  {
> -       struct page *page = vmf->page;
> +       struct folio *folio = page_folio(vmf->page);
>         struct inode *inode = file_inode(vma->vm_file);
>         unsigned long end;
>         loff_t size;
>         int ret;
>
> -       lock_page(page);
> +       folio_lock(folio);
>         size = i_size_read(inode);
> -       if ((page->mapping != inode->i_mapping) ||
> -           (page_offset(page) > size)) {
> +       if ((folio->mapping != inode->i_mapping) ||
> +           (folio_pos(folio) > size)) {

This should probably also be 'folio_pos(folio) >= size', but this was
wrong before this patch already.

>                 /* We overload EFAULT to mean page got truncated */
>                 ret = -EFAULT;
>                 goto out_unlock;
>         }
>
> -       /* page is wholly or partially inside EOF */
> -       if (((page->index + 1) << PAGE_SHIFT) > size)
> -               end = size & ~PAGE_MASK;
> -       else
> -               end = PAGE_SIZE;
> +       end = folio_size(folio);
> +       /* folio is wholly or partially inside EOF */
> +       if (folio_pos(folio) + end > size)
> +               end = size - folio_pos(folio);
>
> -       ret = __block_write_begin(page, 0, end, get_block);
> +       ret = __block_write_begin_int(folio, 0, end, get_block, NULL);
>         if (!ret)
> -               ret = block_commit_write(page, 0, end);
> +               ret = block_commit_write(&folio->page, 0, end);
>
>         if (unlikely(ret < 0))
>                 goto out_unlock;
> -       set_page_dirty(page);
> -       wait_for_stable_page(page);
> +       folio_set_dirty(folio);
> +       folio_wait_stable(folio);
>         return 0;
>  out_unlock:
> -       unlock_page(page);
> +       folio_unlock(folio);
>         return ret;
>  }
>  EXPORT_SYMBOL(block_page_mkwrite);
> --
> 2.39.2
>

Thanks,
Andreas

