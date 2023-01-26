Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A358667D2FD
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Jan 2023 18:25:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674753907;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qHlmTunQ49C1Dpyk77Z4C3k4Cau4j+Xb//Hx9WL7A8k=;
	b=GJAkxTe1c1oFgB9t0FFpmqSciJEfj8jHJ0643htlBFauoWhB/+k9jL1LnXHykqmu+fsi+w
	oDhPTHR9MM5iJxdwojJalVBI+jc47cbYum/+NlExIbQw8+wKB8Y5lm4pzZz/eSSrwxRWMA
	AxxlFsjjyZAIqZ/eSQlOzYkk1hVfGvg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-tDWQRKy-OgmMFemr9bM7EQ-1; Thu, 26 Jan 2023 12:25:02 -0500
X-MC-Unique: tDWQRKy-OgmMFemr9bM7EQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ECC01C05B05;
	Thu, 26 Jan 2023 17:25:01 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B0812166B26;
	Thu, 26 Jan 2023 17:24:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 61E0C1946595;
	Thu, 26 Jan 2023 17:24:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 79EA2194658C for <cluster-devel@listman.corp.redhat.com>;
 Thu, 26 Jan 2023 17:24:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 603E540C200E; Thu, 26 Jan 2023 17:24:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 57BD740C200C
 for <cluster-devel@redhat.com>; Thu, 26 Jan 2023 17:24:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D206183B3CF
 for <cluster-devel@redhat.com>; Thu, 26 Jan 2023 17:24:48 +0000 (UTC)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-340-dMF33yLuOgu4r0pMhVHdxw-1; Thu, 26 Jan 2023 12:24:46 -0500
X-MC-Unique: dMF33yLuOgu4r0pMhVHdxw-1
Received: by mail-vs1-f42.google.com with SMTP id k6so2669903vsk.1
 for <cluster-devel@redhat.com>; Thu, 26 Jan 2023 09:24:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qHlmTunQ49C1Dpyk77Z4C3k4Cau4j+Xb//Hx9WL7A8k=;
 b=o1XEILNxe3WaO7Bp0VOakRAEBnsVB0H7muKqSlA+6siL5raRKNZyzGBADWOlvgMxnJ
 BkZxgP5/SlM/jktrJQe4SnHes3G/F6hUgOJwI1E4IeH6DGn5LDLFaiAHor9Wa0vEBk2V
 JxpprO4ljjmkQjSxIUO4nzOlxJElzgt5q6IOEWY/5dhdJJfDcCLKgP9F1rr5H/GrTG6P
 qiE9K9suA9PGFAKR/uzKGrB+QM4GbQZBBgS6PIOsKc8g8RLPDPVAnpICe/5lxUGmth5a
 m42La6ID5LU73pVjZ5vwnUhzbsCTr15eqy9m+wPowXo7nmim7SyO+fyzMKm0kzIS+y2e
 4IKQ==
X-Gm-Message-State: AFqh2koDSfkXCmzBTRbzRt9y3mpKK3B6DGY8ZEiTZW9iwvIBofG+0VJM
 d8keQCo4xz/EL6rdb0nsoSR+rSlR8Ra5nnQRthA=
X-Google-Smtp-Source: AMrXdXstMx4Lc6leAXpj1VV45UXIVItPQZcy2o9t6/kD/JJrrhSQhYl4SzeJqctMxVoXgA7/dxFlIFpz/owb7AnAd4Y=
X-Received: by 2002:a05:6102:6c2:b0:3ce:bced:178 with SMTP id
 m2-20020a05610206c200b003cebced0178mr4927618vsg.84.1674753885888; Thu, 26 Jan
 2023 09:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20230121065755.1140136-1-hch@lst.de>
 <20230121065755.1140136-8-hch@lst.de>
In-Reply-To: <20230121065755.1140136-8-hch@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 27 Jan 2023 02:24:29 +0900
Message-ID: <CAKFNMonfM+=1vbqKgS3feW7Xyh=P6UdDu0RrnOYQrb+WhN+_Vw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH 7/7] mm: return an ERR_PTR from
 __filemap_get_folio
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 21, 2023 at 3:59 PM Christoph Hellwig wrote:
>
> Instead of returning NULL for all errors, distinguish between:
>
>  - no entry found and not asked to allocated (-ENOENT)
>  - failed to allocate memory (-ENOMEM)
>  - would block (-EAGAIN)
>
> so that callers don't have to guess the error based on the passed
> in flags.
>
> Also pass through the error through the direct callers:
> filemap_get_folio, filemap_lock_folio filemap_grab_folio
> and filemap_get_incore_folio.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---

For

>  fs/nilfs2/page.c         |  6 +++---

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi

