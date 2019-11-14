Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 077B6FCB66
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 18:06:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573751162;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SS6SRxy8fPWH3stF5n+AlyWKLRTQCY8QISsD0hyY5sw=;
	b=MYJaOdA4gCtQwVSr+83rDZP6BJftBwJCdMesyJra4H98mjJu3TXZpvm3dC8U4dJ7D7Evvt
	RZLifMUSORQSt8EZYy3mVvh8XiXdMX4UGW8ryAbJHqQhLOVCwf1ldU1dOrfAyE9Jk8i/UY
	StmX8NZG/aqQ5+8z8oXVwWRFP+6loKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-_eVqM-8oP66kejBHnktYOA-1; Thu, 14 Nov 2019 12:06:01 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8859107B7F2;
	Thu, 14 Nov 2019 17:05:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EDBB675E4B;
	Thu, 14 Nov 2019 17:05:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C1F11832C19;
	Thu, 14 Nov 2019 17:05:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEH5n7o032311 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 12:05:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9200060FC4; Thu, 14 Nov 2019 17:05:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8730660BF7
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 17:05:45 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8D991832C15
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 17:05:45 +0000 (UTC)
Date: Thu, 14 Nov 2019 12:05:45 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <709405430.29951966.1573751145790.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.140, 10.4.195.17]
Thread-Topic: gfs2: initialize tr_ail1_list when creating transactions
Thread-Index: RwXoUlmjaqMJdAfhFhFrBuHsR2BNfA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: initialize tr_ail1_list when
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: _eVqM-8oP66kejBHnktYOA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

In function gfs2_trans_begin, new transactions were created but their
ail1 list, tr_ail1_list was never initialized. Therefore it relied
upon other circumstances when the list became empty.
This patch adds proper initialization of the list.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/trans.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 9d4227330de4..d0efa322f940 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -53,6 +53,7 @@ int gfs2_trans_begin(struct gfs2_sbd *sdp, unsigned int b=
locks,
 =09=09=09=09=09=09   sizeof(u64));
 =09INIT_LIST_HEAD(&tr->tr_databuf);
 =09INIT_LIST_HEAD(&tr->tr_buf);
+=09INIT_LIST_HEAD(&tr->tr_ail1_list);
=20
 =09sb_start_intwrite(sdp->sd_vfs);
=20

