Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA6B6EC63D
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 08:23:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682317390;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bS05QMoD6j6YpGz1rHCHZCzEMuRJxwEBMPELLNqMvVM=;
	b=eymfYqn9GNp8sAgFtyW10FIzJ1OPmx2G4Q1rRfjElvyeXsDXzdrNB36lkVHWNqiYFVrrDD
	NO0hOBW2vfp6VxFo8cTjm1XQp7tSLlVxOUuSnFFKy79MOXcYQuZozNCIPayeJ/pAH/neXJ
	Wq9PEFNIa5wwJ6q2xK/hIAKcXebWD5I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-fKM5yafdN2OEx08RmJX6TQ-1; Mon, 24 Apr 2023 02:23:06 -0400
X-MC-Unique: fKM5yafdN2OEx08RmJX6TQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF05929ABA11;
	Mon, 24 Apr 2023 06:23:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4DD12166B26;
	Mon, 24 Apr 2023 06:23:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7D8D61946589;
	Mon, 24 Apr 2023 06:23:05 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AC8CA194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 06:23:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9F4B314272BD; Mon, 24 Apr 2023 06:23:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 97F8A14272BC
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:23:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AF783C0218D
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:23:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-HyMwKc-1MkK5X1gtFxupEw-1; Mon, 24 Apr 2023 02:23:00 -0400
X-MC-Unique: HyMwKc-1MkK5X1gtFxupEw-1
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp54-00FOuy-17; Mon, 24 Apr 2023 05:49:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:13 +0200
Message-Id: <20230424054926.26927-5-hch@lst.de>
In-Reply-To: <20230424054926.26927-1-hch@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH 04/17] fs: remove emergency_thaw_bdev
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Fold emergency_thaw_bdev into it's only caller, to prepare for buffer.c
to be built only when buffer_head support is enabled.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/buffer.c   | 6 ------
 fs/internal.h | 6 ------
 fs/super.c    | 4 +++-
 3 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index eb14fbaa7d35f7..58e0007892b1c7 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -563,12 +563,6 @@ static int osync_buffers_list(spinlock_t *lock, struct list_head *list)
 	return err;
 }
 
-void emergency_thaw_bdev(struct super_block *sb)
-{
-	while (sb->s_bdev && !thaw_bdev(sb->s_bdev))
-		printk(KERN_WARNING "Emergency Thaw on %pg\n", sb->s_bdev);
-}
-
 /**
  * sync_mapping_buffers - write out & wait upon a mapping's "associated" buffers
  * @mapping: the mapping which wants those buffers written
diff --git a/fs/internal.h b/fs/internal.h
index dc4eb91a577a80..cad87784eb5e0f 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -23,16 +23,10 @@ struct mnt_idmap;
  */
 #ifdef CONFIG_BLOCK
 extern void __init bdev_cache_init(void);
-
-void emergency_thaw_bdev(struct super_block *sb);
 #else
 static inline void bdev_cache_init(void)
 {
 }
-static inline int emergency_thaw_bdev(struct super_block *sb)
-{
-	return 0;
-}
 #endif /* CONFIG_BLOCK */
 
 /*
diff --git a/fs/super.c b/fs/super.c
index 04bc62ab7dfea9..d8f0a28d1850b1 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -1026,7 +1026,9 @@ static void do_thaw_all_callback(struct super_block *sb)
 {
 	down_write(&sb->s_umount);
 	if (sb->s_root && sb->s_flags & SB_BORN) {
-		emergency_thaw_bdev(sb);
+		if (IS_ENABLED(CONFIG_BLOCK))
+			while (sb->s_bdev && !thaw_bdev(sb->s_bdev))
+				pr_warn("Emergency Thaw on %pg\n", sb->s_bdev);
 		thaw_super_locked(sb);
 	} else {
 		up_write(&sb->s_umount);
-- 
2.39.2

