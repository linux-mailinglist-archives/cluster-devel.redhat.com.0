Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FA655771D
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jun 2022 11:50:25 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-9rL7ykKWPPm8Y4eh60EXnQ-1; Thu, 23 Jun 2022 05:50:21 -0400
X-MC-Unique: 9rL7ykKWPPm8Y4eh60EXnQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EB851818800;
	Thu, 23 Jun 2022 09:50:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52849492CA5;
	Thu, 23 Jun 2022 09:50:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 09ABC194B944;
	Thu, 23 Jun 2022 09:50:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 58E351947063 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 23 Jun 2022 09:40:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4C1B2492CA6; Thu, 23 Jun 2022 09:40:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48006492CA5
 for <cluster-devel@redhat.com>; Thu, 23 Jun 2022 09:40:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 343913C0D181
 for <cluster-devel@redhat.com>; Thu, 23 Jun 2022 09:40:58 +0000 (UTC)
Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209]) by
 relay.mimecast.com with ESMTP id us-mta-664-w7WrvqSzNQWF1WkKUa5RoQ-1; Thu,
 23 Jun 2022 05:40:53 -0400
X-MC-Unique: w7WrvqSzNQWF1WkKUa5RoQ-1
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id E06C31E80D14;
 Thu, 23 Jun 2022 17:37:02 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGLm8S3ZuZgU; Thu, 23 Jun 2022 17:37:00 +0800 (CST)
Received: from localhost.localdomain (unknown [112.64.61.33])
 (Authenticated sender: jiaming@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 01ED21E80C85;
 Thu, 23 Jun 2022 17:36:59 +0800 (CST)
From: Zhang Jiaming <jiaming@nfschina.com>
To: rpeterso@redhat.com,
	agruenba@redhat.com
Date: Thu, 23 Jun 2022 17:37:16 +0800
Message-Id: <20220623093716.13338-1-jiaming@nfschina.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Thu, 23 Jun 2022 09:50:15 +0000
Subject: [Cluster-devel] [PATCH] gfs2: Fix spelling mistake
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
Cc: cluster-devel@redhat.com, liqiong@nfschina.com, renyu@nfschina.com,
 linux-kernel@vger.kernel.org, Zhang Jiaming <jiaming@nfschina.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Change 'accomodate' to 'accommodate'.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 fs/gfs2/lock_dlm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 2559a79cf14b..6ce369b096d4 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -1058,7 +1058,7 @@ static int control_first_done(struct gfs2_sbd *sdp)
=20
 /*
  * Expand static jid arrays if necessary (by increments of RECOVER_SIZE_IN=
C)
- * to accomodate the largest slot number.  (NB dlm slot numbers start at 1=
,
+ * to accommodate the largest slot number.  (NB dlm slot numbers start at =
1,
  * gfs2 jids start at 0, so jid =3D slot - 1)
  */
=20
--=20
2.25.1

