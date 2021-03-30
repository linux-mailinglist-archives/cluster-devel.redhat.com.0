Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id DCEFC34EE2A
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:45:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-OMvoK5ktNpuZBHgPonWmtw-1; Tue, 30 Mar 2021 12:45:25 -0400
X-MC-Unique: OMvoK5ktNpuZBHgPonWmtw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD5051084D68;
	Tue, 30 Mar 2021 16:45:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 98D8E10016DB;
	Tue, 30 Mar 2021 16:45:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 745064A7C8;
	Tue, 30 Mar 2021 16:45:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjJBI010880 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCB4311457C1; Tue, 30 Mar 2021 16:45:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B881D11457C0
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1DD9185A7B4
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:19 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-333-4diRWo_VPnCMnzHs2C5OIg-1; Tue, 30 Mar 2021 12:45:15 -0400
X-MC-Unique: 4diRWo_VPnCMnzHs2C5OIg-1
Received: by mail-wm1-f52.google.com with SMTP id
	d8-20020a1c1d080000b029010f15546281so10698722wmd.4
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lKzeLqRR981m8Q6V7H7TUSXK4XL8F6YSqoxMJOt3/UM=;
	b=PJq1o1v+Gwr6u8QM8AfHgI1+mB4SLbr9ZxKtgzoXPS0VvbB815mzJrLPnZ+Ki6T44c
	WWKXLsG63c/82Hw35rqvGdDESCS55C42NIOmkHohx7XOMfls9c6TrTp66reZZOKmPxji
	OsMY7tdZ4Wl1MWtDKaHVMaW9RtpCTWoMayyPBstLdhWj7YE7V9UAaPkHIChnzDcPbU4o
	L7rGQ5i5M8D1iIpmHpCBQexN2xO0mYWWiou4KiLgwQLN1abyyvHvHpXwGKGDfPoEQAsM
	6u0voygnBpE2FfPO21urp6u09xOKXKLOdNtePk6d5OLvoCd6ZwhFlMUO81FfmRWvWiME
	wNyQ==
X-Gm-Message-State: AOAM5324fvait9uUQ+oqiXRANYNsCnD85pI2wiR5rdDs3rEo0qmVqTrZ
	FXx0tc38WpupeuQGdxg9Xo3Zhw==
X-Google-Smtp-Source: ABdhPJzYOfqHcp5iZeoFTTBh4RKohiuUthd/ehlMMRT478Fjj1e25yTDazs0OjWroVYX/5g/2GU5Vg==
X-Received: by 2002:a1c:c282:: with SMTP id s124mr4953590wmf.99.1617122714170; 
	Tue, 30 Mar 2021 09:45:14 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:13 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:40 +0100
Message-Id: <20210330164458.1625478-14-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 13/31] fs: gfs2: quota: Fix incorrect param
	name in 'gfs2_quotad'
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

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/quota.c:1542: warning: Function parameter or member 'data' not described in 'gfs2_quotad'
 fs/gfs2/quota.c:1542: warning: Excess function parameter 'sdp' description in 'gfs2_quotad'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/quota.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 6e173ae378c44..33520eed467c2 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -1534,7 +1534,7 @@ void gfs2_wake_up_statfs(struct gfs2_sbd *sdp) {
 
 /**
  * gfs2_quotad - Write cached quota changes into the quota file
- * @sdp: Pointer to GFS2 superblock
+ * @data: Pointer to GFS2 superblock
  *
  */
 
-- 
2.27.0

