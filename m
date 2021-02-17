Return-Path: <cluster-devel-bounces@listman.redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id 9748431D324
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Feb 2021 01:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613520148;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dP7kiYGSn6Uh7DXsJTHpPM2CEO3jGURAGdYb1ySpFCA=;
	b=I64P619yY3U1H/oCpkLcrVRSPVnmotq+OBiSFtzJnU0B9LdySYBYh5SgNKvUNXlISu5DDI
	orFROUB4bNElm6gbCA+Vb11iGiODRrqCfaW9ZEW4p3Srf7BWDQJSfNVPboF6PTqYvVhPXZ
	LyS+LVU+j4H8d1oDW4nC29NfUXm557o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-ma-erDDeNfyvJ-v_LNMSzQ-1; Tue, 16 Feb 2021 19:02:24 -0500
X-MC-Unique: ma-erDDeNfyvJ-v_LNMSzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51C0B107ACE8;
	Wed, 17 Feb 2021 00:02:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EF865D72F;
	Wed, 17 Feb 2021 00:02:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EDAB18095CD;
	Wed, 17 Feb 2021 00:02:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11H010Al031354 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 19:01:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C5E635C6C1; Wed, 17 Feb 2021 00:01:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-173.rdu2.redhat.com [10.10.115.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 454DB5C1B4;
	Wed, 17 Feb 2021 00:01:00 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Feb 2021 19:00:45 -0500
Message-Id: <20210217000046.349203-12-aahringo@redhat.com>
In-Reply-To: <20210217000046.349203-1-aahringo@redhat.com>
References: <20210217000046.349203-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 11/12] fs: dlm: flush swork on
	shutdown
X-BeenThere: cluster-devel@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@listman.redhat.com>
List-Help: <mailto:cluster-devel-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@listman.redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@listman.redhat.com
Errors-To: cluster-devel-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252

This patch fixes the flushing of send work before shutdown. The function
cancel_work_sync() is not the right workqueue functionality to use here
as it would cancel the work if the work queues itself. In cases of
EAGAIN in send() for dlm message we need to be sure that everything is
send out before. The function flush_work() will ensure that every send
work is be done inclusive in EAGAIN cases.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index d9784ff0ca30..e6652189a282 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -688,10 +688,7 @@ static void shutdown_connection(struct connection *con=
)
 {
 =09int ret;
=20
-=09if (cancel_work_sync(&con->swork)) {
-=09=09log_print("canceled swork for node %d", con->nodeid);
-=09=09clear_bit(CF_WRITE_PENDING, &con->flags);
-=09}
+=09flush_work(&con->swork);
=20
 =09mutex_lock(&con->sock_mutex);
 =09/* nothing to shutdown */
--=20
2.26.2

