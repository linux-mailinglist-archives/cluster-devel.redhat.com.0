Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2732334A463
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:22 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-4gfnU1G4NICGdEce042DFQ-1; Fri, 26 Mar 2021 05:31:19 -0400
X-MC-Unique: 4gfnU1G4NICGdEce042DFQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EFB5E180FCCE;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DEA0E5D9E3;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C87FF4BB7C;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9CFip012390 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7A57F1050182; Fri, 26 Mar 2021 09:12:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 764751054581
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F6D9802C1A
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:15 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
	[209.85.218.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-243-Jq2UgDceP4iFy7EZ-cVQ8w-1; Fri, 26 Mar 2021 05:12:12 -0400
X-MC-Unique: Jq2UgDceP4iFy7EZ-cVQ8w-1
Received: by mail-ej1-f53.google.com with SMTP id w3so7325166ejc.4
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EhZMxOF5DIQEa6gsAl2dfJPPNSUSMOj2y0CwF6nVMAo=;
	b=jSYaVc+rM1itgBnpVI3eZmQdHboGOEPFp0luJlZbEFYcq2qD9x9ttEY7nHNIU3q3VL
	dB9n+QdN3nIEqr8qp+H7fw75MKHMiRlWJ12mOCackuxMzNp7e/qI519djYsU+XUhIqg+
	go49GcvlSa4VkUjwsgJkL4hroWVTKj6EbUntZ5HJYcwNcxVXYj96GhNA08Lr+0t7rDQ5
	nNnjjzJzANPQeW8uTAR3F//Meo6VwIO2n/i6TQrOqkItUT4CHoS+V+MAbpBLsDN5o1aX
	P6zzvcUE/eIt9MY16piOTsIVd/ejArgOPUvN/PGdXkmfd67YZwfe14t0kbk2SGTJfOV0
	NIVQ==
X-Gm-Message-State: AOAM5326ClgFIuaj2pxsfeI2U4+bnKHVQsz+cIF00Si4WEYMs35df0OP
	Sxzm3bKrqMTu/hJgJCc/mnQX+A==
X-Google-Smtp-Source: ABdhPJzzmYzb1Xb+jNI8vIBthz701GseAY7wfQ6fBZOuJL/MqLEBHqKyrpXN5/sldoWxB18iszFiQA==
X-Received: by 2002:a17:907:76a3:: with SMTP id
	jw3mr14380776ejc.353.1616749931740; 
	Fri, 26 Mar 2021 02:12:11 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.12.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:11 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:51 +0000
Message-Id: <20210326091151.311647-19-lee.jones@linaro.org>
In-Reply-To: <20210326091151.311647-1-lee.jones@linaro.org>
References: <20210326091151.311647-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 18/18] fs: gfs2: lock_dlm: Demote incomplete
	kernel-doc header
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

 fs/gfs2/lock_dlm.c:48: warning: Function parameter or member 's' not described in 'gfs2_update_stats'
 fs/gfs2/lock_dlm.c:48: warning: Function parameter or member 'index' not described in 'gfs2_update_stats'
 fs/gfs2/lock_dlm.c:48: warning: Excess function parameter 'mv' description in 'gfs2_update_stats'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/lock_dlm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
index 153272f82984b..4afd98c91e73e 100644
--- a/fs/gfs2/lock_dlm.c
+++ b/fs/gfs2/lock_dlm.c
@@ -22,9 +22,8 @@
 #include "sys.h"
 #include "trace_gfs2.h"
 
-/**
+/*
  * gfs2_update_stats - Update time based stats
- * @mv: Pointer to mean/variance structure to update
  * @sample: New data to include
  *
  * @delta is the difference between the current rtt sample and the
-- 
2.27.0

