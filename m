Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2404F3BBEFD
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Jul 2021 17:29:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-8ZBBlGVoML6EXDQst1XI-A-1; Mon, 05 Jul 2021 11:28:58 -0400
X-MC-Unique: 8ZBBlGVoML6EXDQst1XI-A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88B5A80414C;
	Mon,  5 Jul 2021 15:28:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BBCA5D9DE;
	Mon,  5 Jul 2021 15:28:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 038974EA37;
	Mon,  5 Jul 2021 15:28:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 165FSkN1031847 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Jul 2021 11:28:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33CA02023452; Mon,  5 Jul 2021 15:28:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27FAA20236E5
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:28:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16E9418A01AB
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:28:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-56-F6U0K_POOYCFMhQbEnD4Ag-1; 
	Mon, 05 Jul 2021 11:28:40 -0400
X-MC-Unique: F6U0K_POOYCFMhQbEnD4Ag-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 445EB61973;
	Mon,  5 Jul 2021 15:28:38 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon,  5 Jul 2021 11:27:33 -0400
Message-Id: <20210705152815.1520546-17-sashal@kernel.org>
In-Reply-To: <20210705152815.1520546-1-sashal@kernel.org>
References: <20210705152815.1520546-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.13 17/59] fs: dlm: cancel work
	sync othercon
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit c6aa00e3d20c2767ba3f57b64eb862572b9744b3 ]

These rx tx flags arguments are for signaling close_connection() from
which worker they are called. Obviously the receive worker cannot cancel
itself and vice versa for swork. For the othercon the receive worker
should only be used, however to avoid deadlocks we should pass the same
flags as the original close_connection() was called.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/lowcomms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index cdc50e9a5ab0..138e8236ff6e 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -715,7 +715,7 @@ static void close_connection(struct connection *con, bool and_other,
 
 	if (con->othercon && and_other) {
 		/* Will only re-enter once. */
-		close_connection(con->othercon, false, true, true);
+		close_connection(con->othercon, false, tx, rx);
 	}
 
 	con->rx_leftover = 0;
-- 
2.30.2

