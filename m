Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 520116CF762
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 01:34:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680132885;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VYikRWiObQ/nCMrSuiZpHFYbFGp2QW9DKg2Cx0mjylw=;
	b=D/LrNZWhbXa+lHJeq+G54Oj8Nj8rzqldXIgLIbzGD4VPIb2zQJO5wBNiUgNoWJhCccRbWC
	dKX4O0V6MXqgTKSryKA8evMGh0DETtwNs2/fwd1xcn81mJ7Iqg6AzZNNQUO/e07D92ci5C
	x2TAtSrCeEMyCreUMX+3j+Vuo3V2U2U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-sOpLPxqpMkaPSXNh2mUnfg-1; Wed, 29 Mar 2023 19:34:39 -0400
X-MC-Unique: sOpLPxqpMkaPSXNh2mUnfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 573812814247;
	Wed, 29 Mar 2023 23:34:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 496AC14171BB;
	Wed, 29 Mar 2023 23:34:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 19FE3194658F;
	Wed, 29 Mar 2023 23:34:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 701241946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 23:34:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2856214171BB; Wed, 29 Mar 2023 23:34:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 203EA14171BC
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:34:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42A53800B23
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:34:35 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-iikVU9haNPub_jX9QrODkw-1; Wed, 29 Mar 2023 19:34:33 -0400
X-MC-Unique: iikVU9haNPub_jX9QrODkw-1
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="226648282"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 07:34:32 +0800
IronPort-SDR: OWwXYcImkc9hVd7hJ5ywb3AjyqYe6S8swqEiTUNmUe26ciyxdHYefBkfou4GjhEyyVq3VFcBl4
 pzVHdZKfDKpDX1zMoP/RF5erWPe8x1peRqjE858mW+Mqvl0Ub1dEjtLCr+6ABmDRJhrRyPrdc1
 ZIsvQ7qqB6cSDH42xi77vj30TWs0mWrjr1ys9wW5CjA0jTWiZunL03Mnv4Ke7SXo2Lbso75iCv
 yU98+k8lfnxyTRKSjp3ZXs8Eqtu/49T7Gr4a2JzQl5cEk2B/529krEyNC8vcpRbdoqXHRyS8gk
 FeM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 15:44:59 -0700
IronPort-SDR: qDyB5lWcO1Y3qsE53Mmh0WPeH8XmWKrrkHYm8z8jq/k8FuiIxEIa0WeCVdA/1BSGJUBNWamt9/
 pfoEXOQ2FjvH2XvQNvLz2drYG+p9p2qqqyHaKXg8e0tqT4P9eE+rFHzg6wxhRJXeJpdo5CaGNf
 OiFjf+hRvaVISRFuzXTse2VUzZOWZbvbZZscQDMKe4nFJg079IWJPYQX3Gu1zfhYgtfOuak9Wj
 uNR76OXiF0q/9ag08YsjRf3sKLHzod2OihkJp1R9bB682W41qqyBjaarAyKf8IyHH9+JoQJm6t
 6BI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:34:32 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn2vW5qCZz1RtVw
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 16:34:31 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 8FwXnRBvTjWx for <cluster-devel@redhat.com>;
 Wed, 29 Mar 2023 16:34:30 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn2vS0ZGvz1RtVm;
 Wed, 29 Mar 2023 16:34:27 -0700 (PDT)
Message-ID: <d07c2d82-0edb-6bf1-b97e-07cd66a33bbb@opensource.wdc.com>
Date: Thu, 30 Mar 2023 08:34:27 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <902f83de56c67b333959d8b8b4cf37a25414e927.1680108414.git.johannes.thumshirn@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <902f83de56c67b333959d8b8b4cf37a25414e927.1680108414.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 10/19] jfs: logmgr: use __bio_add_page
 to add single page to bio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: opensource.wdc.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/23 02:05, Johannes Thumshirn wrote:
> The JFS IO code uses bio_add_page() to add a page to a newly created bio.
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

