Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 435C02945E9
	for <lists+cluster-devel@lfdr.de>; Wed, 21 Oct 2020 02:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603239484;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X5QNPc3I4vZUq74QzjYjYwQ2qCfzT/XeDPMgOKRFbvA=;
	b=YJogC5djm+aki+kii3knGjkmGYeZzxMUzkLCU+RneZQPEUEX3kztbYNHHjAbMIFAWXn0i+
	vVeOpTyVeqOSFDPEhrE0ys62tqT3FSyZYYGJg6B7SZhzdhLoczIRKoaQK5P7jdj0TXVkCC
	1e8hhtPapYdtiZlmE1p65iaz81Euj5M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-81QQC1zUNWqdi_RCxQW81Q-1; Tue, 20 Oct 2020 20:18:02 -0400
X-MC-Unique: 81QQC1zUNWqdi_RCxQW81Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5B361084C9C;
	Wed, 21 Oct 2020 00:17:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A3EB57D4E1;
	Wed, 21 Oct 2020 00:17:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 996348C7CE;
	Wed, 21 Oct 2020 00:17:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09L0HoWT022422 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 20:17:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6BA4060FC2; Wed, 21 Oct 2020 00:17:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-119-138.rdu2.redhat.com [10.10.119.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D387460C13;
	Wed, 21 Oct 2020 00:17:49 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 20 Oct 2020 20:17:39 -0400
Message-Id: <20201021001739.1689219-4-aahringo@redhat.com>
In-Reply-To: <20201021001739.1689219-1-aahringo@redhat.com>
References: <20201021001739.1689219-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 3/3] fs: dlm: check on existing
	node address
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

This patch checks if we add twice the same address to a per node address
array. This should never be the case and we report -EEXIST to the user
space.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index c23d794e82910..8122eb5f2afb8 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -370,10 +370,25 @@ static int addr_to_nodeid(struct sockaddr_storage *addr, int *nodeid)
 	return rv;
 }
 
+/* caller need to held dlm_node_addrs_spin lock */
+static bool dlm_lowcomms_na_has_addr(const struct dlm_node_addr *na,
+				     const struct sockaddr_storage *addr)
+{
+	int i;
+
+	for (i = 0; i < na->addr_count; i++) {
+		if (addr_compare(na->addr[i], addr))
+			return true;
+	}
+
+	return false;
+}
+
 int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len)
 {
 	struct sockaddr_storage *new_addr;
 	struct dlm_node_addr *new_node, *na;
+	bool ret;
 
 	new_node = kzalloc(sizeof(struct dlm_node_addr), GFP_NOFS);
 	if (!new_node)
@@ -398,6 +413,14 @@ int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len)
 		return 0;
 	}
 
+	ret = dlm_lowcomms_na_has_addr(na, addr);
+	if (ret) {
+		spin_unlock(&dlm_node_addrs_spin);
+		kfree(new_addr);
+		kfree(new_node);
+		return -EEXIST;
+	}
+
 	if (na->addr_count >= DLM_MAX_ADDR_COUNT) {
 		spin_unlock(&dlm_node_addrs_spin);
 		kfree(new_addr);
-- 
2.26.2

