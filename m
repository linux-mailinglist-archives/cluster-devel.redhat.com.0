Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 22FD634EE3B
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:47:09 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-EXI3BOAcN0eOiBVzu3MulQ-1; Tue, 30 Mar 2021 12:47:05 -0400
X-MC-Unique: EXI3BOAcN0eOiBVzu3MulQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D3FC6B9C0;
	Tue, 30 Mar 2021 16:47:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A8885DEAD;
	Tue, 30 Mar 2021 16:47:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEC5C180B451;
	Tue, 30 Mar 2021 16:47:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjMMH010914 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE4312026D7F; Tue, 30 Mar 2021 16:45:22 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8D642026D64
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C066110334A1
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:22 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-497-AOcvTQ8AOvuWCKV1GYsygA-1; Tue, 30 Mar 2021 12:45:18 -0400
X-MC-Unique: AOcvTQ8AOvuWCKV1GYsygA-1
Received: by mail-wm1-f41.google.com with SMTP id 12so8739198wmf.5
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zJd8mXXYqEzxi+Ta+kTFG2L+mB09Pvob5bInoEtWOJs=;
	b=K1ITG8B6+1I+60xGrm6gCkmTkg0wKl/cGewPZs9CpQ9dazCdLhsMRIRoXz4MR2BT9x
	yAIjYMSc5cEUDHL34+/AIi4FDYwzulKqDo9HFMIPMhKxjVUGw4+24G3WSxsIY//UcXZ6
	La8JQFyFOFKhLCQ3ac0k9iF69pMtJoaKPNTkrK8NIxbA7BU6hjK68B9Fs1Mgp2Ynk5XA
	l3QThOixlouh8gChjMrQQsuR34CoXvg2ata0o6o8gWxoH70eS9CywE8Rd2YL/74gGhqb
	RK7gnVjhKvSki8CXB2O5NVVVwoHTc9ziFX0wZP5gle6XpsneJ29LZQT16lppeGbhba6X
	Ullg==
X-Gm-Message-State: AOAM530xrcHyqNo0j2TV5MJIHAWoeyb+Z9YhtnTi7lFMCS3MRXrojl14
	vvxaYyPNf1wY+UXqbi0+IVswMg==
X-Google-Smtp-Source: ABdhPJy7x+893j7xrlcHpLBGkGCyLPyYwjJIiUPlSoLFR8ppUyFsX66UUEf901V2mos9wK16DUvsCQ==
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr5082442wmi.64.1617122717141; 
	Tue, 30 Mar 2021 09:45:17 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:16 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:43 +0100
Message-Id: <20210330164458.1625478-17-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 16/31] fs: gfs2: super: Fix kernel-doc
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
index 669ce921d0096..841b430d532cd 100644
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
@@ -811,7 +809,7 @@ static int gfs2_unfreeze(struct super_block *sb)
 }
 
 /**
- * statfs_fill - fill in the sg for a given RG
+ * statfs_slow_fill - fill in the sg for a given RG
  * @rgd: the RG
  * @sc: the sc structure
  *
@@ -909,7 +907,7 @@ static int gfs2_statfs_slow(struct gfs2_sbd *sdp, struct gfs2_statfs_change_host
 /**
  * gfs2_statfs_i - Do a statfs
  * @sdp: the filesystem
- * @sg: the sg structure
+ * @sc: the sc structure
  *
  * Returns: errno
  */
@@ -940,8 +938,8 @@ static int gfs2_statfs_i(struct gfs2_sbd *sdp, struct gfs2_statfs_change_host *s
 
 /**
  * gfs2_statfs - Gather and return stats about the filesystem
- * @sb: The superblock
- * @statfsbuf: The buffer
+ * @dentry: The name of the link
+ * @buf: The buffer
  *
  * Returns: 0 on success or error code
  */
@@ -1272,6 +1270,7 @@ static bool gfs2_upgrade_iopen_glock(struct inode *inode)
 /**
  * evict_should_delete - determine whether the inode is eligible for deletion
  * @inode: The inode to evict
+ * @gh: the holder structure
  *
  * This function determines whether the evicted inode is eligible to be deleted
  * and locks the inode glock.
-- 
2.27.0

