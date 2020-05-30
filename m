Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 43B9D1E8FD1
	for <lists+cluster-devel@lfdr.de>; Sat, 30 May 2020 10:39:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590827971;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fguc+c9vjymOgp0ik2SahIhaystKV7lXCjyPJo0s7co=;
	b=HoDObcwxJZbTnoxeqCMRWkR9PhlEWQTE8frIa04ZHBkbHftQ/hx3hazMsX69P+zTMF4IbR
	klMYFKJigpqc+6Yi7h0zxSU1W9gitli/oLuoa653SJqRj7OtVnzqJ3DuG72rJ1qWsD1m1l
	PQpEM7LJlEePQIARIPS5C9vosWE40lk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-MFDj-lAYONOiidRf7iiVSQ-1; Sat, 30 May 2020 04:39:29 -0400
X-MC-Unique: MFDj-lAYONOiidRf7iiVSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4292D1005510;
	Sat, 30 May 2020 08:39:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47F8A5D9EF;
	Sat, 30 May 2020 08:39:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B31D31809543;
	Sat, 30 May 2020 08:39:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04U8dDYO001349 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 30 May 2020 04:39:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E6B12166BA0; Sat, 30 May 2020 08:39:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29F822166B27
	for <cluster-devel@redhat.com>; Sat, 30 May 2020 08:39:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED00A80CDAE
	for <cluster-devel@redhat.com>; Sat, 30 May 2020 08:39:10 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp10.smtpout.orange.fr
	[80.12.242.132]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-388-s8eTPxTaNk2HoUi9265mYA-1; Sat, 30 May 2020 04:39:07 -0400
X-MC-Unique: s8eTPxTaNk2HoUi9265mYA-1
Received: from localhost.localdomain ([93.23.15.192]) by mwinf5d20 with ME
	id kwf52200C48dfat03wf5Mf; Sat, 30 May 2020 10:39:06 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 30 May 2020 10:39:06 +0200
X-ME-IP: 93.23.15.192
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: ccaulfie@redhat.com, teigland@redhat.com
Date: Sat, 30 May 2020 10:39:03 +0200
Message-Id: <20200530083903.578271-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] dlm: Fix a typo in a comment
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

s/locksapce/lockspace/

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 fs/dlm/lockspace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index e93670ecfae5..f17e091daab3 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -859,7 +859,7 @@ static int release_lockspace(struct dlm_ls *ls, int force)
  * until this returns.
  *
  * Force has 4 possible values:
- * 0 - don't destroy locksapce if it has any LKBs
+ * 0 - don't destroy lockspace if it has any LKBs
  * 1 - destroy lockspace if it has remote LKBs but not if it has local LKBs
  * 2 - destroy lockspace regardless of LKBs
  * 3 - destroy lockspace as part of a forced shutdown
-- 
2.25.1

