Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 613DB12F9DA
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Jan 2020 16:31:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578065501;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Gd85AjGNj8wQL+phz/69GoJ0NBMW+TIjHNsS9tgPtRY=;
	b=FsxentpUGLrJp0bPPHIev+d5WhxUui4Ets9aH5B/YtGLG7dMdbO/3dmuHIHxKNkCmuNDr9
	fhVYenDKl/zAYra2RWRDyRmUr8sSsJKOXRZGhbwr/gsYRp3UP5ETMA8pUPgX3XjsM3z1bX
	NWkmJnEHRQwt5SAtaDGrWDJK3VwUHrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-Mg1XQh60NE2Rv1MnK9Id2Q-1; Fri, 03 Jan 2020 10:31:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A59C918557D1;
	Fri,  3 Jan 2020 15:31:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94FA95C548;
	Fri,  3 Jan 2020 15:31:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0206E18089CD;
	Fri,  3 Jan 2020 15:31:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 003FVS68016193 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jan 2020 10:31:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 15D3663BCA; Fri,  3 Jan 2020 15:31:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-64.phx2.redhat.com [10.3.116.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE7087BA20
	for <cluster-devel@redhat.com>; Fri,  3 Jan 2020 15:31:27 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  3 Jan 2020 09:31:21 -0600
Message-Id: <20200103153123.402971-5-rpeterso@redhat.com>
In-Reply-To: <20200103153123.402971-1-rpeterso@redhat.com>
References: <20200103153123.402971-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 4/6] gfs2: revoke cleanup:
	gfs2_iomap_begin_write
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
X-MC-Unique: Mg1XQh60NE2Rv1MnK9Id2Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Several gfs2 functions failed to reserve enough revoke entries for their
transactions in the journal. Function gfs2_trans_remove_revoke unconditiona=
lly
decrements tr->tr_num_revoke, and if not enough revokes are reserved, the
value goes from 0 to  4294967295 (-1, but it's an unsigned int). This is la=
ter
re-added to the system-wide revoke numbers, thereby decrementing the value
(sd_log_commited_revoke) "properly," but by accident. This worked properly
most of the time because one transaction would reserve space for revokes,
then it would be merged with the system transaction (sdp->sd_log_tr) and it
usually did not run out, because you can hold a lot of revoke entries
per log descriptor block. Some of the code, such as gfs2_write_revokes, wou=
ld
work around this and somehow got it right most of the time. However, some
jdata tests with xfstests generic/269 encountered problems when it actually
ran out.

This patch is part of a series that tries to do proper accounting of revoke=
s.

This patch adds the needed revoke entries to function gfs2_iomap_begin_writ=
e.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/bmap.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
index 08f6fbb3655e..403d5ada2f52 100644
--- a/fs/gfs2/bmap.c
+++ b/fs/gfs2/bmap.c
@@ -1074,7 +1074,7 @@ static int gfs2_iomap_begin_write(struct inode *inode=
, loff_t pos,
 =09if (unstuff || iomap->type =3D=3D IOMAP_HOLE) {
 =09=09unsigned int data_blocks, ind_blocks;
 =09=09struct gfs2_alloc_parms ap =3D {};
-=09=09unsigned int rblocks;
+=09=09unsigned int rblocks, new_blocks =3D 0;
 =09=09struct gfs2_trans *tr;
=20
 =09=09gfs2_write_calc_reserv(ip, iomap->length, &data_blocks,
@@ -1095,10 +1095,10 @@ static int gfs2_iomap_begin_write(struct inode *ino=
de, loff_t pos,
 =09=09=09rblocks +=3D RES_STATFS + RES_QUOTA;
 =09=09if (inode =3D=3D sdp->sd_rindex)
 =09=09=09rblocks +=3D 2 * RES_STATFS;
-=09=09rblocks +=3D gfs2_rg_blocks(ip, data_blocks + ind_blocks);
+=09=09new_blocks +=3D gfs2_rg_blocks(ip, data_blocks + ind_blocks);
+=09=09rblocks +=3D new_blocks;
=20
-=09=09ret =3D gfs2_trans_begin(sdp, rblocks,
-=09=09=09=09       iomap->length >> inode->i_blkbits);
+=09=09ret =3D gfs2_trans_begin(sdp, rblocks, new_blocks);
 =09=09if (ret)
 =09=09=09goto out_trans_fail;
=20
--=20
2.24.1

