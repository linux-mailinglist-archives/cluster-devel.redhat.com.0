Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A69756D684B
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:04:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624295;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FFUi+70wiITyeuozy7B4Yd/jMxRAxWPn5c55TeHG694=;
	b=VoA43bKf6NDKFX1IbQFggQ4AxNi3P8+D4Bstbnvc/VNkOYxF7zWetMW7C6QHib4wX9L2ZP
	xpieo5O6NxnW+ogKZJSKgmTMXU/IXo2CbQnmOqFsE1pJDCcOVno7grW+7bBXLbGtJcOxpy
	M/HZoCNIevunsWD3ZRJ7k4zwm+JDF28=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-hZwMpXVuPCaFpS3vqmurdA-1; Tue, 04 Apr 2023 12:04:25 -0400
X-MC-Unique: hZwMpXVuPCaFpS3vqmurdA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBD728D1396;
	Tue,  4 Apr 2023 16:02:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E12A1C1602A;
	Tue,  4 Apr 2023 16:02:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 416F619472D6;
	Tue,  4 Apr 2023 16:02:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 81718194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:55:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 727012166B2A; Tue,  4 Apr 2023 14:55:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B19E2166B26
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4AADE8996EB
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:44 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-501-9JU8HVeWNRSctDpXDgwmKQ-1; Tue, 04 Apr 2023 10:55:42 -0400
X-MC-Unique: 9JU8HVeWNRSctDpXDgwmKQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 t15-20020a05622a180f00b003e37dd114e3so22257003qtc.10
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FFUi+70wiITyeuozy7B4Yd/jMxRAxWPn5c55TeHG694=;
 b=5B0JebPe3Ei3iK2dXfDL17QUqCXfOY6C4W9rnLObfO0E3y/2swjqYHRQlqPj3PwSMe
 JA9OICIIRTcvuHhlpVov6ATjQdAN9DGYDK66P6yBz5m2IQ03bMRXkAIzSj8rYAaiWaOR
 7YkJOQsQ+RIs549G/Oj3xzfmQsV8w2S0v9EpbnFIAJWsgBI0Qlw2iSMZfE/UaMqQzS7A
 awZXHz35ABJzTlivgCMbL3PPbAyGOSlGGRR1ii9dWmQtSohhTGb2jvl2F47IwenMCZj2
 tMT4gNxwo8XeEh6qPtroEKWTtydEcQixmnl+ej4J2Hm16zqsnrWVICH+0JVG8Ioy0ORf
 Mpng==
X-Gm-Message-State: AAQBX9eJx/RRKIEj6S2aS7EtpaMr1s0250Dkwqd5eI7NeMcnInE26aQT
 KgDyEbdZrVedBTf9LDOeOD3HNcpfAUt8P+5tJzGiYiibJdQon8wwcnpmkve6gIj3NRaErXya88d
 QQUWcjgRPSW3CKcemuo9J
X-Received: by 2002:a05:622a:199f:b0:3e3:913c:1ca8 with SMTP id
 u31-20020a05622a199f00b003e3913c1ca8mr4130762qtc.22.1680620140417; 
 Tue, 04 Apr 2023 07:55:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350Zzc10/1v2LcCE0zfPnbg3x+8dh54gKx1zJb5SpW17zpBOCvtCa2VKQbBuo0E40V5nvMeZ6aQ==
X-Received: by 2002:a05:622a:199f:b0:3e3:913c:1ca8 with SMTP id
 u31-20020a05622a199f00b003e3913c1ca8mr4130703qtc.22.1680620139945; 
 Tue, 04 Apr 2023 07:55:39 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:55:39 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:14 +0200
Message-Id: <20230404145319.2057051-19-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 18/23] xfs: don't allow to enable DAX on
 fs-verity sealsed inode
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

fs-verity doesn't support DAX. Forbid filesystem to enable DAX on
inodes which already have fs-verity enabled. The opposite is checked
when fs-verity is enabled, it won't be enabled if DAX is.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 fs/xfs/xfs_iops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 5398be75a76a..e0d7107a9ba1 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1204,6 +1204,8 @@ xfs_inode_should_enable_dax(
 		return false;
 	if (!xfs_inode_supports_dax(ip))
 		return false;
+	if (ip->i_diflags2 & XFS_DIFLAG2_VERITY)
+		return false;
 	if (xfs_has_dax_always(ip->i_mount))
 		return true;
 	if (ip->i_diflags2 & XFS_DIFLAG2_DAX)
-- 
2.38.4

