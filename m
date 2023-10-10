Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BABE07C4366
	for <lists+cluster-devel@lfdr.de>; Wed, 11 Oct 2023 00:05:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696975509;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aigk33WTcaIIDVNVjDtFXvALQQrohhQcmn8R5rWJNLw=;
	b=MZQ+c7cx+OTWAHLC1lxV/vYz3FLep7cG23f3zbVWX90Ypc+9P1i6QNqgwFmsFXLefJ/qe6
	Qw/Tz1QmLzNh92Ir+1OLlqQkuKWNe8lNTIdSDIOigezrTNhjSKxR62UtnT9h+eRE+JMffj
	i9UERtSIYjyUHtoI3bP6AEa+Bvmcs0s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-f0vcTpwuNBGX1QZRP8gvKw-1; Tue, 10 Oct 2023 18:05:01 -0400
X-MC-Unique: f0vcTpwuNBGX1QZRP8gvKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 89E75293248A;
	Tue, 10 Oct 2023 22:05:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DD26F1C060DF;
	Tue, 10 Oct 2023 22:04:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8198819466EB;
	Tue, 10 Oct 2023 22:04:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4678819466DF for <cluster-devel@listman.corp.redhat.com>;
 Tue, 10 Oct 2023 22:04:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 363AC63F78; Tue, 10 Oct 2023 22:04:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 032649A;
 Tue, 10 Oct 2023 22:04:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 10 Oct 2023 18:04:45 -0400
Message-Id: <20231010220448.2978176-5-aahringo@redhat.com>
In-Reply-To: <20231010220448.2978176-1-aahringo@redhat.com>
References: <20231010220448.2978176-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH RESEND 5/8] dlm: fix remove member after
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
Cc: cluster-devel@redhat.com, gfs2@lists.linux.dev,
 christophe.jaillet@wanadoo.fr, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
2.39.3

