Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5F51734EE2B
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:45:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-xjoYqRRsPg6VazXbjyKyGA-1; Tue, 30 Mar 2021 12:45:27 -0400
X-MC-Unique: xjoYqRRsPg6VazXbjyKyGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60CE7881278;
	Tue, 30 Mar 2021 16:45:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 430525DDAD;
	Tue, 30 Mar 2021 16:45:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A30C1809C83;
	Tue, 30 Mar 2021 16:45:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjLN3010903 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3534411457C2; Tue, 30 Mar 2021 16:45:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 311CE11457C0
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C7F785A5BB
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:21 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-588-v5ol0qrmOYuLSOagX5QJxQ-1; Tue, 30 Mar 2021 12:45:19 -0400
X-MC-Unique: v5ol0qrmOYuLSOagX5QJxQ-1
Received: by mail-wr1-f54.google.com with SMTP id x13so16872423wrs.9
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=edOfNQI8AxXW7owzJ+vXm3rW8pIpWNBkr0sH8eSakq4=;
	b=TxP6Tex4hASFQ4CKl/DII/iJ2/sQmAUArxiRyJ17Gn6Ie3jJVESed6fZ8Rfqc+gieo
	Vyt26yghSH+pcnw7Ct8QcgDRtC/TwfObDBk5egyu/XG8/+fslGY+h70Ca7b76uMLltKp
	KYJbT+HPDqTdKYYes0f4ZzqzHCC3ycfLZlSfuqjscT9rdBPSehB+fh8RVxAptCHdvggn
	8nCwsNGlUW0bMfrFWj9726Z0pBGHBp6xsT5v0zFIogx2bu+LKYCBIDPBWkB3BBOdGM+7
	9jusKN7n27pUJqNP56/78Op15g9SObu/3n+XiN2WXRfLC6YrmRcu7ta3E7LhQ4ON0leA
	Nm3Q==
X-Gm-Message-State: AOAM533WmPEgfUKroxNRJQ7HVVh3+YQ5TItaz4/Bb2MdAOi39ojZ4gJ6
	bYq2IczI2AHX9FS6Eh5NSN7t3w==
X-Google-Smtp-Source: ABdhPJxbrNab3mr9QP4a+su/M3GAuG6S6BSajMeGGgRh/T/rdaBUOhI+pVoSN5nJVee6y2SvbBKClw==
X-Received: by 2002:adf:c389:: with SMTP id p9mr34872246wrf.410.1617122717880; 
	Tue, 30 Mar 2021 09:45:17 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:17 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:44 +0100
Message-Id: <20210330164458.1625478-18-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 17/31] fs: gfs2: util: Fix one conformant
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

