Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8446D684D
	for <lists+cluster-devel@lfdr.de>; Tue,  4 Apr 2023 18:05:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680624302;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I6je06aEmhF92s7sMY7DVi3uR44iZ0FPA/bMk0qTbjY=;
	b=BrIMY8RLbKWqAmjuuq975g/xVmECpe4BI0N8Qg4DdxV5SeYwjB8EE68A3uBECdnsseq1lV
	yHaayQXtFJWAAq1M9rGV2mp2Y79bhsYmiz1+Xc0LcLsi7McmgnHbHf63I0kxm8lYchwyx5
	iSrWj6cVmR8rasNlfpaDxgLLchw1dA0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-o7rPuPjKOvqBcrVWWxcbTA-1; Tue, 04 Apr 2023 12:04:51 -0400
X-MC-Unique: o7rPuPjKOvqBcrVWWxcbTA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8019F8D13AC;
	Tue,  4 Apr 2023 16:02:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7594DFD6E;
	Tue,  4 Apr 2023 16:02:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B79C419459FC;
	Tue,  4 Apr 2023 16:02:42 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A5DBE1946A48 for <cluster-devel@listman.corp.redhat.com>;
 Tue,  4 Apr 2023 14:55:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8ED19C1602C; Tue,  4 Apr 2023 14:55:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88186C1602A
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C815100DEB5
 for <cluster-devel@redhat.com>; Tue,  4 Apr 2023 14:55:04 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-2iJl9dm2MRumO27W988xCg-1; Tue, 04 Apr 2023 10:55:02 -0400
X-MC-Unique: 2iJl9dm2MRumO27W988xCg-1
Received: by mail-qk1-f200.google.com with SMTP id
 s190-20020ae9dec7000000b00746b7fae197so3535771qkf.12
 for <cluster-devel@redhat.com>; Tue, 04 Apr 2023 07:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I6je06aEmhF92s7sMY7DVi3uR44iZ0FPA/bMk0qTbjY=;
 b=5e3lExE5UtXhK4BYfUEAz+nTGFN2slvLN3Y08AeB1MY6G3RK5ZgwOcEPooxQ17wEbp
 vbmRy8qYuoYoBXHyTMDoHqH4VXH3QpwOsfDbCQbxsi85r4Iwa+lt+2gjdVDUhNyaJcsL
 9xf0UTYzws8b/k3OYcQ/yDzydn/NGkLe+IHJQjj3ObYw7CQVFHp2g7rNugYrRdL2nKGW
 HJPdUgrINXf5BtD5rla57R1PTJJEPLhduwLOET4JsDgQM2K0a8oW7ocBzWzl+ypdQmw0
 mK5tOIz4CZOQsCzyocJcLxDPIPSNoUM+tELytg+GTSvxP6ZadUBXH5l2XiGngximJXRg
 BsyQ==
X-Gm-Message-State: AAQBX9d9pvHyGTUHDOf+Ky8mjErBpA7/SX95kcQaxX4JkciN1MeLbKqe
 Npdc+vx6tRIvcndcmsN54DY5XlkqQFWsMDUe2mV8i8D1gFFEqN3oPeVDFpz+LW/EeV5AADofMd+
 roEf0DDm5QyYOuTn9rriQ
X-Received: by 2002:a05:622a:189e:b0:3bc:dd21:4a0 with SMTP id
 v30-20020a05622a189e00b003bcdd2104a0mr3575654qtc.30.1680620099211; 
 Tue, 04 Apr 2023 07:54:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350ba/Mx2sYrhvQuuxEbUABini+6j6yzJy9T6p4OPPcKlZcS6dLVBbS/lM0x+VENbSuVT7xiskA==
X-Received: by 2002:a05:622a:189e:b0:3bc:dd21:4a0 with SMTP id
 v30-20020a05622a189e00b003bcdd2104a0mr3575618qtc.30.1680620098846; 
 Tue, 04 Apr 2023 07:54:58 -0700 (PDT)
Received: from aalbersh.remote.csb ([109.183.6.197])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac86644000000b003e6387431dcsm3296539qtp.7.2023.04.04.07.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:54:58 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: djwong@kernel.org, dchinner@redhat.com, ebiggers@kernel.org,
 hch@infradead.org, linux-xfs@vger.kernel.org, fsverity@lists.linux.dev
Date: Tue,  4 Apr 2023 16:53:01 +0200
Message-Id: <20230404145319.2057051-6-aalbersh@redhat.com>
In-Reply-To: <20230404145319.2057051-1-aalbersh@redhat.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Tue, 04 Apr 2023 16:02:32 +0000
Subject: [Cluster-devel] [PATCH v2 05/23] fsverity: make
 fsverity_verify_folio() accept folio's offset and size
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Not the whole folio always need to be verified by fs-verity (e.g.
with 1k blocks). Use passed folio's offset and size.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 include/linux/fsverity.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 119a3266791f..6d7a4b3ea626 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -249,9 +249,10 @@ static inline void fsverity_enqueue_verify_work(struct work_struct *work)
 
 #endif	/* !CONFIG_FS_VERITY */
 
-static inline bool fsverity_verify_folio(struct folio *folio)
+static inline bool fsverity_verify_folio(struct folio *folio, size_t len,
+					 size_t offset)
 {
-	return fsverity_verify_blocks(folio, folio_size(folio), 0);
+	return fsverity_verify_blocks(folio, len, offset);
 }
 
 static inline bool fsverity_verify_page(struct page *page)
-- 
2.38.4

