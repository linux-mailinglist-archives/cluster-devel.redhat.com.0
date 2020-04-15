Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B10641A904B
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Apr 2020 03:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586913447;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XB5M8ewik/HERUbKyYEM4m5K6uedjwrISMjTtrW+Vvw=;
	b=MmwpoVVfOLGafN9NTa0j1d6cUDU20LBFBgaeE0d/HBk5jv7JCTxhZr8cuFLzENrxxrMUdT
	UR0M6/zhvywbB7F1mVh5OzMjOVJV+M6dGjJ4+L+3qiT2CG4NUWk6ENVQyNo1qhRLcnPL3u
	Xfp8dH6a8+Tby4pzQRA5eRfqGJ3Blsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-9Z3gb6R-NmyvMoL87mUXQA-1; Tue, 14 Apr 2020 21:17:25 -0400
X-MC-Unique: 9Z3gb6R-NmyvMoL87mUXQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7D0B18C35A1;
	Wed, 15 Apr 2020 01:17:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BDD9385;
	Wed, 15 Apr 2020 01:17:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD48218095FF;
	Wed, 15 Apr 2020 01:17:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03F1HDxK019772 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 21:17:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 636902166B2A; Wed, 15 Apr 2020 01:17:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EBF32166B2C
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 01:17:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40B52800A18
	for <cluster-devel@redhat.com>; Wed, 15 Apr 2020 01:17:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-415-IjpUgfJvPaO7u9Tr-bTg6g-1;
	Tue, 14 Apr 2020 21:17:08 -0400
X-MC-Unique: IjpUgfJvPaO7u9Tr-bTg6g-1
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
	[73.231.172.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 5CD58206D9;
	Wed, 15 Apr 2020 01:17:06 +0000 (UTC)
Date: Tue, 14 Apr 2020 18:17:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Matthew Wilcox <willy@infradead.org>
Message-Id: <20200414181705.bfc4c0087092051a9475141e@linux-foundation.org>
In-Reply-To: <20200414150233.24495-6-willy@infradead.org>
References: <20200414150233.24495-1-willy@infradead.org>
	<20200414150233.24495-6-willy@infradead.org>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03F1HDxK019772
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v11 05/25] mm: Add new readahead_control
	API
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Apr 2020 08:02:13 -0700 Matthew Wilcox <willy@infradead.org> wro=
te:

> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> Filesystems which implement the upcoming ->readahead method will get
> their pages by calling readahead_page() or readahead_page_batch().
> These functions support large pages, even though none of the filesystems
> to be converted do yet.
>=20
> +static inline struct page *readahead_page(struct readahead_control *rac)
> +static inline unsigned int __readahead_batch(struct readahead_control *r=
ac,
> +=09=09struct page **array, unsigned int array_sz)

These are large functions.  Was it correct to inline them?

The batching API only appears to be used by fuse?  If so, do we really
need it?  Does it provide some functional need, or is it a performance
thing?  If the latter, how significant is it?

The code adds quite a few (inlined!) VM_BUG_ONs.  Can we plan to remove
them at some stage?  Such as, before Linus shouts at us :)


