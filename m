Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A686D6844
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624285;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k8y9WhZdDNtrUXoW/FedDtUjjZj566BJYHrOtFmmOqc=;
	b=ixQdA8STYAkJ3TgH74ACU2j2ivCsTxrj7rl9974ueI0T3iquHs27wvubRxrBgDmiWvTaGw
	Y6ZtkQvZuUuKo+1UARS88jEmUBuJxCyovHOttUjiZR5Y2yO/wfLVce+K7/sjkjb/Fx/EJA
	EDQJWv9WPh7WFG7EsZGriFgJjqaP4ns=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-xS86DqojPtuFqdobbxeQ0A-1; Tue, 04 Apr 2023 12:04:29 -0400
X-MC-Unique: xS86DqojPtuFqdobbxeQ0A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C53618A6485;
	Tue,  4 Apr 2023 16:02:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 10B5D407D444;
	Tue,  4 Apr 2023 16:02:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D19E71946A4C;
	Tue,  4 Apr 2023 16:02:32 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A14EF19465BA for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:55:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B00602166B29; Tue,  4 Apr 2023 14:55:20 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A96E42166B26
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8828C85A5A3
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:20 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-617-5hDyxqwVNUyYLpn647nT6g-1; Tue, 04 Apr 2023 10:55:19 -0400
X-MC-Unique: 5hDyxqwVNUyYLpn647nT6g-1
Received: by mail-qv1-f69.google.com with SMTP id
 w2-20020a0cc242000000b00583d8e55181so14728354qvh.23
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k8y9WhZdDNtrUXoW/FedDtUjjZj566BJYHrOtFmmOqc=;
 b=TXKgmYbKys8qbkR8bcfGdJRMiKTZrT3yuDbu1w6C43mqRnMR/lLsZRrRoxVqU1/9jl
 RtbcyWlgVqyhXw/VcClsB8INm9seCa72uATEKMO7OrD5172WHGKoMeE+gViFgKl0YZEP
 wJvH4XBztOPgARqQocI7cNlyUvnIedRQlPz6vLkWLIEHvIh5Gxf4Dv7w9VDTGPe+4ll8
 Qh6InF/kGN9dNkzz7L9rSjC43n3Og9Qkb4HyKTwRUboaLUTSjwVcHhE8AfxvucTDXPy5
 36EzVRB5RyynyDLt/qEaaNcMaP0bt+YYvHU0o/hpCDLHyCMrxOFuNujmhcFgzJh5//d9
 g/WQ==
X-Gm-Message-State: AAQBX9e6q5x/TAWBbvlGOlGQVox0U6MEk0RxH7EoZXnI8HIlZO0+W4zv
 MLc2ACCov31eadpI5ViihAK/0OJEiLWxlNlBlLVtGv/6TS+FowBefGfqHS4pU4F7BIn8g/qs+P/
 3b/Cv2mLSPQ0vDvuascR7
X-Received: by 2002:ac8:5b06:0:b0:3d4:3d6c:a62b with SMTP id
 m6-20020ac85b06000000b003d43d6ca62bmr3793783qtw.27.1680620118594; 
 Tue, 04 Apr 2023 07:55:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zq76N3HAqDggjHqbDMyBg5khfORiFnim8gNTT1pLECc9GdD6VxBnlyiVZupUjB3vAUZcGqDA==
X-Received: by 2002:ac8:5b06:0:b0:3d4:3d6c:a62b with SMTP id
 m6-20020ac85b06000000b003d43d6ca62bmr3793740qtw.27.1680620118202; 
 Tue, 04 Apr 2023 07:55:18 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:17 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:07 +0200
Message-Id: <20230404145319.2057051-12-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 11/23] xfs: add XFS_DA_OP_BUFFER to make
 xfs_attr_get() return buffer
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

One of essential ideas of fs-verity is that pages which are already
verified won't need to be re-verified if they still in page cache.

The XFS stores Merkle tree blocks in extended attributes. Each
attribute has one Merkle tree block. We can not directly mark
underlying xfs_buf's pages as checked. The are not aligned with
xattr value and we don't have a reference to that buffer which is
immediately release when value is copied out.

One way to track that this block was verified is to mark xattr's
buffer as verified. If buffer is evicted the incore
XBF_VERITY_CHECKED flag is lost. When the xattr is read again
xfs_attr_get() returns new buffer without the flag. The flag is then
used to tell fs-verity if it's new page or cached one.

This patch adds XFS_DA_OP_BUFFER to tell xfs_attr_get() to
xfs_buf_hold() underlying buffer and return it as xfs_da_args->bp.
The caller must then xfs_buf_rele() the buffer.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_attr.c        |  5 ++++-
 fs/xfs/libxfs/xfs_attr_leaf.c   |  7 +++++++
 fs/xfs/libxfs/xfs_attr_remote.c | 13 +++++++++++--
 fs/xfs/libxfs/xfs_da_btree.h    |  5 ++++-
 4 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_attr.c b/fs/xfs/libxfs/xfs_attr.c
