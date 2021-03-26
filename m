Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AD91434A460
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-bA1lX9fQMZW1t5siAZCugg-1; Fri, 26 Mar 2021 05:31:17 -0400
X-MC-Unique: bA1lX9fQMZW1t5siAZCugg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A029A50204;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CBA26EF54;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75AD71800216;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9CFpK012399 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCB8B2026D07; Fri, 26 Mar 2021 09:12:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B70382026D48
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AAFC8027E6
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:15 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
	[209.85.218.48]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-83-cd1BpcubO7GyW3IajVzpmg-1; Fri, 26 Mar 2021 05:12:12 -0400
X-MC-Unique: cd1BpcubO7GyW3IajVzpmg-1
Received: by mail-ej1-f48.google.com with SMTP id k10so7375759ejg.0
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=edOfNQI8AxXW7owzJ+vXm3rW8pIpWNBkr0sH8eSakq4=;
	b=Uhib6I/Capl7ADhoPW+RoeeKb4gOWrsse7aKKcIwZgyaIznp4ZX7pXg4F1jX2IInSL
	o6TiC3DWlO1mg+fdZ62Myt0LeY4RWkRYLUG8DWnCCEtFPFdJtj/mL4uR0q+tPC9jgjyB
	VKySd6HPtOHhAY1zgfG/z6L8FCYrtNy4feDcvmS0RYdQPmaFjv3OH6Yyax0lVpgZdiTB
	yixp+xT3bUX9Cev+Ka4uE7X0td0vOrDrWtHRQkt11plf8mE+wGPoB8Lqa5VoUqcD20Ss
	xlrFIW1QDdhwpV4AFyIcVjOZ0DRXDIxiTDESdf/ER6TWLmaOrS0l5Ygcy2XRMnh7QFJH
	Wcnw==
X-Gm-Message-State: AOAM533d9ZYX/YTrvpQBeeO0VyiwlPNTl88iE8i7oMKDwRLgKbjrYTtP
	JJNA7HeWPIMqdQkcTZ+mhGG0HA==
X-Google-Smtp-Source: ABdhPJyNk1VcncT+S23a+OMXxZJ3KIpYY8atXvP5zjHv7D/YTFFVsxitTpBQ+7cA5LMuaAYKimsLEw==
X-Received: by 2002:a17:907:2062:: with SMTP id
	qp2mr14071135ejb.397.1616749930755; 
	Fri, 26 Mar 2021 02:12:10 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.12.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:10 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:50 +0000
