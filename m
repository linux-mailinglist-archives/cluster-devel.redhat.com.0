Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6926D6849
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Jde43B7wLiY0X8TkodUDvektg6VGP7LMYmpHpXCm3PE=;
	b=Wj8Sm4JYsDh2QGrN5FU5SURnu4d2za3ufRcXY1S5himisp/AqDAskFTUjXTrDkCCpOnnyu
	fSXHBB14f3c92LxYD1siWYC9FR3OY7Xyzx2nNPgPW7YH0FRlVUIKASJTeYjef6OorwdK3e
	gmiDqXut/Afg6AKPolyxjOxVx+0aIwg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-164QlqrLPIypaeh5NuAd2w-1; Tue, 04 Apr 2023 12:04:35 -0400
X-MC-Unique: 164QlqrLPIypaeh5NuAd2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD5798D13BA;
	Tue,  4 Apr 2023 16:02:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B19E41121315;
	Tue,  4 Apr 2023 16:02:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AEE0419472E4;
	Tue,  4 Apr 2023 16:02:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9D5D41946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:55:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0E59F492C18; Tue,  4 Apr 2023 14:55:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05AD3492C13
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE44028237C7
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:13 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-4cJbnkfRNRuI0oJv68hEKA-1; Tue, 04 Apr 2023 10:55:12 -0400
X-MC-Unique: 4cJbnkfRNRuI0oJv68hEKA-1
Received: by mail-qt1-f197.google.com with SMTP id
 c14-20020ac87d8e000000b003e38726ec8bso22285318qtd.23
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620109;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jde43B7wLiY0X8TkodUDvektg6VGP7LMYmpHpXCm3PE=;
 b=eA2VYURMUJf/QxVsQNklRSAyo+fUd/3BWRGB072i7HIaSYuZfGTZ3EmPCHHQP/jOZJ
 R+X87ZHC6n3FD2kuEaVyQnwPR8rYdHFuHtmrJQVNDTBpB3qxRRpnFYdboEa5dr7uebFw
 76cpwehmhSVBSh9XeDlaVWtjz4yHUIzMxILjpPezhRlXAQDFkuAiZzQen7+nDt8dwc/S
 f2hs/LWnlgOJ2wu0gVQyjEmbR3TDLg0lKFYfnc+OOLasOkQFAXRIOY8ybmCdnpHaP1GD
 DKOutXOrnUFWvvcVa1t6Y53spKiDb8wKRXoLFbZnwLVyCQRiZ7bitfGVtxvy029Oed+l
 oImg==
X-Gm-Message-State: AAQBX9dHj6DtAHDh/wboG0KjqgSzJ8uTGiEV/U3NEPQ4Pm90C0RW3RQF
 08ZWeGxR81Kg/cF/fXVcqVjhDbt7Hk1puvXi0llp5rL7Ipa5RIwbTM+7ORFMmncIFRlzpkQ8sRf
 0HYVMF5xIrnIZYfXDvS18
X-Received: by 2002:ac8:58ca:0:b0:3e6:61a6:c020 with SMTP id
 u10-20020ac858ca000000b003e661a6c020mr4116068qta.18.1680620109211; 
 Tue, 04 Apr 2023 07:55:09 -0700 (PDT)
X-Google-Smtp-Source: AKy350bRukieGp/vBCe07UBrAYPMxqeAHfI+NHR3fac66ESM5ACOxN0AeboeMCKRIpd7badFWWI16A==
X-Received: by 2002:ac8:58ca:0:b0:3e6:61a6:c020 with SMTP id
 u10-20020ac858ca000000b003e661a6c020mr4116026qta.18.1680620108814; 
 Tue, 04 Apr 2023 07:55:08 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:08 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:04 +0200
Message-Id: <20230404145319.2057051-9-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 08/23] iomap: hoist iomap_readpage_ctx
 from the iomap_readahead/_folio
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Make filesystems create readpage context, similar as
iomap_writepage_ctx in write path. This will allow filesystem to
pass _ops to iomap for ioend configuration (->prepare_ioend) which
in turn would be used to set BIO end callout (bio->bi_end_io).

This will be utilized in further patches by fs-verity to verify
pages on BIO completion by XFS.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/erofs/data.c        | 12 +++++++--
 fs/gfs2/aops.c         | 10 ++++++--
 fs/iomap/buffered-io.c | 57 ++++++++++++++++--------------------------
 fs/xfs/xfs_aops.c      | 16 +++++++++---
 fs/zonefs/file.c       | 12 +++++++--
 include/linux/iomap.h  | 13 ++++++++--
 6 files changed, 73 insertions(+), 47 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index e16545849ea7..189591249f61 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -344,12 +344,20 @@ int erofs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
  */
 static int erofs_read_folio(struct file *file, struct folio *folio)
 {
-	return iomap_read_folio(folio, &erofs_iomap_ops);
+	struct iomap_readpage_ctx ctx = {
+		.cur_folio = folio,
+	};
+
+	return iomap_read_folio(&ctx, &erofs_iomap_ops);
 }
 
 static void erofs_readahead(struct readahead_control *rac)
 {
-	return iomap_readahead(rac, &erofs_iomap_ops);
+	struct iomap_readpage_ctx ctx = {
+		.rac = rac,
+	};
+
+	return iomap_readahead(&ctx, &erofs_iomap_ops);
 }
 
 static sector_t erofs_bmap(struct address_space *mapping, sector_t block)