index 711022742e34..298b74245267 100644
--- a/fs/xfs/libxfs/xfs_attr.c
+++ b/fs/xfs/libxfs/xfs_attr.c
@@ -251,6 +251,8 @@ xfs_attr_get_ilocked(
  * If the attribute is found, but exceeds the size limit set by the caller in
  * args->valuelen, return -ERANGE with the size of the attribute that was found
  * in args->valuelen.
+ *
+ * Using XFS_DA_OP_BUFFER the caller have to release the buffer args->bp.
  */
 int
 xfs_attr_get(
@@ -269,7 +271,8 @@ xfs_attr_get(
 	args->hashval = xfs_da_hashname(args->name, args->namelen);
 
 	/* Entirely possible to look up a name which doesn't exist */
-	args->op_flags = XFS_DA_OP_OKNOENT;
+	args->op_flags = XFS_DA_OP_OKNOENT |
+					(args->op_flags & XFS_DA_OP_BUFFER);
 
 	lock_mode = xfs_ilock_attr_map_shared(args->dp);
 	error = xfs_attr_get_ilocked(args);
diff --git a/fs/xfs/libxfs/xfs_attr_leaf.c b/fs/xfs/libxfs/xfs_attr_leaf.c
index beee51ad75ce..112bb2604c89 100644
--- a/fs/xfs/libxfs/xfs_attr_leaf.c
+++ b/fs/xfs/libxfs/xfs_attr_leaf.c
@@ -2533,6 +2533,13 @@ xfs_attr3_leaf_getvalue(
 		name_loc = xfs_attr3_leaf_name_local(leaf, args->index);
 		ASSERT(name_loc->namelen == args->namelen);
 		ASSERT(memcmp(args->name, name_loc->nameval, args->namelen) == 0);
+
+		/* must be released by the caller */
+		if (args->op_flags & XFS_DA_OP_BUFFER) {
+			xfs_buf_hold(bp);
+			args->bp = bp;
+		}
+
 		return xfs_attr_copy_value(args,
 					&name_loc->nameval[args->namelen],
 					be16_to_cpu(name_loc->valuelen));
diff --git a/fs/xfs/libxfs/xfs_attr_remote.c b/fs/xfs/libxfs/xfs_attr_remote.c
index d440393b40eb..72908e0e1c86 100644
--- a/fs/xfs/libxfs/xfs_attr_remote.c
+++ b/fs/xfs/libxfs/xfs_attr_remote.c
@@ -424,9 +424,18 @@ xfs_attr_rmtval_get(
 			error = xfs_attr_rmtval_copyout(mp, bp, args->dp->i_ino,
 							&offset, &valuelen,
 							&dst);
-			xfs_buf_relse(bp);
-			if (error)
+			xfs_buf_unlock(bp);
+			/* must be released by the caller */
+			if (args->op_flags & XFS_DA_OP_BUFFER)
+				args->bp = bp;
+			else
+				xfs_buf_rele(bp);
+
+			if (error) {
+				if (args->op_flags & XFS_DA_OP_BUFFER)
+					xfs_buf_rele(args->bp);
 				return error;
+			}
 
 			/* roll attribute extent map forwards */
 			lblkno += map[i].br_blockcount;
diff --git a/fs/xfs/libxfs/xfs_da_btree.h b/fs/xfs/libxfs/xfs_da_btree.h
index a4b29827603f..269d26730bca 100644
--- a/fs/xfs/libxfs/xfs_da_btree.h
+++ b/fs/xfs/libxfs/xfs_da_btree.h
@@ -61,6 +61,7 @@ typedef struct xfs_da_args {
 	uint8_t		filetype;	/* filetype of inode for directories */
 	void		*value;		/* set of bytes (maybe contain NULLs) */
 	int		valuelen;	/* length of value */
+	struct xfs_buf	*bp;		/* OUT: xfs_buf which contains the attr */
 	unsigned int	attr_filter;	/* XFS_ATTR_{ROOT,SECURE,INCOMPLETE} */
 	unsigned int	attr_flags;	/* XATTR_{CREATE,REPLACE} */
 	xfs_dahash_t	hashval;	/* hash value of name */
@@ -95,6 +96,7 @@ typedef struct xfs_da_args {
 #define XFS_DA_OP_REMOVE	(1u << 6) /* this is a remove operation */
 #define XFS_DA_OP_RECOVERY	(1u << 7) /* Log recovery operation */
 #define XFS_DA_OP_LOGGED	(1u << 8) /* Use intent items to track op */
+#define XFS_DA_OP_BUFFER	(1u << 9) /* Return underlying buffer */
 
 #define XFS_DA_OP_FLAGS \
 	{ XFS_DA_OP_JUSTCHECK,	"JUSTCHECK" }, \
@@ -105,7 +107,8 @@ typedef struct xfs_da_args {
 	{ XFS_DA_OP_NOTIME,	"NOTIME" }, \
 	{ XFS_DA_OP_REMOVE,	"REMOVE" }, \
 	{ XFS_DA_OP_RECOVERY,	"RECOVERY" }, \
-	{ XFS_DA_OP_LOGGED,	"LOGGED" }
+	{ XFS_DA_OP_LOGGED,	"LOGGED" }, \
+	{ XFS_DA_OP_BUFFER,	"BUFFER" }
 
 /*
  * Storage for holding state during Btree searches and split/join ops.
-- 
2.38.4

