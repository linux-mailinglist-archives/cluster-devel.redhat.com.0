Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E8B672255
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Jan 2023 17:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674057709;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=GSOq94AXmVvB2t/Hu5/HVPL9U2Xr3S2Gs4mgbP3Jze4=;
	b=CXrLEhXuyOugaWDQ7m1QGg1MmCzOCsjo1dYIoRcZxzLw3tMDKj4VAwZJxTNMx/cooBQv3c
	g5/sNHPwuBuI/VH00bUadsilgfb/XlD6iNTlMEkErNcXZZL3iOsZrL01I/MfHTuzQ0/Ycb
	ZjJI44SyoDFHgukTJiawQnC0JcRafj4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-vcj6iADjO8yvV1h9QCCzEA-1; Wed, 18 Jan 2023 11:01:27 -0500
X-MC-Unique: vcj6iADjO8yvV1h9QCCzEA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78232831017;
	Wed, 18 Jan 2023 16:00:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A637D51E5;
	Wed, 18 Jan 2023 16:00:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 722711946A6E;
	Wed, 18 Jan 2023 16:00:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AC9651946A79 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 18 Jan 2023 16:00:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4563D53A0; Wed, 18 Jan 2023 16:00:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D2E251E5
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:00:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E104830F84
 for <cluster-devel@redhat.com>; Wed, 18 Jan 2023 16:00:42 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-184---BkEaQSP7aYAE9VfzbuWQ-1; Wed,
 18 Jan 2023 11:00:39 -0500
X-MC-Unique: --BkEaQSP7aYAE9VfzbuWQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1pIArZ-0007eO-4K; Wed, 18 Jan 2023 16:00:33 +0000
Date: Wed, 18 Jan 2023 16:00:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Y8gXodKIUneO+XQb@casper.infradead.org>
References: <20230118094329.9553-1-hch@lst.de>
 <20230118094329.9553-8-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230118094329.9553-8-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH 7/9] gfs2: handle a NULL folio in
 gfs2_jhead_process_page
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 18, 2023 at 10:43:27AM +0100, Christoph Hellwig wrote:
> filemap_get_folio can return NULL, so exit early for that case.

I'm not sure it can return NULL in this specific case.  As I understand
this code, we're scanning the journal looking for the log head.  We've
just submitted the bio to read this page.  I suppose memory pressure
could theoretically push the page out, but if it does, we're doing the
wrong thing by just returning here; we need to retry reading the page.

Assuming we're not willing to do the work to add that case, I think I'd
rather see the crash in folio_wait_locked() than get data corruption
from failing to find the head of the log.

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/gfs2/lops.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
> index 1902413d5d123e..51d4b610127cdb 100644
> --- a/fs/gfs2/lops.c
> +++ b/fs/gfs2/lops.c
> @@ -472,6 +472,8 @@ static void gfs2_jhead_process_page(struct gfs2_jdesc *jd, unsigned long index,
>  	struct folio *folio;
>  
>  	folio = filemap_get_folio(jd->jd_inode->i_mapping, index);
> +	if (!folio)
> +		return;
>  
>  	folio_wait_locked(folio);
>  	if (folio_test_error(folio))
> -- 
> 2.39.0
> 

