Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F46CF72B
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 01:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680132706;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YBKSTZB4DL7oK2OqUjnDZlFWj9rbhqF7ilesNPuPEx8=;
	b=iDwKNfJct3t1FXDcO44I1rXa0aNnBx6FavKKcNb2uFMu0acvjqQOGaFFjlImZbkBSrA1Nn
	RDfAbm1pahnI7TY/PRVvzO3xuEr9WpAX8nChj8hoU3rfgEi7N7+Jr63Zu8EaBgtvXUcB8w
	BfMBEFLdO0hxm/1AFF+NurVz0yLm1xE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-iy2bow8yOj-P8sfiAirHLA-1; Wed, 29 Mar 2023 19:31:41 -0400
X-MC-Unique: iy2bow8yOj-P8sfiAirHLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBC7A3C10231;
	Wed, 29 Mar 2023 23:31:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AFFD240BC799;
	Wed, 29 Mar 2023 23:31:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 98EAC194658F;
	Wed, 29 Mar 2023 23:31:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 240B21946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 23:31:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 059F6492B02; Wed, 29 Mar 2023 23:31:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F227B492B00
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:31:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D77C4800B23
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:31:38 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-NNA6sDK_NrC-Oz9_4kC0Yw-2; Wed, 29 Mar 2023 19:31:37 -0400
X-MC-Unique: NNA6sDK_NrC-Oz9_4kC0Yw-2
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="225113433"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 07:30:33 +0800
IronPort-SDR: NDWA8gsaAO6jEYXhapwo201irNvicJB9nCEKSrVEZFZTLvEpbvnk74Jmc7mLMA+MqBSaS+QQVI
 wybAq1HCnos11FIeg3S1RSs9IO6kL3K6Mg7lA3Njk4lx0nOCVgu2eMJtkMBLA2Io7ZwqzuaEL4
 L4OjNnfQLr9ygyTty2UMdBFjky9u0NkdJIOgylyUqM73SUwW99oFf+YL2l//UjlRcs/FOQ2pY1
 GCwuzwzmojyXrptaTYcEsR65nG+CXY77pHL4yxOnIFd+tqZrBVzu876iFFD1y36ih6O+8TCuyX
 PC8=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 15:46:42 -0700
IronPort-SDR: 49X8ir9v5VM6XGULYGj+MHubq00r3vGNnsEYReIqs82eDqZe1HRXEn7MNid2wSxatI/sxOlTbi
 qApnc2dmsiLZfm8qnScsr49Ani2sXiSv+qSIJfjFMWJSmiiJMWShCGhs3wYsD1yFnIxtloQGCy
 +bz3CxYcCVh2fqUNaswiRS6aq2+5i1+ku9ZWkhCbVzzEDQorof1QflNmRz5gzP9pz5VJJ6MHZ9
 sv64kBC29MRBut4O1RnFNXmJsa/nYFZr2yfOyvdWua1HcxSm6Hpq5b3jWotAbFQ3389kRze11c
 DeE=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:30:34 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn2px49sVz1RtVp
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 16:30:33 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id hMGtmHZv8iKI for <cluster-devel@redhat.com>;
 Wed, 29 Mar 2023 16:30:32 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn2pt0C0hz1RtVm;
 Wed, 29 Mar 2023 16:30:29 -0700 (PDT)
Message-ID: <4e4aa0e7-f222-f269-1b5c-1abb3a7179e7@opensource.wdc.com>
Date: Thu, 30 Mar 2023 08:30:28 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <4a2c46dc0e217a9fb6b9f32d460498a5feb8b67b.1680108414.git.johannes.thumshirn@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <4a2c46dc0e217a9fb6b9f32d460498a5feb8b67b.1680108414.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [PATCH 03/19] dm: dm-zoned: use __bio_add_page
 for adding single metadata page
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
Cc: linux-raid@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
 cluster-devel@redhat.com, Chaitanya Kulkarni <kch@nvidia.com>,
 Song Liu <song@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Mike Snitzer <snitzer@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, dm-devel@redhat.com, David Sterba <dsterba@suse.com>,
 Hannes Reinecke <hare@suse.de>, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: opensource.wdc.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/23 02:05, Johannes Thumshirn wrote:
> dm-zoned uses bio_add_page() for adding a single page to a freshly created
> metadata bio.
> 
> Use __bio_add_page() instead as adding a single page to a new bio is
> always guaranteed to succeed.
> 
> This brings us a step closer to marking bio_add_page() __must_check
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

