Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5532F5137
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Jan 2021 18:37:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610559441;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NOu0lJdXgQnQd8Ty1iFl+A3kRkDtPb5cf0qB/gAGHrE=;
	b=ebiwm5xpGVs2LV9/2bxdGDgR8IdRJg+Vzwaz40UceZKDF/o/4Ed5nCEkR6FdPSngToowQZ
	AYJmYsRfCBe3d55O2k0UtC2mh9WmqhVy0dbuGtymvQ/LAEyao/B1GDclC9EZ15XsS8/UtJ
	jf1SM8EgQ4pNGkt/3okyiIUJeDOMvrU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-dd-vvPf7PIKuU4faodHE4w-1; Wed, 13 Jan 2021 12:37:19 -0500
X-MC-Unique: dd-vvPf7PIKuU4faodHE4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42FB48144EE;
	Wed, 13 Jan 2021 17:37:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C13E910429FF;
	Wed, 13 Jan 2021 17:37:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6B2B4A7C6;
	Wed, 13 Jan 2021 17:37:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10DHb4Mw006804 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Jan 2021 12:37:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 168C8722C0; Wed, 13 Jan 2021 17:37:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-174.rdu2.redhat.com [10.10.116.174])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3B5072171;
	Wed, 13 Jan 2021 17:36:57 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 13 Jan 2021 12:36:46 -0500
Message-Id: <20210113173646.43173-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH gfs2-utils] mkfs.gfs2: make are you sure EOF
	happy
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds a check for getline() error, as the manpage states out
that -1 is returned in EOF case we answer such case and possible
other errors with no. If you currently press ctrl-d during this question
an endless loop of asking this question over and over again will occur.
However this patch changes to handle errors with no and prints a newline
so the user have a new clean shell prompt afterwards. If getline reads
zero characters .e.g '\n', the question is if we are sure is asked again.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 gfs2/mkfs/main_mkfs.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index 5e34ca1f..e6fc6532 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -528,9 +528,14 @@ static int are_you_sure(void)
 		   `locale -k noexpr` */
 		printf( _("Are you sure you want to proceed? [y/n] "));
 		ret = getline(&line, &len, stdin);
+		if (ret < 0) {
+			printf("\n");
+			free(line);
+			return 0;
+		}
 		res = rpmatch(line);
 		free(line);
-		if (ret <= 0)
+		if (ret == 0)
 			continue;
 		if (res == 1) /* Yes */
 			return 1;
-- 
2.26.2

