Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C637793EE0
	for <lists+cluster-devel@lfdr.de>; Wed,  6 Sep 2023 16:32:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694010761;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YZlgeQleCm4081Yx+aJTBwDOsnC3SXimjDjE5DdOM3A=;
	b=TCmnjiIM5jHJm+PmRAwzeNI3HnMYQVwYJGvAwQM13dFkzKiIktVfUQmIHCMevFt37o7REL
	8GAJoghNqOcYkB+BFOAsDt/c//eGLMM3UE8m4qcCSL9WY9t5alz1JwBmooAkb4Qk7ouEln
	0RGSsSONpUfp2OCWBolRxkXQYn6zD0A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-679-bHKbyLwUOJm9fHVTQnSnEQ-1; Wed, 06 Sep 2023 10:32:38 -0400
X-MC-Unique: bHKbyLwUOJm9fHVTQnSnEQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67713926401;
	Wed,  6 Sep 2023 14:32:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5BC6A1121314;
	Wed,  6 Sep 2023 14:32:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EF47D19465B5;
	Wed,  6 Sep 2023 14:32:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 01CA5194658D for <cluster-devel@listman.corp.redhat.com>;
 Wed,  6 Sep 2023 14:32:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E84BA140E967; Wed,  6 Sep 2023 14:32:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9E89140E950;
 Wed,  6 Sep 2023 14:32:32 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  6 Sep 2023 10:31:49 -0400
Message-Id: <20230906143153.1353077-2-aahringo@redhat.com>
In-Reply-To: <20230906143153.1353077-1-aahringo@redhat.com>
References: <20230906143153.1353077-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH dlm/next 2/6] dlm: fix remove member after
 close call
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The idea of commit 63e711b08160 ("fs: dlm: create midcomms nodes when
configure") is to set the midcomms node lifetime when a node joins or
leaves the cluster. Currently we can hit the following warning:

[10844.611495] ------------[ cut here ]------------
[10844.615913] WARNING: CPU: 4 PID: 84304 at fs/dlm/midcomms.c:1263
dlm_midcomms_remove_member+0x13f/0x180 [dlm]

or running in a state where we hit a midcomms node usage count in a
negative value:

[  260.830782] node 2 users dec count -1

The first warning happens when the a specific node does not exists and
it was probably removed but dlm_midcomms_close() which is called when a
node leaves the cluster. The second kernel log message is probably in a
case when dlm_midcomms_addr() is called when a joined the cluster but
due fencing a node leaved the cluster without getting removed from the
lockspace. If the node joins the cluster and it was removed from the
cluster due fencing the first call is to remove the node from lockspaces
triggered by the user space. In both cases if the node wasn't found or
the user count is zero, we should ignore any additional midcomms handling
of dlm_midcomms_remove_member().

Cc: stable@vger.kernel.org
Fixes: 63e711b08160 ("fs: dlm: create midcomms nodes when configure")
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/midcomms.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/midcomms.c b/fs/dlm/midcomms.c
index 455265c6ba53..4ad71e97cec2 100644
--- a/fs/dlm/midcomms.c
+++ b/fs/dlm/midcomms.c
@@ -1268,12 +1268,23 @@ void dlm_midcomms_remove_member(int nodeid)
 
 	idx = srcu_read_lock(&nodes_srcu);
 	node = nodeid2node(nodeid);
-	if (WARN_ON_ONCE(!node)) {
+	/* in case of dlm_midcomms_close() removes node */
+	if (!node) {
 		srcu_read_unlock(&nodes_srcu, idx);
 		return;
 	}
 
 	spin_lock(&node->state_lock);
+	/* case of dlm_midcomms_addr() created node but
+	 * was not added before because dlm_midcomms_close()
+	 * removed the node
+	 */
+	if (!node->users) {
+		spin_unlock(&node->state_lock);
+		srcu_read_unlock(&nodes_srcu, idx);
+		return;
+	}
+
 	node->users--;
 	pr_debug("node %d users dec count %d\n", nodeid, node->users);
 
-- 
2.31.1

