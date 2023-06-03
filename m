Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ED940720EF9
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Jun 2023 11:34:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685784878;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x58XsbDwgcPZPjys9OtSeiXoYr20YcCQo3VJQaPcuFI=;
	b=K1yUONbyJRrtdRkuoM6ik/fUGKut7eucFZpwYSOnuvw59IrKgMTBTfIhFU61KXIYilRtKC
	WMBq0ZoiiqaT77MIBIOzt8QPM8csMhdzWF9reJqrwnCE56yiuoo75g84IxezJl+BPBPIfi
	E9CkeHZomlQCwyr9kLT6TXt17SlUwPM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-I6yVBHI0PnOurhD_BhYpbw-1; Sat, 03 Jun 2023 05:34:35 -0400
X-MC-Unique: I6yVBHI0PnOurhD_BhYpbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F02E8032E4;
	Sat,  3 Jun 2023 09:34:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF0C340C1437;
	Sat,  3 Jun 2023 09:34:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EF4C319465B9;
	Sat,  3 Jun 2023 09:34:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B9E5419465A2 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  3 Jun 2023 09:34:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 590CE1121315; Sat,  3 Jun 2023 09:34:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 517B11121314
 for <cluster-devel@redhat.com>; Sat,  3 Jun 2023 09:34:30 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 323E480120A
 for <cluster-devel@redhat.com>; Sat,  3 Jun 2023 09:34:30 +0000 (UTC)
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-qXtiYVTIN0ifbbv_sktclA-1; Sat, 03 Jun 2023 05:34:27 -0400
X-MC-Unique: qXtiYVTIN0ifbbv_sktclA-1
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-397f46c1637so2963658b6e.1
 for <cluster-devel@redhat.com>; Sat, 03 Jun 2023 02:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685784866; x=1688376866;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x58XsbDwgcPZPjys9OtSeiXoYr20YcCQo3VJQaPcuFI=;
 b=T+RApIxkjT2PfDQIPAiahLHT7qy9yvrkp9IxWdP9KBV/kC1iCiFj1wrvk2MmK915Kl
 Gem/DFEXLY4G/JzGfOZ5GpbhnFt7qH/drEmnaJ8z9peHF8/bBTBflNdtKo+tuZ2TlSDO
 mJvFeagFysgrxkG9BSpXa3vsEPM/Cir7XWVZQGcQ+26kwZiUHLYN70s4d4wpLLlzucDU
 mYOGxAbinMvwIpfSBui8ql6QzDjo+sKhY3qIMw+7cKLFnOy2OkLxAqZ46PW/fUgzg3j4
 ofIKq1RiocvvcpeaSDcBxUJPO8jHECrnr00cyGC3hXxL6Pk7FCcFV/azRDqiSPrX6/UF
 v6Eg==
X-Gm-Message-State: AC+VfDxFXTsnoWenEPT4UGOOkIbN+0tAAHzaY8VMHrskG+SJrA0VaTUY
 3Tu5rEhnUxO38OFWZZsLkDiRuAU0Z8Ii952vjbWzs8ol61sUsF5qNvCm1835X0nOlmxQOKfS+/1
 TTXR0YKyxYeLSYfIH8YZxYkuW+QLxU2wKB4882g==
X-Received: by 2002:a54:4487:0:b0:39a:5ea3:6b16 with SMTP id
 v7-20020a544487000000b0039a5ea36b16mr2727981oiv.41.1685784866302; 
 Sat, 03 Jun 2023 02:34:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6VKD+1A8NW7aigs8q2tndWPjsJKaJckriKXAwfdCOfkVQHaGIQbHD54PPd5XPRs6HbQzGCoJl71+k5dnqQr9I=
X-Received: by 2002:a54:4487:0:b0:39a:5ea3:6b16 with SMTP id
 v7-20020a544487000000b0039a5ea36b16mr2727969oiv.41.1685784865940; Sat, 03 Jun
 2023 02:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230517032442.1135379-1-willy@infradead.org>
 <20230517032442.1135379-4-willy@infradead.org>
