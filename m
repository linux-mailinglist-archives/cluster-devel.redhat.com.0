Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8756CF728
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 01:31:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680132690;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SuIhUSYu9mlDLVk/42hpUGYhE6FgIDE6xMsSHGOH+GY=;
	b=NmQQDMvFz+GX/z6Pp3dITEWEBHAGa+4XKtvHwJxrWRP6bAG5vWJmTwR/q6zQGp6yQrzhxF
	YsWiyEPL4OwLpB8ugWvOqlvXlNtwuqJ6kl1HxVqnjYfUmNP3mX7Ch3v1cqwPAcMKBPnti0
	yJblJwQSnfqI074YzjHsdtERzRJUkAw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-282-TSXTqpjKNUSyAy5lyQ2e2A-1; Wed, 29 Mar 2023 19:31:25 -0400
X-MC-Unique: TSXTqpjKNUSyAy5lyQ2e2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA6F73823A13;
	Wed, 29 Mar 2023 23:31:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9ECE1202701E;
	Wed, 29 Mar 2023 23:31:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7C545194658F;
	Wed, 29 Mar 2023 23:31:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B704B1946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 23:31:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9C2BB18EC2; Wed, 29 Mar 2023 23:31:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9450218EC6
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:31:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6505B101A550
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:31:22 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-8qgVAeDOPpq_v_iaZ9rJCA-2; Wed, 29 Mar 2023 19:31:20 -0400
X-MC-Unique: 8qgVAeDOPpq_v_iaZ9rJCA-2
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="231808512"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 07:31:16 +0800
IronPort-SDR: 8R/tRbFpUihVlsHQKdVkBs7wPseJez4zKOWwQf/7+YwfJfc0oGQzGYPaRnOpml3bEXAPbI/egj
 Uh1Kai6dmZXANrrmPowKArgbOhUPlms36bP3iexcTCBkOITnTEI7i1JOubXwDm8HI87hiGEK3G
 9eGYGOrQayddS0DChllg0SKCj2GOJupgmpIs/TFQn/cVZeM3oWvPbPjyCGX+1LIyIOg3U3g1jK
 YyxEI5b7c19uXQEhR6l+CtiWEAoAhGieEOlZ6kkThmQH8LrMwbneajRHCI4Nnw98Rd9z944UJX
 MWA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 15:47:25 -0700
IronPort-SDR: 5U5G1pViIvuycyOscFd9CPsaCo+npKo5i18OsgJPpG3PWXOTKBh7AadtHK2sXZShOi/BCUD7Ck
 t+nBmWuJqS/Kfe/Ty4MebsCw3He3XEJDQFiGFi9J9YExyRzaMtOOW3sjQ4f6maInJKbjB05MJ6
 CY3rjyzDY+G17SDy3JmS7Kzhh1fRAXADbiXunANxVIlDrGHq6FKBQMNbcsP4s+5vOgZtJadvEw
 5FE7Mch+u4m2TQ1PVUDqs1zAMmgf80CWmfMbmi1YSgmPYBOuD9E4DhomTrfwR/fSrNNJUxHM05
 ZII=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:31:16 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn2qm0Dn5z1RtVx
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 16:31:16 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id JUKaS09AOUvU for <cluster-devel@redhat.com>;
 Wed, 29 Mar 2023 16:31:15 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn2qh3MbGz1RtVm;
 Wed, 29 Mar 2023 16:31:12 -0700 (PDT)
Message-ID: <3ba0a4e1-7b75-9d0c-d6d3-dfc3d4bbbef0@opensource.wdc.com>
Date: Thu, 30 Mar 2023 08:31:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <56321f8ef1e70e9e541074593575b74d3e25ade2.1680108414.git.johannes.thumshirn@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <56321f8ef1e70e9e541074593575b74d3e25ade2.1680108414.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 04/19] fs: buffer: use __bio_add_page to
 add single page to bio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: opensource.wdc.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/23 02:05, Johannes Thumshirn wrote:
> The buffer_head submission code uses bio_add_page() to add a page to a
> newly created bio. bio_add_page() can fail, but the return value is never
> checked.
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

