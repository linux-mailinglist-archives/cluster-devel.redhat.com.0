Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 94C1221F8B5
	for <lists+cluster-devel@lfdr.de>; Tue, 14 Jul 2020 20:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594749729;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dqkAV1FXWR65+k+8CnsUAwlp4ZRfJnrmfje4pKnKPMc=;
	b=IuPaPkxbW8IpTDaVkgDKAwwr3aP9Rp0PEbiu9/gZhBI+ZvbO2mL04+RCd3O8sm58dnDxi+
	OkihZc0jBQ8KfuF/vYH0qJO/x6ZpX+k6sX8RkailihJxc4oASzx6s0tWIvl+9hFivaiA3A
	aQ5o+MAuO2f1sUjEezkpn0jsV2CawmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-ejD-0Q3XPxiUJVz_un1iKA-1; Tue, 14 Jul 2020 14:02:06 -0400
X-MC-Unique: ejD-0Q3XPxiUJVz_un1iKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CAE18F81E5;
	Tue, 14 Jul 2020 18:01:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D353710CE;
	Tue, 14 Jul 2020 18:01:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 763AC1809563;
	Tue, 14 Jul 2020 18:01:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06EI1eEF024255 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jul 2020 14:01:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B2F3060CD1; Tue, 14 Jul 2020 18:01:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-119-142.rdu2.redhat.com [10.10.119.142])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3675060C87;
	Tue, 14 Jul 2020 18:01:40 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 14 Jul 2020 14:01:16 -0400
Message-Id: <20200714180116.18642-5-aahringo@redhat.com>
In-Reply-To: <20200714180116.18642-1-aahringo@redhat.com>
References: <20200714180116.18642-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool 4/4] dlm_controld: get notice about
	failed config parse
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds more log_error() functionality in cases if parsing of
key value pairs fails so the user get notice about it.
---
 dlm_controld/config.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/dlm_controld/config.c b/dlm_controld/config.c
index 323f91e9..947480da 100644
--- a/dlm_controld/config.c
+++ b/dlm_controld/config.c
@@ -150,8 +150,10 @@ static void get_val_int(char *line, int *val_out)
 	int rv;
 
 	rv = sscanf(line, "%[^=]=%s", key, val);
-	if (rv != 2)
+	if (rv != 2) {
+		log_error("Failed to parse config line %s", line);
 		return;
+	}
 
 	*val_out = atoi(val);
 }
@@ -163,8 +165,10 @@ static void get_val_uint(char *line, unsigned int *val_out)
 	int rv;
 
 	rv = sscanf(line, "%[^=]=%s", key, val);
-	if (rv != 2)
+	if (rv != 2) {
+		log_error("Failed to parse config line %s", line);
 		return;
+	}
 
 	*val_out = strtoul(val, NULL, 0);
 }
@@ -176,8 +180,10 @@ static void get_val_str(char *line, char *val_out)
 	int rv;
 
 	rv = sscanf(line, "%[^=]=%s", key, val);
-	if (rv != 2)
+	if (rv != 2) {
+		log_error("Failed to parse config line %s", line);
 		return;
+	}
 
 	strcpy(val_out, val);
 }
-- 
2.26.2

