Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC3F70F99A
	for <lists+cluster-devel@lfdr.de>; Wed, 24 May 2023 17:02:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684940576;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rwf57azNybT9v+Lg2CMN2sb9fLVIIGUOGeYghvdjLPg=;
	b=I5f39n7/kkNgfuPclg0To44G8NbEF13qxJ/qhM0RjWX86KZ12T/rBjwTEN1Zb5HzjrLVff
	XdVmJojoDl7ZCv3D8IkrcRFriOKUabFHSiiStQ8bHTlC3OhWc+qU9Uj0pjEAhXPaDbmZcf
	oBUAV1xev11PgwLQnZaUiLd+9jWLtbs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-wMzIjHByO-yepxVSZlpnyQ-1; Wed, 24 May 2023 11:02:45 -0400
X-MC-Unique: wMzIjHByO-yepxVSZlpnyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E225811E97;
	Wed, 24 May 2023 15:02:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DEC92029F6D;
	Wed, 24 May 2023 15:02:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 57CC719466DF;
	Wed, 24 May 2023 15:02:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C3F5419465A0 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 24 May 2023 15:02:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A0410C090D9; Wed, 24 May 2023 15:02:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9858FC164ED
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 15:02:15 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 762A8101A531
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 15:02:15 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-5UUNl9puOySs1fRn7Hdlrg-1; Wed, 24 May 2023 11:02:13 -0400
X-MC-Unique: 5UUNl9puOySs1fRn7Hdlrg-1
Received: by mail-io1-f44.google.com with SMTP id
 ca18e2360f4ac-760dff4b701so8095339f.0
 for <cluster-devel@redhat.com>; Wed, 24 May 2023 08:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684940531; x=1687532531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rwf57azNybT9v+Lg2CMN2sb9fLVIIGUOGeYghvdjLPg=;
 b=aCtTAdI/r0BPZ9gSuHdaCS19Q+ZdFnz6a/Z4Oega0G8Ish2k/TGePP3qvAWECTbc43
 fwd/aIwoLJrPq5PsIQRtJiytiWu9DZQEBl/UU4036t3aMTE+E6IuBeo5BmOBpSwgxRPW
 OEQHvc54IYwhu0fNcLmq9dYPSQVAKmDXNVV+bVlWyo4f9QWwYlGzWRCaX7g8daFkeMQ+
 FiuStFBDLJ1THFtaRFY5CMAIEQAatulIqcPKyY6cRSkTUJrvwJs/GAbQo7AeqkoISlFu
 9NGXHguHcc8cRscM7JYQ6J4P2TzEe3lJCpa7H+NIcc8KyhNmDYWn/8HccQt+9UqktqUb
 0+FQ==
X-Gm-Message-State: AC+VfDwYgkrwcsVNPZuAzpUJXjeXSMtKKYV9NWQqMtPk+tx6Bba80qtj
 AcwElW+43cYA2zMwyN4uYx3vvw==
X-Google-Smtp-Source: ACHHUZ50tzfDRcH1j6S2Z6TgSbqpVFNpX8Jv88XOuQFTADKkXBGAMy329r3aqgfQXEN+hNSP1qppLQ==
X-Received: by 2002:a05:6602:3420:b0:774:8571:a6dd with SMTP id
 n32-20020a056602342000b007748571a6ddmr3685006ioz.2.1684940531189; 
 Wed, 24 May 2023 08:02:11 -0700 (PDT)
Received: from [192.168.1.94] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
 f13-20020a056638112d00b0040fb2ba7357sm3209457jar.4.2023.05.24.08.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 08:02:10 -0700 (PDT)
Message-ID: <3235f123-0638-b39f-f902-426059b87f81@kernel.dk>
Date: Wed, 24 May 2023 09:02:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
References: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20230502101934.24901-1-johannes.thumshirn@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: linux-block@vger.kernel.org, damien.lemoal@wdc.com, kch@nvidia.com,
 shaggy@kernel.org, song@kernel.org, snitzer@kernel.org,
 jfs-discussion@lists.sourceforge.net, willy@infradead.org, ming.lei@redhat.com,
 cluster-devel@redhat.com, linux-mm@kvack.org, dm-devel@redhat.com,
 hare@suse.de, linux-fsdevel@vger.kernel.org, linux-raid@vger.kernel.org,
 hch@lst.de
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.dk
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/2/23 4:19?AM, Johannes Thumshirn wrote:
> We have two functions for adding a page to a bio, __bio_add_page() which is
> used to add a single page to a freshly created bio and bio_add_page() which is
> used to add a page to an existing bio.
> 
> While __bio_add_page() is expected to succeed, bio_add_page() can fail.
> 
> This series converts the callers of bio_add_page() which can easily use
> __bio_add_page() to using it and checks the return of bio_add_page() for
> callers that don't work on a freshly created bio.
> 
> Lastly it marks bio_add_page() as __must_check so we don't have to go again
> and audit all callers.

Looks fine to me, though it would be nice if the fs and dm people could
give this a quick look. Should not take long, any empty bio addition
should, by definition, be able to use a non-checked page addition for
the first page.

-- 
Jens Axboe

