Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 334E972CB95
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Jun 2023 18:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686587637;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YSL1KjH1pF2hhwjrGe7mpz5gSyYZdxVsmDkQ3zWkOEo=;
	b=JslM10v8ZsQ/eewNxErUH7Gc4xqJWGWTq7mTPw+4iUaHXCyIBNRb7wbkPGscdI+Xo1D5zS
	D3l/RBQ8off6DJ8dvLMs5yKR1+1uYqi+Dj6Du9xPEfqaUTlnfNBqhLLcUiyNeWpN1lAB1d
	zgKqzo00e0eBe8f6CQSHjZ4mn7yX3kI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-o-yxho6WPrmJTbOk8mHWhg-1; Mon, 12 Jun 2023 12:33:53 -0400
X-MC-Unique: o-yxho6WPrmJTbOk8mHWhg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF7811C00D0F;
	Mon, 12 Jun 2023 16:33:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4D3C20234B3;
	Mon, 12 Jun 2023 16:33:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7E3A919465B9;
	Mon, 12 Jun 2023 16:33:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E3653194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C62A62026D20; Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from pasta.redhat.com (unknown [10.45.224.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4604020234B3;
 Mon, 12 Jun 2023 16:33:51 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 12 Jun 2023 18:33:43 +0200
Message-Id: <20230612163347.1293077-5-agruenba@redhat.com>
In-Reply-To: <20230612163347.1293077-1-agruenba@redhat.com>
References: <20230612163347.1293077-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH 4/8] gfs2: Reconfiguring frozen filesystem
 already rejected
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Reconfiguring a frozen filesystem is already rejected in
reconfigure_super(), so there is no need to check for that condition
again at the filesystem level.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 fs/gfs2/ops_fstype.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 4fb25496e92f..12eedba45dbb 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1590,12 +1590,6 @@ static int gfs2_reconfigure(struct fs_context *fc)
 		fc->sb_flags |= SB_RDONLY;
 
 	if ((sb->s_flags ^ fc->sb_flags) & SB_RDONLY) {
-		struct gfs2_holder freeze_gh;
-
-		error = gfs2_freeze_lock_shared(sdp, &freeze_gh, 0);
-		if (error)
-			return -EINVAL;
-
 		if (fc->sb_flags & SB_RDONLY) {
 			gfs2_make_fs_ro(sdp);
 		} else {
@@ -1603,7 +1597,6 @@ static int gfs2_reconfigure(struct fs_context *fc)
 			if (error)
 				errorfc(fc, "unable to remount read-write");
 		}
-		gfs2_freeze_unlock(&freeze_gh);
 	}
 	sdp->sd_args = *newargs;
 
-- 
2.40.0

