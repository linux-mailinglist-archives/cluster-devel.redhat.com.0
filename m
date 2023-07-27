Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF607654D7
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Jul 2023 15:23:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690464198;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kI3EpnQMsiV6Y8DUWZI/9ngVLQXknuF1VvQ+vXZ2tgs=;
	b=FkFtuTZRQ/FNZOqtRovsYLwfbDHDFaO1k5Rxf6mFMMuATI27YejhwdUzsHmy9ljGMdhSin
	RSY1pqams1esggsLv7hbE5C2WkaL4XnnYAr36PE9nffqsr+fJByQYmRfb7acPC97x5cztf
	m++i7PVNAVBLHlEsKVlHgN/jgofnS9o=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-36f4c5R1PP6ze751S-GtfA-1; Thu, 27 Jul 2023 09:23:14 -0400
X-MC-Unique: 36f4c5R1PP6ze751S-GtfA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A19A29ABA12;
	Thu, 27 Jul 2023 13:23:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F4012166B26;
	Thu, 27 Jul 2023 13:23:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E311194E012;
	Thu, 27 Jul 2023 13:23:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4FE99193F51A for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 229BE4094DC3; Thu, 27 Jul 2023 13:23:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00B3A4094DC2;
 Thu, 27 Jul 2023 13:23:09 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Jul 2023 09:22:59 -0400
Message-Id: <20230727132303.3352514-9-aahringo@redhat.com>
In-Reply-To: <20230727132303.3352514-1-aahringo@redhat.com>
References: <20230727132303.3352514-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [Cluster-devel] [PATCH dlm-next 09/13] fs: dlm: drop rxbuf
 manipulation in dlm_copy_master_names
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch removes the manipulation of the receive buffer in case of an
error and be sure the buffer is null terminated before an error
messagea is printed out. Instead of manipulate the receive buffer we
tell inside the format string the maximum length the string buffer is
being read.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dir.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/dir.c b/fs/dlm/dir.c
index 3bf5bf7a37b4..768cf8d43b2b 100644
--- a/fs/dlm/dir.c
+++ b/fs/dlm/dir.c
@@ -245,9 +245,8 @@ void dlm_copy_master_names(struct dlm_ls *ls, char *inbuf, int inlen,
 	if (inlen > 1) {
 		r = find_rsb_root(ls, inbuf, inlen);
 		if (!r) {
-			inbuf[inlen - 1] = '\0';
-			log_error(ls, "copy_master_names from %d start %d %s",
-				  nodeid, inlen, inbuf);
+			log_error(ls, "copy_master_names from %d start %d %.*s",
+				  nodeid, inlen, inlen, inbuf);
 			goto out;
 		}
 		list = r->res_root_list.next;
-- 
2.31.1

