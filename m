Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9DD6D6837
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624249;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z32N0rKUyphSVMSofzw3CVH4IfYQ7TTzuKWmER1MJ68=;
	b=BqhZPO81UJQff+/vv2Sw7qeMVef1HsTkzymBKBSczy0nr2RBTYOobPDLyrk7Ay1mfAmzkQ
	s69OPz+0ws61AH5ISsf0sk24t+LeHpF28uSQAJFHATI/EVedEyOwwQmIO6XWkCSrODazx0
	LarSzAB3JVRIyw8Aps2PsHX61T2Tup4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-HeXcYSEcMvapQdlnmOUKWQ-1; Tue, 04 Apr 2023 12:03:54 -0400
X-MC-Unique: HeXcYSEcMvapQdlnmOUKWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 538703C1068A;
	Tue,  4 Apr 2023 16:02:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4846614171B6;
	Tue,  4 Apr 2023 16:02:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 13D401946A4C;
	Tue,  4 Apr 2023 16:02:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9ADCE194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:55:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1050F2027062; Tue,  4 Apr 2023 14:55:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08BF52027061
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4996B85530D
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:07 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-d2LOzEkJM8y4qdK138Xrvw-1; Tue, 04 Apr 2023 10:55:04 -0400
X-MC-Unique: d2LOzEkJM8y4qdK138Xrvw-1
Received: by mail-qk1-f197.google.com with SMTP id
 66-20020a370345000000b00746886b1593so14775289qkd.14
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z32N0rKUyphSVMSofzw3CVH4IfYQ7TTzuKWmER1MJ68=;
 b=0DfdD2K6XTLc+aGLk4iAp5zcgnjobFMisUpoknF/13KcjQj+9r6Gt+OLE5Vdr38XZ1
 /alhKWJPDq8zOneuud0j8AghKTp2iRo+eV5CYYg3Et95hDlYhZM8YMxP4LRmOV9HlA0J
 sGWc6q7KRZ1dbb1xMoGucxQxZubQsOWC2glvCkZXSZjkyJ7XkznMgi4RXVR2Cxyl9qNJ
 V2vabHrYCncwaF3n79VdZifU4ZClukaYgZkDp5zIipKfUsGNcw9e8gUUv73gokYom1EW
 a8UHG9WYwRdLt9E3xD2Bvmw3MpGCsyvJRvz2vBJPhiRxBGCFUO9JMZf5VCw7u2G0rnOA
 PImg==
X-Gm-Message-State: AAQBX9ddckmd5zcMzyufczuj4geZavhvgIcNlDT48yST4iUveDEtWJAf
 XRDk+HIheKvishfENkKMECZDcULUKhw+gULqnPywx32sVR7Qy1ZvTP+tfB9JlvH+tWfc0ZiVAGs
 /Dl+A7C9Kkojlk2Siav8I
X-Received: by 2002:a05:622a:106:b0:3e4:ed0d:6a87 with SMTP id
 u6-20020a05622a010600b003e4ed0d6a87mr3825562qtw.32.1680620102980; 
 Tue, 04 Apr 2023 07:55:02 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zp0JOhVAHhC6Iyf8k/1+phPOce9sQ42GmA8VSWN8AvlHBpCO2hspsjGFg8IADdMrX46OgtcA==
X-Received: by 2002:a05:622a:106:b0:3e4:ed0d:6a87 with SMTP id
 u6-20020a05622a010600b003e4ed0d6a87mr3825521qtw.32.1680620102599; 
 Tue, 04 Apr 2023 07:55:02 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.54.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:02 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:02 +0200
Message-Id: <20230404145319.2057051-7-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 06/23] fsverity: add drop_page() callout
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Allow filesystem to make additional processing on verified pages
instead of just dropping a reference. This will be used by XFS for
internal buffer cache manipulation in further patches. The btrfs,
ext4, and f2fs just drop the reference.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/btrfs/verity.c         | 12 ++++++++++++
 fs/ext4/verity.c          |  6 ++++++
 fs/f2fs/verity.c          |  6 ++++++
 fs/verity/read_metadata.c |  4 ++--
 fs/verity/verify.c        |  6 +++---
 include/linux/fsverity.h  | 10 ++++++++++
 6 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index c5ff16f9e9fa..4c2c09204bb4 100644
--- a/fs/btrfs/verity.c
+++ b/fs/btrfs/verity.c
@@ -804,10 +804,22 @@ static int btrfs_write_merkle_tree_block(struct inode *inode, const void *buf,
 			       pos, buf, size);
 }
 
