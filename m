Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id ED40C13C89D
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 17:01:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579104066;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NdTWfc/g93G5iTuYxoihXSgF54Bd23yx5OrsHqcwu/I=;
	b=UkmevtjnjRtJTHuU60T7HZgUM15i94JZruQ3UJr0vjrdtqeMX6nUmxp0kKqufVeyWo8j4h
	8q+XA7j6QQqv1NkZ6xizzsgY+vNEBnExZQtSz7MeGssoFXtMjRNbUfD4bi+GeCmZtwQz4g
	zx/DTN34zatybkVinjUYMu8WJ/HeeYU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-AWh5HrcTOIOFMD1m9srdKQ-1; Wed, 15 Jan 2020 11:01:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BFC9188EF2;
	Wed, 15 Jan 2020 16:01:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D8D210021B2;
	Wed, 15 Jan 2020 16:01:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1962D18089C8;
	Wed, 15 Jan 2020 16:01:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FG0xTf013979 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 11:01:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C4A872026D68; Wed, 15 Jan 2020 16:00:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFA5C2022EB3
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 16:00:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F143D18AE953
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 16:00:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-378-fYovrN6qOdCn6zW0vZGvdA-1; Wed, 15 Jan 2020 11:00:55 -0500
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irkke-0005Q1-P6
	for cluster-devel@redhat.com; Wed, 15 Jan 2020 15:38:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: cluster-devel@redhat.com
Date: Wed, 15 Jan 2020 16:38:29 +0100
Message-Id: <20200115153830.440420-2-hch@lst.de>
In-Reply-To: <20200115153830.440420-1-hch@lst.de>
References: <20200115153830.440420-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-MC-Unique: fYovrN6qOdCn6zW0vZGvdA-1
X-MC-Unique: AWh5HrcTOIOFMD1m9srdKQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00FG0xTf013979
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 1/2] gfs2: move setting
	current->backing_dev_info
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Only set current->backing_dev_info just around the buffered write calls
to prepare for the next fix.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/gfs2/file.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 9d58295ccf7a..21d032c4b077 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -867,18 +867,15 @@ static ssize_t gfs2_file_write_iter(struct kiocb *ioc=
b, struct iov_iter *from)
 =09inode_lock(inode);
 =09ret =3D generic_write_checks(iocb, from);
 =09if (ret <=3D 0)
-=09=09goto out;
-
-=09/* We can write back this queue in page reclaim */
-=09current->backing_dev_info =3D inode_to_bdi(inode);
+=09=09goto out_unlock;
=20
 =09ret =3D file_remove_privs(file);
 =09if (ret)
-=09=09goto out2;
+=09=09goto out_unlock;
=20
 =09ret =3D file_update_time(file);
 =09if (ret)
-=09=09goto out2;
+=09=09goto out_unlock;
=20
 =09if (iocb->ki_flags & IOCB_DIRECT) {
 =09=09struct address_space *mapping =3D file->f_mapping;
@@ -887,11 +884,13 @@ static ssize_t gfs2_file_write_iter(struct kiocb *ioc=
b, struct iov_iter *from)
=20
 =09=09written =3D gfs2_file_direct_write(iocb, from);
 =09=09if (written < 0 || !iov_iter_count(from))
-=09=09=09goto out2;
+=09=09=09goto out_unlock;
=20
+=09=09current->backing_dev_info =3D inode_to_bdi(inode);
 =09=09ret =3D iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
+=09=09current->backing_dev_info =3D NULL;
 =09=09if (unlikely(ret < 0))
-=09=09=09goto out2;
+=09=09=09goto out_unlock;
 =09=09buffered =3D ret;
=20
 =09=09/*
@@ -915,14 +914,14 @@ static ssize_t gfs2_file_write_iter(struct kiocb *ioc=
b, struct iov_iter *from)
 =09=09=09 */
 =09=09}
 =09} else {
+=09=09current->backing_dev_info =3D inode_to_bdi(inode);
 =09=09ret =3D iomap_file_buffered_write(iocb, from, &gfs2_iomap_ops);
+=09=09current->backing_dev_info =3D NULL;
 =09=09if (likely(ret > 0))
 =09=09=09iocb->ki_pos +=3D ret;
 =09}
=20
-out2:
-=09current->backing_dev_info =3D NULL;
-out:
+out_unlock:
 =09inode_unlock(inode);
 =09if (likely(ret > 0)) {
 =09=09/* Handle various SYNC-type writes */
--=20
2.24.1


