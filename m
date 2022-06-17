Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4619154FFE3
	for <lists+cluster-devel@lfdr.de>; Sat, 18 Jun 2022 00:28:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655504936;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TAa/TIXmNx/H4/I9TIAgAW3g3SdWRCx/1iU7tnjwUYg=;
	b=MwZsa+kc9HDwtHw9AKgitVsIa6D8n0dzG6K7xEiADU/xDCJaTDTqPjZzVps8z3IpLcj3gp
	RkYI/iwlo3xQhL3NQY7gmVJhXgJScMRBob58hy9/vDICO0hIt2DpXVuQL9yAlLCZHSxt3M
	M3vK3lpxvmc8Vw5lnd3NBfY3fmYL2pU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-lSWoau8RM3KHWAf9HNgbQg-1; Fri, 17 Jun 2022 18:28:53 -0400
X-MC-Unique: lSWoau8RM3KHWAf9HNgbQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FA9729AB42F;
	Fri, 17 Jun 2022 22:28:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23C7E2026D2D;
	Fri, 17 Jun 2022 22:28:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BE1C11947069;
	Fri, 17 Jun 2022 22:28:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 99A94194705F for <cluster-devel@listman.corp.redhat.com>;
 Fri, 17 Jun 2022 22:28:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 879191415109; Fri, 17 Jun 2022 22:28:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8419D1415108
 for <cluster-devel@redhat.com>; Fri, 17 Jun 2022 22:28:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BAEA3804502
 for <cluster-devel@redhat.com>; Fri, 17 Jun 2022 22:28:47 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611--geMGJw5PCKHjdH5qRDQBw-1; Fri, 17 Jun 2022 18:28:46 -0400
X-MC-Unique: -geMGJw5PCKHjdH5qRDQBw-1
Received: by mail-qv1-f71.google.com with SMTP id
 s11-20020a0562140cab00b0046e7d2b24b3so5524782qvs.16
 for <cluster-devel@redhat.com>; Fri, 17 Jun 2022 15:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TAa/TIXmNx/H4/I9TIAgAW3g3SdWRCx/1iU7tnjwUYg=;
 b=jz+lA21Knq7tT5hXSEpaIsKjwPaZQj9fZt85BffUud1gV5PUMlHqnTLK2rorhpUDtY
 XWaTcpBuTVCfw8ddsETUVcv9aO7OhLIUjjSvSIlM1syEJ4KtO5MMWhuXpkuQL1ubErs5
 eJJDrfWPLPH4er8Xzbay9XiWgbP1lIfH0bC4p6BccqVyyBmexx5xH9/C3JiVjyQ6ZZ+7
 G5YZV/AS7VXzvRF7j9pi0M96PGT/mIuWT3qYHJ+Tw/4x8LXjzczZfKq1EBXPLI75owZL
 r3pKUL3qekrU2HCg5NYYh+CyLkIubd+5DCV6e7C+RxeV6Nhe0G7okub+sTLL/vjGknRe
 t31w==
X-Gm-Message-State: AJIora+edxCkr3s8YrMIM7ooNdpj6CItsQL4l5dxX9hV6oB1WOX/p6ql
 cGAMF5xdvp1TousftrdDgm+3m01KUMLni1i5dodqDdnQ6ODrN1FbhhnHCxYmJYQCFGc2e5rUOCL
 qttNZdJQm6fV+vyA+LfHPXmKPmW6HLbuILBZAYw==
X-Received: by 2002:a05:620a:4729:b0:6a7:5841:82db with SMTP id
 bs41-20020a05620a472900b006a7584182dbmr8912676qkb.177.1655504925786; 
 Fri, 17 Jun 2022 15:28:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s0CW73x2cQDwB7n3hZ9OE9Yxk/y0ClTLa9p7/DrVhi5iRGQkuxznYIB9XTrtXWtfxzIo58rRjz8d6Dw+VTUHE=
X-Received: by 2002:a05:620a:4729:b0:6a7:5841:82db with SMTP id
 bs41-20020a05620a472900b006a7584182dbmr8912667qkb.177.1655504925589; Fri, 17
 Jun 2022 15:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220617200036.251778-1-aahringo@redhat.com>
 <20220617200036.251778-2-aahringo@redhat.com>
In-Reply-To: <20220617200036.251778-2-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 17 Jun 2022 18:28:34 -0400
Message-ID: <CAK-6q+gFKxPMUr-A5rVJ1GpM09jTtiWYUMP7+ZbP0w=0-EkrHg@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH dlm/next 1/5] fs: dlm: add comment about
 lkb IFL flags
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
Cc: cluster-devel <cluster-devel@redhat.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Fri, Jun 17, 2022 at 4:00 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch adds comments about the difference between the lower 2 bytes
> of lkb flags and the 2 upper bytes of the lkb IFL flags. In short the
> upper 2 bytes will be handled as internal flags whereas the lower 2
> bytes are part of the DLM protocol and are used to exchange messages.
>
> Signed-off-by: Alexander Aring <aahringo@redhat.com>
> ---
>  fs/dlm/dlm_internal.h | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
> index c03388a3875c..151f98fc3f22 100644
> --- a/fs/dlm/dlm_internal.h
> +++ b/fs/dlm/dlm_internal.h
> @@ -207,6 +207,13 @@ struct dlm_args {
>  #define DLM_IFL_TIMEOUT_CANCEL 0x00800000
>  #define DLM_IFL_DEADLOCK_CANCEL        0x01000000
>  #define DLM_IFL_STUB_MS                0x02000000 /* magic number for m_flags */
> +/* least significant 2 bytes are message changed, they are full transmitted
> + * but at receive side only the 2 bytes LSB will be set.
> + *
> + * Even wireshark dlm dissector does only evaluate the lower bytes and note
> + * that they may not be used on transceiver side, we assume the higher bytes
> + * are for internal use or reserved so long they are parsed on receiver side.

not parsed*

- Alex

