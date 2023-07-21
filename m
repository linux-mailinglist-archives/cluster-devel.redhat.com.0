Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B15C75BED3
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Jul 2023 08:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689920805;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=hie72xjAkKN4kSksvNLqig7sulKdIk+4lQa/sUfRRmE=;
	b=F6C9y6aJw5C5WJ2yH1DVE2YwgTJIRofmNHtxiToPovvEXx1eCloYeHFBkej34d+AZ/bfnm
	eY56+DtTjTcZnQoOWAcEusmYXPR/cdPr1OwlhI/bFhZg8VunmRKGhyEcHK7cp+dAiNDHGe
	d6ZIzx/Rx4iowOnDUNswptrpSQ5Hi9U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-i8bEARLCPSiW4JTkET8dHQ-1; Fri, 21 Jul 2023 02:26:41 -0400
X-MC-Unique: i8bEARLCPSiW4JTkET8dHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0EBCF185A7AD;
	Fri, 21 Jul 2023 06:26:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C622C40C6F4F;
	Fri, 21 Jul 2023 06:26:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3323B1946A49;
	Fri, 21 Jul 2023 06:26:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 433BA19465BD for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Jul 2023 06:26:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0E1DD40C2070; Fri, 21 Jul 2023 06:26:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06E6240C206F
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 06:26:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5A4F185A791
 for <cluster-devel@redhat.com>; Fri, 21 Jul 2023 06:26:34 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-wZGNXtGROYCOf41aHG-fWw-1; Fri, 21 Jul 2023 02:26:32 -0400
X-MC-Unique: wZGNXtGROYCOf41aHG-fWw-1
Received: by verein.lst.de (Postfix, from userid 2407)
 id F15BC6732D; Fri, 21 Jul 2023 08:26:28 +0200 (CEST)
Date: Fri, 21 Jul 2023 08:26:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bob Peterson <rpeterso@redhat.com>
Message-ID: <20230721062628.GC20845@lst.de>
References: <20230720140452.63817-1-hch@lst.de>
 <251d9862-e335-243e-d65a-c5538b4df253@redhat.com>
MIME-Version: 1.0
In-Reply-To: <251d9862-e335-243e-d65a-c5538b4df253@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-xfs@vger.kernel.org,
 cluster-devel <cluster-devel@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Christian Brauner <christian@brauner.io>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 20, 2023 at 09:51:30AM -0500, Bob Peterson wrote:
> Gfs2 still uses buffer_heads to manage the metadata being pushed through 
> its journals. We've been reducing our dependency on them but eliminating 
> them altogether is a large and daunting task. We can still work toward that 
> goal, but it will take time.

That's fine - gfs2 selects CONFIG_BUFFER_HEAD after this series and
will be perfectly fine.

