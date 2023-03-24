Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D02E6C8424
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Mar 2023 19:00:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679680824;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2SlfuA3seKVuPBc9pms+nyAsg+dbGKkRRSZsZ5fGf6M=;
	b=TDZR+TqT6gwzMmEOmvjFnDvnxm2gQ1C3KVbNa7EeZ6bO6p64fGhhONPGgyYVtZq2cqRG6w
	mljvIxSsvYz5q9zSSGPbHh7xlOJmqnbBz/LtSok+FEAbJKJdpQ11FMfjYeMq/y9M3fhQEq
	La6Q8IPB3XWSLB0aK3Zv3DmjZz9tCzM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-12Y01e4VNJmx_q3DDOYBNg-1; Fri, 24 Mar 2023 14:00:19 -0400
X-MC-Unique: 12Y01e4VNJmx_q3DDOYBNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAD56185A794;
	Fri, 24 Mar 2023 18:00:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63016202A942;
	Fri, 24 Mar 2023 18:00:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 108181946A62;
	Fri, 24 Mar 2023 17:59:51 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EBCCB1946A5A for <cluster-devel@listman.corp.redhat.com>;
 Fri, 24 Mar 2023 17:59:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C2242140E950; Fri, 24 Mar 2023 17:59:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAD3C140EBF4
 for <cluster-devel@redhat.com>; Fri, 24 Mar 2023 17:59:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A7C4100DEAE
 for <cluster-devel@redhat.com>; Fri, 24 Mar 2023 17:59:49 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-9zVy54qxOTSGTbybwN9gfA-1; Fri, 24 Mar 2023 13:59:47 -0400
X-MC-Unique: 9zVy54qxOTSGTbybwN9gfA-1
Received: by mail-qt1-f197.google.com with SMTP id
 c11-20020ac85a8b000000b003bfdd43ac76so1480447qtc.5
 for <cluster-devel@redhat.com>; Fri, 24 Mar 2023 10:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679680785;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2SlfuA3seKVuPBc9pms+nyAsg+dbGKkRRSZsZ5fGf6M=;
 b=6HwIlw083S55kL8ANFALyrUjdoyPwn8eriVIn5+9vhIhXWEjlA/RFQ+V/R4XfUlhJu
 W1xxPgxMIVLKcaZxLATEFHMrI/jkzqWEH/azEXwAArsTCyO5jTnzIOYOcqN/OOOc4pFD
 WupAtsRkCqKQcJOOf1sWWXCmDEOMImy5g+QPDxGZuA9iYU3vV9KH/hdQV+uEqfm8MWif
 CpwxyHPFxSm1Y2yh9G33KUNUg2v7hFKfxyeD4sK0NUIn0MHRb28dTRgrOWnhnJxLNfS0
 4RnQLYOlEZXUqmiLBaBP9K8CCFZC0ZHO3QZBuM8H32i0/YuBECeKrDtjZ6g5LTSQdvMZ
 49vw==
X-Gm-Message-State: AO0yUKWkezbRhD54moopMzlmNEincYcXYPIIuEm9NOZitebihaC35v+w
 K34svLFGdW6FRR2K4skRHDGDt0R9AUaJtOF064gvqsR8RoyezOEDnRWS3mn14552+oEs4KTxO1H
 GLgQlM8yD/uksQ7yaiOszMoIjdRj/zQ==
X-Received: by 2002:ac8:7f0c:0:b0:3d9:cb72:3655 with SMTP id
 f12-20020ac87f0c000000b003d9cb723655mr6583284qtk.42.1679680785048; 
 Fri, 24 Mar 2023 10:59:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set+EpvbTKS6UkAI9qC1M5oisPsBZrKldqHHaYLhOFZliJhezGwoJ4U58KvcHYh8O3HR+0W6PUQ==
X-Received: by 2002:ac8:7f0c:0:b0:3d9:cb72:3655 with SMTP id
 f12-20020ac87f0c000000b003d9cb723655mr6583271qtk.42.1679680784847; 
 Fri, 24 Mar 2023 10:59:44 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 dm40-20020a05620a1d6800b0074411b03972sm1658551qkb.51.2023.03.24.10.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 10:59:44 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: ccaulfie@redhat.com, teigland@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com
Date: Fri, 24 Mar 2023 13:59:42 -0400
Message-Id: <20230324175942.2653272-1-trix@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH] fs: dlm: remove unused is_granted function
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
Cc: cluster-devel@redhat.com, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
fs/dlm/lock.c:239:19: error: unused function
  'is_granted' [-Werror,-Wunused-function]
static inline int is_granted(struct dlm_lkb *lkb)
                  ^
This function is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/dlm/lock.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 1582c8b1404c..b9c124b88f15 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -236,11 +236,6 @@ static inline int is_altmode(struct dlm_lkb *lkb)
 	return test_bit(DLM_SBF_ALTMODE_BIT, &lkb->lkb_sbflags);
 }
 
-static inline int is_granted(struct dlm_lkb *lkb)
-{
-	return (lkb->lkb_status == DLM_LKSTS_GRANTED);
-}
-
 static inline int is_remote(struct dlm_rsb *r)
 {
 	DLM_ASSERT(r->res_nodeid >= 0, dlm_print_rsb(r););
-- 
2.27.0

