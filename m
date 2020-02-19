Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9325E164391
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Feb 2020 12:42:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582112534;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6g3k1M7CQToMcw1YCl1/xbbtV4syQA1VfyirVv5OU8M=;
	b=PDrecrCbNkON9MQkNkJyWMmpdO+DxCa7C+kDlP9m2s+VTTpSSbCjHcQdQc8bH3IQt7wBYL
	v1ZIPwFlFL5L9faaz6cVcRv9zzx7qOt7Vgp0Y/crxTH2CPNpMqlMc2Q+0eVFlUB6rTJnfj
	34Bo5fJ/arOb/qpNi3lz1KmnYjYJJwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-wBqNdP04MLC9QC2bEyxLGQ-1; Wed, 19 Feb 2020 06:42:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5604E800D5E;
	Wed, 19 Feb 2020 11:42:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4489790769;
	Wed, 19 Feb 2020 11:42:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F29BC35B15;
	Wed, 19 Feb 2020 11:42:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J3Aqcw005537 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 18 Feb 2020 22:10:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8D6D72063206; Wed, 19 Feb 2020 03:10:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88BED2026D69
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:10:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A9FF801E9C
	for <cluster-devel@redhat.com>; Wed, 19 Feb 2020 03:10:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-186-AMNDbtuzOHG57ZEE0Ethmg-1;
	Tue, 18 Feb 2020 22:10:47 -0500
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C25D02176D;
	Wed, 19 Feb 2020 03:10:45 +0000 (UTC)
Date: Tue, 18 Feb 2020 19:10:44 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200219031044.GA1075@sol.localdomain>
References: <20200217184613.19668-1-willy@infradead.org>
	<20200217184613.19668-14-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200217184613.19668-14-willy@infradead.org>
X-MC-Unique: AMNDbtuzOHG57ZEE0Ethmg-1
X-MC-Unique: wBqNdP04MLC9QC2bEyxLGQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01J3Aqcw005537
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Wed, 19 Feb 2020 06:42:02 -0500
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v6 08/19] mm: Add readahead address
	space operation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Mon, Feb 17, 2020 at 10:45:54AM -0800, Matthew Wilcox wrote:
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystem=
s/vfs.rst
> index 7d4d09dd5e6d..81ab30fbe45c 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -706,6 +706,7 @@ cache in your filesystem.  The following members are =
defined:
>  =09=09int (*readpage)(struct file *, struct page *);
>  =09=09int (*writepages)(struct address_space *, struct writeback_control=
 *);
>  =09=09int (*set_page_dirty)(struct page *page);
> +=09=09void (*readahead)(struct readahead_control *);
>  =09=09int (*readpages)(struct file *filp, struct address_space *mapping,
>  =09=09=09=09 struct list_head *pages, unsigned nr_pages);
>  =09=09int (*write_begin)(struct file *, struct address_space *mapping,
> @@ -781,12 +782,24 @@ cache in your filesystem.  The following members ar=
e defined:
>  =09If defined, it should set the PageDirty flag, and the
>  =09PAGECACHE_TAG_DIRTY tag in the radix tree.
> =20
> +``readahead``
> +=09Called by the VM to read pages associated with the address_space
> +=09object.  The pages are consecutive in the page cache and are
> +=09locked.  The implementation should decrement the page refcount
> +=09after starting I/O on each page.  Usually the page will be
> +=09unlocked by the I/O completion handler.  If the function does
> +=09not attempt I/O on some pages, the caller will decrement the page
> +=09refcount and unlock the pages for you.=09Set PageUptodate if the
> +=09I/O completes successfully.  Setting PageError on any page will
> +=09be ignored; simply unlock the page if an I/O error occurs.
> +

This is unclear about how "not attempting I/O" works and how that affects w=
ho is
responsible for putting and unlocking the pages.  How does the caller know =
which
pages were not attempted?  Can any arbitrary subset of pages be not attempt=
ed,
or just the last N pages?

In the code, the caller actually uses readahead_for_each() to iterate throu=
gh
and put+unlock the pages.  That implies that ->readahead() must also use
readahead_for_each() as well, in order for the iterator to be advanced
correctly... Right?  And the ownership of each page is transferred to the c=
allee
when the callee advances the iterator past that page.

I don't see how ext4_readahead() and f2fs_readahead() can work at all, give=
n
that they don't advance the iterator.

- Eric


