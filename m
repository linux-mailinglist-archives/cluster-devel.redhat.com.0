Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3393C11CB2D
	for <lists+cluster-devel@lfdr.de>; Thu, 12 Dec 2019 11:43:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576147391;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/zEUYkQw4TCVmwOl9Oigd8Z+IiQES5Uqv766MQgtSgY=;
	b=QU4xk6e0pPLoNC7T/t/8n4jVCyaF17987ekmIPAxOSvc8fcUD49ww03Ze4Cjbmpp+xd2UR
	voi9l3MJXpMUZthDPXAR7eKF+1KT0XzAPxEEoo2StHNEeaOfC4G8gGOwKTjmPfdgCH2fKT
	PMa5y/JF30+U4o65PHyKdjLrDQCsCK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-9Sm6uYCbNoOEmfDeFMoC-g-1; Thu, 12 Dec 2019 05:43:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45C6D107ACE4;
	Thu, 12 Dec 2019 10:43:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE8605C1C3;
	Thu, 12 Dec 2019 10:43:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CE1AD83729;
	Thu, 12 Dec 2019 10:43:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBCAh0jN018191 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 12 Dec 2019 05:43:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E0831120EDD; Thu, 12 Dec 2019 10:42:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB9151C677
	for <cluster-devel@redhat.com>; Thu, 12 Dec 2019 10:42:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E5DE18AE966
	for <cluster-devel@redhat.com>; Thu, 12 Dec 2019 10:42:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-149-7FbwRMwZPHOIhhard8KZ5g-1; Thu, 12 Dec 2019 05:42:54 -0500
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1ifLvo-00057S-Rx; Thu, 12 Dec 2019 10:42:52 +0000
Date: Thu, 12 Dec 2019 02:42:52 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20191212104252.GA3956@infradead.org>
References: <20191210101938.495-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191210101938.495-1-agruenba@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: 7FbwRMwZPHOIhhard8KZ5g-1
X-MC-Unique: 9Sm6uYCbNoOEmfDeFMoC-g-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBCAh0jN018191
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>, Christoph Hellwig <hch@lst.de>,
	"Darrick J . Wong" <darrick.wong@oracle.com>
Subject: Re: [Cluster-devel] [PATCH 15/15] gfs2: use iomap for buffered I/O
 in ordered and writeback mode
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Dec 10, 2019 at 11:19:38AM +0100, Andreas Gruenbacher wrote:
> @@ -75,13 +75,12 @@ static int gfs2_unstuffer_page(struct gfs2_inode *ip,=
 struct buffer_head *dibh,
>  =09=09memcpy(kaddr, dibh->b_data + sizeof(struct gfs2_dinode), dsize);
>  =09=09memset(kaddr + dsize, 0, PAGE_SIZE - dsize);
>  =09=09kunmap(page);
> -
> -=09=09SetPageUptodate(page);
>  =09}
> =20
>  =09if (gfs2_is_jdata(ip)) {
>  =09=09struct buffer_head *bh;
> =20
> +=09=09SetPageUptodate(page);
>  =09=09if (!page_has_buffers(page))
>  =09=09=09create_empty_buffers(page, BIT(inode->i_blkbits),
>  =09=09=09=09=09     BIT(BH_Uptodate));
> @@ -93,6 +92,9 @@ static int gfs2_unstuffer_page(struct gfs2_inode *ip, s=
truct buffer_head *dibh,
>  =09=09set_buffer_uptodate(bh);
>  =09=09gfs2_trans_add_data(ip->i_gl, bh);
>  =09} else {
> +=09=09iomap_page_create(inode, page);
> +=09=09iomap_set_range_uptodate(page, 0, i_blocksize(inode));
> +=09=09set_page_dirty(page);
>  =09=09gfs2_ordered_add_inode(ip);
>  =09}

Can you create a helper that copies the data from a passed in kernel
pointer, length pair into the page, then marks it uptodate and dirty,
please?

> @@ -555,6 +555,8 @@ static vm_fault_t gfs2_page_mkwrite(struct vm_fault *=
vmf)
>  out_uninit:
>  =09gfs2_holder_uninit(&gh);
>  =09if (ret =3D=3D 0) {
> +=09=09if (!gfs2_is_jdata(ip))
> +=09=09=09iomap_page_create(inode, page);

What is this one for?  The iomap_page is supposed to use lazy
allocation, that is we only allocate it once it is used.  What code
expects the structure but doesn't see it without this hunk?  I
guess it is iomap_writepage_map, which should probably just switch
to call iomap_page_create.

That being said is there any way we can get gfs2 to use
iomap_page_mkwrite for the !jdata case?


