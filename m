Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A912B6814E2
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Jan 2023 16:22:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675092120;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lcelQJwY6AaCOux4Ti+gh+ukTzCcZxQagTL1+jVXc6I=;
	b=T2eYjjXt6Melx2g3yFCAzuLwCtJuVw1jEcmyzcUDQpEuB7VYEMFmeuE//L4VF1Ht7xDrX5
	g2c8yuyK/HoSbcaz67d8oX54H4BNdS07/LtL97vUTvYejidB0aqKrJ87j/kAbKc34nkyns
	F6DLfnd30l6qx00PKGr+PoRtgZX8Xek=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-IsnhQ7jAMJG-ITnpDWD1uA-1; Mon, 30 Jan 2023 10:21:53 -0500
X-MC-Unique: IsnhQ7jAMJG-ITnpDWD1uA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB8103C31DF2;
	Mon, 30 Jan 2023 15:21:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D16C740C2004;
	Mon, 30 Jan 2023 15:21:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A688E1946594;
	Mon, 30 Jan 2023 15:21:52 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 83BE51946587 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 30 Jan 2023 15:21:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 670B640C2005; Mon, 30 Jan 2023 15:21:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from b.redhat.com (unknown [10.33.37.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE0A140C2064
 for <cluster-devel@redhat.com>; Mon, 30 Jan 2023 15:21:50 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Mon, 30 Jan 2023 15:21:45 +0000
Message-Id: <20230130152146.633484-6-anprice@redhat.com>
In-Reply-To: <20230130152146.633484-1-anprice@redhat.com>
References: <20230130152146.633484-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [Cluster-devel] [PATCH 5/6] fsck.gfs2: Fix wrong entry used in
 dentry comparison
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

'dent' points to the on-disk data that 'dentry' was converted from, so
this comparison always evaluates to true. Compare to 'entry' instead.

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 gfs2/fsck/pass2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/gfs2/fsck/pass2.c b/gfs2/fsck/pass2.c
index 002bf2cb..5327ee43 100644
--- a/gfs2/fsck/pass2.c
+++ b/gfs2/fsck/pass2.c
@@ -631,7 +631,7 @@ static int dirref_find(struct fsck_cx *cx, struct lgfs2_inode *ip, struct gfs2_d
 		(*count)++;
 		return 0;
 	}
-	if (dentry.dr_inum.in_formal_ino == be64_to_cpu(dent->de_inum.no_formal_ino)) {
+	if (dentry.dr_inum.in_formal_ino == entry->in_formal_ino) {
 		log_debug("Formal inode number matches; must be a hard "
 			  "link.\n");
 		goto out;
-- 
2.39.0

