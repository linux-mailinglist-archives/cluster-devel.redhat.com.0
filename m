Return-Path: <cluster-devel-bounces@listman.redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id 7570231D319
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Feb 2021 01:01:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613520113;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=55A/CXdF8LASq7hRlaB9XYkjTsCh0x9scvGtXGGDawk=;
	b=Px3/ncoRQe5DpCIYgJMnLv/fpFJAIdkl9WAAI7NSO3xbF85DlakZJGA7564xRgB7THD5r/
	LKwwfD9RCIV/euwpScuaVAgNF/WjgAomV/0WUn8pjU95/+v8XNvONHflSFWRyTzv1RLEhz
	Uu/azrzrkNDF9l1M2U7ZIQI+uwsmJ80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-nNaBb5tUMd-T4oiuDrpKWw-1; Tue, 16 Feb 2021 19:01:49 -0500
X-MC-Unique: nNaBb5tUMd-T4oiuDrpKWw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83A4885B660;
	Wed, 17 Feb 2021 00:01:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0AFB6A032;
	Wed, 17 Feb 2021 00:01:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66F4257DFC;
	Wed, 17 Feb 2021 00:01:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11H00tQw031269 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 19:00:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0D4B25C661; Wed, 17 Feb 2021 00:00:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-173.rdu2.redhat.com [10.10.115.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DDC55C1B4;
	Wed, 17 Feb 2021 00:00:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Feb 2021 19:00:37 -0500
Message-Id: <20210217000046.349203-4-aahringo@redhat.com>
In-Reply-To: <20210217000046.349203-1-aahringo@redhat.com>
References: <20210217000046.349203-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 03/12] fs: dlm: set subclass for
	othercon sock_mutex
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252

This patch sets the lockdep subclass for the othercon socket mutex. In
various places the connection socket mutex is held while locking the
othercon socket mutex. This patch will remove lockdep warnings when such
case occurs.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 2fd1e4c13663..d772e1d4461d 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -911,13 +911,14 @@ static int accept_from_sock(struct listen_connection =
*con)
 =09=09=09=09goto accept_err;
 =09=09=09}
=20
+=09=09=09lockdep_set_subclass(&othercon->sock_mutex, 1);
 =09=09=09newcon->othercon =3D othercon;
 =09=09} else {
 =09=09=09/* close other sock con if we have something new */
 =09=09=09close_connection(othercon, false, true, false);
 =09=09}
=20
-=09=09mutex_lock_nested(&othercon->sock_mutex, 1);
+=09=09mutex_lock(&othercon->sock_mutex);
 =09=09add_sock(newsock, othercon);
 =09=09addcon =3D othercon;
 =09=09mutex_unlock(&othercon->sock_mutex);
--=20
2.26.2

