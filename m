Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EDC73FBAD4
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:31:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4XqSsTfk0DbmlWdVtoYk+T85ln2XA7w0RPmN44GiSSc=;
	b=VJ9HDc2efQLaohzzX5HilGnA/bE8p9/Z/jcBMyeCb61wpJf9NPe5cRGUO1wPnAQpo1r/EU
	e6Cgsb8TjPxm+pwxeV4fcxRq4NpwEA/0ZdHyrRhnxLEmhzCv35QmZLD+OUCNHaHY9/SbAi
	7xyFe1IA0Ywv3xrR8U0eKWQ+c8TTPIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-C9z9QJZXNXWohPPsP5TphQ-1; Wed, 13 Nov 2019 16:31:00 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBE118C65F8;
	Wed, 13 Nov 2019 21:30:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D075E44F98;
	Wed, 13 Nov 2019 21:30:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B458918034E9;
	Wed, 13 Nov 2019 21:30:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUtLT005442 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 684E769739; Wed, 13 Nov 2019 21:30:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 326AE69320
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:48 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:23 -0600
Message-Id: <20191113213030.237431-26-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 25/32] gfs2: Withdraw in gfs2_ail1_flush if
	write_cache_pages returns error
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: C9z9QJZXNXWohPPsP5TphQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
index 80b8220c532f..359b85660da9 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -98,6 +98,7 @@ __acquires(&sdp->sd_ail_lock)
 =09struct address_space *mapping;
 =09struct gfs2_bufdata *bd, *s;
 =09struct buffer_head *bh;
+=09int ret =3D 0;
=20
 =09list_for_each_entry_safe_reverse(bd, s, &tr->tr_ail1_list, bd_ail_st_li=
st) {
 =09=09bh =3D bd->bd_bh;
@@ -130,10 +131,16 @@ __acquires(&sdp->sd_ail_lock)
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
@@ -155,6 +162,7 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct write=
back_control *wbc)
 =09struct list_head *head =3D &sdp->sd_ail1_list;
 =09struct gfs2_trans *tr;
 =09struct blk_plug plug;
+=09int ret;
=20
 =09trace_gfs2_ail_flush(sdp, wbc, 1);
 =09blk_start_plug(&plug);
@@ -163,7 +171,10 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writ=
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

