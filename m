Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8658B5B3B04
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Sep 2022 16:47:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662734876;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PR5pnnX8B2kZKLPAZLBLWmcasuEzAj1uyfJUAC+h0rg=;
	b=GFKYGZY0riIC8wonbkqP21K90hFdYX3yhxOXq8cnsyJf51UXVF+J/36UUt+scw45yA3ZS0
	IoMycUpNroRZytL2ivzCJj8QDGMe6gBdOK3XrrYzwe27Ootir+J0J9tgx589M0FP4L0Afv
	Xh5QmvTKkP6eX82ujgAtwoyHQZ6Sisk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-zXqGJL3hMTepUII4QXIvTg-1; Fri, 09 Sep 2022 10:47:53 -0400
X-MC-Unique: zXqGJL3hMTepUII4QXIvTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECA4C1C05EAE;
	Fri,  9 Sep 2022 14:47:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51E28C15BC0;
	Fri,  9 Sep 2022 14:47:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C5EA31946A55;
	Fri,  9 Sep 2022 14:47:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 041751946A41 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  9 Sep 2022 14:47:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DA5BB141511A; Fri,  9 Sep 2022 14:47:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDD751415102;
 Fri,  9 Sep 2022 14:47:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri,  9 Sep 2022 10:47:23 -0400
Message-Id: <20220909144724.2060174-2-aahringo@redhat.com>
In-Reply-To: <20220909144724.2060174-1-aahringo@redhat.com>
References: <20220909144724.2060174-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: [Cluster-devel] [PATCH dlm/next 2/3] fs: dlm: use packet in
 dlm_mhandle
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

To allow more than just dereferencing the inner header we directly point
to the inner dlm packet which allows us to dereference the header, rcom
or message structure.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 6489bc22ad61..4eed40d66da1 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -194,7 +194,7 @@ struct midcomms_node {
 };
 
 struct dlm_mhandle {
-	const struct dlm_header *inner_hd;
+	const union dlm_packet *inner_p;
 	struct midcomms_node *node;
 	struct dlm_opts *opts;
 	struct dlm_msg *msg;
@@ -1055,7 +1055,7 @@ static struct dlm_msg *dlm_midcomms_get_msg_3_2(struct dlm_mhandle *mh, int node
 	dlm_fill_opts_header(opts, len, mh->seq);
 
 	*ppc += sizeof(*opts);
-	mh->inner_hd = (const struct dlm_header *)*ppc;
+	mh->inner_p = (const union dlm_packet *)*ppc;
 	return msg;
 }
 
@@ -1133,7 +1133,7 @@ struct dlm_mhandle *dlm_midcomms_get_mhandle(int nodeid, int len,
 static void dlm_midcomms_commit_msg_3_2(struct dlm_mhandle *mh)
 {
 	/* nexthdr chain for fast lookup */
-	mh->opts->o_nextcmd = mh->inner_hd->h_cmd;
+	mh->opts->o_nextcmd = mh->inner_p->header.h_cmd;
 	mh->committed = true;
 	dlm_lowcomms_commit_msg(mh->msg);
 }
-- 
2.31.1

