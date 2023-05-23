Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B91470DCDE
	for <lists+cluster-devel@lfdr.de>; Tue, 23 May 2023 14:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684845991;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V7u/znGyiabjVxMxzRvNLd3S88rx1+Ha0iKEs973f0I=;
	b=h8AousS3yBLkQb1JiBs9rF7y57FaHMmne9+5BmglnrIn/UqZ01bQsZ1GFrWUNEOpUWzAc7
	9G23b4gQnoGlVdQYzAlWSmARBXDKTk4dZaM2vAs4IVWHF6VoejNUBCLXFVI6zHw6H7AEtX
	9obtICGkaqqtQdHGCq7ZGfbcZ+opiP4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-Si-ZInlXM9edkNrI716ReA-1; Tue, 23 May 2023 08:46:28 -0400
X-MC-Unique: Si-ZInlXM9edkNrI716ReA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DEBA8030D4;
	Tue, 23 May 2023 12:46:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B9A4F40C6CD9;
	Tue, 23 May 2023 12:46:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6466C19465B3;
	Tue, 23 May 2023 12:46:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7227919465A0 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 May 2023 12:46:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 64A88492B0B; Tue, 23 May 2023 12:46:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D922492B0A
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 12:46:23 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B950101A53A
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 12:46:23 +0000 (UTC)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-R3aUIF0ROBCQNKycDKTy-A-1; Tue, 23 May 2023 08:46:22 -0400
X-MC-Unique: R3aUIF0ROBCQNKycDKTy-A-1
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-1ae4ea998d0so71016195ad.0
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 05:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684845980; x=1687437980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V7u/znGyiabjVxMxzRvNLd3S88rx1+Ha0iKEs973f0I=;
 b=ZyjU5mhwUKeWX4JcH7JL29tRSKcmfMBsVhXDzf1cGH44dnvx8RT3gKcqp1bHsNJhYO
 kDkoz13j4i7+jolOaFg5t0BafPo5F5UxVoQi8wA1tw3hNUFvshMmJxwlmivC8J80qra3
 JMQmkxGVlIHS1eErUBh4Y8Z07FTZ6blqaGnS5HLFK+Yb0qYRn4YrIOLrUY6FFUbz352u
 ZvTpdt2T7abBqaRH4Uauuh3NqgVqkUfvAO8mz9xW1qp64KHM6jGs0rV1huLrI2uUrdnl
 1JNx0TItOGkVvRvaDovZ5Q+BTXtL9/Sf4R7nurInl62OU2Ovtpg3E7CAJXrC5eeHczQR
 KLpw==
X-Gm-Message-State: AC+VfDw5GfgYRMKNWai/Ad622Eb87dyXO+jC/qwcSBrrlK4NlSaW1vmM
 dRf1SVDmDJq4H5V9EdFUsHmwue1CxHWNDgz0PewTgibU/OikfvLYDo8Wuf68ATjJHFnuWSRJLMJ
 vRTDfWjkCX1N9m3lCq7xRQJsH60vJD83JB4NA+z3Acdm3kAAZ
X-Received: by 2002:a17:902:d50f:b0:19f:188c:3e34 with SMTP id
 b15-20020a170902d50f00b0019f188c3e34mr18581661plg.53.1684845979765; 
 Tue, 23 May 2023 05:46:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7N6fKanmEa3wCjNdE4efUSeOJJfpKV6/MLDN/+XR06nDpu5lEwxuKA4KfSw+kLUXDSGFJTJAT0kooBFqNhnNg=
X-Received: by 2002:a17:902:d50f:b0:19f:188c:3e34 with SMTP id
 b15-20020a170902d50f00b0019f188c3e34mr18581630plg.53.1684845979448; Tue, 23
 May 2023 05:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230517032442.1135379-1-willy@infradead.org>
 <20230517032442.1135379-6-willy@infradead.org>
In-Reply-To: <20230517032442.1135379-6-willy@infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 23 May 2023 14:46:07 +0200
Message-ID: <CAHc6FU6GowpTfX-MgRiqqwZZJ0r-85C9exc2pNkBkySCGUT0FA@mail.gmail.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 5/6] gfs2: Support ludicrously large
 folios in gfs2_trans_add_databufs()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 17, 2023 at 5:24=E2=80=AFAM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
> We may someday support folios larger than 4GB, so use a size_t for
> the byte count within a folio to prevent unpleasant truncations.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  fs/gfs2/aops.c | 2 +-
>  fs/gfs2/aops.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
> index e97462a5302e..8da4397aafc6 100644
> --- a/fs/gfs2/aops.c
> +++ b/fs/gfs2/aops.c
> @@ -38,7 +38,7 @@
>
>
>  void gfs2_trans_add_databufs(struct gfs2_inode *ip, struct folio *folio,
> -                            unsigned int from, unsigned int len)
> +                            size_t from, size_t len)
>  {
>         struct buffer_head *head =3D folio_buffers(folio);
>         unsigned int bsize =3D head->b_size;

This only makes sense if the to, start, and end variables in
gfs2_trans_add_databufs() are changed from unsigned int to size_t as
well.

> diff --git a/fs/gfs2/aops.h b/fs/gfs2/aops.h
> index 09db1914425e..f08322ef41cf 100644
> --- a/fs/gfs2/aops.h
> +++ b/fs/gfs2/aops.h
> @@ -10,6 +10,6 @@
>
>  extern void adjust_fs_space(struct inode *inode);
>  extern void gfs2_trans_add_databufs(struct gfs2_inode *ip, struct folio =
*folio,
> -                                   unsigned int from, unsigned int len);
> +                                   size_t from, size_t len);
>
>  #endif /* __AOPS_DOT_H__ */
> --
> 2.39.2
>

Thanks,
Andreas

