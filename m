Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B62EE34EE40
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:47:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-jB0J1-xsP_CkuLMqOZwDKw-1; Tue, 30 Mar 2021 12:47:30 -0400
X-MC-Unique: jB0J1-xsP_CkuLMqOZwDKw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46802881276;
	Tue, 30 Mar 2021 16:47:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B2660861;
	Tue, 30 Mar 2021 16:47:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E7EC1800216;
	Tue, 30 Mar 2021 16:47:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjDd6010786 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7030D6CA9A; Tue, 30 Mar 2021 16:45:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 68C706CAA9
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E512805B3B
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:13 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-333-ko2bmnB-PIWql5whvLbJjQ-1; Tue, 30 Mar 2021 12:45:10 -0400
X-MC-Unique: ko2bmnB-PIWql5whvLbJjQ-1
Received: by mail-wr1-f44.google.com with SMTP id k8so16892034wrc.3
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G+FYFjvrmmmlFKosOJsmCEZQd+qs37SblTzL1IxaAKE=;
	b=r3l+CCAjUJkY2X0GCNMiZyZN0/IgHrMMJm8eimMGosXRbEJruL8f3Grg6TgQ9rkaBH
	EG4F5a67BV7IxHeRFiH6C+TS6BEDx5yEuvvlNUL4HbevK0NDH6gFsyQZABJ9J4tak29C
	rsv3d53ofL/K7Omz6PtJEG1/1iJOQ0DJ6b1B/DNn2wM3pctH7atJhAOc1vTqBi0Ehx7K
	KCWEvVCY+DwzxDVzsPWbA4/fZ0IAaOyQPMKOWEKznD1X6/yjJzSMQN2ZpNv3x9fgIDF4
	g03m2CYFH0V1V/W58LbVGdY4ujz8dNSc7ulq3W1tWqpF/Wa0f14kwNJn0FXT3rIep1YW
	24gA==
X-Gm-Message-State: AOAM5301HsZxeYavWAjRzA2leRLN8LLDp5ajzv9A7mnxESk7am4EHzPY
	p2ccnCmzfmuX/JvJm8eM6UvGy49d8MOtEw==
X-Google-Smtp-Source: ABdhPJwpE1SAXcHUx7I2lrtlx79K3iEngww10pKSJ2/1Ipp9H4x80nViQo/dXA6EcjEAzg8bZ2bWLA==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr34548264wrq.116.1617122708907; 
	Tue, 30 Mar 2021 09:45:08 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:08 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:35 +0100
Message-Id: <20210330164458.1625478-9-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 08/31] fs: gfs2: aops: Fix a little
	potential doc-rot
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

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/aops.c:560: warning: Function parameter or member 'rac' not described in 'gfs2_readahead'
 fs/gfs2/aops.c:560: warning: Excess function parameter 'file' description in 'gfs2_readahead'
 fs/gfs2/aops.c:560: warning: Excess function parameter 'mapping' description in 'gfs2_readahead'
 fs/gfs2/aops.c:560: warning: Excess function parameter 'pages' description in 'gfs2_readahead'
 fs/gfs2/aops.c:560: warning: Excess function parameter 'nr_pages' description in 'gfs2_readahead'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/aops.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index cc4f987687f3c..23b5be3db044c 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -540,10 +540,7 @@ int gfs2_internal_read(struct gfs2_inode *ip, char *buf, loff_t *pos,
 
 /**
  * gfs2_readahead - Read a bunch of pages at once
- * @file: The file to read from
- * @mapping: Address space info
- * @pages: List of pages to read
- * @nr_pages: Number of pages to read
+ * @rac: Read-ahead control structure
  *
  * Some notes:
  * 1. This is only for readahead, so we can simply ignore any things
-- 
2.27.0

