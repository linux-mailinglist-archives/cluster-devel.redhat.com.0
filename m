Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F56D6850
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624310;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HOa0kR4UZ9J5lXSH1eVSD9D5g9oUFaieHHnsOCRS/TM=;
	b=IUGTO6wqsWvr7CJZhRoD1s/BSZK9rQZbaOP783aUNbR357yKt31Rk+XAx62PC5zikrrSFn
	lNicmPmm57mCbrTmNEeNz7vJXfSua526oslh58LB4CWy8JfaUTS4Ab6byq63HbSjydp/j+
	KW83E55jvOmknfQoHtvMmvw6fsvT08U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-jjGDNkyNMtupOU7uogU6Vg-1; Tue, 04 Apr 2023 12:05:07 -0400
X-MC-Unique: jjGDNkyNMtupOU7uogU6Vg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06A9B3801F6F;
	Tue,  4 Apr 2023 16:02:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF88B440D7;
	Tue,  4 Apr 2023 16:02:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 905C519472C2;
	Tue,  4 Apr 2023 16:02:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A331F1946A42 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:55:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6F44A4020C80; Tue,  4 Apr 2023 14:55:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6833A40C6EC4
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A94B28237DD
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:14 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-c8lvdkENPt6zZl9GuyAJMw-1; Tue, 04 Apr 2023 10:55:13 -0400
X-MC-Unique: c8lvdkENPt6zZl9GuyAJMw-1
Received: by mail-qt1-f199.google.com with SMTP id
 u1-20020a05622a198100b003e12a0467easo22231765qtc.11
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HOa0kR4UZ9J5lXSH1eVSD9D5g9oUFaieHHnsOCRS/TM=;
 b=tClQxAOBMJQCtuWTenx5RGxKzqs7+ZvcVjwatcFTVkeBS6uz+SROiJ8Iw2HjJTYgzb
 qXC5h2z083qOZkV1xn3bwKvUHaTuzM12nNYYnZZ8r6/f426UOiHR+NKRHj1ZZYSM1lkL
 9Tw4yOmWdjad3ynDCjvu+/6Tl2VsILfNk7TfH8wSYMIMUyLZvnkNMNKTYZVi4RV7DVuZ
 AHdhmsxcEwIhsG1Hl/K1m8eyi/ILvMaLsKPmqE4d4Xoodj9x74zuzBXvssKrc2sLdP4K
 Y67mUjSj8HQ2Bw9UGw/t+yp3Dd2wdAB0KJ8eS128L+Tz26p/e6cy2KTsqFyswUtudgUd
 3l2g==
X-Gm-Message-State: AAQBX9dcwVm5KJvTYqV/nfHaq1sY8N84g+xwkC/akFvHxNa5CGlDOtYx
 7ot+6kQBOmt8KRdcKrE1EhbSL94LkgboxDIhmtLdbCYgrIu409nabydxa1h0KKCfcMftgoRdmjc
 pdiDXn8T6etHEDrbAuvvDtxYqr8cmJNg=
X-Received: by 2002:a05:622a:1206:b0:3e6:386b:2314 with SMTP id
 y6-20020a05622a120600b003e6386b2314mr4234335qtx.62.1680620112375; 
 Tue, 04 Apr 2023 07:55:12 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zi2LAt4qDrudwl48rNwlY8u7pFZFW3zeybFHV9/WikI3mElMyLLcUr2mx2LZUuubcbPpyUsw==
X-Received: by 2002:a05:622a:1206:b0:3e6:386b:2314 with SMTP id
 y6-20020a05622a120600b003e6386b2314mr4234307qtx.62.1680620112123; 
 Tue, 04 Apr 2023 07:55:12 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:11 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:05 +0200
Message-Id: <20230404145319.2057051-10-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 09/23] iomap: allow filesystem to
 implement read path verification
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
Cc: linux-ext4@vger.kernel.org, damien.lemoal@opensource.wdc.com,
 chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, xiang@kernel.org, jth@kernel.org,
 linux-erofs@lists.ozlabs.org, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Add IOMAP_F_READ_VERITY which indicates that iomap need to
verify BIO (e.g. fs-verity) after I/O is completed.

Add iomap_readpage_ops with only optional ->prepare_ioend() to allow
filesystem to add callout used for configuring read path ioend.
Mainly for setting ->bi_end_io() callout. Add
iomap_folio_ops->verify_folio() for direct folio verification.

The verification itself is suppose to happen on filesystem side. The
verification is done when the BIO is processed by calling out
->bi_end_io().

Make iomap_read_end_io() exportable, so, it can be called back from
filesystem callout after verification is done.

The read path ioend are stored side by side with BIOs allocated from
iomap_read_ioend_bioset.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/iomap/buffered-io.c | 32 +++++++++++++++++++++++++++++---
 include/linux/iomap.h  | 26 ++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 3 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index d39be64b1da9..7e59c299c496 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -42,6 +42,7 @@ static inline struct iomap_page *to_iomap_page(struct folio *folio)
 }
 
 static struct bio_set iomap_ioend_bioset;
+static struct bio_set iomap_read_ioend_bioset;
 
 static struct iomap_page *
 iomap_page_create(struct inode *inode, struct folio *folio, unsigned int flags)
@@ -184,7 +185,7 @@ static void iomap_finish_folio_read(struct folio *folio, size_t offset,
 		folio_unlock(folio);
 }
 
-static void iomap_read_end_io(struct bio *bio)
+void iomap_read_end_io(struct bio *bio)
 {
 	int error = blk_status_to_errno(bio->bi_status);
 	struct folio_iter fi;
@@ -193,6 +194,7 @@ static void iomap_read_end_io(struct bio *bio)
 		iomap_finish_folio_read(fi.folio, fi.offset, fi.length, error);
 	bio_put(bio);
 }
