Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BBF57294448
	for <lists+cluster-devel@lfdr.de>; Tue, 20 Oct 2020 23:10:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603228212;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rA2uq3Kx0NZUg3BTZkiyiO1AZ4vMjCo9b/zsLeHEN8E=;
	b=R10+80XHM0zxbXCEry/S6Bqlfd1sgMSKSyi06/Hh2WSi7LVBg57Q3z7OE90C74IpzsCBlK
	so5gBNw5p3MZmnRfVFwWyynzXiNpyc7FUgOD7wn8gyopQKbPXSypfUrnCsVc+kvOWOYdrN
	ZHjWS0u8o76W8a+EH5ag7NSRorS3cN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-EN78F2HxNdetTA3NoppSjQ-1; Tue, 20 Oct 2020 17:10:09 -0400
X-MC-Unique: EN78F2HxNdetTA3NoppSjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A51AD1006C94;
	Tue, 20 Oct 2020 21:10:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92A0F5C1BB;
	Tue, 20 Oct 2020 21:10:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77681180B658;
	Tue, 20 Oct 2020 21:10:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09KLA3aV005681 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 20 Oct 2020 17:10:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C1C8175127; Tue, 20 Oct 2020 21:10:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-119-138.rdu2.redhat.com [10.10.119.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5105F7512A;
	Tue, 20 Oct 2020 21:10:03 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 20 Oct 2020 17:09:57 -0400
Message-Id: <20201020210957.1009638-4-aahringo@redhat.com>
In-Reply-To: <20201020210957.1009638-1-aahringo@redhat.com>
References: <20201020210957.1009638-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 3/3] fs: dlm: check on existing
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
 fs/dlm/lowcomms.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index c23d794e82910..0dc651676dfa1 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -370,10 +370,28 @@ static int addr_to_nodeid(struct sockaddr_storage *addr, int *nodeid)
 	return rv;
 }
 
+static bool dlm_lowcomms_na_has_addr(const struct dlm_node_addr *na,
+				     const struct sockaddr_storage *addr)
+{
+	int i;
+
+	spin_lock(&dlm_node_addrs_spin);
+	for (i = 0; i < na->addr_count; i++) {
+		if (addr_compare(na->addr[i], addr)) {
+			spin_unlock(&dlm_node_addrs_spin);
+			return true;
+		}
+	}
+	spin_unlock(&dlm_node_addrs_spin);
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
@@ -398,6 +416,14 @@ int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len)
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

