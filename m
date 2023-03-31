Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 236646D403D
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Apr 2023 11:23:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680513792;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/GcLV93lKWccb0UkfmjqOyuowcihEvlzwtkH6TySgoM=;
	b=HBcxR6JKcR1uqIX1h1uJcpMeOWTrt9TN8zdNnWXPUmZJbaBQR3ebawXwWQP/LD3QOZcrwI
	MpDL0+2StJMOuOYRJqAc3D9i+rJea6SwaqXLPd3RXpT/2GoVODglrggmfauEF9aS6CUZpE
	Il9zXpKJavAcI860QxLn4DdpGd/wh78=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-bUmMbpY9NEeMXLrJpG4Bwg-1; Mon, 03 Apr 2023 05:22:47 -0400
X-MC-Unique: bUmMbpY9NEeMXLrJpG4Bwg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CBB785A588;
	Mon,  3 Apr 2023 09:22:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4C60492C13;
	Mon,  3 Apr 2023 09:22:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7E9CD1946589;
	Mon,  3 Apr 2023 09:22:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 97FB819465BC for <cluster-devel@listman.corp.redhat.com>;
 Fri, 31 Mar 2023 17:54:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8BD742166B36; Fri, 31 Mar 2023 17:54:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CC252166B33
 for <cluster-devel@redhat.com>; Fri, 31 Mar 2023 17:54:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E6832A59544
 for <cluster-devel@redhat.com>; Fri, 31 Mar 2023 17:54:23 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-9WIrWJ4LNb6xVBWXxccjSg-1; Fri, 31 Mar 2023 13:54:19 -0400
X-MC-Unique: 9WIrWJ4LNb6xVBWXxccjSg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5C2EE62AFF;
 Fri, 31 Mar 2023 17:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39958C433A4;
 Fri, 31 Mar 2023 17:54:17 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id q16so29915972lfe.10;
 Fri, 31 Mar 2023 10:54:17 -0700 (PDT)
X-Gm-Message-State: AAQBX9feKGwqLMu5OwUCieZyfbTW2NC0CzoVCjagYbu1LLwClNULJ6zM
 tsbiQC/Rx0l9d08xmnpJRIaAenEMSeIGWad9yd4=
X-Google-Smtp-Source: AKy350YvKqb0dBoMYfGdDtedXvU05FWt6KdyndNuIJije8MdSUJrkHi6AamvXBmeJg5t6pczjm2RarPTQzd6MOIJepA=
X-Received: by 2002:ac2:5610:0:b0:4dd:a4e1:4861 with SMTP id
 v16-20020ac25610000000b004dda4e14861mr8234430lfd.3.1680285255256; Fri, 31 Mar
 2023 10:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680172791.git.johannes.thumshirn@wdc.com>
 <07ae41b981f1b5f8de80a3f0a8ab2f34034077a6.1680172791.git.johannes.thumshirn@wdc.com>
In-Reply-To: <07ae41b981f1b5f8de80a3f0a8ab2f34034077a6.1680172791.git.johannes.thumshirn@wdc.com>
From: Song Liu <song@kernel.org>
Date: Fri, 31 Mar 2023 10:54:03 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4gxjRx-X6d46O7SsNb=nesrUKVv+s76C1DtkZdcGmyXw@mail.gmail.com>
Message-ID: <CAPhsuW4gxjRx-X6d46O7SsNb=nesrUKVv+s76C1DtkZdcGmyXw@mail.gmail.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Mon, 03 Apr 2023 09:22:43 +0000
Subject: Re: [Cluster-devel] [PATCH v2 15/19] md: check for failure when
 adding pages in alloc_behind_master_bio
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Dave Kleikamp <shaggy@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 David Sterba <dsterba@suse.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 3:44=E2=80=AFAM Johannes Thumshirn
<johannes.thumshirn@wdc.com> wrote:
>
> alloc_behind_master_bio() can possibly add multiple pages to a bio, but i=
t
> is not checking for the return value of bio_add_page() if adding really
> succeeded.
>
> Check if the page adding succeeded and if not bail out.
>
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> ---
>  drivers/md/raid1.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
> index 68a9e2d9985b..bd7c339a84a1 100644
> --- a/drivers/md/raid1.c
> +++ b/drivers/md/raid1.c
> @@ -1147,7 +1147,8 @@ static void alloc_behind_master_bio(struct r1bio *r=
1_bio,
>                 if (unlikely(!page))
>                         goto free_pages;
>
> -               bio_add_page(behind_bio, page, len, 0);
> +               if (!bio_add_page(behind_bio, page, len, 0))
> +                       goto free_pages;

We will leak page here, no?

Thanks,
Song

