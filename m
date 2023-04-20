Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1328C6E8931
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Apr 2023 06:40:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681965625;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e2kMjxLw00pT2+EDznrCtqL7waGns3hQPtXSEb5TvkE=;
	b=YPJlFPlejpMZgqgg1LscW31dQwXSsCVuV2u36O/i+FzSC8RqTbFtwb9vSKFPumGZpcMwlw
	ArUC3/M03KEUooIHRWsihQztvMylP2/Thb98a8E8WV8qPEUb+9vStI7ZoJCK5gQ497uyTZ
	x0ytLd2Dw4303uNVnhoF4DgFK7mTKB0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-N2N4YvUGPcywOQQpOJaGWg-1; Thu, 20 Apr 2023 00:40:20 -0400
X-MC-Unique: N2N4YvUGPcywOQQpOJaGWg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A3E1F101A551;
	Thu, 20 Apr 2023 04:40:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7091A1410F1C;
	Thu, 20 Apr 2023 04:40:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 31BE71946A40;
	Thu, 20 Apr 2023 04:40:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F19BB1946A42 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Apr 2023 04:40:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 307CC492B05; Thu, 20 Apr 2023 04:40:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 28FF7492C3F
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 04:40:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C665811E7C
 for <cluster-devel@redhat.com>; Thu, 20 Apr 2023 04:40:04 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-xqUV14_ANNObqNhpcVOI8g-1; Thu, 20 Apr 2023 00:39:59 -0400
X-MC-Unique: xqUV14_ANNObqNhpcVOI8g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 808F860C20;
 Thu, 20 Apr 2023 04:39:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F3BC433A0;
 Thu, 20 Apr 2023 04:39:57 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id a10so1396375ljr.5;
 Wed, 19 Apr 2023 21:39:57 -0700 (PDT)
X-Gm-Message-State: AAQBX9c5q/Wl797ZuAePZ5hMxtHqHbRmBqoVNN1dTwvWKcw/R7zY4Y6T
 DKd7V1cKUtd8k3coRWJdKJ0Hcb9rOwMv4Z2qZVM=
X-Google-Smtp-Source: AKy350brjGRI86LwVWGkzPXSEalUdCI4Td6YNPTTcnNRSEuyUW/eSnxVnpWQ0bvhloD205Vvr5DEOhYwggyQMmUmPfI=
X-Received: by 2002:a2e:a313:0:b0:2a8:928d:2e2e with SMTP id
 l19-20020a2ea313000000b002a8928d2e2emr2679277lje.5.1681965595968; Wed, 19 Apr
 2023 21:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230419140929.5924-1-jth@kernel.org>
 <20230419140929.5924-18-jth@kernel.org>
In-Reply-To: <20230419140929.5924-18-jth@kernel.org>
From: Song Liu <song@kernel.org>
Date: Wed, 19 Apr 2023 21:39:44 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7n5Gb68+br0Cf47J5wu25FtTzfBs0cSihg49f2tSY8jA@mail.gmail.com>
Message-ID: <CAPhsuW7n5Gb68+br0Cf47J5wu25FtTzfBs0cSihg49f2tSY8jA@mail.gmail.com>
To: Johannes Thumshirn <jth@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH v3 17/19] md: raid1: check if adding
 pages to resync bio fails
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, linux-mm@kvack.org,
 dm-devel@redhat.com, hch@lst.de,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, willy@infradead.org,
 cluster-devel@redhat.com, kch@nvidia.com, snitzer@kernel.org,
 ming.lei@redhat.com, linux-block@vger.kernel.org, hare@suse.de,
 dsterba@suse.com, axboe@kernel.dk, linux-raid@vger.kernel.org,
 damien.lemoal@wdc.com, johannes.thumshirn@wdc.com,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 7:11=E2=80=AFAM Johannes Thumshirn <jth@kernel.org>=
 wrote:
>
> From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
>
> Check if adding pages to resync bio fails and if bail out.
>
> As the comment above suggests this cannot happen, WARN if it actually
> happens.
>
> This way we can mark bio_add_pages as __must_check.
>
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Acked-by: Song Liu <song@kernel.org>

Thanks!

