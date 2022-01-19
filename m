Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7046A4938C7
	for <lists+cluster-devel@lfdr.de>; Wed, 19 Jan 2022 11:44:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642589079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pndA7ONyFnNnTpWn1EsHj3H7v4RW/zeHNq32kQ89nqk=;
	b=jOMu9d5o/33n3JQg1Wcm95mJTGlwz2jI+9GTU/kKGH3OfgyOzo9cXnen7wcUgzmvcDNc0y
	Nr9PCXR05fjPI3vmf7FbFgBSDFF5mPqpVdOy8iovHRdTJJ4TilnTEx9dB957fymvshATpb
	aYBnIO3BnpCBb5gFXzw22RRjDOMp6BU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-3SBvZaTwPjuw20PuO-n4Jw-1; Wed, 19 Jan 2022 05:44:36 -0500
X-MC-Unique: 3SBvZaTwPjuw20PuO-n4Jw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36DBA196E6C0;
	Wed, 19 Jan 2022 10:44:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28DA47CAF4;
	Wed, 19 Jan 2022 10:44:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14C0A1806D1C;
	Wed, 19 Jan 2022 10:44:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20JAiW65024562 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jan 2022 05:44:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8AC9378B18; Wed, 19 Jan 2022 10:44:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.37.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C292D78B10
	for <cluster-devel@redhat.com>; Wed, 19 Jan 2022 10:44:31 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 19 Jan 2022 10:43:12 +0000
Message-Id: <20220119104316.2489995-18-anprice@redhat.com>
In-Reply-To: <20220119104316.2489995-1-anprice@redhat.com>
References: <20220119104316.2489995-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 17/21] libgfs2: Namespace improvements -
	struct master_dir
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Rename to struct lgfs2_meta_dir.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/initialize.c | 2 +-
 gfs2/libgfs2/libgfs2.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/gfs2/fsck/initialize.c b/gfs2/fsck/initialize.c
index 2bde52ab..ec9a8eef 100644
--- a/gfs2/fsck/initialize.c
+++ b/gfs2/fsck/initialize.c
@@ -32,7 +32,7 @@
 
 static int was_mounted_ro = 0;
 static uint64_t possible_root = HIGHEST_BLOCK;
-static struct master_dir fix_md;
+static struct lgfs2_meta_dir fix_md;
 static uint64_t blks_2free = 0;
 
 /**
diff --git a/gfs2/libgfs2/libgfs2.h b/gfs2/libgfs2/libgfs2.h
index 00deb455..3673182b 100644
--- a/gfs2/libgfs2/libgfs2.h
+++ b/gfs2/libgfs2/libgfs2.h
@@ -300,7 +300,7 @@ struct lgfs2_inode {
 	};
 };
 
-struct master_dir
+struct lgfs2_meta_dir
 {
 	struct lgfs2_inode *inum;
 	uint64_t next_inum;
@@ -375,7 +375,7 @@ struct lgfs2_sbd {
 	struct osi_root rgtree;
 
 	struct lgfs2_inode *master_dir;
-	struct master_dir md;
+	struct lgfs2_meta_dir md;
 
 	unsigned int gfs1:1;
 };
-- 
2.34.1

