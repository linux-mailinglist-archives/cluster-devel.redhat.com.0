Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2504F23DAEE
	for <lists+cluster-devel@lfdr.de>; Thu,  6 Aug 2020 15:39:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1596721148;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3XC0qMwJd5Nwukf0/3p5gBwNw/j943/dViJS55F6Ijs=;
	b=FpQOxEliG1iYMKjgQONTMAKpI2aN5pEG44lZiircgfk6aROOLI6XbEKZjLGn+c+DaURbb2
	CCmsgrz7H1pdg6tXmMiKIjvJHZFKr97gbF/GFkEstnFPJYKS7+tQ7x5IhYxQgCS77YWKwc
	ld51bgBhhxkL97w+MuXwgsfJ5jF/KRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-VK0i9oUhNbqATkCkWOBo5Q-1; Thu, 06 Aug 2020 09:39:06 -0400
X-MC-Unique: VK0i9oUhNbqATkCkWOBo5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8558E101C8AB;
	Thu,  6 Aug 2020 13:39:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75AA37C0EC;
	Thu,  6 Aug 2020 13:39:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62C419693A;
	Thu,  6 Aug 2020 13:39:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 076Dd0Id031064 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 6 Aug 2020 09:39:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A1D61756A4; Thu,  6 Aug 2020 13:39:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.125])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A591160BF1
	for <cluster-devel@redhat.com>; Thu,  6 Aug 2020 13:38:59 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  6 Aug 2020 14:38:06 +0100
Message-Id: <20200806133807.111280-32-anprice@redhat.com>
In-Reply-To: <20200806133807.111280-1-anprice@redhat.com>
References: <20200806133807.111280-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 31/32] savemeta: Move block range queue ops
	into functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Makes things a bit less cluttered and easier to debug.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/edit/savemeta.c | 103 +++++++++++++++++++++++++++++++------------
 1 file changed, 74 insertions(+), 29 deletions(-)

diff --git a/gfs2/edit/savemeta.c b/gfs2/edit/savemeta.c
index fe7a6d78..759113fd 100644
--- a/gfs2/edit/savemeta.c
+++ b/gfs2/edit/savemeta.c
@@ -570,11 +570,76 @@ struct block_range {
 	char *buf;
 };
 
+static int block_range_prepare(struct block_range *br)
+{
+	br->buf = calloc(br->len, sbd.bsize + sizeof(*br->blktype) + sizeof(*br->blklen));
+	if (br->buf == NULL) {
+		perror("Failed to allocate block range buffer");
+		return 1;
+	}
+	br->blktype = (unsigned *)(br->buf + (br->len * sbd.bsize));
+	br->blklen = br->blktype + br->len;
+	return 0;
+}
+
+static int block_range_check(struct block_range *br)
+{
+	if (br->start >= LGFS2_SB_ADDR(&sbd) && br->start + br->len <= sbd.fssize)
+		return 0;
+
+	fprintf(stderr, "Warning: bad range 0x%"PRIx64" (%u blocks) ignored.\n",
+		br->start, br->len);
+	free(br->buf);
+	br->buf = NULL;
+	return 1;
+}
+
+static void block_range_setinfo(struct block_range *br, uint64_t owner)
+{
+	for (unsigned i = 0; i < br->len; i++) {
+		char *buf = br->buf + (i * sbd.bsize);
+		uint64_t addr = br->start + i;
+		uint64_t _owner = (owner == 0) ? addr : owner;
+
+		if (get_gfs_struct_info(buf, _owner, br->blktype + i, br->blklen + i) &&
+		    !block_is_systemfile(_owner)) {
+			br->blklen[i] = 0;
+		}
+	}
+}
+
+static void block_range_free(struct block_range **brp)
+{
+	free((*brp)->buf);
+	free(*brp);
+	*brp = NULL;
+}
+
 struct block_range_queue {
 	struct block_range *tail;
 	struct block_range **head;
 };
 
