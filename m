Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A096814E3
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 16:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675092122;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ewFlJx7C1ctk1NiCRL9fgAlTN7wZJBbZxeb2kL0mj6o=;
	b=fFGiRFj7+I+KN1bTuuiRVN26pv7/h4M4ckh6TgGUQvtic/+HA+5XhaSO07lnKUBI/BUOOs
	TG1adp05k7zh1AdxJAXCGNLxt/1Fsk5vgK/Wn2ayQehxBrdgZrNqQKzfEh0sKoZuhbRWDi
	44LvprT6E8ihmMPFho2Zs5JDSVvlRTo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-ieff4Jw8NoSCvhqFoRjEtQ-1; Mon, 30 Jan 2023 10:21:55 -0500
X-MC-Unique: ieff4Jw8NoSCvhqFoRjEtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FAAC101A52E;
	Mon, 30 Jan 2023 15:21:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24E0D43FB3;
	Mon, 30 Jan 2023 15:21:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 00F7519465A3;
	Mon, 30 Jan 2023 15:21:54 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 496E41946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 15:21:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1F74740C2004; Mon, 30 Jan 2023 15:21:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.37.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9967740C2064
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 15:21:51 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 30 Jan 2023 15:21:46 +0000
Message-Id: <20230130152146.633484-7-anprice@redhat.com>
In-Reply-To: <20230130152146.633484-1-anprice@redhat.com>
References: <20230130152146.633484-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH 6/6] fsck.gfs2: fix_hashtable: Decrement
 i_blocks when freeing leaf blocks
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

fsck.gfs2 can leave i_blocks too large when it removes empty leaf
blocks, so decrease the count when freeing them.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/pass2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 5327ee43..71459978 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -1334,6 +1334,7 @@ static int fix_hashtable(struct fsck_cx *cx, struct lgfs2_inode *ip, __be64 *tbl
 	    (dentry.dr_inum.in_formal_ino == 0)) {
 		lgfs2_brelse(lbh);
 		lgfs2_free_block(ip->i_sbd, leafblk);
+		ip->i_blocks--;
 		log_err(_("Out of place leaf block %"PRIu64" (0x%"PRIx64") had no "
 			"entries, so it was deleted.\n"),
 		        leafblk, leafblk);
-- 
2.39.0

