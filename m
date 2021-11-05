Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A202445D75
	for <lists+cluster-devel@lfdr.de>; Fri,  5 Nov 2021 02:46:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-YPoystecPReCmxXFIa9-Bg-1; Thu, 04 Nov 2021 21:46:00 -0400
X-MC-Unique: YPoystecPReCmxXFIa9-Bg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C75CC192780E;
	Fri,  5 Nov 2021 01:45:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB20D56A96;
	Fri,  5 Nov 2021 01:45:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ACCEA1806D04;
	Fri,  5 Nov 2021 01:45:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A51hUm7015196 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 4 Nov 2021 21:43:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C59F40C1252; Fri,  5 Nov 2021 01:43:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6819F400F3C6
	for <cluster-devel@redhat.com>; Fri,  5 Nov 2021 01:43:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50B00811E76
	for <cluster-devel@redhat.com>; Fri,  5 Nov 2021 01:43:30 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
	[209.85.219.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-192-MlVGQVHzOWe2LkCwyDPvFw-1; Thu, 04 Nov 2021 21:43:28 -0400
X-MC-Unique: MlVGQVHzOWe2LkCwyDPvFw-1
Received: by mail-qv1-f48.google.com with SMTP id b17so6509993qvl.9;
	Thu, 04 Nov 2021 18:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BxmXyn8ShSjxQDOiXzzY6+U7bBPX7WyywFrWVYsZkWg=;
	b=6Tn/dw7NyJtUd2PHQAIpveYcU3vQqzrkd3cInrfOmoYbgNsp9Oc/7XGwLEpBk6wbN5
	nPI7aEIaT5W70VkS6grx/sFSsCrOSheOXO6UUvTnwhoMyOaF5izLdfvt3vyCGJHnUNH8
	apVLx5n8EyjIqbJdPVzjuvdTtH/Yl3bXwRb0Sbn7oxiH4Q5GsQbQijT1vw75+Cayk6gO
	VtBsNQnrRSM84YoEpX8eouxW0ae6mnI8aIAo1ureW9fjcVbvWmFRpVNKCR0meKizxnbT
	zq0i/KwSdY0UEjlhgp8AbicyG87QPUL6au+7rjH9ss8+USD3TLzvO4ONL67UbCNELmR7
	58Ig==
X-Gm-Message-State: AOAM531otA0v7Ky6TgWudk9o2GHNyHGgm4vL086rdIHlLhTeuvxtjyDC
	KHkGUcHHglTdLdC2KbnWMlxdrR2GRD4=
X-Google-Smtp-Source: ABdhPJwL0kRNhKYAnnUt3cBzUpylAnh1d+EPtRjvz4BrDdOleJGSUi7WtOjrezpNUa3pjWxrl0G77Q==
X-Received: by 2002:a05:6214:508f:: with SMTP id
	kk15mr4491156qvb.3.1636076607634; 
	Thu, 04 Nov 2021 18:43:27 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
	by smtp.gmail.com with ESMTPSA id
	d11sm5540489qtx.81.2021.11.04.18.43.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 04 Nov 2021 18:43:27 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: zhang.mingyu@zte.com.cn
To: ccaulfie@redhat.com
Date: Fri,  5 Nov 2021 01:43:20 +0000
Message-Id: <20211105014320.75292-1-zhang.mingyu@zte.com.cn>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Zeal Robot <zealci@zte.com.cn>,
	Zhang Mingyu <zhang.mingyu@zte.com.cn>, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] fs: dlm:Remove unneeded semicolon
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

From: Zhang Mingyu <zhang.mingyu@zte.com.cn>

Eliminate the following coccinelle check warning:
fs/dlm/midcomms.c:972:2-3

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Zhang Mingyu <zhang.mingyu@zte.com.cn>
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

