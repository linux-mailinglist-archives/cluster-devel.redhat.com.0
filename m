Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CD86BF2D4
	for <lists+cluster-devel@lfdr.de>; Fri, 17 Mar 2023 21:41:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679085688;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Rucd4VH9Gnj/NXAEsqD/84Zoq/Cr+9d2IYDUn0/m238=;
	b=jQNhBCqSTicFrGORflVM9N8hDuokmyVJPBe7P0ImH6Qm0kCCbFrt0yqd8e0ha3Vmaw9c4V
	IUSFbkVz8WwT1loolXJH2s9ZdLvL44Uw83MshUJZpiqJlMlqq5y/ROokaTg9FaJJ1Q4uZb
	HHCsYageIN0QenTucyq5Uelbc2TigEo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-312-_84DjnywP9i4irqLFAy0ZA-1; Fri, 17 Mar 2023 16:41:23 -0400
X-MC-Unique: _84DjnywP9i4irqLFAy0ZA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 697343C0F38B;
	Fri, 17 Mar 2023 20:41:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 02E9740D1C7;
	Fri, 17 Mar 2023 20:41:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4137C1946A5A;
	Fri, 17 Mar 2023 20:41:14 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EB6C21946A49 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 17 Mar 2023 20:41:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DDF331410F1D; Fri, 17 Mar 2023 20:41:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B97FA1410F1B;
 Fri, 17 Mar 2023 20:41:07 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 17 Mar 2023 16:41:01 -0400
Message-Id: <20230317204102.1776638-3-aahringo@redhat.com>
In-Reply-To: <20230317204102.1776638-1-aahringo@redhat.com>
References: <20230317204102.1776638-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 2/3] dlm_controld: get rid of unnecessary
 memset
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Andreas Gruenbacher <agruenba@redhat.com>

In process_plocks(), we're reading in the entire info object, so there
is no need to zero out the buffer first.
---
 dlm_controld/plock.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/dlm_controld/plock.c b/dlm_controld/plock.c
index f03f3abe..85d6fdf2 100644
--- a/dlm_controld/plock.c
+++ b/dlm_controld/plock.c
@@ -1523,8 +1523,6 @@ void process_plocks(int ci)
 
 	gettimeofday(&now, NULL);
 
-	memset(&info, 0, sizeof(info));
-
 	rv = do_read(plock_device_fd, &info, sizeof(info));
 	if (rv < 0) {
 		log_debug("process_plocks: read error %d fd %d\n",
-- 
2.31.1

