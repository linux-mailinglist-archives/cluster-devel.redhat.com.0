Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CBC671E56
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 14:49:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674049793;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ETxjjLavmaOPEk6TMO4SM/B8zpeLHudHeOG1qhddvao=;
	b=VKOHhbwJAfQlEdAV9QiJSiBhuOubrNkvgz0jcuOMGKS1G7b4m6fMvn0+fr+k8xZA9R+yDu
	fiCDk2MGOOeFW3ebKzmZwwTSWC8XSq1LE/tAnC0MSfkpWKYUgQacJKlxRv04+VgZ2bDjX3
	+QMbazsh3/hecSUHQtVEv/eo3Lfo+sk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-MAzfHzJ0P_etWA59_Cqmzw-1; Wed, 18 Jan 2023 08:49:43 -0500
X-MC-Unique: MAzfHzJ0P_etWA59_Cqmzw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CFCBC8588FE;
	Wed, 18 Jan 2023 13:49:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C446640C6EC4;
	Wed, 18 Jan 2023 13:49:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AB3B71946A6E;
	Wed, 18 Jan 2023 13:49:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 473F719465B7 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 13:49:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E9DBC2166B29; Wed, 18 Jan 2023 13:49:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E2D6C2166B26
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 13:49:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C878B29AB44B
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 13:49:19 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-295-bV63I-q0O8SQbDRvCJe7Bw-1; Wed,
 18 Jan 2023 08:49:18 -0500
X-MC-Unique: bV63I-q0O8SQbDRvCJe7Bw-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pI8oT-0001wu-Q6; Wed, 18 Jan 2023 13:49:13 +0000
Date: Wed, 18 Jan 2023 13:49:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Y8f42T6Bd9RdT06O@casper.infradead.org>
References: <20230118094329.9553-1-hch@lst.de>
 <20230118094329.9553-3-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230118094329.9553-3-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH 2/9] mm: make mapping_get_entry
 available outside of filemap.c
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
Cc: linux-xfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, cluster-devel@redhat.com, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 18, 2023 at 10:43:22AM +0100, Christoph Hellwig wrote:
> mapping_get_entry is useful for page cache API users that need to know
> about xa_value internals.  Rename it and make it available in pagemap.h.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

