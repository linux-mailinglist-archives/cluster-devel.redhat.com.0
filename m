Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 20D2723DACF
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XesZisnTU9nduN9s6ItfqhsvpFRu3Ze0cLI6N7JwfPM=;
	b=IrcSKdPDgF5oGo2cLbsWlSG79cpaaF6yALTkwXDWfcQvd/G1IVZdzk5Ie0/RxPCewhZbbM
	2HHydJdCnyxuogenqcw69aoIWV1Bwzo+JX0lG0OYDq4cMVXSXvE4ZY2/+EV9SRdqMRD2yl
	H4qGqgEZe4uWE4kZrXLhliALI6oqr7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-6_TbGI9NMNOx5pDqrBtWGQ-1; Thu, 06 Aug 2020 09:38:24 -0400
X-MC-Unique: 6_TbGI9NMNOx5pDqrBtWGQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1180F1923761;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00C2E10021B3;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D7BFB96925;
	Thu,  6 Aug 2020 13:38:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcFwM030634 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1238C60C47; Thu,  6 Aug 2020 13:38:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63D3360BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:14 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:37 +0100
Message-Id: <20200806133807.111280-3-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 02/32] mkfs.gfs2: Fix strncpy warnings
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

New in gcc 10

  warning: ‘__builtin_strncpy’ specified bound 64 equals destination size
  [-Wstringop-truncation]

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/mkfs/main_mkfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/gfs2/mkfs/main_mkfs.c b/gfs2/mkfs/main_mkfs.c
index bb8762b0..36fd08e7 100644
--- a/gfs2/mkfs/main_mkfs.c
+++ b/gfs2/mkfs/main_mkfs.c
@@ -1144,8 +1144,8 @@ int main(int argc, char *argv[])
 	build_root(&sbd);
 	sb.sb_root_dir = sbd.md.rooti->i_di.di_num;
 
-	strncpy(sb.sb_lockproto, opts.lockproto, GFS2_LOCKNAME_LEN);
-	strncpy(sb.sb_locktable, opts.locktable, GFS2_LOCKNAME_LEN);
+	strncpy(sb.sb_lockproto, opts.lockproto, GFS2_LOCKNAME_LEN - 1);
+	strncpy(sb.sb_locktable, opts.locktable, GFS2_LOCKNAME_LEN - 1);
 	sb.sb_lockproto[GFS2_LOCKNAME_LEN - 1] = '\0';
 	sb.sb_locktable[GFS2_LOCKNAME_LEN - 1] = '\0';
 
-- 
2.26.2

