Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 51A6734EE29
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:45:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-ymuZtgDjP1mTRTJECvWq8Q-1; Tue, 30 Mar 2021 12:45:23 -0400
X-MC-Unique: ymuZtgDjP1mTRTJECvWq8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B7141084D70;
	Tue, 30 Mar 2021 16:45:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEBB15DDAD;
	Tue, 30 Mar 2021 16:45:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7E0D4BB7C;
	Tue, 30 Mar 2021 16:45:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjI0J010856 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 702102166B44; Tue, 30 Mar 2021 16:45:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B1392166B2D
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52CA5181B7A2
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-458-YibIQdXzO9u1A5RUkkX31w-1; Tue, 30 Mar 2021 12:45:16 -0400
X-MC-Unique: YibIQdXzO9u1A5RUkkX31w-1
Received: by mail-wr1-f54.google.com with SMTP id j7so16922974wrd.1
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=u1njdwRhshSVXy0eOES4wxf/WUKXCRRzOwxm8fp7f+E=;
	b=LeNAdUYIpVYfvZXrxHugxoWb1nFvdXjU1iaSIBv75J7EGiWEA3NnHj9ICrymmRym9s
	iiSLvBkwB2jjCFhN9fReQ6pexH7SIx7Ml4TINcjzvGEAD9UgMjpm3aBqAGKCWVfro3s+
	s5f2GZbWiQ6f4PzxZDFROYWBQG2nn8CKJB7k6EHz73UQYA8WcOSMr30jol54Ab9CLA66
	uAXmIzl1Vp/J7fKU4PPIERkrNE2beQeMN+z4oy2lsXgj18SSazDpQ6UEn82ISUTkuU2W
	8ZdXTtrx1xHVcEOdWozzHvHrY1lV1C1hvp+LiWqquKcW7cDyQSu7k9CbtU4kv930kKZ8
	4xRw==
X-Gm-Message-State: AOAM533SRrgURlShl8xgYhGehOooQmC0q2wwIB+yg0/5UHk1QqkwDOAf
	uWCIu7SEhG/4h1Ck8mGOLNJAMO+3bqyjdw==
X-Google-Smtp-Source: ABdhPJxt8QzhE2HMOmplN4iwxdsgcPCW0HvH3PdfLfKGQgf7xkOBHa50IgLmQlkZk75bmuIDfb185Q==
X-Received: by 2002:adf:9148:: with SMTP id j66mr35679944wrj.124.1617122715069;
	Tue, 30 Mar 2021 09:45:15 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:14 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:41 +0100
Message-Id: <20210330164458.1625478-15-lee.jones@linaro.org>
In-Reply-To: <20210330164458.1625478-1-lee.jones@linaro.org>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 14/31] fs: gfs2: rgrp: Fix a few kernel-doc
	misdemeanours
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

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/rgrp.c:755: warning: expecting prototype for gfs2_compute_bitstructs(). Prototype was for compute_bitstructs() instead
 fs/gfs2/rgrp.c:1549: warning: Function parameter or member 'rs' not described in 'rgd_free'
 fs/gfs2/rgrp.c:2027: warning: Function parameter or member 'rgd' not described in 'fast_to_acquire'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/rgrp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/rgrp.c b/fs/gfs2/rgrp.c
index 89c37a845e649..88133c4ae8e93 100644
--- a/fs/gfs2/rgrp.c
+++ b/fs/gfs2/rgrp.c
@@ -743,7 +743,7 @@ void gfs2_clear_rgrpd(struct gfs2_sbd *sdp)
 }
 
 /**
- * gfs2_compute_bitstructs - Compute the bitmap sizes
+ * compute_bitstructs - Compute the bitmap sizes
  * @rgd: The resource group descriptor
  *
  * Calculates bitmap descriptors, one for each block that contains bitmap data
@@ -1536,6 +1536,7 @@ static void rs_insert(struct gfs2_inode *ip)
 /**
  * rgd_free - return the number of free blocks we can allocate.
  * @rgd: the resource group
+ * @rs: The reservation to free
  *
  * This function returns the number of free blocks for an rgrp.
  * That's the clone-free blocks (blocks that are free, not including those
@@ -2019,6 +2020,7 @@ static bool gfs2_select_rgrp(struct gfs2_rgrpd **pos, const struct gfs2_rgrpd *b
 
 /**
  * fast_to_acquire - determine if a resource group will be fast to acquire
+ * @rgd: The rgrp
  *
  * If this is one of our preferred rgrps, it should be quicker to acquire,
  * because we tried to set ourselves up as dlm lock master.
-- 
2.27.0

