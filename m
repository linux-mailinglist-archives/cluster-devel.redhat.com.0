Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF68E6D5B7D
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 11:06:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680599174;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=P+IA0sfS8Hko6hpK1HZztJ6kiawc/hgiN78OoxbJlkE=;
	b=QHC8KcpnfCa/+GyKzEwfPQWOiuEnvnDHSp+ZOTs77oR7fnYU7MkEa1ZFOp/GLaQXU4fIDT
	rU61QVjCZqNlEs/o7g69pViYe/WMDFIfPyEAqmjjJaXWtEt+41PgBlRqfWHC8cw9yBsh7K
	bPJZST3HdvXmcPs0+puIjvK8sUgAUQI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-ozlsG83_ObG9b-6kp4Dn8w-1; Tue, 04 Apr 2023 05:06:11 -0400
X-MC-Unique: ozlsG83_ObG9b-6kp4Dn8w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D5DE385F37C;
	Tue,  4 Apr 2023 09:06:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 18B421121315;
	Tue,  4 Apr 2023 09:06:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 19C5219465B1;
	Tue,  4 Apr 2023 09:06:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 77A97194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 08:26:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 59713400F4F; Tue,  4 Apr 2023 08:26:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 519D9483EC1
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 08:26:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37C0D28135A7
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 08:26:37 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-xvL82K2DOranFR-Tr5Fwvw-1; Tue, 04 Apr 2023 04:26:35 -0400
X-MC-Unique: xvL82K2DOranFR-Tr5Fwvw-1
Received: by mail-wr1-f51.google.com with SMTP id e18so31860242wra.9;
 Tue, 04 Apr 2023 01:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680596793;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P+IA0sfS8Hko6hpK1HZztJ6kiawc/hgiN78OoxbJlkE=;
 b=UmR3DJMdS3kodNIerj+qT1TEyHqbY0l9USLOivkGdU6IKc5ykBMAEZbYN0GZRKIsoT
 gYrZWlq2f5HjLVLY1SE6sfRSUqCfQTAFK3inaL6tgueBYMqYhOcL3ffsZlYKgtB1CVsV
 dgqDhQjLqVAMRuWcU4OW/VL1Z6ndOcXbnz/zwQo8M1twOfcSz/F4guGTycbi9fb96tjn
 77WtRzzycgWXKS9yQjdebnzIi9fAXOQknWum3MmxXM1+7yG7OQvhxYGC9z3P94BBa4Mk
 tXnpDDM99vSQAyEXU9B7XgZ7aAzBJ0VDkN1vxXbxJli2Z7KPl/FZoEDXn492tjONqkJH
 Y01Q==
X-Gm-Message-State: AAQBX9dK1F2CrXJ1iDys7xvMKg/k6ETsKqmL2Ujd7lfLuBKnFtN9loBP
 iR6uTfB42lG2N9KDPkYR56M=
X-Google-Smtp-Source: AKy350YRAl3M0jE5+UynIwckjiW+CsHm28SGM1LHNiMQ7J8tXe8xmw1F2qmXD/R4sfgmgOX6wBeBhg==
X-Received: by 2002:adf:e0c3:0:b0:2cf:e747:b0d4 with SMTP id
 m3-20020adfe0c3000000b002cfe747b0d4mr940685wri.40.1680596793398; 
 Tue, 04 Apr 2023 01:26:33 -0700 (PDT)
Received: from [192.168.32.129] (aftr-82-135-86-174.dynamic.mnet-online.de.
 [82.135.86.174]) by smtp.gmail.com with ESMTPSA id
 t6-20020a7bc3c6000000b003ee1b2ab9a0sm14294575wmj.11.2023.04.04.01.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 01:26:32 -0700 (PDT)
Message-ID: <bbc98aa3-24f0-8ee6-9d74-483564a14f0f@kernel.org>
Date: Tue, 4 Apr 2023 10:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
To: Song Liu <song@kernel.org>, Johannes Thumshirn <johannes.thumshirn@wdc.com>
References: <cover.1680172791.git.johannes.thumshirn@wdc.com>
 <8b8a3bb2db8c5183ef36c1810f2ac776ac526327.1680172791.git.johannes.thumshirn@wdc.com>
 <CAPhsuW7a+mpn+VprfA2mC5Fc+M9BFq8i6d-y+-o5G1u5dOsk2Q@mail.gmail.com>
From: Johannes Thumshirn <jth@kernel.org>
In-Reply-To: <CAPhsuW7a+mpn+VprfA2mC5Fc+M9BFq8i6d-y+-o5G1u5dOsk2Q@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Tue, 04 Apr 2023 09:06:03 +0000
Subject: Re: [Cluster-devel] [PATCH v2 17/19] md: raid1: check if adding
 pages to resync bio fails
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 Damien Le Moal <damien.lemoal@wdc.com>, cluster-devel@redhat.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Dave Kleikamp <shaggy@kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 David Sterba <dsterba@suse.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 31/03/2023 20:13, Song Liu wrote:
> On Thu, Mar 30, 2023 at 3:44 AM Johannes Thumshirn
> <johannes.thumshirn@wdc.com> wrote:
>>
>> Check if adding pages to resync bio fails and if bail out.
>>
>> As the comment above suggests this cannot happen, WARN if it actually
>> happens.
>>
>> This way we can mark bio_add_pages as __must_check.
>>
>> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
>> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
>> ---
>>   drivers/md/raid1-10.c |  7 ++++++-
>>   drivers/md/raid10.c   | 12 ++++++++++--
>>   2 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/md/raid1-10.c b/drivers/md/raid1-10.c
>> index e61f6cad4e08..c21b6c168751 100644
>> --- a/drivers/md/raid1-10.c
>> +++ b/drivers/md/raid1-10.c
>> @@ -105,7 +105,12 @@ static void md_bio_reset_resync_pages(struct bio *bio, struct resync_pages *rp,
>>                   * won't fail because the vec table is big
>>                   * enough to hold all these pages
>>                   */
> 
> We know these won't fail. Shall we just use __bio_add_page?

We could yes, but I kind of like the assert() style warning.
But of cause ultimately your call.

Byte,
	Johannes

