Return-Path: <cluster-devel-bounces@listman.redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id DAD3E31D31E
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Feb 2021 01:02:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613520127;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PFExlr4dFNNEpYhjKykNv5nUbu4N3tQZlGhUiuBt5gA=;
	b=I3/5IjiMraBFPQWcqXoAN+YyeWebGeJG25GE9ieycn7etxK0OUcRKbyeB55Pj5Yypd9452
	sdlfaf9ctVdVek7s8PHknbL71pFNmu72U9w3w/Z8EBHt+Ir1K4ZTjW31N8bCLlCs5SdCcI
	EIaWzqvuirsjCubkQQRith0rdqQZmwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-AECfw6jJNm6l9CTFokJh_A-1; Tue, 16 Feb 2021 19:02:03 -0500
X-MC-Unique: AECfw6jJNm6l9CTFokJh_A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A64D1C287;
	Wed, 17 Feb 2021 00:02:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 914296F45E;
	Wed, 17 Feb 2021 00:02:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DB8318095CB;
	Wed, 17 Feb 2021 00:02:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11H00s1F031262 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 19:00:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4EBC05C5B5; Wed, 17 Feb 2021 00:00:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-173.rdu2.redhat.com [10.10.115.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C23575C1B4;
	Wed, 17 Feb 2021 00:00:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Feb 2021 19:00:36 -0500
Message-Id: <20210217000046.349203-3-aahringo@redhat.com>
In-Reply-To: <20210217000046.349203-1-aahringo@redhat.com>
References: <20210217000046.349203-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 02/12] fs: dlm: set connected bit
	after accept
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252

This patch sets the CF_CONNECTED bit when dlm accepts a connection from
another node. If we don't set this bit, next time if the connection
socket gets writable it will assume an event that the connection is
successfully connected. However that is only the case when the
connection did a connect.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 372c34ff8594..2fd1e4c13663 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -930,6 +930,7 @@ static int accept_from_sock(struct listen_connection *c=
on)
 =09=09addcon =3D newcon;
 =09}
=20
+=09set_bit(CF_CONNECTED, &addcon->flags);
 =09mutex_unlock(&newcon->sock_mutex);
=20
 =09/*
--=20
2.26.2

