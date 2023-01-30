Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 408AA6814DF
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 16:22:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675092119;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wn7ylRiZ2HhoyMHF+SDJLdCMgSkbIn8e/XafCZMhnlM=;
	b=CuxjBH6ZIECKUmXqvWuVbhoaJkNrvYtp0OGmZpM0EfSIEHsQ/XAyxmqpEu/cRIN9fmymJM
	3R9J2bOv6CkD3p/tCDR4VmTnHh/seg+hUIXAu7ri6A8MO34hUlLEZIOcQ7/zengjbZqBn1
	UzmarUXBgHHvnwJ9eSo8FctXLk1TVgU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-XoPDjkyzPNC5LRI_Rpg-pA-1; Mon, 30 Jan 2023 10:21:56 -0500
X-MC-Unique: XoPDjkyzPNC5LRI_Rpg-pA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14F7980D0F1;
	Mon, 30 Jan 2023 15:21:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09BA3140EBF6;
	Mon, 30 Jan 2023 15:21:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E7CF31946594;
	Mon, 30 Jan 2023 15:21:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id CAF581946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 15:21:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AC86B40C2005; Mon, 30 Jan 2023 15:21:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.37.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E5ED40C2064
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 15:21:49 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 30 Jan 2023 15:21:44 +0000
Message-Id: <20230130152146.633484-5-anprice@redhat.com>
In-Reply-To: <20230130152146.633484-1-anprice@redhat.com>
References: <20230130152146.633484-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH 4/6] fsck.gfs2: Remove de variable from
 dirref_find()
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

It always points to 'dentry' so it can be replaced in all uses.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/pass2.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 0c2e0146..002bf2cb 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -621,18 +621,17 @@ static int dirref_find(struct fsck_cx *cx, struct lgfs2_inode *ip, struct gfs2_d
 	/* the metawalk_fxn's private field must be set to the dentry
 	 * block we want to clear */
 	struct lgfs2_inum *entry = private;
-	struct lgfs2_dirent dentry, *de;
+	struct lgfs2_dirent dentry;
 	char fn[MAX_FILENAME];
 
 	memset(&dentry, 0, sizeof(dentry));
 	lgfs2_dirent_in(&dentry, dent);
-	de = &dentry;
 
-	if (de->dr_inum.in_addr != entry->in_addr) {
+	if (dentry.dr_inum.in_addr != entry->in_addr) {
 		(*count)++;
 		return 0;
 	}
-	if (de->dr_inum.in_formal_ino == be64_to_cpu(dent->de_inum.no_formal_ino)) {
+	if (dentry.dr_inum.in_formal_ino == be64_to_cpu(dent->de_inum.no_formal_ino)) {
 		log_debug("Formal inode number matches; must be a hard "
 			  "link.\n");
 		goto out;
@@ -641,13 +640,13 @@ static int dirref_find(struct fsck_cx *cx, struct lgfs2_inode *ip, struct gfs2_d
 		  "directory %"PRIu64" (0x%"PRIx64") has the wrong 'formal' inode "
 		  "number.\n"), entry->in_addr, entry->in_addr, ip->i_num.in_addr, ip->i_num.in_addr);
 	memset(fn, 0, sizeof(fn));
-	if (de->dr_name_len < MAX_FILENAME)
-		strncpy(fn, filename, de->dr_name_len);
+	if (dentry.dr_name_len < MAX_FILENAME)
+		strncpy(fn, filename, dentry.dr_name_len);
 	else
 		strncpy(fn, filename, MAX_FILENAME - 1);
 	log_err(_("The bad reference '%s' had formal inode number: %"PRIu64
 		  " (0x%"PRIx64") but the correct value is: %"PRIu64" (0x%"PRIx64")\n"),
-	        fn, de->dr_inum.in_formal_ino, de->dr_inum.in_formal_ino,
+	        fn, dentry.dr_inum.in_formal_ino, dentry.dr_inum.in_formal_ino,
 	        entry->in_formal_ino, entry->in_formal_ino);
 	if (!query(cx, _("Delete the bad directory entry? (y/n) "))) {
 		log_err(_("The corrupt directory entry was not fixed.\n"));
-- 
2.39.0

