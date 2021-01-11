Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 87E102F1D5A
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jan 2021 19:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610388223;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7viDNG3SLyjqcv9YXsiA6QgWzx1F21ipx/zB00yOebo=;
	b=FhNu9lYPTY8TdGhQdcaLm51SdmmkqGVw43L4ih9doHcp7y2lkXu6LfcTYNBw1DxFgeQWlp
	IqA27aJsQc/Ya1yFQIZmHSeI+zyWqZoefsIqGayYoiPOqCpw8CEhM4CtgzMX89aMszLk0T
	86V8Zb/lzVlh3GpdCTidFb9IpUGf12Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-TiNvIi7iMyOMGesipW3UjA-1; Mon, 11 Jan 2021 13:03:41 -0500
X-MC-Unique: TiNvIi7iMyOMGesipW3UjA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ECF1B195D567;
	Mon, 11 Jan 2021 18:03:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB30C5C23A;
	Mon, 11 Jan 2021 18:03:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C569F4BB40;
	Mon, 11 Jan 2021 18:03:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10BI3XZp032252 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Jan 2021 13:03:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 436665D9F4; Mon, 11 Jan 2021 18:03:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-187.rdu2.redhat.com [10.10.116.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDAE05D9DB;
	Mon, 11 Jan 2021 18:03:32 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 11 Jan 2021 13:02:57 -0500
Message-Id: <20210111180310.122451-8-aahringo@redhat.com>
In-Reply-To: <20210111180310.122451-1-aahringo@redhat.com>
References: <20210111180310.122451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv4 dlm/next 07/20] fs: dlm: use GFP_ZERO for
	page buffer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
index 2b468fbb2b43..02ab939ad8d3 100644
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

