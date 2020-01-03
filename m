Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1528A12F9D8
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Jan 2020 16:31:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578065500;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OF0qed5+qjk+6COyhenI3vx5u0zHJDbeclOW4v17OIU=;
	b=chOigBdhXMovWZmpctG78fXanv6bwdqqHkhyUHKwevU2o9/Bc1WN+/Z9aH+Qv6+pCBigMN
	QH4QUxkxvR2ge+vuNS7xFBboQlYbP7IoMG6kI3s20JZP9hw4KANarCMclZnbECwLvDL4VB
	za/G1ELErkdgYxhqzFXYnaIKxqtZiHY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-b5HLOAc_MnqgzLyYlWePzw-1; Fri, 03 Jan 2020 10:31:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8803C91205;
	Fri,  3 Jan 2020 15:31:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E50085882;
	Fri,  3 Jan 2020 15:31:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34C26820E8;
	Fri,  3 Jan 2020 15:31:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 003FVRvk016178 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jan 2020 10:31:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4905F63BCA; Fri,  3 Jan 2020 15:31:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-64.phx2.redhat.com [10.3.116.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C2917BA20
	for <cluster-devel@redhat.com>; Fri,  3 Jan 2020 15:31:26 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  3 Jan 2020 09:31:19 -0600
Message-Id: <20200103153123.402971-3-rpeterso@redhat.com>
In-Reply-To: <20200103153123.402971-1-rpeterso@redhat.com>
References: <20200103153123.402971-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 2/6] gfs2: revoke cleanup: alloc_dinode
	and gfs2_create_inode
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
X-MC-Unique: b5HLOAc_MnqgzLyYlWePzw-1
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

This patch adds the needed revoke entries to functions alloc_dinode and
gfs2_create_inode.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/inode.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/inode.c b/fs/gfs2/inode.c
index dafef10b91f1..eb0989ff1c6f 100644
--- a/fs/gfs2/inode.c
+++ b/fs/gfs2/inode.c
@@ -383,7 +383,8 @@ static int alloc_dinode(struct gfs2_inode *ip, u32 flag=
s, unsigned *dblocks)
 =09if (error)
 =09=09goto out_quota;
=20
-=09error =3D gfs2_trans_begin(sdp, (*dblocks * RES_RG_BIT) + RES_STATFS + =
RES_QUOTA, 0);
+=09error =3D gfs2_trans_begin(sdp, (*dblocks * RES_RG_BIT) + RES_STATFS +
+=09=09=09=09 RES_QUOTA, *dblocks);
 =09if (error)
 =09=09goto out_ipreserv;
=20
@@ -709,7 +710,7 @@ static int gfs2_create_inode(struct inode *dir, struct =
dentry *dentry,
 =09if (error)
 =09=09goto fail_free_inode;
=20
-=09error =3D gfs2_trans_begin(sdp, blocks, 0);
+=09error =3D gfs2_trans_begin(sdp, blocks, RES_DINODE);
 =09if (error)
 =09=09goto fail_free_inode;
=20
--=20
2.24.1

