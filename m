Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3D85C12F9D9
	for <lists+cluster-devel@lfdr.de>; Fri,  3 Jan 2020 16:31:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578065501;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JpqUUx0alOnH066gfyHnqS2CSmKU3f3B8fn7lnmKUSg=;
	b=dUyrSkncHKP0P+zSbscaB6Us8RpTTfBdSZbj0d/3njVHbLeZj9xVIxHPeNtISyDBaKLsVt
	pqfdmiOLUveK/fKFCXT36VpKGlnNEFtcOr6k8FHO2kJ/hGnDC1m7pxatrOiRTOAY7rO5qM
	5F+vR0HSfhXwOWgHixQePyCBwDc5HDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-h59XopG2OIyuOixvNyf9HQ-1; Fri, 03 Jan 2020 10:31:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A54CC800D50;
	Fri,  3 Jan 2020 15:31:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93BF384650;
	Fri,  3 Jan 2020 15:31:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C32318089CE;
	Fri,  3 Jan 2020 15:31:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 003FVRma016183 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 3 Jan 2020 10:31:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A91D57BA28; Fri,  3 Jan 2020 15:31:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-64.phx2.redhat.com [10.3.116.64])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D61163BCA
	for <cluster-devel@redhat.com>; Fri,  3 Jan 2020 15:31:27 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  3 Jan 2020 09:31:20 -0600
Message-Id: <20200103153123.402971-4-rpeterso@redhat.com>
In-Reply-To: <20200103153123.402971-1-rpeterso@redhat.com>
References: <20200103153123.402971-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 3/6] gfs2: revoke cleanup:
	gfs2_dinode_dealloc
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
X-MC-Unique: h59XopG2OIyuOixvNyf9HQ-1
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

This patch adds the needed revoke entries to function gfs2_dinode_dealloc.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 68cc7c291a81..c762456a9500 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1188,7 +1188,7 @@ static int gfs2_dinode_dealloc(struct gfs2_inode *ip)
 =09=09goto out_qs;
=20
 =09error =3D gfs2_trans_begin(sdp, RES_RG_BIT + RES_STATFS + RES_QUOTA,
-=09=09=09=09 sdp->sd_jdesc->jd_blocks);
+=09=09=09=09 RES_DINODE + sdp->sd_jdesc->jd_blocks);
 =09if (error)
 =09=09goto out_rg_gunlock;
=20
--=20
2.24.1

