Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 16C6034EE41
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:47:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-erZaknmjPKCJyfAiTP-QJw-1; Tue, 30 Mar 2021 12:47:30 -0400
X-MC-Unique: erZaknmjPKCJyfAiTP-QJw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64118801FCE;
	Tue, 30 Mar 2021 16:47:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51FDA6F439;
	Tue, 30 Mar 2021 16:47:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 20C4A4A7CA;
	Tue, 30 Mar 2021 16:47:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjGCu010841 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB0BA11457C2; Tue, 30 Mar 2021 16:45:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6EA911457C0
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FF1710334A6
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:16 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-355-IVmRbKjWNlm_JoeCyMuflA-1; Tue, 30 Mar 2021 12:45:14 -0400
X-MC-Unique: IVmRbKjWNlm_JoeCyMuflA-1
Received: by mail-wr1-f41.google.com with SMTP id z2so16884954wrl.5
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QFeclMCI/xtQpMqVpueJ2XQbLsIRltRLk/v4Dw+G+yo=;
	b=mZ8b5JFSnewf1IeeE5QLcdyMy+oX0G4vbvp9TSV91qRHjsxo0KrEMm3d6xJz3gshC5
	KCWgajWL5sjwgVBa6Qsa7wfqYmpu6P3S5qORJd5R9pu3p5vIJfNEi7us7RYnY7yOqp5y
	vKU3SBnpBR0mht769xAg96qL8RJv6FHapsX6RnClKFE2+vKAZwvUS1bzA0N0AALisvMk
	YBfqlK3QcD/2SNBJpUhn+2ZoqX8S1gELr6XAWLsiF22utlUublUXlb1wL6A7EmH+IsRN
	Z3PiYsda/tVydVi4ExStIJhRCi5vPwt0GvaemHcqT0e3gU5tx5Fw77BD9TKmXSOXUaOa
	aHSQ==
X-Gm-Message-State: AOAM53253c+yr+AMzqGWAf1VNuHvV59qAbbHtNZft9BaSfEAY/F/s0sL
	8Unr9SJYe1JKMfQvyVcxTp1kAg==
X-Google-Smtp-Source: ABdhPJwc2uQxM+Erb2LxDK7IWO4tOF8OOi2qNdDGAHGN5nzU77BFryVpEM9zMLSsN2YEuOHr1eZM3w==
X-Received: by 2002:a5d:6412:: with SMTP id z18mr35123294wru.214.1617122713134;
	Tue, 30 Mar 2021 09:45:13 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:12 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:39 +0100
Message-Id: <20210330164458.1625478-13-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 12/31] fs: gfs2: ops_fstype: Fix a little
	doc-rot
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/ops_fstype.c:162: warning: Excess function parameter 'sb' description in 'gfs2_check_sb'
 fs/gfs2/ops_fstype.c:242: warning: Function parameter or member 'silent' not described in 'gfs2_read_super'
 fs/gfs2/ops_fstype.c:242: warning: Excess function parameter 'error' description in 'gfs2_read_super'
 fs/gfs2/ops_fstype.c:993: warning: Excess function parameter 'args' description in 'gfs2_lm_mount'
 fs/gfs2/ops_fstype.c:1102: warning: Function parameter or member 'fc' not described in 'gfs2_fill_super'
 fs/gfs2/ops_fstype.c:1102: warning: Excess function parameter 'args' description in 'gfs2_fill_super'
 fs/gfs2/ops_fstype.c:1102: warning: Excess function parameter 'silent' description in 'gfs2_fill_super'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/ops_fstype.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index aa4136055a83c..b6c7a95dabf90 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -150,7 +150,6 @@ static struct gfs2_sbd *init_sbd(struct super_block *sb)
 /**
  * gfs2_check_sb - Check superblock
  * @sdp: the filesystem
- * @sb: The superblock
  * @silent: Don't print a message if the check fails
  *
  * Checks the version code of the FS is one that we understand how to
@@ -223,7 +222,7 @@ static void gfs2_sb_in(struct gfs2_sbd *sdp, const void *buf)
  * gfs2_read_super - Read the gfs2 super block from disk
  * @sdp: The GFS2 super block
  * @sector: The location of the super block
- * @error: The error code to return
+ * @silent: Don't print a message if the check fails
  *
  * This uses the bio functions to read the super block from disk
  * because we want to be 100% sure that we never read cached data.
@@ -983,7 +982,6 @@ static const struct lm_lockops nolock_ops = {
 /**
  * gfs2_lm_mount - mount a locking protocol
  * @sdp: the filesystem
- * @args: mount arguments
  * @silent: if 1, don't complain if the FS isn't a GFS2 fs
  *
  * Returns: errno
@@ -1093,8 +1091,7 @@ void gfs2_online_uevent(struct gfs2_sbd *sdp)
 /**
  * gfs2_fill_super - Read in superblock
  * @sb: The VFS superblock
- * @args: Mount options
- * @silent: Don't complain if it's not a GFS2 filesystem
+ * @fc: Mount options and flags
  *
  * Returns: -errno
  */
-- 
2.27.0

