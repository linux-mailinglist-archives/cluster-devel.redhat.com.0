Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EED5A75B1B6
	for <lists+cluster-devel@lfdr.de>; Thu, 20 Jul 2023 16:52:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689864732;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AkiNNvhZXBOhwappo5DsNfWFblN13jxPHvb5/iriC0Y=;
	b=ZLOyzg6IAKUvJzrvlWSkC4ydn+q5PPXZmFWQTXGMQqaXEKDIdoAsflLGhzR/VIOpt96Uif
	Cd/T4rQH/nMwCmoJydLgbV95ISwfs0CtSrxQxevZdsjxN4CBEbaC44+4UI7M3qrtAF0LWW
	6WVpx5yP0l9kVn0zQwTJwNT1KdvBZM8=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-72uIm7HQOXSPWvxEuNPqrg-1; Thu, 20 Jul 2023 10:52:09 -0400
X-MC-Unique: 72uIm7HQOXSPWvxEuNPqrg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7247C29AA2CE;
	Thu, 20 Jul 2023 14:52:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6868840C206F;
	Thu, 20 Jul 2023 14:52:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EC7371946A45;
	Thu, 20 Jul 2023 14:52:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7974619465BD for <cluster-devel@listman.corp.redhat.com>;
 Thu, 20 Jul 2023 14:51:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 09A511121314; Thu, 20 Jul 2023 14:51:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0190A1121318
 for <cluster-devel@redhat.com>; Thu, 20 Jul 2023 14:51:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4929104D517
 for <cluster-devel@redhat.com>; Thu, 20 Jul 2023 14:51:34 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-7anpdN2rMhizp8h-k8yxLQ-1; Thu, 20 Jul 2023 10:51:33 -0400
X-MC-Unique: 7anpdN2rMhizp8h-k8yxLQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-635a4267cf5so11067036d6.2
 for <cluster-devel@redhat.com>; Thu, 20 Jul 2023 07:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689864692; x=1690469492;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AkiNNvhZXBOhwappo5DsNfWFblN13jxPHvb5/iriC0Y=;
 b=R7WIwoBnB2az9odBnD1Wqby/KULsiasvx0uc3m2035TP9RzY7QrF/LzElii/Rwe5zi
 TgktmBrGtmqSwNAM1p5bCVU7y0k3SRLrc60XEMmInjdWidbjRwbK5k6dlfYcVwDYFKoj
 agHVRuQ7PkYN8F5L6Xhs2bJL3I5MxeRf9raAKsqAaK5sWOjFTsCIzhwf5pdhHyqBEyft
 m3xWMvFcmAKYq2+dkVuYgLPTsxINT1d6ajvX6CL8MhCk7GKs7+kGd9xgqiEPkstZWPIz
 hcZyqvhPfi4Z/Fkwu8WKUU3J6V5pY4Nfb0pQOgizm1fTOBJUodZu4nXqOytktOpfHHRk
 /iOw==
X-Gm-Message-State: ABy/qLaG8X/sMM11dva+8Xtbos4FMaOQpiqPlvoqp/0uuGl2xRoyj+Su
 30hOfUreFlnYd1uuxo0vpkiTSn+xoj6jBpWzMYtSOKnlVTHf0QjVT4SPFOP3I3ABVkwk+yKK/5J
 q8LC6RCx8v7WIyeDpwqJuxw==
X-Received: by 2002:a0c:e012:0:b0:63c:c041:ef7c with SMTP id
 j18-20020a0ce012000000b0063cc041ef7cmr4998994qvk.16.1689864692600; 
 Thu, 20 Jul 2023 07:51:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGG9WiVjMAJC0jyp6FJ1iLPNYyic/lNvrnvPP6HMAfS4d7vXSpGs/eQms+dzXXL9v8chg2XyA==
X-Received: by 2002:a0c:e012:0:b0:63c:c041:ef7c with SMTP id
 j18-20020a0ce012000000b0063cc041ef7cmr4998979qvk.16.1689864692339; 
 Thu, 20 Jul 2023 07:51:32 -0700 (PDT)
Received: from [172.16.0.7] ([209.73.90.46]) by smtp.gmail.com with ESMTPSA id
 u4-20020a0cf1c4000000b006375f9fd170sm429007qvl.34.2023.07.20.07.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jul 2023 07:51:31 -0700 (PDT)
Message-ID: <251d9862-e335-243e-d65a-c5538b4df253@redhat.com>
Date: Thu, 20 Jul 2023 09:51:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20230720140452.63817-1-hch@lst.de>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <20230720140452.63817-1-hch@lst.de>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Cluster-devel] allow building a kernel without buffer_heads
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
Cc: linux-xfs@vger.kernel.org, cluster-devel <cluster-devel@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Brauner <christian@brauner.io>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/23 9:04 AM, Christoph Hellwig wrote:
> Hi all,
> 
> This series allows to build a kernel without buffer_heads, which I
> think is useful to show where the dependencies are, and maybe also
> for some very much limited environments, where people just needs
> xfs and/or btrfs and some of the read-only block based file systems.
> 
> It first switches buffered writes (but not writeback) for block devices
> to use iomap unconditionally, but still using buffer_heads, and then
> adds a CONFIG_BUFFER_HEAD selected by all file systems that need it
> (which is most block based file systems), makes the buffer_head support
> in iomap optional, and adds an alternative implementation of the block
> device address_operations using iomap.  This latter implementation
> will also be useful to support block size > PAGE_SIZE for block device
> nodes as buffer_heads won't work very well for that.
> 
> Note that for now the md software raid drivers is also disabled as it has
> some (rather questionable) buffer_head usage in the unconditionally built
> bitmap code.  I have a series pending to make the bitmap code conditional
> and deprecated it, but it hasn't been merged yet.
> 
> Changes since v1:
>   - drop the already merged prep patches
>   - depend on FS_IOMAP not IOMAP
>   - pick a better new name for block_page_mkwrite_return
> 
Hi Christoph,

Gfs2 still uses buffer_heads to manage the metadata being pushed through 
its journals. We've been reducing our dependency on them but eliminating 
them altogether is a large and daunting task. We can still work toward 
that goal, but it will take time.

Bob Peterson

