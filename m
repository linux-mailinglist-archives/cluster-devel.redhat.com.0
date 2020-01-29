Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3553D14C3F7
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jan 2020 01:25:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580257530;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JRxt3jAT9772I0gfXjMQTfclskEySAA3YTlmef9WMH8=;
	b=TJ0QIAWb4bnomjzg/8z/+KXyG4YAU1QUj5fRPEarRL58lerKsCD9wa41kdAO/IYICK0z2B
	1zlcp0lJvT4AQpF/vkY0fVT/Y1OyxJVCjUjnIWOsj6Sz4PgeRb++XiKhjWILOQBHwjqmFE
	3phS/Fak7IaGgH1IM1lkGYKRGZP/hFo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-V1xkI1gWOYa2iX-o6nG76Q-1; Tue, 28 Jan 2020 19:25:28 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A001C800D50;
	Wed, 29 Jan 2020 00:25:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B5B489E64;
	Wed, 29 Jan 2020 00:25:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B468285799;
	Wed, 29 Jan 2020 00:25:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00T0P6dg009458 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 28 Jan 2020 19:25:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3DF6410AF41C; Wed, 29 Jan 2020 00:25:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37D3E10AF41A
	for <cluster-devel@redhat.com>; Wed, 29 Jan 2020 00:25:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EFDF185AB7D
	for <cluster-devel@redhat.com>; Wed, 29 Jan 2020 00:25:04 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-356-snuUQLQ4OiGYV8v77WV2_g-1; Tue, 28 Jan 2020 19:25:00 -0500
Received: from dread.disaster.area (pa49-195-111-217.pa.nsw.optusnet.com.au
	[49.195.111.217])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 32C487E9A77;
	Wed, 29 Jan 2020 11:24:56 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1iwbA8-0005eI-Bd; Wed, 29 Jan 2020 11:24:56 +1100
Date: Wed, 29 Jan 2020 11:24:56 +1100
From: Dave Chinner <david@fromorbit.com>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200129002456.GH18610@dread.disaster.area>
References: <20200125013553.24899-1-willy@infradead.org>
	<20200125013553.24899-5-willy@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20200125013553.24899-5-willy@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=LYdCFQXi c=1 sm=1 tr=0
	a=0OveGI8p3fsTA6FL6ss4ZQ==:117 a=0OveGI8p3fsTA6FL6ss4ZQ==:17
	a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=Jdjhy38mL1oA:10
	a=JfrnYn6hAAAA:8 a=7-415B0cAAAA:8 a=bQT49A20HjYUhGx6rhoA:9
	a=UEMyszIiLG9v0jT0:21 a=UWfWf6Z2s6wDmKyN:21 a=CjuIK1q_8ugA:10
	a=1CNFftbPRP8L7MoqJWF3:22 a=biEYGPWJfzWAr4FL6Ov7:22
X-MC-Unique: snuUQLQ4OiGYV8v77WV2_g-1
X-MC-Unique: V1xkI1gWOYa2iX-o6nG76Q-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00T0P6dg009458
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, linux-mm@kvack.org,
	ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Fri, Jan 24, 2020 at 05:35:45PM -0800, Matthew Wilcox wrote:
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
>=20
> This replaces ->readpages with a saner interface:
>  - Return the number of pages not read instead of an ignored error code.
>  - Pages are already in the page cache when ->readahead is called.
>  - Implementation looks up the pages in the page cache instead of
>    having them passed in a linked list.
....
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 5a6676640f20..6d65dae6dad0 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -121,7 +121,18 @@ static void read_pages(struct address_space *mapping=
, struct file *filp,
> =20
>  =09blk_start_plug(&plug);
> =20
> -=09if (mapping->a_ops->readpages) {
> +=09if (mapping->a_ops->readahead) {
> +=09=09unsigned left =3D mapping->a_ops->readahead(filp, mapping,
> +=09=09=09=09start, nr_pages);
> +
> +=09=09while (left) {
> +=09=09=09struct page *page =3D readahead_page(mapping,
> +=09=09=09=09=09start + nr_pages - left - 1);

Off by one? start =3D 2, nr_pages =3D 2, left =3D 1, this looks up the
page at index 2, which is the one we issued IO on, not the one we
"left behind" which is at index 3.

Cheers,

Dave.
--=20
Dave Chinner
david@fromorbit.com


