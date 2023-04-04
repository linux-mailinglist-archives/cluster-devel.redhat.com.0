Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EBD6D684C
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624295;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WW1Er4PupDb0BosAfd03U+k3CW0R0JjVRop2pX5rde0=;
	b=L8JUEZR+UQ819whYvf3IV6p1lOTM9rtwcuSM3mSGJYEasUal2nAk6yDSBAi20sENBbhwa1
	JagiWrLOJUf6tH548qWPa3P0gXq2F757wrGzAL2piu0kJuPxUaV0VRXKqbgaasq4XvGOab
	yh59pnsI/s0hVGMi0T4HfeZEgZtz4eQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-xKB0UCExO-W98g-hDdMTug-1; Tue, 04 Apr 2023 12:04:24 -0400
X-MC-Unique: xKB0UCExO-W98g-hDdMTug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0C5685542D;
	Tue,  4 Apr 2023 16:02:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A551F2027063;
	Tue,  4 Apr 2023 16:02:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C05BB19472EE;
	Tue,  4 Apr 2023 16:02:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C1079194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:55:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B25461121315; Tue,  4 Apr 2023 14:55:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB8D41121314
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C8E228237C9
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:50 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-Pat8DI7UNpizeNjYXgMX-Q-1; Tue, 04 Apr 2023 10:55:45 -0400
X-MC-Unique: Pat8DI7UNpizeNjYXgMX-Q-1
Received: by mail-qt1-f197.google.com with SMTP id
 e4-20020a05622a110400b003e4e915a164so17890794qty.4
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WW1Er4PupDb0BosAfd03U+k3CW0R0JjVRop2pX5rde0=;
 b=bDIbre+dai/9SjEGJQhK4Wpj6CKjj7nuxVwqp0CZOSNn75jVEDh8bcwE26RxtGY3YD
 7NVlYkWMW00XFPh2V5sJw6QpOO1r+2MM+XoRTkPkZPz4utN331wTCTfEbenTYQSU1gVO
 MDKlHvy+tje2Kv3fych5HuR2UBRcxDZt9GzDO2fpMEQY27vQ4dG9Zw75GuilfjRaNb2o
 4ek8+eiTCtrNHZXG0BR+cXFIRXG/cmo06r63FwBW17tjIvHt16dlTmksjimZD26jcSNj
 SY2104eteQQct/pwSREV/uv/KUjoEP1sj6Ifrp1Kj57IyGKHkFf+alHNAWfDpb2zEUMi
 Putg==
X-Gm-Message-State: AAQBX9dcXXZwSDVRND5UiuyxQEYXJS8/vX5UTsncvWxkwJFvh5HyA+Zb
 vY47pIJtkkd3JqEnrtvOcUfoKctUcGaCBpOqptQD++XCBHw9yT3X8J4BtN1twpM+F52Pq9dae2n
 k7+r32KJP8BgDpe0/VIgm
X-Received: by 2002:ac8:5c84:0:b0:3bf:da69:8f74 with SMTP id
 r4-20020ac85c84000000b003bfda698f74mr3767036qta.39.1680620144621; 
 Tue, 04 Apr 2023 07:55:44 -0700 (PDT)
X-Google-Smtp-Source: AKy350aLDs2V7JY0pZuUB09/Ptq0L7v7I2lb1rRcVAQ1NVCDKigQ1vtszHxXzaOscw9+3+n++r92jw==
X-Received: by 2002:ac8:5c84:0:b0:3bf:da69:8f74 with SMTP id
 r4-20020ac85c84000000b003bfda698f74mr3766987qta.39.1680620144232; 
 Tue, 04 Apr 2023 07:55:44 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:43 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:15 +0200
Message-Id: <20230404145319.2057051-20-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 19/23] xfs: disable direct read path for
 fs-verity sealed files
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

The direct path is not supported on verity files. Attempts to use direct
I/O path on such files should fall back to buffered I/O path.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_file.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 947b5c436172..9e072e82f6c1 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -244,7 +244,8 @@ xfs_file_dax_read(
 	struct kiocb		*iocb,
 	struct iov_iter		*to)
 {
-	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
+	struct inode		*inode = iocb->ki_filp->f_mapping->host;
+	struct xfs_inode	*ip = XFS_I(inode);
 	ssize_t			ret = 0;
 
 	trace_xfs_file_dax_read(iocb, to);
@@ -297,10 +298,17 @@ xfs_file_read_iter(
 
 	if (IS_DAX(inode))
 		ret = xfs_file_dax_read(iocb, to);
-	else if (iocb->ki_flags & IOCB_DIRECT)
+	else if (iocb->ki_flags & IOCB_DIRECT && !fsverity_active(inode))
 		ret = xfs_file_dio_read(iocb, to);
-	else
+	else {
+		/*
+		 * In case fs-verity is enabled, we also fallback to the
+		 * buffered read from the direct read path. Therefore,
+		 * IOCB_DIRECT is set and need to be cleared
+		 */
+		iocb->ki_flags &= ~IOCB_DIRECT;
 		ret = xfs_file_buffered_read(iocb, to);
+	}
 
 	if (ret > 0)
 		XFS_STATS_ADD(mp, xs_read_bytes, ret);
-- 
2.38.4

