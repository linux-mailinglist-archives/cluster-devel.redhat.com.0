Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4603A44E992
	for <lists+cluster-devel@lfdr.de>; Fri, 12 Nov 2021 16:08:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636729710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zNgaxybTSnWvL5kdn3HJpIz1ud/RdLCmRzshXDAP0lw=;
	b=WCHj15+1Co3L2yY7qORYYaJrYBBreSYTsErocBeFmAZc98Vh23nGH/fDBr7ayJF/bpN5IR
	kvKJMmjjCueG6yrbrmUHw/OUU/cZZZCXZVkCaz2tQo2fpzSmHfmkZKsdRKraZfaOQ+dsDP
	Zb5wK/saZ/HIm3YW/qb9Ll15cvKwsZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-b4DQBndFPOe_ENDVeklByQ-1; Fri, 12 Nov 2021 10:08:26 -0500
X-MC-Unique: b4DQBndFPOe_ENDVeklByQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0166802C8F;
	Fri, 12 Nov 2021 15:08:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DD475F707;
	Fri, 12 Nov 2021 15:08:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A5A54E58F;
	Fri, 12 Nov 2021 15:08:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ACF8DAp013178 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 12 Nov 2021 10:08:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B564E60C82; Fri, 12 Nov 2021 15:08:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D7A860C4A;
	Fri, 12 Nov 2021 15:08:06 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 12 Nov 2021 10:08:01 -0500
Message-Id: <20211112150801.926903-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next] fs: dlm: fix potential buffer
	overflow
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch fixes an potential overflow in sscanf and the maximum
declared string parsing length which seems to be excluding the null
termination symbol. This patch will just add one byte to be prepared on
a string with length of DLM_RESNAME_MAXLEN including the null
termination symbol.

Fixes: 5054e79de999 ("fs: dlm: add lkb debugfs functionality")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/debug_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index df6f3f107be4..8fb04ebbafb5 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -640,7 +640,7 @@ static ssize_t table_write2(struct file *file, const char __user *user_buf,
 {
 	struct seq_file *seq = file->private_data;
 	int n, len, lkb_nodeid, lkb_status, error;
-	char name[DLM_RESNAME_MAXLEN] = {};
+	char name[DLM_RESNAME_MAXLEN + 1] = {};
 	struct dlm_ls *ls = seq->private;
 	unsigned int lkb_flags;
 	char buf[256] = {};
-- 
2.27.0

