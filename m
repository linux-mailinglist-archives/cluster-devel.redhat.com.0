Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6D39328E47E
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 18:31:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-ErVmG8NYMSaZt0LEelmWYg-1; Wed, 14 Oct 2020 12:31:34 -0400
X-MC-Unique: ErVmG8NYMSaZt0LEelmWYg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A516879516;
	Wed, 14 Oct 2020 16:31:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E03015C1BD;
	Wed, 14 Oct 2020 16:31:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7874A18095FF;
	Wed, 14 Oct 2020 16:31:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09EGVSgv027848 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 12:31:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 376A61055DB4; Wed, 14 Oct 2020 16:31:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31DDF10336F6
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 16:31:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE1291823614
	for <cluster-devel@redhat.com>; Wed, 14 Oct 2020 16:31:25 +0000 (UTC)
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-255-cYqkllbCPCqkbVcWg_HNOw-1; Wed, 14 Oct 2020 12:31:20 -0400
X-MC-Unique: cYqkllbCPCqkbVcWg_HNOw-1
Received: by mail-pg1-f193.google.com with SMTP id h6so2336060pgk.4;
	Wed, 14 Oct 2020 09:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+yEsILmCKm0hRP0CDuXEGc8J5t+QTwZ1G0jbK/IVGEU=;
	b=p5ca0xspehVArzB9LQzPl41wIzPswFI38sFfP6KfsIn2aYr17ZQzPYqHr/exmKhOaM
	PRbQf1vIduIqhZqjw+gcvldd5Lk/wvLcsdTHWKZt/3H46sPmsig/2CNmDWqe6y58DF43
	Y7Fd1FXjCzGjcH6+lZHyfAKpKrS4HRWIit95M2bJ9AsBq1lzCh++YSByQPvKE0KqLwSe
	1kaypixEiTbvb41umM6lKOGwdsuoN0eFE7nFvEPII+vusLBifjuOOMVhX+AOxYhSn2Vq
	QGf9bTuoCCw0cOGpqyiQcGxgcY1spabVYm5qaI7mFvA8vpRJUQb28elFo5SataosXFkL
	Kf5A==
X-Gm-Message-State: AOAM530nCtUdVWoDTjDoQcqCyz00dRYHC5sdJg9kuHGWwrV4dhUX8Hc6
	5oVCL/sLZvPPS8VsNbrnT1wu2fhPA5aeMtfIo9E=
X-Google-Smtp-Source: ABdhPJwyQXihDVRWBXi0WjOtJZqEDftaWw5l/BGfz0TLHIP67jMv4+mMDOtseTATUXKS47KyOWSEgA==
X-Received: by 2002:a63:d257:: with SMTP id t23mr4664803pgi.212.1602693077702; 
	Wed, 14 Oct 2020 09:31:17 -0700 (PDT)
Received: from localhost.localdomain ([49.207.205.44])
	by smtp.gmail.com with ESMTPSA id i9sm10919pgc.71.2020.10.14.09.31.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 Oct 2020 09:31:16 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: anprice@redhat.com, agruenba@redhat.com, rpeterso@redhat.com
Date: Wed, 14 Oct 2020 22:01:09 +0530
Message-Id: <20201014163109.98739-1-anant.thazhemadam@gmail.com>
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
Cc: anant.thazhemadam@gmail.com,
	syzbot+af90d47a37376844e731@syzkaller.appspotmail.com,
	foxhlchen@gmail.com, linux-kernel@vger.kernel.org,
	syzbot+a5e2482a693e6b1e444b@syzkaller.appspotmail.com,
	cluster-devel@redhat.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Cluster-devel] [PATCH v2] fs: gfs2: add validation checks for size
	of superblock
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
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

In gfs2_check_sb(), no validation checks are performed with regards to
the size of the superblock.
syzkaller detected a slab-out-of-bounds bug that was primarily caused
because the block size for a superblock was set to zero.
A valid size for a superblock is a power of 2 between 512 and PAGE_SIZE.
Performing validation checks and ensuring that the size of the superblock
is valid fixes this bug.

Reported-by: syzbot+af90d47a37376844e731@syzkaller.appspotmail.com
Tested-by: syzbot+af90d47a37376844e731@syzkaller.appspotmail.com
Suggested-by: Andrew Price <anprice@redhat.com>
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---

Changes in v2:

	* Completely dropped the changes proposed in v1. Instead,
	  validity checks for superblock size have been introduced. 
	  (Suggested by Andrew Price<anprice@redhat.com>)

	* Addded a "Suggested-by" tag accrediting the patch idea to
	  Andrew. If there's any issue with that, please let me know.

	* Changed the commit header and commit message appropriately.

	* Updated "Reported-by" and "Tested-by" tags to the same instance
	  of the bug that was detected earlier (non consequential change).


 fs/gfs2/ops_fstype.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 6d18d2c91add..f0605fae2c4c 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -169,6 +169,13 @@ static int gfs2_check_sb(struct gfs2_sbd *sdp, int silent)
 		return -EINVAL;
 	}
 
+	/* Check if the size of the block is valid - a power of 2 between 512 and  PAGE_SIZE */
+	if (sb->sb_bsize < 512 || sb->sb_bsize > PAGE_SIZE || (sb->sb_bsize & (sb->sb_bsize - 1))) {
+		if (!silent)
+			pr_warn("Invalid superblock size\n");
+		return -EINVAL;
+	}
+
 	/*  If format numbers match exactly, we're done.  */
 
 	if (sb->sb_fs_format == GFS2_FORMAT_FS &&
-- 
2.25.1

