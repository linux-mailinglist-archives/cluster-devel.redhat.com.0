Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC21667C6D
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Jan 2023 18:20:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673544014;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=E+c881Dpe/85Aq62y2qtNDOsySQkmPy3VHLSOKalLuM=;
	b=U9B1fFV03ZXBUgYngVycwWG8xfZqF2JzYHWwDI87ZF2XQyhtEeEanRvZM5rJkOfmVZvwoT
	6eMeqrcF1owukSNi/SE4G5APF8xVyeiGZsOW7s0ChhiXnKWwMAZZd3MDpQlg/clfW9tCSJ
	H8M7LCQDpWca3a9pbTHN5j66+nYzFiQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-ixuhCuH8MTOdHclhgxrWiw-1; Thu, 12 Jan 2023 12:20:08 -0500
X-MC-Unique: ixuhCuH8MTOdHclhgxrWiw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A791A3C01E02;
	Thu, 12 Jan 2023 17:20:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 909F4492C14;
	Thu, 12 Jan 2023 17:20:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5AA55194704F;
	Thu, 12 Jan 2023 17:20:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3D4C61946A78 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 12 Jan 2023 17:20:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D95164078904; Thu, 12 Jan 2023 17:20:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D1A774078903
 for <cluster-devel@redhat.com>; Thu, 12 Jan 2023 17:20:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3CD11C087A3
 for <cluster-devel@redhat.com>; Thu, 12 Jan 2023 17:20:04 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-635--I6bDOuVMiONY1Bokyg_6g-1; Thu, 12 Jan 2023 12:20:02 -0500
X-MC-Unique: -I6bDOuVMiONY1Bokyg_6g-1
Received: by mail-yb1-f176.google.com with SMTP id l139so19458959ybl.12
 for <cluster-devel@redhat.com>; Thu, 12 Jan 2023 09:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E+c881Dpe/85Aq62y2qtNDOsySQkmPy3VHLSOKalLuM=;
 b=qLRlJmTjlFyipjqL5Iv5dh9khD0BHEPLvK1UKGH9C9k54Dbi3ZFRXe0qP8x1dT0LAo
 z1RNeVYIPpsz8RyM3FLu/YsrP8jTUh0nfGgBQMpG43mRf1y+FXfPxY59e5ue2mywSjfu
 p4AFP6stxS12A0szqcdGAdd6jgGg6J/oaD9C5LDuDgu9vI+YXq7Q575b2MUwBqBmZyU1
 kVJ51LFaI4XKPnfwsdY1rqJ7TG/acy/7ldZPT7Dnp5KlChT/O77ml57WUAo2qlTU5xjZ
 RnlHNJSERZOBZK6Iq6llTRio2bZA53WE14inUYaC3UBEeSVvScg6mdYrUtJvCFiqEUA/
 EjOw==
X-Gm-Message-State: AFqh2krxLXkLL5FtmyHES4UHJWGKfGCBLHn+mXU+eNZc9Ky7tG06u3Ie
 LkeuKN+kMvkI4LCTQ+sJW6k4gdjh1h7sxbHIVPM=
X-Google-Smtp-Source: AMrXdXsAU7a6oM1sLrHI9+oxo29VzkKN9mlRylNCqKeDfYmz3uqWRlBtx5f1lx9/AgauD4UB5gGLFmj2h4TGKEvLRKQ=
X-Received: by 2002:a25:8a:0:b0:7ca:7f22:5c15 with SMTP id
 132-20020a25008a000000b007ca7f225c15mr196720yba.219.1673544001120; 
 Thu, 12 Jan 2023 09:20:01 -0800 (PST)
MIME-Version: 1.0
References: <20230104211448.4804-1-vishal.moola@gmail.com>
 <20230104211448.4804-10-vishal.moola@gmail.com>
In-Reply-To: <20230104211448.4804-10-vishal.moola@gmail.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Thu, 12 Jan 2023 09:19:50 -0800
Message-ID: <CAOzc2pw9WCgHyA2epbz5=HEWN4bFzD4C7zL2452J_egv7iSLrw@mail.gmail.com>
To: linux-fsdevel@vger.kernel.org, pc@cjr.nz, tom@talpey.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v5 09/23] cifs: Convert
 wdata_alloc_and_fillpages() to use filemap_get_folios_tag()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 4, 2023 at 1:15 PM Vishal Moola (Oracle)
<vishal.moola@gmail.com> wrote:
>
> This is in preparation for the removal of find_get_pages_range_tag(). Now also
> supports the use of large folios.
>
> Since tofind might be larger than the max number of folios in a
> folio_batch (15), we loop through filling in wdata->pages pulling more
> batches until we either reach tofind pages or run out of folios.
>
> This function may not return all pages in the last found folio before
> tofind pages are reached.
>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  fs/cifs/file.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/fs/cifs/file.c b/fs/cifs/file.c
> index 22dfc1f8b4f1..8cdd2f67af24 100644
> --- a/fs/cifs/file.c
> +++ b/fs/cifs/file.c
> @@ -2527,14 +2527,40 @@ wdata_alloc_and_fillpages(pgoff_t tofind, struct address_space *mapping,
>                           unsigned int *found_pages)
>  {
>         struct cifs_writedata *wdata;
> -
> +       struct folio_batch fbatch;
> +       unsigned int i, idx, p, nr;
>         wdata = cifs_writedata_alloc((unsigned int)tofind,
>                                      cifs_writev_complete);
>         if (!wdata)
>                 return NULL;
>
> -       *found_pages = find_get_pages_range_tag(mapping, index, end,
> -                               PAGECACHE_TAG_DIRTY, tofind, wdata->pages);
> +       folio_batch_init(&fbatch);
> +       *found_pages = 0;
> +
> +again:
> +       nr = filemap_get_folios_tag(mapping, index, end,
> +                               PAGECACHE_TAG_DIRTY, &fbatch);
> +       if (!nr)
> +               goto out; /* No dirty pages left in the range */
> +
> +       for (i = 0; i < nr; i++) {
> +               struct folio *folio = fbatch.folios[i];
> +
> +               idx = 0;
> +               p = folio_nr_pages(folio);
> +add_more:
> +               wdata->pages[*found_pages] = folio_page(folio, idx);
> +               folio_get(folio);
> +               if (++*found_pages == tofind) {
> +                       folio_batch_release(&fbatch);
> +                       goto out;
> +               }
> +               if (++idx < p)
> +                       goto add_more;
> +       }
> +       folio_batch_release(&fbatch);
> +       goto again;
> +out:
>         return wdata;
>  }
>
> --
> 2.38.1
>

Could someone review this cifs patch, please? This is one of the
2 remaining patches that need to be looked at in the series.

