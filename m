Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F6F7166CA
	for <lists+cluster-devel@lfdr.de>; Tue, 30 May 2023 17:15:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685459704;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tp/ySIwwm4tl/YIed7+PvRfuzdgg1UhCSe2CIK+Ly+s=;
	b=Kmvuxfiv24XNiOMkNt8YTayT2asAzUAERUhHr7YsVxrNf60tgqM0L4AUhdQxqwY7MlQgFj
	eyjnzEPIL+x7rXKlyLzG5Q/EfTHfpmBwXzfY5WbXnckqXeo4miQYcwMjEF2tfQQNH8/hks
	quboZD+6ZP/XCTXpr/9zPsidHBjbguc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-x7U552iUPqmDKALzT1hVgQ-1; Tue, 30 May 2023 11:15:00 -0400
X-MC-Unique: x7U552iUPqmDKALzT1hVgQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FAB73C1351E;
	Tue, 30 May 2023 15:14:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 723382166B25;
	Tue, 30 May 2023 15:14:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EDCBF19465A2;
	Tue, 30 May 2023 15:14:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id ED0C21946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 30 May 2023 15:14:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E0E2540CFD46; Tue, 30 May 2023 15:14:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8F9240CFD45
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 15:14:57 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3F6B185A7A5
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 15:14:57 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-s6KcVz9gPgGyfCeKB9CH0w-1; Tue, 30 May 2023 11:14:50 -0400
X-MC-Unique: s6KcVz9gPgGyfCeKB9CH0w-1
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-7747f082d98so23672139f.1
 for <cluster-devel@redhat.com>; Tue, 30 May 2023 08:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685459689; x=1688051689;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tp/ySIwwm4tl/YIed7+PvRfuzdgg1UhCSe2CIK+Ly+s=;
 b=apxiS1k3jPnloo789D/NEw8vUOMqTaq3Og1FH58fkDkI0K80FjxnKqA9zqb9V5f0t8
 m9ByG7sv1b0zJJFjw4O1tJcsJQCxLBFVALFRv9dvK4SqDJEoeAZKLzyE47zh1jROGjP/
 c7eKAqoeHOJGjso6m5K0JDC+/6UCW2awRpd8NmoNNbW5b7pPRh7T4mYRsLjAl5hxe7ln
 rrJEv7IU0H2BVjJfYrU0gwmzfOJySjzRIjSX+7tIrCFfcnC0mvayJsOyjPCVb8L2XI+b
 jNuGUch6+bpJmoTSyRgu8v58WiKEPvt0WqET1EjB2g3Ww/6SVOnWKAa8OwdfQRyq4Ujw
 x48w==
X-Gm-Message-State: AC+VfDz3vPkY+ji3sCAiCatPrmqjYFyj7rr+g0i/DRaQ/durEMNpWvJ9
 11r9Q7uqjNqQtUpT/c/7+QPRXQ==
X-Google-Smtp-Source: ACHHUZ5N9fZwp0C4udilf2wbvP/vXNdHUtnkR6kuIJ7hXoCHV8PblKq9G6f5VgAxs1O6gmhEp8JA/Q==
X-Received: by 2002:a05:6e02:ef3:b0:33b:85f4:2edf with SMTP id
 j19-20020a056e020ef300b0033b85f42edfmr1197714ilk.1.1685459689656; 
 Tue, 30 May 2023 08:14:49 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 i9-20020a056e02054900b00325df6679a7sm2575003ils.26.2023.05.30.08.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 08:14:47 -0700 (PDT)
Message-ID: <bc5833bc-1c78-8d9b-69f8-1401b673b861@kernel.dk>
Date: Tue, 30 May 2023 09:14:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "snitzer@kernel.org" <snitzer@kernel.org>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
 <3235f123-0638-b39f-f902-426059b87f81@kernel.dk>
 <efedff15-af48-31e5-2834-d8a879f1e6d2@wdc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <efedff15-af48-31e5-2834-d8a879f1e6d2@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v5 00/20] bio: check return values of
 bio_add_page
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
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, "kch@nvidia.com" <kch@nvidia.com>,
 "shaggy@kernel.org" <shaggy@kernel.org>, "song@kernel.org" <song@kernel.org>,
 "jfs-discussion@lists.sourceforge.net" <jfs-discussion@lists.sourceforge.net>,
 "willy@infradead.org" <willy@infradead.org>,
 "ming.lei@redhat.com" <ming.lei@redhat.com>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, "hare@suse.de" <hare@suse.de>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.dk
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/26/23 12:37 AM, Johannes Thumshirn wrote:
> On 24.05.23 17:02, Jens Axboe wrote:
>> On 5/2/23 4:19?AM, Johannes Thumshirn wrote:
>>> We have two functions for adding a page to a bio, __bio_add_page() which is
>>> used to add a single page to a freshly created bio and bio_add_page() which is
>>> used to add a page to an existing bio.
>>>
>>> While __bio_add_page() is expected to succeed, bio_add_page() can fail.
>>>
>>> This series converts the callers of bio_add_page() which can easily use
>>> __bio_add_page() to using it and checks the return of bio_add_page() for
>>> callers that don't work on a freshly created bio.
>>>
>>> Lastly it marks bio_add_page() as __must_check so we don't have to go again
>>> and audit all callers.
>>
>> Looks fine to me, though it would be nice if the fs and dm people could
>> give this a quick look. Should not take long, any empty bio addition
>> should, by definition, be able to use a non-checked page addition for
>> the first page.
>>
> 
> I think the FS side is all covered. @Mike could you have a look at the dm
> patches?

Not the iomap one, that was my main concern. Not that this is tricky stuff,
but still...

-- 
Jens Axboe


