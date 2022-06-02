Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D31A153B441
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Jun 2022 09:19:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-0y5B_e2dPvaoTDA8GL7fCA-1; Thu, 02 Jun 2022 03:19:54 -0400
X-MC-Unique: 0y5B_e2dPvaoTDA8GL7fCA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAE4C802804;
	Thu,  2 Jun 2022 07:19:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6A897C15E71;
	Thu,  2 Jun 2022 07:19:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 15C341949759;
	Thu,  2 Jun 2022 07:19:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E71541947B83 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  2 Jun 2022 07:19:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CA3611121315; Thu,  2 Jun 2022 07:19:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C63501121314
 for <cluster-devel@redhat.com>; Thu,  2 Jun 2022 07:19:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC29E1066542
 for <cluster-devel@redhat.com>; Thu,  2 Jun 2022 07:19:50 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-6udmTx6yOXGFj8pmH8EvIw-1; Thu, 02 Jun 2022 03:19:45 -0400
X-MC-Unique: 6udmTx6yOXGFj8pmH8EvIw-1
Received: by mail-pj1-f45.google.com with SMTP id n10so4140881pjh.5;
 Thu, 02 Jun 2022 00:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i016zQuKMb81+Y+xJdKA11NT4Jd4+/bBSHrF2+dgzts=;
 b=lwPxYRUJ+kj0c4WpPUa/Zr/OcJJ7zD+/vettJsXfEhcUptNwKxI5Vh98M70XvioJEU
 C6YtgKtbhWEhZC8gnYQbgVSyBqdhD7q0eumG2k4zi1IZ0E9MqYfQ9lKanrcuy7hDTRno
 qZraU+Dxd1R3hK6tuoaVJ3CEufdgTHpGH0yNgw3VsGQ9cWAchGX6yuW57Vvai1nWxxst
 ijn20Z0zzhuGtNkeuR4T05zL/wa1RVdqJH5kfBb/wsrHy6XgQzE0DL3LCX/ni7GozyhI
 vDQFI209Dg7L4xX4W58a+B8fmWAn10BVu5uufKtWeTew9Sd1qfiR/2QYIZFMQIhGv9KW
 WdAA==
X-Gm-Message-State: AOAM5306MccOgon7UUyYO3yfgoQtdWptTmNcsduKoouJP2rOlCdxIL+S
 9OeCiDWU7pmlqoBzYoUkDDdaBx6cZ3Q=
X-Google-Smtp-Source: ABdhPJwvbtpttKvPPVIECKgAyPlw86lt/qMJJOYUmGPl/yvP7coxrd3KUek52ouDEvS5mDD6i7CqYA==
X-Received: by 2002:a17:90a:2807:b0:1e6:7eef:8e9d with SMTP id
 e7-20020a17090a280700b001e67eef8e9dmr3455288pjd.109.1654154383633; 
 Thu, 02 Jun 2022 00:19:43 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a056a001c4800b005183cf12184sm2647547pfw.133.2022.06.02.00.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 00:19:43 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: rpeterso@redhat.com
Date: Thu,  2 Jun 2022 07:19:39 +0000
Message-Id: <20220602071939.278344-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: [Cluster-devel] [PATCH] gfs2: Remove redundant NULL check before
 kfree
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
Cc: cluster-devel@redhat.com, Zeal Robot <zealci@zte.com.cn>,
 Minghao Chi <chi.minghao@zte.com.cn>, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Minghao Chi <chi.minghao@zte.com.cn>

kfree on NULL pointer is a no-op.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 fs/gfs2/file.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 2cceb193dcd8..d8f1239344c1 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -1066,8 +1066,7 @@ static ssize_t gfs2_file_buffered_write(struct kiocb *iocb,
 		gfs2_glock_dq(gh);
 out_uninit:
 	gfs2_holder_uninit(gh);
-	if (statfs_gh)
-		kfree(statfs_gh);
+	kfree(statfs_gh);
 	from->count = orig_count - written;
 	return written ? written : ret;
 }
-- 
2.25.1


