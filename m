Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F8A71510A
	for <lists+cluster-devel@lfdr.de>; Mon, 29 May 2023 23:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685396695;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bjAyQaK3NkAs3edaOJZcql5Xwneq0PBQF5xPGlJrtrc=;
	b=JxeM+5OHYPyC10NweynLLW8rmRt4L8hfc4xwotr2J3VkVDJaxfkSpFEi6gGfeYkpye+yq+
	jTKn4AbAo9w+ycYbHFW+39RBFf7CbnEWYh9gtP3bhRrnY5QuPOCObvETZilHeSKx4GzUFQ
	CsDHuzhvnc01wrz4/XRB6r0bLtwttVk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-fltkoyKRNl2skcm-utagQA-1; Mon, 29 May 2023 17:44:49 -0400
X-MC-Unique: fltkoyKRNl2skcm-utagQA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B690D3802138;
	Mon, 29 May 2023 21:44:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA445492B00;
	Mon, 29 May 2023 21:44:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 87A8E19465A2;
	Mon, 29 May 2023 21:44:46 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 598C219465B7 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 29 May 2023 21:44:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4C1B82166B2E; Mon, 29 May 2023 21:44:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 222382166B2B;
 Mon, 29 May 2023 21:44:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 29 May 2023 17:44:36 -0400
Message-Id: <20230529214440.2542721-8-aahringo@redhat.com>
In-Reply-To: <20230529214440.2542721-1-aahringo@redhat.com>
References: <20230529214440.2542721-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH dlm/next 08/12] fs: dlm: warn about messages
 from left nodes
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch warns about messages which are received from nodes who
already left the lockspace resource signaled by the cluster manager.
Before commit 489d8e559c65 ("fs: dlm: add reliable connection if
reconnect") there was a synchronization issue with the socket
lifetime and the cluster event of leaving a lockspace and other
nodes did not stop of sending messages because the cluster manager has a
pending message to leave the lockspace. The reliable session layer for
dlm use sequence numbers to ensure dlm message were never being dropped.
If this is not corrected synchronized we have a problem, this patch will
use the filter case and turn it into a WARN_ON_ONCE() so we seeing such
issue on the kernel log because it should never happen now.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index debf8a55ad7d..ede903246fa4 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -4616,7 +4616,7 @@ static void _receive_message(struct dlm_ls *ls, struct dlm_message *ms,
 {
 	int error = 0, noent = 0;
 
-	if (!dlm_is_member(ls, le32_to_cpu(ms->m_header.h_nodeid))) {
+	if (WARN_ON_ONCE(!dlm_is_member(ls, le32_to_cpu(ms->m_header.h_nodeid)))) {
 		log_limit(ls, "receive %d from non-member %d %x %x %d",
 			  le32_to_cpu(ms->m_type),
 			  le32_to_cpu(ms->m_header.h_nodeid),
@@ -4754,7 +4754,7 @@ static void dlm_receive_message(struct dlm_ls *ls, struct dlm_message *ms,
 		/* If we were a member of this lockspace, left, and rejoined,
 		   other nodes may still be sending us messages from the
 		   lockspace generation before we left. */
-		if (!ls->ls_generation) {
+		if (WARN_ON_ONCE(!ls->ls_generation)) {
 			log_limit(ls, "receive %d from %d ignore old gen",
 				  le32_to_cpu(ms->m_type), nodeid);
 			return;
-- 
2.31.1

