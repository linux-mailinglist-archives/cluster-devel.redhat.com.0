Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 404121170A3
	for <lists+cluster-devel@lfdr.de>; Mon,  9 Dec 2019 16:37:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575905848;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6Ag/ztcszzUYXL9dM97Ypb4K+QjU3W2Q/WUy51c/Nr0=;
	b=bg1Ibt4f4kcL+EwHM2V8okF5aOT+NJE/Xpbbjxs0u0wHoowz4hb80KGTDvb9pWinBp3bIC
	QHm0uzdrgwjBjyk9ipPAAzWeTIdbsgBoHZZzPdZ7aEjlbHI/ljcv5tNOFDjgUIyiT6uDI4
	ljX69VVc9zlRb6omOw7/o25HSXs6Zww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-Xiou8KkdOnSqKvHvGadc7w-1; Mon, 09 Dec 2019 10:37:26 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32E48804912;
	Mon,  9 Dec 2019 15:37:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C04F60C18;
	Mon,  9 Dec 2019 15:37:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0614283556;
	Mon,  9 Dec 2019 15:37:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9FbDmR005028 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 10:37:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0DAD45DA76; Mon,  9 Dec 2019 15:37:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-248.phx2.redhat.com [10.3.116.248])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CE1025D9D6
	for <cluster-devel@redhat.com>; Mon,  9 Dec 2019 15:37:12 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon,  9 Dec 2019 09:36:57 -0600
Message-Id: <20191209153700.700208-20-rpeterso@redhat.com>
In-Reply-To: <20191209153700.700208-1-rpeterso@redhat.com>
References: <20191209153700.700208-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 v8 PATCH 19/22] gfs2: Withdraw in
	gfs2_ail1_flush if write_cache_pages returns error
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
X-MC-Unique: Xiou8KkdOnSqKvHvGadc7w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, function gfs2_ail1_start_one would return any
errors it received from write_cache_pages (except -EBUSY) but it did
not withdraw. Since function gfs2_ail1_flush just checks for the bad
return code and loops, the loop might potentially never end.
This patch adds some logic to allow it to exit the loop and withdraw
properly when errors are received from write_cache_pages.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 799119fa3ecc..33ddf7ccfea9 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -100,6 +100,7 @@ __acquires(&sdp->sd_ail_lock)
 =09struct address_space *mapping;
 =09struct gfs2_bufdata *bd, *s;
 =09struct buffer_head *bh;
+=09int ret =3D 0;
=20
 =09list_for_each_entry_safe_reverse(bd, s, &tr->tr_ail1_list, bd_ail_st_li=
st) {
 =09=09bh =3D bd->bd_bh;
@@ -132,10 +133,16 @@ __acquires(&sdp->sd_ail_lock)
 =09=09if (!mapping)
 =09=09=09continue;
 =09=09spin_unlock(&sdp->sd_ail_lock);
-=09=09generic_writepages(mapping, wbc);
+=09=09ret =3D generic_writepages(mapping, wbc);
 =09=09spin_lock(&sdp->sd_ail_lock);
+=09=09if (ret =3D=3D -EBUSY)
+=09=09=09return 1; /* need to retry */
+=09=09if (ret < 0) {
+=09=09=09set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
+=09=09=09return ret;
+=09=09}
 =09=09if (wbc->nr_to_write <=3D 0)
-=09=09=09break;
+=09=09=09return 0;
 =09=09return 1;
 =09}
=20
@@ -157,6 +164,7 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct write=
back_control *wbc)
 =09struct list_head *head =3D &sdp->sd_ail1_list;
 =09struct gfs2_trans *tr;
 =09struct blk_plug plug;
+=09int ret;
=20
 =09trace_gfs2_ail_flush(sdp, wbc, 1);
 =09blk_start_plug(&plug);
@@ -165,7 +173,10 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writ=
eback_control *wbc)
 =09list_for_each_entry_reverse(tr, head, tr_list) {
 =09=09if (wbc->nr_to_write <=3D 0)
 =09=09=09break;
-=09=09if (gfs2_ail1_start_one(sdp, wbc, tr) && !gfs2_withdrawn(sdp))
+=09=09ret =3D gfs2_ail1_start_one(sdp, wbc, tr);
+=09=09if (ret < 0)
+=09=09=09break;
+=09=09else if (ret)
 =09=09=09goto restart;
 =09}
 =09spin_unlock(&sdp->sd_ail_lock);
--=20
2.23.0

