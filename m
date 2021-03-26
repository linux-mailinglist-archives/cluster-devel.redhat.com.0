Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A81D034A462
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-Wyx7qpFhMG6kwVS_jbA_LA-1; Fri, 26 Mar 2021 05:31:19 -0400
X-MC-Unique: Wyx7qpFhMG6kwVS_jbA_LA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E244180FCB2;
	Fri, 26 Mar 2021 09:31:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C7045D9E3;
	Fri, 26 Mar 2021 09:31:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 51470180B450;
	Fri, 26 Mar 2021 09:31:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9CAl9012347 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B45AA2026D6B; Fri, 26 Mar 2021 09:12:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF5A82026D48
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9618E185A7BA
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:10 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
	[209.85.218.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-255-_4kQbDWJMs-2jJj6-5esHw-1; Fri, 26 Mar 2021 05:12:07 -0400
X-MC-Unique: _4kQbDWJMs-2jJj6-5esHw-1
Received: by mail-ej1-f43.google.com with SMTP id u9so7302547ejj.7
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QFeclMCI/xtQpMqVpueJ2XQbLsIRltRLk/v4Dw+G+yo=;
	b=ezjYQKlarkdoVoBSJtSfTkDRIKUGNCHjVTvkaw2ECeM9kdub96XJjFRAdnCXx+saRs
	vbZ0vtvk5kqfUqrkdRPLDXB7QcUVnz3FzY/0zKcZxR/Fh/nnFspncKsjeQSu/vu7ANWw
	yM6DHjPFa4jE7WE/WaiOFTrt7Ya2BIlXJU6jf7wBCVLAY9tjp5/csDthQc+R8B/4tHuL
	NOkurlBZC+I9keyfBaxYB3QG6uUBkh24JnXBh9E0NBNPRWcLCLu/+VSGcauhIlZ2jtRj
	NBeep7FuKCg7+Bg2pUsG35o8UeePmTU1qZuOlhCnjTYnLblQP0VG3d6bsgl30GKAJdw0
	wo4Q==
X-Gm-Message-State: AOAM533NuVpgmL2bT/N9VRE3uMqL942Iev52nAKP6xi//M6jCjH0QuGL
	KFnIke6/E1P6+w04a93/Uh5M+Q==
X-Google-Smtp-Source: ABdhPJyHYO+cK+MVO4pli4rQWFvAjc9DALO8t3YsK2Jx2dR9Krq1nzoJj+06Y+93oqDFGbAMoaBrkA==
X-Received: by 2002:a17:906:ac6:: with SMTP id
	z6mr13869637ejf.505.1616749926034; 
	Fri, 26 Mar 2021 02:12:06 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.12.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:05 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:45 +0000
Message-Id: <20210326091151.311647-13-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 12/18] fs: gfs2: ops_fstype: Fix a little
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

