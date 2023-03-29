Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A666CF77E
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 01:37:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680133031;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ye5uVDhHYiNIqI0JdBUFxCn8OM1mdc0S9cE9tlpDOgk=;
	b=hsDKnfRmLfOzlUOxhc7BodUhC85WI4X0CRWA9OqFeUz3apmhYOCMTyO0qf9Hj3M19IOzPX
	+k3IBqcdKJ1gCR5WgJET8IVt8kxwBSeeKC/Lpw35+ktApV7H2QHXY9xsZs6VIUI6CvubxZ
	AXy5OfBtJ/S1Dtghu1/yQtlMRV7jSjE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-3EuwJS0DMPy0ZCEt0yAdEg-1; Wed, 29 Mar 2023 19:37:09 -0400
X-MC-Unique: 3EuwJS0DMPy0ZCEt0yAdEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B07D3823A07;
	Wed, 29 Mar 2023 23:37:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 704102166B33;
	Wed, 29 Mar 2023 23:37:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3F865194658F;
	Wed, 29 Mar 2023 23:37:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D51E81946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 23:37:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B44B34042AC6; Wed, 29 Mar 2023 23:37:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC5824042AC0
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:37:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8361B2814240
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:37:06 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-S7Cc4-rgO7-mxZA7dvu_6g-1; Wed, 29 Mar 2023 19:37:04 -0400
X-MC-Unique: S7Cc4-rgO7-mxZA7dvu_6g-1
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="225113838"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 07:37:01 +0800
IronPort-SDR: wMpPalw63/VCtXUYyP8hP3JW//LXZn7ePfUTnCeb13WLhQOuXCfUS7jxZ7jA156zgPMUA/2Jv4
 VKnDXRiMIVH+X/muTS6X91+sxPU2/ri4/zyznLAqZpHuoomZVTI+sMo68FdIadwvQOMOU4Wb95
 YijsOrDvJX8Um2jfKQeyOt37MSk8mnw8+8A4H+5ik7fV34raq8kRldlcGE9UHNCpOGLMnxubL/
 a3pnRdG3QN51+Tu+vC3b4T1k5G7b4kpVW4DnUMDWa7/iyjDPzYBZYWhdvKbXxkegktXdMSPX3a
 ze4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 15:47:29 -0700
IronPort-SDR: M5EZJLxAczMgLe8NyYUiUUDz7oiMg6rI2fZZ6/wDGM7CUPiMkQOh6X/NRv9D66MAsGLJdHvXaI
 t6JHu4Nzm6byNShoy3iMVxvnLv1sNPJrJ19AGvjkuaZkurD9Z1KatOrRDPoOdDC3zfB39mNjq+
 2UvTcdh7sTdXT9aT5b8lKdDqI2EpLV0G2V5K6lcDFhBhjEBzAU+5lEPHr7epY94uJc2FEg5BR0
 Chqj6u2QaWJlhqsTyoR3Bl7Q2POqF/W/0N7n43OmiPluNx+c/Wv4tliw99wPkJJMhb5ajQzhbe
 51g=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:37:02 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn2yP3bBxz1RtW3
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 16:37:01 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id h5ySVU3DmyTy for <cluster-devel@redhat.com>;
 Wed, 29 Mar 2023 16:37:00 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn2yK4J91z1RtVm;
 Wed, 29 Mar 2023 16:36:57 -0700 (PDT)
Message-ID: <1027d62b-d09f-e9fb-b8fb-9876fda97f82@opensource.wdc.com>
Date: Thu, 30 Mar 2023 08:36:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <aeff063d2f56092df8cae0a6e9c1a8e771994407.1680108414.git.johannes.thumshirn@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <aeff063d2f56092df8cae0a6e9c1a8e771994407.1680108414.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH 14/19] floppy: use __bio_add_page for
 adding single page to bio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: opensource.wdc.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/23 02:06, Johannes Thumshirn wrote:
> The floppy code uses bio_add_page() to add a page to a newly created bio.
> bio_add_page() can fail, but the return value is never checked.
> 
> Use __bio_add_page() as adding a single page to a newly created bio is
> guaranteed to succeed.
> 
> This brings us a step closer to marking bio_add_page() as __must_check.
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

