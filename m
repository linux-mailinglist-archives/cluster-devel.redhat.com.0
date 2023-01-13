Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E1666A623
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Jan 2023 23:44:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673649860;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qiS+eDidp2DiBLCvkFHzpFGlVXictqLI4TCrstADLHs=;
	b=TTkXBPFZ/6GpVuq7aZX8MXiQIZ2YaO4Qs+NmH31zr7kUUaExpUj8SNKzRlVFi4G/Qr71Hc
	Pf+YGm0MJwRgEp/nibCr085i/dI0zjcEfPrqDpVo+VjsnWnevGILbYQY9XnQp7wVmHMmSc
	KVFEbFVvjcC6PNi8LeD/yYbNs2NWD+s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-lUZrsEnmNuO6S15OQCFlOA-1; Fri, 13 Jan 2023 17:44:10 -0500
X-MC-Unique: lUZrsEnmNuO6S15OQCFlOA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A4C9185A78B;
	Fri, 13 Jan 2023 22:44:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CBF84085720;
	Fri, 13 Jan 2023 22:44:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 326C019459CF;
	Fri, 13 Jan 2023 22:44:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 821BF194706F for <cluster-devel@listman.corp.redhat.com>;
 Fri, 13 Jan 2023 22:44:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7005C492B07; Fri, 13 Jan 2023 22:44:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46A1E492B05;
 Fri, 13 Jan 2023 22:44:02 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 13 Jan 2023 17:43:57 -0500
Message-Id: <20230113224357.2756856-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH dlm-tool] dlm_controld: better uevent
 filtering
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

When I did test with dlm_locktorture module I got several log messages
about:

uevent message has 3 args: add@/module/dlm_locktorture
uevent message has 3 args: remove@/module/dlm_locktorture

which are not expected and not able to parse by dlm_controld
process_uevent() function, because mismatch of argument counts.
Debugging it more, I figured out that those uevents are for
loading/unloading the dlm_locktorture module and there are uevents for
loading and unloading modules which have nothing todo with dlm lockspace
uevent handling.

The current filter works as:

if (!strstr(buf, "dlm"))

for matching the dlm joining/leaving uevent string which looks like:

offline@/kernel/dlm/locktorture

to avoid matching with other uevent which has somehow the string "dlm"
in it, we switch to the match "/dlm/" which should match only to dlm
uevent system events. Uevent uses itself '/' as a separator in the hope
that uevents cannot put a '/' as application data for an event.
---
 dlm_controld/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 7cf6348e..40689c5c 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -704,7 +704,7 @@ static void process_uevent(int ci)
 		return;
 	}
 
-	if (!strstr(buf, "dlm"))
+	if (!strstr(buf, "/dlm/"))
 		return;
 
 	log_debug("uevent: %s", buf);
-- 
2.31.1

