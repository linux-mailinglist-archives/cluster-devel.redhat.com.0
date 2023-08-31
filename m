Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C8878E9D7
	for <lists+cluster-devel@lfdr.de>; Thu, 31 Aug 2023 12:00:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693476038;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=viO3SJjbFB105P6FPaGzg3wrck1TKvHJHqSm+oj8dF4=;
	b=OajBPbqDxyy2hHh8PgV313SbtLbHfbM3ScAT6/rXj/Pt4IhWVqVbM4IZQlzqhaBZvZ6r1r
	KelgtUKOxt3qXaRlaxQM4e+Q7s2ODh3WIiw9cs0e5Qb2W4GNjYDwS/34wkX/xjHYNjmK9Q
	+z+RCC+sCmyKc9yl/uU7mtY+Hxu3ngg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-lBLAg92zMwKsPEUMmBX6BQ-1; Thu, 31 Aug 2023 06:00:35 -0400
X-MC-Unique: lBLAg92zMwKsPEUMmBX6BQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6ACC9101B07D;
	Thu, 31 Aug 2023 10:00:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 181552026D35;
	Thu, 31 Aug 2023 10:00:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CEA821946A7C;
	Thu, 31 Aug 2023 10:00:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E210219465B1 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 31 Aug 2023 09:57:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D2AC2C15E6A; Thu, 31 Aug 2023 09:57:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.42.28.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB7E8C15BAE;
 Thu, 31 Aug 2023 09:57:51 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: agruenba@redhat.com, rpeterso@redhat.com, teigland@redhat.com,
 ccaulfie@redhat.com
Date: Thu, 31 Aug 2023 10:57:49 +0100
Message-ID: <20230831095749.9616-2-anprice@redhat.com>
In-Reply-To: <20230831095749.9616-1-anprice@redhat.com>
References: <20230831095749.9616-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 2/2] MAINTAINERS: Update dlm mailing list
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The new gfs2@ list will also be used for dlm development.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index caae31fb9741..946fcf6c8d77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6093,7 +6093,7 @@ F:	include/video/udlfb.h
 DISTRIBUTED LOCK MANAGER (DLM)
 M:	Christine Caulfield <ccaulfie@redhat.com>
 M:	David Teigland <teigland@redhat.com>
-L:	cluster-devel@redhat.com
+L:	gfs2@lists.linux.dev
 S:	Supported
 W:	http://sources.redhat.com/cluster/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git
-- 
2.41.0

