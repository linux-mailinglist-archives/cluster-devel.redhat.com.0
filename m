Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9F96D6847
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VcQmWR+9Y5ByK+ATZGapbO5pnH99zCU6qprkC/Vu/Vo=;
	b=dKAuRuxKi8p3rlnJCHM2BR6EEL1bPg/bFq/94xR48a8SG6voVxzpqjZ01570GT/ibfPFou
	EQIY9skkpKN/TKBITI1AGpraQiBScYuRos1elWRFpvyaGAXMaCY8v+SgVfbz+RAC7L1xlh
	aGKwQ3Dz8kjAT7LDHkkjtKmR9SpFqeQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-VTenEHHVPd67I5It-jHS9Q-1; Tue, 04 Apr 2023 12:04:21 -0400
X-MC-Unique: VTenEHHVPd67I5It-jHS9Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E39D18A64E0;
	Tue,  4 Apr 2023 16:02:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D2292027062;
	Tue,  4 Apr 2023 16:02:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2AEE119472C5;
	Tue,  4 Apr 2023 16:02:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 20BE6194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:55:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0478A2166B29; Tue,  4 Apr 2023 14:55:35 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F164A2166B26
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5F1F100DEB3
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:34 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-YSXuDbIRNhKCsSGohxB8DA-1; Tue, 04 Apr 2023 10:55:31 -0400
X-MC-Unique: YSXuDbIRNhKCsSGohxB8DA-1
Received: by mail-qv1-f71.google.com with SMTP id
 v8-20020a0ccd88000000b005c1927d1609so14635065qvm.12
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620130;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VcQmWR+9Y5ByK+ATZGapbO5pnH99zCU6qprkC/Vu/Vo=;
 b=OFrlOd5BvcasBZXUdJC/oj830Xwum+anLItWU2w2NXuGPaS3r1nb4vX9Ykrvl8WS1M
 v2SIVqzZQp2J9xCzM2h4UP70ZtO6ZEQAK41DoT/zfug3iMO902VLfbI/EHkDGbQUY5rb
 xJpSMMV03sFQ1WgBoZq9+Ld4VPfh/JpApp0F9mnjyq5C0Kl1jr6+6qGe2HQwn2p8z6p2
 oWeYMWyRsb9FMNH3Z7YuKRNEk6h010vW1I9SmkwSMhHhOrN3i4iduL36wNLGinASjFm0
 v7C6zhU945aUly0+YUJqtu018Vm9oZSUMKSK2R3tSn9agGGPBueDVp7Pmqhql99jYbB2
 WTvA==
X-Gm-Message-State: AAQBX9cTi0QcBnGh+z4nAbtDWNYCY3W4MDuqa0/xaBq2JAluYwSDvK0q
 aojg52bkGHeInKNZS+zuA0IgtvKwF6e11ECQjZK4Jv04iguFlmiHxqPEIM/YXvDZ1fiCsK6SYpJ
 EX9lo9Bufw6CgY0u6Gz4S
X-Received: by 2002:ac8:7e96:0:b0:3e6:3c76:84c4 with SMTP id
 w22-20020ac87e96000000b003e63c7684c4mr4113053qtj.42.1680620130424; 
 Tue, 04 Apr 2023 07:55:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zr2rxw/Z5UAEkY/x+zomx2LR8SpENS3uogBfhkrXJlt+UiOQV8XzWD8t3/6Y5inpxjlQNwhw==
X-Received: by 2002:ac8:7e96:0:b0:3e6:3c76:84c4 with SMTP id
 w22-20020ac87e96000000b003e63c7684c4mr4113018qtj.42.1680620130035; 
 Tue, 04 Apr 2023 07:55:30 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:29 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:11 +0200
Message-Id: <20230404145319.2057051-16-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 15/23] xfs: add fs-verity ro-compat flag
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

To mark inodes sealed with fs-verity the new XFS_DIFLAG2_VERITY flag
will be added in further patch. This requires ro-compat flag to let
older kernels know that fs with fs-verity can not be modified.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/libxfs/xfs_format.h | 1 +
 fs/xfs/libxfs/xfs_sb.c     | 2 ++
 fs/xfs/xfs_mount.h         | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/fs/xfs/libxfs/xfs_format.h b/fs/xfs/libxfs/xfs_format.h
index 371dc07233e0..ef617be2839c 100644
--- a/fs/xfs/libxfs/xfs_format.h
+++ b/fs/xfs/libxfs/xfs_format.h
@@ -353,6 +353,7 @@ xfs_sb_has_compat_feature(
 #define XFS_SB_FEAT_RO_COMPAT_RMAPBT   (1 << 1)		/* reverse map btree */
 #define XFS_SB_FEAT_RO_COMPAT_REFLINK  (1 << 2)		/* reflinked files */
 #define XFS_SB_FEAT_RO_COMPAT_INOBTCNT (1 << 3)		/* inobt block counts */
+#define XFS_SB_FEAT_RO_COMPAT_VERITY   (1 << 4)		/* fs-verity */
 #define XFS_SB_FEAT_RO_COMPAT_ALL \
 		(XFS_SB_FEAT_RO_COMPAT_FINOBT | \
 		 XFS_SB_FEAT_RO_COMPAT_RMAPBT | \
diff --git a/fs/xfs/libxfs/xfs_sb.c b/fs/xfs/libxfs/xfs_sb.c
index 99cc03a298e2..b1f1b21e8953 100644
--- a/fs/xfs/libxfs/xfs_sb.c
+++ b/fs/xfs/libxfs/xfs_sb.c
@@ -161,6 +161,8 @@ xfs_sb_version_to_features(
 		features |= XFS_FEAT_REFLINK;
 	if (sbp->sb_features_ro_compat & XFS_SB_FEAT_RO_COMPAT_INOBTCNT)
 		features |= XFS_FEAT_INOBTCNT;
+	if (sbp->sb_features_ro_compat & XFS_SB_FEAT_RO_COMPAT_VERITY)
+		features |= XFS_FEAT_VERITY;
 	if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_FTYPE)
 		features |= XFS_FEAT_FTYPE;
 	if (sbp->sb_features_incompat & XFS_SB_FEAT_INCOMPAT_SPINODES)
diff --git a/fs/xfs/xfs_mount.h b/fs/xfs/xfs_mount.h
index 53a4a9304937..9254c3cd9077 100644
--- a/fs/xfs/xfs_mount.h
+++ b/fs/xfs/xfs_mount.h
@@ -279,6 +279,7 @@ typedef struct xfs_mount {
 #define XFS_FEAT_BIGTIME	(1ULL << 24)	/* large timestamps */
 #define XFS_FEAT_NEEDSREPAIR	(1ULL << 25)	/* needs xfs_repair */
 #define XFS_FEAT_NREXT64	(1ULL << 26)	/* large extent counters */
+#define XFS_FEAT_VERITY		(1ULL << 27)	/* fs-verity */
 
 /* Mount features */
 #define XFS_FEAT_NOATTR2	(1ULL << 48)	/* disable attr2 creation */
@@ -342,6 +343,7 @@ __XFS_HAS_FEAT(inobtcounts, INOBTCNT)
 __XFS_HAS_FEAT(bigtime, BIGTIME)
 __XFS_HAS_FEAT(needsrepair, NEEDSREPAIR)
 __XFS_HAS_FEAT(large_extent_counts, NREXT64)
+__XFS_HAS_FEAT(verity, VERITY)
 
 /*
  * Mount features
-- 
2.38.4

