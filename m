Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 15412164FCD
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 21:25:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582143912;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Stnn+zSSGNCFbZ988J4GuiCkm17Qbq44jVcYhuJTWJc=;
	b=bNkzDOKY1RCzjmupQDQIpTPZuCVhs/K79CBdFcB9oSYqw45G66LWIYJ4h/4VdJ1HtAq1yP
	Dbi53XNdAYoEeNvsXUcnOnOmrw23+eGCDn+xw8G37d3trWcjf3l55t5AjEeu+AuqYJrn02
	LbIE5BqaV/wSkrUwAd+iSgJfuGM+xgM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-tzEzci45P1C_TjIgu4kB7g-1; Wed, 19 Feb 2020 15:25:10 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D972801E78;
	Wed, 19 Feb 2020 20:25:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83C6160BE1;
	Wed, 19 Feb 2020 20:25:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5F4535AF0;
	Wed, 19 Feb 2020 20:25:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JKOXSm031563 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 15:24:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 82CA12166B2D; Wed, 19 Feb 2020 20:24:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E8CC2166B2C
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 20:24:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 989B38007C9
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 20:24:31 +0000 (UTC)
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
	[216.228.121.143]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-13-ZaAg1DZYMnGxuMd88z5Usw-1; Wed, 19 Feb 2020 15:24:28 -0500
X-MC-Unique: ZaAg1DZYMnGxuMd88z5Usw-1
X-MC-Unique: tzEzci45P1C_TjIgu4kB7g-1
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5e4d99340000>; Wed, 19 Feb 2020 12:23:16 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Wed, 19 Feb 2020 12:24:27 -0800
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Wed, 19 Feb 2020 12:24:27 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Wed, 19 Feb 2020 20:24:27 +0000
To: Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-12-willy@infradead.org>
	<e3671faa-dfb3-ceba-3120-a445b2982a95@nvidia.com>
	<20200219144117.GP24185@bombadil.infradead.org>
	<20200219145246.GA29869@infradead.org>
	<20200219150103.GQ24185@bombadil.infradead.org>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <a5f8ba4c-8413-2633-9523-5b5941c0762b@nvidia.com>
Date: Wed, 19 Feb 2020 12:24:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219150103.GQ24185@bombadil.infradead.org>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v6 07/19] mm: Put readahead pages in
	cache earlier
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 2/19/20 7:01 AM, Matthew Wilcox wrote:
> On Wed, Feb 19, 2020 at 06:52:46AM -0800, Christoph Hellwig wrote:
>> On Wed, Feb 19, 2020 at 06:41:17AM -0800, Matthew Wilcox wrote:
>>> #define readahead_for_each(rac, page)                                   \
>>>         while ((page = readahead_page(rac)))
>>>
>>> No more readahead_next() to forget to add to filesystems which don't use
>>> the readahead_for_each() iterator.  Ahem.


Yes, this looks very clean. And less error-prone, which I definitely
appreciate too. :)


>>
>> And then kill readahead_for_each and open code the above to make it
>> even more obvious?
> 
> Makes sense.
> 

Great!


thanks,
-- 
John Hubbard
NVIDIA

