Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B15436D6843
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624282;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O6TxF2wDPSZ8VkfH+UnP0K94pMIAUpQJ5kpEzKyPwfU=;
	b=KHPUi6jJDygcX1apWsAUNvwa/cSbtHquRX3Pn6rcy/on/PYMRULegU3kKtSHHX5upbw17c
	0d00pwHAjmQE9qkjvpTXSH20cHy/heHdEUKjLhJKNZJq1xEfDCAinMvqFuHmPzalvp5FGF
	NhY+s6blCnJOd+c7j2lGWore95Qs0EY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-1JIFFA30MrORwSE_cIO_lw-1; Tue, 04 Apr 2023 12:04:16 -0400
X-MC-Unique: 1JIFFA30MrORwSE_cIO_lw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8B823C1068B;
	Tue,  4 Apr 2023 16:02:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CC5892027062;
	Tue,  4 Apr 2023 16:02:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 73A101946A62;
	Tue,  4 Apr 2023 16:02:44 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 26B38194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:56:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 12E5F492C14; Tue,  4 Apr 2023 14:56:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BE89492C13
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:56:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF0E1100DEA9
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:56:01 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-z_dqNoekO8e-8MwbYw608A-1; Tue, 04 Apr 2023 10:56:00 -0400
X-MC-Unique: z_dqNoekO8e-8MwbYw608A-1
Received: by mail-qv1-f71.google.com with SMTP id
 px9-20020a056214050900b005d510cdfc41so14827810qvb.7
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:56:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620160;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O6TxF2wDPSZ8VkfH+UnP0K94pMIAUpQJ5kpEzKyPwfU=;
 b=c8+rD09fmoxd593jQW/QOPm5/zK0UCO38RYfiitnZP+aQrEM5mG2c0jMh/JsrE3xHX
 T+gPCt+r5PyQE0PlxHNvyVSHlNDvrDJRV1cjIRkb79p2fbXrW5skTKSzEEsD7fiNz6NV
 QQ2r6ubvp77C5IlKCHwYyLd9esudBHmtM0kki4hyydU+sFNEN/iShaRPKmUF5v6tFjiM
 7TBufrlAXwvEioC2e6Vin4U2+ScxckxBbK6jXwTI39Jo2TbvLged+ver5/IqgQNe8776
 9RYFx9GG4LcaBbs7GZTApxg4/DL5qDAQpYB05xND4wGVEwQFgQEMQrpva6uA+ymiAcLd
 Ladw==
X-Gm-Message-State: AAQBX9cgBR23ZBjEbdeNNBT1gYxhteZoQPU8B7njFmgGDoLMl3KyzXqk
 7td0PYbmpMw4xTyrsMLwSfkqNBztJxgLv7YTHRCSQYTuii8/TuU8w5E6u74hc7Mk/iRvFgBcS5e
 fP6ukFbfEHsRhZnTgtOm9
X-Received: by 2002:ac8:5b8f:0:b0:3e3:9502:8dfc with SMTP id
 a15-20020ac85b8f000000b003e395028dfcmr4467467qta.9.1680620159966; 
 Tue, 04 Apr 2023 07:55:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350a7eyzBLFAVwLtkZzZp5jojS6UQc2rD1+xfGSjK6d6WcBELJ7jmQgpE+gezZ7mdNPw1AFtdEg==
X-Received: by 2002:ac8:5b8f:0:b0:3e3:9502:8dfc with SMTP id
 a15-20020ac85b8f000000b003e395028dfcmr4467424qta.9.1680620159602; 
 Tue, 04 Apr 2023 07:55:59 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:59 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:19 +0200
Message-Id: <20230404145319.2057051-24-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 23/23] xfs: enable ro-compat fs-verity
 flag
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

Finalize fs-verity integration in XFS by making kernel fs-verity
aware with ro-compat flag.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_format.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index ccb2ae5c2c93..a21612319765 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -355,10 +355,11 @@ xfs_sb_has_compat_feature(
 #define XFS_SB_FEAT_RO_COMPAT_INOBTCNT (1 << 3)		/* inobt block counts */
 #define XFS_SB_FEAT_RO_COMPAT_VERITY   (1 << 4)		/* fs-verity */
 #define XFS_SB_FEAT_RO_COMPAT_ALL \
-		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
-		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
-		 XFS_SB_FEAT_RO_COMPAT_REFLINK| \
-		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
+		(XFS_SB_FEAT_RO_COMPAT_FINOBT  | \
+		 XFS_SB_FEAT_RO_COMPAT_RMAPBT  | \
+		 XFS_SB_FEAT_RO_COMPAT_REFLINK | \
+		 XFS_SB_FEAT_RO_COMPAT_INOBTCNT| \
+		 XFS_SB_FEAT_RO_COMPAT_VERITY)
 #define XFS_SB_FEAT_RO_COMPAT_UNKNOWN	~XFS_SB_FEAT_RO_COMPAT_ALL
 static inline bool
 xfs_sb_has_ro_compat_feature(
-- 
2.38.4

