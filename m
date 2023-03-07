Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0D86AE4AA
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Mar 2023 16:28:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678202917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=49sjefw2FKulo5Vz5tQGPSxZQZKzbcJ05HQTQwuGmNA=;
	b=UNeUbQSpBlSaMO5fSSJMEc/02ExSOGXTrbqVtpU19nnIq4+U1Eh4pToQf0PjDYuuW3RSHM
	AtHaKO9wPD6lGcwK942ARP72+znzYPIUGAMl1J2b7Jyg2cIMDiMavIlDeJ0RsULQurWzdb
	/wremE1IR6UUs/iQFgrG9r+HE0gTJ3Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-n3oZK9_vPZS_QeHMaicVvg-1; Tue, 07 Mar 2023 10:28:04 -0500
X-MC-Unique: n3oZK9_vPZS_QeHMaicVvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F3148BDE58;
	Tue,  7 Mar 2023 15:25:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EDB440CF8EE;
	Tue,  7 Mar 2023 15:25:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8512919465B2;
	Tue,  7 Mar 2023 15:25:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 510EB19465A4 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  7 Mar 2023 15:25:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 34CFF35454; Tue,  7 Mar 2023 15:25:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DE2A18EC6
 for <cluster-devel@redhat.com>; Tue,  7 Mar 2023 15:25:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7C908A2D3B
 for <cluster-devel@redhat.com>; Tue,  7 Mar 2023 15:24:25 +0000 (UTC)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-PnD1YY86MymnP_xA8ihR0g-1; Tue, 07 Mar 2023 10:24:12 -0500
X-MC-Unique: PnD1YY86MymnP_xA8ihR0g-1
Received: by mail-pf1-f198.google.com with SMTP id
 a23-20020a62bd17000000b0058db55a8d7aso7464368pff.21
 for <cluster-devel@redhat.com>; Tue, 07 Mar 2023 07:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678202643;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=49sjefw2FKulo5Vz5tQGPSxZQZKzbcJ05HQTQwuGmNA=;
 b=Rz+DGCRI/3c4r4jMqzeh85r9Grrf60Wn2oL2Q4arFsUSrqzUtjlSVC4Nyd4pUH49jO
 SvGyIDuZd5Bcfnm/RAvrVYElY+w3GuXdReV6KnFxd2s9Bfi7aIdvKqvAl82KS1joTBGK
 fYjjr9zA0rD/Fc5R2uiy0+izuu2NOZQDi1FxML2PFEgzTBtOYFboMsrIbi1Vd1i2tFLj
 0Ty84wgusFatlu9BuLLprTLmVXCNZkq04CWSN99SkJ9SO0fAphNoapVZV0kDE4NPtJgn
 nKZw/WCfBwNx/4jQZY0toWBNofCDaKYDkPEQAXu7H7iqKgLDhAsamU/dmYCVx6FO0oaf
 aRfg==
X-Gm-Message-State: AO0yUKXpTPJVmn0abKSFUrn9/jOqH7WPfMvB9z1oRt9waKZY/DdYfGJz
 1CSE2laOjcd1SDNqXJJdov7YRd3pm/6aW4T9n4AuLyryr4CWtSHQMWYSfj6poFSRNKL37ZmzUki
 8cAh2ECim5WZPlEjtzEQ1RgPDyLl6GNW6lGfdaw==
X-Received: by 2002:a17:902:f812:b0:19a:f153:b73e with SMTP id
 ix18-20020a170902f81200b0019af153b73emr5668636plb.4.1678202642958; 
 Tue, 07 Mar 2023 07:24:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9SWy5O05m3x1Ey9TSLMznr1jfUxFnvxAX39KEBXqqmaUx44UhyFFrhNGEtwClSqvzd8jjgUVc0X6h/fPAWheE=
X-Received: by 2002:a17:902:f812:b0:19a:f153:b73e with SMTP id
 ix18-20020a170902f81200b0019af153b73emr5668618plb.4.1678202642668; Tue, 07
 Mar 2023 07:24:02 -0800 (PST)
MIME-Version: 1.0
References: <20230307143410.28031-1-hch@lst.de>
In-Reply-To: <20230307143410.28031-1-hch@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 7 Mar 2023 16:23:50 +0100
Message-ID: <CAHc6FU4G5S+5S+1OdatY3apQvmDcvzOQSPPPQdQZTwMNjSq5tw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] return an ERR_PTR from __filemap_get_folio v3
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
Cc: cluster-devel@redhat.com, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 7, 2023 at 4:07=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrote=
:
> __filemap_get_folio and its wrappers can return NULL for three different
> conditions, which in some cases requires the caller to reverse engineer
> the decision making.  This is fixed by returning an ERR_PTR instead of
> NULL and thus transporting the reason for the failure.  But to make
> that work we first need to ensure that no xa_value special case is
> returned and thus return the FGP_ENTRY flag.  It turns out that flag
> is barely used and can usually be deal with in a better way.

Thanks for working on this cleanup; looking good at a first glance.

Andreas

