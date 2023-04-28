Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8A86F1C52
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Apr 2023 18:10:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682698220;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z3gJOCkmlaJ/4+jbSYiw6YDbw3JMQRwNxZu/Nb6Gtes=;
	b=i/1EK3MqA7m8EHbui71uRZ17bgqHKlYpWyXY1DGfv4KKU/GlUVnIm0V698kpmTCKKKv4XP
	jPDS0IZR9ybuUQ02JNQXZezMnL6k+qa2doKDMNj9YR1DsoHDFvxx79UIek4fOy1qwKIx3q
	xbd+yzp7/8OuC973S6gg0zeR0xiJGII=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-XaG5_8usNE6hzdISzjdCCw-1; Fri, 28 Apr 2023 12:08:49 -0400
X-MC-Unique: XaG5_8usNE6hzdISzjdCCw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 005143C0ED4F;
	Fri, 28 Apr 2023 16:07:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CB9D4043AC7;
	Fri, 28 Apr 2023 16:07:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9D21E1946A51;
	Fri, 28 Apr 2023 16:07:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 28DEA1946A45 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 28 Apr 2023 16:07:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 17909492C13; Fri, 28 Apr 2023 16:07:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.users.ipa.redhat.com (unknown [10.22.34.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E12EB492C3C
 for <cluster-devel@redhat.com>; Fri, 28 Apr 2023 16:07:46 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 28 Apr 2023 12:07:46 -0400
Message-Id: <20230428160746.19876-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH] gfs2: Don't deref jdesc in evict
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

On corrupt gfs2 file systems the evict code can try to reference the
journal descriptor structure, jdesc, after it has been freed and set to
NULL. The sequence of events is:

init_journal()
...
fail_jindex:
   gfs2_jindex_free(sdp); <------frees journals, sets jdesc = NULL
      if (gfs2_holder_initialized(&ji_gh))
         gfs2_glock_dq_uninit(&ji_gh);
fail:
   iput(sdp->sd_jindex); <--references jdesc in evict_linked_inode
      evict()
         gfs2_evict_inode()
            evict_linked_inode()
               ret = gfs2_trans_begin(sdp, 0, sdp->sd_jdesc->jd_blocks);
<------references the now freed/zeroed sd_jdesc pointer.

The call to gfs2_trans_begin is done because the truncate_inode_pages
call can cause gfs2 events that require a transaction, such as removing
journaled data (jdata) blocks from the journal.

This patch fixes the problem by adding a check for sdp->sd_jdesc to
function gfs2_evict_inode. In theory, this should only happen to corrupt
gfs2 file systems, when gfs2 detects the problem, reports it, then tries
to evict all the system inodes it has read in up to that point.

Reported-by: Yang Lan <lanyang0908@gmail.com>
Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 872de059ec96..d3b5c6278be0 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1417,7 +1417,7 @@ static void gfs2_evict_inode(struct inode *inode)
 	struct gfs2_holder gh;
 	int ret;
 
-	if (inode->i_nlink || sb_rdonly(sb) || !ip->i_no_addr)
+	if (inode->i_nlink || sb_rdonly(sb) || !ip->i_no_addr || !sdp->sd_jdesc)
 		goto out;
 
 	gfs2_holder_mark_uninitialized(&gh);
-- 
2.40.0