diff --git a/fs/gfs2/aops.c b/fs/gfs2/aops.c
index a5f4be6b9213..2764e1e99e8b 100644
--- a/fs/gfs2/aops.c
+++ b/fs/gfs2/aops.c
@@ -453,10 +453,13 @@ static int gfs2_read_folio(struct file *file, struct folio *folio)
 	struct gfs2_inode *ip = GFS2_I(inode);
 	struct gfs2_sbd *sdp = GFS2_SB(inode);
 	int error;
+	struct iomap_readpage_ctx ctx = {
+		.cur_folio = folio,
+	};
 
 	if (!gfs2_is_jdata(ip) ||
 	    (i_blocksize(inode) == PAGE_SIZE && !folio_buffers(folio))) {
-		error = iomap_read_folio(folio, &gfs2_iomap_ops);
+		error = iomap_read_folio(&ctx, &gfs2_iomap_ops);
 	} else if (gfs2_is_stuffed(ip)) {
 		error = stuffed_readpage(ip, &folio->page);
 		folio_unlock(folio);
@@ -528,13 +531,16 @@ static void gfs2_readahead(struct readahead_control *rac)
 {
 	struct inode *inode = rac->mapping->host;
 	struct gfs2_inode *ip = GFS2_I(inode);
+	struct iomap_readpage_ctx ctx = {
+		.rac = rac,
+	};
 
 	if (gfs2_is_stuffed(ip))
 		;
 	else if (gfs2_is_jdata(ip))
 		mpage_readahead(rac, gfs2_block_map);
 	else
-		iomap_readahead(rac, &gfs2_iomap_ops);
+		iomap_readahead(&ctx, &gfs2_iomap_ops);
 }
 
 /**
diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 6f4c97a6d7e9..d39be64b1da9 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -194,13 +194,6 @@ static void iomap_read_end_io(struct bio *bio)
 	bio_put(bio);
 }
 
-struct iomap_readpage_ctx {
-	struct folio		*cur_folio;
-	bool			cur_folio_in_bio;
-	struct bio		*bio;
-	struct readahead_control *rac;
-};
-
 /**
  * iomap_read_inline_data - copy inline data into the page cache
  * @iter: iteration structure
@@ -325,32 +318,29 @@ static loff_t iomap_readpage_iter(const struct iomap_iter *iter,
 	return pos - orig_pos + plen;
 }
 
-int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops)
+int iomap_read_folio(struct iomap_readpage_ctx *ctx, const struct iomap_ops *ops)
 {
 	struct iomap_iter iter = {
-		.inode		= folio->mapping->host,
-		.pos		= folio_pos(folio),
-		.len		= folio_size(folio),
-	};
-	struct iomap_readpage_ctx ctx = {
-		.cur_folio	= folio,
+		.inode		= ctx->cur_folio->mapping->host,
+		.pos		= folio_pos(ctx->cur_folio),
+		.len		= folio_size(ctx->cur_folio),
 	};
 	int ret;
 
 	trace_iomap_readpage(iter.inode, 1);
 
 	while ((ret = iomap_iter(&iter, ops)) > 0)
-		iter.processed = iomap_readpage_iter(&iter, &ctx, 0);
+		iter.processed = iomap_readpage_iter(&iter, ctx, 0);
 
 	if (ret < 0)
-		folio_set_error(folio);
+		folio_set_error(ctx->cur_folio);
 
-	if (ctx.bio) {
-		submit_bio(ctx.bio);
-		WARN_ON_ONCE(!ctx.cur_folio_in_bio);
+	if (ctx->bio) {
+		submit_bio(ctx->bio);
+		WARN_ON_ONCE(!ctx->cur_folio_in_bio);
 	} else {
-		WARN_ON_ONCE(ctx.cur_folio_in_bio);
-		folio_unlock(folio);
+		WARN_ON_ONCE(ctx->cur_folio_in_bio);
+		folio_unlock(ctx->cur_folio);
 	}
 
 	/*
@@ -402,27 +392,24 @@ static loff_t iomap_readahead_iter(const struct iomap_iter *iter,
  * function is called with memalloc_nofs set, so allocations will not cause
  * the filesystem to be reentered.
  */
-void iomap_readahead(struct readahead_control *rac, const struct iomap_ops *ops)
+void iomap_readahead(struct iomap_readpage_ctx *ctx, const struct iomap_ops *ops)
 {
 	struct iomap_iter iter = {
-		.inode	= rac->mapping->host,
-		.pos	= readahead_pos(rac),
-		.len	= readahead_length(rac),
-	};
-	struct iomap_readpage_ctx ctx = {
-		.rac	= rac,
+		.inode	= ctx->rac->mapping->host,
+		.pos	= readahead_pos(ctx->rac),
+		.len	= readahead_length(ctx->rac),
 	};
 
-	trace_iomap_readahead(rac->mapping->host, readahead_count(rac));
+	trace_iomap_readahead(ctx->rac->mapping->host, readahead_count(ctx->rac));
 
 	while (iomap_iter(&iter, ops) > 0)
-		iter.processed = iomap_readahead_iter(&iter, &ctx);
+		iter.processed = iomap_readahead_iter(&iter, ctx);
 
-	if (ctx.bio)
-		submit_bio(ctx.bio);
-	if (ctx.cur_folio) {
-		if (!ctx.cur_folio_in_bio)
-			folio_unlock(ctx.cur_folio);
+	if (ctx->bio)
+		submit_bio(ctx->bio);
+	if (ctx->cur_folio) {
+		if (!ctx->cur_folio_in_bio)
+			folio_unlock(ctx->cur_folio);
 	}
 }
 EXPORT_SYMBOL_GPL(iomap_readahead);
diff --git a/fs/xfs/xfs_aops.c b/fs/xfs/xfs_aops.c
index 2ef78aa1d3f6..daa0dd4768fb 100644
--- a/fs/xfs/xfs_aops.c
+++ b/fs/xfs/xfs_aops.c
@@ -550,17 +550,25 @@ xfs_vm_bmap(
 
 STATIC int
 xfs_vm_read_folio(
-	struct file		*unused,
-	struct folio		*folio)
+	struct file			*unused,
+	struct folio			*folio)
 {
-	return iomap_read_folio(folio, &xfs_read_iomap_ops);
+	struct iomap_readpage_ctx	ctx = {
+		.cur_folio		= folio,
+	};
+
+	return iomap_read_folio(&ctx, &xfs_read_iomap_ops);
 }
 
 STATIC void
 xfs_vm_readahead(
 	struct readahead_control	*rac)
 {
-	iomap_readahead(rac, &xfs_read_iomap_ops);
+	struct iomap_readpage_ctx	ctx = {
+		.rac			= rac,
+	};
+
+	iomap_readahead(&ctx, &xfs_read_iomap_ops);
 }
 
 static int
diff --git a/fs/zonefs/file.c b/fs/zonefs/file.c
index 738b0e28d74b..5d01496a5ada 100644
--- a/fs/zonefs/file.c
+++ b/fs/zonefs/file.c
@@ -112,12 +112,20 @@ static const struct iomap_ops zonefs_write_iomap_ops = {
 
 static int zonefs_read_folio(struct file *unused, struct folio *folio)
 {
-	return iomap_read_folio(folio, &zonefs_read_iomap_ops);
+	struct iomap_readpage_ctx ctx = {
+		.cur_folio = folio,
+	};
+
+	return iomap_read_folio(&ctx, &zonefs_read_iomap_ops);
 }
 
 static void zonefs_readahead(struct readahead_control *rac)
 {
-	iomap_readahead(rac, &zonefs_read_iomap_ops);
+	struct iomap_readpage_ctx ctx = {
+		.rac = rac,
+	};
+
+	iomap_readahead(&ctx, &zonefs_read_iomap_ops);
 }
 
 /*
diff --git a/include/linux/iomap.h b/include/linux/iomap.h
index 0f8123504e5e..0fbce375265d 100644
--- a/include/linux/iomap.h
+++ b/include/linux/iomap.h
@@ -258,8 +258,17 @@ int iomap_file_buffered_write_punch_delalloc(struct inode *inode,
 		struct iomap *iomap, loff_t pos, loff_t length, ssize_t written,
 		int (*punch)(struct inode *inode, loff_t pos, loff_t length));
 
-int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops);
-void iomap_readahead(struct readahead_control *, const struct iomap_ops *ops);
+struct iomap_readpage_ctx {
+	struct folio			*cur_folio;
+	bool				cur_folio_in_bio;
+	struct bio			*bio;
+	struct readahead_control	*rac;
+};
+
+int iomap_read_folio(struct iomap_readpage_ctx *ctx,
+		const struct iomap_ops *ops);
+void iomap_readahead(struct iomap_readpage_ctx *ctx,
+		const struct iomap_ops *ops);
 bool iomap_is_partially_uptodate(struct folio *, size_t from, size_t count);
 struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos);
 bool iomap_release_folio(struct folio *folio, gfp_t gfp_flags);
-- 
2.38.4

