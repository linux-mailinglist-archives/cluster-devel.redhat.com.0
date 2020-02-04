Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4F64515206B
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Feb 2020 19:25:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580840712;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uJmr2jU3YKefQ2KnO9Ex3WzJirPRbozY1/t2au94GgQ=;
	b=hnDpp9HSlmIxvsmzxCIUtbDVGhfa1+NTYKqnwB4QxlqcgxGRSaX0E757gD+lxinpVI2SXq
	BpOlLmggK4wIflNF6F5ZspXBMx10/XHF+cph9wGSiPRKe4u8H479uWzCGzlnBbUq8Ghkr4
	UQ5c6sS54RiEYihQcIrWYyzeO0vgb1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-KNzL07vCOZ-5kgQDcWo00g-1; Tue, 04 Feb 2020 13:25:10 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5843100727A;
	Tue,  4 Feb 2020 18:25:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03B7289E76;
	Tue,  4 Feb 2020 18:25:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B31081750;
	Tue,  4 Feb 2020 18:25:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 014IOeTT006265 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 4 Feb 2020 13:24:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4552060BFB; Tue,  4 Feb 2020 18:24:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 165B960BF4
	for <cluster-devel@redhat.com>; Tue,  4 Feb 2020 18:24:37 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  4 Feb 2020 12:24:36 -0600
Message-Id: <20200204182436.6714-1-adas@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: fix gfs2_find_jhead that returns
	jhead with seq 0
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
X-MC-Unique: KNzL07vCOZ-5kgQDcWo00g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

When the first log header in a journal happens to have a
sequence number of 0, a bug in gfs2_find_jhead() returns this
to be the jhead, instead of seeking forward and looking further
into the journal for a jhead with a higher sequence number.

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

