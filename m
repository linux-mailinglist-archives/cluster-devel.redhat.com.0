Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6A436422F4D
	for <lists+cluster-devel@lfdr.de>; Tue,  5 Oct 2021 19:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633455339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=33eEiQjnZZsMTJ2bfoSbEltr8TUKAS3fwdBZdg0FDpc=;
	b=DF2lyyPoFJqGOoeIjx+fxJaBqmWGvQmGQOwL6BfvfW/w1BBfCH4AHRejThzkcVlLA/OVaC
	kxEfWbdhR7JM1moitL4U2GB8VwxFNDSes0KFzG89ILeC4NlP23o23MbfbLQz4QCk1kMYS6
	XZ2Se3m/yCPUzEbgE9JZBMdB/uZ4QbM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-fxdUhKgmPc-Z0lbWxUWe2Q-1; Tue, 05 Oct 2021 13:35:38 -0400
X-MC-Unique: fxdUhKgmPc-Z0lbWxUWe2Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36F1F10247A8;
	Tue,  5 Oct 2021 17:35:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CE415F4E8;
	Tue,  5 Oct 2021 17:35:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8B571800B9C;
	Tue,  5 Oct 2021 17:35:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 195HYmmf028232 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 5 Oct 2021 13:34:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3B3D4100164A; Tue,  5 Oct 2021 17:34:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5563101F6D5;
	Tue,  5 Oct 2021 17:34:37 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  5 Oct 2021 13:34:09 -0400
Message-Id: <20211005173410.4004891-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 1/2] fs: dlm: use
	dlm_recovery_stopped instead of test_bit
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch will change to use dlm_recovery_stopped() which is the dlm way
to check if the LSFL_RECOVER_STOP flag in ls_flags by using the helper.
It is an atomic operation but the check is still as before to fetch the
value if ls_recover_lock is held. There might be more further
investigations if the value can be changed afterwards and if it has any
side effects.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/rcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dlm/rcom.c b/fs/dlm/rcom.c
index 6cba86470278..5821b777a1a7 100644
--- a/fs/dlm/rcom.c
+++ b/fs/dlm/rcom.c
@@ -601,7 +601,7 @@ void dlm_receive_rcom(struct dlm_ls *ls, struct dlm_rcom *rc, int nodeid)
 
 	spin_lock(&ls->ls_recover_lock);
 	status = ls->ls_recover_status;
-	stop = test_bit(LSFL_RECOVER_STOP, &ls->ls_flags);
+	stop = dlm_recovery_stopped(ls);
 	seq = ls->ls_recover_seq;
 	spin_unlock(&ls->ls_recover_lock);
 
-- 
2.27.0

