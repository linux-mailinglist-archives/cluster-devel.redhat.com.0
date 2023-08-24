Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CEF787A54
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Aug 2023 23:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692912319;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=PWKYbrMrb48JvhTQp4bhUeEoEYDgGEAEXO60JbRPDI4=;
	b=VaNYrpm0DDArm5hpLg0nwdcZIaX+vspIGTWI7wnHH+pQYPg5saWOJMvr+JhETrMNVGKFzw
	ls6caUmTEAKUnEr2deYJWu9Ra7e7LYWM99M9Yj47C9nz05EIPEcTlyhxuHGLE703Fz+LPw
	L+dxZ0LBNICCIFNjgtGIR0sokw4MnDc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-TKMqOSNPOf2FiqUKpiMnCw-1; Thu, 24 Aug 2023 17:25:16 -0400
X-MC-Unique: TKMqOSNPOf2FiqUKpiMnCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60B02101A528;
	Thu, 24 Aug 2023 21:25:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8E362026D68;
	Thu, 24 Aug 2023 21:25:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8233119465A8;
	Thu, 24 Aug 2023 21:25:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6053A1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Aug 2023 21:25:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1D53F140E963; Thu, 24 Aug 2023 21:25:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15D79140E962
 for <cluster-devel@redhat.com>; Thu, 24 Aug 2023 21:25:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5809185A791
 for <cluster-devel@redhat.com>; Thu, 24 Aug 2023 21:25:12 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-722yiWfLPP6hBELGBSTzHw-1; Thu, 24 Aug 2023 17:25:11 -0400
X-MC-Unique: 722yiWfLPP6hBELGBSTzHw-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1c09d82dfc7so4490055ad.0
 for <cluster-devel@redhat.com>; Thu, 24 Aug 2023 14:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692912310; x=1693517110;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PWKYbrMrb48JvhTQp4bhUeEoEYDgGEAEXO60JbRPDI4=;
 b=RWhxz0dQc3DRyPLI0QE3FxCSYtLJg5a/icuq2ZYhrXdaZ3jKbsJa0Wzzhtzzi5ZP0m
 HOL+AzZY+y/6TZAOM7J2LD9oV2+meIoqRkgY7G5adizrxQB/L93XVSr1dWmIUxEIZS88
 sJrB2SqK6JB3tOGCOjbaILlGJYKCkuiLAxjZtIu19NhNLqEShJBicRF25GK+ps3kWnp+
 vUidMiO+inYCjaw1lzRbnDspgpgvOtHq1sUQLtjCDLmCuXfeqG5jzoFAuqmiQ5AlYfw9
 0ezfy/AiniKpV8IS+aWYj9wXhvKYbzXpH4BNF2ogdneAowNdnSEmdcuxGfQA7udfmHfD
 tbeg==
X-Gm-Message-State: AOJu0Yy1wU9fZFqZutLfwMryAJyZGrWSBGey4UeZT9ef8zl4Lufsa0/n
 QUPf5XraBadFu1+/olzIfo5RMCevQWR9PYDB0AGxu82++h56CW+8keEyx+5Zn8mUgCiFjVDlh22
 /ANBdgUVPrT9VT/s5wTJmCcVOi6KQZ191bNy1xg==
X-Received: by 2002:a17:903:120d:b0:1b9:ea60:cd91 with SMTP id
 l13-20020a170903120d00b001b9ea60cd91mr17073406plh.7.1692912310344; 
 Thu, 24 Aug 2023 14:25:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZZIK4S3ulab94FBMOHEmvsrXmPr0ilhfWEgbDzsd7rJe85li6R2bi+BV0VvdtEoqelM8btmXiw52wX20DH3Y=
X-Received: by 2002:a17:903:120d:b0:1b9:ea60:cd91 with SMTP id
 l13-20020a170903120d00b001b9ea60cd91mr17073390plh.7.1692912310054; Thu, 24
 Aug 2023 14:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002b5e2405f14e860f@google.com>
 <20230127051009.3881703-1-eadavis@sina.com>
 <6561085e-d4c9-bd04-d59b-eb39cfbaa3e7@redhat.com>
 <CAHc6FU5Zk6drhr_mC36hCMrq=ZmpDeBQsS9AZOT-NdsiXb1qVg@mail.gmail.com>
In-Reply-To: <CAHc6FU5Zk6drhr_mC36hCMrq=ZmpDeBQsS9AZOT-NdsiXb1qVg@mail.gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 24 Aug 2023 23:24:58 +0200
Message-ID: <CAHc6FU6O9nVzB2PvjRYRMKRq8b1aXFwkFT0qTt+6H7vk1saShA@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix uaf for qda in gfs2_quota_sync
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
Cc: syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com,
 cluster-devel@redhat.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, eadavis@sina.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

I've pushed the fixes for this bug to for-next.

https://lore.kernel.org/cluster-devel/20230824211948.3242607-1-agruenba@redhat.com/

Thanks,
Andreas

