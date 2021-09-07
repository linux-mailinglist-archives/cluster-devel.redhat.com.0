Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACC1402CC8
	for <lists+cluster-devel@lfdr.de>; Tue,  7 Sep 2021 18:22:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631031735;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qCgrTSSv9pcujVd3ErACuOVq9sxIc9E63WAk9SIytMg=;
	b=YzK2Cy/KUWEfzdaMYO7lCO1zAw8xr2ylZnRuYHYBUCXcowfkiqfETNYBTqn1RwgvpCpTZt
	sotlWG0kyd9uyKXTELg9rrTz2Rmk2NVv2jBqIsC8KLdKERP9JKyTr4wequ0+cuW6DPdIke
	78u3AteNN8FEjIVMsy6P3bykegZgCYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-Ca7MurZ3MX-YTv3k_NonMQ-1; Tue, 07 Sep 2021 12:22:14 -0400
X-MC-Unique: Ca7MurZ3MX-YTv3k_NonMQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5294C1940925;
	Tue,  7 Sep 2021 16:22:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D09710013D7;
	Tue,  7 Sep 2021 16:22:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 227BD4EA7A;
	Tue,  7 Sep 2021 16:22:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 187GLx7E003927 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 7 Sep 2021 12:21:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B9C8560BD8; Tue,  7 Sep 2021 16:21:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79B6560657;
	Tue,  7 Sep 2021 16:21:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  7 Sep 2021 12:21:49 -0400
Message-Id: <20210907162149.1442293-2-aahringo@redhat.com>
In-Reply-To: <20210907162149.1442293-1-aahringo@redhat.com>
References: <20210907162149.1442293-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/tool 2/2] dlm_controld: add version
	check for libquorum
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds a simple version check for libquorum. Since commit
2e893b98 ("dlm_controld: use new quorum api to detect missed failures")
dlm_controld uses functionality which is only available in libquorum
3.1.0 and upwards.
---
 dlm_controld/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
index 66799807..8cfc97e6 100644
--- a/dlm_controld/Makefile
+++ b/dlm_controld/Makefile
@@ -60,6 +60,10 @@ ifeq ($(USE_SD_NOTIFY),yes)
 	BIN_LDFLAGS += $(shell $(PKG_CONFIG) --libs libsystemd)
 endif
 
+ifeq (, $(shell $(PKG_CONFIG) --libs "libquorum >= 3.1.0"))
+	 $(error "Requires libquorum at least version 3.1.0")
+endif
+
 all: $(LIB_TARGET) $(BIN_TARGET) $(LIB_PC)
 
 $(BIN_TARGET): $(BIN_SOURCE)
-- 
2.27.0

