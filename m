Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D2D9F34A45A
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:19 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-c9sT3C9zMyaYx7eC0TroUw-1; Fri, 26 Mar 2021 05:31:17 -0400
X-MC-Unique: c9sT3C9zMyaYx7eC0TroUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9350583DD40;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FE746EF54;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 612791800232;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9CDjI012365 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7370021CAC6E; Fri, 26 Mar 2021 09:12:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DA4921CAC6C
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 557FC811E7A
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:13 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
	[209.85.218.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-326-sL9U0wyUOECWg5p_nCeQbw-1; Fri, 26 Mar 2021 05:12:11 -0400
X-MC-Unique: sL9U0wyUOECWg5p_nCeQbw-1
Received: by mail-ej1-f54.google.com with SMTP id u9so7302803ejj.7
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=M/vaOgHlDpdBkFH1eBGQCtGldkda6ama7Jn2eE3qoYU=;
	b=rb9BO0ZYCmafgCodG5OoTGuc3XA7m387O3uJIaLr8eGjS1pDZTMuwYO+Odh7X5JqK1
	3Y3Lq9m8cQabN284LQu7VAhJvgi/abzQl9znlWSdBMiGvC92xlxtGLHnpGs9uN4Z1yyh
	aqpaDEbY/bjn/FrLPitSSkahCyTib+zR8K0HtsLSQNXgWOaHW1XXLFeoGbnYiP+G8VJ0
	ItgD1gjkXG/BfS8T6Q8V0xAf35Q848lw0SsYRvrPwgwpQpqjGExhnBcNrbXKdR++vw0P
	RDCv7CyDyFip8Oty9wMk0wld/xKntTglReBuTCysbqe7CapGPs4f6DeKIGPPSoaIJTyo
	tu/Q==
X-Gm-Message-State: AOAM531AhbyDv+daJzJiPRKTNqhTO9R8jLY63+0A6j6zTtBhfCMo4fAy
	5iLjukh8JnnPok73PqOqpvokqg==
X-Google-Smtp-Source: ABdhPJyNApa1vm+Q2kcRE7jDYS+jAOwcz0/Wlwb7B++fATv3AFb38BvUUMMsAnFxe7Nej+eqpnrJVA==
X-Received: by 2002:a17:906:68c5:: with SMTP id
	y5mr14366826ejr.371.1616749929828; 
	Fri, 26 Mar 2021 02:12:09 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.12.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:09 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:49 +0000
Message-Id: <20210326091151.311647-17-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 16/18] fs: gfs2: super: Fix kernel-doc
	issues where feasible demote one other
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

 fs/gfs2/super.c:397: warning: Excess function parameter 'state' description in 'gfs2_lock_fs_check_clean'
 fs/gfs2/super.c:397: warning: Excess function parameter 't_gh' description in 'gfs2_lock_fs_check_clean'
 fs/gfs2/super.c:709: warning: Function parameter or member 'wait' not described in 'gfs2_sync_fs'
 fs/gfs2/super.c:821: warning: expecting prototype for statfs_fill(). Prototype was for statfs_slow_fill() instead
 fs/gfs2/super.c:916: warning: Function parameter or member 'sc' not described in 'gfs2_statfs_i'
 fs/gfs2/super.c:916: warning: Excess function parameter 'sg' description in 'gfs2_statfs_i'
 fs/gfs2/super.c:948: warning: Function parameter or member 'dentry' not described in 'gfs2_statfs'
 fs/gfs2/super.c:948: warning: Function parameter or member 'buf' not described in 'gfs2_statfs'
 fs/gfs2/super.c:948: warning: Excess function parameter 'sb' description in 'gfs2_statfs'
 fs/gfs2/super.c:948: warning: Excess function parameter 'statfsbuf' description in 'gfs2_statfs'
 fs/gfs2/super.c:1281: warning: Function parameter or member 'gh' not described in 'evict_should_delete'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/super.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 9e91c9d92bd65..aba117aa433dc 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -387,8 +387,6 @@ struct lfcc {
  * gfs2_lock_fs_check_clean - Stop all writes to the FS and check that all
  *                            journals are clean
  * @sdp: the file system
- * @state: the state to put the transaction lock into
- * @t_gh: the hold on the transaction lock
  *
  * Returns: errno
  */
@@ -698,7 +696,7 @@ static void gfs2_put_super(struct super_block *sb)
 	free_sbd(sdp);
 }
 
-/**
+/*
  * gfs2_sync_fs - sync the filesystem
  * @sb: the superblock
  *
@@ -809,7 +807,7 @@ static int gfs2_unfreeze(struct super_block *sb)
 }
 
 /**
- * statfs_fill - fill in the sg for a given RG
+ * statfs_slow_fill - fill in the sg for a given RG
  * @rgd: the RG
  * @sc: the sc structure
  *
@@ -907,7 +905,7 @@ static int gfs2_statfs_slow(struct gfs2_sbd *sdp, struct gfs2_statfs_change_host
 /**
  * gfs2_statfs_i - Do a statfs
  * @sdp: the filesystem
- * @sg: the sg structure
+ * @sc: the sc structure
  *
  * Returns: errno
  */
@@ -938,8 +936,8 @@ static int gfs2_statfs_i(struct gfs2_sbd *sdp, struct gfs2_statfs_change_host *s
 
 /**
  * gfs2_statfs - Gather and return stats about the filesystem
- * @sb: The superblock
- * @statfsbuf: The buffer
+ * @dentry: The name of the link
+ * @buf: The buffer
  *
  * Returns: 0 on success or error code
  */
@@ -1270,6 +1268,7 @@ static bool gfs2_upgrade_iopen_glock(struct inode *inode)
 /**
  * evict_should_delete - determine whether the inode is eligible for deletion
  * @inode: The inode to evict
+ * @gh: the holder structure
  *
  * This function determines whether the evicted inode is eligible to be deleted
  * and locks the inode glock.
-- 
2.27.0

