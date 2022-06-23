Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A062557118
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jun 2022 04:33:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655951603;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FcbIi7XiSJ1rOg42cKf2aAhxfmGkNQpXeh2r1eu2uqY=;
	b=Xb/Fpss5sIm6MU2PTRUa5bKUeVB/YBjiNDEZ3edOTpNlotSrkT3+MbTlizPnFOhhu5A0uM
	1a2ly/4HnXecjqmbLb1/7GWtrp6QmFLWJErxM42QTdmimNL9T4aY9KeEbwjyRYuXRF6JuA
	8zTaZNCLocu6t0fSLUb5jwoTkZSjYq4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-495-IdNS_2JoPkS81RBguDbL3w-1; Wed, 22 Jun 2022 22:33:19 -0400
X-MC-Unique: IdNS_2JoPkS81RBguDbL3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 322DA80174C;
	Thu, 23 Jun 2022 02:33:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4806B1121315;
	Thu, 23 Jun 2022 02:33:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B85FE194B947;
	Thu, 23 Jun 2022 02:33:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8CA58194B940 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Jun 2022 02:33:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 70CE81121315; Thu, 23 Jun 2022 02:33:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4D2F41121314;
 Thu, 23 Jun 2022 02:33:14 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 22 Jun 2022 22:33:09 -0400
Message-Id: <20220623023311.1934436-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH dlm-tool 1/3] libdlm: force timeout
 parameter to zero
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch forces to disable the timeout parameter for libdlm users as
this feature is now deprecated and we will just unset it even if the
user sets it to a value.
---
 libdlm/libdlm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/libdlm/libdlm.c b/libdlm/libdlm.c
index ebfba457..fbdf9a09 100644
--- a/libdlm/libdlm.c
+++ b/libdlm/libdlm.c
@@ -807,8 +807,6 @@ static int ls_lock_v6(dlm_lshandle_t ls,
 
 	if (xid)
 		req->i.lock.xid = *xid;
-	if (timeout)
-		req->i.lock.timeout = *timeout;
 
 	if (flags & LKF_CONVERT) {
 		req->i.lock.namelen = 0;
-- 
2.31.1

