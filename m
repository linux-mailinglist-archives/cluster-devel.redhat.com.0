Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 73CBB36EEB6
	for <lists+cluster-devel@lfdr.de>; Thu, 29 Apr 2021 19:16:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619716613;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8RXzvV9OayhG64BmNGxjD390UiscULVbN0Giy/F/zR4=;
	b=gQoUhbdU1C9UYPw3f3Yd815IDB64wRrQ7PcRHKdFyT8ekLxeJUAS3TtAalEXJ5xgm/NcWA
	7Brlbx0Xsq5EHKuVfIKiOzB4KBnFsQuCYaW16PniSODSaMbNxmEBEwCp64RGkLcLkclFen
	fQj01Z3BpXRdSt/BGH+jMyX2ozh2IEk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-uwUbVEzEMaOsi6vAl3CvLA-1; Thu, 29 Apr 2021 13:16:51 -0400
X-MC-Unique: uwUbVEzEMaOsi6vAl3CvLA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8E9A1020C26;
	Thu, 29 Apr 2021 17:16:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AAD95D6DC;
	Thu, 29 Apr 2021 17:16:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 854E81809C82;
	Thu, 29 Apr 2021 17:16:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13THEdKX022934 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 29 Apr 2021 13:14:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 822EA60C22; Thu, 29 Apr 2021 17:14:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx01.redhat.com
	(mimecast02.extmail.prod.ext.phx2.redhat.com [10.5.110.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E0065DDAD
	for <cluster-devel@redhat.com>; Thu, 29 Apr 2021 17:14:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E9D6107ACE6
	for <cluster-devel@redhat.com>; Thu, 29 Apr 2021 17:14:35 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-555-cAJCO0eFMtawkWPFg6oGXg-1; Thu, 29 Apr 2021 13:14:33 -0400
X-MC-Unique: cAJCO0eFMtawkWPFg6oGXg-1
Received: by mail-wm1-f69.google.com with SMTP id
	g67-20020a1cb6460000b029014297bda128so1447787wmf.1
	for <cluster-devel@redhat.com>; Thu, 29 Apr 2021 10:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8RXzvV9OayhG64BmNGxjD390UiscULVbN0Giy/F/zR4=;
	b=Vfazj7g83YybcoPSFC3zOmDfGOIfO03K2AT0vUjgI1/3iBG3Lv4m4XuSUHFCMjs4eF
	Z+XizzWMW67I2jhv9/U4BE+UkaLKFeFzIwN9vuVAbM9SiqVUtI/MuQfLkQsOLotY7Iq/
	BuO6L3XJdv4Jp/wo6hLclSGD4+2M0/7kvqAAFrNTXHa6UGSr2FJ91R5XtIxMfnWW3uX0
	eqeWpCThep5ttVV23I3oO1XvnTznO94ESbzZ/nv5ER8QtoPaG583oNQtFVeArlPvVQ+l
	MdO/m97vhQCyedeOirQh+FAR5e1xn+RF2ry2xV2abWqdW7fSx+SgGcW9BjJ0skem0H9+
	ExmA==
X-Gm-Message-State: AOAM532uQPHTfAEP590rD/UPTjBej5VMCAW4IT2W9geuN3ggamwviUF2
	dppWmv8x4fd0iTr4aaSOU1WRJFh8ZO2809rmfzADA7yUj0DKYdFQYkCrqpYN5B0UQ0cilKeHMnz
	ZZ8mADlcEyfChUm1SYVbF0zZ7RNZH6mYYWu+T4Q==
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr1303764wmk.2.1619716471704;
	Thu, 29 Apr 2021 10:14:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqqJNwW6qO+gOOYbgUVgcP4w2CGtX5ilJ2ey5tGpv23Te/nOWasO76frpbdhzHgMiUs34r0vc0+rJcpHDH1co=
X-Received: by 2002:a7b:c5c8:: with SMTP id n8mr1303722wmk.2.1619716471400;
	Thu, 29 Apr 2021 10:14:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210426220552.45413-1-junxiao.bi@oracle.com>
In-Reply-To: <20210426220552.45413-1-junxiao.bi@oracle.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 29 Apr 2021 19:14:20 +0200
Message-ID: <CAHc6FU62TpZTnAYd3DWFNWWPZP-6z+9JrS82t+YnU-EtFrnU0Q@mail.gmail.com>
To: Junxiao Bi <junxiao.bi@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH 1/3] fs/buffer.c: add new api to allow
	eof writeback
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Junxiao,

On Tue, Apr 27, 2021 at 4:44 AM Junxiao Bi <junxiao.bi@oracle.com> wrote:
> When doing truncate/fallocate for some filesytem like ocfs2, it
> will zero some pages that are out of inode size and then later
> update the inode size, so it needs this api to writeback eof
> pages.

is this in reaction to Jan's "[PATCH 0/12 v4] fs: Hole punch vs page
cache filling races" patch set [*]? It doesn't look like the kind of
patch Christoph would be happy with.

Thanks,
Andreas

[*] https://lore.kernel.org/linux-fsdevel/20210423171010.12-1-jack@suse.cz/

> Cc: <stable@vger.kernel.org>
> Signed-off-by: Junxiao Bi <junxiao.bi@oracle.com>
> ---
>  fs/buffer.c                 | 14 +++++++++++---
>  include/linux/buffer_head.h |  3 +++
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/fs/buffer.c b/fs/buffer.c
> index 0cb7ffd4977c..802f0bacdbde 100644
> --- a/fs/buffer.c
> +++ b/fs/buffer.c
> @@ -1709,9 +1709,9 @@ static struct buffer_head *create_page_buffers(struct page *page, struct inode *
>   * WB_SYNC_ALL, the writes are posted using REQ_SYNC; this
>   * causes the writes to be flagged as synchronous writes.
>   */
> -int __block_write_full_page(struct inode *inode, struct page *page,
> +int __block_write_full_page_eof(struct inode *inode, struct page *page,
>                         get_block_t *get_block, struct writeback_control *wbc,
> -                       bh_end_io_t *handler)
> +                       bh_end_io_t *handler, bool eof_write)
>  {
>         int err;
>         sector_t block;
> @@ -1746,7 +1746,7 @@ int __block_write_full_page(struct inode *inode, struct page *page,
>          * handle any aliases from the underlying blockdev's mapping.
>          */
>         do {
> -               if (block > last_block) {
> +               if (block > last_block && !eof_write) {
>                         /*
>                          * mapped buffers outside i_size will occur, because
>                          * this page can be outside i_size when there is a
> @@ -1871,6 +1871,14 @@ int __block_write_full_page(struct inode *inode, struct page *page,
>         unlock_page(page);
>         goto done;
>  }
> +EXPORT_SYMBOL(__block_write_full_page_eof);
> +
> +int __block_write_full_page(struct inode *inode, struct page *page,
> +                       get_block_t *get_block, struct writeback_control *wbc,
> +                       bh_end_io_t *handler)
> +{
> +       return __block_write_full_page_eof(inode, page, get_block, wbc, handler, false);
> +}
>  EXPORT_SYMBOL(__block_write_full_page);
>
>  /*
> diff --git a/include/linux/buffer_head.h b/include/linux/buffer_head.h
> index 6b47f94378c5..5da15a1ba15c 100644
> --- a/include/linux/buffer_head.h
> +++ b/include/linux/buffer_head.h
> @@ -221,6 +221,9 @@ int block_write_full_page(struct page *page, get_block_t *get_block,
>  int __block_write_full_page(struct inode *inode, struct page *page,
>                         get_block_t *get_block, struct writeback_control *wbc,
>                         bh_end_io_t *handler);
> +int __block_write_full_page_eof(struct inode *inode, struct page *page,
> +                       get_block_t *get_block, struct writeback_control *wbc,
> +                       bh_end_io_t *handler, bool eof_write);
>  int block_read_full_page(struct page*, get_block_t*);
>  int block_is_partially_uptodate(struct page *page, unsigned long from,
>                                 unsigned long count);
> --
> 2.24.3 (Apple Git-128)
>

