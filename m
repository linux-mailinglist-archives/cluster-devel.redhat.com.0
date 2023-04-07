Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B5D6DB1F9
	for <lists+cluster-devel@lfdr.de>; Fri,  7 Apr 2023 19:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680889495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eeevj2IXfQ5qKWd9tc/WTPMDjydGded23Wx96ttD0lI=;
	b=Zrt3yHHSiSZG/i1XlxsBb/N5dBVr3UdsyRaQqtjbyo3AlHKa3PVCKnkzBUgvh5xE/mvj25
	7u40owDR4olCwtKFiQKN/JsF0CToAby9YysIARqsHNKYOwy/fVbPjg860S/SQLgMrUvptH
	ozpx9msMSry25Wyk7XBNwGzvGuS03/M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-5OZJ4P5NO7KK7362IyYZUg-1; Fri, 07 Apr 2023 13:44:52 -0400
X-MC-Unique: 5OZJ4P5NO7KK7362IyYZUg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 448D629ABA1B;
	Fri,  7 Apr 2023 17:44:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5356D492C14;
	Fri,  7 Apr 2023 17:44:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EDFB21946A40;
	Fri,  7 Apr 2023 17:44:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 763C719465BB for <cluster-devel@listman.corp.redhat.com>;
 Fri,  7 Apr 2023 17:44:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 677ED40BC797; Fri,  7 Apr 2023 17:44:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60A2040C6EC4
 for <cluster-devel@redhat.com>; Fri,  7 Apr 2023 17:44:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E052101A531
 for <cluster-devel@redhat.com>; Fri,  7 Apr 2023 17:44:47 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-9QNXtVthNXmWjuYA915mRw-1; Fri, 07 Apr 2023 13:44:45 -0400
X-MC-Unique: 9QNXtVthNXmWjuYA915mRw-1
Received: by mail-pf1-f176.google.com with SMTP id cv11so14222657pfb.8
 for <cluster-devel@redhat.com>; Fri, 07 Apr 2023 10:44:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680889484; x=1683481484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eeevj2IXfQ5qKWd9tc/WTPMDjydGded23Wx96ttD0lI=;
 b=6gd9DgsuCzzJt/m+MJOXYYVVbdhi2ulJhpmFNJnJD2Rossd7LME664fDm0+4NAUGl1
 qHjD3mHAIH4aFH1Ezd2IBCt6VloZa5ZRkcHQZq7341GUx0FgXmAg8rxNQQteBKK6prNL
 ve8xDy95rom8BtPniajUkG582bFZdSw3LlBeVtclnbaSLkucVyhgGblZHhAhd26N225A
 FpOq2GBDFDWUptl6joSxdObCuAnWSDSFdRMW5e7H/Vn6jRnOmqvMzM8Y12SN5s/v2+fE
 NAioncKbBbMJw/4c4+Pwu+gFLD6Pk+QnEb5XfAkyKCXwSGgAQGKIWh2FVYUxOCPJB2gK
 cElg==
X-Gm-Message-State: AAQBX9fdMe9rMReumli6bSwBe3pImXWBLGNQ3OO+tfF9WvNU658W0xP3
 JYQT5OM1QbI/+8eN8YkpbM8r/dn1iBIWEcMhC19x4A==
X-Google-Smtp-Source: AKy350bdMJ3LG9Gi/HkfohQwKo0s3+e/a281cskd8iLsjDWZHESfhkK9S3fdtxt2CrSKiJZP1lRF2TsMUY8mo8Nq91I=
X-Received: by 2002:a65:578e:0:b0:513:a488:f05f with SMTP id
 b14-20020a65578e000000b00513a488f05fmr625705pgr.1.1680889484187; Fri, 07 Apr
 2023 10:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230324175942.2653272-1-trix@redhat.com>
In-Reply-To: <20230324175942.2653272-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 10:44:33 -0700
Message-ID: <CAKwvOdkFK3f6zdkw4Xpa9WpTx6159GWF8J2rtMHoChStu9svVg@mail.gmail.com>
To: Tom Rix <trix@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH] fs: dlm: remove unused is_granted
 function
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
Cc: cluster-devel@redhat.com, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, nathan@kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 10:59=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> fs/dlm/lock.c:239:19: error: unused function
>   'is_granted' [-Werror,-Wunused-function]
> static inline int is_granted(struct dlm_lkb *lkb)
>                   ^
> This function is not used so remove it.

How about instead of remove it, we see if we can reuse it?
Grep for DLM_LKSTS_GRANTED. The comparisons on:

2668: if (lkb->lkb_status !=3D DLM_LKSTS_GRANTED)
2787: if (lkb->lkb_status =3D=3D DLM_LKSTS_GRANTED &&
3749: if (lkb->lkb_status !=3D DLM_LKSTS_GRANTED)

all look like they ought to.


>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  fs/dlm/lock.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> index 1582c8b1404c..b9c124b88f15 100644
> --- a/fs/dlm/lock.c
> +++ b/fs/dlm/lock.c
> @@ -236,11 +236,6 @@ static inline int is_altmode(struct dlm_lkb *lkb)
>         return test_bit(DLM_SBF_ALTMODE_BIT, &lkb->lkb_sbflags);
>  }
>
> -static inline int is_granted(struct dlm_lkb *lkb)
> -{
> -       return (lkb->lkb_status =3D=3D DLM_LKSTS_GRANTED);
> -}
> -
>  static inline int is_remote(struct dlm_rsb *r)
>  {
>         DLM_ASSERT(r->res_nodeid >=3D 0, dlm_print_rsb(r););
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers

