Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E2172A53
	for <lists+cluster-devel@lfdr.de>; Wed, 24 Jul 2019 10:43:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FD112BF02;
	Wed, 24 Jul 2019 08:43:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F29D95D71A;
	Wed, 24 Jul 2019 08:43:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30CE51800206;
	Wed, 24 Jul 2019 08:43:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6O8hDoY026984 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jul 2019 04:43:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5393F19D70; Wed, 24 Jul 2019 08:43:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC33019C67;
	Wed, 24 Jul 2019 08:43:10 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A551C06512C;
	Wed, 24 Jul 2019 08:43:10 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id s1so14553027pgr.2;
	Wed, 24 Jul 2019 01:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=0Ol/+/EACU1mDtCvpt+iEiYJ2SN+qSkf9suJGxid6UE=;
	b=PiEquNkHK4nn2WkH3wqswaX9lLCPjHym9g95ww2KLH/+5cwz42kzG42PyZffZ4u8zr
	hY4UppU3tgKNFFllYQGmGoB2Cdl4Bo6mwJckc2WpR2Wyt2cqyIk9YB1uWh6FFnG4ZAzd
	ir/Y6ME74fPSJFnWvYY0JP7Lz2N2+cLCeGCkyARvfY6Zdfbgw/zUA+gmz6hT19YHLxfu
	9WfM+WAw0KTdkqe+v2FJ/V+9ustDnksRcKKwKHkrDxUar3BWDQeg5XWlg3L6DYgUqQ3u
	ZqzbeT2MwR+J0BWRPH6lTCagRChanNSYZxRH3I45eviZTovR7+jdqUFIUOgCoDQ7b/XY
	+KnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=0Ol/+/EACU1mDtCvpt+iEiYJ2SN+qSkf9suJGxid6UE=;
	b=C3nZ/avnELUdqisTPUefWGhy+1EMv67xKjrf9lTRLBI6FxOHeczscianKHRIxqu9Hx
	fypKPS+SP5Dmtma8K3YWPXR8Nv1he1mxuu4nNN7c77jPPtJrle04XePeDreN/PAjvn+b
	6rG1cG1BN/M9V84ZxxMXriHems0/gL6Vf0CAKljjBKuWueymd73pN1hMfLglcr1wJn2Z
	QMTcjtMnm4hYXs3bfti+S8DUXPfw6IJ+ezZ9b9xdkhEUNOp4BX95JmIlt/Q6SSMdIZnp
	O+88KdtEckvGrGOAtf6u27qb3f+G4zuCoLzYVByml6umWH+coVY/KbBfTqmfkO2XZgdh
	bLnw==
X-Gm-Message-State: APjAAAWxSfPr/MuqPRq6ltSeOfppnERWZD3nLPBs+a2emxw6RkiqpPce
	vpVwq8kRD2A2fOHZKstFAZgVBC3ESE0=
X-Google-Smtp-Source: APXvYqyNcnZli/KlqTQVySyRa6gjjsg9uLU36wPchRtlzigKX3VX3hrtCaR+kxLa6joBAhija30nuQ==
X-Received: by 2002:a62:8c81:: with SMTP id
	m123mr10114404pfd.240.1563957789574; 
	Wed, 24 Jul 2019 01:43:09 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
	by smtp.gmail.com with ESMTPSA id
	r15sm49326364pfh.121.2019.07.24.01.43.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jul 2019 01:43:09 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: rpeterso@redhat.com, agruenba@redhat.com
Date: Wed, 24 Jul 2019 16:43:03 +0800
Message-Id: <20190724084303.1236-1-baijiaju1990@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 24 Jul 2019 08:43:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 24 Jul 2019 08:43:10 +0000 (UTC) for IP:'209.85.215.193'
	DOMAIN:'mail-pg1-f193.google.com'
	HELO:'mail-pg1-f193.google.com' FROM:'baijiaju1990@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.153  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.215.193 mail-pg1-f193.google.com 209.85.215.193
	mail-pg1-f193.google.com <baijiaju1990@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, Jia-Ju Bai <baijiaju1990@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] fs: gfs2: Fix a null-pointer dereference in
	gfs2_alloc_inode()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 24 Jul 2019 08:43:26 +0000 (UTC)

In gfs2_alloc_inode(), when kmem_cache_alloc() on line 1724 returns
NULL, ip is assigned to NULL. In this case, "return &ip->i_inode" will
cause a null-pointer dereference.

To fix this null-pointer dereference, NULL is returned when ip is NULL.

This bug is found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 fs/gfs2/super.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 0acc5834f653..c07c3f4f8451 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1728,8 +1728,9 @@ static struct inode *gfs2_alloc_inode(struct super_block *sb)
 		memset(&ip->i_res, 0, sizeof(ip->i_res));
 		RB_CLEAR_NODE(&ip->i_res.rs_node);
 		ip->i_rahead = 0;
-	}
-	return &ip->i_inode;
+		return &ip->i_inode;
+	} else
+		return NULL;
 }
 
 static void gfs2_free_inode(struct inode *inode)
-- 
2.17.0

