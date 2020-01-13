Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6050E13930B
	for <lists+cluster-devel@lfdr.de>; Mon, 13 Jan 2020 15:04:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578924275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6mDRAo7YNZ5djbdtD29y6631w2yrG2esekGQvNKBzZ4=;
	b=hSDuh3lDdusVIzsqGWJ3Fr0r5cYtYz1CVNdtZJwK350C2ccl0ojSXxmHrjEe4k1iHb3XBN
	goEgxKXAn+k5GihUhsUTK+9geH7tbdX38Agg8ur0Vgq/RCQQ/DcBT49UyiKFbZizeWeRz1
	x4RU8QK9SMJF7Mwy+rbOF9Laru3XqPQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-Ube30RU6Pai806G9MFa3Rw-1; Mon, 13 Jan 2020 09:04:33 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB558800D4E;
	Mon, 13 Jan 2020 14:04:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B712C10840F6;
	Mon, 13 Jan 2020 14:04:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2AE3818089CE;
	Mon, 13 Jan 2020 14:04:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DE4Peq017072 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 09:04:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 63A7819756; Mon, 13 Jan 2020 14:04:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-64.phx2.redhat.com [10.3.116.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 248D219C6A
	for <cluster-devel@redhat.com>; Mon, 13 Jan 2020 14:04:25 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 13 Jan 2020 08:04:20 -0600
Message-Id: <20200113140421.867659-2-rpeterso@redhat.com>
In-Reply-To: <20200113140421.867659-1-rpeterso@redhat.com>
References: <20200113140421.867659-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/2 v3] Revert "gfs2: eliminate
	tr_num_revoke_rm"
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
X-MC-Unique: Ube30RU6Pai806G9MFa3Rw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This reverts commit e955537e3262de8e56f070b13817f525f472fa00.

Before patch e955537e32, tr_num_revoke tracked the number of revokes
added to the transaction, and tr_num_revoke_rm tracked how many
revokes were removed. But since revokes are queued off the sdp
(superblock) pointer, some transactions could remove more revokes
than they added. (e.g. revokes added by a different process).
Commit e955537e32 eliminated transaction variable tr_num_revoke_rm,
but in order to do so, it changed the accounting to always use
tr_num_revoke for its math. Since you can remove more revokes than
you add, tr_num_revoke could now become a negative value.
This negative value broke the assert in function gfs2_trans_end:

=09if (gfs2_assert_withdraw(sdp, (nbuf <=3D tr->tr_blocks) &&
=09=09=09       (tr->tr_num_revoke <=3D tr->tr_revokes)))

One way to fix this is to simply remove the tr_num_revoke clause
from the assert and allow the value to become negative. Andreas
didn't like that idea, so instead, we decided to revert e955537e32.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/incore.h | 1 +
 fs/gfs2/log.c    | 3 ++-
 fs/gfs2/trans.c  | 6 +++---
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/incore.h b/fs/gfs2/incore.h
index b5d9c11f4901..a5d81a261f77 100644
--- a/fs/gfs2/incore.h
+++ b/fs/gfs2/incore.h
@@ -505,6 +505,7 @@ struct gfs2_trans {
 =09unsigned int tr_num_buf_rm;
 =09unsigned int tr_num_databuf_rm;
 =09unsigned int tr_num_revoke;
+=09unsigned int tr_num_revoke_rm;
=20
 =09struct list_head tr_list;
 =09struct list_head tr_databuf;
diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 66189ae62c1d..6e2728416b6b 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -895,6 +895,7 @@ static void gfs2_merge_trans(struct gfs2_trans *old, st=
ruct gfs2_trans *new)
 =09old->tr_num_buf_rm=09+=3D new->tr_num_buf_rm;
 =09old->tr_num_databuf_rm=09+=3D new->tr_num_databuf_rm;
 =09old->tr_num_revoke=09+=3D new->tr_num_revoke;
+=09old->tr_num_revoke_rm=09+=3D new->tr_num_revoke_rm;
=20
 =09list_splice_tail_init(&new->tr_databuf, &old->tr_databuf);
 =09list_splice_tail_init(&new->tr_buf, &old->tr_buf);
@@ -916,7 +917,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs=
2_trans *tr)
 =09=09set_bit(TR_ATTACHED, &tr->tr_flags);
 =09}
=20
-=09sdp->sd_log_commited_revoke +=3D tr->tr_num_revoke;
+=09sdp->sd_log_commited_revoke +=3D tr->tr_num_revoke - tr->tr_num_revoke_=
rm;
 =09reserved =3D calc_reserved(sdp);
 =09maxres =3D sdp->sd_log_blks_reserved + tr->tr_reserved;
 =09gfs2_assert_withdraw(sdp, maxres >=3D reserved);
diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 4d01fe19c125..a685637a5b55 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -76,10 +76,10 @@ static void gfs2_print_trans(struct gfs2_sbd *sdp, cons=
t struct gfs2_trans *tr)
 =09fs_warn(sdp, "blocks=3D%u revokes=3D%u reserved=3D%u touched=3D%u\n",
 =09=09tr->tr_blocks, tr->tr_revokes, tr->tr_reserved,
 =09=09test_bit(TR_TOUCHED, &tr->tr_flags));
-=09fs_warn(sdp, "Buf %u/%u Databuf %u/%u Revoke %u\n",
+=09fs_warn(sdp, "Buf %u/%u Databuf %u/%u Revoke %u/%u\n",
 =09=09tr->tr_num_buf_new, tr->tr_num_buf_rm,
 =09=09tr->tr_num_databuf_new, tr->tr_num_databuf_rm,
-=09=09tr->tr_num_revoke);
+=09=09tr->tr_num_revoke, tr->tr_num_revoke_rm);
 }
=20
 void gfs2_trans_end(struct gfs2_sbd *sdp)
@@ -264,7 +264,7 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64=
 blkno, unsigned int len)
 =09=09=09if (bd->bd_gl)
 =09=09=09=09gfs2_glock_remove_revoke(bd->bd_gl);
 =09=09=09kmem_cache_free(gfs2_bufdata_cachep, bd);
-=09=09=09tr->tr_num_revoke--;
+=09=09=09tr->tr_num_revoke_rm++;
 =09=09=09if (--n =3D=3D 0)
 =09=09=09=09break;
 =09=09}
--=20
2.24.1