In-Reply-To: <20230517032442.1135379-4-willy@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sat, 3 Jun 2023 11:34:14 +0200
Message-ID: <CAHc6FU4G1F1OXC233hT7_Vog9F8GNZyeLwsi+01USSXhFBNc_A@mail.gmail.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] [PATCH 3/6] gfs2: Convert
 gfs2_write_jdata_page() to gfs2_write_jdata_folio()
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
Cc: Hannes Reinecke <hare@suse.com>, cluster-devel <cluster-devel@redhat.com>,
 Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Willy,

thanks for these patches. This particular one looks problematic:

On Wed, May 17, 2023 at 5:24=E2=80=AFAM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
> This function now supports large folios, even if nothing around it does.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/gfs2/aops.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index 749135252d52..0f92e3e117da 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -82,33 +82,34 @@ static int gfs2_get_block_noalloc(struct inode *inode=
, sector_t lblock,
>  }
>
>  /**
> - * gfs2_write_jdata_page - gfs2 jdata-specific version of block_write_fu=
ll_page
> - * @page: The page to write
> + * gfs2_write_jdata_folio - gfs2 jdata-specific version of block_write_f=
ull_page
> + * @folio: The folio to write
>   * @wbc: The writeback control
>   *
>   * This is the same as calling block_write_full_page, but it also
>   * writes pages outside of i_size
>   */
> -static int gfs2_write_jdata_page(struct page *page,
> +static int gfs2_write_jdata_folio(struct folio *folio,
>                                  struct writeback_control *wbc)
>  {
> -       struct inode * const inode =3D page->mapping->host;
> +       struct inode * const inode =3D folio->mapping->host;
>         loff_t i_size =3D i_size_read(inode);
> -       const pgoff_t end_index =3D i_size >> PAGE_SHIFT;
> -       unsigned offset;
>
> +       if (folio_pos(folio) >=3D i_size)
> +               return 0;

Function gfs2_write_jdata_page was originally introduced as
gfs2_write_full_page in commit fd4c5748b8d3 ("gfs2: writeout truncated
pages") to allow writing pages even when they are beyond EOF, as the
function description documents.

This hack was added because simply skipping journaled pages isn't
enough on gfs2; before a journaled page can be freed, it needs to be
marked as "revoked" in the journal. Journal recovery will then skip
the revoked blocks, which allows them to be reused for regular,
non-journaled data. We can end up here in contexts in which we cannot
"revoke" pages, so instead, we write the original pages even when they
are beyond EOF. This hack could be revisited, but it's pretty nasty
code to pick apart.

So at least the above if needs to go for now.

>         /*
> -        * The page straddles i_size.  It must be zeroed out on each and =
every
> +        * The folio straddles i_size.  It must be zeroed out on each and=
 every
>          * writepage invocation because it may be mmapped.  "A file is ma=
pped
>          * in multiples of the page size.  For a file that is not a multi=
ple of
> -        * the  page size, the remaining memory is zeroed when mapped, an=
d
> +        * the page size, the remaining memory is zeroed when mapped, and
>          * writes to that region are not written out to the file."
>          */
> -       offset =3D i_size & (PAGE_SIZE - 1);
> -       if (page->index =3D=3D end_index && offset)
> -               zero_user_segment(page, offset, PAGE_SIZE);
> +       if (i_size < folio_pos(folio) + folio_size(folio))
> +               folio_zero_segment(folio, offset_in_folio(folio, i_size),
> +                               folio_size(folio));
>
> -       return __block_write_full_page(inode, page, gfs2_get_block_noallo=
c, wbc,
> +       return __block_write_full_page(inode, &folio->page,
> +                                      gfs2_get_block_noalloc, wbc,
>                                        end_buffer_async_write);
>  }
>
> @@ -137,7 +138,7 @@ static int __gfs2_jdata_write_folio(struct folio *fol=
io,
>                 }
>                 gfs2_trans_add_databufs(ip, folio, 0, folio_size(folio));
>         }
> -       return gfs2_write_jdata_page(&folio->page, wbc);
> +       return gfs2_write_jdata_folio(folio, wbc);
>  }
>
>  /**
> --
> 2.39.2
>

Thanks,
Andreas

