Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BA5745833
	for <lists+cluster-devel@lfdr.de>; Mon,  3 Jul 2023 11:17:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688375857;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8HHzoJ5KB9PwbED6aCUVdjiUMf88jiN+uGVsp2SPg0Q=;
	b=A6vh3CJfWNtsAFmfEXGyksoI6h+lANYQZIFw8iR3o0eq2xxM6iShFgi+NUHpq605rxu58Q
	Klq2vsK5TPp9SG71TiYaCQGrA3VyG29ezXRbfQghcSa+yF/C5W+81QnE4BKM6L7hoCA0Oh
	o7p611IZY5XaRrbfgPJiazNqIrHRm+M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-8DleSxoYMBmwW9y90RqXZA-1; Mon, 03 Jul 2023 05:17:33 -0400
X-MC-Unique: 8DleSxoYMBmwW9y90RqXZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEC163C1350E;
	Mon,  3 Jul 2023 09:17:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 65AFA4087C6A;
	Mon,  3 Jul 2023 09:17:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0B4751946597;
	Mon,  3 Jul 2023 09:17:30 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8EF9A1946586 for <cluster-devel@listman.corp.redhat.com>;
 Mon,  3 Jul 2023 09:17:28 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4CB144087C6D; Mon,  3 Jul 2023 09:17:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 453AD4087C6A
 for <cluster-devel@redhat.com>; Mon,  3 Jul 2023 09:17:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 297483C1350B
 for <cluster-devel@redhat.com>; Mon,  3 Jul 2023 09:17:28 +0000 (UTC)
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-qJAdub3TNNGBkq8HT6zdKw-1; Mon, 03 Jul 2023 05:17:26 -0400
X-MC-Unique: qJAdub3TNNGBkq8HT6zdKw-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1b895fa8929so8315295ad.0
 for <cluster-devel@redhat.com>; Mon, 03 Jul 2023 02:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688375845; x=1690967845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8HHzoJ5KB9PwbED6aCUVdjiUMf88jiN+uGVsp2SPg0Q=;
 b=Ru9qF12Cq6gvtmdTAqMEGzmgeuDoaHL29LTnMUtRKdnB0OXNjvC3h186aw+ca815Mx
 30TXTFp3DVbcTxcQLB50bpjvcBQfHLV7bTrzVT5gSGy92DxX227vp/92vhbLz+cwRCd9
 lY4SzzlpbfvA8H/2Cw8OyUP8zvlsBmV4oZABZRRln1eGJ0MtJJY2+6zymwuZ9h9lRIIy
 eecfl80LaBlMGpsM+axsQYuQBlSuGutCV4HMwcwf5x0wpaFDBmauGS4dVjq4ygVoU5oD
 z3z4pF6aX8pchXQ/oRJFChZeGfmOSmjRPcCHiFwzw4T8urF+FL/xn/M8SxCSO+yMkXSO
 rxJg==
X-Gm-Message-State: ABy/qLazNyP0qUY4K+gPAiUFvAYJjLUxE8nyVz258KdHkxmBCcbYqgRo
 tGuk0p/+kbUwCOqtyMCvJW1Z1D1s0BIUkEQBC/Ozio/OXQ7OA3lX9NkkKgaRYgi0a9nqAQfPRaW
 uQFYwOz02Cak1sw3m2fyB0B8wKSJjIgP6ApTSRA==
X-Received: by 2002:a17:903:22ce:b0:1b8:9b90:e2bc with SMTP id
 y14-20020a17090322ce00b001b89b90e2bcmr914062plg.52.1688375845571; 
 Mon, 03 Jul 2023 02:17:25 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFvcAIY9KsHTFSp2HQjjW2SLm2ABVtM2SXsV/67vEEWu50uv1ZaslAjF6b7RfDyYT6a4Pk8632wNdrsXX5WZ/w=
X-Received: by 2002:a17:903:22ce:b0:1b8:9b90:e2bc with SMTP id
 y14-20020a17090322ce00b001b89b90e2bcmr914045plg.52.1688375845264; Mon, 03 Jul
 2023 02:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688073459.git.drv@mailo.com>
In-Reply-To: <cover.1688073459.git.drv@mailo.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 3 Jul 2023 11:17:13 +0200
Message-ID: <CAHc6FU5WZafgAutKpVRC1jPMNpGCh+M_i+tmCZw0dGCBUXe1ug@mail.gmail.com>
To: Deepak R Varma <drv@mailo.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v3 0/6] gfs2: kmap{_atomic} conversion
 to kmap_local_{page/folio}
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
Cc: Sumitra Sharma <sumitraartsy@gmail.com>, Ira Weiny <ira.weiny@intel.com>,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Deepak,

On Thu, Jun 29, 2023 at 11:48=E2=80=AFPM Deepak R Varma <drv@mailo.com> wro=
te:
> This patch series proposes to replace the kmap/kmap_atomic implementation=
 to the
> preferred kmap_local_* APIs.
>
> The code blocks for this module where kmap/kmap_atomic calls are implemen=
ted do
> not appear to depend on disabling page-faults or preemption. Hence such c=
ode
> blocks are safe for converting to improved kmap_local_{page,folio} APIs.
>
> Note: The proposed patches are build tested only.
>
> Initially, only a single patch was sent and now being converted into a pa=
tch
> series including the other files/functions of this module. Hence all patc=
hes,
> that are included for the first time in this series are also marked as v3=
.
>
> Changes in v3:
>    - Patch set introduced to include all gfs2 kmap conversions
>    - Patches 3/6 through 6/6 are included to build the series
>    - Initial stand-alone patch split into 2 patches [1/6 and 2/6]

I have already merged version 2 of this patch series and I've fixed up
the remaining issues in follow-up patches; see the cluster-devel
mailing list:

https://listman.redhat.com/archives/cluster-devel/2023-June/024391.html
https://listman.redhat.com/archives/cluster-devel/2023-June/024392.html
https://listman.redhat.com/archives/cluster-devel/2023-June/024393.html

As well as our for-next branch:

https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/log/?h=
=3Dfor-next

As far as I can see, there is nothing in v3 of your patches that I
haven't addressed already. Please speak out if I've missed anything.

Thanks,
Andreas


>
> Changes in v2:
>    - 3/6 to 6/6: None.
>    - 1/6 + 2/6: Correct patch description for the replacement function na=
me from
>      kmap_local_folio to kmap_local_page
>
> Deepak R Varma (6):
>   gfs2: Replace kmap_atomic() by kmap_local_page() in stuffed_readpage
>   gfs2: Replace kmap_atomic()+memcpy by memcpy_from_page()
>   gfs2: Replace kmap() by kmap_local_page() in gfs2_unstuffer_page
>   gfs2: Replace kmap_atomic() by kmap_local_page() in lops.c
>   gfs2: Replace kmap() by kmap_local_page() in gfs2_read_super
>   gfs2: Replace kmap_atomic() by kmap_local_page() in
>     gfs2_write_buf_to_page
>
>  fs/gfs2/aops.c       | 13 ++++++-------
>  fs/gfs2/bmap.c       |  4 ++--
>  fs/gfs2/lops.c       | 12 ++++++------
>  fs/gfs2/ops_fstype.c |  4 ++--
>  fs/gfs2/quota.c      |  4 ++--
>  5 files changed, 18 insertions(+), 19 deletions(-)
>
> --
> 2.34.1
>
>
>