Message-Id: <20210326091151.311647-18-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 17/18] fs: gfs2: util: Fix one conformant
	kernel-doc header and demote a bunch of abuses
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/util.c:52: warning: Function parameter or member 'verbose' not described in 'check_journal_clean'
 fs/gfs2/util.c:372: warning: Function parameter or member 'sdp' not described in 'gfs2_assert_withdraw_i'
 fs/gfs2/util.c:372: warning: Function parameter or member 'assertion' not described in 'gfs2_assert_withdraw_i'
 fs/gfs2/util.c:372: warning: Function parameter or member 'function' not described in 'gfs2_assert_withdraw_i'
 fs/gfs2/util.c:372: warning: Function parameter or member 'file' not described in 'gfs2_assert_withdraw_i'
 fs/gfs2/util.c:372: warning: Function parameter or member 'line' not described in 'gfs2_assert_withdraw_i'
 fs/gfs2/util.c:372: warning: Function parameter or member 'delayed' not described in 'gfs2_assert_withdraw_i'
 fs/gfs2/util.c:401: warning: Function parameter or member 'sdp' not described in 'gfs2_assert_warn_i'
 fs/gfs2/util.c:401: warning: Function parameter or member 'assertion' not described in 'gfs2_assert_warn_i'
 fs/gfs2/util.c:401: warning: Function parameter or member 'function' not described in 'gfs2_assert_warn_i'
 fs/gfs2/util.c:401: warning: Function parameter or member 'file' not described in 'gfs2_assert_warn_i'
 fs/gfs2/util.c:401: warning: Function parameter or member 'line' not described in 'gfs2_assert_warn_i'
 fs/gfs2/util.c:431: warning: Function parameter or member 'sdp' not described in 'gfs2_consist_i'
 fs/gfs2/util.c:431: warning: Function parameter or member 'function' not described in 'gfs2_consist_i'
 fs/gfs2/util.c:431: warning: Function parameter or member 'file' not described in 'gfs2_consist_i'
 fs/gfs2/util.c:431: warning: Function parameter or member 'line' not described in 'gfs2_consist_i'
 fs/gfs2/util.c:444: warning: Function parameter or member 'ip' not described in 'gfs2_consist_inode_i'
 fs/gfs2/util.c:444: warning: Function parameter or member 'function' not described in 'gfs2_consist_inode_i'
 fs/gfs2/util.c:444: warning: Function parameter or member 'file' not described in 'gfs2_consist_inode_i'
 fs/gfs2/util.c:444: warning: Function parameter or member 'line' not described in 'gfs2_consist_inode_i'
 fs/gfs2/util.c:463: warning: Function parameter or member 'rgd' not described in 'gfs2_consist_rgrpd_i'
 fs/gfs2/util.c:463: warning: Function parameter or member 'function' not described in 'gfs2_consist_rgrpd_i'
 fs/gfs2/util.c:463: warning: Function parameter or member 'file' not described in 'gfs2_consist_rgrpd_i'
 fs/gfs2/util.c:463: warning: Function parameter or member 'line' not described in 'gfs2_consist_rgrpd_i'
 fs/gfs2/util.c:487: warning: Function parameter or member 'sdp' not described in 'gfs2_meta_check_ii'
 fs/gfs2/util.c:487: warning: Function parameter or member 'bh' not described in 'gfs2_meta_check_ii'
 fs/gfs2/util.c:487: warning: Function parameter or member 'type' not described in 'gfs2_meta_check_ii'
 fs/gfs2/util.c:487: warning: Function parameter or member 'function' not described in 'gfs2_meta_check_ii'
 fs/gfs2/util.c:487: warning: Function parameter or member 'file' not described in 'gfs2_meta_check_ii'
 fs/gfs2/util.c:487: warning: Function parameter or member 'line' not described in 'gfs2_meta_check_ii'
 fs/gfs2/util.c:509: warning: Function parameter or member 'sdp' not described in 'gfs2_metatype_check_ii'
 fs/gfs2/util.c:509: warning: Function parameter or member 'bh' not described in 'gfs2_metatype_check_ii'
 fs/gfs2/util.c:509: warning: Function parameter or member 'type' not described in 'gfs2_metatype_check_ii'
 fs/gfs2/util.c:509: warning: Function parameter or member 't' not described in 'gfs2_metatype_check_ii'
 fs/gfs2/util.c:509: warning: Function parameter or member 'function' not described in 'gfs2_metatype_check_ii'
 fs/gfs2/util.c:509: warning: Function parameter or member 'file' not described in 'gfs2_metatype_check_ii'
 fs/gfs2/util.c:509: warning: Function parameter or member 'line' not described in 'gfs2_metatype_check_ii'
 fs/gfs2/util.c:530: warning: Function parameter or member 'sdp' not described in 'gfs2_io_error_i'
 fs/gfs2/util.c:530: warning: Function parameter or member 'function' not described in 'gfs2_io_error_i'
 fs/gfs2/util.c:530: warning: Function parameter or member 'file' not described in 'gfs2_io_error_i'
 fs/gfs2/util.c:530: warning: Function parameter or member 'line' not described in 'gfs2_io_error_i'
 fs/gfs2/util.c:546: warning: Function parameter or member 'sdp' not described in 'gfs2_io_error_bh_i'
 fs/gfs2/util.c:546: warning: Function parameter or member 'bh' not described in 'gfs2_io_error_bh_i'
 fs/gfs2/util.c:546: warning: Function parameter or member 'function' not described in 'gfs2_io_error_bh_i'
 fs/gfs2/util.c:546: warning: Function parameter or member 'file' not described in 'gfs2_io_error_bh_i'
 fs/gfs2/util.c:546: warning: Function parameter or member 'line' not described in 'gfs2_io_error_bh_i'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/util.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 4f034b87b4276..3e08027a6c81b 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -44,6 +44,7 @@ void gfs2_assert_i(struct gfs2_sbd *sdp)
  * check_journal_clean - Make sure a journal is clean for a spectator mount
  * @sdp: The GFS2 superblock
  * @jd: The journal descriptor
