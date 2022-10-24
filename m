Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D6F60B831
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Oct 2022 21:43:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666640580;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=59TRiYUXIr5hwsRyZRrFskT3Jp1v+y3YCFk34nmAHUA=;
	b=OhQkvPgrMgvHErcJKnxwbw7QuFEuzcFLLUV3HeA6tdR5s+yTN642HZ2o4TdZTK6p3DbHWZ
	YxP+N2Q0VVFx31ThO/H7k3PBTrzf0oPJkcNkTaCRrSmWIaHDt4L7thcjVY9v0i+tEntc4E
	3DiZi17/GT5I9ZhoxKu8HEbbSxEn31Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-4XQPCsPlOBS2zhnocndueA-1; Mon, 24 Oct 2022 15:42:54 -0400
X-MC-Unique: 4XQPCsPlOBS2zhnocndueA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7390811E7A;
	Mon, 24 Oct 2022 19:42:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9B4B1492CA2;
	Mon, 24 Oct 2022 19:42:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 46F0619465B2;
	Mon, 24 Oct 2022 19:42:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F394F194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Oct 2022 19:42:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D24FD492B10; Mon, 24 Oct 2022 19:42:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CAA9D492B0F
 for <cluster-devel@redhat.com>; Mon, 24 Oct 2022 19:42:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4567B3C0D181
 for <cluster-devel@redhat.com>; Mon, 24 Oct 2022 19:42:51 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-634-eBE6cN14NfeKCEgw1_CH0A-1; Mon,
 24 Oct 2022 15:42:48 -0400
X-MC-Unique: eBE6cN14NfeKCEgw1_CH0A-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1on3LB-00FglR-TA; Mon, 24 Oct 2022 19:42:30 +0000
Date: Mon, 24 Oct 2022 20:42:29 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Message-ID: <Y1bqpYNvnxmZL+KW@casper.infradead.org>
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-3-vishal.moola@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20221017202451.4951-3-vishal.moola@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH v3 02/23] filemap: Added
 filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 17, 2022 at 01:24:30PM -0700, Vishal Moola (Oracle) wrote:
> This is the equivalent of find_get_pages_range_tag(), except for folios
> instead of pages.
> 
> One noteable difference is filemap_get_folios_tag() does not take in a
> maximum pages argument. It instead tries to fill a folio batch and stops
> either once full (15 folios) or reaching the end of the search range.
> 
> The new function supports large folios, the initial function did not
> since all callers don't use large folios.

Reviewed-by: Matthew Wilcow (Oracle) <willy@infradead.org>

> +/**
> + * filemap_get_folios_tag - Get a batch of folios matching @tag.
> + * @mapping:    The address_space to search
> + * @start:      The starting page index
> + * @end:        The final page index (inclusive)
> + * @tag:        The tag index
> + * @fbatch:     The batch to fill
> + *
> + * Same as filemap_get_folios, but only returning folios tagged with @tag

If you add () after filemap_get_folios, it turns into a nice link in
the html documentation.

> + *
> + * Return: The number of folios found

Missing full stop at the end of this line.

> + * Also update @start to index the next folio for traversal

Ditto.

> + */
> +unsigned filemap_get_folios_tag(struct address_space *mapping, pgoff_t *start,
> +			pgoff_t end, xa_mark_t tag, struct folio_batch *fbatch)
> +{
> +	XA_STATE(xas, &mapping->i_pages, *start);
> +	struct folio *folio;
> +
> +	rcu_read_lock();
> +	while ((folio = find_get_entry(&xas, end, tag)) != NULL) {
> +		/* Shadow entries should never be tagged, but this iteration
> +		 * is lockless so there is a window for page reclaim to evict
> +		 * a page we saw tagged. Skip over it.
> +		 */

For multiline comments, the "/*" should be on a line by itself.