+EXPORT_SYMBOL_GPL(iomap_read_end_io);
 
 /**
  * iomap_read_inline_data - copy inline data into the page cache
@@ -257,6 +259,7 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 	loff_t orig_pos = pos;
 	size_t poff, plen;
 	sector_t sector;
+	struct iomap_read_ioend *ioend;
 
 	if (iomap->type == IOMAP_INLINE)
 		return iomap_read_inline_data(iter, folio);
@@ -269,6 +272,13 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 
 	if (iomap_block_needs_zeroing(iter, pos)) {
 		folio_zero_range(folio, poff, plen);
+		if (iomap->flags & IOMAP_F_READ_VERITY) {
+			if (!iomap->folio_ops->verify_folio(folio, poff, plen)) {
+				folio_set_error(folio);
+				goto done;
+			}
+		}
+
 		iomap_set_range_uptodate(folio, iop, poff, plen);
 		goto done;
 	}
@@ -290,8 +300,8 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 
 		if (ctx->rac) /* same as readahead_gfp_mask */
 			gfp |= __GFP_NORETRY | __GFP_NOWARN;
-		ctx->bio = bio_alloc(iomap->bdev, bio_max_segs(nr_vecs),
-				     REQ_OP_READ, gfp);
+		ctx->bio = bio_alloc_bioset(iomap->bdev, bio_max_segs(nr_vecs),
+				REQ_OP_READ, GFP_NOFS, &iomap_read_ioend_bioset);
 		/*
 		 * If the bio_alloc fails, try it again for a single page to
 		 * avoid having to deal with partial page reads.  This emulates
@@ -305,6 +315,13 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 			ctx->bio->bi_opf |= REQ_RAHEAD;
 		ctx->bio->bi_iter.bi_sector = sector;
 		ctx->bio->bi_end_io = iomap_read_end_io;
+
+		ioend = container_of(ctx->bio, struct iomap_read_ioend,
+				read_inline_bio);
+		ioend->io_inode = iter->inode;
+		if (ctx->ops && ctx->ops->prepare_ioend)
+			ctx->ops->prepare_ioend(ioend);
+
 		bio_add_folio(ctx->bio, folio, plen, poff);
 	}
 
@@ -1813,6 +1830,15 @@ EXPORT_SYMBOL_GPL(iomap_writepages);
 
 static int __init iomap_init(void)
 {
+	int error = 0;
+
+	error = bioset_init(&iomap_read_ioend_bioset,
+			   4 * (PAGE_SIZE / SECTOR_SIZE),
+			   offsetof(struct iomap_read_ioend, read_inline_bio),
+			   BIOSET_NEED_BVECS);
+	if (error)
+		return error;
+
 	return bioset_init(&iomap_ioend_bioset, 4 * (PAGE_SIZE / SECTOR_SIZE),
 			   offsetof(struct iomap_ioend, io_inline_bio),
 			   BIOSET_NEED_BVECS);
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 0fbce375265d..9a17b53309c9 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -53,6 +53,9 @@ struct vm_fault;
  *
  * IOMAP_F_XATTR indicates that the iomap is for an extended attribute extent
  * rather than a file data extent.
+ *
+ * IOMAP_F_READ_VERITY indicates that the iomap needs verification of read
+ * folios
  */
 #define IOMAP_F_NEW		(1U << 0)
 #define IOMAP_F_DIRTY		(1U << 1)
@@ -60,6 +63,7 @@ struct vm_fault;
 #define IOMAP_F_MERGED		(1U << 3)
 #define IOMAP_F_BUFFER_HEAD	(1U << 4)
 #define IOMAP_F_XATTR		(1U << 5)
+#define IOMAP_F_READ_VERITY	(1U << 6)
 
 /*
  * Flags set by the core iomap code during operations:
@@ -156,6 +160,11 @@ struct iomap_folio_ops {
 	 * locked by the iomap code.
 	 */
 	bool (*iomap_valid)(struct inode *inode, const struct iomap *iomap);
+
+	/*
+	 * Verify folio when successfully read
+	 */
+	bool (*verify_folio)(struct folio *folio, loff_t pos, unsigned int len);
 };
 
 /*
@@ -258,13 +267,30 @@ int iomap_file_buffered_write_punch_delalloc(struct inode *inode,
 		struct iomap *iomap, loff_t pos, loff_t length, ssize_t written,
 		int (*punch)(struct inode *inode, loff_t pos, loff_t length));
 
+struct iomap_read_ioend {
+	struct inode		*io_inode;	/* file being read from */
+	struct work_struct	work;		/* post read work (e.g. fs-verity) */
+	struct bio		read_inline_bio;/* MUST BE LAST! */
+};
+
+struct iomap_readpage_ops {
+	/*
+	 * Optional, allows the file systems to perform actions just before
+	 * submitting the bio and/or override the bio bi_end_io handler for
+	 * additional verification after bio is processed
+	 */
+	void (*prepare_ioend)(struct iomap_read_ioend *ioend);
+};
+
 struct iomap_readpage_ctx {
 	struct folio			*cur_folio;
 	bool				cur_folio_in_bio;
 	struct bio			*bio;
 	struct readahead_control	*rac;
+	const struct iomap_readpage_ops *ops;
 };
 
+void iomap_read_end_io(struct bio *bio);
 int iomap_read_folio(struct iomap_readpage_ctx *ctx,
 		const struct iomap_ops *ops);
 void iomap_readahead(struct iomap_readpage_ctx *ctx,
-- 
2.38.4