+ * @verbose: Show more prints in the log
  *
  * Returns: 0 if the journal is clean or locked, else an error
  */
@@ -362,7 +363,7 @@ int gfs2_withdraw(struct gfs2_sbd *sdp)
 	return -1;
 }
 
-/**
+/*
  * gfs2_assert_withdraw_i - Cause the machine to withdraw if @assertion is false
  */
 
@@ -392,7 +393,7 @@ void gfs2_assert_withdraw_i(struct gfs2_sbd *sdp, char *assertion,
 	dump_stack();
 }
 
-/**
+/*
  * gfs2_assert_warn_i - Print a message to the console if @assertion is false
  */
 
@@ -422,7 +423,7 @@ void gfs2_assert_warn_i(struct gfs2_sbd *sdp, char *assertion,
 	sdp->sd_last_warning = jiffies;
 }
 
-/**
+/*
  * gfs2_consist_i - Flag a filesystem consistency error and withdraw
  */
 
@@ -435,7 +436,7 @@ void gfs2_consist_i(struct gfs2_sbd *sdp, const char *function,
 	gfs2_withdraw(sdp);
 }
 
-/**
+/*
  * gfs2_consist_inode_i - Flag an inode consistency error and withdraw
  */
 
@@ -454,7 +455,7 @@ void gfs2_consist_inode_i(struct gfs2_inode *ip,
 	gfs2_withdraw(sdp);
 }
 
-/**
+/*
  * gfs2_consist_rgrpd_i - Flag a RG consistency error and withdraw
  */
 
@@ -475,7 +476,7 @@ void gfs2_consist_rgrpd_i(struct gfs2_rgrpd *rgd,
 	gfs2_withdraw(sdp);
 }
 
-/**
+/*
  * gfs2_meta_check_ii - Flag a magic number consistency error and withdraw
  * Returns: -1 if this call withdrew the machine,
  *          -2 if it was already withdrawn
@@ -497,7 +498,7 @@ int gfs2_meta_check_ii(struct gfs2_sbd *sdp, struct buffer_head *bh,
 	return (me) ? -1 : -2;
 }
 
-/**
+/*
  * gfs2_metatype_check_ii - Flag a metadata type consistency error and withdraw
  * Returns: -1 if this call withdrew the machine,
  *          -2 if it was already withdrawn
@@ -519,7 +520,7 @@ int gfs2_metatype_check_ii(struct gfs2_sbd *sdp, struct buffer_head *bh,
 	return (me) ? -1 : -2;
 }
 
-/**
+/*
  * gfs2_io_error_i - Flag an I/O error and withdraw
  * Returns: -1 if this call withdrew the machine,
  *          0 if it was already withdrawn
@@ -535,7 +536,7 @@ int gfs2_io_error_i(struct gfs2_sbd *sdp, const char *function, char *file,
 	return gfs2_withdraw(sdp);
 }
 
-/**
+/*
  * gfs2_io_error_bh_i - Flag a buffer I/O error
  * @withdraw: withdraw the filesystem
  */
-- 
2.27.0