+/*
+ * fsverity op that releases the reference obtained by ->read_merkle_tree_page()
+ *
+ * @page:  reference to the page which can be released
+ *
+ */
+static void btrfs_drop_page(struct page *page)
+{
+	put_page(page);
+}
+
 const struct fsverity_operations btrfs_verityops = {
 	.begin_enable_verity     = btrfs_begin_enable_verity,
 	.end_enable_verity       = btrfs_end_enable_verity,
 	.get_verity_descriptor   = btrfs_get_verity_descriptor,
 	.read_merkle_tree_page   = btrfs_read_merkle_tree_page,
 	.write_merkle_tree_block = btrfs_write_merkle_tree_block,
+	.drop_page		 = &btrfs_drop_page,
 };
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index e4da1704438e..35a2feb6fd68 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -388,10 +388,16 @@ static int ext4_write_merkle_tree_block(struct inode *inode, const void *buf,
 	return pagecache_write(inode, buf, size, pos);
 }
 
+static void ext4_drop_page(struct page *page)
+{
+	put_page(page);
+}
+
 const struct fsverity_operations ext4_verityops = {
 	.begin_enable_verity	= ext4_begin_enable_verity,
 	.end_enable_verity	= ext4_end_enable_verity,
 	.get_verity_descriptor	= ext4_get_verity_descriptor,
 	.read_merkle_tree_page	= ext4_read_merkle_tree_page,
 	.write_merkle_tree_block = ext4_write_merkle_tree_block,
+	.drop_page		= &ext4_drop_page,
 };
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 4fc95f353a7a..019c7a6c6bcf 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -283,10 +283,16 @@ static int f2fs_write_merkle_tree_block(struct inode *inode, const void *buf,
 	return pagecache_write(inode, buf, size, pos);
 }
 
+static void f2fs_drop_page(struct page *page)
+{
+	put_page(page);
+}
+
 const struct fsverity_operations f2fs_verityops = {
 	.begin_enable_verity	= f2fs_begin_enable_verity,
 	.end_enable_verity	= f2fs_end_enable_verity,
 	.get_verity_descriptor	= f2fs_get_verity_descriptor,
 	.read_merkle_tree_page	= f2fs_read_merkle_tree_page,
 	.write_merkle_tree_block = f2fs_write_merkle_tree_block,
+	.drop_page		= &f2fs_drop_page,
 };
diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
index 2aefc5565152..cab1612bf4a3 100644
--- a/fs/verity/read_metadata.c
+++ b/fs/verity/read_metadata.c
@@ -56,12 +56,12 @@ static int fsverity_read_merkle_tree(struct inode *inode,
 		virt = kmap_local_page(page);
 		if (copy_to_user(buf, virt + offs_in_page, bytes_to_copy)) {
 			kunmap_local(virt);
-			put_page(page);
+			inode->i_sb->s_vop->drop_page(page);
 			err = -EFAULT;
 			break;
 		}
 		kunmap_local(virt);
-		put_page(page);
+		inode->i_sb->s_vop->drop_page(page);
 
 		retval += bytes_to_copy;
 		buf += bytes_to_copy;
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index f50e3b5b52c9..c2fc4c86af34 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -210,7 +210,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 		if (is_hash_block_verified(vi, hpage, hblock_idx)) {
 			memcpy_from_page(_want_hash, hpage, hoffset, hsize);
 			want_hash = _want_hash;
-			put_page(hpage);
+			inode->i_sb->s_vop->drop_page(hpage);
 			goto descend;
 		}
 		hblocks[level].page = hpage;
@@ -248,7 +248,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 			SetPageChecked(hpage);
 		memcpy_from_page(_want_hash, hpage, hoffset, hsize);
 		want_hash = _want_hash;
-		put_page(hpage);
+		inode->i_sb->s_vop->drop_page(hpage);
 	}
 
 	/* Finally, verify the data block. */
@@ -259,7 +259,7 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 	err = cmp_hashes(vi, want_hash, real_hash, data_pos, -1);
 out:
 	for (; level > 0; level--)
-		put_page(hblocks[level - 1].page);
+		inode->i_sb->s_vop->drop_page(hblocks[level - 1].page);
 
 	return err == 0;
 }
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 6d7a4b3ea626..3e923a8e0d6f 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -120,6 +120,16 @@ struct fsverity_operations {
 	 */
 	int (*write_merkle_tree_block)(struct inode *inode, const void *buf,
 				       u64 pos, unsigned int size);
+
+	/**
+	 * Release the reference to a Merkle tree page
+	 *
+	 * @page: the page to release
+	 *
+	 * This is called when fs-verity is done with a page obtained with
+	 * ->read_merkle_tree_page().
+	 */
+	void (*drop_page)(struct page *page);
 };
 
 #ifdef CONFIG_FS_VERITY
-- 
2.38.4

