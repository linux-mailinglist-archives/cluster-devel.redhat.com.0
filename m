Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 676CA34EE42
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:47:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-KoOiEDnqOXC6p2YxEmd6PA-1; Tue, 30 Mar 2021 12:47:30 -0400
X-MC-Unique: KoOiEDnqOXC6p2YxEmd6PA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2D9A1005D57;
	Tue, 30 Mar 2021 16:47:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE49819D80;
	Tue, 30 Mar 2021 16:47:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E0F54A7C9;
	Tue, 30 Mar 2021 16:47:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjGLc010823 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1516C2157F24; Tue, 30 Mar 2021 16:45:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F0602166B44
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA7FF8007DD
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:15 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-288-WUgrP0FnPJCN2c2ZdnPswg-1; Tue, 30 Mar 2021 12:45:13 -0400
X-MC-Unique: WUgrP0FnPJCN2c2ZdnPswg-1
Received: by mail-wr1-f54.google.com with SMTP id x16so16870824wrn.4
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4CcaACtGBknSaAZjeIVoYylSZIgl+vXHSAulIEcUgKg=;
	b=EpQrk7UYkv6k7u3IORQS8aQEa4diyRJ1k7FMPbBrWw45xH+zWaBFTNOYjHXQ7vPQ/l
	k1PpclfYqnOMK+GNHAQPNw5oAoEf5AyKj38ft6pXyjunHynLT4PAu7vFPOg7AQo+oBb6
	hAuu6wPlp0mYecvJ8c+ckk8bfjuC10MBvSa6LgZrjOS8mJHPc0S12FDEbzee9SQVN6U5
	Bnk7PjqxnfAOfzETqToSTeNV6HKFYAiVBe2RnaaOiL9l0IoJA9wkLwx5sOKs5Zazc7K6
	+15Woq4zpTngaeIp3nTiDL348TuFMqHVIN/scfgQ5dAxy5Q5QYS1q35yf6eQz9oqDj2g
	JIUA==
X-Gm-Message-State: AOAM531n2wfSXZMJVe6yBfRXQp3WTNv8+Clov6bvuD+OyuUwUT/CgGR5
	FX2UFh/Jw8NpbcRbvtIeF1iNWw==
X-Google-Smtp-Source: ABdhPJwEH8MaNR0P1smuAaU5O9UrfekWbbbU9aD6H82GpRXpotJSR0dpf3B24CDPcSr7NkKGRAu5qA==
X-Received: by 2002:a5d:4ac4:: with SMTP id y4mr34063224wrs.86.1617122712025; 
	Tue, 30 Mar 2021 09:45:12 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:11 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:38 +0100
Message-Id: <20210330164458.1625478-12-lee.jones@linaro.org>
In-Reply-To: <20210330164458.1625478-1-lee.jones@linaro.org>
References: <20210330164458.1625478-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 11/31] fs: gfs2: file: Strip out superfluous
	param description and demote kernel-doc abuse
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/file.c:127: warning: cannot understand function prototype: 'struct '
 fs/gfs2/file.c:446: warning: Excess function parameter 'vma' description in 'gfs2_page_mkwrite'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/file.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
index 2d500f90cdacf..afab20e5954fd 100644
--- a/fs/gfs2/file.c
+++ b/fs/gfs2/file.c
@@ -118,7 +118,7 @@ static int gfs2_readdir(struct file *file, struct dir_context *ctx)
 	return error;
 }
 
-/**
+/*
  * fsflag_gfs2flag
  *
  * The FS_JOURNAL_DATA_FL flag maps to GFS2_DIF_INHERIT_JDATA for directories,
@@ -435,7 +435,6 @@ static int gfs2_allocate_page_backing(struct page *page, unsigned int length)
 
 /**
  * gfs2_page_mkwrite - Make a shared, mmap()ed, page writable
- * @vma: The virtual memory area
  * @vmf: The virtual memory fault containing the page to become writable
  *
  * When the page becomes writable, we need to ensure that we have
-- 
2.27.0

