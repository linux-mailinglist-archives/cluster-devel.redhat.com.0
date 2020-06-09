Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 76DCB1F3E1D
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jun 2020 16:29:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591712965;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gh1et1yx9RGVZtgoQEO1MAqCm4vb6gDUylexNoqX8YE=;
	b=A1phioG+UepEFsgxDCVOjoFPv4egezmriIZL0UewF08JqoL20pqibOian5zuyaKIXa1n2r
	hoMxDYUveL8aSjQy9DHT8N0SGiEUNZJB7miBSQf0eKVo5Y/bty8nhaBDEYMVQ7yg2wPGja
	696fOS9k+uJpfBQkD5dIK5lM0CSbLmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-CiRVlufmOd2gSgzkqVHXTQ-1; Tue, 09 Jun 2020 10:29:22 -0400
X-MC-Unique: CiRVlufmOd2gSgzkqVHXTQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 259CC8735C1;
	Tue,  9 Jun 2020 14:29:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA4CB8FF60;
	Tue,  9 Jun 2020 14:29:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E9CD9180954D;
	Tue,  9 Jun 2020 14:29:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059ETEhj010266 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 10:29:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DDE86100238D; Tue,  9 Jun 2020 14:29:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.4])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEDE110013C1
	for <cluster-devel@redhat.com>; Tue,  9 Jun 2020 14:29:10 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue,  9 Jun 2020 15:29:07 +0100
Message-Id: <20200609142907.707114-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2_jadd: Fix static analysis warnings
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Fix these warnings:

  gfs2/mkfs/main_jadd.c:264:8: warning: Although the value stored to
  'error' is used in the enclosing expression, the value is never actually
  read from 'error'
  gfs2/mkfs/main_jadd.c:514:15: warning: Assigned value is garbage or
  undefined

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/mkfs/main_jadd.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/gfs2/mkfs/main_jadd.c b/gfs2/mkfs/main_jadd.c
index ea89c96b..03134a61 100644
--- a/gfs2/mkfs/main_jadd.c
+++ b/gfs2/mkfs/main_jadd.c
@@ -241,7 +241,7 @@ static void print_results(struct jadd_opts *opts)
 static int create_new_inode(struct jadd_opts *opts, uint64_t *addr)
 {
 	char *name = opts->new_inode;
-	int fd, error = 0;
+	int fd;
 
 	for (;;) {
 		fd = open(name, O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW | O_CLOEXEC, 0600);
@@ -261,9 +261,10 @@ static int create_new_inode(struct jadd_opts *opts, uint64_t *addr)
 	if (addr != NULL) {
 		struct stat st;
 
-		if ((error = fstat(fd, &st))) {
+		if (fstat(fd, &st) == -1) {
 			perror("fstat");
-			return close(fd);
+			close(fd);
+			return -1;
 		}
 		*addr = st.st_ino;
 	}
@@ -481,7 +482,7 @@ static int add_j(struct gfs2_sbd *sdp, struct jadd_opts *opts)
 	unsigned int x, blocks =
 		sdp->jsize << (20 - sdp->sd_sb.sb_bsize_shift);
 	struct gfs2_log_header lh;
-	uint64_t seq = RANDOM(blocks), addr;
+	uint64_t seq = RANDOM(blocks), addr = 0;
 	off_t off = 0;
 
 	if ((fd = create_new_inode(opts, &addr)) < 0)
-- 
2.26.2

