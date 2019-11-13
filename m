Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 80EDDFBAD3
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680656;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Coc+oztDytpeSgal0oEZSuChjFLBlBsPSElhdj+5114=;
	b=K2ztIQyPwA9nqfoFZrTtddSkA8p0ryaEElq0ieFdbMKQAohdO0E+EpFzPaVB/Uz6cidWpK
	AvtlnMIhwnCcl/LOARdTZdQFF/sMxH2jptDLe3PWDT0p/jmNr0CJR4cqo0ST19M2h/eFPe
	Z7HjjCbeq/qRxsEG6oABGTv3LN5ctHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-dSAQTbxaMPO_tmFFSLV4pw-1; Wed, 13 Nov 2019 16:30:55 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B4135B37F;
	Wed, 13 Nov 2019 21:30:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73CF4109C2CC;
	Wed, 13 Nov 2019 21:30:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 59F674BB5B;
	Wed, 13 Nov 2019 21:30:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUm90005416 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8F0D36973B; Wed, 13 Nov 2019 21:30:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58E2069739
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:47 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:22 -0600
Message-Id: <20191113213030.237431-25-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 24/32] gfs2: initialize tr_ail1_list when
	creating transactions
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: dSAQTbxaMPO_tmFFSLV4pw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

In function gfs2_trans_begin, new transactions were created but their
ail1 list, tr_ail1_list was never initialized. Therefore it relied
upon other circumstances when the list became empty.
This patch adds proper initialization of the list.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/trans.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 7d16d9aa3153..790fdd4e8c5e 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -58,6 +58,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int b=
locks,
 =09=09=09=09=09=09   sizeof(u64));
 =09gfs2_assert_warn(sdp, list_empty(&tr->tr_databuf));
 =09gfs2_assert_warn(sdp, list_empty(&tr->tr_buf));
+=09INIT_LIST_HEAD(&tr->tr_ail1_list);
=20
 =09sb_start_intwrite(sdp->sd_vfs);
=20
--=20
2.23.0

