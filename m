Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id BCF6E197D5B
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:46:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576014;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qwV5r6IWeI4x2WoT2ZuabiTBBPPyRaHE8NzXjErDNME=;
	b=AiobVrb4EcwXzExcdqSIUe9qTEpDfLaG5Cu2NBglaf+bf5+xoiv7HuHO32pVVTXA5fXD9h
	WYeP0B19w7hsUIfIEEXzpmZNUUcB4mqQcpTJKVBx1gHTdvi4QSPqiG7fNF3oZoTYzBNr3I
	+8zm70l3vMAwyGBUBGqFhRJI5RqEiIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-LY08YxX6MR2iYWKSlvhniA-1; Mon, 30 Mar 2020 09:46:51 -0400
X-MC-Unique: LY08YxX6MR2iYWKSlvhniA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFA6085B6FF;
	Mon, 30 Mar 2020 13:46:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB01460BEC;
	Mon, 30 Mar 2020 13:46:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9AAC4944DD;
	Mon, 30 Mar 2020 13:46:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkbJY020493 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F378D5C1A8; Mon, 30 Mar 2020 13:46:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B880548
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:36 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:06 -0500
Message-Id: <20200330134624.259349-22-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 21/39] gfs2: Withdraw in
	gfs2_ail1_flush if write_cache_pages fails
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, function gfs2_ail1_start_one would return any
errors it received from write_cache_pages (except -EBUSY) but it did
not withdraw. Since function gfs2_ail1_flush just checks for the bad
return code and loops, the loop might potentially never end.
This patch adds some logic to allow it to exit the loop and withdraw
properly when errors are received from write_cache_pages.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
Reviewed-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/log.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index c37f81470792..ed80ef8e5c33 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -96,6 +96,7 @@ __acquires(&sdp->sd_ail_lock)
 =09struct address_space *mapping;
 =09struct gfs2_bufdata *bd, *s;
 =09struct buffer_head *bh;
+=09int ret =3D 0;
=20
 =09list_for_each_entry_safe_reverse(bd, s, &tr->tr_ail1_list, bd_ail_st_li=
st) {
 =09=09bh =3D bd->bd_bh;
@@ -128,14 +129,14 @@ __acquires(&sdp->sd_ail_lock)
 =09=09if (!mapping)
 =09=09=09continue;
 =09=09spin_unlock(&sdp->sd_ail_lock);
-=09=09generic_writepages(mapping, wbc);
+=09=09ret =3D generic_writepages(mapping, wbc);
 =09=09spin_lock(&sdp->sd_ail_lock);
-=09=09if (wbc->nr_to_write <=3D 0)
+=09=09if (ret || wbc->nr_to_write <=3D 0)
 =09=09=09break;
-=09=09return 1;
+=09=09return -EBUSY;
 =09}
=20
-=09return 0;
+=09return ret;
 }
=20
=20
@@ -153,6 +154,7 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct write=
back_control *wbc)
 =09struct list_head *head =3D &sdp->sd_ail1_list;
 =09struct gfs2_trans *tr;
 =09struct blk_plug plug;
+=09int ret =3D 0;
=20
 =09trace_gfs2_ail_flush(sdp, wbc, 1);
 =09blk_start_plug(&plug);
@@ -161,12 +163,16 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct wri=
teback_control *wbc)
 =09list_for_each_entry_reverse(tr, head, tr_list) {
 =09=09if (wbc->nr_to_write <=3D 0)
 =09=09=09break;
-=09=09if (gfs2_ail1_start_one(sdp, wbc, tr) && !gfs2_withdrawn(sdp))
-=09=09=09goto restart;
+=09=09ret =3D gfs2_ail1_start_one(sdp, wbc, tr);
+=09=09if (ret) {
+=09=09=09if (ret =3D=3D -EBUSY)
+=09=09=09=09goto restart;
+=09=09=09break;
+=09=09}
 =09}
 =09spin_unlock(&sdp->sd_ail_lock);
 =09blk_finish_plug(&plug);
-=09if (test_bit(SDF_WITHDRAWING, &sdp->sd_flags))
+=09if (ret)
 =09=09gfs2_withdraw(sdp);
 =09trace_gfs2_ail_flush(sdp, wbc, 0);
 }
--=20
2.25.1

