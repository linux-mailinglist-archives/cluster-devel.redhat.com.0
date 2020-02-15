Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6C98215FBF6
	for <lists+cluster-devel@lfdr.de>; Sat, 15 Feb 2020 02:19:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581729595;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yg7fMC8S9oTFRWq6nz94j+6r3u9UZnrye1C2Q19KUnM=;
	b=WX71WddWUi8WUowXkYZjhNnkucQ5koJYngM6sOeRgeUbZH2xUvbof4c448n5G0yNx3mGWw
	a+SDgXLGAlWfstFzjkFxsFVKcDdCOHUjCDfHasQyWIzM6zVcxW0t6m8RquEmM70wCyuinZ
	e4zqxArEpu8W/ceGrP+3EGClLUPmVI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-HpGttURINSa7QaMylv9mTQ-1; Fri, 14 Feb 2020 20:19:54 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1310418A5502;
	Sat, 15 Feb 2020 01:19:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C484A60499;
	Sat, 15 Feb 2020 01:19:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7716F4EBDE;
	Sat, 15 Feb 2020 01:19:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01F1FK3f026483 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 Feb 2020 20:15:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AFB051033325; Sat, 15 Feb 2020 01:15:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA9201033324
	for <cluster-devel@redhat.com>; Sat, 15 Feb 2020 01:15:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5F42803B44
	for <cluster-devel@redhat.com>; Sat, 15 Feb 2020 01:15:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-212-obVLGqCOOSOKFZFS4-Nglw-1; Fri, 14 Feb 2020 20:15:15 -0500
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1j2m2z-0006lw-H3; Sat, 15 Feb 2020 01:15:05 +0000
Date: Fri, 14 Feb 2020 17:15:05 -0800
From: Matthew Wilcox <willy@infradead.org>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20200215011505.GD7778@bombadil.infradead.org>
References: <20200211010348.6872-1-willy@infradead.org>
	<20200211010348.6872-5-willy@infradead.org>
	<755399a8-8fdf-bfac-9f23-81579ff63ddf@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <755399a8-8fdf-bfac-9f23-81579ff63ddf@nvidia.com>
X-MC-Unique: obVLGqCOOSOKFZFS4-Nglw-1
X-MC-Unique: HpGttURINSa7QaMylv9mTQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01F1FK3f026483
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH v5 04/13] mm: Add readahead address
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Thu, Feb 13, 2020 at 09:36:25PM -0800, John Hubbard wrote:
> > +static inline struct page *readahead_page(struct readahead_control *ra=
c)
> > +{
> > +=09struct page *page;
> > +
> > +=09if (!rac->nr_pages)
> > +=09=09return NULL;
> > +
> > +=09page =3D xa_load(&rac->mapping->i_pages, rac->start);
>=20
>=20
> Is it worth asserting that the page was found:
>=20
> =09VM_BUG_ON_PAGE(!page || xa_is_value(page), page);
>=20
> ? Or is that overkill here?

It shouldn't be possible since they were just added in a locked state.
If it did happen, it'll be caught by the assert below -- dereferencing
a NULL pointer or a shadow entry is not going to go well.

> > +=09VM_BUG_ON_PAGE(!PageLocked(page), page);
> > +=09rac->batch_count =3D hpage_nr_pages(page);
> > +=09rac->start +=3D rac->batch_count;
>=20
> The above was surprising, until I saw the other thread with Dave and you.
> I was reviewing this patchset in order to have a chance at understanding =
the=20
> follow-on patchset ("Large pages in the page cache"), and it seems like t=
hat
> feature has a solid head start here. :) =20

Right, I'll document that.


