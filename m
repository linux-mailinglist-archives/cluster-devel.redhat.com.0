Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 94B4E1B7CA2
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Apr 2020 19:25:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587749108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uaBVQAUbtGKe5vqjQGM+cL7iPfDZ4T8VBl8w8odWUxY=;
	b=R2NdEHBktEIcL3s/UlVrftH6j2Y2WOgW15unpbtgva4L3kdR93UFFLbSBZywtyu4J/Q2Ub
	qO5nGWmpPWQf8hk3fCixWlevFxyaPbvKnbYfxylq/5PE3GszcOJcZtMTUGFUTRIe8cnurI
	WEB22JYpvJv5YUmDv4XmCExg8QEncf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-aRsU-vc8P_SewgwsWUndhA-1; Fri, 24 Apr 2020 13:25:06 -0400
X-MC-Unique: aRsU-vc8P_SewgwsWUndhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6593A107ACCD;
	Fri, 24 Apr 2020 17:25:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E45C5C1D2;
	Fri, 24 Apr 2020 17:25:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 248F21809543;
	Fri, 24 Apr 2020 17:25:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OHOwYV020703 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 13:24:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D85A19080; Fri, 24 Apr 2020 17:24:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-238.phx2.redhat.com [10.3.112.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F4AF605D1;
	Fri, 24 Apr 2020 17:24:58 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 24 Apr 2020 12:24:56 -0500
Message-Id: <20200424172456.616586-5-rpeterso@redhat.com>
In-Reply-To: <20200424172456.616586-1-rpeterso@redhat.com>
References: <20200424172456.616586-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 4/4] gfs2: Fix use-after-free in
	gfs2_logd after withdraw
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

When the gfs2_logd daemon withdrew, the withdraw sequence called
into make_fs_ro() to make the file system read-only. That caused the
journal descriptors to be freed. However, those journal descriptors
were used by gfs2_logd's call to gfs2_ail_flush_reqd(). This caused
a use-after free and NULL pointer dereference.

This patch changes function gfs2_logd() so that it stops all logd
work until the thread is told to stop. Once a withdraw is done,
it only does an interruptible sleep.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 3a75843ae580..cf0b80c78c82 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -1131,6 +1131,10 @@ int gfs2_logd(void *data)
=20
 =09while (!kthread_should_stop()) {
=20
+=09=09if (gfs2_withdrawn(sdp)) {
+=09=09=09msleep_interruptible(HZ);
+=09=09=09continue;
+=09=09}
 =09=09/* Check for errors writing to the journal */
 =09=09if (sdp->sd_log_error) {
 =09=09=09gfs2_lm(sdp,
@@ -1139,6 +1143,7 @@ int gfs2_logd(void *data)
 =09=09=09=09"prevent further damage.\n",
 =09=09=09=09sdp->sd_fsname, sdp->sd_log_error);
 =09=09=09gfs2_withdraw(sdp);
+=09=09=09continue;
 =09=09}
=20
 =09=09did_flush =3D false;
--=20
2.25.1

