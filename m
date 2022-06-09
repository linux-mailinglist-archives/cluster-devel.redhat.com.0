Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9E55448B4
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jun 2022 12:24:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654770255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6a5SsgsnTuFo9sIZWQwmUlikCgiuGiGF/De3NllGDd0=;
	b=UDndUNkTEPW4oeU+9U2rnQBsIkBOD61IQ9E6QvFH0+DrSHKYrbIIGYRefLS9HeHWF4gqDE
	ahRQUiu6a/3UrmM1Dp7HY2skFg6BeZGDh75asBTaSbeNoc4gEApb7Ybp9/7jPpmDSCs/KF
	sluvHtS/1vQ9mmqqwvWVtieBNyULE4I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-zdTNJ-sNMAKsaObOB5qArQ-1; Thu, 09 Jun 2022 06:24:09 -0400
X-MC-Unique: zdTNJ-sNMAKsaObOB5qArQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81A8985A582;
	Thu,  9 Jun 2022 10:24:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5BEE40CF8E2;
	Thu,  9 Jun 2022 10:24:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 76552194705D;
	Thu,  9 Jun 2022 10:24:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D63871947040 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  9 Jun 2022 10:24:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B2066202699A; Thu,  9 Jun 2022 10:24:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE01E2026985
 for <cluster-devel@redhat.com>; Thu,  9 Jun 2022 10:24:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F2A5185A7B2
 for <cluster-devel@redhat.com>; Thu,  9 Jun 2022 10:24:04 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-QarVh27vPJiY2pC_pO9ZUw-1; Thu, 09 Jun 2022 06:24:03 -0400
X-MC-Unique: QarVh27vPJiY2pC_pO9ZUw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c125-20020a1c3583000000b003978decffedso15789717wma.5
 for <cluster-devel@redhat.com>; Thu, 09 Jun 2022 03:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6a5SsgsnTuFo9sIZWQwmUlikCgiuGiGF/De3NllGDd0=;
 b=U+3OkdP76Gf0xDy8TMYz3qjQIOFV2A221QvKWEZ/XKGpp0a9ev52xG7M/ftDQdCVAj
 R3Y1kkNG4V5Xbx12Ww0Uy3180qIWjIlmNtSvtOD5LebUeVhXXm/DdjS0t8/Wq/2S+uH2
 2j9eRcWplwjeeShvVMwJrcbnQHNeve7/zLlC7VXYAVaCElAh93A0qe2d1wyTz/iQb+Xc
 my4obO3HK1gPv6/a5DVBhtck5gSKqP41JZH7nz461jOS9Als8ZVO2JFT2oyzTPVkExWf
 aYZwKVWNX4kfCiKIIIgf4QfhZZAyRTN4XTMa8PVUcXDBdIzYDiuplcwmALD1EQ1bJ7R+
 fEBA==
X-Gm-Message-State: AOAM530kBIW8gjx+7DldO5ZJulZn8cjdoC2z+uNAJwBgJwDCD6gsfabr
 qbVx6Se6wEfVNGUXgMrY9uLYTJ+zBe68eq1ddHnLLU4Ec5hst7YxTyIljClTOxr/XUpEiWAO5Hk
 vu7xGSOhW9VPaacaHS3A80Q==
X-Received: by 2002:a1c:a301:0:b0:392:9bc5:203c with SMTP id
 m1-20020a1ca301000000b003929bc5203cmr2594382wme.67.1654770241338; 
 Thu, 09 Jun 2022 03:24:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy58rh3fuuccVM2J0IS1QrE1vJ3CH41QyKYHa1IrWm/Rvain2xs2JDw35eE5SOSwtsykjkKLA==
X-Received: by 2002:a1c:a301:0:b0:392:9bc5:203c with SMTP id
 m1-20020a1ca301000000b003929bc5203cmr2594345wme.67.1654770240948; 
 Thu, 09 Jun 2022 03:24:00 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:20af:34be:985b:b6c8?
 ([2a09:80c0:192:0:20af:34be:985b:b6c8])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a5d460a000000b0021552eebde6sm17782568wrq.32.2022.06.09.03.23.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 03:23:59 -0700 (PDT)
Message-ID: <a079ed41-1978-0551-2b5c-6d61aff7ddf2@redhat.com>
Date: Thu, 9 Jun 2022 12:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-3-willy@infradead.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220608150249.3033815-3-willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: Re: [Cluster-devel] [PATCH v2 02/19] mm: Convert all PageMovable
 users to movable_operations
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.06.22 17:02, Matthew Wilcox (Oracle) wrote:
> These drivers are rather uncomfortably hammered into the
> address_space_operations hole.  They aren't filesystems and don't behave
> like filesystems.  They just need their own movable_operations structure,
> which we can point to directly from page->mapping.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  arch/powerpc/platforms/pseries/cmm.c |  60 +---------------
>  drivers/misc/vmw_balloon.c           |  61 +---------------
>  drivers/virtio/virtio_balloon.c      |  47 +-----------
>  include/linux/balloon_compaction.h   |   6 +-
>  include/linux/fs.h                   |   2 -
>  include/linux/migrate.h              |  26 +++++--
>  include/linux/page-flags.h           |   2 +-
>  include/uapi/linux/magic.h           |   4 --
>  mm/balloon_compaction.c              |  10 ++-
>  mm/compaction.c                      |  29 ++++----
>  mm/migrate.c                         |  24 +++----
>  mm/util.c                            |   4 +-
>  mm/z3fold.c                          |  82 +++------------------
>  mm/zsmalloc.c                        | 102 ++++++---------------------
>  14 files changed, 94 insertions(+), 365 deletions(-)

You probably should have cc'ed the relevant maintainers (including me :P ).

For everything except z3fold.c and zsmalloc.c,

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

