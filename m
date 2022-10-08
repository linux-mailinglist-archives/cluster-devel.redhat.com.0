Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4DD5F8248
	for <lists+cluster-devel@lfdr.de>; Sat,  8 Oct 2022 04:03:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665194613;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YD1fTxgY2o9DCFb1V0sfmRfUUrcgW7r49fbNShbAR5Q=;
	b=DAAePzkPYSpvV8nC9HEFw3glW4Ycl2Il4LQnBFptED15zSwdSFo4ZlSwfZaLgAn7OQZHi/
	k2T3ivmuqZDnjoAZJWvBpVvqd2Z4soJzF/9MnElAeUoJVzkai3HX8GpYCbwfgpkpI5gL/b
	Ndt6Z/kbIv1bjrIvrb/LJqE/xz46sJk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-WRbD6M-wP_2yzpivpy22lg-1; Fri, 07 Oct 2022 22:03:28 -0400
X-MC-Unique: WRbD6M-wP_2yzpivpy22lg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10727185A78B;
	Sat,  8 Oct 2022 02:03:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 49334477F5C;
	Sat,  8 Oct 2022 02:03:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CAF901946A52;
	Sat,  8 Oct 2022 02:03:24 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B5E5D1946595 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  8 Oct 2022 02:03:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A7FDB145BA63; Sat,  8 Oct 2022 02:03:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 204ED145BA60;
 Sat,  8 Oct 2022 02:03:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: cl@linux.com
Date: Fri,  7 Oct 2022 22:03:12 -0400
Message-Id: <20221008020312.1932347-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH] mm: slab: comment __GFP_ZERO case for
 kmem_cache_alloc
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
Cc: cluster-devel@redhat.com, roman.gushchin@linux.dev,
 linux-kernel@vger.kernel.org, penberg@kernel.org, linux-mm@kvack.org,
 rientjes@google.com, 42.hyeyoo@gmail.com, iamjoonsoo.kim@lge.com,
 akpm@linux-foundation.org, vbabka@suse.cz
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch will add a comment for the __GFP_ZERO flag case for
kmem_cache_alloc(). As the current comment mentioned that the flags only
matters if the cache has no available objects it's different for the
__GFP_ZERO flag which will ensure that the returned object is always
zeroed in any case.

I have the feeling I run into this question already two times if the
user need to zero the object or not, but the user does not need to zero
the object afterwards. However another use of __GFP_ZERO and only zero
the object if the cache has no available objects would also make no
sense.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 mm/slab.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/slab.c b/mm/slab.c
index 10e96137b44f..7a84c2aae85a 100644
--- a/mm/slab.c
+++ b/mm/slab.c
@@ -3482,7 +3482,8 @@ void *__kmem_cache_alloc_lru(struct kmem_cache *cachep, struct list_lru *lru,
  * @flags: See kmalloc().
  *
  * Allocate an object from this cache.  The flags are only relevant
- * if the cache has no available objects.
+ * if the cache has no available objects. Except flag __GFP_ZERO which
+ * will zero the returned object.
  *
  * Return: pointer to the new object or %NULL in case of error
  */
-- 
2.31.1

