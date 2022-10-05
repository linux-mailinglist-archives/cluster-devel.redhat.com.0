Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 685275F5A90
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Oct 2022 21:23:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664997798;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NJkorq+n4opCP7rAPYXmw7eakRH7RqLw5IG8hYV03Do=;
	b=UaApDr5VyZ7IWXuTU9enxyIpJoPzdIAvBk1TSaR5tmjcWHBkgCEr8kYpdcPGrr5ODooYHy
	Hsxya1U0QvCv7Ngmce8XU+c6FoxfggT7UZnfA9L+/lrdhOQDcch3INStDWHfbtV91lkdQ+
	JtBkpTIJKlfJm8nB9N3pzQnbP6owORc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-iXrRSS1COR6WpF69E6voow-1; Wed, 05 Oct 2022 15:23:16 -0400
X-MC-Unique: iXrRSS1COR6WpF69E6voow-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78F348630D1;
	Wed,  5 Oct 2022 19:23:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6DA21492B05;
	Wed,  5 Oct 2022 19:23:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3A88F1946A6B;
	Wed,  5 Oct 2022 19:23:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 705341946A4E for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Oct 2022 19:23:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 51E3D2166B2E; Wed,  5 Oct 2022 19:23:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24A322166B26;
 Wed,  5 Oct 2022 19:23:14 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed,  5 Oct 2022 15:23:11 -0400
Message-Id: <20221005192312.4130838-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCHv2 dlm-tool 1/2] dlm_controld: be sure we
 close logging at last
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
---
v2:
 - remove sob.

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

