Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F30B46EB217
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Apr 2023 21:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682104042;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Sq2E5+ucXn+vhTJ1iZP3b+s7qbh8UQhRl0dxIXP42bA=;
	b=ImB7gf8VSYU0hNlrs+VRSJrFqNyExBcNZ7e72c5oCKaK8GDH3CenRTw0BFDcxa9KFyyTl9
	vXPT+yATLhIXXS3JUg09NZ+ObIct3Z2y+4Eg2zhpzQmIJ0cxSWs/prGo8r4mAVnXqiDx2N
	jdlFxYjeSkuusG5TiziVOI8Jh7CORV8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-x6ZUKwqAO8yNdlZOdUWkHw-1; Fri, 21 Apr 2023 15:07:17 -0400
X-MC-Unique: x6ZUKwqAO8yNdlZOdUWkHw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3A482814264;
	Fri, 21 Apr 2023 19:07:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AEDF1111F3B0;
	Fri, 21 Apr 2023 19:07:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 400611946A4C;
	Fri, 21 Apr 2023 19:07:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F339119466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Apr 2023 19:07:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E27482026D25; Fri, 21 Apr 2023 19:07:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.net (unknown [10.2.16.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B41312026D16
 for <cluster-devel@redhat.com>; Fri, 21 Apr 2023 19:07:13 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Apr 2023 15:07:10 -0400
Message-Id: <20230421190710.397684-5-rpeterso@redhat.com>
In-Reply-To: <20230421190710.397684-1-rpeterso@redhat.com>
References: <20230421190710.397684-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [GFS2 PATCH 4/4] gfs2: gfs2_ail_empty_gl no log
 flush on error
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Before this patch function gfs2_ail_empty_gl called gfs2_log_flush even
in cases where it encountered an error. It should probably skip the log
flush and leave the file system in an inconsistent state, letting a
subsequent withdraw force the journal to be replayed to reestablish
metadata consistency.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 4b3949f2020b..ef31218060aa 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -132,8 +132,9 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
 	}
 
 flush:
-	gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
-		       GFS2_LFC_AIL_EMPTY_GL);
+	if (!ret)
+		gfs2_log_flush(sdp, NULL, GFS2_LOG_HEAD_FLUSH_NORMAL |
+				GFS2_LFC_AIL_EMPTY_GL);
 	return ret;
 }
 
-- 
2.39.2

