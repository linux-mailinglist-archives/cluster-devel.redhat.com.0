Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 73D9E197D6B
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:47:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576024;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZdcJXAgh8zqs/ODyXtWgqzpAztXR1OohEaHpx8Lvf9s=;
	b=GIYGr9dvquPEv+ogVxOlOVtuR4gQS5ioEfpwBZaargRJLcqtMFL6NXyOAW0Wiou6CHsgmF
	/aTPGY+2jKlMDKjUFLLvMKNx4LAZxauR73XcILj4j0yrITLEuI8QL7tlUE1SIFl0GzHpc+
	cfi8VhoOdYS1JjlvnD/6nXBqNcjW4vU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-N5LvwRFAOsuiSwYjjQ59_Q-1; Mon, 30 Mar 2020 09:47:02 -0400
X-MC-Unique: N5LvwRFAOsuiSwYjjQ59_Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DA5819067E3;
	Mon, 30 Mar 2020 13:47:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BF2F97B17;
	Mon, 30 Mar 2020 13:47:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0ED52944D4;
	Mon, 30 Mar 2020 13:47:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDklKA020724 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B0AA97B13; Mon, 30 Mar 2020 13:46:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4FD3948
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:47 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:24 -0500
Message-Id: <20200330134624.259349-40-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 39/39] gfs2: Fix oversight in
	gfs2_ail1_flush
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Ordinarily, function gfs2_ail1_start_one issues a write request
for one item on the ail1 list, then returns -EBUSY. This makes the
caller, gfs2_ail1_flush, loop around and start another. However,
it was not clearing the -EBUSY return code each time through the loop.
So on rare occasions, like when the wbc runs out of nr_to_write, it
remained set to -EBUSY, which triggered an error and withdraw.

This patch sets the return code to 0 each time through the restart
loop so this won't happen anymore.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 82f356f57045..3a75843ae580 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -188,13 +188,14 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct wri=
teback_control *wbc)
 =09struct list_head *head =3D &sdp->sd_ail1_list;
 =09struct gfs2_trans *tr;
 =09struct blk_plug plug;
-=09int ret =3D 0;
+=09int ret;
 =09unsigned long flush_start =3D jiffies;
=20
 =09trace_gfs2_ail_flush(sdp, wbc, 1);
 =09blk_start_plug(&plug);
 =09spin_lock(&sdp->sd_ail_lock);
 restart:
+=09ret =3D 0;
 =09if (time_after(jiffies, flush_start + (HZ * 600))) {
 =09=09dump_ail_list(sdp);
 =09=09goto out;
--=20
2.25.1

