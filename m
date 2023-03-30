Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B026D1228
	for <lists+cluster-devel@lfdr.de>; Fri, 31 Mar 2023 00:30:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680215415;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x7V03//xrMoj2maIfgC2qsiNLnzTtZRlKFOvF+x+bJg=;
	b=dkajso3C4fnZUZfV8HZafvVIo8e9b0JuZ5oUKqNbgB0qFm75JAWYey1SU3rwLHhqJ2k8Vx
	btG5uJJ4Q+mK6Lh2DrrOR3HBWeNso8FImN+XMAl+SY4sEUHl7XMeJ/vWaaSefvja+2tTW0
	SKfHm73/X7EZbC5RcSnIhvnnokdrjng=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-eSDgb4M7MTuAA5mpLB6Fmg-1; Thu, 30 Mar 2023 18:30:05 -0400
X-MC-Unique: eSDgb4M7MTuAA5mpLB6Fmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A57AA101A54F;
	Thu, 30 Mar 2023 22:30:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3BB51121330;
	Thu, 30 Mar 2023 22:30:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5AD8619465A4;
	Thu, 30 Mar 2023 22:30:03 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 350451946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Mar 2023 22:30:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E2102492B00; Thu, 30 Mar 2023 22:30:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DAE44492B02
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 22:30:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDF37887400
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 22:30:01 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-unDzl0WUMI29pSoUlyS_iQ-1; Thu, 30 Mar 2023 18:29:59 -0400
X-MC-Unique: unDzl0WUMI29pSoUlyS_iQ-1
Received: by mail-pj1-f50.google.com with SMTP id
 h12-20020a17090aea8c00b0023d1311fab3so21367999pjz.1; 
 Thu, 30 Mar 2023 15:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680215398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x7V03//xrMoj2maIfgC2qsiNLnzTtZRlKFOvF+x+bJg=;
 b=Q5YsJXbHZKVhy46sO8FzjGmG+sDHDnfyLUCfNcPMvnqmNoOW0iwDLAb4y0q2tbiP5Z
 14AZfA6SdrVGwBESsW9ZJixh8DNAIQWGeu3cvMVpPVT7nBtm5iw+H8oCWg/Axi5x8Oqi
 ePWsoKq7pjH0FqV2XiGu58sOMCOmQYZ+DozQ3/xThwhlq8WOZPgfXRROJ1j+nOvVevu0
 sIgESk2LLboWWth5E3EKUMFAuMg8TS8YqQ834A/n/LDywK1Dc8DupREkrZkWqbRuzYjt
 HeMJT5TUm9WGmbb6OSTYhF3ViUFnnD+b4Hglqi61Vidsy10GizPhpqr+juSRiOj3GDKC
 CK8g==
X-Gm-Message-State: AAQBX9eLjevjwuODn8GpFz67V/j9B3DF9LJ6c5eC3A0fx0Q1AmNmZvTr
 zVDtwSG8ZfTNur8q6cI9cH10JDFQdQBVtGLEioA=
X-Google-Smtp-Source: AKy350ZrPyR1hRVTBuZnQUpMEn54ihWHCa7XbNjYLmiSy4XxnRAJ80dimqjvvbOmN9ocOuC+cire+hzLe0DMBMrzkWw=
X-Received: by 2002:a17:90a:fb57:b0:23d:30c2:c5b7 with SMTP id
 iq23-20020a17090afb5700b0023d30c2c5b7mr2603971pjb.3.1680215397861; Thu, 30
 Mar 2023 15:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <beea645603eccbb045ad9bb777e05a085b91808a.1680108414.git.johannes.thumshirn@wdc.com>
 <3a0f0c92-63cb-3624-c2fe-049a76d1a64a@opensource.wdc.com>
 <CAHbLzkoRdTTbnfz3RyLQAeNJBOEVNGL2WLgRSE2eQ4nR8sRe2g@mail.gmail.com>
 <b19696d3-54bb-d997-5e56-aa5fd58b469f@opensource.wdc.com>
In-Reply-To: <b19696d3-54bb-d997-5e56-aa5fd58b469f@opensource.wdc.com>
From: Yang Shi <shy828301@gmail.com>
Date: Thu, 30 Mar 2023 15:29:46 -0700
Message-ID: <CAHbLzkrEXVDf4TYLw_MPrFNybWQHWXKX=zP5GhxHQFdpVPWhEg@mail.gmail.com>
To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 18/19] dm-crypt: check if adding pages
 to clone bio fails
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 jfs-discussion@lists.sourceforge.net, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Song Liu <song@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, dm-devel@redhat.com, David Sterba <dsterba@suse.com>,
 Hannes Reinecke <hare@suse.de>, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 29, 2023 at 5:24=E2=80=AFPM Damien Le Moal
<damien.lemoal@opensource.wdc.com> wrote:
>
> On 3/30/23 09:17, Yang Shi wrote:
> > On Wed, Mar 29, 2023 at 4:49=E2=80=AFPM Damien Le Moal
> > <damien.lemoal@opensource.wdc.com> wrote:
> >>
> >> On 3/30/23 02:06, Johannes Thumshirn wrote:
> >>> Check if adding pages to clone bio fails and if bail out.
> >>
> >> Nope. The code retries with direct reclaim until it succeeds. Which is=
 very
> >> suspicious...
> >
> > It is not related to bio_add_page() failure. It is used to avoid a
> > race condition when two processes are depleting the mempool
> > simultaneously.
> >
> > IIUC I don't think page merge may happen for dm-crypt, so is
> > __bio_add_page() good enough? I'm working on this code too, using
> > __bio_add_page() would make my patch easier.
>
> If the BIO was allocated with enough bvecs, we could use that function. B=
ut page
> merging reduces overhead, so if it can happen, let's use it.

It does allocate BIO with enough bvecs. IIUC it will merge the
adjacent pages? If so page merging may happen. Since dm-crypt does
allocate BIO with enough bvces, so it can't fail if I read the code
correctly. I'm wondering whether we could have a never fail variant.

>
> >
> >>
> >>>
> >>> This way we can mark bio_add_pages as __must_check.
> >>>
> >>> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> >>
> >> With the commit message fixed,
> >>
> >> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
> >>
> >>
> >> --
> >> Damien Le Moal
> >> Western Digital Research
> >>
> >>
>
> --
> Damien Le Moal
> Western Digital Research
>

