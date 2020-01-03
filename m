Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 004B912F9D5
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Jan 2020 16:31:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578065499;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VUM5jU3aVzy0Q0zBAjhnzq9fpU/g6+0ApwaC9uVJw7E=;
	b=SbhLyvE5DcRmJtU9Pox9I99QjKTPA4zKopafuoR+zSC/3+ITagiO3ajcz5Jkl6hFBMlJ3n
	qmPe9IPmYaYVGIrcouYEBmYafi9cNonzUCm8E11PhL1IeoQ7XiqtUWT84xGEZtG4cPgyFS
	D1tqMLM9jdvGFNNzf7bNkQkR3wR4CA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-6pkwk-tOMNiMo-OFl-2YLg-1; Fri, 03 Jan 2020 10:31:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A34A5107AD32;
	Fri,  3 Jan 2020 15:31:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E5C28588A;
	Fri,  3 Jan 2020 15:31:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46E5F1809567;
	Fri,  3 Jan 2020 15:31:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 003FVQq9016173 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jan 2020 10:31:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DBAEF7942E; Fri,  3 Jan 2020 15:31:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-64.phx2.redhat.com [10.3.116.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF6063BCA
	for <cluster-devel@redhat.com>; Fri,  3 Jan 2020 15:31:26 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  3 Jan 2020 09:31:18 -0600
Message-Id: <20200103153123.402971-2-rpeterso@redhat.com>
In-Reply-To: <20200103153123.402971-1-rpeterso@redhat.com>
References: <20200103153123.402971-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/6] gfs2: revoke cleanup: leaf_dealloc
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
X-MC-Unique: 6pkwk-tOMNiMo-OFl-2YLg-1
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

This patch adds the needed revoke entries to function leaf_dealloc.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/dir.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index eb9c0578978f..dfc3a3fa894d 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -2031,7 +2031,8 @@ static int leaf_dealloc(struct gfs2_inode *dip, u32 i=
ndex, u32 len,
=20
 =09error =3D gfs2_trans_begin(sdp,
 =09=09=09rg_blocks + (DIV_ROUND_UP(size, sdp->sd_jbsize) + 1) +
-=09=09=09RES_DINODE + RES_STATFS + RES_QUOTA, l_blocks);
+=09=09=09RES_DINODE + RES_STATFS + RES_QUOTA, RES_DINODE +
+=09=09=09=09 l_blocks);
 =09if (error)
 =09=09goto out_rg_gunlock;
=20
--=20
2.24.1

