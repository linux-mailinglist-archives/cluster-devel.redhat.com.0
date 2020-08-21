Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7278124DE8A
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Aug 2020 19:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598031239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lTfVdBfQxATVXI7gGB1AwonCv4tO2RshV1QXyfwyU2Y=;
	b=W4AUw3eQmJiNyQ4Kyo+kiletXRYoytHHFUxkrOe8xCGnSOidmRzT5g6Zv+qfWtog/uIbks
	hbLfWO40o+YFqB6IY8Ks5M97fg/US9qTsnp13zqHPqaPe4jA9bE0HVe+v7slszkcg3UzWn
	cJHf9a8ssl3U2B6Z1R9otDO3aLrVAH8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-5_FWGOOCP7i5FbCt0e93Qg-1; Fri, 21 Aug 2020 13:33:57 -0400
X-MC-Unique: 5_FWGOOCP7i5FbCt0e93Qg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C12E1074661;
	Fri, 21 Aug 2020 17:33:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C045756D8;
	Fri, 21 Aug 2020 17:33:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46C34181A899;
	Fri, 21 Aug 2020 17:33:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LHXixd028431 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 13:33:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 694A95DA75; Fri, 21 Aug 2020 17:33:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-102.phx2.redhat.com [10.3.112.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 36C935DA74
	for <cluster-devel@redhat.com>; Fri, 21 Aug 2020 17:33:44 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Aug 2020 12:33:34 -0500
Message-Id: <20200821173337.20377-10-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-1-rpeterso@redhat.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 09/12] gfs2: Only set PageChecked if we
	have a transaction
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

With jdata writes, we frequently got into situations where gfs2 deadlocked
because of this calling sequence:

gfs2_ail1_start
   gfs2_ail1_flush - for every tr on the sd_ail1_list:
      gfs2_ail1_start_one - for every bd on the tr's tr_ail1_list:
         generic_writepages
	    write_cache_pages passing __writepage()
	       calls clear_page_dirty_for_io which calls set_page_dirty:
	          which calls jdata_set_page_dirty which sets PageChecked.
	       __writepage() calls
	          mapping->a_ops->writepage AKA gfs2_jdata_writepage

However, gfs2_jdata_writepage checks if PageChecked is set, and if so, it
ignores the write and redirties the page. The problem is that write_cache_pages
calls clear_page_dirty_for_io, which often calls set_page_dirty(). See comments
in page-writeback.c starting with "Yes, Virginia". If it's jdata,
set_page_dirty will call jdata_set_page_dirty which will set PageChecked.
That causes a conflict because it makes it look like the page has been
redirtied by another writer, in which case we need to skip writing it and
redirty the page. That ends up in a deadlock because it isn't a "real" writer
and nothing will ever clear PageChecked.

If we do have a real writer, it will have started a transaction. So this
patch checks if a transaction is in use, and if not, it skips setting
PageChecked. That way, the page will be dirtied, cleaned, and written
appropriately.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/aops.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index 5c1914c8968f..9b2e927e6535 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -626,7 +626,8 @@ void adjust_fs_space(struct inode *inode)
  
 static int jdata_set_page_dirty(struct page *page)
 {
-	SetPageChecked(page);
+	if (current->journal_info)
+		SetPageChecked(page);
 	return __set_page_dirty_buffers(page);
 }
 
-- 
2.26.2

