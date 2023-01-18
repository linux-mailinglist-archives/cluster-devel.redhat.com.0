Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F42767172D
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 10:12:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674033153;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pH64UpBTf3brAXZW7SCOQ3dZCcTWBJ2EkJWg+Vg7BLk=;
	b=DfZQdudBAYlGpUwLnu/yn/AhcPkYbw5Rb1bLuMowwimxGaQhCv3/bKa8FxvWhgKm2NAC1d
	d+9YiA28NOV49e+1HeTGLJFkO7rMMMJjUDgG8Tf6Y5MzlayG4B/NgreSMpekGogMIImndr
	G+yVSWtS7b9gyKQHguHb4ghF50C/RhY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-YFaRBzBYPnKdPiAAAndHQw-1; Wed, 18 Jan 2023 04:12:28 -0500
X-MC-Unique: YFaRBzBYPnKdPiAAAndHQw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1B343815F6C;
	Wed, 18 Jan 2023 09:12:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7251492B00;
	Wed, 18 Jan 2023 09:12:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6A2F41946A6D;
	Wed, 18 Jan 2023 09:12:26 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 109E819465B7 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 09:12:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B3BBA1415108; Wed, 18 Jan 2023 09:12:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB5FD140EBF6
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 09:12:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FB551C0758B
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 09:12:24 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-7uljCPPXNduApIIeQhpJ5w-2; Wed, 18 Jan 2023 04:12:14 -0500
X-MC-Unique: 7uljCPPXNduApIIeQhpJ5w-2
X-IronPort-AV: E=Sophos;i="5.97,224,1669046400"; d="scan'208";a="226119074"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2023 17:11:08 +0800
IronPort-SDR: n41XqB+ohdnxBHui5Djhbgn84DEUl67hh1jfHTLSL/zvivkTRnx46HEVF8CKYBon2SYol0THDn
 yKPiSMU1O9EKN8GCyws5iWcxQqsFZmPVwlKPsW2/SCDoZVobtEwp6b+L9gFefHs/Stcw02/ZRF
 rRYOGDHDcL24vDJ4mNQrPfwASc5ObVISdWqZrjvxsAas/6WWQ35fi6uHzjLQ5L2T5IFeh7cqMm
 ZV0djXtikubTYq2KVX256hEQ+HVFoAJ63VBr9S6p1DsjP0/v93kh7chNUnWvEbmOt5RGnvmL1E
 J3M=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2023 00:23:04 -0800
IronPort-SDR: UhmXjSaRcfgg8UaS8DhSrhtlrWsMJuKUpStniiOQjU6838j/ubR8SuaBKYO6eX6/p3G2Ool7nv
 V86JJjFEtuqu2pBv2xj8v4MVIkBRbXsaHquwuULbyKvwkTFdY84C5A1OUkWtpQ/0gSoeDXhh68
 igHrOS3qMP9128L7Xa9io/j5AD8WE2WZCBseFR78GQsdX2f5byqlFIylrm5TgkFAPP4m8ICvfc
 ww58I9GC4XU8Nt/JCsu99aow5edzMTtem3RUbY6mmhRtt+MOu+5IZ6MSjqgUsDj8t7b7sIVNiq
 wHI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2023 01:11:09 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Nxg3b6Dlvz1RwvL
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 01:11:07 -0800 (PST)
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026)
 with ESMTP id ZRYpCH0Oi2OJ for <cluster-devel@redhat.com>;
 Wed, 18 Jan 2023 01:11:06 -0800 (PST)
Received: from [10.225.163.40] (unknown [10.225.163.40])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Nxg3Y0J3Zz1RvLy;
 Wed, 18 Jan 2023 01:11:04 -0800 (PST)
Message-ID: <3855fa1d-ec30-2c63-c5e2-b388e8a02b3e@opensource.wdc.com>
Date: Wed, 18 Jan 2023 18:11:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
To: Christoph Hellwig <hch@infradead.org>, "Darrick J. Wong"
 <djwong@kernel.org>
References: <20230108194034.1444764-1-agruenba@redhat.com>
 <20230108194034.1444764-9-agruenba@redhat.com>
 <20230108215911.GP1971568@dread.disaster.area>
 <CAHc6FU4z1nC8zdM8NvUyMqU29_J7_oNu1pvBHuOvR+M6gq7F0Q@mail.gmail.com>
 <20230109225453.GQ1971568@dread.disaster.area>
 <CAHpGcM+urV5LYpTZQWTRoK6VWaLx0sxk3mDe_kd3VznMY9woVw@mail.gmail.com>
 <Y8Q4FmhYehpQPZ3Z@magnolia> <Y8eeAmm1Vutq3Fc9@infradead.org>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Y8eeAmm1Vutq3Fc9@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [RFC v6 08/10] iomap/xfs: Eliminate the
 iomap_valid handler
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
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
 =?UTF-8?Q?Andreas_Gr=c3=bcnbacher?= <andreas.gruenbacher@gmail.com>,
 Dave Chinner <david@fromorbit.com>, Matthew Wilcox <willy@infradead.org>,
 linux-xfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/18/23 16:21, Christoph Hellwig wrote:
> On Sun, Jan 15, 2023 at 09:29:58AM -0800, Darrick J. Wong wrote:
>> I don't have any objections to pulling everything except patches 8 and
>> 10 for testing this week. 
> 
> That would be great.  I now have a series to return the ERR_PTR
> from __filemap_get_folio which will cause a minor conflict, but
> I think that's easy enough for Linux to handle.
> 
>>
>> 1. Does zonefs need to revalidate mappings?  The mappings are 1:1 so I
>> don't think it does, but OTOH zone pointer management might complicate
>> that.
> 
> Adding Damien.

zonefs has a static mapping of file blocks that never changes and is fully
populated up to a file max size from mount. So zonefs is not using the
iomap_valid page operation. In fact, zonefs is not even using struct
iomap_page_ops.

> 
>> 2. How about porting the writeback iomap validation to use this
>> mechanism?  (I suspect Dave might already be working on this...)
> 
> What is "this mechanism"?  Do you mean the here removed ->iomap_valid
> ?   writeback calls into ->map_blocks for every block while under the
> folio lock, so the validation can (and for XFS currently is) done
> in that.  Moving it out into a separate method with extra indirect
> functiona call overhead and interactions between the methods seems
> like a retrograde step to me.
> 
>> 2. Do we need to revalidate mappings for directio writes?  I think the
>> answer is no (for xfs) because the ->iomap_begin call will allocate
>> whatever blocks are needed and truncate/punch/reflink block on the
>> iolock while the directio writes are pending, so you'll never end up
>> with a stale mapping.
> 
> Yes.

-- 
Damien Le Moal
Western Digital Research

