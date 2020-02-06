Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A499A154950
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Feb 2020 17:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581006874;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JTkMNQTW1yVr40eta5gOoPZhvwNV33fKzaDRDKmWT6Q=;
	b=F7OsMgvITnzcyVcC2lqjr8SVIFQ+2VHk+8HUfdKn/LUbS7LcQpE1ROWJjMC2ZK1JZG9tuL
	iU5Y+uuK9sLXpI84GngReDcFntJpfljbbXNj8yXGnq6UENe2RPQYI1RhkdBmTMKt0zD5x2
	U/jjUG3biNrFrj0sTog75x1d8uWNuEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-zmbUPlZpNXC4FISyPBflAA-1; Thu, 06 Feb 2020 11:34:33 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B054410CF289;
	Thu,  6 Feb 2020 16:34:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32A7060BEC;
	Thu,  6 Feb 2020 16:34:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F170318089C8;
	Thu,  6 Feb 2020 16:34:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 016GYLck000638 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Feb 2020 11:34:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 284B9109928; Thu,  6 Feb 2020 16:34:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24450108BFB
	for <cluster-devel@redhat.com>; Thu,  6 Feb 2020 16:34:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BFEE2803B37
	for <cluster-devel@redhat.com>; Thu,  6 Feb 2020 16:34:18 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-255-OZyg2ePjMV2wIqVUXrTlDg-1;
	Thu, 06 Feb 2020 11:34:13 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7697368B05; Thu,  6 Feb 2020 17:34:11 +0100 (CET)
Date: Thu, 6 Feb 2020 17:34:11 +0100
From: Christoph Hellwig <hch@lst.de>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <20200206163411.GB22198@lst.de>
References: <20200206153720.31584-1-agruenba@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200206153720.31584-1-agruenba@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-MC-Unique: OZyg2ePjMV2wIqVUXrTlDg-1
X-MC-Unique: zmbUPlZpNXC4FISyPBflAA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 016GYLck000638
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Christoph Hellwig <hch@lst.de>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Clean up gfs2_file_write_iter and
 fix O_SYNC write handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

>  =09if (iocb->ki_flags & IOCB_DIRECT) {
>  =09=09struct address_space *mapping =3D file->f_mapping;
> +=09=09ssize_t buffered, ret2;
> =20
> +=09=09ret =3D gfs2_file_direct_write(iocb, from);
> +=09=09if (ret < 0 || !iov_iter_count(from))
>  =09=09=09goto out_unlock;
> =20
>  =09=09current->backing_dev_info =3D inode_to_bdi(inode);
> +=09=09buffered =3D iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops=
);
>  =09=09current->backing_dev_info =3D NULL;
> -=09=09if (unlikely(ret < 0))
> +=09=09if (unlikely(buffered <=3D 0))
>  =09=09=09goto out_unlock;
> =20
>  =09=09/*
>  =09=09 * We need to ensure that the page cache pages are written to
>  =09=09 * disk and invalidated to preserve the expected O_DIRECT
> +=09=09 * semantics.  If the writeback or invalidate fails, only report
> +=09=09 * the direct I/O range as we don't know if the buffered pages
> +=09=09 * made it to disk.
>  =09=09 */
> +=09=09iocb->ki_pos +=3D buffered;
> +=09=09iocb->ki_flags |=3D IOCB_DSYNC;

I think I'd rather add IOCB_DSYNC before calling
iomap_file_buffered_write, just in case we ever do optimizations for
synchronous I/O there.

> +=09=09ret2 =3D generic_write_sync(iocb, buffered);
> +=09=09invalidate_mapping_pages(mapping,
> +=09=09=09=09=09 (iocb->ki_pos - buffered) >> PAGE_SHIFT,

This adds a line > 80 chars.

Otherwise this looks fine to me, although I'd just put the fix in the
subject line and just mention the cleanup at the end of the actual
commit log.


