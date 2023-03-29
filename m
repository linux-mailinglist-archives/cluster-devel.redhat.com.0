Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDA26CF750
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 01:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680132831;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TlaulgggJ1UYomGkGAhVex0DHpTSa7AVrgYQKWm5mO8=;
	b=NKv6XbW1tjaeuBKQjCjXIS6W1kZKYknvZqxIDMq5YyGLddDeJCvQCj65uFvvfB0gA1zvRe
	AaVeMJeitSHEUlvJ02bIK7o1+kMozcR3bK+PyJFqVnWAUC4KFojAAj5oBlTdU5keTSmwqJ
	7u0U4zmYThTm43O8ksFQIw05kk7oNGk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-5h7hI7hdNHy2PVE2YW-NBQ-1; Wed, 29 Mar 2023 19:33:46 -0400
X-MC-Unique: 5h7hI7hdNHy2PVE2YW-NBQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 402863823A09;
	Wed, 29 Mar 2023 23:33:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35369492B00;
	Wed, 29 Mar 2023 23:33:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 224EC194658F;
	Wed, 29 Mar 2023 23:33:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 829F21946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 23:33:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6217914171BC; Wed, 29 Mar 2023 23:33:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A07C14171BB
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:33:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DEEA801206
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:33:43 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-_4sw1I2cMOaX9Nk4SidjYg-1; Wed, 29 Mar 2023 19:33:40 -0400
X-MC-Unique: _4sw1I2cMOaX9Nk4SidjYg-1
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="231808664"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 07:33:39 +0800
IronPort-SDR: S0Jz+0L5BhtlOKui8AEXaAJOAhcYyx/1alQcMFYWIk4E6+L2HRrFoDCXDuSfML1kXc0rMJ89uu
 Du9Pd6br8ItgdNFFboUuFRhKKOmrYorokFTPWN/KaOSEhS7wUMaJIC7cMRVCb/LYA5S8QF/YjF
 JdYpUZ6KMbOF9JTWpbx1HrkmuGssHskIOkHATAA3AOBhtElVATNun2ZqANH4mU2EUK2ty8ZraD
 emoye2um3Z/MlkvsfkpdOIuykPosFw44sbaU2zKPDuZWVINN1IH5cAgQ+hmU+WoPudnJaULxld
 TZ4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 15:44:07 -0700
IronPort-SDR: DtMSFFd/N2wSqGXTmiSXzwMhLhF7tJk4uxUughcchiM07rt3KZaiWbfmxuaZ3BEOxzN0ZqtrVJ
 eb0zBSo95LyQDRMxtPL6Bxjk6B92inIbBXn14n7IPjq8gdKmUUBXigWhm7PWCQFLvKzXare0Rf
 Lg8ZFQE4u6Wz6xvgkcUN5FTIqh5/jdaRqu5ytwQps5jZZlJ++J9XBJMSqT9OzsnIlLpnRBBCX0
 jyyN5jTsjEryiFyOyTOt4qwPf2ll2VPVh8pa1CZXhH9g0mVYjWs/CLLdIrFvuh9XHwtj3qWZ03
 twU=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:33:39 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn2tW1BJxz1RtVx
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 16:33:39 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id GpsMAuTSsDhG for <cluster-devel@redhat.com>;
 Wed, 29 Mar 2023 16:33:38 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn2tR3Vpwz1RtVm;
 Wed, 29 Mar 2023 16:33:35 -0700 (PDT)
Message-ID: <922e7921-c70c-cda6-aa5a-07ed44596d4b@opensource.wdc.com>
Date: Thu, 30 Mar 2023 08:33:34 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <faae16612c163bd6e65cf3d629b0a3c65666821b.1680108414.git.johannes.thumshirn@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <faae16612c163bd6e65cf3d629b0a3c65666821b.1680108414.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 08/19] btrfs: repair: use __bio_add_page
 for adding single page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: opensource.wdc.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/23 02:05, Johannes Thumshirn wrote:
> The btrfs repair bio submission code uses bio_add_page() to add a page to
> a newly created bio. bio_add_page() can fail, but the return value is
> never checked.
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

