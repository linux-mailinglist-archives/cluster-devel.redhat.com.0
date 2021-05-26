Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 610CA391AA0
	for <lists+cluster-devel@lfdr.de>; Wed, 26 May 2021 16:46:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-448-2Sps4i1JM6GEiL8iuctAoQ-1; Wed, 26 May 2021 10:46:54 -0400
X-MC-Unique: 2Sps4i1JM6GEiL8iuctAoQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F87A100747C;
	Wed, 26 May 2021 14:46:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBEA55C238;
	Wed, 26 May 2021 14:46:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9220180102A;
	Wed, 26 May 2021 14:46:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14QEkiQx030876 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 May 2021 10:46:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 83780103CA4; Wed, 26 May 2021 14:46:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DEE6103CB7
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 14:46:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18C0A800B29
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 14:46:42 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-331-CdlzY3NRMOaFf89m2Uf-0A-1; Wed, 26 May 2021 10:46:37 -0400
X-MC-Unique: CdlzY3NRMOaFf89m2Uf-0A-1
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
	by youngberry.canonical.com with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
	(envelope-from <colin.king@canonical.com>)
	id 1llunN-00018X-LG; Wed, 26 May 2021 14:46:21 +0000
From: Colin King <colin.king@canonical.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>,
	Alexander Aring <aahringo@redhat.com>, cluster-devel@redhat.com
Date: Wed, 26 May 2021 15:46:05 +0100
Message-Id: <20210526144605.3751174-1-colin.king@canonical.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH]  fs: dlm: Fix memory leak of object mh
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Colin Ian King <colin.king@canonical.com>

There is an error return path that is not kfree'ing mh after
it has been successfully allocates.  Fix this by moving the
call to create_rcom to after the check on rc_in->rc_id check
to avoid this.

Thanks to Alexander Ahring Oder Aring for suggesting the
correct way to fix this.

Addresses-Coverity: ("Resource leak")
Fixes: a070a91cf140 ("fs: dlm: add more midcomms hooks")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: don't kfree the object, instead move the check to before
    the call to create_rcom
---
 fs/dlm/rcom.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 085f21966c72..a7727b9e5e83 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -385,10 +385,6 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	int error, ret_nodeid, nodeid = rc_in->rc_header.h_nodeid;
 	int len = rc_in->rc_header.h_length - sizeof(struct dlm_rcom);
 
-	error = create_rcom(ls, nodeid, DLM_RCOM_LOOKUP_REPLY, 0, &rc, &mh);
-	if (error)
-		return;
-
 	/* Old code would send this special id to trigger a debug dump. */
 	if (rc_in->rc_id == 0xFFFFFFFF) {
 		log_error(ls, "receive_rcom_lookup dump from %d", nodeid);
@@ -396,6 +392,10 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 		return;
 	}
 
+	error = create_rcom(ls, nodeid, DLM_RCOM_LOOKUP_REPLY, 0, &rc, &mh);
+	if (error)
+		return;
+
 	error = dlm_master_lookup(ls, nodeid, rc_in->rc_buf, len,
 				  DLM_LU_RECOVER_MASTER, &ret_nodeid, NULL);
 	if (error)
-- 
2.31.1

