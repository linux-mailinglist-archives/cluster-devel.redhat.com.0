Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE816CF740
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 01:33:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680132787;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xGK1fR4AJk4u+9DybbTgcw+CN81GSRVKlqiyvFs5Dp8=;
	b=SA8tFnInuDQh7VN78744+w3SoQlg2Nw5AkeyQCFL0qdZFiwLL8royhxghtB33h14/2ZVeP
	0Q38zLiuFB/+gHDb03Yz+EPjg4/9GwZM0OkA6FOwOZqGhqQu5K73IWIRiQsgHrE9Kb/TQ0
	kQPUEm8xY2SId4/vWuYR57XZsF56hzw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-UMkpm8ItOAeFAVk8A9BHDQ-1; Wed, 29 Mar 2023 19:33:04 -0400
X-MC-Unique: UMkpm8ItOAeFAVk8A9BHDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3313B101A552;
	Wed, 29 Mar 2023 23:33:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2737B18EC6;
	Wed, 29 Mar 2023 23:33:03 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A67921946595;
	Wed, 29 Mar 2023 23:33:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 553FE1946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 23:33:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 415D4492B01; Wed, 29 Mar 2023 23:33:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A74E492C3E
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:33:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EDF11C05194
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:33:02 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-27l8FHL-PkSxd_dyz2gosA-1; Wed, 29 Mar 2023 19:33:00 -0400
X-MC-Unique: 27l8FHL-PkSxd_dyz2gosA-1
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="338903915"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 07:31:53 +0800
IronPort-SDR: 2JeSgp+aQzGqyg59eUwHu6l9rjLNi0V/OC4KtEivsrcYCBaAh1NkgrX/hytAR0hqOF/KBjIl+4
 KB3IjjrSUOsXWu9VKJs7yhhcYu/fj3xv43sxbnTpacAeMwePiUod6m2B25XENSsG4kXWp8ai9X
 BQu4jU52bcLtEc5FKmTiTyBoMrv2dhnpHAepiUWHpGlt5VjVrBtzNsW4jpF9w4sXkIK4QSBpTK
 BiYaGgFzy+UStA3aJgJKZxbOt6i4FUR8EB1sCk813k6Jq5yVi/Z5oYLYtzaBIl4tEWDWrsRQCA
 Ofc=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 15:42:20 -0700
IronPort-SDR: SGvIvH1eWHdWDtV7de2QKDBDpb7x4+poEAKthg6olmj5N/WMA35kXvvVFTkLzPv0pc/tQCBCOA
 mPrh89Cc3I8cb1KzsYzKnAn4nRcLhEn++NYrEfc9lssmAzBZJK8aBrwaCXypitgzG8ZhdZSOop
 jjvuCYxEu3LSF3IL+y3eJVfs6PsszlplwuLV/ue8bNonT+lxCz5KOVPGpZUaPbmlzFKSVQou+2
 jMzzJvx5rZOMvwa8YWQ+Xode54d70ZhxTT0WFgUiocKueclAxFueocYqxIUy2je9sbHaAM8PrZ
 zqA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:31:53 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn2rS48sgz1RtVn
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 16:31:52 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id ZLsKmZP8AHqa for <cluster-devel@redhat.com>;
 Wed, 29 Mar 2023 16:31:51 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn2rP0PPLz1RtVm;
 Wed, 29 Mar 2023 16:31:48 -0700 (PDT)
Message-ID: <c90afdff-55c6-a4f2-0ad9-a7bb30e6c214@opensource.wdc.com>
Date: Thu, 30 Mar 2023 08:31:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <55ec6659d861fd13e8e4f46d3e5a7fbad07e3721.1680108414.git.johannes.thumshirn@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <55ec6659d861fd13e8e4f46d3e5a7fbad07e3721.1680108414.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 05/19] md: use __bio_add_page to add
 single page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: opensource.wdc.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/23 02:05, Johannes Thumshirn wrote:
> The md-raid superblock writing code uses bio_add_page() to add a page to a
> newly created bio. bio_add_page() can fail, but the return value is never
> checked.
> 
> Use __bio_add_page() as adding a single page to a newly created bio is
> guaranteed to succeed.
> 
> This brings us a step closer to marking bio_add_page() as __must_check.
> 
> Signed-of_-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

