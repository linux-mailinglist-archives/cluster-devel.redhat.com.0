Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 492855F5A19
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Oct 2022 20:48:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664995724;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sZ1SO3QYLA+znUusv45EMwkx/+QNxOqvP8KangrK8lY=;
	b=eRJkENRxrbHa9q3n+sMEyyEFkhv0lWxqMvn93gMPFEYCk6a10lCCa4uiVnTeKGhYP56HqT
	2uxCHr2YfVxA+uHrC7Ixz3DPY4C5oGagFj5WdVZWK3cuIKlWoV3NS3CMsunbpqR3cyZbhN
	gZGkwO9MvY+qk4tGcYwZi4llQRI4YG4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-utzsR5JENdqZGmWHrUpqUw-1; Wed, 05 Oct 2022 14:48:38 -0400
X-MC-Unique: utzsR5JENdqZGmWHrUpqUw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DCAF1C14342;
	Wed,  5 Oct 2022 18:48:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D792B49BB67;
	Wed,  5 Oct 2022 18:48:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6431B1947BBE;
	Wed,  5 Oct 2022 18:48:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6D5031946A6B for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Oct 2022 18:48:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 21902492B05; Wed,  5 Oct 2022 18:48:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFF36492B06;
 Wed,  5 Oct 2022 18:48:32 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  5 Oct 2022 14:48:19 -0400
Message-Id: <20221005184820.4129480-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH dlm-tool 1/2] dlm_controld: be sure we close
 logging at last
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

I currently try to debug the following:

(gdb) bt
0  _int_malloc (av=av@entry=0x7fd353ac2bc0 <main_arena>, bytes=bytes@entry=8192) at malloc.c:3755
1  0x00007fd3537a04a6 in __libc_calloc (n=n@entry=1, elem_size=elem_size@entry=8192) at malloc.c:3445
2  0x00007fd353792bd7 in __GI___open_memstream (bufloc=bufloc@entry=0x7ffc4edd2ea0, sizeloc=sizeloc@entry=0x7ffc4edd2ea8) at memstream.c:83
3  0x00007fd35382cba4 in __GI___vsyslog_chk (pri=163, flag=1, fmt=0x5560190522da "%s", ap=0x7ffc4edd2f90) at ../misc/syslog.c:167
4  0x00007fd35382d1e3 in __syslog_chk (pri=pri@entry=3, flag=flag@entry=1, fmt=fmt@entry=0x5560190522da "%s") at ../misc/syslog.c:129
5  0x000055601904e114 in syslog (__fmt=0x5560190522da "%s", __pri=3) at /usr/include/bits/syslog.h:31
6  log_level (name_in=<optimized out>, level_in=<optimized out>, fmt=0x55601905243e "abandoned lockspace %s") at logging.c:166
7  0x000055601903a91e in loop () at main.c:1597
8  main (argc=<optimized out>, argv=<optimized out>) at main.c:2161

We see that the last thing in dlm_controld was log_level() then it
crashed internal handling of libc and syslog().

(gdb) f 6
6  log_level (name_in=<optimized out>, level_in=<optimized out>, fmt=0x55601905243e "abandoned lockspace %s") at logging.c:166
166                     syslog(level, "%s", log_str);

We see that log_level() was called with a format string of "abandoned
lockspace %s" and we only do that after leaving the main loop,
dlm_controld was going to shutdown and crashed.

The reason is that at this time the syslog logging was already closed by
closelog() and we still tried to call syslog() and libc doesn't like it.
We should be sure closing the log functionality is the last thing to do
when exiting dlm_controld. This patch is doing that so that dlm_controld
should not crash anymore.

Reported-by: Barry Marson <bmarson@redhat.com>
Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 dlm_controld/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/dlm_controld/main.c b/dlm_controld/main.c
index 80fe14bd..7cf6348e 100644
--- a/dlm_controld/main.c
+++ b/dlm_controld/main.c
@@ -1604,12 +1604,14 @@ static int loop(void)
 	close_plocks();
 	close_cpg_daemon();
 	clear_configfs();
-	close_logging();
 	close_cluster();
 	close_cluster_cfg();
 
 	list_for_each_entry(ls, &lockspaces, list)
 		log_error("abandoned lockspace %s", ls->name);
+
+	/* must be end */
+	close_logging();
 	return rv;
 }
 
-- 
2.31.1

