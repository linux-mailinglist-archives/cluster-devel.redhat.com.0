Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B35BA6D6842
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624277;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WlIQw7/j0g439cxIh8Bf75rzXhQHTIStlmhsPCq2zc8=;
	b=etHAZue7B9Y0c1XPJUra2HwNSgjJsj6iAI+0fh2VcWihGzwZ4zn9QZbMVK4szNNkYe1jGb
	nvtKn3wKe9CUN0VnwBjdjDx9GS1ywSdJWqeKqXlw4KH6QTwGBqFfVmi7AWq73bBRqxOioa
	bTszIS823hbXFp6iepD72LF5eIEXL0g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-gRxNzToJOc6Us2NhAQ9Htg-1; Tue, 04 Apr 2023 12:04:14 -0400
X-MC-Unique: gRxNzToJOc6Us2NhAQ9Htg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AC7D18A649A;
	Tue,  4 Apr 2023 16:02:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6F9E0400F57;
	Tue,  4 Apr 2023 16:02:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A5F501946A76;
	Tue,  4 Apr 2023 16:02:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9AE2E194658D for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:55:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 79327492C14; Tue,  4 Apr 2023 14:55:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7198B492C13
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8F6F885621
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:09 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-2tLbFFk6MAi2bE608cdgrQ-1; Tue, 04 Apr 2023 10:55:07 -0400
X-MC-Unique: 2tLbFFk6MAi2bE608cdgrQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 w13-20020ac857cd000000b003e37d3e6de2so22338097qta.16
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WlIQw7/j0g439cxIh8Bf75rzXhQHTIStlmhsPCq2zc8=;
 b=kSkR/E1UubAtE5VxuezvAt+4RjSc7HTC0oD/k6G1AUiXPXUW3YL0Tu7xW/BMo9jJel
 VggdPzO07j9E5I8TrogRyMTUdACh7HoL7Ehdf3c5qcC/pdYT5CtXw1If6UMc6gaKvwtF
 jrw3C4yz+fDKczBy018fU/YCgFAD7YBfuXiiqMAqYhX+3PljPg9dpjUtN9xrmrDaEBi6
 voey2REaJ4rnvERsP+NU5C8s3vhA9Y7rWqNAudlP3PZb+RU8SF2Xt9rrO02in27pDxEd
 rb9AIv1MiW0bfTKJzrIZBhGKCD6/+GRBKEY7wJULElMz4wyRe1BiCGGGJQoKcSdD7oB2
 Yjww==
X-Gm-Message-State: AAQBX9dxjURg9Sx/wD/UdNH24dqEgRppVn1heDJpu4vzXYRFh8InMwnc
 aQcOumaxZSaMZTQCRl5qAArp6XLDPrKGUcU4Uf3uNP0EZDsBoaclk34ZGTxpkGNQA2V38oibUtc
 360DnTM68XeioPf/JCLcr
X-Received: by 2002:ac8:7c49:0:b0:3e4:db72:2fe9 with SMTP id
 o9-20020ac87c49000000b003e4db722fe9mr3470321qtv.36.1680620106387; 
 Tue, 04 Apr 2023 07:55:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZkIqkTYw/ppN5CuEt6hgDbTeahRxMEc8GNEiOIjYIzOXDUEk9J53kAIKMBFKs3QN5nxJK1Ew==
X-Received: by 2002:ac8:7c49:0:b0:3e4:db72:2fe9 with SMTP id
 o9-20020ac87c49000000b003e4db722fe9mr3470285qtv.36.1680620106020; 
 Tue, 04 Apr 2023 07:55:06 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:05 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:03 +0200
Message-Id: <20230404145319.2057051-8-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 07/23] fsverity: pass Merkle tree block
 size to ->read_merkle_tree_page()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

XFS will need to know size of Merkle tree block as these blocks
will not be stored consecutively in fs blocks but under indexes in
extended attributes.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/btrfs/verity.c         | 3 ++-
 fs/ext4/verity.c          | 3 ++-
 fs/f2fs/verity.c          | 3 ++-
 fs/verity/read_metadata.c | 3 ++-
 fs/verity/verify.c        | 3 ++-
 include/linux/fsverity.h  | 3 ++-
 6 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index 4c2c09204bb4..737ad277b15a 100644
--- a/fs/btrfs/verity.c
+++ b/fs/btrfs/verity.c
@@ -713,7 +713,8 @@ int btrfs_get_verity_descriptor(struct inode *inode, void *buf, size_t buf_size)
  */
 static struct page *btrfs_read_merkle_tree_page(struct inode *inode,
 						pgoff_t index,
-						unsigned long num_ra_pages)
+						unsigned long num_ra_pages,
+						u8 log_blocksize)
 {
 	struct page *page;
 	u64 off = (u64)index << PAGE_SHIFT;
diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index 35a2feb6fd68..cbf1253dd14a 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -361,7 +361,8 @@ static int ext4_get_verity_descriptor(struct inode *inode, void *buf,
 
 static struct page *ext4_read_merkle_tree_page(struct inode *inode,
 					       pgoff_t index,
-					       unsigned long num_ra_pages)
+					       unsigned long num_ra_pages,
+					       u8 log_blocksize)
 {
 	struct page *page;
 
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 019c7a6c6bcf..63c6a1b1bdef 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -256,7 +256,8 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
 
 static struct page *f2fs_read_merkle_tree_page(struct inode *inode,
 					       pgoff_t index,
-					       unsigned long num_ra_pages)
+					       unsigned long num_ra_pages,
+					       u8 log_blocksize)
 {
 	struct page *page;
 
diff --git a/fs/verity/read_metadata.c b/fs/verity/read_metadata.c
index cab1612bf4a3..d6cc58c24a2e 100644
--- a/fs/verity/read_metadata.c
+++ b/fs/verity/read_metadata.c
@@ -44,7 +44,8 @@ static int fsverity_read_merkle_tree(struct inode *inode,
 		struct page *page;
 		const void *virt;
 
-		page = vops->read_merkle_tree_page(inode, index, num_ra_pages);
+		page = vops->read_merkle_tree_page(inode, index, num_ra_pages,
+						   vi->tree_params.log_blocksize);
 		if (IS_ERR(page)) {
 			err = PTR_ERR(page);
 			fsverity_err(inode,
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index c2fc4c86af34..9213b1e5ed2c 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -199,7 +199,8 @@ verify_data_block(struct inode *inode, struct fsverity_info *vi,
 
 		hpage = inode->i_sb->s_vop->read_merkle_tree_page(inode,
 				hpage_idx, level == 0 ? min(max_ra_pages,
-					params->tree_pages - hpage_idx) : 0);
+					params->tree_pages - hpage_idx) : 0,
+				params->log_blocksize);
 		if (IS_ERR(hpage)) {
 			err = PTR_ERR(hpage);
 			fsverity_err(inode,
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 3e923a8e0d6f..ad07a1d10fdf 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -103,7 +103,8 @@ struct fsverity_operations {
 	 */
 	struct page *(*read_merkle_tree_page)(struct inode *inode,
 					      pgoff_t index,
-					      unsigned long num_ra_pages);
+					      unsigned long num_ra_pages,
+					      u8 log_blocksize);
 
 	/**
 	 * Write a Merkle tree block to the given inode.
-- 
2.38.4

