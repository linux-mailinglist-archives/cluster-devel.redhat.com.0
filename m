Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 201D56CF770
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 01:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680132948;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=liArph+6JLot/OfPpdm7e7BPVHtWheclIVeKaNwaNTs=;
	b=avzJKawml+/3G8cgV9nbkcXjzfdcMpRQzFxuI1CLzAo2TnxDk8GhqFhd97lT03/CQNplNr
	A7pbODC1sHaFSITfkenV5Q/IOMclAFAMHtUlx0ppQUTYph/eanYe3BQLrcl4BSdN9AyQHb
	yqflFkmNXcgkBioavNRXfadXC/MVhx0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-99kQPd90MHqbkp5jNBLL7A-1; Wed, 29 Mar 2023 19:35:44 -0400
X-MC-Unique: 99kQPd90MHqbkp5jNBLL7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18C148028AD;
	Wed, 29 Mar 2023 23:35:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0B1B94042AC0;
	Wed, 29 Mar 2023 23:35:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B2F90194658F;
	Wed, 29 Mar 2023 23:35:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 659CE1946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 23:35:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2BC532166B34; Wed, 29 Mar 2023 23:35:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 249622166B33
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:35:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0302285A5A3
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:35:43 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-yI8gAArMMTOePhBKcN_atg-3; Wed, 29 Mar 2023 19:35:41 -0400
X-MC-Unique: yI8gAArMMTOePhBKcN_atg-3
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="225113753"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 07:35:38 +0800
IronPort-SDR: cvaolrP+lbU1k0INlUj4Qb8I3DW03umSXZC1D7pP75EIyGvnrleh5LnLBE2p8x8r/PYJoKLUrO
 WOoZWKaQncRigz8LE1R0M9wth9oV2IyOAlMzjw96r2N6efXU1wT9Tdb8Mf+LT68FmGaSXRIglP
 WQnyWIfO9zcXmPTPKVV1k7sojWb/dd9t3CR0wQq5WUgAKSrknDk1Ruzk0wr8nJXEA+DvP0+g6G
 unLthBm+K3tY7ZWw+l1ZPyh0o4nTb1slprvBQy5sHA9ODG9O/ogw4Z2A15ri77nZ/zB7GUFuAQ
 LJw=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 15:46:06 -0700
IronPort-SDR: yBSzvJ4et10KzU9732ny0PDHROUHMHfByEAw1Eck9kqkQ1NxE0tvpUsK+zjwNznGNaL72K+VAm
 x10fNPx6083PJWaDVW0VfohUSot6m29O8j0M0PVXN6JZ+TZlEr/pGqnYwMOo+JIZ9dYudog54b
 +MTk9UyANIaZWMCVPUyr76d9eXN7WWVpmOtKuWeCRBsbsMOuC3SKP32IqtVYMSjU7Ixn2Inslr
 HwiXr2qBb51g1MAcGf4OUK702JdiJOAj1KuPXCc7UjStPd/SUABRgT/dF9Fbbt6rCR99XxPNni
 +xo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:35:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn2wp3JW5z1RtW3
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 16:35:38 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id GCYkmZX5A3xQ for <cluster-devel@redhat.com>;
 Wed, 29 Mar 2023 16:35:37 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn2wk4Fdnz1RtVm;
 Wed, 29 Mar 2023 16:35:34 -0700 (PDT)
Message-ID: <ce3889b4-8689-ac73-0761-fc35a78b8dbd@opensource.wdc.com>
Date: Thu, 30 Mar 2023 08:35:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <ef742ee32fd0623008114e929d9a3e688fd721f7.1680108414.git.johannes.thumshirn@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <ef742ee32fd0623008114e929d9a3e688fd721f7.1680108414.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 12/19] zonefs: use __bio_add_page for
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: opensource.wdc.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/23 02:05, Johannes Thumshirn wrote:
> The zonefs superblock reading code uses bio_add_page() to add a page to a
> newly created bio. bio_add_page() can fail, but the return value is
> never checked.
> 
> Use __bio_add_page() as adding a single page to a newly created bio is
> guaranteed to succeed.
> 
> This brings us a step closer to marking bio_add_page() as __must_check.
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

