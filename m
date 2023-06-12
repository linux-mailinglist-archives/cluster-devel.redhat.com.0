Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FD172D34A
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 23:29:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686605340;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hjqAmeFI8U8irr4gRZ+wZ0R5OBkpx1S1PK7ovSI7e9c=;
	b=GIQhlfshDW0/+YyyKBkNk4Rsqb1XDzQwrTR99PKuA2oreXYxe+kSapMGiAa3W0TojjYNUh
	emo8Ub4BRw9+PBoIkrvRkAASoM0KixapNK1ZEXF43c+q7QKjCwUEnaav7e7F/9uCLL7RhO
	uL/3+AKmuQADZh5yS+3ICExZvln/Fws=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-stQdQWV2MpuSTLkjbzvTNA-1; Mon, 12 Jun 2023 17:28:55 -0400
X-MC-Unique: stQdQWV2MpuSTLkjbzvTNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 39239811E7F;
	Mon, 12 Jun 2023 21:28:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24DFA1121314;
	Mon, 12 Jun 2023 21:28:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E080919465B9;
	Mon, 12 Jun 2023 21:28:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A1CD3194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 21:28:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 52C6B2166B26; Mon, 12 Jun 2023 21:28:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AB302166B25
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:28:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27D633C025CC
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 21:28:52 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-yqbThIP_PDaolCLaGI3xnw-1; Mon, 12 Jun 2023 17:28:50 -0400
X-MC-Unique: yqbThIP_PDaolCLaGI3xnw-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1b3daa7ad62so6730155ad.1
 for <cluster-devel@redhat.com>; Mon, 12 Jun 2023 14:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686605330; x=1689197330;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hjqAmeFI8U8irr4gRZ+wZ0R5OBkpx1S1PK7ovSI7e9c=;
 b=hW14E6XaBCIRTYXRnnIkGiU5gI6EGq0GPKknY0MZSzTZSfx0Bs8URtCPkFfkdMlIyR
 x51a9qs+ndm6MACS+Cfjey+LO54F0AEWRwFG4mg8GoD5RIlGzOFEQO97qKc5/MTTPmGz
 fWrbT145vdDK3V39YZKDKofwPGXbJwAcxd/N8+nJ43Ucazhc1Vs5GFxayLAUReWVSojN
 ONQ/5j7/rd5tMrSzR6+6fooBin2E72i59QnYGbaiyxm9rWXJdo41X1jR5adJiAGZGTmg
 MAcNisymegOqJuudfSm3+/Ugdwf3lDd9k3W4xxrxZiiYCfJ90R0I2gfsMjNmZF/58JEJ
 V83A==
X-Gm-Message-State: AC+VfDzbR+yKzPCTfJ+50bib2wC6r2vHnrALp695LhofvTWCGyholDTy
 3nIPhEzUoB6MB/ioDi7HGESbaJeMj5YtVbUuTHNbRTTrIxWRZlRMHhE4aoQoQWRjmCv1mtprTx2
 9ukYS+7TFW+ACXA++4OMRqFUbFC20mvflwO062Q==
X-Received: by 2002:a17:902:b416:b0:1b2:2c0c:d400 with SMTP id
 x22-20020a170902b41600b001b22c0cd400mr6641327plr.52.1686605329719; 
 Mon, 12 Jun 2023 14:28:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6rWzPzPD8nivIyYZaFs3EDuZHFThUOOKiZrJjfcGJD7CvzNHfJKoudwnZjpNK1ynO/WTOxAvv5S9o+kZQa2p0=
X-Received: by 2002:a17:902:b416:b0:1b2:2c0c:d400 with SMTP id
 x22-20020a170902b41600b001b22c0cd400mr6641315plr.52.1686605329287; Mon, 12
 Jun 2023 14:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230612210141.730128-1-willy@infradead.org>
In-Reply-To: <20230612210141.730128-1-willy@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 12 Jun 2023 23:28:37 +0200
Message-ID: <CAHc6FU5qEBSP7MTOmZcH-_Sgrq-iiVhYVLmw087nkaNDhumAig@mail.gmail.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v3 00/14] gfs2/buffer folio changes for
 6.5
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
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 Hannes Reinecke <hare@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 11:02=E2=80=AFPM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
> This kind of started off as a gfs2 patch series, then became entwined
> with buffer heads once I realised that gfs2 was the only remaining
> caller of __block_write_full_page().  For those not in the gfs2 world,
> the big point of this series is that block_write_full_page() should now
> handle large folios correctly.

This is great, thank you. For the gfs2 bits:

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

> Andrew, if you want, I'll drop it into the pagecache tree, or you
> can just take it.
>
> v3:
>  - Fix a patch title
>  - Fix some checks against i_size to be >=3D instead of >
>  - Call folio_mark_dirty() instead of folio_set_dirty()
>
> Matthew Wilcox (Oracle) (14):
>   gfs2: Use a folio inside gfs2_jdata_writepage()
>   gfs2: Pass a folio to __gfs2_jdata_write_folio()
>   gfs2: Convert gfs2_write_jdata_page() to gfs2_write_jdata_folio()
>   buffer: Convert __block_write_full_page() to
>     __block_write_full_folio()
>   gfs2: Support ludicrously large folios in gfs2_trans_add_databufs()
>   buffer: Make block_write_full_page() handle large folios correctly
>   buffer: Convert block_page_mkwrite() to use a folio
>   buffer: Convert __block_commit_write() to take a folio
>   buffer: Convert page_zero_new_buffers() to folio_zero_new_buffers()
>   buffer: Convert grow_dev_page() to use a folio
>   buffer: Convert init_page_buffers() to folio_init_buffers()
>   buffer: Convert link_dev_buffers to take a folio
>   buffer: Use a folio in __find_get_block_slow()
>   buffer: Convert block_truncate_page() to use a folio
>
>  fs/buffer.c                 | 257 ++++++++++++++++++------------------
>  fs/ext4/inode.c             |   4 +-
>  fs/gfs2/aops.c              |  69 +++++-----
>  fs/gfs2/aops.h              |   2 +-
>  fs/ntfs/aops.c              |   2 +-
>  fs/reiserfs/inode.c         |   9 +-
>  include/linux/buffer_head.h |   4 +-
>  7 files changed, 172 insertions(+), 175 deletions(-)
>
> --
> 2.39.2
>

