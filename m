Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEC7FC948
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 15:53:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573743183;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=urFqX4/drRlbKbJHWywqdWIQM69t9e/vH3yY6eZ8w8g=;
	b=csN5sEuFE5QGyDKnCz/hIJ5GRMyKYxzWZY4UwFuwkWYcG/L7UmSgOwVY7ytCm2egFuyAMT
	EAETBJHbqhqS31VAnbHUCDjjgw84Kc2C/nETT7WkV0dpHS9hYoxKjYoodHI/jK1dW/Royz
	/XWtP95ekgaSXpgPaJ0+N7JZwsy4kEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-0Z0gGHMkO1CIC-T-rB-MJg-1; Thu, 14 Nov 2019 09:53:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 822CE800C73;
	Thu, 14 Nov 2019 14:52:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60D625C1C3;
	Thu, 14 Nov 2019 14:52:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 436FB4BB65;
	Thu, 14 Nov 2019 14:52:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEEqv5Q023476 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 09:52:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B39126B8F7; Thu, 14 Nov 2019 14:52:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEFA06918E
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 14:52:54 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AB604BB5B
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 14:52:54 +0000 (UTC)
Date: Thu, 14 Nov 2019 09:52:54 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <549273539.29724089.1573743174064.JavaMail.zimbra@redhat.com>
In-Reply-To: <813668675.29723783.1573743165910.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.140, 10.4.195.18]
Thread-Topic: gfs2: fix infinite loop in gfs2_ail1_flush on io error
Thread-Index: KUBYoTw5igZEmokKH8ZXhR2OdvVbRg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: fix infinite loop in
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 0Z0gGHMkO1CIC-T-rB-MJg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

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
 fs/gfs2/log.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 4a7713c62f04..6ad59fc17565 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -161,7 +161,8 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct write=
back_control *wbc)
 =09list_for_each_entry_reverse(tr, head, tr_list) {
 =09=09if (wbc->nr_to_write <=3D 0)
 =09=09=09break;
-=09=09if (gfs2_ail1_start_one(sdp, wbc, tr, &withdraw))
+=09=09if (gfs2_ail1_start_one(sdp, wbc, tr, &withdraw) &&
+=09=09    !gfs2_withdrawn(sdp))
 =09=09=09goto restart;
 =09}
 =09spin_unlock(&sdp->sd_ail_lock);

