Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8EADC1CDD6F
	for <lists+cluster-devel@lfdr.de>; Mon, 11 May 2020 16:41:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589208106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aawOu8jOAjYoCp2uq9PmsltXblMggZofhuRWej28H2A=;
	b=NJBPwzeTqBCPq+ynS/RLUZjA08vkCt4GZSFz2SkBblXK7EmjP/2qJOH6OFE7OxaxMeiVo3
	i+yEEZX8dN4fhKFxCT8Z9uH5kQMZ9BprRqlrbDdckzN7oFPCxTnZRo2CidgrizfX97qF39
	HpOkzwxTwf8CiQNhwv/VMNJLnCRAnoc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-Bs-V3DatMOS78HaYWFHjlg-1; Mon, 11 May 2020 10:41:43 -0400
X-MC-Unique: Bs-V3DatMOS78HaYWFHjlg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4456A8018A6;
	Mon, 11 May 2020 14:41:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3523075274;
	Mon, 11 May 2020 14:41:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BEAF1809547;
	Mon, 11 May 2020 14:41:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BEfe5G005612 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 10:41:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 224FE60CD1; Mon, 11 May 2020 14:41:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.212])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37C1D60BF4
	for <cluster-devel@redhat.com>; Mon, 11 May 2020 14:41:39 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 11 May 2020 15:41:24 +0100
Message-Id: <20200511144125.350891-5-anprice@redhat.com>
In-Reply-To: <20200511144125.350891-1-anprice@redhat.com>
References: <20200511144125.350891-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 4/5] savemeta: Check file format version
	properly
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Don't continue if we don't recognise the metadata file format version.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index f8f3312c..7dc506a2 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -962,9 +962,12 @@ static int parse_header(char *buf, struct savemeta_header *smh)
 {
 	struct savemeta_header *smh_be = (void *)buf;
 
-	if (be32_to_cpu(smh_be->sh_magic) != SAVEMETA_MAGIC ||
-	    be32_to_cpu(smh_be->sh_format) > SAVEMETA_FORMAT) {
+	if (be32_to_cpu(smh_be->sh_magic) != SAVEMETA_MAGIC) {
 		printf("No valid file header found. Falling back to old format...\n");
+		return 1;
+	}
+	if (be32_to_cpu(smh_be->sh_format) > SAVEMETA_FORMAT) {
+		printf("This version of gfs2_edit is too old to restore this metadata format.\n");
 		return -1;
 	}
 	smh->sh_magic = be32_to_cpu(smh_be->sh_magic);
@@ -1226,9 +1229,12 @@ static int restore_init(const char *path, struct metafd *mfd, struct savemeta_he
 		return -1;
 	}
 	bp = restore_buf;
-	if (parse_header(bp, smh) == 0) {
+	ret = parse_header(bp, smh);
+	if (ret == 0) {
 		bp = restore_buf + sizeof(*smh);
 		restore_off = sizeof(*smh);
+	} else if (ret == -1) {
+		return -1;
 	}
 	/* Scan for the position of the superblock. Required to support old formats(?). */
 	end = &restore_buf[256 + sizeof(struct saved_metablock) + sizeof(*sbmh)];
-- 
2.26.2

