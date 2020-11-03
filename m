Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A9A532A382B
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Nov 2020 02:04:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604365498;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Md5cL3pJ/iRNxiyygWxaatXHZszXdUjB4wg7NOzcr0U=;
	b=KgaT/EX3D8lJ4cHPbzFq4aXJm7qDGccrKLTSq8YESab/vCQPXxsN2/0j2BDD6COyi8Vn2x
	n/YETBCfjJz/ziEzhKNhO/LxIbkRnXzpKBXKVVMkwl9StqIVds6UT3m4c5uwmyhlwRdL53
	DHITpZdCmuMraxKvAtRpL1ts4qi+rUA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-UI6MdqhuNxq6TkJ5MgJVuw-1; Mon, 02 Nov 2020 20:04:56 -0500
X-MC-Unique: UI6MdqhuNxq6TkJ5MgJVuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BEEC809DDB;
	Tue,  3 Nov 2020 01:04:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BBAA5B4DA;
	Tue,  3 Nov 2020 01:04:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0721B8C7B0;
	Tue,  3 Nov 2020 01:04:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A314qpv003598 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 20:04:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 32FD25C5FE; Tue,  3 Nov 2020 01:04:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-45.rdu2.redhat.com [10.10.115.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE7E25C5DE;
	Tue,  3 Nov 2020 01:04:51 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 Nov 2020 20:04:28 -0500
Message-Id: <20201103010428.1009384-14-aahringo@redhat.com>
In-Reply-To: <20201103010428.1009384-1-aahringo@redhat.com>
References: <20201103010428.1009384-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 RESEND v5.10-rc2 13/13] fs: dlm: check on
	existing node address
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
index 7f85594b663a..372c34ff8594 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -374,10 +374,25 @@ static int addr_to_nodeid(struct sockaddr_storage *addr, int *nodeid)
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
@@ -402,6 +417,14 @@ int dlm_lowcomms_addr(int nodeid, struct sockaddr_storage *addr, int len)
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

