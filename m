Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8366734EE2C
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:45:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-DQqR-kgWPKKbC3DN2jnX8g-1; Tue, 30 Mar 2021 12:45:28 -0400
X-MC-Unique: DQqR-kgWPKKbC3DN2jnX8g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BD28802B5B;
	Tue, 30 Mar 2021 16:45:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6E0E19C44;
	Tue, 30 Mar 2021 16:45:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C50971809C83;
	Tue, 30 Mar 2021 16:45:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjMv8010908 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 26A386CA9A; Tue, 30 Mar 2021 16:45:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 216CF6CA9C
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09AA6802BEE
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:22 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-225-gRpXBJ7gPQ2DcaLI4i_Vww-1; Tue, 30 Mar 2021 12:45:19 -0400
X-MC-Unique: gRpXBJ7gPQ2DcaLI4i_Vww-1
Received: by mail-wr1-f42.google.com with SMTP id c8so16872089wrq.11
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EhZMxOF5DIQEa6gsAl2dfJPPNSUSMOj2y0CwF6nVMAo=;
	b=nVALFkCbxwxz+c7UPqoOWTMFwnUr+5fEgaFgWw91KBahMs367KRyva5FoX4tynXvhY
	CnjG9X/b7mBHD69hshCFH6sSSIShwGKRuYfV5nTz7QZEEtpfDkhKf6o1CL3ZDFpZ42sn
	CyXfPkE+BHeTSHd30fiSYyBZGWXjA6GaimapFYRzkzPyVtuc4wUDjRB7OzS1ZeVxd3h2
	fScDv8gdhJ8N6l/8T8V0vPGfTv8cGLvR/8g1MnQ9oJXHk1MCzd1q3B6Wl8XEd7c+XhEI
	nkWcEZVbrZSICgpj2+eadf94ybXmlXLvjr1irQua0z3Kq7Hgeh/NepFhxu4ThwfsC0U6
	OJ3A==
X-Gm-Message-State: AOAM532DGlnzY+z8D3p3j96Eddl6lgo998GtL6aivqPkh+0oaD637VQk
	9FKn5xAC18I/5yqVugrNDJnwJA==
X-Google-Smtp-Source: ABdhPJzFIj5h10clKCWBJEdUpQezJbeJoineJgqfOaOnso+v4mKYZjMoAftK2fVTD522I5ySmS8LdQ==
X-Received: by 2002:a05:6000:1281:: with SMTP id
	f1mr35171282wrx.243.1617122718750; 
	Tue, 30 Mar 2021 09:45:18 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:18 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:45 +0100
Message-Id: <20210330164458.1625478-19-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 18/31] fs: gfs2: lock_dlm: Demote incomplete
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

