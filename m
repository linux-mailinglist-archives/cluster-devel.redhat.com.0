Return-Path: <cluster-devel-bounces@listman.redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id 438DC31D31B
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Feb 2021 01:01:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613520114;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ASXe6TyAktAU0YndJ4wR+lfsdvjptJFqWbYYABR4Hhg=;
	b=htSLdK+aRU6+epaNQZsbE3aenRwN5bk42FMNaHnysIlgN1PCC9JNICupYEOlOPyMgZPigI
	6aP14s8mCYOw2vZo5DYDek0G6YPZRtCUpe50bEukOIbrK4GU3jRkN7v6TUAUe3gnh4VYui
	Dh1CyLdrcM0EJ33n7nYqBrPekdw0GFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-LwvcTDrsP9yW3ByouxUvXg-1; Tue, 16 Feb 2021 19:01:50 -0500
X-MC-Unique: LwvcTDrsP9yW3ByouxUvXg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1F2885B666;
	Wed, 17 Feb 2021 00:01:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0891226F0;
	Wed, 17 Feb 2021 00:01:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BBB5957DFC;
	Wed, 17 Feb 2021 00:01:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11H00vAT031301 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 19:00:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 343765C5B5; Wed, 17 Feb 2021 00:00:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-173.rdu2.redhat.com [10.10.115.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A7F625C1B4;
	Wed, 17 Feb 2021 00:00:56 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Feb 2021 19:00:40 -0500
Message-Id: <20210217000046.349203-7-aahringo@redhat.com>
In-Reply-To: <20210217000046.349203-1-aahringo@redhat.com>
References: <20210217000046.349203-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 06/12] fs: dlm: change allocation
	limits
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

While running tcpkill I experienced invalid header length values while
receiving to check that a node doesn't try to send a invalid dlm message
we also check on applications minimum allocation limit. Also use
DEFAULT_BUFFER_SIZE as maximum allocation limit. The define
LOWCOMMS_MAX_TX_BUFFER_LEN is to calculate maximum buffer limits on
application layer, future midcomms layer will subtract their needs from
this define.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index d25b9132c593..cef45239a5c0 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1357,9 +1357,11 @@ void *dlm_lowcomms_get_buffer(int nodeid, int len, g=
fp_t allocation, char **ppc)
 =09struct writequeue_entry *e;
 =09int offset =3D 0;
=20
-=09if (len > LOWCOMMS_MAX_TX_BUFFER_LEN) {
-=09=09BUILD_BUG_ON(PAGE_SIZE < LOWCOMMS_MAX_TX_BUFFER_LEN);
+=09if (len > DEFAULT_BUFFER_SIZE ||
+=09    len < sizeof(struct dlm_header)) {
+=09=09BUILD_BUG_ON(PAGE_SIZE < DEFAULT_BUFFER_SIZE);
 =09=09log_print("failed to allocate a buffer of size %d", len);
+=09=09WARN_ON(1);
 =09=09return NULL;
 =09}
=20
--=20
2.26.2

