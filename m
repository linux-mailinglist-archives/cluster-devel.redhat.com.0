Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0066D6833
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624231;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1DCV/M5yyrM1g1B6cxt9ZQ7HQFDQ1socxlG7tzRHhCM=;
	b=Vpy+IcLEY+zCzO4b2d7GX7pmknu9gJzM543yekBNtQra3ad5ZZsRN4LZT+rcww+prrAFNQ
	s8ssv4yLCTqx5di8a35BRvEckkbfgSDOoJF/yWDeAJtDtoV7OM026vc9Mwo9hr31Wr/yq8
	MdoKaXZpuUEpgb8ZphtSGbGaQ7VTj1E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-wNFNrJ4kPuOME7XSD0snTg-1; Tue, 04 Apr 2023 12:03:45 -0400
X-MC-Unique: wNFNrJ4kPuOME7XSD0snTg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D6968996E0;
	Tue,  4 Apr 2023 16:02:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0A802027061;
	Tue,  4 Apr 2023 16:02:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E004F1946A62;
	Tue,  4 Apr 2023 16:02:33 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9F66F19465B1 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:55:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CF6031415117; Tue,  4 Apr 2023 14:55:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8296140EBF4
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AAA2D28237E3
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:17 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-Ot-h4Xi9N4Cxw1VlpyIgJQ-1; Tue, 04 Apr 2023 10:55:16 -0400
X-MC-Unique: Ot-h4Xi9N4Cxw1VlpyIgJQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 m7-20020a05622a118700b003e4e203bc30so19944509qtk.7
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1DCV/M5yyrM1g1B6cxt9ZQ7HQFDQ1socxlG7tzRHhCM=;
 b=50JUOOr6qge6k6rLy73IjwjdIL0AD5YVx/H02gDmeI4AEMlMcNrLYTiZxhceTQGoEY
 xLN8o7wzorLB795czW5JCn+1RoamAzrynw89T5FEoIxucHDAI/ylStxAFZlCWFjbos1W
 SllvbY+qNh0WDIb7sj4YDveUbpG5z8kLtinaaMfqLboDmTKZ+/meISsxJZzDOyqoSPH+
 N2PDIDuvSf2FKWW5fSOul1/FavfGcjW2njkkSUKmS+xRw7H31O5UxPcfMBJWjYqcVocC
 EjUVmLIoPuGk9n7T3xPYakiaBI4+YbPYN4zJZ3zl58peTDTSYieggka0TkaBUEp6a+Ld
 og2g==
X-Gm-Message-State: AAQBX9dYzT2FAOBU/xKFUIORpCPrSgDU035VKvkwO+arzrzt0EfK/6DY
 dNjeSIHRGyCkovA5nkCTVRe8CMxklM1eXkJ/S7tFB0RjTGFB9T+X29fgmtV0UK3/AkP26u5K9rl
 0MTeLbv3fuD+Wp4zfywtS
X-Received: by 2002:a05:622a:1002:b0:3e3:8ebe:ce17 with SMTP id
 d2-20020a05622a100200b003e38ebece17mr3401476qte.43.1680620115382; 
 Tue, 04 Apr 2023 07:55:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZeTsqSdwXkQooxtkxa5UspUTLXqFsUhIKZ9BZk1HmO99VPevTQAHz0NwCmfjyQvtO6XB3OTQ==
X-Received: by 2002:a05:622a:1002:b0:3e3:8ebe:ce17 with SMTP id
 d2-20020a05622a100200b003e38ebece17mr3401445qte.43.1680620115062; 
 Tue, 04 Apr 2023 07:55:15 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:14 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:06 +0200
Message-Id: <20230404145319.2057051-11-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 10/23] xfs: add XBF_VERITY_CHECKED
 xfs_buf flag
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

The meaning of the flag is that value of the extended attribute in
the buffer was verified. The underlying pages have PageChecked() ==
false (the way fs-verity identifies verified pages), as page content
will be copied out to newly allocated pages in further patches.

The flag is being used later to SetPageChecked() on pages handed to
the fs-verity.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_buf.h | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index 549c60942208..8cc86fed962b 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -24,14 +24,15 @@ struct xfs_buf;
 
 #define XFS_BUF_DADDR_NULL	((xfs_daddr_t) (-1LL))
 
-#define XBF_READ	 (1u << 0) /* buffer intended for reading from device */
-#define XBF_WRITE	 (1u << 1) /* buffer intended for writing to device */
-#define XBF_READ_AHEAD	 (1u << 2) /* asynchronous read-ahead */
-#define XBF_NO_IOACCT	 (1u << 3) /* bypass I/O accounting (non-LRU bufs) */
-#define XBF_ASYNC	 (1u << 4) /* initiator will not wait for completion */
-#define XBF_DONE	 (1u << 5) /* all pages in the buffer uptodate */
-#define XBF_STALE	 (1u << 6) /* buffer has been staled, do not find it */
-#define XBF_WRITE_FAIL	 (1u << 7) /* async writes have failed on this buffer */
+#define XBF_READ		(1u << 0) /* buffer intended for reading from device */
+#define XBF_WRITE		(1u << 1) /* buffer intended for writing to device */
+#define XBF_READ_AHEAD		(1u << 2) /* asynchronous read-ahead */
+#define XBF_NO_IOACCT		(1u << 3) /* bypass I/O accounting (non-LRU bufs) */
+#define XBF_ASYNC		(1u << 4) /* initiator will not wait for completion */
+#define XBF_DONE		(1u << 5) /* all pages in the buffer uptodate */
+#define XBF_STALE		(1u << 6) /* buffer has been staled, do not find it */
+#define XBF_WRITE_FAIL		(1u << 7) /* async writes have failed on this buffer */
+#define XBF_VERITY_CHECKED	(1u << 8) /* buffer was verified by fs-verity*/
 
 /* buffer type flags for write callbacks */
 #define _XBF_INODES	 (1u << 16)/* inode buffer */
-- 
2.38.4

