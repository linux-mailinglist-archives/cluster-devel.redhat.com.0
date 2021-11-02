Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1B944365C
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 20:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635880689;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=33eEiQjnZZsMTJ2bfoSbEltr8TUKAS3fwdBZdg0FDpc=;
	b=YS18fVZgIFjWsqDC+s8T1v2CxqcBsLPdi3CNU3OaWmPxZgUEE9gsqeAs+Ec4tY1FGBP3OB
	47azqyZ1PZWWsCmMMS8O4bTSI5YZUJobcZrBJfpVGPW0yXZewR7N97dkWAgioWNubquxlY
	RM9AGPYnmKD9Rd6Ksrpe/WoIjzSDlr4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-OSzvm9rnNZiI7GWTCk4zBg-1; Tue, 02 Nov 2021 15:18:05 -0400
X-MC-Unique: OSzvm9rnNZiI7GWTCk4zBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 289EF8042E5;
	Tue,  2 Nov 2021 19:18:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AF0C60657;
	Tue,  2 Nov 2021 19:18:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 128A84EA2F;
	Tue,  2 Nov 2021 19:18:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2JHuYa020720 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 15:17:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1CDB860657; Tue,  2 Nov 2021 19:17:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C24DE652AC;
	Tue,  2 Nov 2021 19:17:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Nov 2021 15:17:12 -0400
Message-Id: <20211102191724.210095-7-aahringo@redhat.com>
In-Reply-To: <20211102191724.210095-1-aahringo@redhat.com>
References: <20211102191724.210095-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND v5.15-rc7 06/18] fs: dlm: use
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

