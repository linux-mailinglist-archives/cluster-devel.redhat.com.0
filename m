Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 09CFB34EE3C
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:47:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215--T3jXbF-Pi2BnEnUx-CUWw-1; Tue, 30 Mar 2021 12:47:04 -0400
X-MC-Unique: -T3jXbF-Pi2BnEnUx-CUWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 331281005D4F;
	Tue, 30 Mar 2021 16:47:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E10519D80;
	Tue, 30 Mar 2021 16:47:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 014344A7C9;
	Tue, 30 Mar 2021 16:47:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjGww010822 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 04BB52026D7F; Tue, 30 Mar 2021 16:45:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F341E2026D64
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A108101A531
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:12 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-584-wk6Q27nrMVm56YiKbt0gEQ-1; Tue, 30 Mar 2021 12:45:08 -0400
X-MC-Unique: wk6Q27nrMVm56YiKbt0gEQ-1
Received: by mail-wr1-f44.google.com with SMTP id x13so16871871wrs.9
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0HmJyYvfh3odbCbwdOHWuZiUzII2bd3LZhTWqsOobYI=;
	b=HO2CDtOaax6nmetVwAXJaK0OhdihG0GtnBoYyiAGQtlgPen7WS8G2LZvmXwPDSjPAa
	TVjicVKU5NW6rBMYq1JCWJV8nhBJD38uuJZ0Gt8ueln5lq9H+JoU/tv5I6DuhEKsWn9l
	VkWM7Y5kom769nJ1EK+Q2nm0cfmjYV9IEFamaJB1Erq9z7atMOjVFReWNGXBWeAJEkPw
	Ob0ouVc3RdSeRoWRuXGwV5CgJCwRlAKdR6Fgx4+LhJtigmn2jZq+FOx9n/4UxduU/xo3
	XJPLCrmIAJ1UgftNb6qnnEt+aVOUNbulK4JHrDdaAikuLKBk8FP69YtyOl3zdseWa7pN
	2oBQ==
X-Gm-Message-State: AOAM532x3yB8qxJuNmIwuUH4qdFUExjO6kOGa5nQjrSDrSDsR2Ms1QHq
	aRN0jKPEAOqmQkszA5DiHF44dw==
X-Google-Smtp-Source: ABdhPJyXF7nfP1hcwCVfZjQ+Nv2wGEGsayY2DesI2BlKYoJNiZWkKpKccBiEzU+tuwBhYUpiEe92RQ==
X-Received: by 2002:a05:6000:3:: with SMTP id h3mr34598645wrx.91.1617122707218;
	Tue, 30 Mar 2021 09:45:07 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:06 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:33 +0100
Message-Id: <20210330164458.1625478-7-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 06/31] fs: gfs2: lops: Help out worthy
	kernel-doc headers and demote others
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

 fs/gfs2/lops.c:106: warning: Function parameter or member 'tr' not described in 'gfs2_unpin'
 fs/gfs2/lops.c:106: warning: Excess function parameter 'flags' description in 'gfs2_unpin'
 fs/gfs2/lops.c:300: warning: Function parameter or member 'biop' not described in 'gfs2_log_get_bio'
 fs/gfs2/lops.c:300: warning: Excess function parameter 'bio' description in 'gfs2_log_get_bio'
 fs/gfs2/lops.c:333: warning: Function parameter or member 'jd' not described in 'gfs2_log_write'
 fs/gfs2/lops.c:428: warning: Function parameter or member 'head' not described in 'gfs2_jhead_pg_srch'
 fs/gfs2/lops.c:471: warning: Function parameter or member 'head' not described in 'gfs2_jhead_process_page'
 fs/gfs2/lops.c:513: warning: Function parameter or member 'keep_cache' not described in 'gfs2_find_jhead'
 fs/gfs2/lops.c:983: warning: Function parameter or member 'sdp' not described in 'databuf_lo_before_commit'
 fs/gfs2/lops.c:983: warning: Function parameter or member 'tr' not described in 'databuf_lo_before_commit'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/lops.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/gfs2/lops.c b/fs/gfs2/lops.c
index a82f4747aa8d5..390ac939aa757 100644
--- a/fs/gfs2/lops.c
+++ b/fs/gfs2/lops.c
@@ -92,13 +92,10 @@ static void maybe_release_space(struct gfs2_bufdata *bd)
 	rgrp_unlock_local(rgd);
 }
 
-/**
+/*
  * gfs2_unpin - Unpin a buffer
  * @sdp: the filesystem the buffer belongs to
  * @bh: The buffer to unpin
- * @ai:
- * @flags: The inode dirty flags
- *
  */
 
 static void gfs2_unpin(struct gfs2_sbd *sdp, struct buffer_head *bh,
@@ -281,7 +278,7 @@ static struct bio *gfs2_log_alloc_bio(struct gfs2_sbd *sdp, u64 blkno,
  * gfs2_log_get_bio - Get cached log bio, or allocate a new one
  * @sdp: The super block
  * @blkno: The device block number we want to write to
- * @bio: The bio to get or allocate
+ * @biop: The bio to get or allocate
  * @op: REQ_OP
  * @end_io: The bi_end_io callback
  * @flush: Always flush the current bio and allocate a new one?
@@ -317,6 +314,7 @@ static struct bio *gfs2_log_get_bio(struct gfs2_sbd *sdp, u64 blkno,
 /**
  * gfs2_log_write - write to log
  * @sdp: the filesystem
+ * @jd: The journal descriptor
  * @page: the page to write
  * @size: the size of the data to write
  * @offset: the offset within the page 
@@ -417,6 +415,7 @@ static void gfs2_end_log_read(struct bio *bio)
 /**
  * gfs2_jhead_pg_srch - Look for the journal head in a given page.
  * @jd: The journal descriptor
+ * @head: the head journal to start from
  * @page: The page to look in
  *
  * Returns: 1 if found, 0 otherwise.
@@ -450,6 +449,7 @@ static bool gfs2_jhead_pg_srch(struct gfs2_jdesc *jd,
  * gfs2_jhead_process_page - Search/cleanup a page
  * @jd: The journal descriptor
  * @index: Index of the page to look into
+ * @head: the head journal to start from
  * @done: If set, perform only cleanup, else search and set if found.
  *
  * Find the page with 'index' in the journal's mapping. Search the page for
@@ -502,6 +502,7 @@ static struct bio *gfs2_chain_bio(struct bio *prev, unsigned int nr_iovecs)
  * gfs2_find_jhead - find the head of a log
  * @jd: The journal descriptor
  * @head: The log descriptor for the head of the log is returned here
+ * @keep_cache: If set inode pages will not be truncated
  *
  * Do a search of a journal by reading it in large chunks using bios and find
  * the valid log entry with the highest sequence number.  (i.e. the log head)
@@ -974,7 +975,7 @@ static void revoke_lo_after_scan(struct gfs2_jdesc *jd, int error, int pass)
 	gfs2_revoke_clean(jd);
 }
 
-/**
+/*
  * databuf_lo_before_commit - Scan the data buffers, writing as we go
  *
  */
-- 
2.27.0

