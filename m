Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E34BE6CF7DC
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 01:58:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680134329;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F5o74pGkof5L83tXVvBV5KpnClJIqJsUfyGloBtTHts=;
	b=Ts08Y5nzcD3K0Z7MtTV3e9vk//hTJoquYZUpmU/TIKW+c1EcEyh5HUo9f6gZYNL4qZcKqo
	y19fUux/rq8QyDY2H1dCKLMNGIbQY8e1/uB/Y2Fh7Wel0IoSWPJxgfJV3KSZ/wDSSWwNKT
	IvMgjPv9E+2cn4VFB+vJvo2QfNm7GiQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-plPN7UlLORu6KS6FAweS-g-1; Wed, 29 Mar 2023 19:58:46 -0400
X-MC-Unique: plPN7UlLORu6KS6FAweS-g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AD908028AD;
	Wed, 29 Mar 2023 23:58:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E2AD492C3E;
	Wed, 29 Mar 2023 23:58:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E1911194658F;
	Wed, 29 Mar 2023 23:58:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 94A221946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 23:58:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8337B440D7; Wed, 29 Mar 2023 23:58:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B3B718EC2
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:58:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 446983802B82
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:58:44 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-BH1KZ7rYO5e5npZ7iAio6g-1; Wed, 29 Mar 2023 19:58:42 -0400
X-MC-Unique: BH1KZ7rYO5e5npZ7iAio6g-1
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="225114698"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 07:58:40 +0800
IronPort-SDR: +hEZ2TjPIv03I8k6J6jSN4e2eKdjEeBcjGzSfMw8sq0MWGnLUTrTR42n3M8r+NG7aEINgdJMhE
 kpXAcJAzYMdDgUzhHRTshYUPlIjcB/vQkj4ui8MZGfIVRqL3c+w35uy5DvlTZLeXq+IK2A6Wx3
 /NCfprlFh07Y0Nl4Mu9qlOVgoVvQhUsSHeYHEVHo1lPTEwILFouU4/k/EBj/qPng6IfmIRd4lk
 hrJ3e/ahbX6JmABaE80ZfmOKK4WWck2pBKIlT5KSeuaBWjkdNUXM2UvHqLplrkEdZMBVxgLRsa
 CNM=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:09:08 -0700
IronPort-SDR: 7x1Oa8U5tI8ZCj1J56ntPWYXkrUTtN201ongaZCm+5gPMbIoMTs3NYl76wEXQRTo14kwOU7c4j
 PW3EF1ObN5ijkplCpNYcN+jytN9I/a7a5CusVkB5LLcVWuwfoAzK0eJRQmXJJsOWFNv2hdpkEK
 bUeS/bIrG1FDjwsT8aDfBb82otDSK0G4oa41o6Set4iIEwVqNLu06VAEi3fwSEkONy5V/vkEmp
 mpqDKXYQX7Dqlrym0kLgl84GPcs1Dx+9OlabHdbgUKFAc20R6x5tSR4cCt0FkmoknqO3eodSGK
 UAo=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:58:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn3RM705rz1RtVw
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 16:58:39 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id SYEUDf5H7Efw for <cluster-devel@redhat.com>;
 Wed, 29 Mar 2023 16:58:39 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn3RJ0pDLz1RtVm;
 Wed, 29 Mar 2023 16:58:35 -0700 (PDT)
Message-ID: <e088f7f1-827e-f0e5-4fc0-df0dcefbb873@opensource.wdc.com>
Date: Thu, 30 Mar 2023 08:58:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <350bd9c62ce575267a2b38625ab767c332429bc1.1680108414.git.johannes.thumshirn@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <350bd9c62ce575267a2b38625ab767c332429bc1.1680108414.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 19/19] block: mark bio_add_page as
 __must_check
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: opensource.wdc.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/23 02:06, Johannes Thumshirn wrote:
> Now that all users of bio_add_page check for the return value, mark
> bio_add_page as __must_check.
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

