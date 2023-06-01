Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 301A87191D8
	for <lists+cluster-devel@lfdr.de>; Thu,  1 Jun 2023 06:26:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685593607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=HH54ZfR07bvx2it5kMbT2XCoKq4FYr76emvIl28NWxo=;
	b=O4KhVp2gGw24VXqdRAvpSD5LPhabfwhztmUCpE9cdQdoV4WswsmCqALOwfeabd7h5SUCU5
	06Dxrtvp3jSkirDHhvLRrI+4+ONKKkh6qj6KwnL0DrKiS1CyB+1fAvdJdqK7Hf+bRVFeUA
	jnFJYh+dyJTe9JWEStL3MxjBecdLBOs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-a4hMRVuCOAyB0G56URIkjA-1; Thu, 01 Jun 2023 00:26:42 -0400
X-MC-Unique: a4hMRVuCOAyB0G56URIkjA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 118C7811E8F;
	Thu,  1 Jun 2023 04:26:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28235202696C;
	Thu,  1 Jun 2023 04:26:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F182D1946A45;
	Thu,  1 Jun 2023 04:26:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DC8B41946A41 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  1 Jun 2023 04:26:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8FC2F2166B26; Thu,  1 Jun 2023 04:26:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86D8F2166B25
 for <cluster-devel@redhat.com>; Thu,  1 Jun 2023 04:26:38 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 660AF1C0519D
 for <cluster-devel@redhat.com>; Thu,  1 Jun 2023 04:26:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-PWa0YdzyP0G9ZwpETsxX-g-1; Thu, 01 Jun 2023 00:26:36 -0400
X-MC-Unique: PWa0YdzyP0G9ZwpETsxX-g-1
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1b04949e5baso3631445ad.0
 for <cluster-devel@redhat.com>; Wed, 31 May 2023 21:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685593596; x=1688185596;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HH54ZfR07bvx2it5kMbT2XCoKq4FYr76emvIl28NWxo=;
 b=FJ3Xm8SDzWXijmY5tleQGEV1ABAA0caXFNdBIq4rfRg2dxJtCcDtiphnQcOf9Zycid
 lWTru7IBKmDOVyq33sXI+0XZ15M1ce8n8tkLD4MdW2MYczilMI+u7bCWo9Q0nkGRJgsR
 i9X3bFdJ0Tz2okYtQDP3ABCt6DZhqemF2AXTcAAGPG7WTG24lWg7Ki3So76Gu+4bWxNj
 LnmLymqSfAwGPE5vzoFE2H5zUSlCeKGXzyQac/82N+QjOBPo6aerexy9J8F7s7Z01IK7
 hPiwP6je9aze7OQ4VWgrqV3ciF6QnYfppYlhCcpPb33fpQuo6tto/Leq5ggFqMM4935K
 pbcg==
X-Gm-Message-State: AC+VfDwMs+1lpBCui/BONHV9IG9yr08yE46e1u0jTIvLf/Ix+41wiSQy
 4SM8XpBnDI0Ty3P7vzwEBHDnXg==
X-Google-Smtp-Source: ACHHUZ6hlZU/MsjoyVz4yyhoe997V/qcrYIwn3uWW59qEXQKN9Rt7VfRZ5XiA6hG1XPeblBFMsaoCQ==
X-Received: by 2002:a17:902:724c:b0:1af:b9ed:1677 with SMTP id
 c12-20020a170902724c00b001afb9ed1677mr6568666pll.2.1685593595885; 
 Wed, 31 May 2023 21:26:35 -0700 (PDT)
Received: from dread.disaster.area (pa49-179-0-188.pa.nsw.optusnet.com.au.
 [49.179.0.188]) by smtp.gmail.com with ESMTPSA id
 f13-20020a170902684d00b001a980a23802sm2281781pln.111.2023.05.31.21.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 21:26:34 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1q4ZtQ-006NBe-17;
 Thu, 01 Jun 2023 14:26:32 +1000
Date: Thu, 1 Jun 2023 14:26:32 +1000
From: Dave Chinner <david@fromorbit.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZHgd+G7/gg0uOGMF@dread.disaster.area>
References: <cover.1685532726.git.johannes.thumshirn@wdc.com>
 <58fa893c24c67340a63323f09a179fefdca07f2a.1685532726.git.johannes.thumshirn@wdc.com>
 <ZHfMC86ktyLtIxNb@dread.disaster.area>
 <20230601042021.GA21768@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230601042021.GA21768@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v7 19/20] fs: iomap: use
 bio_add_folio_nofail where possible
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
 Chaitanya Kulkarni <kch@nvidia.com>, Song Liu <song@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org, dm-devel@redhat.com,
 Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, gouha7@uniontech.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: fromorbit.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 01, 2023 at 06:20:21AM +0200, Christoph Hellwig wrote:
> On Thu, Jun 01, 2023 at 08:36:59AM +1000, Dave Chinner wrote:
> > We lose adjacent page merging with this change.
> 
> This is only used for adding the first folio to a brand new bio,
> so there is nothing to merge with yet at this point.

Ah, sorry, missed that. Carry on. :)

-Dave.
-- 
Dave Chinner
david@fromorbit.com

