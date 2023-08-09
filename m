Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A98F8775EC1
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Aug 2023 14:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691583617;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EGDACJ323mfQIZsMZ2Ke8sUWJ9wnhXr4EN5l4dg/43Q=;
	b=dOmU5OgjMpc6A9GiZy66dXdYFH+j/QP3NvwiPG/IisV0qEU77a1JssOC931oYaAzRoQ1uI
	wd24tXcPk3VlJkod672bLMQW7JoAZDrmncU1S9cJKFUFs47G64n/LzU7ckTrIZcCISBB1d
	a5kKs56uTPyiiM18meU71/K04TbWX+8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-686-tv242pmtOKifIh5earEQNw-1; Wed, 09 Aug 2023 08:20:15 -0400
X-MC-Unique: tv242pmtOKifIh5earEQNw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53E5C185A792;
	Wed,  9 Aug 2023 12:20:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 164EE401E63;
	Wed,  9 Aug 2023 12:20:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 05A8A1946594;
	Wed,  9 Aug 2023 12:19:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9ED211946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  9 Aug 2023 12:14:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 81738492B10; Wed,  9 Aug 2023 12:14:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 799B6492B0F
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 12:14:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54A37185A792
 for <cluster-devel@redhat.com>; Wed,  9 Aug 2023 12:14:06 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-42-hUNma77wOW2rN07tak4W0w-1; Wed, 09 Aug 2023 08:14:04 -0400
X-MC-Unique: hUNma77wOW2rN07tak4W0w-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1b88decb2a9so7858995ad.0
 for <cluster-devel@redhat.com>; Wed, 09 Aug 2023 05:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691583243; x=1692188043;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EGDACJ323mfQIZsMZ2Ke8sUWJ9wnhXr4EN5l4dg/43Q=;
 b=Ugk6426pscRLpwwM6vftP/IHN9p8e7ty6UVVy6t4V4tDN2Skj9Pcie8UD/C02RjyxS
 2Ea76sNYQ1sWuPnipahCEZ3/XtaJDaZ6kRa0mpNs2ohE44vpCRiZ3lj0TEyAcAU0jJuq
 qtY1Khiir0drA2/JS9mv0oZ64f55G+IT6Y5iZJbqME8Mvxj42Pk2Au+9dMn+4RexIL9q
 n5ioArEq40r0tnguPfnI93K6sQOVrSjRK1yjBlKFoM7iEn0GnqqCM5NW32wkxLf8j1CK
 ouvIeb724g8RnsC14kHh9fT//f9UiG09bkaItAEe33MGiz7I/jhKe2+1PLTWUs8QRhpQ
 DtrQ==
X-Gm-Message-State: AOJu0Yw10iOMWbRzSY9/3vxxovLdTAOstmFcOkDXoyzO7mKcDXc3vlT6
 HjJQ4EKBpXwrl1WspY3/Tm0enmSouJujaxzVpN6OUrMAoohBmlHAw1IJ3uXZJ0WX81X4kREWI3q
 toSeG7CT+80oX6FhvLCIRULJV25zEhpLjaWui8g==
X-Received: by 2002:a17:902:db04:b0:1bc:4415:3c1 with SMTP id
 m4-20020a170902db0400b001bc441503c1mr17542857plx.7.1691583243553; 
 Wed, 09 Aug 2023 05:14:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUOEEP2+f02N3YEvgMs9V7N1tWI1ryp88CEJvkEwA52RxaoAwIdcQuRxuqFXnS/La45vOUdxTn6Wctp8TQDPM=
X-Received: by 2002:a17:902:db04:b0:1bc:4415:3c1 with SMTP id
 m4-20020a170902db0400b001bc441503c1mr17542832plx.7.1691583243299; Wed, 09 Aug
 2023 05:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230726170108.389793-1-rpeterso@redhat.com>
In-Reply-To: <20230726170108.389793-1-rpeterso@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 9 Aug 2023 14:13:51 +0200
Message-ID: <CAHc6FU4B+r7=ptmCyAr9Kdw4yWZyUqsHAEq+-RjL1D+aCW8n5w@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH] gfs2: conversion deadlock do_promote
 bypass
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bob,

On Wed, Jul 26, 2023 at 8:36=E2=80=AFPM Bob Peterson <rpeterso@redhat.com> =
wrote:
> I know the description is vague or hard to grasp, but it's hard to be
> succinct for this problem.

as discussed off-list, this one needed a bit more work. I've just
posted the updated version.

Thanks,
Andreas

