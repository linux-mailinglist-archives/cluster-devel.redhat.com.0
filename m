Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 267726DF631
	for <lists+cluster-devel@lfdr.de>; Wed, 12 Apr 2023 14:53:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681304001;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ddg0vAHFen4K0AUyZN8TD9RJ8e2AKTjO8ch3srJurzE=;
	b=iObzAWTlnYIX/ZTLvZxUeO0ydf9+8Ffcw0dGaW0haEU6foUbKPHgP7e2wbD1CyHyvjyYni
	lBen+fxlnsDPB5mkTDNm5qsESrDoTLfUSc6mbiY2zwi/AS+YpWnh8W84XsBtO1h6Ism/X8
	ujuExrLBszJZAgFECePevfLirU2zhXI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-WZtK0RTWMaewrYWAkd9D9w-1; Wed, 12 Apr 2023 08:53:17 -0400
X-MC-Unique: WZtK0RTWMaewrYWAkd9D9w-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C99CA1C075B5;
	Wed, 12 Apr 2023 12:53:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F25B3492C13;
	Wed, 12 Apr 2023 12:53:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C09A71946595;
	Wed, 12 Apr 2023 12:53:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5781F1946587 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 12 Apr 2023 12:42:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4C46540C845F; Wed, 12 Apr 2023 12:42:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 307D440C83A9
 for <cluster-devel@redhat.com>; Wed, 12 Apr 2023 12:42:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13F8F185A792
 for <cluster-devel@redhat.com>; Wed, 12 Apr 2023 12:42:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-eXsW9eWoPMaykXRGOxHTzQ-1; Wed, 12 Apr 2023 08:42:18 -0400
X-MC-Unique: eXsW9eWoPMaykXRGOxHTzQ-1
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmZnb-003BFA-1a; Wed, 12 Apr 2023 12:42:07 +0000
Date: Wed, 12 Apr 2023 05:42:07 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <ZDanH46VI7KmQeSV@infradead.org>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <ZDTt8jSdG72/UnXi@infradead.org>
 <20230412023319.GA5105@sol.localdomain>
 <20230412031826.GI3223426@dread.disaster.area>
MIME-Version: 1.0
In-Reply-To: <20230412031826.GI3223426@dread.disaster.area>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v2 00/23] fs-verity support for XFS
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
Cc: fsverity@lists.linux.dev, jth@kernel.org, djwong@kernel.org,
 Andrey Albershteyn <aalbersh@redhat.com>, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 cluster-devel@redhat.com, linux-ext4@vger.kernel.org, xiang@kernel.org,
 damien.lemoal@opensource.wdc.com, linux-erofs@lists.ozlabs.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 12, 2023 at 01:18:26PM +1000, Dave Chinner wrote:
> Right. It's not entirely simple to store metadata on disk beyond EOF
> in XFS because of all the assumptions throughout the IO path and
> allocator interfaces that it can allocate space beyond EOF at will
> and something else will clean it up later if it is not needed. This
> impacts on truncate, delayed allocation, writeback, IO completion,
> EOF block removal on file close, background garbage collection,
> ENOSPC/EDQUOT driven space freeing, etc.  Some of these things cross
> over into iomap infrastructure, too.

To me that actually makes it easier to support the metadata beyond
i_size.  Remember that the file is immutable after add fsverity
hash is added.  So basically we just need to skip freeing the
eofblocks if that flag is set.

