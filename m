Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id B5B6E197D74
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:48:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576086;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VUK1Eo9UFcBu5dygv/5Vl7rrc7jLA28l5fKwUCH0z9c=;
	b=IhqjT6xz7Ea9ZHEk6kKFEBwHFOXzQI1NCx+EH4/2R8JBk3X7F7S+C6Vi0L842pJirzmtso
	KhziDk56NlmZF4dzYLA9JnFeS9G7ppm7kiD+GSVuEX+bVkMHuTZaoGzrFBC/ffHWsmt6od
	2KxywbOM87Ifj5em3gJEufwtFPsTmbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-_JzWh2ReO1yRk-P766HKyA-1; Mon, 30 Mar 2020 09:46:51 -0400
X-MC-Unique: _JzWh2ReO1yRk-P766HKyA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D4BD8010F5;
	Mon, 30 Mar 2020 13:46:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38F7F19756;
	Mon, 30 Mar 2020 13:46:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D053944CD;
	Mon, 30 Mar 2020 13:46:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkd2H020544 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28E115C1A8; Mon, 30 Mar 2020 13:46:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E194248
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:38 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:11 -0500
Message-Id: <20200330134624.259349-27-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 26/39] gfs2: don't allow releasepage to
	free bd still used for revokes
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Before this patch, function gfs2_releasepage would free any bd
elements that had been used for the page being released. However,
those bd elements may still be queued to the sd_log_revokes list,
in which case we cannot free them until the revoke has been issued.

This patch adds additional checks for bds that are still being
used for revokes.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index ba83b49ce18c..786c1ce8f030 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -805,11 +805,16 @@ int gfs2_releasepage(struct page *page, gfp_t gfp_mas=
k)
 =09=09bd =3D bh->b_private;
 =09=09if (bd) {
 =09=09=09gfs2_assert_warn(sdp, bd->bd_bh =3D=3D bh);
-=09=09=09if (!list_empty(&bd->bd_list))
-=09=09=09=09list_del_init(&bd->bd_list);
 =09=09=09bd->bd_bh =3D NULL;
 =09=09=09bh->b_private =3D NULL;
-=09=09=09kmem_cache_free(gfs2_bufdata_cachep, bd);
+=09=09=09/*
+=09=09=09 * The bd may still be queued as a revoke, in which
+=09=09=09 * case we must not dequeue nor free it.
+=09=09=09 */
+=09=09=09if (!bd->bd_blkno && !list_empty(&bd->bd_list))
+=09=09=09=09list_del_init(&bd->bd_list);
+=09=09=09if (list_empty(&bd->bd_list))
+=09=09=09=09kmem_cache_free(gfs2_bufdata_cachep, bd);
 =09=09}
=20
 =09=09bh =3D bh->b_this_page;
--=20
2.25.1

