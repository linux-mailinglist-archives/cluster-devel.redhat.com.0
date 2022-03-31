Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2934EECD0
	for <lists+cluster-devel@lfdr.de>; Fri,  1 Apr 2022 14:04:48 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-gdTdudY8P2GmwMVonRoZMA-1; Fri, 01 Apr 2022 08:04:46 -0400
X-MC-Unique: gdTdudY8P2GmwMVonRoZMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE75985A5BC;
	Fri,  1 Apr 2022 12:04:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CDF440CF8F4;
	Fri,  1 Apr 2022 12:04:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D283E1940348;
	Fri,  1 Apr 2022 12:04:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 176A119451F3 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 31 Mar 2022 22:40:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 063F8400E420; Thu, 31 Mar 2022 22:40:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 008BA40C1438
 for <cluster-devel@redhat.com>; Thu, 31 Mar 2022 22:40:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD2773C01D89
 for <cluster-devel@redhat.com>; Thu, 31 Mar 2022 22:40:30 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-70-9zu3QOMiNTixA6LUmVlYuA-1; Thu, 31 Mar 2022 18:40:29 -0400
X-MC-Unique: 9zu3QOMiNTixA6LUmVlYuA-1
Received: by mail-ej1-f45.google.com with SMTP id j15so2190796eje.9;
 Thu, 31 Mar 2022 15:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OAF79ixH7XO8/kHbUATTBHFnSkL/nkVXYK4Bx07Es9M=;
 b=LDHlVUFr4tf5STjuLZFbx9++f1+3Rflqy7Bu10SJMTjcykB2F3nRlUFpj2mhTkXDoI
 BDIvn/e1QRXWdgyukTOy0BFy4uBRo2nLaxXD6ex6QaNerkMra78/gxR40yjn9Yt2CujT
 dfdZt9wXpe8VgfX+ufKHZcK/yPm00OjjEeFM+DURZDLjLtXotNSDAmN5Ed6hElYiAknI
 STkHvvdHm4K0CTx+8DJ0BYFzmuTy/RcYKIbp7eUDPxC6/n4CIjh7JW8OB+QLSd4kzZeF
 LQetiR5AffHHzQueRA0/k096AGDfWiKL6D3v7WP29DgeZc+hy/4+DZwoj24JSi+g5Qjl
 D6dg==
X-Gm-Message-State: AOAM533A1wk89b5h9iPZ/UTLB/YDjlKnrL25wYnIHDA10Ysz1kfuWsc7
 mu+UbGsl/CqJ/HURErxVJL0+9LQYLjkOcLwR
X-Google-Smtp-Source: ABdhPJwRUYP4bzLKrhGs345u5NZhGKemPeZq835ij8gf8hKkMzb4rrnRyuAUb3KfXn8Zw9FS/8Ri+g==
X-Received: by 2002:a17:907:3e16:b0:6df:b4f0:5cc2 with SMTP id
 hp22-20020a1709073e1600b006dfb4f05cc2mr6849525ejc.285.1648766427340; 
 Thu, 31 Mar 2022 15:40:27 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 j21-20020a170906255500b006e08c4862ccsm278505ejb.96.2022.03.31.15.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 15:40:27 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
Date: Fri,  1 Apr 2022 00:38:56 +0200
Message-Id: <20220331223857.902911-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-Mailman-Approved-At: Fri, 01 Apr 2022 12:04:43 +0000
Subject: [Cluster-devel] [PATCH 1/2] gfs2: remove usage of list iterator
 variable for list_for_each_entry_continue()
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
Cc: linux-kernel@vger.kernel.org, "Bos, H.J." <h.j.bos@vu.nl>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>, cluster-devel@redhat.com,
 Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Jakob Koschel <jakobkoschel@gmail.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

In preparation to limiting the scope of a list iterator to the list
traversal loop, use a dedicated pointer to iterate through the list [1].

Since that variable should not be used past the loop iteration, a
separate variable is used to 'remember the current location within the
loop'.

To either continue iterating from that position or start a new
iteration (if the previous iteration was complete) list_prepare_entry()
is used.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 fs/gfs2/lops.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index 6ba51cbb94cf..74e6d05cee2c 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -653,7 +653,7 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 				bool is_databuf)
 {
 	struct gfs2_log_descriptor *ld;
-	struct gfs2_bufdata *bd1 = NULL, *bd2;
+	struct gfs2_bufdata *bd1 = NULL, *bd2, *tmp1, *tmp2;
 	struct page *page;
 	unsigned int num;
 	unsigned n;
@@ -661,7 +661,7 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 
 	gfs2_log_lock(sdp);
 	list_sort(NULL, blist, blocknr_cmp);
-	bd1 = bd2 = list_prepare_entry(bd1, blist, bd_list);
+	tmp1 = tmp2 = list_prepare_entry(bd1, blist, bd_list);
 	while(total) {
 		num = total;
 		if (total > limit)
@@ -675,14 +675,18 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 		ptr = (__be64 *)(ld + 1);
 
 		n = 0;
+		bd1 = list_prepare_entry(tmp1, blist, bd_list);
+		tmp1 = NULL;
 		list_for_each_entry_continue(bd1, blist, bd_list) {
 			*ptr++ = cpu_to_be64(bd1->bd_bh->b_blocknr);
 			if (is_databuf) {
 				gfs2_check_magic(bd1->bd_bh);
 				*ptr++ = cpu_to_be64(buffer_escaped(bd1->bd_bh) ? 1 : 0);
 			}
-			if (++n >= num)
+			if (++n >= num) {
+				tmp1 = bd1;
 				break;
+			}
 		}
 
 		gfs2_log_unlock(sdp);
@@ -690,6 +694,8 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 		gfs2_log_lock(sdp);
 
 		n = 0;
+		bd2 = list_prepare_entry(tmp2, blist, bd_list);
+		tmp2 = NULL;
 		list_for_each_entry_continue(bd2, blist, bd_list) {
 			get_bh(bd2->bd_bh);
 			gfs2_log_unlock(sdp);
@@ -712,8 +718,10 @@ static void gfs2_before_commit(struct gfs2_sbd *sdp, unsigned int limit,
 				gfs2_log_write_bh(sdp, bd2->bd_bh);
 			}
 			gfs2_log_lock(sdp);
-			if (++n >= num)
+			if (++n >= num) {
+				tmp2 = bd2;
 				break;
+			}
 		}
 
 		BUG_ON(total < num);

base-commit: f82da161ea75dc4db21b2499e4b1facd36dab275
-- 
2.25.1

