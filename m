Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0961D6D6838
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yhiCGxChrVJlRUkYdDGuEzFvZQCsRtVvsPA45L+6JnY=;
	b=gb8WE+pxANgg+FdLuN8pbbFfsbJ3BSiQaWvsD4TGLEyCWD5N+mIftW+WyCtt9oGUONyyc/
	0V+7OVlavsIRinZ9mEYN1vLlu8PfZSHjee+8Kys7WSWLnW8u4dqimVaoovLMhRJyqt8B3I
	rEtIX/jbZz6qN16KQD4JhgXWEC+PRF8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-nzHdS4LeODid0irKZXIVJw-1; Tue, 04 Apr 2023 12:03:38 -0400
X-MC-Unique: nzHdS4LeODid0irKZXIVJw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBAF3101A531;
	Tue,  4 Apr 2023 16:02:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C05F22027061;
	Tue,  4 Apr 2023 16:02:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 71B7D1946A70;
	Tue,  4 Apr 2023 16:02:37 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5A461194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:55:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5011A440D6; Tue,  4 Apr 2023 14:55:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 492DB440BC
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E5593C0ED65
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:39 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-260-xusSZMtUNMCjj9SLBoxPFw-1; Tue, 04 Apr 2023 10:55:37 -0400
X-MC-Unique: xusSZMtUNMCjj9SLBoxPFw-1
Received: by mail-qk1-f197.google.com with SMTP id
 s21-20020a05620a0bd500b0074234f33f24so14662166qki.3
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620137;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yhiCGxChrVJlRUkYdDGuEzFvZQCsRtVvsPA45L+6JnY=;
 b=fd75X/G3Lz1B7FdFNgzJkAXr6rUPsZLvzN4frIGNvRg8Z0pWyNnlBKQCBIrAKidM0W
 gPuemJUcZU9KJgJzs7/GX3WdWacYhqBCgqFvt7yqDSK6UvIR8punU9BTxVp+dHD8yqRO
 X9nWr1iLgm6rGwIUDBpyrsstlPsrSZT0qT1sf1WmVbj8E1XunjMs5Nxh7jrqJL5SdOVe
 orOzGiaHZLBfa+F2/2enllKMG+xiNCmQta+aLA9jl+lb8T7symNtxJ8KJqnbE5fFpyR3
 Ew6hyi48BVHC3kCe+LSAXVRglsFTXPvczVtiPbxVeXWt/qBGp2FQ9/XVl8haMNfdH1kG
 AqqQ==
X-Gm-Message-State: AAQBX9ftiOjJKFlDWBXaI7wKne/GuHATa/n74BZUK22vYaN4Ly2F7qWi
 NOwMuZ/VPBycwsXdX9p6LxGkf1AQaiKIAH/9mu/kp1jKTc5roEmKQ6DEfBny5poUfUF26D7rU5e
 d+J96AlNJ1URa3i1YJhqP
X-Received: by 2002:a05:6214:f05:b0:571:13c:6806 with SMTP id
 gw5-20020a0562140f0500b00571013c6806mr3972707qvb.33.1680620137279; 
 Tue, 04 Apr 2023 07:55:37 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z8MfugNU6YKVlXuq75L3kQ3utmgGFoqTKtMHqOCvYgrWH2c48gYF9y20EeEoB2IWzu0Fdckw==
X-Received: by 2002:a05:6214:f05:b0:571:13c:6806 with SMTP id
 gw5-20020a0562140f0500b00571013c6806mr3972665qvb.33.1680620136915; 
 Tue, 04 Apr 2023 07:55:36 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:36 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:13 +0200
Message-Id: <20230404145319.2057051-18-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 17/23] xfs: initialize fs-verity on file
 open and cleanup on inode destruction
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

fs-verity will read and attach metadata (not the tree itself) from
a disk for those inodes which already have fs-verity enabled.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_file.c  | 8 ++++++++
 fs/xfs/xfs_super.c | 2 ++
 2 files changed, 10 insertions(+)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 705250f9f90a..947b5c436172 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -31,6 +31,7 @@
 #include <linux/mman.h>
 #include <linux/fadvise.h>
 #include <linux/mount.h>
+#include <linux/fsverity.h>
 
 static const struct vm_operations_struct xfs_file_vm_ops;
 
@@ -1169,9 +1170,16 @@ xfs_file_open(
 	struct inode	*inode,
 	struct file	*file)
 {
+	int		error = 0;
+
 	if (xfs_is_shutdown(XFS_M(inode->i_sb)))
 		return -EIO;
 	file->f_mode |= FMODE_NOWAIT | FMODE_BUF_RASYNC | FMODE_BUF_WASYNC;
+
+	error = fsverity_file_open(inode, file);
+	if (error)
+		return error;
+
 	return generic_file_open(inode, file);
 }
 
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index d6f22cb94ee2..d40de32362b1 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -46,6 +46,7 @@
 #include <linux/magic.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/fsverity.h>
 
 static const struct super_operations xfs_super_operations;
 
@@ -667,6 +668,7 @@ xfs_fs_destroy_inode(
 	ASSERT(!rwsem_is_locked(&inode->i_rwsem));
 	XFS_STATS_INC(ip->i_mount, vn_rele);
 	XFS_STATS_INC(ip->i_mount, vn_remove);
+	fsverity_cleanup_inode(inode);
 	xfs_inode_mark_reclaimable(ip);
 }
 
-- 
2.38.4

