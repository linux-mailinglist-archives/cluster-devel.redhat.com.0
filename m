Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9163B30FFB4
	for <lists+cluster-devel@lfdr.de>; Thu,  4 Feb 2021 22:51:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1612475511;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2/Umc5k/AP5CjJZzqFW1YEo4gDneeXjpXxl1ViexiBc=;
	b=TlZXsS+4azdPkMZrGl9UOYZ/B+UqsxArV0HxT0GfegVCYOpiUwDGo1Vys1ZWcCihKbxUgT
	/PgPFaBPfvJF9b6M3n54an7znNLPSzTu5YRzzknHeuMNd9zYkBCQBLWYYWcrWTME8vebrZ
	o3WM6P//QcEW2pBuxqAJi5jePacueak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-YOa7250AMrasX5d-3NPrWg-1; Thu, 04 Feb 2021 16:51:49 -0500
X-MC-Unique: YOa7250AMrasX5d-3NPrWg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D2CB15727;
	Thu,  4 Feb 2021 21:51:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D1235B698;
	Thu,  4 Feb 2021 21:51:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3420F4EEEC;
	Thu,  4 Feb 2021 21:51:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 114LpBCg027549 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 4 Feb 2021 16:51:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 825751B533; Thu,  4 Feb 2021 21:51:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-190.rdu2.redhat.com [10.10.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E74B060C16;
	Thu,  4 Feb 2021 21:51:10 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  4 Feb 2021 16:50:53 -0500
Message-Id: <20210204215056.774409-7-aahringo@redhat.com>
In-Reply-To: <20210204215056.774409-1-aahringo@redhat.com>
References: <20210204215056.774409-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 6/9] fs: dlm: use GFP_ZERO for page
	buffer
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch uses GFP_ZERO for allocate a page for the internal dlm
sending buffer allocator instead of calling memset zero after every
allocation. An already allocated space will never be reused again.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c     | 2 --
 fs/dlm/lowcomms.c | 2 +-
 fs/dlm/rcom.c     | 2 --
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 002123efc6b0..b93df39d0915 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -3541,8 +3541,6 @@ static int _create_message(struct dlm_ls *ls, int mb_len,
 	if (!mh)
 		return -ENOBUFS;
 
-	memset(mb, 0, mb_len);
-
 	ms = (struct dlm_message *) mb;
 
 	ms->m_header.h_version = (DLM_HEADER_MAJOR | DLM_HEADER_MINOR);
diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index cef45239a5c0..e0e74ee82a21 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1336,7 +1336,7 @@ static struct writequeue_entry *new_writequeue_entry(struct connection *con,
 	if (!entry)
 		return NULL;
 
-	entry->page = alloc_page(allocation);
+	entry->page = alloc_page(allocation | __GFP_ZERO);
 	if (!entry->page) {
 		kfree(entry);
 		return NULL;
diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 73ddee5159d7..f5b1bd65728d 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -41,7 +41,6 @@ static int create_rcom(struct dlm_ls *ls, int to_nodeid, int type, int len,
 			  to_nodeid, type, len);
 		return -ENOBUFS;
 	}
-	memset(mb, 0, mb_len);
 
 	rc = (struct dlm_rcom *) mb;
 
@@ -462,7 +461,6 @@ int dlm_send_ls_not_ready(int nodeid, struct dlm_rcom *rc_in)
 	mh = dlm_lowcomms_get_buffer(nodeid, mb_len, GFP_NOFS, &mb);
 	if (!mh)
 		return -ENOBUFS;
-	memset(mb, 0, mb_len);
 
 	rc = (struct dlm_rcom *) mb;
 
-- 
2.26.2

