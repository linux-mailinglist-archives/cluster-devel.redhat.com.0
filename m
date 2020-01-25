Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B445E149333
	for <lists+cluster-devel@lfdr.de>; Sat, 25 Jan 2020 04:58:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579924683;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lx0lKKnkqhl0zcGVWH7r4Ty17wTgyP7eWJIw8u2UES8=;
	b=O6YG9tlUpFiW7zb3F4rGZps2RgQJklr8j+PWoD4gXfAaDatfskexW5pUrkXo5ac4oUmpxh
	xB9XeP9vzVnonkBjfiNhYvuU746qfnRHBuc3KrKphYvb+B9ORhFTHYHwG4keMJ93+KejD4
	LaGBXHpqHv9DcCJBA0Xa9CNkYyZXX9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-8y1FLis5NZCpaboBRoMEBw-1; Fri, 24 Jan 2020 22:58:01 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F28C713E7;
	Sat, 25 Jan 2020 03:57:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14A6F5D9CA;
	Sat, 25 Jan 2020 03:57:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5EE158596B;
	Sat, 25 Jan 2020 03:57:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00P3vmMd018391 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Jan 2020 22:57:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ACB521055070; Sat, 25 Jan 2020 03:57:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7DAA105506D
	for <cluster-devel@redhat.com>; Sat, 25 Jan 2020 03:57:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 340D1801E7E
	for <cluster-devel@redhat.com>; Sat, 25 Jan 2020 03:57:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-310-_PyU5wzROsuNpiM05MLkPg-1; Fri, 24 Jan 2020 22:57:44 -0500
Received: from [2601:1c0:6280:3f0::ed68]
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ivCZp-0007SX-Sz; Sat, 25 Jan 2020 03:57:41 +0000
To: Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org
References: <20200125013553.24899-1-willy@infradead.org>
	<20200125013553.24899-5-willy@infradead.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4e28eb80-d602-47e6-51ec-63bb39e1a296@infradead.org>
Date: Fri, 24 Jan 2020 19:57:40 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200125013553.24899-5-willy@infradead.org>
Content-Language: en-US
X-MC-Unique: _PyU5wzROsuNpiM05MLkPg-1
X-MC-Unique: 8y1FLis5NZCpaboBRoMEBw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 04/12] mm: Add readahead address space
	operation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 1/24/20 5:35 PM, Matthew Wilcox wrote:
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index 7d4d09dd5e6d..bb06fb7b120b 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -706,6 +706,8 @@ cache in your filesystem.  The following members are defined:
>  		int (*readpage)(struct file *, struct page *);
>  		int (*writepages)(struct address_space *, struct writeback_control *);
>  		int (*set_page_dirty)(struct page *page);
> +		unsigned (*readahead)(struct file *filp, struct address_space *mapping,
> +				 pgoff_t start, unsigned nr_pages);
>  		int (*readpages)(struct file *filp, struct address_space *mapping,
>  				 struct list_head *pages, unsigned nr_pages);
>  		int (*write_begin)(struct file *, struct address_space *mapping,
> @@ -781,6 +783,15 @@ cache in your filesystem.  The following members are defined:
>  	If defined, it should set the PageDirty flag, and the
>  	PAGECACHE_TAG_DIRTY tag in the radix tree.
>  
> +``readahead``
> +	called by the VM to read pages associated with the address_space
> +	object.  The pages are consecutive in the page cache and are
> +        locked.  The implementation should decrement the page refcount after
> +        attempting I/O on each page.  Usually the page will be unlocked by
> +        the I/O completion handler.  If the function does not attempt I/O on
> +        some pages, return the number of pages which were not read so the
> +        common code can unlock the pages for you.
> +

Please use consistent indentation (tabs).

>  ``readpages``
>  	called by the VM to read pages associated with the address_space
>  	object.  This is essentially just a vector version of readpage.


cheers.
-- 
~Randy

