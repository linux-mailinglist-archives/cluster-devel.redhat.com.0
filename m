Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F0F72509F
	for <lists+cluster-devel@lfdr.de>; Wed,  7 Jun 2023 01:16:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686093361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=fyl/WcE6YqSdLzSAWk7AiiVSzw5Ws6uIFfgoB2cNJu4=;
	b=Xt57otGgXYBS0NB2JXj32iqz5ubspuCwLeQoCE3vYoM0PQhZ16JhDTIcp2bLzntvqUWXB9
	nfOF8HwPyJHzbZN5YD6xz6WZIJJ1L4nEjN8EW3CdM/m0Nj5J0+m2/X7OUUDMxs2MN7OglA
	UFHQl8g97WQue9L/Agk+fKIbOUdF05I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-s-nDzha-Nxif7AH9jAySlw-1; Tue, 06 Jun 2023 19:15:58 -0400
X-MC-Unique: s-nDzha-Nxif7AH9jAySlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61027101A55C;
	Tue,  6 Jun 2023 23:15:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D042540CFD46;
	Tue,  6 Jun 2023 23:15:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8BAAD1946A45;
	Tue,  6 Jun 2023 23:15:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8B00B19465BA for <cluster-devel@listman.corp.redhat.com>;
 Tue,  6 Jun 2023 23:15:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7CDC140CFD48; Tue,  6 Jun 2023 23:15:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75CB740CFD47
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 23:15:53 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57B0029A9D50
 for <cluster-devel@redhat.com>; Tue,  6 Jun 2023 23:15:53 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-tg9TY0LNNKmqb5AvB2FlEw-1; Tue, 06 Jun 2023 19:15:47 -0400
X-MC-Unique: tg9TY0LNNKmqb5AvB2FlEw-1
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2b1adf27823so64181071fa.2; 
 Tue, 06 Jun 2023 16:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686093345; x=1688685345;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fyl/WcE6YqSdLzSAWk7AiiVSzw5Ws6uIFfgoB2cNJu4=;
 b=E+ODR70uBAd67J3btAq9cFTLQqm6lQ/iLDPMApaNx/NroqCxQso3nBObylkLPwU3vR
 H+KhtX9aYZyHOJYol2BMT1puKNr3R9lbzOCG9tG91trdgcJ8uZ9a0Kmj0W4/VKNdAygC
 f+hs2ZlRmQFjQmFkTEbomaIitI1e0mJwyXamQh0GuVrWyXUD2HzQ1OQ3xQSJfslywZM8
 wA4sgNHIm/Hp6hb6mY82nWk94hKanNg5LPiWbtJ+JQHinmLBJzj58FisHQQBVbW2bSzF
 NXHYX3rmbxf83e5wzomeBqx4wTwS7b/++jqFhajauvQ9RmR+vnt2eQSWdl3AEvIbBgFw
 p/sg==
X-Gm-Message-State: AC+VfDxs1nVEMToZCWANXEC8HSfqsY9ezgWY1GsW5JN/8mWWs5QzK8yr
 6Qydat9buDVHFm3rNS232vPBgHwCczt2lSwGPozbwHd0tK8=
X-Google-Smtp-Source: ACHHUZ6vig3CbZKUnpz0pCOFJWHOQy0gXgLFYiEw2QsrYj5z5ar7ObRCxIWkbSYXJbRcUCkQ24O+sHsMWPwwS4WktYg=
X-Received: by 2002:a2e:894b:0:b0:2b1:ee25:973f with SMTP id
 b11-20020a2e894b000000b002b1ee25973fmr1641362ljk.39.1686093345233; Tue, 06
 Jun 2023 16:15:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230606223346.3241328-1-willy@infradead.org>
 <20230606223346.3241328-7-willy@infradead.org>
In-Reply-To: <20230606223346.3241328-7-willy@infradead.org>
From: =?UTF-8?Q?Andreas_Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Date: Wed, 7 Jun 2023 01:15:34 +0200
Message-ID: <CAHpGcMK09P=56Z9UEUJx_3-7HPyfXDF4wxJ7wA5J0EutuxzfGw@mail.gmail.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v2 06/14] buffer: Make
 block_write_full_page() handle large folios correctly
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="UTF-8"

Am Mi., 7. Juni 2023 um 00:41 Uhr schrieb Matthew Wilcox (Oracle)
<willy@infradead.org>:
> Keep the interface as struct page, but work entirely on the folio
> internally.  Removes several PAGE_SIZE assumptions and removes
> some references to page->index and page->mapping.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Tested-by: Bob Peterson <rpeterso@redhat.com>
> Reviewed-by: Bob Peterson <rpeterso@redhat.com>
> ---
>  fs/buffer.c | 22 ++++++++++------------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/fs/buffer.c b/fs/buffer.c
> index 4d518df50fab..d8c2c000676b 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -2678,33 +2678,31 @@ int block_write_full_page(struct page *page, get_block_t *get_block,
>                         struct writeback_control *wbc)
>  {
>         struct folio *folio = page_folio(page);
> -       struct inode * const inode = page->mapping->host;
> +       struct inode * const inode = folio->mapping->host;
>         loff_t i_size = i_size_read(inode);
> -       const pgoff_t end_index = i_size >> PAGE_SHIFT;
> -       unsigned offset;
>
> -       /* Is the page fully inside i_size? */
> -       if (page->index < end_index)
> +       /* Is the folio fully inside i_size? */
> +       if (folio_pos(folio) + folio_size(folio) <= i_size)
>                 return __block_write_full_folio(inode, folio, get_block, wbc,
>                                                end_buffer_async_write);
>
> -       /* Is the page fully outside i_size? (truncate in progress) */
> -       offset = i_size & (PAGE_SIZE-1);
> -       if (page->index >= end_index+1 || !offset) {
> +       /* Is the folio fully outside i_size? (truncate in progress) */
> +       if (folio_pos(folio) > i_size) {

The folio is also fully outside i_size if folio_pos(folio) == i_size.

>                 folio_unlock(folio);
>                 return 0; /* don't care */
>         }
>
>         /*
> -        * The page straddles i_size.  It must be zeroed out on each and every
> +        * The folio straddles i_size.  It must be zeroed out on each and every
>          * writepage invocation because it may be mmapped.  "A file is mapped
>          * in multiples of the page size.  For a file that is not a multiple of
> -        * the  page size, the remaining memory is zeroed when mapped, and
> +        * the page size, the remaining memory is zeroed when mapped, and
>          * writes to that region are not written out to the file."
>          */
> -       zero_user_segment(page, offset, PAGE_SIZE);
> +       folio_zero_segment(folio, offset_in_folio(folio, i_size),
> +                       folio_size(folio));
>         return __block_write_full_folio(inode, folio, get_block, wbc,
> -                                                       end_buffer_async_write);
> +                       end_buffer_async_write);
>  }
>  EXPORT_SYMBOL(block_write_full_page);
>
> --
> 2.39.2
>

Thanks,
Andreas

