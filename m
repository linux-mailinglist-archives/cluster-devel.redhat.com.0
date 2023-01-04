Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD17465DE61
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Jan 2023 22:15:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672866945;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wLGgwLr/csaNeBIMYfbH9zx9j3AdiWGm09ROWOa5iAY=;
	b=CNoxAwewIcAuXbsmpv6xIRN86JQ2X58Kj1Q+qUv7aR6wlkGQo0eA6y6nxwRugwe6QLlT+B
	MEIoCidn+21Qc+tsrzPCVeyF0IRR/VdLeA95dEHgvHiKh895iE0z28w6QsYisUC7q4VpLO
	xORNebrxHxjBId4cwIeRYe0mR2EFaeE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-L646B6UvMQeQL0wTStVKBA-1; Wed, 04 Jan 2023 16:15:44 -0500
X-MC-Unique: L646B6UvMQeQL0wTStVKBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEACA857A8E;
	Wed,  4 Jan 2023 21:15:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B38AA2026D4B;
	Wed,  4 Jan 2023 21:15:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7CF211946589;
	Wed,  4 Jan 2023 21:15:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 45C7819465B1 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  4 Jan 2023 21:15:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 70CEB2026D2A; Wed,  4 Jan 2023 21:15:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 692082026D4B
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:15:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EE601C0A596
 for <cluster-devel@redhat.com>; Wed,  4 Jan 2023 21:15:26 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-107-tGWKmTiRNhC2rQZQQyQ6MA-1; Wed, 04 Jan 2023 16:15:24 -0500
X-MC-Unique: tGWKmTiRNhC2rQZQQyQ6MA-1
Received: by mail-pj1-f53.google.com with SMTP id cl14so1068043pjb.2
 for <cluster-devel@redhat.com>; Wed, 04 Jan 2023 13:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wLGgwLr/csaNeBIMYfbH9zx9j3AdiWGm09ROWOa5iAY=;
 b=oqJbD6Kxc+LyL0AyZvUT+0QmaTPhJN1+xkkYfzJsc3xwQzA37nGgGkzkxwrbvbGOJE
 dkgC/iVn/R0tugzLJkGrLIT6DmGbbmlqz29Q4MdONr5kbjgsXHbAl10HRDdwtjZsFLkS
 AnJ99LAzeSVTkj7p45nqFor4phy51Jl5/IPLhpkB0UjyxKjqfKZW1IX8BlYs3riAJ0O/
 oHaFOVlJMJLx4dGb3DQLAHWpKVu77xM9C0wE2JYNGu/oVZH18q4MHMsqIsOLiyfO//J0
 RnTdI3U0e6g+R/3NJNt5pUc93LJdZp0Ti6D68FcWTrKkWyOfxhHgmrAyjOCRVEgHPHgg
 qxPw==
X-Gm-Message-State: AFqh2kpdsJyt6ljkHsYoQzHGH8KsCMa7D35tudauLO0O8NgCGiTmc0GM
 BhwMBdb2tOApqp7yLIeMcuQ=
X-Google-Smtp-Source: AMrXdXs7s+m/7nsrgJ9l/mJQIpEV7Y/DeAKat3L22TbeUL9zUgX6QTynjS3828Iu+F7/uHuvxs7fOw==
X-Received: by 2002:a17:90b:794:b0:219:64ca:49a0 with SMTP id
 l20-20020a17090b079400b0021964ca49a0mr53526904pjz.22.1672866923492; 
 Wed, 04 Jan 2023 13:15:23 -0800 (PST)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:8002:1c20::a55d])
 by smtp.googlemail.com with ESMTPSA id
 i8-20020a17090a138800b00226369149cesm6408pja.21.2023.01.04.13.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 13:15:23 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  4 Jan 2023 13:14:44 -0800
Message-Id: <20230104211448.4804-20-vishal.moola@gmail.com>
In-Reply-To: <20230104211448.4804-1-vishal.moola@gmail.com>
References: <20230104211448.4804-1-vishal.moola@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [Cluster-devel] [PATCH v5 19/23] nilfs2: Convert
 nilfs_lookup_dirty_node_buffers() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Convert function to use folios throughout. This is in preparation for
the removal of find_get_pages_range_tag(). This change removes 1 call to
compound_head().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
 fs/nilfs2/segment.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 8866af742a49..da56a9221277 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -737,20 +737,19 @@ static void nilfs_lookup_dirty_node_buffers(struct inode *inode,
 {
 	struct nilfs_inode_info *ii = NILFS_I(inode);
 	struct inode *btnc_inode = ii->i_assoc_inode;
-	struct pagevec pvec;
+	struct folio_batch fbatch;
 	struct buffer_head *bh, *head;
 	unsigned int i;
 	pgoff_t index = 0;
 
 	if (!btnc_inode)
 		return;
+	folio_batch_init(&fbatch);
 
-	pagevec_init(&pvec);
-
-	while (pagevec_lookup_tag(&pvec, btnc_inode->i_mapping, &index,
-					PAGECACHE_TAG_DIRTY)) {
-		for (i = 0; i < pagevec_count(&pvec); i++) {
-			bh = head = page_buffers(pvec.pages[i]);
+	while (filemap_get_folios_tag(btnc_inode->i_mapping, &index,
+				(pgoff_t)-1, PAGECACHE_TAG_DIRTY, &fbatch)) {
+		for (i = 0; i < folio_batch_count(&fbatch); i++) {
+			bh = head = folio_buffers(fbatch.folios[i]);
 			do {
 				if (buffer_dirty(bh) &&
 						!buffer_async_write(bh)) {
@@ -761,7 +760,7 @@ static void nilfs_lookup_dirty_node_buffers(struct inode *inode,
 				bh = bh->b_this_page;
 			} while (bh != head);
 		}
-		pagevec_release(&pvec);
+		folio_batch_release(&fbatch);
 		cond_resched();
 	}
 }
-- 
2.38.1