+static void block_range_queue_init(struct block_range_queue *q)
+{
+	q->head = &q->tail;
+}
+
+static void block_range_queue_insert(struct block_range_queue *q, struct block_range *br)
+{
+	*q->head = br;
+	q->head = &br->next;
+}
+
+static struct block_range *block_range_queue_pop(struct block_range_queue *q)
+{
+	struct block_range *br = q->tail;
+
+	q->tail = br->next;
+	br->next = NULL;
+	return br;
+}
+
 static int save_range(struct metafd *mfd, struct block_range *br)
 {
 	for (unsigned i = 0; i < br->len; i++) {
@@ -591,20 +656,12 @@ static int check_read_range(int fd, struct block_range *br, uint64_t owner)
 {
 	size_t size;
 
-	br->buf = calloc(br->len, sbd.bsize + sizeof(*br->blktype) + sizeof(*br->blklen));
-	if (br->buf == NULL) {
-		perror("Failed to read range");
+	if (block_range_prepare(br) != 0)
 		return 1;
-	}
-	br->blktype = (unsigned *)(br->buf + (br->len * sbd.bsize));
-	br->blklen = br->blktype + br->len;
-	if (br->start < LGFS2_SB_ADDR(&sbd) || br->start + br->len > sbd.fssize) {
-		fprintf(stderr, "Warning: bad range 0x%"PRIx64" (%u blocks) ignored.\n",
-		        br->start, br->len);
-		free(br->buf);
-		br->buf = NULL;
+
+	if (block_range_check(br) != 0)
 		return 1;
-	}
+
 	size = br->len * sbd.bsize;
 	if (pread(sbd.device_fd, br->buf, size, sbd.bsize * br->start) != size) {
 		fprintf(stderr, "Failed to read block range 0x%"PRIx64" (%u blocks): %s\n",
@@ -613,16 +670,7 @@ static int check_read_range(int fd, struct block_range *br, uint64_t owner)
 		br->buf = NULL;
 		return 1;
 	}
-	for (unsigned i = 0; i < br->len; i++) {
-		char *buf = br->buf + (i * sbd.bsize);
-		uint64_t addr = br->start + i;
-		uint64_t _owner = (owner == 0) ? addr : owner;
-
-		if (get_gfs_struct_info(buf, _owner, br->blktype + i, br->blklen + i) &&
-		    !block_is_systemfile(_owner)) {
-			br->blklen[i] = 0;
-		}
-	}
+	block_range_setinfo(br, owner);
 	return 0;
 }
 
@@ -690,8 +738,7 @@ static void save_indirect_range(struct metafd *mfd, struct block_range **brp, ui
 			save_ea_block(mfd, br->buf + (i * sbd.bsize), owner);
 	}
 	if (q) {
-		*q->head = br;
-		q->head = &br->next;
+		block_range_queue_insert(q, br);
 		*brp = NULL; /* The list now has ownership of it */
 	} else {
 		free(br->buf);
@@ -813,7 +860,7 @@ static void save_inode_data(struct metafd *mfd, char *ibuf, uint64_t iblk)
 	int is_exhash;
 
 	for (unsigned i = 0; i < GFS2_MAX_META_HEIGHT; i++)
-		indq[i].head = &indq[i].tail;
+		block_range_queue_init(&indq[i]);
 
 	gfs2_dinode_in(&_di, ibuf);
 	height = _di.di_height;
@@ -841,7 +888,7 @@ static void save_inode_data(struct metafd *mfd, char *ibuf, uint64_t iblk)
 			nextq = NULL;
 
 		while (indq[i - 1].tail != NULL) {
-			struct block_range *q = indq[i - 1].tail;
+			struct block_range *q = block_range_queue_pop(&indq[i - 1]);
 
 			for (unsigned j = 0; j < q->len; j++) {
 				char *_buf = q->buf + (j * sbd.bsize);
@@ -849,9 +896,7 @@ static void save_inode_data(struct metafd *mfd, char *ibuf, uint64_t iblk)
 				save_indirect_blocks(mfd, _buf, iblk, nextq, sizeof(_di.di_header));
 			}
 			warm_fuzzy_stuff(q->start + q->len, 0);
-			indq[i - 1].tail = q->next;
-			free(q->buf);
-			free(q);
+			block_range_free(&q);
 		}
 	}
 	if (is_exhash)
-- 
2.26.2

