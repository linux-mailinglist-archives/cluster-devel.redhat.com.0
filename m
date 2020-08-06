Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D45BE23DAD1
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:38:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721106;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AcV7/4b+pkegu/xwMJiKyuiGhVZeieXo11qUxQQK5FE=;
	b=VYchg311laWCRjbmzOwEtWTigxONEqYi50zzNCj1IyUnhpLIqrPANO6AldjvcC+IWAZTtP
	9ZMgyeA3iaDKfHp6mVHpOf6rwGDTfAhQP4Hy6+yYwQzums0V3v0tYm4gMz62KlK4cajdT2
	cQasL+SljHiG2ab7QMljJ7+3IOuoVBA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-i4GbsPMGOESHSOcbPFgs1w-1; Thu, 06 Aug 2020 09:38:25 -0400
X-MC-Unique: i4GbsPMGOESHSOcbPFgs1w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DE188015FB;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E8E35DA7A;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B92096938;
	Thu,  6 Aug 2020 13:38:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076DcKdQ030688 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:38:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61B3560BF1; Thu,  6 Aug 2020 13:38:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 81BC66111F
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:19 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:37:41 +0100
Message-Id: <20200806133807.111280-7-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 06/32] libgfs2: Remove gfs2_buffer_head from
	gfs_dinode_in()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/hexedit.h |  1 -
 gfs2/libgfs2/gfs1.c | 11 ++++-------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/gfs2/edit/hexedit.h b/gfs2/edit/hexedit.h
index d2992d8e..ab2d44d6 100644
--- a/gfs2/edit/hexedit.h
+++ b/gfs2/edit/hexedit.h
@@ -227,7 +227,6 @@ extern void gfs_jindex_in(struct gfs_jindex *jindex, char *buf);
 extern void gfs_log_header_in(struct gfs_log_header *head,
 			      struct gfs2_buffer_head *bh);
 extern void gfs_log_header_print(struct gfs_log_header *lh);
-extern void gfs_dinode_in(struct gfs_dinode *di, struct gfs2_buffer_head *bh);
 extern void savemeta(char *out_fn, int saveoption, int gziplevel);
 extern void restoremeta(const char *in_fn, const char *out_device,
 			uint64_t printblocksonly);
diff --git a/gfs2/libgfs2/gfs1.c b/gfs2/libgfs2/gfs1.c
index 16c183b5..7da23168 100644
--- a/gfs2/libgfs2/gfs1.c
+++ b/gfs2/libgfs2/gfs1.c
@@ -248,14 +248,11 @@ int gfs1_writei(struct gfs2_inode *ip, char *buf, uint64_t offset,
 	return copied;
 }
 
-/* ------------------------------------------------------------------------ */
-/* gfs_dinode_in */
-/* ------------------------------------------------------------------------ */
-static void gfs_dinode_in(struct gfs_dinode *di, struct gfs2_buffer_head *bh)
+static void gfs_dinode_in(struct gfs_dinode *di, char *buf)
 {
-	struct gfs_dinode *str = (struct gfs_dinode *)bh->b_data;
+	struct gfs_dinode *str = (struct gfs_dinode *)buf;
 
-	gfs2_meta_header_in(&di->di_header, bh->b_data);
+	gfs2_meta_header_in(&di->di_header, buf);
 	gfs2_inum_in(&di->di_num, (char *)&str->di_num);
 
 	di->di_mode = be32_to_cpu(str->di_mode);
@@ -297,7 +294,7 @@ static struct gfs2_inode *__gfs_inode_get(struct gfs2_sbd *sdp,
 		bh = bread(sdp, di_addr);
 		ip->bh_owned = 1;
 	}
-	gfs_dinode_in(&gfs1_dinode, bh);
+	gfs_dinode_in(&gfs1_dinode, bh->b_data);
 	memcpy(&ip->i_di.di_header, &gfs1_dinode.di_header,
 	       sizeof(struct gfs2_meta_header));
 	memcpy(&ip->i_di.di_num, &gfs1_dinode.di_num,
-- 
2.26.2

