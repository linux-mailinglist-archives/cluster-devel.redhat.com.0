Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6186CF78E
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 01:38:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680133132;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+5HwXhhrhHrQfkuI7Y7ovm+xrXzXoZBgfLszf1ePCZs=;
	b=XV54G262B4YMi9PsC95log5IhXxcZqsyx5HOHi9QSIikZ+Rfgc89h0WoG2WjhIvLt7s5pf
	s4z0AJZzpP0IPV0lHHqCsulTLGytkjH4aJuH03b0lDnHCU7dAQ2l/d7/Nid24fIZnfH5HS
	BVjJj2N7gejNh4XTMV8tTgNNXu1fhOw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-486-9-3ByphuO5qovd2ER_1wwA-1; Wed, 29 Mar 2023 19:38:48 -0400
X-MC-Unique: 9-3ByphuO5qovd2ER_1wwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6BCB101A550;
	Wed, 29 Mar 2023 23:38:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B5102166B34;
	Wed, 29 Mar 2023 23:38:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E0ED194658F;
	Wed, 29 Mar 2023 23:38:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E2BC21946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Mar 2023 23:38:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C2EF4492C3E; Wed, 29 Mar 2023 23:38:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB786492B01
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:38:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 569CE1C05194
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 23:38:45 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-d9KDhmLtOyqRnI_Ax3c8Zw-1; Wed, 29 Mar 2023 19:38:43 -0400
X-MC-Unique: d9KDhmLtOyqRnI_Ax3c8Zw-1
X-IronPort-AV: E=Sophos;i="5.98,301,1673884800"; d="scan'208";a="226828804"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Mar 2023 07:38:40 +0800
IronPort-SDR: Gr1ikDUu/gGujrPfsTijlvRhqBm9CSWrp4ikgHh+oNUD1Vrm62+Zg2b5ws/jfCfwwmvaF3Gngy
 DqY/IIEicB1sF1IhPL8HdNjeN+dgwGCGgtCFBE05J9UmnjlbLIKf7CIp6e3bmcAzP1acPbffmd
 IfvinWED0f3qi8vVHLLFNJ9Ooh7zyJGiIQ021EU28kM5eGOalCelBGJVJUpXZupqXrCMau3da2
 k40uSFCOGR68xQ2fxQGJ85UOQ2Pz5LirOV9LOvwPPhm5hWPsq5iaZAcSCnIP7eZaxyfHiKUmY/
 S2Y=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 15:54:49 -0700
IronPort-SDR: 4MqQ+2nDPHb19Cr0rN/ldJ6tj2/6otokO3msY9/zp48YAsyc49/Fgd2XYcI+fQjjKYcmuMp9F3
 0xIIuTF+xRmcdROWsWmfriYaCz0w1NSju3Ta1PRN2sp+QMUyexEwRFTE5qxYR9WLv/plk+zmWa
 6NOdnKDSaqk1+D+uUWOK5HotVL1I2JpWPhcCNCsFVabq7VePCIG9/ClK9OcNQaLD83s8WXiKt1
 TCk1yp5nS/VNLrZgEnZhKe+4xBg9qcHt9HSE+vdhOkH3T9PKXXXtsQiHFxhI/YwboLbfhNlYna
 UvQ=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 16:38:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pn30J3ypYz1RtW4
 for <cluster-devel@redhat.com>; Wed, 29 Mar 2023 16:38:40 -0700 (PDT)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id FULS-pv9gvO3 for <cluster-devel@redhat.com>;
 Wed, 29 Mar 2023 16:38:39 -0700 (PDT)
Received: from [10.225.163.116] (unknown [10.225.163.116])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pn30D5vG4z1RtVn;
 Wed, 29 Mar 2023 16:38:36 -0700 (PDT)
Message-ID: <84d3057f-58b3-b3da-a473-082806c4b5f2@opensource.wdc.com>
Date: Thu, 30 Mar 2023 08:38:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Jens Axboe <axboe@kernel.dk>
References: <cover.1680108414.git.johannes.thumshirn@wdc.com>
 <8758569c543389604d8a6a9460de086246fabe89.1680108414.git.johannes.thumshirn@wdc.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <8758569c543389604d8a6a9460de086246fabe89.1680108414.git.johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH 16/19] md: raid1: use __bio_add_page for
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
> The sync request code uses bio_add_page() to add a page to a newly created bio.
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

