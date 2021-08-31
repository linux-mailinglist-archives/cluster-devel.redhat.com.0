Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 737353FC6FA
	for <lists+cluster-devel@lfdr.de>; Tue, 31 Aug 2021 14:20:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-Rw-auU4ROdyYf67m6cSmZA-1; Tue, 31 Aug 2021 08:19:42 -0400
X-MC-Unique: Rw-auU4ROdyYf67m6cSmZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28C491902EDF;
	Tue, 31 Aug 2021 12:19:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 912C46A055;
	Tue, 31 Aug 2021 12:19:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C31C181A1CE;
	Tue, 31 Aug 2021 12:19:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17V9LgAK008939 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 31 Aug 2021 05:21:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EE9E31006F9F; Tue, 31 Aug 2021 09:21:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA8B1100611D
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 09:21:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F30B589C7E1
	for <cluster-devel@redhat.com>; Tue, 31 Aug 2021 09:21:38 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-33-ltQFSk4YM7-6bUUmRk0Iog-1; Tue, 31 Aug 2021 05:21:35 -0400
X-MC-Unique: ltQFSk4YM7-6bUUmRk0Iog-1
Received: by mail-pg1-f177.google.com with SMTP id k24so16024758pgh.8;
	Tue, 31 Aug 2021 02:21:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=44UO0xEw3VXiQ6bhQ7qA+cut2xomVvEwS3t/fwSgC0U=;
	b=JafgST6Q8SRgXw5Y3fHHS2rT30MSRxnY39k2VDAOV8BOZHKwKc37bQ+hBReXbtf8kb
	CPFnEATelgUl+7H0o66kIISp71J9SnfKzE1MxdGlsBeYSrxRI8X6gAdvDSdtCfdT5eFT
	TXiEyNQpq/3dPKlPKby/k8YwADLpczKCLiW3s559MSKdFk5/m5hWaHZrD+r0p8/VcdoQ
	Iy0CVyDhUlcMVSdJ/OIENcUBWbxsRYFJSXNrBeOCwIJTQVdt65vo6mbwDShcRiKi9DVq
	fX2rKQ2xRVcKs7bPFyFsC9LFBQV+VkoSTQm5Iou1Z9nzX4d82d2Mo00vQkR+Ao0ekYVX
	wzHg==
X-Gm-Message-State: AOAM531oJZQzSyoJBx31qpPfubVkNJMSnpPHhLWSzJ2kXSpO0rSSYqxN
	oZoVk6MA0HNtwNL2HTnZEaewiLoFHW4=
X-Google-Smtp-Source: ABdhPJw7/Y5YisCYs7PlqhDldGkq5ZZ1RxcYJJDCS+6iyEAxIEn//L963mMfRpbxUTgRMouAm8TgJg==
X-Received: by 2002:a05:6a00:787:b0:405:700b:69ce with SMTP id
	g7-20020a056a00078700b00405700b69cemr1863016pfu.50.1630401694372;
	Tue, 31 Aug 2021 02:21:34 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
	by smtp.gmail.com with ESMTPSA id
	c23sm19959506pgb.74.2021.08.31.02.21.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 31 Aug 2021 02:21:34 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: ccaulfie@redhat.com
Date: Tue, 31 Aug 2021 02:21:28 -0700
Message-Id: <20210831092128.15981-1-chi.minghao@zte.com.cn>
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
X-Mailman-Approved-At: Tue, 31 Aug 2021 08:19:31 -0400
Cc: cluster-devel@redhat.com, Zeal Robot <zealci@zte.com.cn>,
	linux-kernel@vger.kernel.org, Chi Minghao <chi.minghao@zte.com.cn>
Subject: [Cluster-devel] [PATCH] fs: dlm: remove unneeded semicolon
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Chi Minghao <chi.minghao@zte.com.cn>

Fix the following coccicheck REVIEW:
./fs/dlm/midcomms.c:972:2-3 REVIEW Unneeded semicolon

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Chi Minghao <chi.minghao@zte.com.cn>
---
 fs/dlm/midcomms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 7ae39ec8d9b0..aa4215388b62 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -969,7 +969,7 @@ void dlm_midcomms_receive_done(int nodeid)
 		spin_unlock(&node->state_lock);
 		/* do nothing FIN has it's own ack send */
 		break;
-	};
+	}
 	srcu_read_unlock(&nodes_srcu, idx);
 }
 
-- 
2.25.1

