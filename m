Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3C32134A466
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-penVEGxiN4urVvTjGnYmsA-1; Fri, 26 Mar 2021 05:31:19 -0400
X-MC-Unique: penVEGxiN4urVvTjGnYmsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 997F6881278;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A6776249C;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F7C018005B6;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9C9kN012337 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F78B10DCF79; Fri, 26 Mar 2021 09:12:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B1E810DCF78
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 029EC85A5B5
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:09 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-279-6MuimcF5OHSShXZp_w2YGw-1; Fri, 26 Mar 2021 05:12:06 -0400
X-MC-Unique: 6MuimcF5OHSShXZp_w2YGw-1
Received: by mail-ed1-f53.google.com with SMTP id z1so5474017edb.8
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4CcaACtGBknSaAZjeIVoYylSZIgl+vXHSAulIEcUgKg=;
	b=GWhM8wp0GHrt4RDAPiaqAA+wr4VC+OFwbBLIXp2mAhEt87XPx4iCxtL4oQQaSG7AUE
	KpXvzC+bMTQc8Yo+ZvTWgvyQloqA1hWhBqCgUgVPoOLVoUKE59aE6BiwUQgDmBPlqG75
	zJiFMoeCONcpUYZrAN3aI0KYnw2eUptct+eu7lDqzG4oWh8drQRj1VtE28UeL8nxoD2n
	uCNHEEYsQBJUSx7cClrF6qpdWfew0/dNKy5s1fHTeva2pa6imlL70COYGponOpulkoaH
	oeYi5bvAwpnC6NO2QIlcsbb1/8LMv9V13DJQrKVN9i0x6EIQdA/iLrKU90Y9J3c/5xNr
	XrcA==
X-Gm-Message-State: AOAM532x8ih8i9YVwWRru2NKGbXMoWuwQOOUDFCLC6c8/XNNC1rhgnXP
	fs8FxbQ/v7zSMab5vcPt0CJKrw==
X-Google-Smtp-Source: ABdhPJxhg1D73bhbMet21+aKxDRVk5RvZGESp6L45Nso/Dem7mylXZI4gnsPmPG3hlUiYcsQXxXbEQ==
X-Received: by 2002:aa7:d917:: with SMTP id a23mr13780703edr.122.1616749925124;
	Fri, 26 Mar 2021 02:12:05 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.12.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:04 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:44 +0000
Message-Id: <20210326091151.311647-12-lee.jones@linaro.org>
In-Reply-To: <20210326091151.311647-1-lee.jones@linaro.org>
References: <20210326091151.311647-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 11/18] fs: gfs2: file: Strip out
	superflouous param description and demote kernel-doc abuse
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

