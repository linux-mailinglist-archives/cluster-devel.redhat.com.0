Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 899E434A45D
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-_VayV8NxPz2Uqxb1bYTVRA-1; Fri, 26 Mar 2021 05:31:17 -0400
X-MC-Unique: _VayV8NxPz2Uqxb1bYTVRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 974D810621A4;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8637F63632;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BFB94A704;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9CDmN012364 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4BE66FA72E; Fri, 26 Mar 2021 09:12:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44CCAFA745
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC48C800883
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:11 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
	[209.85.218.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-546-c3HkFpJvMEavkcIo7tSrRw-1; Fri, 26 Mar 2021 05:12:08 -0400
X-MC-Unique: c3HkFpJvMEavkcIo7tSrRw-1
Received: by mail-ej1-f42.google.com with SMTP id ce10so7315858ejb.6
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=u1njdwRhshSVXy0eOES4wxf/WUKXCRRzOwxm8fp7f+E=;
	b=rZ5osvfuyl5WgXRGl0uZOpmEwZ/nppZ7TT9mKkR00bj6NKPb8uYDf6oDzzdJ2fNtmM
	cTgDaRs0nLVFYECMdG4JAhlVXcvori/YsZKmxmfocHhaYEFHy18sWa5ZyyPkIKNH8+PI
	61WD5EYOYw3dGVnRXTjPsv5hSZ5W6ZqraF9XFkYASdFMuFhSu1UyZ7C+QHykeBkD2JCX
	9FNj2hhimsvqobPUczyMdvzhfHYEkVEBf7FdlZd3NDhSdmjpTeaRMtY7SthkzPb9W3y8
	sMEb1VMfhjy5QbvDHwedBbT9HMxXlZQ8cDubAm9iJQz4yF/tm4dHUeI74skxUHaoi7Su
	vNWw==
X-Gm-Message-State: AOAM533Vj160tkwEkiwSxHzIt+1XVYy4nb+VndkBn8My6l18noNKuZ9P
	lrQjuEyF3mB6cyZuVtYRSlBLXXBCN3jxgA==
X-Google-Smtp-Source: ABdhPJycW/zb7Hhq5xkauZbWOmpyno9uCrxt/IhwOdBD3FCy6HyY1KXJ2ZBQjQ29J82c6Mj0vKsmIg==
X-Received: by 2002:a17:906:8807:: with SMTP id
	zh7mr14083856ejb.196.1616749927732; 
	Fri, 26 Mar 2021 02:12:07 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.12.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:07 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:47 +0000
Message-Id: <20210326091151.311647-15-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 14/18] fs: gfs2: rgrp: Fix a few kernel-doc
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

