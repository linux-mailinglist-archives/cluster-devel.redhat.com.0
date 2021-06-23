Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C4C8E3B227D
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 23:32:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624483940;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3erKq/bjQFrMJKmOnqf/q1uPU6bP7+bp3BiAvXgYvbw=;
	b=aY5wQPtX284Z9gz/03buBv6jxL5RsDHHNQm7R/To0y+LzG1U5HAo7z2zS9Ffp/j8Tihe7x
	7+V7RX727kRjrF74rhGhbZn9MLzECFr8r6DuYeommqzQIZ4JejVTh4QnJ2qmL3XyIzkwyO
	TP9bYpgPnKQMtR8LV36CnXq7SWV7owE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-lg96r-5pO-OM-MdLMmCFHA-1; Wed, 23 Jun 2021 17:32:19 -0400
X-MC-Unique: lg96r-5pO-OM-MdLMmCFHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B7C4804141;
	Wed, 23 Jun 2021 21:32:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B7605D9C6;
	Wed, 23 Jun 2021 21:32:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECA081809C99;
	Wed, 23 Jun 2021 21:32:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NLW4pn032625 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 17:32:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56214202F310; Wed, 23 Jun 2021 21:32:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51951202F30D
	for <cluster-devel@redhat.com>; Wed, 23 Jun 2021 21:32:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7511A800B34
	for <cluster-devel@redhat.com>; Wed, 23 Jun 2021 21:32:00 +0000 (UTC)
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
	[209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-402-iHCbc-KPPPShnHCWJMuVdg-1; Wed, 23 Jun 2021 17:31:58 -0400
X-MC-Unique: iHCbc-KPPPShnHCWJMuVdg-1
Received: by mail-il1-f198.google.com with SMTP id
	p17-20020a92d4910000b02901ee5b5efaecso1393182ilg.10
	for <cluster-devel@redhat.com>; Wed, 23 Jun 2021 14:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3erKq/bjQFrMJKmOnqf/q1uPU6bP7+bp3BiAvXgYvbw=;
	b=l2g1MbWJzJD0MysWRf2plBGkLl0PlB3YY1VqqSmGX6PnTbS4yzE9eAuddmIgWft8jQ
	je0W/r6aCqXgqSJ9Z3YMU1f/Nu2LJGWlwz6ILjCp1GD1ui/bebcCf8AMmtRBzRZWPLFe
	EoLv6SRgNNrkJzrSxfxRezMfG61UBFAWaa2fgvmoPgN2dJug9CbnZCmJUCOB2KSYqF7o
	6qzhLo3W4Orq2hmTfPNJtln17ISHSLB8HOFnBH6M5lcCHrJE2gXF719DCviuSwUi6tDP
	ExHu8FOey/FIcYfHb8vkW1s5i8t/hSSngQC86XV77dMrVSeVJezI46P9WuvNFVbC75pD
	+dAw==
X-Gm-Message-State: AOAM531hBs0PUuYeXw2uLpc/6a7bCZvIHKiaOsMPGJAGqWmBtlfwnBng
	1HIkzbD9mHvVWplsYuJiAEr3ubZMrrzq4R1sfr1kxyUl7F2YcuKtaQRMsl2NgMSRJHlJhiIoYtZ
	n6nXbRLNoTvmld+ur5LnsOfcUITzZCMgCI/XP8Q==
X-Received: by 2002:a05:6e02:c7:: with SMTP id r7mr1098069ilq.76.1624483918427;
	Wed, 23 Jun 2021 14:31:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQCpmLbmJqLnj6fXIfp8EQV8zli712YiQO78a2w5y0+CuAV2AjzC2BlckU5hh2Oogl9tEYj+vgeqxInSpyzYo=
X-Received: by 2002:a05:6e02:c7:: with SMTP id r7mr1098059ilq.76.1624483918249;
	Wed, 23 Jun 2021 14:31:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210623151454.176649-1-aahringo@redhat.com>
In-Reply-To: <20210623151454.176649-1-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 23 Jun 2021 17:31:47 -0400
Message-ID: <CAK-6q+hsym+NixHYxAu_17BWODyFav2ppvGvm0eGWOWhkz20aA@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [RFC dlm/next 00/15] fs: dlm: performance
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Jun 23, 2021 at 11:15 AM Alexander Aring <aahringo@redhat.com> wrote:
...
>
> WARNING:
>
> First time ever we let DLM application layer process parallel dlm messages,
> BUT processing is per node/connection in an ordered way (which is
> required). I tested it and I did saw no problems and think that global/per
> lockspace multiple access per nodeid is correct protected for mutual
> access.
>

okay. David Teigland showed me that DLM isn't ready for this step. See
functions e.g. "setup_stub_lkb()"..., I am not sure why I never ran
into some problems...
I will split some patches from this series and try to find/solve all
cases in DLM as next step.

- Alex

