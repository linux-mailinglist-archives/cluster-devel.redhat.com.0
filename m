Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A056AA9D1
	for <lists+cluster-devel@lfdr.de>; Sat,  4 Mar 2023 14:26:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677936410;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=o+BfPKfMV9FPE8I8DD3zBXj28xwofcn4hyxEYIowXkA=;
	b=WW3Soo57dNIsSHg2fRgvSZk1nRsnfqEvdhqoEzpOf+N7R3DJsSKvOKxHtYWseqxV/EKTLT
	1BpXFUrGFscjHYex4F2+ZenwfiidSUubRl2xzNSK7Gi38XCy13iMoPyR6Z7PTSOhhs/70P
	LZJM4BSSneKsluAvYW3AtrqjUQq9oAE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-VKu3KY-VMOO-fYyaDmZ2wQ-1; Sat, 04 Mar 2023 08:26:47 -0500
X-MC-Unique: VKu3KY-VMOO-fYyaDmZ2wQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91909101A521;
	Sat,  4 Mar 2023 13:26:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6093840C83B6;
	Sat,  4 Mar 2023 13:26:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 83D0219452CD;
	Sat,  4 Mar 2023 13:26:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DAB7019466DF for <cluster-devel@listman.corp.redhat.com>;
 Sat,  4 Mar 2023 13:26:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6D71D440DF; Sat,  4 Mar 2023 13:26:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6635635453
 for <cluster-devel@redhat.com>; Sat,  4 Mar 2023 13:26:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4730B3806735
 for <cluster-devel@redhat.com>; Sat,  4 Mar 2023 13:26:30 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-YAIVgqjjOh-HeBFsVnNLkg-1; Sat, 04 Mar 2023 08:26:29 -0500
X-MC-Unique: YAIVgqjjOh-HeBFsVnNLkg-1
Received: by mail-qv1-f69.google.com with SMTP id
 e9-20020a0cf749000000b00571f1377451so3062233qvo.2
 for <cluster-devel@redhat.com>; Sat, 04 Mar 2023 05:26:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677936388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o+BfPKfMV9FPE8I8DD3zBXj28xwofcn4hyxEYIowXkA=;
 b=sPByBRNBLreBB7tHvz5n/E1tu5aR02/yTOIOZQ7nxgxCODHzcEQhzlnSE400gRUBm5
 BAdB+WXd6aq6RytvLDEIpTVzbp6S4oIu2qqB1EoKNUePeg1YlJtEEbuREmdbOmpBk2JL
 2QfxG60zXHG5W8j1KNMMZlHb7GvSFRLL00UtSkYQ91DsEJfz4pz1CjRSXknf+xqQlPSt
 6vQ1xkm8FyLQAxVmcmKSgVfzLt0C8ZGHTbiJ5N8W0/fvz/ZcO/eKiT1Ib+Sm3reIp4DE
 69OVQiUkKzuO+aRqk6wAFOVeo7pFw7CcOpIYXNHI29GMhPfEX/JzlY81QC2HmrMU+y2y
 ZB6g==
X-Gm-Message-State: AO0yUKXZqbnK2Mokln41DOxfi763jtelzzP6pQNkPydMxjVXO7qaetcb
 wQ3Te+NfCK8iVBlnQu2wuo7+m/Lw8lySw86HMl49CC/8nfjWWoBiD5eEzf/k0Tplirt398eA/t6
 OW/motwGFCtzQxtxvkAl98g==
X-Received: by 2002:ac8:5c16:0:b0:3bf:d237:b12a with SMTP id
 i22-20020ac85c16000000b003bfd237b12amr5893379qti.56.1677936388622; 
 Sat, 04 Mar 2023 05:26:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/YbLpDQrN0mdiFLKbZlCfgTpafc0LpGjIXy2E6eFPSzph2ZgM4mRiQsUVLhhdqACgAq9bG7g==
X-Received: by 2002:ac8:5c16:0:b0:3bf:d237:b12a with SMTP id
 i22-20020ac85c16000000b003bfd237b12amr5893361qti.56.1677936388354; 
 Sat, 04 Mar 2023 05:26:28 -0800 (PST)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 d82-20020a376855000000b007419eb86df0sm3721036qkc.127.2023.03.04.05.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Mar 2023 05:26:27 -0800 (PST)
From: Tom Rix <trix@redhat.com>
To: rpeterso@redhat.com,
	agruenba@redhat.com
Date: Sat,  4 Mar 2023 08:26:25 -0500
Message-Id: <20230304132625.1936034-1-trix@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH] gfs2: remove extern from
 free_local_statfs_inodes and find_local_statfs_inode
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
Cc: cluster-devel@redhat.com, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

smatch reports
fs/gfs2/super.c:1477:13: warning: function 'free_local_statfs_inodes' with external linkage has definition
fs/gfs2/super.c:1492:21: warning: function 'find_local_statfs_inode' with external linkage has definition

extern is only needed in a declaration, so remove them.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/gfs2/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index a83fa62106f0..189d7f7a4548 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1474,7 +1474,7 @@ static void gfs2_free_inode(struct inode *inode)
 	kmem_cache_free(gfs2_inode_cachep, GFS2_I(inode));
 }
 
-extern void free_local_statfs_inodes(struct gfs2_sbd *sdp)
+void free_local_statfs_inodes(struct gfs2_sbd *sdp)
 {
 	struct local_statfs_inode *lsi, *safe;
 
@@ -1489,8 +1489,8 @@ extern void free_local_statfs_inodes(struct gfs2_sbd *sdp)
 	}
 }
 
-extern struct inode *find_local_statfs_inode(struct gfs2_sbd *sdp,
-					     unsigned int index)
+struct inode *find_local_statfs_inode(struct gfs2_sbd *sdp,
+				      unsigned int index)
 {
 	struct local_statfs_inode *lsi;
 
-- 
2.27.0

