Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD334AE31B
	for <lists+cluster-devel@lfdr.de>; Tue,  8 Feb 2022 22:46:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644356776;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uNr7wJGWcUnE8g+TGFaqmqtldzP0qfEr/uR3Czgo4RA=;
	b=DVXSsz4SLwVQ2B7QCWAIzuUbRHxRvTIayhKUCdC+hqMo4ISt6K7LLYmKjnZzfK9aCfu1oY
	c7fX/Ag6wOyRco4+UyIbXgM5NXGAkewynQJXximl1NU1apDnc88pdCY3CkWZyuCFZU2Y0f
	YiqT4aRjIHTzZvdaRZcuBoFk40OO2kk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-mWWFm1JWP46cmXB3Ek6RvA-1; Tue, 08 Feb 2022 16:46:13 -0500
X-MC-Unique: mWWFm1JWP46cmXB3Ek6RvA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE1CA1091DA5;
	Tue,  8 Feb 2022 21:46:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3E305E24E;
	Tue,  8 Feb 2022 21:46:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBC5318218AF;
	Tue,  8 Feb 2022 21:46:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 218LcCsQ006063 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 8 Feb 2022 16:38:12 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 958CF4CED9; Tue,  8 Feb 2022 21:38:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44D9156A84;
	Tue,  8 Feb 2022 21:38:12 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  8 Feb 2022 16:37:48 -0500
Message-Id: <20220208213749.997455-3-aahringo@redhat.com>
In-Reply-To: <20220208213749.997455-1-aahringo@redhat.com>
References: <20220208213749.997455-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 2/3] dlm_controld: add
	-fplugin=annobin to CFLAGS
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds fplugin=annobin to the CFLAGS of dlm_controld. The tool
annocheck gave a failure and it's recommended to add such flag to fix
the issue. Afterwards the failure is gone.

https://sourceware.org/annobin/annobin.html/Test-notes.html
---
 dlm_controld/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dlm_controld/Makefile b/dlm_controld/Makefile
index a92fdebe..9cf7152f 100644
--- a/dlm_controld/Makefile
+++ b/dlm_controld/Makefile
@@ -47,7 +47,7 @@ CFLAGS += -D_GNU_SOURCE -O2 -ggdb \
 
 BIN_CFLAGS += $(CFLAGS) -fPIE -DPIE
 BIN_CFLAGS += -I../include -I../libdlm
-LIB_CFLAGS += $(CFLAGS) -fPIC
+LIB_CFLAGS += $(CFLAGS) -fPIC -fplugin=annobin
 
 BIN_LDFLAGS += $(LDFLAGS) -Wl,-z,relro -Wl,-z,now -pie
 BIN_LDFLAGS += -lpthread -lrt -lcpg -lcmap -lcfg -lquorum -luuid
-- 
2.31.1

