Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4326CF721
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 01:31:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680132672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1Dmy00NSi1jBvY5axs+SWSHXNt2uzOUpyhLS1r8T8Ig=;
	b=PB1AvBNtbjOfpdt8wMSH8wnJ63dkJAlpBZ6xjww06NjeuR0dAqOc0/31Pg5abRQ727xE6U
	rlxi4ivVnR4rmFYg9+ntJJ7gUQLeA3C6Ay+0tn7CAUSGXOnMSujnreVcu/nElQhCFjEY3Y
	/eYJy+baQIsF+VvkIQBKG9bUSKm49pg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-cxRfEff1MnaJbF4p8r35CQ-1; Wed, 29 Mar 2023 19:31:11 -0400
X-MC-Unique: cxRfEff1MnaJbF4p8r35CQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5683E811E7C;
	Wed, 29 Mar 2023 23:31:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A686C15BA0;
	Wed, 29 Mar 2023 23:31:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1EADB194658F;
	Wed, 29 Mar 2023 23:31:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 067161946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 23:31:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DCA3818EC6; Wed, 29 Mar 2023 23:31:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D4D0018EC2
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:31:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4855281424D
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:31:08 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-BfEhwAbHOoGjMHiX-uh93A-1; Wed, 29 Mar 2023 19:31:04 -0400
X-MC-Unique: BfEhwAbHOoGjMHiX-uh93A-1
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="225113376"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 07:30:00 +0800
IronPort-SDR: V+ljnARJSh82KdceZt4CYcHwl6fDi/90VBnONIpRtWl9ZpJmF3fsBzINcXSF9DfHIWWj4s5bxV
 NDZsO9sOpOcytHwTrkj+mg+pCGBiWRk4Ze3DLz2rJems4JYkTLw+VfS8WmHVdEZ8+WR3MCnW88
 id2hvPHLzTNk53gYkSDGLJqy8XP65baOPhUFF4JK3CODEuYKqI4pqphswSjLGfMfPpkMIVD57l
 BE3ehqXrP88qJ0wM4k9L8fT9QC5JdkSuiEgzec3VMty+b2O4QPgzsLE7W5UTBZ2e/BMlvIMHq7
 RTY=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 15:46:09 -0700
IronPort-SDR: bUAwsv1yy4VQUZLJUat6xsQRFda8/E4QD4aGxY3VyqxcdKrgqLpmsmOCQ0t1x0FyVXkfcGQVVP
 8dSErkAWzmhN87bxMZUdGe8Avxbca0JMvCSKTwu2/yTG8jS5Pc6U3h6onkNRsxXNqtMbFvpw1q
 8wMtF2Ma6nsugsUXt2U6DlIKy+Bfo554kgWEoU1hxze+tVTPcZ2DGRFA+tWwNpK6MuuS713Bck
 DKlpyaCpLs2KOJ4pKtIOQWiztbY6jmN+hi3vmkbm+L/NNSvCNNfUtAcj/kJZP0vBFCcHIfNbdI
 4uY=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:30:00 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn2pJ1mNfz1RtW2
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 16:30:00 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id 4G5c7wNEUZ8x for <cluster-devel@redhat.com>;
 Wed, 29 Mar 2023 16:29:59 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn2pD1Xt9z1RtVm;
 Wed, 29 Mar 2023 16:29:56 -0700 (PDT)
Message-ID: <ec7a0c67-a0b6-64d7-0f3e-dee9744daffc@opensource.wdc.com>
Date: Thu, 30 Mar 2023 08:29:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <87d0bf7d65cb7c64a0010524e5b39466f2b79870.1680108414.git.johannes.thumshirn@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <87d0bf7d65cb7c64a0010524e5b39466f2b79870.1680108414.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 02/19] drbd: use __bio_add_page to add
 page to bio
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
Cc: linux-raid@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 cluster-devel@redhat.com, Chaitanya Kulkarni <kch@nvidia.com>,
 Song Liu <song@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 David Sterba <dsterba@suse.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: opensource.wdc.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/30/23 02:05, Johannes Thumshirn wrote:
> The drbd code only adds a single page to a newly created bio. So use
> __bio_add_page() to add the page which is guaranteed to succeed in this
> case.
> 
> This brings us closer to marking bio_add_page() as __must_check.
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

With Matthew comment addressed,

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research

