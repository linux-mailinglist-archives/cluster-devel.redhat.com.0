Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DB06EB212
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Apr 2023 21:07:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682104038;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RTIVCPaAIe5DaXmytPh3uMUZkXVTpfqbAAuRg7DgY/8=;
	b=HgLkFQ77zLti4tM3m7+D/FpVOga6HqEQMBOHnNmAn9PWVC+PslfMtgfxLR+mKD81DWyD+A
	AjpYOEkIa7NUeOs1hnAGWd/8q1scf9JIt7hFRt/rapdIghEH0316JrjBrLvpojpS50MEIo
	tunFdBxSecmq0kmJY8pZ47z6okJcASI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-adyRZvGmNqufGvnK_9DfFA-1; Fri, 21 Apr 2023 15:07:16 -0400
X-MC-Unique: adyRZvGmNqufGvnK_9DfFA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D45CF88606C;
	Fri, 21 Apr 2023 19:07:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C8E82140EBF4;
	Fri, 21 Apr 2023 19:07:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 90E2E1946A47;
	Fri, 21 Apr 2023 19:07:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B687719466DF for <cluster-devel@listman.corp.redhat.com>;
 Fri, 21 Apr 2023 19:07:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 99AE12026D25; Fri, 21 Apr 2023 19:07:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.net (unknown [10.2.16.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D7952026D16
 for <cluster-devel@redhat.com>; Fri, 21 Apr 2023 19:07:13 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Apr 2023 15:07:09 -0400
Message-Id: <20230421190710.397684-4-rpeterso@redhat.com>
In-Reply-To: <20230421190710.397684-1-rpeterso@redhat.com>
References: <20230421190710.397684-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [GFS2 PATCH 3/4] gfs2: Issue message when revokes
 cannot be written
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Before this patch, function gfs2_ail_empty_gl would silently return an
error to the caller. This would get silently set into sd_log_error which
would cause a withdraw, but there was no indication why the file system
was withdrawn. This patch adds a fs_err to log the appropriate error
message.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/glops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index 8e245d793e6b..4b3949f2020b 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -127,6 +127,8 @@ static int gfs2_ail_empty_gl(struct gfs2_glock *gl)
 	if (!ret) {
 		__gfs2_ail_flush(gl, 0, revokes);
 		gfs2_trans_end(sdp);
+	} else {
+		fs_err(sdp, "Transaction error %d: Unable to write revokes.", ret);
 	}
 
 flush:
-- 
2.39.2

