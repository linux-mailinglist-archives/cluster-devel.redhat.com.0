Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F96C78888F
	for <lists+cluster-devel@lfdr.de>; Fri, 25 Aug 2023 15:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692970106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CqE2XZ8vAAjA28aCjN6vUrQeXq80ioUn58FygUj89Nk=;
	b=UKm2UDQaNsY73lj/b9IRdBX3s2BitZYGwx89XdcyCgKD0ywtUbjHOzkMyswSB0TN6nmhNR
	T/ezXhbAZEW1tDS/3BCU6Yp2+zOY79jcXLzSPLObZoogqXy8nxFQDe3tSZwOGObFMeGcbr
	FqgZ2QQFauNVyr/k91n7PUTiflWxzOk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-DfQCUB9OMkWn7cduf0uiRA-1; Fri, 25 Aug 2023 09:28:24 -0400
X-MC-Unique: DfQCUB9OMkWn7cduf0uiRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1B84185A792;
	Fri, 25 Aug 2023 13:28:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD29E2166B26;
	Fri, 25 Aug 2023 13:28:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5A17619465B3;
	Fri, 25 Aug 2023 13:28:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 80B5019465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 13:28:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5C7D12166B27; Fri, 25 Aug 2023 13:28:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 543BB2166B26
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 13:28:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33D1285CBE0
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 13:28:18 +0000 (UTC)
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-1p1DxMaBOIyM026EhfRUnA-1; Fri, 25 Aug 2023 09:28:14 -0400
X-MC-Unique: 1p1DxMaBOIyM026EhfRUnA-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4ff8d9fdf11so995410e87.0
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 06:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692970093; x=1693574893;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CqE2XZ8vAAjA28aCjN6vUrQeXq80ioUn58FygUj89Nk=;
 b=ZVUlO3jivfbMxI7Wq/KfS5s7vI/kfsegzdMSFnJOtPurT4XonISfLuhnafMPWENm7l
 rVENqRIb6bHehp/8YsHwOcghK4fSkBEPw1qx2Ig+qYb4yA990aONYmJ+5dlm1b7XQGf+
 105NkEuerZh/wxbAW/lGG2vLpTqw6X1w+ZMxk9OnRPg1nGz8lcshWkqNF9oI55/pU1f3
 PmZlwrej1koTbwkOifrsT7ZgV2L/ygxMZCPzdD7yp0uKxUaJ+eumdFY/0SUpcDQDLB9f
 tnA7hwvY8KjMyGUkGnAk8xwAaM4kc+77WJfZdMM5zMDeIGsnSoMNBhf4Vu3SbnZTQsn4
 llzA==
X-Gm-Message-State: AOJu0YwnZjIurFt63gtnYIsDFyXkoWki6/JNW2BS3ArBPlvblR1GapCD
 EdQuqIDK1w0eWNwsAmYfdZps984vBVPry+8ok65e0pFgokuC/uZdYZzsABKJEb+mxW0N2n7VZt8
 9P9pI5ufnvW/gj5FeE/2Zc9EtwrNeSDIcn6moVQ==
X-Received: by 2002:ac2:5597:0:b0:500:a397:d4f0 with SMTP id
 v23-20020ac25597000000b00500a397d4f0mr2241617lfg.31.1692970093094; 
 Fri, 25 Aug 2023 06:28:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ67vk3QxZ6sISoOnE3BVszGLL2jnGfU1MzHum7/pIdlRGhX0gCXDE1iJ2KeJ7zFMyuqWIkkAF0+pNC4hXrVA=
X-Received: by 2002:ac2:5597:0:b0:500:a397:d4f0 with SMTP id
 v23-20020ac25597000000b00500a397d4f0mr2241607lfg.31.1692970092728; Fri, 25
 Aug 2023 06:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230824205142.2732984-1-aahringo@redhat.com>
 <CAK-6q+iUe1=68LFv=BVd4MxVhtPf=jGPRFfXXNopEB2J+gjWqg@mail.gmail.com>
In-Reply-To: <CAK-6q+iUe1=68LFv=BVd4MxVhtPf=jGPRFfXXNopEB2J+gjWqg@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Fri, 25 Aug 2023 09:28:01 -0400
Message-ID: <CAK-6q+j=i176L=sC-xAXC6+rSrUhuSeTxWMrpwExeHTpDGKrGw@mail.gmail.com>
To: teigland@redhat.com
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH dlm/next] dlm: fix plock lookup when
 using multiple lockspaces
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
Cc: cluster-devel@redhat.com, bmarson@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Aug 24, 2023 at 7:22=E2=80=AFPM Alexander Aring <aahringo@redhat.co=
m> wrote:
...
>
> The reason why I probably never saw it is because those fields in my
> tests are always the same and we simply don't compare all fields on
> the sanity check.

I need to correct some things here... the patch works, but the commit
message related to some locking issues is wrong. It works to make the
lookup on a per lockspace basis because dlm_controld has a per
lockspace corosync handle. Corosync keeps plock_op and results in
order which is necessary for the lookup mechanism here. So this
mechanism is on a per lockspace basis in order, if dlm_controld would
have a global corosync handle it would work on a global basis.

The issue I saw with putting more sanity checks for start/end fields
does not work because DLM_PLOCK_OP_GET will manipulate fields and they
can't be compared between original request and result. I ran into this
issue a couple times...

- Alex

