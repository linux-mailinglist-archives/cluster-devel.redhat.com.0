Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3FFA123DAEC
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:39:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721145;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mWKFftzMwT3NzJ/vHsTBEdlT6j/7fpQkERTMlWsgyXs=;
	b=Htz3GzH5TC88vkVqhdtTbNFqE8cvoGGOpFhGvCvbiXrHP8LRSfAbBunkA1Ze22kCqgXgCk
	F9EBkoY73rM9FUz9NS3YtNbTkT1Xbd6gHMBiD+nDtPEK14a91/wuA3EYO+Ubpl9iAESb3K
	Gd4PV0zxprZ/mgOybDA/3eiz8xedS7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-J10h3OGWOtq-eT9P_AlweQ-1; Thu, 06 Aug 2020 09:39:03 -0400
X-MC-Unique: J10h3OGWOtq-eT9P_AlweQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E02C101C8A7;
	Thu,  6 Aug 2020 13:39:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC711002393;
	Thu,  6 Aug 2020 13:39:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 094961809557;
	Thu,  6 Aug 2020 13:39:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcxdP031036 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2AB9E60BF1; Thu,  6 Aug 2020 13:38:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75F2B70110
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:58 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:38:05 +0100
Message-Id: <20200806133807.111280-31-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 30/32] savemeta: Remove some unnecessary
	jindex reading code
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This section reads the jindex and walks its tree but the data it gathers
is not used subsequently. The jindex and journals will be picked up by
the bitmap walk later.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index 272f796c..fe7a6d78 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -1073,8 +1073,6 @@ static int parse_header(char *buf, struct savemeta_header *smh)
 
 void savemeta(char *out_fn, int saveoption, int gziplevel)
 {
-	uint64_t jindex_block;
-	struct gfs2_buffer_head *lbh;
 	struct metafd mfd;
 	struct osi_node *n;
 	uint64_t sb_addr;
@@ -1090,15 +1088,6 @@ void savemeta(char *out_fn, int saveoption, int gziplevel)
 		sbd.bsize = sbd.sd_sb.sb_bsize;
 	printf("There are %llu blocks of %u bytes in the filesystem.\n",
 	                     (unsigned long long)sbd.fssize, sbd.bsize);
-	if (sbd.gfs1)
-		jindex_block = sbd1->sb_jindex_di.no_addr;
-	else
-		jindex_block = masterblock("jindex");
-	lbh = bread(&sbd, jindex_block);
-	gfs2_dinode_in(&di, lbh->b_data);
-	if (!sbd.gfs1)
-		do_dinode_extended(&di, lbh->b_data);
-	brelse(lbh);
 
 	printf("Filesystem size: %.2fGB\n", (sbd.fssize * sbd.bsize) / ((float)(1 << 30)));
 	get_journal_inode_blocks();
-- 
2.26.2

