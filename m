Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 090CAFBABC
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680646;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D2DzexevL6ZMHRyl5cyWQBNz6lOGypH9rVpB4KCFI3E=;
	b=PgZO+iemtEu0xwPe3AIzfOOvtP1kUPJ+jHucgr41BPonPnvSafiFVbBW/yWhuL0vaDdiJY
	z8KlfTPCbPAkftj+VXq5ooqSlGTj3srxweLAEudMZ357hsbCUwkX4wAfJ6foVSSe+K21ow
	LZcIRZRvN7n64Aa2GH2Bbr+Xm9R9Lms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-c63WN4ETNMS_EmUZBDUjNQ-1; Wed, 13 Nov 2019 16:30:43 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 037C810A951A;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 45149A7F1;
	Wed, 13 Nov 2019 21:30:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 12FB318034EA;
	Wed, 13 Nov 2019 21:30:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUZn9005198 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CBCFA6973B; Wed, 13 Nov 2019 21:30:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97B0D69739
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:35 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:02 -0600
Message-Id: <20191113213030.237431-5-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 04/32] gfs2: fix infinite loop in
	gfs2_ail1_flush on io error
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
X-MC-Unique: c63WN4ETNMS_EmUZBDUjNQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Before this patch, an IO error encountered in function gfs2_ail1_flush
would cause a deadlock: because of the io error (and its resulting
withdrawn state), buffers stopped being written to the journal.
Buffers would remain on the ail1 list, so gfs2_ail1_start_one would
return 1 to indicate dirty buffers were still on the ail1 list.
However, when function gfs2_ail1_flush got a non-zero return code,
it would goto restart to retry the writes, which meant it would never
finish, and thus the infinite loop.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index a36889eea302..6d6013c05e05 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -163,7 +163,7 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct write=
back_control *wbc)
 =09list_for_each_entry_reverse(tr, head, tr_list) {
 =09=09if (wbc->nr_to_write <=3D 0)
 =09=09=09break;
-=09=09if (gfs2_ail1_start_one(sdp, wbc, tr))
+=09=09if (gfs2_ail1_start_one(sdp, wbc, tr) && !gfs2_withdrawn(sdp))
 =09=09=09goto restart;
 =09}
 =09spin_unlock(&sdp->sd_ail_lock);
--=20
2.23.0

