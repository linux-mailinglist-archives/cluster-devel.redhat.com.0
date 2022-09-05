Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6BD5AD486
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Sep 2022 16:10:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662387022;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=/aM9Hz/CxTU/5IZIiOb0wSytjLDU1CYz4f/uZlzEYfY=;
	b=a80tISddIXnNAZFCMm6glO9QX8AwJzBODPP9BLSiS6lSIu42l791lifE/PLSCUvLEp7ZT4
	ff8eqrVVLRIoWTTS9wKw8twZw2ilhU7oElI7Nxn4hCHu5VEzzMpVUWUA698MiOuziIEkjk
	fgF/2IzIQytYeF/QdlDF3horQ4aP0n4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-630-d9wT_cTfPI68FTKsB3MWIg-1; Mon, 05 Sep 2022 10:10:18 -0400
X-MC-Unique: d9wT_cTfPI68FTKsB3MWIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8472185A79C;
	Mon,  5 Sep 2022 14:10:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 785CC9458A;
	Mon,  5 Sep 2022 14:10:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2D8EA194B966;
	Mon,  5 Sep 2022 14:10:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8D7251946A47 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  5 Sep 2022 14:10:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 71EF4C15BBD; Mon,  5 Sep 2022 14:10:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E2D9C15BB3
 for <cluster-devel@redhat.com>; Mon,  5 Sep 2022 14:10:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 568531C004E3
 for <cluster-devel@redhat.com>; Mon,  5 Sep 2022 14:10:15 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-yf6L_-9_NsqLWsnKdjgHsA-1; Mon, 05 Sep 2022 10:10:14 -0400
X-MC-Unique: yf6L_-9_NsqLWsnKdjgHsA-1
Received: by mail-pl1-f200.google.com with SMTP id
 h12-20020a170902f54c00b0016f8858ce9bso6122047plf.9
 for <cluster-devel@redhat.com>; Mon, 05 Sep 2022 07:10:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=/aM9Hz/CxTU/5IZIiOb0wSytjLDU1CYz4f/uZlzEYfY=;
 b=jIKuvxspHAhQaLtczaCf+jHj3Swrnh/fZ265ynmd0dkmTj/SZ4HXoKHRZvlMgJRZNU
 hzkh++eDsWioyxPLPk78TgorGI3kxDulH3F7q5bgapFgUejlePvq9hZBPBpgkc344Que
 7MXScyapm84dcWQwdaYU6BhJbc1rEG2M8yVpHR10zHDrwupa+a7wjzPsGBuwyB8xIKFq
 WPRjPGSFmd2gOs7FRCXbg75chy2ddbR8mlMF1ZHh6CqFtgrbzS4nTfShBh/6I5vUXaGB
 V1YNu34TGhg1uVeDuBeif5HhKiN1GvYwgY7FXejWsBw/b0PskJhROVi3Wgeqr4pX9wKT
 Uuyw==
X-Gm-Message-State: ACgBeo1WBcfIdSoe5VAgcLcdCKy7iCPdo+i4pd3wFzZIXXrZU9MiftB5
 EkrK8i36ID9TEgDUUPFEIRRvFe/D2Cvag/mLDOoxMg6VtLjZzFsa0JL1w1AxE8V/wNAq1BzdgWf
 VNAWy/qiGbozMI97GfULt3Kgm+rSBkqnp3ZJa3A==
X-Received: by 2002:a65:6e49:0:b0:429:cae6:aac6 with SMTP id
 be9-20020a656e49000000b00429cae6aac6mr41418472pgb.268.1662387013095; 
 Mon, 05 Sep 2022 07:10:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6Mbj0cnXfyvltZuZyI75OnAiCy5kv581MclsxMj6AKJtQBQIL0bE5MAfuVXEL2TcdEimwBiyT3tt6LHh8ASBA=
X-Received: by 2002:a65:6e49:0:b0:429:cae6:aac6 with SMTP id
 be9-20020a656e49000000b00429cae6aac6mr41418453pgb.268.1662387012811; Mon, 05
 Sep 2022 07:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220901133505.2510834-1-yi.zhang@huawei.com>
 <20220901133505.2510834-5-yi.zhang@huawei.com>
In-Reply-To: <20220901133505.2510834-5-yi.zhang@huawei.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 5 Sep 2022 16:10:01 +0200
Message-ID: <CAHc6FU4XqSxUr3CS8zxu=Fh_kHytJbzezim0ie_cxdioW5R=FA@mail.gmail.com>
To: Zhang Yi <yi.zhang@huawei.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v2 04/14] gfs2: replace ll_rw_block()
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
Cc: axboe@kernel.dk, almaz.alexandrovich@paragon-software.com,
 ntfs3@lists.linux.dev, jack@suse.cz, chengzhihao1@huawei.com, mark@fasheh.com,
 linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 cluster-devel@redhat.com, viro@zeniv.linux.org.uk, yukuai3@huawei.com,
 linux-fsdevel@vger.kernel.org, tytso@mit.edu, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, dushistov@mail.ru, ocfs2-devel@oss.oracle.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 3:24 PM Zhang Yi <yi.zhang@huawei.com> wrote:
> ll_rw_block() is not safe for the sync read path because it cannot
> guarantee that always submitting read IO if the buffer has been locked,
> so stop using it. We also switch to new bh_readahead() helper for the
> readahead path.
>
> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> ---
>  fs/gfs2/meta_io.c | 7 ++-----
>  fs/gfs2/quota.c   | 8 ++------
>  2 files changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
> index 7e70e0ba5a6c..6ed728aae9a5 100644
> --- a/fs/gfs2/meta_io.c
> +++ b/fs/gfs2/meta_io.c
> @@ -525,8 +525,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl, u64 dblock, u32 extlen)
>
>         if (buffer_uptodate(first_bh))
>                 goto out;
> -       if (!buffer_locked(first_bh))
> -               ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &first_bh);
> +       bh_read_nowait(first_bh, REQ_META | REQ_PRIO);
>
>         dblock++;
>         extlen--;
> @@ -534,9 +533,7 @@ struct buffer_head *gfs2_meta_ra(struct gfs2_glock *gl, u64 dblock, u32 extlen)
>         while (extlen) {
>                 bh = gfs2_getbuf(gl, dblock, CREATE);
>
> -               if (!buffer_uptodate(bh) && !buffer_locked(bh))
> -                       ll_rw_block(REQ_OP_READ | REQ_RAHEAD | REQ_META |
> -                                   REQ_PRIO, 1, &bh);
> +               bh_readahead(bh, REQ_RAHEAD | REQ_META | REQ_PRIO);
>                 brelse(bh);
>                 dblock++;
>                 extlen--;
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index f201eaf59d0d..1ed17226d9ed 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -745,12 +745,8 @@ static int gfs2_write_buf_to_page(struct gfs2_inode *ip, unsigned long index,
>                 }
>                 if (PageUptodate(page))
>                         set_buffer_uptodate(bh);
> -               if (!buffer_uptodate(bh)) {
> -                       ll_rw_block(REQ_OP_READ | REQ_META | REQ_PRIO, 1, &bh);
> -                       wait_on_buffer(bh);
> -                       if (!buffer_uptodate(bh))
> -                               goto unlock_out;
> -               }
> +               if (bh_read(bh, REQ_META | REQ_PRIO) < 0)
> +                       goto unlock_out;
>                 if (gfs2_is_jdata(ip))
>                         gfs2_trans_add_data(ip->i_gl, bh);
>                 else
> --
> 2.31.1
>

Thanks for this fix; looking good.

Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>

Andreas

