Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C016D337D8D
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Mar 2021 20:21:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615490467;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7Zu0dnnXBbTwhvskmxD7hul4TADFXO8iliuedc/wzOI=;
	b=Igz5szmWIh+gwePumbGnzSwR0WkYEf+Ai+e3LSLMJoFD2F9yjNCJ3biQ2tv6f6v7buQtZo
	OOf2PRwYbhv2Foa/C2WQ9uyIMUOZNjKCgOArqMJ3xmMGPnAvOldOpMrFsQ+s59/TbhWsuO
	E4VnrJF1xXR0L9/lva6fGt1CH6RfCI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-3ffWq6qEP7GOiECIRspFMQ-1; Thu, 11 Mar 2021 14:21:04 -0500
X-MC-Unique: 3ffWq6qEP7GOiECIRspFMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A648192D78D;
	Thu, 11 Mar 2021 19:21:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A6DF18B5E;
	Thu, 11 Mar 2021 19:21:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8ED8B1800232;
	Thu, 11 Mar 2021 19:21:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12BJKrXa001946 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 11 Mar 2021 14:20:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9F9D839A5F; Thu, 11 Mar 2021 19:20:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-91.rdu2.redhat.com [10.10.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 41C2318B5E;
	Thu, 11 Mar 2021 19:20:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: anprice@redhat.com
Date: Thu, 11 Mar 2021 14:20:36 -0500
Message-Id: <20210311192036.17218-3-aahringo@redhat.com>
In-Reply-To: <20210311192036.17218-1-aahringo@redhat.com>
References: <20210311192036.17218-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH gfs2-utils 2/2] glocktop: allocate fsdlm
	dynamically
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

This patch allocates the fsdlm string dynamically with respect of
dlmwaiters. The fsdlm has at least the dlmwaiters length, the 105 bytes
are for some other predicted max length strings.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 gfs2/glocktop/glocktop.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/gfs2/glocktop/glocktop.c b/gfs2/glocktop/glocktop.c
index 9df87d18..0096a2a5 100644
--- a/gfs2/glocktop/glocktop.c
+++ b/gfs2/glocktop/glocktop.c
@@ -1605,7 +1605,7 @@ static void parse_glocks_file(int fd, const char *fsname, int dlmwaiters,
 			      int dlmgrants, int trace_dir_path,
 			      int show_held, int help, int summary)
 {
-	char fstitle[96], fsdlm[105];
+	char fstitle[96], *fsdlm;
 	char ctimestr[64];
 	time_t t;
 	int i;
@@ -1615,7 +1615,12 @@ static void parse_glocks_file(int fd, const char *fsname, int dlmwaiters,
 	strftime(ctimestr, 64, "%a %b %d %T %Y", localtime(&t));
 	ctimestr[63] = '\0';
 	memset(fstitle, 0, sizeof(fstitle));
-	memset(fsdlm, 0, sizeof(fsdlm));
+	fsdlm = calloc(1, 105 + dlmwaiters);
+	if (!fsdlm) {
+		printf("Failed to allocate fsdlm\n");
+		exit(-1);
+	}
+
 	sprintf(fstitle, "@ %.22s       %s ", fsname, ctimestr);
 	if (dlmwaiters) {
 		sprintf(fsdlm, "dlm: %s/%s/%s [", dlm_dirtbl_size,
@@ -1628,6 +1633,7 @@ static void parse_glocks_file(int fd, const char *fsname, int dlmwaiters,
 	}
 	attron(A_BOLD);
 	print_it(NULL, "%s @%s %s", NULL, fstitle, hostname, fsdlm);
+	free(fsdlm);
 	eol(0);
 	attroff(A_BOLD);
 	glock_details(fd, fsname, dlmwaiters, dlmgrants, trace_dir_path,
-- 
2.26.2

