Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB26F4BE1
	for <lists+cluster-devel@lfdr.de>; Fri,  8 Nov 2019 13:37:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573216678;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rp6vY/xrJRqVjjz7hak1AlwiNCRb5liX8A4x+uFxDBM=;
	b=Yge1AguUUBaUg5hOwpI2w5DV6rg2v0t1fpoqBIL+/8pKm0cOPLQ+wDU2c24RNLI/AMCRDA
	erq61CTj2XJuTZn6xv5sC/5Dp6n2L+KdJrIydPz41UnPVUftYcsnls5i2nqTREIRyC3OBg
	eSmCNif3splveixdYtN9SnxxAwzJ6yU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-yDDIblL-M4CnHj3bWzAilQ-1; Fri, 08 Nov 2019 07:37:56 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80B1E1800DFB;
	Fri,  8 Nov 2019 12:37:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E7595ED42;
	Fri,  8 Nov 2019 12:37:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B6C04BB5B;
	Fri,  8 Nov 2019 12:37:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA8Cbo57002118 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 8 Nov 2019 07:37:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 034606919F; Fri,  8 Nov 2019 12:37:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (unknown [10.40.206.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 237EE6084E;
	Fri,  8 Nov 2019 12:37:46 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Fri,  8 Nov 2019 13:37:43 +0100
Message-Id: <20191108123743.4994-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Improve mmap write vs. punch_hole
	consistency
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
X-MC-Unique: yDDIblL-M4CnHj3bWzAilQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

When punching a hole in a file, use filemap_write_and_wait_range to
write back any dirty pages in the range of the hole.  As a side effect,
if the hole isn't page aligned, this marks unaligned pages at the
beginning and the end of the hole read-only.  This is required when the
block size is smaller than the page size: when those pages are written
to again after the hole punching, we must make sure that page_mkwrite is
called for those pages so that the page will be fully allocated and any
blocks turned into holes from the hole punching will be reallocated.
(If a page is writably mapped, page_mkwrite won't be called.)

Fixes xfstest generic/567.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/bmap.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index f63df54a08c6..bb0113a0b0f4 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -2440,8 +2440,16 @@ int __gfs2_punch_hole(struct file *file, loff_t offs=
et, loff_t length)
 =09struct inode *inode =3D file_inode(file);
 =09struct gfs2_inode *ip =3D GFS2_I(inode);
 =09struct gfs2_sbd *sdp =3D GFS2_SB(inode);
+=09unsigned int blocksize =3D i_blocksize(inode);
+=09loff_t start, end;
 =09int error;
=20
+=09start =3D round_down(offset, blocksize);
+=09end =3D round_up(offset + length, blocksize) - 1;
+=09error =3D filemap_write_and_wait_range(inode->i_mapping, start, end);
+=09if (error)
+=09=09return error;
+
 =09if (gfs2_is_jdata(ip))
 =09=09error =3D gfs2_trans_begin(sdp, RES_DINODE + 2 * RES_JDATA,
 =09=09=09=09=09 GFS2_JTRUNC_REVOKES);
@@ -2455,9 +2463,8 @@ int __gfs2_punch_hole(struct file *file, loff_t offse=
t, loff_t length)
 =09=09if (error)
 =09=09=09goto out;
 =09} else {
-=09=09unsigned int start_off, end_len, blocksize;
+=09=09unsigned int start_off, end_len;
=20
-=09=09blocksize =3D i_blocksize(inode);
 =09=09start_off =3D offset & (blocksize - 1);
 =09=09end_len =3D (offset + length) & (blocksize - 1);
 =09=09if (start_off) {
--=20
2.20.1

