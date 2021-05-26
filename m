Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 678CE391904
	for <lists+cluster-devel@lfdr.de>; Wed, 26 May 2021 15:41:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-O3hr9V_OPWamlCTO08mozw-1; Wed, 26 May 2021 09:41:06 -0400
X-MC-Unique: O3hr9V_OPWamlCTO08mozw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E066801B12;
	Wed, 26 May 2021 13:41:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AFB55100E113;
	Wed, 26 May 2021 13:41:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 980CAEDCC;
	Wed, 26 May 2021 13:40:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14QDeplf025547 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 May 2021 09:40:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4D5BA20ED6D8; Wed, 26 May 2021 13:40:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 491F320ED6DB
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 13:40:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD5DE95F343
	for <cluster-devel@redhat.com>; Wed, 26 May 2021 13:40:48 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-389-DSQwCdwsNROcRT3PPTJ8Ng-1; Wed, 26 May 2021 09:40:44 -0400
X-MC-Unique: DSQwCdwsNROcRT3PPTJ8Ng-1
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
	by youngberry.canonical.com with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
	(envelope-from <colin.king@canonical.com>)
	id 1lltm3-0004tv-N3; Wed, 26 May 2021 13:40:39 +0000
From: Colin King <colin.king@canonical.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
	David Teigland <teigland@redhat.com>,
	Alexander Aring <aahringo@redhat.com>, cluster-devel@redhat.com
Date: Wed, 26 May 2021 14:40:39 +0100
Message-Id: <20210526134039.3448305-1-colin.king@canonical.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH][next] fs: dlm: Fix memory leak of object mh
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Colin Ian King <colin.king@canonical.com>

There is an error return path that is not kfree'ing mh after
it has been successfully allocates.  Fix this by free'ing it.

Addresses-Coverity: ("Resource leak")
Fixes: a070a91cf140 ("fs: dlm: add more midcomms hooks")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/dlm/rcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 085f21966c72..19298edc1573 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -393,6 +393,7 @@ static void receive_rcom_lookup(struct dlm_ls *ls, struct dlm_rcom *rc_in)
 	if (rc_in->rc_id == 0xFFFFFFFF) {
 		log_error(ls, "receive_rcom_lookup dump from %d", nodeid);
 		dlm_dump_rsb_name(ls, rc_in->rc_buf, len);
+		kfree(mh);
 		return;
 	}
 
-- 
2.31.1

