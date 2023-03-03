Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 743036A99A8
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Mar 2023 15:38:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677854337;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i4ZUypLqM7/7AG6CZZ6YdmXbfJM6G5stqmomo60rDyQ=;
	b=J35oh+RfF5KCZbiGs4dLCdjnIAOr4mh7cFjYC51r+7YhD1vUl6P884nI5G2Q4S1g7Kyx8g
	u9HXUqV93SLZNK4GKXxcP4V/XAWPmQaW/e80wydPwcAVyedsTwDPX2y8FFopaQToBb1qdG
	HLaUAnwsEIOxC3V8ogLU11K1W3e2eIs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-V_KLJ3fDMZOJWXH3NUoNTw-1; Fri, 03 Mar 2023 09:37:32 -0500
X-MC-Unique: V_KLJ3fDMZOJWXH3NUoNTw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB7EA101A52E;
	Fri,  3 Mar 2023 14:35:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CEAE2492C14;
	Fri,  3 Mar 2023 14:35:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7A89C19452D0;
	Fri,  3 Mar 2023 14:35:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CCC2219452D8 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  3 Mar 2023 14:35:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A7914492B00; Fri,  3 Mar 2023 14:35:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A045F492C3E
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 14:35:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 834D929ABA04
 for <cluster-devel@redhat.com>; Fri,  3 Mar 2023 14:35:18 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-Z9cM8TU6P-yf8-j5PYlU1w-1; Fri, 03 Mar 2023 09:35:17 -0500
X-MC-Unique: Z9cM8TU6P-yf8-j5PYlU1w-1
Received: by mail-ed1-f69.google.com with SMTP id
 q13-20020a5085cd000000b004af50de0bcfso4302165edh.15
 for <cluster-devel@redhat.com>; Fri, 03 Mar 2023 06:35:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677854115;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i4ZUypLqM7/7AG6CZZ6YdmXbfJM6G5stqmomo60rDyQ=;
 b=EUH4qFz+0uDOmkT+1GQZfH3HYfrUtzclW1pKnj3VH346hs9lwgEhsiUOB0jja3JOU+
 62UiDAcE18yof/4CsaqKgL9yUAUgaaqnFGNJmOduyrC9dEkBanM2pIjb5lE1pjYKgoS/
 uAO/XkpHJ5C331IhXHDZJjAKXCDSfa6m+3Ga2+RihJLsLSrH5Oxn0giVw+buM21sMf0y
 kEP5R0K50K9h/AnBGBKNlbePeit/MQCTIdZPfj1/wcOZPEOQaQdulns5WCItMv31S1+J
 B6af5UBaWhLi2jyJ3YxAhTcDfehYmhunTtrGNY5nvvbrFFFQWrnl2Q5G/oh9zaQabIma
 BG6g==
X-Gm-Message-State: AO0yUKVTuAibNhFE8HOvlwijQmh4lLWGiccvqXBXuQ4YjxXMjcsKBXcH
 9JJGs04L1l4Pd0mkwLlTlgbVh7snkkfmtjduqrKnaTheoeksj2YFrtpWo0k7O0ujJ0pL0th0EBQ
 wHHphXLvsDyarMvEPdVuMqWBgQA+mVT15m3X09mUceBCWZJMa
X-Received: by 2002:a50:9f26:0:b0:4c0:1cfa:bfe1 with SMTP id
 b35-20020a509f26000000b004c01cfabfe1mr1209798edf.6.1677854115745; 
 Fri, 03 Mar 2023 06:35:15 -0800 (PST)
X-Google-Smtp-Source: AK7set/zEe6BL3lyEPj0YKq9BmaqJFNcfBl/k1aW1JNaSjBce0c3KxAUoPRQovRCPMrKxt9VlzcEJjQB3zUScRxWEF8=
X-Received: by 2002:a50:9f26:0:b0:4c0:1cfa:bfe1 with SMTP id
 b35-20020a509f26000000b004c01cfabfe1mr1209793edf.6.1677854115509; Fri, 03 Mar
 2023 06:35:15 -0800 (PST)
MIME-Version: 1.0
References: <20230302171441.1509914-13-aahringo@redhat.com>
 <20230303133845.801743-1-agruenba@redhat.com>
In-Reply-To: <20230303133845.801743-1-agruenba@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 3 Mar 2023 09:35:04 -0500
Message-ID: <CAK-6q+gmTae=5xj5Noomy=aVRfwAQgD1C2WJ1=TYEjPWA76cMw@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH dlm-tool 13/14] dlm_controld: plock log
 lock state
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 3, 2023 at 8:38=E2=80=AFAM Andreas Gruenbacher <agruenba@redhat=
.com> wrote:
>
> Alexx,
>
> can you please prefix this patch with the following to make this easier
> to read?
>

okay.

btw: I think we could make a struct lockspace pointer in struct
resource which is all the way passed down.
I think a struct resource instance is ordered under a per "lockspace
-> inode -> resource" hierarchy.

I am still not 100% sure if this is the case, but could be done later
as cleanup as well.

- Alex

