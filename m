Return-Path: <cluster-devel-bounces@listman.redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id 8F97431D320
	for <lists+cluster-devel@lfdr.de>; Wed, 17 Feb 2021 01:02:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613520146;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=psuT7rf4lZWGTipK8ry3mqLfYe7OhyuDIAzPr7OyyhY=;
	b=XtQ0qzVPRSs9ZQI5wRBJVgoHkwzP0NoIpAn5LtX7L8M6br07EelspCwkPlvoYQF1RFoCmT
	3BSRkPqzPcAaXEGdsE7iimTaezXRF1IismQvQheCPU/7bLYuafiilw1GFJyyMHN87CM/iv
	KsIdhe71Md/RCAGjOCL3fpCKsFn53EA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-if15BUNjO4agUOwVTA-HNA-1; Tue, 16 Feb 2021 19:02:22 -0500
X-MC-Unique: if15BUNjO4agUOwVTA-HNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63E4D85B66F;
	Wed, 17 Feb 2021 00:02:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 539271B4B4;
	Wed, 17 Feb 2021 00:02:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 36CA818095CC;
	Wed, 17 Feb 2021 00:02:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11H00v1V031310 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Feb 2021 19:00:57 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E21CF5C5B5; Wed, 17 Feb 2021 00:00:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-173.rdu2.redhat.com [10.10.115.173])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62D5C5C1B4;
	Wed, 17 Feb 2021 00:00:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Feb 2021 19:00:41 -0500
Message-Id: <20210217000046.349203-8-aahringo@redhat.com>
In-Reply-To: <20210217000046.349203-1-aahringo@redhat.com>
References: <20210217000046.349203-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 07/12] fs: dlm: use GFP_ZERO for
	page buffer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252

This patch uses GFP_ZERO for allocate a page for the internal dlm
sending buffer allocator instead of calling memset zero after every
allocation. An already allocated space will never be reused again.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c     | 2 --
 fs/dlm/lowcomms.c | 2 +-
 fs/dlm/rcom.c     | 2 --
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 002123efc6b0..b93df39d0915 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3541,8 +3541,6 @@ static int _create_message(struct dlm_ls *ls, int mb_=
len,
 =09if (!mh)
 =09=09return -ENOBUFS;
=20
-=09memset(mb, 0, mb_len);
-
 =09ms =3D (struct dlm_message *) mb;
=20
 =09ms->m_header.h_version =3D (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index cef45239a5c0..e0e74ee82a21 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1336,7 +1336,7 @@ static struct writequeue_entry *new_writequeue_entry(=
struct connection *con,
 =09if (!entry)
 =09=09return NULL;
=20
-=09entry->page =3D alloc_page(allocation);
+=09entry->page =3D alloc_page(allocation | __GFP_ZERO);
 =09if (!entry->page) {
 =09=09kfree(entry);
 =09=09return NULL;
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 73ddee5159d7..f5b1bd65728d 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -41,7 +41,6 @@ static int create_rcom(struct dlm_ls *ls, int to_nodeid, =
int type, int len,
 =09=09=09  to_nodeid, type, len);
 =09=09return -ENOBUFS;
 =09}
-=09memset(mb, 0, mb_len);
=20
 =09rc =3D (struct dlm_rcom *) mb;
=20
@@ -462,7 +461,6 @@ int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *=
rc_in)
 =09mh =3D dlm_lowcomms_get_buffer(nodeid, mb_len, GFP_NOFS, &mb);
 =09if (!mh)
 =09=09return -ENOBUFS;
-=09memset(mb, 0, mb_len);
=20
 =09rc =3D (struct dlm_rcom *) mb;
=20
--=20
2.26.2

