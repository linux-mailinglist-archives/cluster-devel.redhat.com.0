Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD5D7168C9
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 18:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685463025;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Irk/8GUWmwLYWfm2Lio5fOal+y0GOgImfVphQa7iGfs=;
	b=ITTPsp6HwYcouDfKsSSZo2EwcVZ2pF7LnplRA7HYNhO1PFUbgwemhhiKYpmqwUGYJECFeh
	IrNYrqFyxyFnyxkJ+1MfNHJ+kLgKc8lq6pVNXWpTJRNhbcFjYwVHSY7RmuMtamKt0NqD54
	m/4+65OnzSYxANQxeNAcMv+npEiaF3M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-9qgN1wtcOgysDJGUJDv1Xg-1; Tue, 30 May 2023 12:10:22 -0400
X-MC-Unique: 9qgN1wtcOgysDJGUJDv1Xg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91D8E3802607;
	Tue, 30 May 2023 16:10:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 364EA40C6EC4;
	Tue, 30 May 2023 16:10:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E958019465A8;
	Tue, 30 May 2023 16:10:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 06F711946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 16:10:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E68E1C154D1; Tue, 30 May 2023 16:10:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE1E5C15612
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 16:10:19 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C14812A5957F
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 16:10:19 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-nrBqg4weP1C2uiqc8PuybA-1; Tue, 30 May 2023 12:10:17 -0400
X-MC-Unique: nrBqg4weP1C2uiqc8PuybA-1
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6261367d2f1so15133576d6.3
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 09:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685463017; x=1688055017;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Irk/8GUWmwLYWfm2Lio5fOal+y0GOgImfVphQa7iGfs=;
 b=So7IBu0noojj4WShjgsdcfZ9mbHPkf8kSaIyXrn1hI4uFOPKwkUIMQIKi953FUfpxH
 fnICc9JrTnj+Dfg58+pkjpeGKAPdb6fJvdi3CPifok9y4kiGY5o+Ezc61xxCQmHMu28f
 T75gXyEwaSNX/opDZJXq4uh+MKmyZ1w0cLkHG55sQF4IJNnvkA7vEGSO3kQyttk5iX/Z
 FdaeuKjtnBn68iDoTk2nf6rz6y/JX+m1T0jWq0OI7iGM/UhtyoD/8kpj2ukYMH44ZopB
 QmztGJ/l8IMwhhgcJHGWBs6GCbql2BeiWPekhZtoKgL6COPrkCQzFhzdU5CTBXbvczs9
 YDeg==
X-Gm-Message-State: AC+VfDwlfGZwRb9eXBKDIx37GOmNj15Ti2PMjBo5OPg5RO92juu+XyOu
 j/OX6gNbGnk/JtPtOhpkc/Xy+TQ=
X-Google-Smtp-Source: ACHHUZ56MECtsjcewLbFVxD7Rkez1npKixqOW82Zsid/kEpDsAmjiM2JZkfOYT0pMaVRxjwqyQggQQ==
X-Received: by 2002:ad4:5b8d:0:b0:625:af4b:4162 with SMTP id
 13-20020ad45b8d000000b00625af4b4162mr2721624qvp.14.1685463016980; 
 Tue, 30 May 2023 09:10:16 -0700 (PDT)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net.
 [68.160.166.30]) by smtp.gmail.com with ESMTPSA id
 w20-20020a0562140b3400b0062381fa97c5sm898935qvj.92.2023.05.30.09.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 09:10:16 -0700 (PDT)
Date: Tue, 30 May 2023 12:10:15 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Message-ID: <ZHYf5+ocDL0hsud6@redhat.com>
References: <cover.1685461490.git.johannes.thumshirn@wdc.com>
 <e1c7ed59e2d2b69567ef2d9925fa997ecb7b4822.1685461490.git.johannes.thumshirn@wdc.com>
MIME-Version: 1.0
In-Reply-To: <e1c7ed59e2d2b69567ef2d9925fa997ecb7b4822.1685461490.git.johannes.thumshirn@wdc.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v6 16/20] dm-crypt: check if adding
 pages to clone bio fails
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
Cc: Jens Axboe <axboe@kernel.dk>, Dave Kleikamp <shaggy@kernel.org>,
 jfs-discussion@lists.sourceforge.net, Chaitanya Kulkarni <kch@nvidia.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, linux-block@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, Matthew Wilcox <willy@infradead.org>,
 Ming Lei <ming.lei@redhat.com>, cluster-devel@redhat.com,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 Mikulas Patocka <mpatocka@redhat.com>, linux-raid@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, gouhao@uniontech.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 30 2023 at 11:49P -0400,
Johannes Thumshirn <johannes.thumshirn@wdc.com> wrote:

> Check if adding pages to clone bio fails and if it does retry with
> reclaim. This mirrors the behaviour of page allocation in
> crypt_alloc_buffer().

Nope.

> This way we can mark bio_add_pages as __must_check.
> 
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

The above patch header doesn't reflect the code.

I also think __bio_add_page should be used, like my racey reply to
Mikulas vs your v6 patchbomb said, please see:
https://listman.redhat.com/archives/dm-devel/2023-May/054388.html

Thanks,
Mike

> ---
>  drivers/md/dm-crypt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 8b47b913ee83..0dd231e61757 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -1693,7 +1693,10 @@ static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned int size)
>  
>  		len = (remaining_size > PAGE_SIZE) ? PAGE_SIZE : remaining_size;
>  
> -		bio_add_page(clone, page, len, 0);
> +		if (!bio_add_page(clone, page, len, 0)) {
> +			WARN_ONCE(1, "Adding page to bio failed\n");
> +			return NULL;
> +		}
>  
>  		remaining_size -= len;
>  	}
> -- 
> 2.40.1
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://listman.redhat.com/mailman/listinfo/dm-devel
> 

