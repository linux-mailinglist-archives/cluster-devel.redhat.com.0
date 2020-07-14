Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0516121F8B4
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jul 2020 20:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594749726;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wxcqohyj8VR+3a2RxvUc+COsThWY4DiV+Vru8hEf7cs=;
	b=DnSN2BmSK6FDIXf3t9gMLlkfhaAtAYFzl6MOig7hpFeVej8VS+LanRZiMnfaxeZArEyHH5
	hUm5Wm7TSWlyo8sOk+kzjjueM5dG4vYenj1nSIZggRK92gRSCcrpTKBUAy7XIKlu+HEqmS
	CDv0us3ZOalSrOfD178R27qkR1KbejM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-nbyVB8KqOKOWkaC7a5Akrg-1; Tue, 14 Jul 2020 14:02:03 -0400
X-MC-Unique: nbyVB8KqOKOWkaC7a5Akrg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42A3CA47DF;
	Tue, 14 Jul 2020 18:01:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30A7960C84;
	Tue, 14 Jul 2020 18:01:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1AD341809563;
	Tue, 14 Jul 2020 18:01:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EI1d3u024234 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 14:01:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6325E60CD1; Tue, 14 Jul 2020 18:01:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-119-142.rdu2.redhat.com [10.10.119.142])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9FB560BF4;
	Tue, 14 Jul 2020 18:01:38 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 14 Jul 2020 14:01:14 -0400
Message-Id: <20200714180116.18642-3-aahringo@redhat.com>
In-Reply-To: <20200714180116.18642-1-aahringo@redhat.com>
References: <20200714180116.18642-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 2/4] dlm_controld: fix may be used
	uninitialized
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch fixes the following compiler warning:

daemon_cpg.c:2158:12: warning: ‘run’ may be used uninitialized in this function [-Wmaybe-uninitialized]
 2158 |   run->info.reply_count++;

It's fixed by just init the used variable to NULL and use it only if
it's not NULL.
---
 dlm_controld/daemon_cpg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/dlm_controld/daemon_cpg.c b/dlm_controld/daemon_cpg.c
index 99aca8db..392e0ff6 100644
--- a/dlm_controld/daemon_cpg.c
+++ b/dlm_controld/daemon_cpg.c
@@ -2115,7 +2115,7 @@ int receive_run_reply(struct dlm_header *hd, int len)
 int receive_run_request(struct dlm_header *hd, int len)
 {
 	struct run_request *req = (struct run_request *)hd;
-	struct run *run;
+	struct run *run = NULL;
 
 	run_request_in(req);
 
@@ -2153,7 +2153,7 @@ int receive_run_request(struct dlm_header *hd, int len)
 		return 0;
 	}
 
-	if (!opt(enable_helper_ind)) {
+	if (!opt(enable_helper_ind) && run) {
 		log_debug("receive_run_request %s helper not enabled", req->uuid);
 		run->info.reply_count++;
 		run->info.need_replies--;
-- 
2.26.2

