Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 95CEF24DE86
	for <lists+cluster-devel@lfdr.de>; Fri, 21 Aug 2020 19:33:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598031237;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ao3Se1FzCKHO7VxOjoww4RgWdD8XqNz7/9gS8mQtcfQ=;
	b=AYxsYD2LutyCUVg7KBRBrce/BRKen5MyP90RLCoG+DmnpbLDEcjUBDO2t4tyFTC02tFJ3m
	UIN0f/LLdOEncYFV91UV2725hmCN9KJf6PJAnuELSv1oc6qb+4dHhnVOQUnStw6+67iBmu
	/YpnCCUf1dQhf/rBizEIoCPhKwWZwd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-RGYHFSK3NBaATCHN9XJtug-1; Fri, 21 Aug 2020 13:33:55 -0400
X-MC-Unique: RGYHFSK3NBaATCHN9XJtug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 293EA807340;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18F3F756DB;
	Fri, 21 Aug 2020 17:33:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8D16181A872;
	Fri, 21 Aug 2020 17:33:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LHXgEt028392 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 13:33:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5EA855DA75; Fri, 21 Aug 2020 17:33:42 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-102.phx2.redhat.com [10.3.112.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BF8F5DA74
	for <cluster-devel@redhat.com>; Fri, 21 Aug 2020 17:33:42 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 21 Aug 2020 12:33:28 -0500
Message-Id: <20200821173337.20377-4-rpeterso@redhat.com>
In-Reply-To: <20200821173337.20377-1-rpeterso@redhat.com>
References: <20200821173337.20377-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 03/12] gfs2: enhance log_blocks trace
	point to show log blocks free
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
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch adds some code to enhance the log_blocks trace point. It
reports the number of free log blocks. This makes the trace point much
more useful, especially for debugging performance problems when we can
tell when the journal gets full and needs to wait for flushes, etc.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/trace_gfs2.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/trace_gfs2.h b/fs/gfs2/trace_gfs2.h
index e0025258107a..fe140ceef74d 100644
--- a/fs/gfs2/trace_gfs2.h
+++ b/fs/gfs2/trace_gfs2.h
@@ -388,15 +388,17 @@ TRACE_EVENT(gfs2_log_blocks,
 	TP_STRUCT__entry(
 		__field(        dev_t,  dev                     )
 		__field(	int,	blocks			)
+		__field(	int,	blks_free		)
 	),
 
 	TP_fast_assign(
 		__entry->dev		= sdp->sd_vfs->s_dev;
 		__entry->blocks		= blocks;
+		__entry->blks_free	= atomic_read(&sdp->sd_log_blks_free);
 	),
 
-	TP_printk("%u,%u log reserve %d", MAJOR(__entry->dev),
-		  MINOR(__entry->dev), __entry->blocks)
+	TP_printk("%u,%u log reserve %d %d", MAJOR(__entry->dev),
+		  MINOR(__entry->dev), __entry->blocks, __entry->blks_free)
 );
 
 /* Writing back the AIL */
-- 
2.26.2

