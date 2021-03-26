Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3DCDF34A467
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:27 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-Pa4znUKMMuCrTyop_dGp5Q-1; Fri, 26 Mar 2021 05:31:19 -0400
X-MC-Unique: Pa4znUKMMuCrTyop_dGp5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8658987A841;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 321C35C3DF;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DBBA4A7C9;
	Fri, 26 Mar 2021 09:31:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9C7R0012303 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1126021CAC78; Fri, 26 Mar 2021 09:12:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F317B21CAC80
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D51BE85A5A8
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:04 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
	[209.85.208.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-472-G2AF5oWmNH2tU5zFw_cRYw-1; Fri, 26 Mar 2021 05:12:01 -0400
X-MC-Unique: G2AF5oWmNH2tU5zFw_cRYw-1
Received: by mail-ed1-f48.google.com with SMTP id e7so5449042edu.10
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0HmJyYvfh3odbCbwdOHWuZiUzII2bd3LZhTWqsOobYI=;
	b=SrcSvczFUVQ0Bobge9AclnsNFEgwyo8S6FC99ZDMDSLKw0rHx6QoJ+CuxcHMoMst3q
	3rpcBluBg0SfxhfM6sWMgP+wqEsaYwv0VJMD0wF6wSUsk+WL+Ka64G+Ihmy2Gf/RWQe1
	Frk/wxh5m6EgnaVNZaN5DpHhAawTsxp7piE75vqx4B8y72/VDuhnT5dFcoc2TuYNpJie
	kDDLZ4YuO5gdUMQOIp1jii6D7LosTC1cpyem8L+cm6AJj3S4CT0PE5SMYRGeoq4VZEjX
	MPpozY/55tRweUJxVFT0L8TVgizf9wFyG7ZfweKFeE2LSbqz7+sMUHKjgQjPDvT28itm
	nHWw==
X-Gm-Message-State: AOAM533eXBtAyndMF2rja1JsU08znuedtqrgmcpjBxijknMDkOM/gkCQ
	uL61hZ4HkTIXfBLhSVAPX31rUw==
X-Google-Smtp-Source: ABdhPJwcTGxKuSBwMe2dMJDiuvrGr8lNWPG+oL26fueAytWs2j7U54il3jlM5OiuJ+e4Af833Pa2LQ==
X-Received: by 2002:a50:fd8b:: with SMTP id o11mr13665751edt.346.1616749920526;
	Fri, 26 Mar 2021 02:12:00 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.11.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:00 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:39 +0000
Message-Id: <20210326091151.311647-7-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 06/18] fs: gfs2: lops: Help out worthy
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

