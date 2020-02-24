Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2240616B2B3
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Feb 2020 22:37:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582580219;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jnp4wYETk3c2CAi9wAJKyTAx381iB2FTe2aQQ+Yy4Rc=;
	b=Xp/J5e6/KZxdk/HIGgC7XaJGxYlcuW0m1qPkfLqSqu3Az5TYKBg+sEerPqk7wA7QjsIj6U
	vnYcmzeUL6xATnWwV8a86H6CAfCZcHhGjW9gNvtOahwNKc4fTkaEgUy4WDhvcNYLO0PNt2
	Xt0iq3HzdR+w8VWkrZDKMf1jysxzmUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-ynZk0qBfPAmNNyuAYn3l-A-1; Mon, 24 Feb 2020 16:36:57 -0500
X-MC-Unique: ynZk0qBfPAmNNyuAYn3l-A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E13651007269;
	Mon, 24 Feb 2020 21:36:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD14C5C1D6;
	Mon, 24 Feb 2020 21:36:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 15F6218095FF;
	Mon, 24 Feb 2020 21:36:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01OLaoDL019131 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 16:36:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5F4C51142374; Mon, 24 Feb 2020 21:36:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A4751005E3C
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 21:36:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B781800FCE
	for <cluster-devel@redhat.com>; Mon, 24 Feb 2020 21:36:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-161-ejG1hcdkMLed8D7S1-_g3w-1; Mon, 24 Feb 2020 16:36:46 -0500
X-MC-Unique: ejG1hcdkMLed8D7S1-_g3w-1
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j6LP7-0005et-TQ; Mon, 24 Feb 2020 21:36:41 +0000
Date: Mon, 24 Feb 2020 13:36:41 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200224213641.GD13895@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
	<20200219210103.32400-6-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200219210103.32400-6-willy@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01OLaoDL019131
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v7 05/24] mm: Use readahead_control to
	pass arguments
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Feb 19, 2020 at 01:00:44PM -0800, Matthew Wilcox wrote:
> @@ -160,9 +164,13 @@ void __do_page_cache_readahead(struct address_space =
*mapping,
>  =09unsigned long end_index;=09/* The last page we want to read */
>  =09LIST_HEAD(page_pool);
>  =09int page_idx;
> -=09unsigned int nr_pages =3D 0;
>  =09loff_t isize =3D i_size_read(inode);
>  =09gfp_t gfp_mask =3D readahead_gfp_mask(mapping);
> +=09struct readahead_control rac =3D {
> +=09=09.mapping =3D mapping,
> +=09=09.file =3D filp,
> +=09=09._nr_pages =3D 0,

There is no real need to initialize fields to zero if we initialize
the structure at all.  And while I'd normally not care that much,
having as few references as possible to the _-prefixed internal
variables helps making clear how internal they are.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


