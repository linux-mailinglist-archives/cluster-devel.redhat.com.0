Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 93D39152170
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Feb 2020 21:15:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580847310;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ShL29z/BMs/t4nBhQ0pnuXfVkdqYRIh9n7AgODkw20E=;
	b=OKvG3GakNqc8ox72rxVpNDornpdH0Y883jFqmtDWh0L3OrNlRNW1v9CEX7ITZqHfQ4Y7gE
	ar05889633id49NN2LDMpwi6SfN2hlIVYSt8W2vnljWEVPXI/oYoYA3WWWVHGsRfzOozAs
	V8iiF6JU2EKaiVaoehCNNFFdRzJ0Dio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-ZvCfmMUFOfe1LfacJ7C2dQ-1; Tue, 04 Feb 2020 15:15:08 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D545D1088389;
	Tue,  4 Feb 2020 20:15:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1A185D9E2;
	Tue,  4 Feb 2020 20:15:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 941DA8173F;
	Tue,  4 Feb 2020 20:15:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 014KExVQ010653 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 4 Feb 2020 15:14:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9DC6C387; Tue,  4 Feb 2020 20:14:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F8AD19C69
	for <cluster-devel@redhat.com>; Tue,  4 Feb 2020 20:14:56 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  4 Feb 2020 14:14:56 -0600
Message-Id: <20200204201456.7764-1-adas@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH v2] gfs2: fix gfs2_find_jhead that
	returns uninitialized jhead with seq 0
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ZvCfmMUFOfe1LfacJ7C2dQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

This version changes the description as per discussion with Andreas.

Cheers!
--Abhi

When the first log header in a journal happens to have a sequence
number of 0, a bug in gfs2_find_jhead() causes it to prematurely exit,
and return an uninitialized jhead with seq 0. This can cause failures
in the caller. For instance, a mount fails in one test case.

The correct behavior is for it to continue searching through the journal
to find the correct journal head with the highest sequence number.

Signed-off-by: Abhi Das <adas@redhat.com>
---
 fs/gfs2/lops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index d9431724b788..c090d5ad3f22 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -422,7 +422,7 @@ static bool gfs2_jhead_pg_srch(struct gfs2_jdesc *jd,
=20
 =09for (offset =3D 0; offset < PAGE_SIZE; offset +=3D sdp->sd_sb.sb_bsize)=
 {
 =09=09if (!__get_log_header(sdp, kaddr + offset, 0, &lh)) {
-=09=09=09if (lh.lh_sequence > head->lh_sequence)
+=09=09=09if (lh.lh_sequence >=3D head->lh_sequence)
 =09=09=09=09*head =3D lh;
 =09=09=09else {
 =09=09=09=09ret =3D true;
--=20
2.20.1

