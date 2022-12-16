Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EE864F02E
	for <lists+cluster-devel@lfdr.de>; Fri, 16 Dec 2022 18:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671210965;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=FMxxbypNViBdI4yIgrSC4IXd1P5dO6tqxf8uJ4BBzw8=;
	b=M7SwlMb4hEaTxHDd44+sZzyHRbr/F1V4U/5UlXfRTPuLp+A4zll5ULb+EN6Sks3qwV/6WX
	d/jEwSAKP8jk3UJ2uXhJtIzIpihfnTkuqpvXBd6VE/EW5/gnvpH9wA25DwWy3hNRJWpTsi
	/akx9zfCVRJaxBfy8xO9qYxeTAtjzUc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-2u1WNU9oMoqwPVz8hjQK1A-1; Fri, 16 Dec 2022 12:16:00 -0500
X-MC-Unique: 2u1WNU9oMoqwPVz8hjQK1A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B95AA2802BAF;
	Fri, 16 Dec 2022 17:15:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5465F51EF;
	Fri, 16 Dec 2022 17:15:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 274D51946A6B;
	Fri, 16 Dec 2022 17:15:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ADBA71946594 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 16 Dec 2022 17:15:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9812949BB6A; Fri, 16 Dec 2022 17:15:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 90981400F58
 for <cluster-devel@redhat.com>; Fri, 16 Dec 2022 17:15:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 710B11875043
 for <cluster-devel@redhat.com>; Fri, 16 Dec 2022 17:15:57 +0000 (UTC)
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-116-Vk82T9WvP0CJRODh3vpXpQ-1; Fri, 16 Dec 2022 12:15:56 -0500
X-MC-Unique: Vk82T9WvP0CJRODh3vpXpQ-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-434eb7c6fa5so36107867b3.14
 for <cluster-devel@redhat.com>; Fri, 16 Dec 2022 09:15:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FMxxbypNViBdI4yIgrSC4IXd1P5dO6tqxf8uJ4BBzw8=;
 b=lGDUwYchvwuYFnpeNjIpCuDiPJ2wNRRWlpzzOobQPB2ynPWqOewS00gSHZ7oQdmgLd
 2pSMTwPBlxzbUVwg6Sp6R5uimZAsqWzWez66t91KyRMQ3R+xczQDo/4pdqThuGiTkw3j
 8ddBzMcC+sWq7k6zzSY5lRfoNsNIrBW5w+Lv0okhOcR3ZYI4bukGZsbqNnuOwdvGA8Nh
 EAAlJzO4sI6hhuvH3DsAUxkMc6t3qArgxqG7UCqBRkTaCq2wSaRTDXwmF7IsKSR/W9l+
 5j452Clbk3ZTDO84W0oeGXhmCrN/jVehkrsWvKWSyl+z63anAuiaL/d3e9SNMLXjiNd1
 YLwQ==
X-Gm-Message-State: ANoB5pnOQB/kUsavpTxMUp7KgtCTTQWAE/7k7elxQTPoAjwLptOcEyu1
 14johNfYzORBrGch+PzwHORpFiim104meZZtkENtjxEVyGcuHXzXy3ssEJ3exiFePcE22v7TZoh
 AZntxsaBqZGdBAG5Ow9Dx8SX3VniNX7zgb8kR0Q==
X-Received: by 2002:a81:8407:0:b0:3e2:c77b:2563 with SMTP id
 u7-20020a818407000000b003e2c77b2563mr27749514ywf.54.1671210955579; 
 Fri, 16 Dec 2022 09:15:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5sSx3su6laK9Kl+Wo+aUvlhEYchIP7sOq3J3e9vBxi/aJmFLAxjsr1EmGJ4JGxvgXw8z2oIHThFHswEOSM94k=
X-Received: by 2002:a81:8407:0:b0:3e2:c77b:2563 with SMTP id
 u7-20020a818407000000b003e2c77b2563mr27749506ywf.54.1671210955331; Fri, 16
 Dec 2022 09:15:55 -0800 (PST)
MIME-Version: 1.0
References: <20221216150626.670312-1-agruenba@redhat.com>
 <20221216150626.670312-6-agruenba@redhat.com>
 <Y5ydHlw4orl/gP3a@casper.infradead.org>
In-Reply-To: <Y5ydHlw4orl/gP3a@casper.infradead.org>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 16 Dec 2022 18:15:44 +0100
Message-ID: <CAHc6FU7Svp7XG8T5X4kak8Gz2kB2_OK1b5xbtn6uKrEnb6=3TQ@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [RFC v3 5/7] iomap: Get page in page_prepare
 handler
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
Cc: linux-xfs@vger.kernel.org, cluster-devel@redhat.com,
 "Darrick J . Wong" <djwong@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 16, 2022 at 5:30 PM Matthew Wilcox <willy@infradead.org> wrote:
> On Fri, Dec 16, 2022 at 04:06:24PM +0100, Andreas Gruenbacher wrote:
> > +     if (page_ops && page_ops->page_prepare)
> > +             folio = page_ops->page_prepare(iter, pos, len);
> > +     else
> > +             folio = iomap_folio_prepare(iter, pos);
> > +     if (IS_ERR_OR_NULL(folio)) {
> > +             if (!folio)
> > +                     return (iter->flags & IOMAP_NOWAIT) ? -EAGAIN : -ENOMEM;
> > +             return PTR_ERR(folio);
>
> Wouldn't it be cleaner if iomap_folio_prepare() always
> returned an ERR_PTR on failure?

Yes indeed, thanks.

Andreas

