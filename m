Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B227E78E9E3
	for <lists+cluster-devel@lfdr.de>; Thu, 31 Aug 2023 12:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693476295;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ik+Jfzu4U97Qcaeok6+TTXkBn94B/cKiyKy3mBd7lPM=;
	b=T2TvvdqOPK/vbYCYMfljUfQsDqL/+y8rZY2ALQ+cPB8NcrlQANB0ikUfFfXtaSOCnneEsG
	Ui2ko/7xAU/K7g9vZ5rLS1M6omthmAjHcykw61qXfpcx7VPMcR5xzG4XkAK1Z6uX3Ufd3P
	my935AKOKeREHOEWxLt8d1E5f0aDJhk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-NrxM4bgUNu-sq9cjiUR3vQ-1; Thu, 31 Aug 2023 06:04:52 -0400
X-MC-Unique: NrxM4bgUNu-sq9cjiUR3vQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 410E03C1392D;
	Thu, 31 Aug 2023 10:04:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34F7140C6F4C;
	Thu, 31 Aug 2023 10:04:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DB8441946A7C;
	Thu, 31 Aug 2023 10:04:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 252E819465B1 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 31 Aug 2023 09:57:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BB72BC15A0B; Thu, 31 Aug 2023 09:57:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.42.28.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BB960C15BAE;
 Thu, 31 Aug 2023 09:57:50 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: agruenba@redhat.com, rpeterso@redhat.com, teigland@redhat.com,
 ccaulfie@redhat.com
Date: Thu, 31 Aug 2023 10:57:48 +0100
Message-ID: <20230831095749.9616-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH 1/2] MAINTAINERS: Update gfs2 mailing list
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4b8d634f3a4e..caae31fb9741 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8725,7 +8725,7 @@ F:	scripts/get_maintainer.pl
 GFS2 FILE SYSTEM
 M:	Bob Peterson <rpeterso@redhat.com>
 M:	Andreas Gruenbacher <agruenba@redhat.com>
-L:	cluster-devel@redhat.com
+L:	gfs2@lists.linux.dev
 S:	Supported
 B:	https://bugzilla.kernel.org/enter_bug.cgi?product=File%20System&component=gfs2
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
-- 
2.41.0

