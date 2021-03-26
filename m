Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AAD6E34A45F
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-0GTyyP7pPVer_J1BOzoAKQ-1; Fri, 26 Mar 2021 05:31:17 -0400
X-MC-Unique: 0GTyyP7pPVer_J1BOzoAKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30C6810621BC;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C5742E09A;
	Fri, 26 Mar 2021 09:31:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 00D384BB7B;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9C7tR012301 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E92E21CAC6D; Fri, 26 Mar 2021 09:12:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2C8021CAC7E
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C3FF811E9C
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:04 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
	[209.85.218.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-333-PySUDc6rOZyIwn-6-mGjVQ-1; Fri, 26 Mar 2021 05:11:59 -0400
X-MC-Unique: PySUDc6rOZyIwn-6-mGjVQ-1
Received: by mail-ej1-f49.google.com with SMTP id r12so7316451ejr.5
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WYbiTPqSzjQP21KCxgzf3jq9Q5Hi/UH51yOsRe7KtZc=;
	b=bA658+U08Xc4Kib5V6ia6lpTnOH+gOg/MUkgRb35gHOPl5IAD/gUGE7E1fHtBINzJS
	GN8XHTE3h+T+Ptvqf0wPdCcyvQYf0wlM40vXNdyD1+wnV0Z5v/CW6lqc0lAuLtFHU+4Q
	0dcs2Lfd904WKMolqLl2XaqE71f3118lawJAfFiF7W/5sJjrIkfTMHafihjR7uetxhWT
	qyIYXEpfWpP0DPpsdWCHfoQEDFpicZQFEMIj4GwNYOgkWyKQSb5aR5GMN3mvDYaG6rrH
	GuBy9HVOnKEwi9ka3+zFL/iqGGP/VsGXD/xLiAa6U+X4bSlFy0M3o5/rTTg93ckVeJJk
	Gf/A==
X-Gm-Message-State: AOAM530Un2RpWu+/pCd7/UTtK3+D04nq3GvH3inD5ZpectgfwGJrD7TR
	X2dXIyu3cB+hHt1PcAanAmN0ww==
X-Google-Smtp-Source: ABdhPJzhxh6bKTsc9M/4pCgP6YeoeTT+NXowWOj0u+8ROw/hkc+/4rC+y4UBNY8rPoFkU400CJvVrA==
X-Received: by 2002:a17:907:929:: with SMTP id
	au9mr11099308ejc.28.1616749918643; 
	Fri, 26 Mar 2021 02:11:58 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.11.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:11:58 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:37 +0000
Message-Id: <20210326091151.311647-5-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 04/18] fs: gfs2: glops: Fix a couple of
	kernel-doc misdemeanours demote others
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

 fs/gfs2/glops.c:58: warning: Function parameter or member 'nr_revokes' not described in '__gfs2_ail_flush'
 fs/gfs2/glops.c:490: warning: Function parameter or member 'gh' not described in 'inode_go_lock'
 fs/gfs2/glops.c:490: warning: Excess function parameter 'gl' description in 'inode_go_lock'
 fs/gfs2/glops.c:490: warning: Excess function parameter 'flags' description in 'inode_go_lock'
 fs/gfs2/glops.c:532: warning: Function parameter or member 'gl' not described in 'inode_go_dump'
 fs/gfs2/glops.c:532: warning: Excess function parameter 'ip' description in 'inode_go_dump'
 fs/gfs2/glops.c:562: warning: Excess function parameter 'state' description in 'freeze_go_sync'
 fs/gfs2/glops.c:562: warning: Excess function parameter 'flags' description in 'freeze_go_sync'
 fs/gfs2/glops.c:607: warning: Function parameter or member 'gh' not described in 'freeze_go_xmote_bh'
 fs/gfs2/glops.c:640: warning: expecting prototype for trans_go_demote_ok(). Prototype was for freeze_go_demote_ok() instead
 fs/gfs2/glops.c:651: warning: Function parameter or member 'remote' not described in 'iopen_go_callback'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/glops.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index ef0b583c3417c..5711b2c8de9e2 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -49,6 +49,7 @@ static void gfs2_ail_error(struct gfs2_glock *gl, const struct buffer_head *bh)
  * __gfs2_ail_flush - remove all buffers for a given lock from the AIL
  * @gl: the glock
  * @fsync: set when called from fsync (not all buffers will be clean)
+ * @nr_revokes: Number of buffers to revoke
  *
  * None of the buffers should be dirty, locked, or pinned.
  */
@@ -478,10 +479,8 @@ int gfs2_inode_refresh(struct gfs2_inode *ip)
 	return error;
 }
 
-/**
+/*
  * inode_go_lock - operation done after an inode lock is locked by a process
- * @gl: the glock
- * @flags:
  *
  * Returns: errno
  */
@@ -522,7 +521,7 @@ static int inode_go_lock(struct gfs2_holder *gh)
 /**
  * inode_go_dump - print information about an inode
  * @seq: The iterator
- * @ip: the inode
+ * @gl: The glock
  * @fs_id_buf: file system id (may be empty)
  *
  */
@@ -553,9 +552,6 @@ static void inode_go_dump(struct seq_file *seq, struct gfs2_glock *gl,
 /**
  * freeze_go_sync - promote/demote the freeze glock
  * @gl: the glock
- * @state: the requested state
- * @flags:
- *
  */
 
 static int freeze_go_sync(struct gfs2_glock *gl)
@@ -597,12 +593,10 @@ static int freeze_go_sync(struct gfs2_glock *gl)
 	return 0;
 }
 
-/**
+/*
  * freeze_go_xmote_bh - After promoting/demoting the freeze glock
  * @gl: the glock
- *
  */
-
 static int freeze_go_xmote_bh(struct gfs2_glock *gl, struct gfs2_holder *gh)
 {
 	struct gfs2_sbd *sdp = gl->gl_name.ln_sbd;
@@ -630,7 +624,7 @@ static int freeze_go_xmote_bh(struct gfs2_glock *gl, struct gfs2_holder *gh)
 }
 
 /**
- * trans_go_demote_ok
+ * freeze_go_demote_ok()
  * @gl: the glock
  *
  * Always returns 0
@@ -641,7 +635,7 @@ static int freeze_go_demote_ok(const struct gfs2_glock *gl)
 	return 0;
 }
 
-/**
+/*
  * iopen_go_callback - schedule the dcache entry for the inode to be deleted
  * @gl: the glock
  *
-- 
2.27.0

