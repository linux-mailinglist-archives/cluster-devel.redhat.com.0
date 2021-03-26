Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3D07334A454
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-2CBp6mAkNT-2d5u3as-SVA-1; Fri, 26 Mar 2021 05:31:15 -0400
X-MC-Unique: 2CBp6mAkNT-2d5u3as-SVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B17A910621A0;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DF206249C;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86C944A700;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9C5Lk012287 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8260B10CD6D5; Fri, 26 Mar 2021 09:12:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7308E10DCF7E
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0091100DE77
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:00 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-506-IPQFAlSeOMiS0KcimVej-A-1; Fri, 26 Mar 2021 05:11:58 -0400
X-MC-Unique: IPQFAlSeOMiS0KcimVej-A-1
Received: by mail-ej1-f41.google.com with SMTP id e14so7261138ejz.11
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hX4c3dvNt7mKQZ9EtHrANR7zKvje+/DsUArCAOpPAxo=;
	b=l8ClNH1bPTCRVIZSokzqqzw2ByI7LWtI+gtLCQLVHd0mDEyMfnGwF9N3j4U8/CdGDR
	jDtUUS9ZaidGgzjSVlgCQwAxEeUGOYTJTMhuD8s/SVjj1kSLCZGgbfhRYNby+qlZ4ht3
	qp5ZT94bAnjgEvcpq/EhixNKv+HSc4sqVSNTrq181AAIXAc8x8vAySnQiTVq91AfvxWt
	wm+3dZWshFYEWA/fcvrG0/3Cj7Qg4mgOWBUDJLYVtz6LYPLUv7om/4UVqv/ITPCSI63N
	0TwjtuE2J5vXgHBA8VOyAEgTJVbNtcRDU2bDL+SMtdIYV9wSYN2sLSdKiMs5pJqcOG+6
	NF7w==
X-Gm-Message-State: AOAM532dXupy7EvTQOuE6sIi16w7I2o10kJfSZ+WrZ0xcFkluxcZVzTZ
	EK0pDjiu+Oe4nYx6x2igbySUIhJwdfTKQw==
X-Google-Smtp-Source: ABdhPJxR+lIy6DkgxMy/iXCj7OI3hGdfxIgmfkEnZ2iQ5TSwMq7S8/xoP7s0FL+OiVeUaH0ktza/hw==
X-Received: by 2002:a17:906:684b:: with SMTP id
	a11mr13620938ejs.329.1616749916879; 
	Fri, 26 Mar 2021 02:11:56 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.11.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:11:56 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:35 +0000
Message-Id: <20210326091151.311647-3-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 26 Mar 2021 05:31:04 -0400
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 02/18] fs: gfs2: xattr: Help out some
	kernel-doc header demote non-conformant ones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/xattr.c:41: warning: Function parameter or member 'sdp' not described in 'ea_calc_size'
 fs/gfs2/xattr.c:41: warning: Function parameter or member 'nsize' not described in 'ea_calc_size'
 fs/gfs2/xattr.c:41: warning: Function parameter or member 'dsize' not described in 'ea_calc_size'
 fs/gfs2/xattr.c:240: warning: Function parameter or member 'ip' not described in 'ea_dealloc_unstuffed'
 fs/gfs2/xattr.c:240: warning: Function parameter or member 'bh' not described in 'ea_dealloc_unstuffed'
 fs/gfs2/xattr.c:240: warning: Function parameter or member 'ea' not described in 'ea_dealloc_unstuffed'
 fs/gfs2/xattr.c:240: warning: Function parameter or member 'prev' not described in 'ea_dealloc_unstuffed'
 fs/gfs2/xattr.c:463: warning: expecting prototype for ea_iter_unstuffed(). Prototype was for gfs2_iter_unstuffed() instead
 fs/gfs2/xattr.c:587: warning: expecting prototype for gfs2_xattr_get(). Prototype was for __gfs2_xattr_get() instead
 fs/gfs2/xattr.c:814: warning: Function parameter or member 'ip' not described in 'ea_init'
 fs/gfs2/xattr.c:814: warning: Function parameter or member 'type' not described in 'ea_init'
 fs/gfs2/xattr.c:814: warning: Function parameter or member 'name' not described in 'ea_init'
 fs/gfs2/xattr.c:814: warning: Function parameter or member 'data' not described in 'ea_init'
 fs/gfs2/xattr.c:814: warning: Function parameter or member 'size' not described in 'ea_init'
 fs/gfs2/xattr.c:814: warning: Excess function parameter 'er' description in 'ea_init'
 fs/gfs2/xattr.c:1181: warning: Function parameter or member 'inode' not described in '__gfs2_xattr_set'
 fs/gfs2/xattr.c:1181: warning: Excess function parameter 'ip' description in '__gfs2_xattr_set'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/xattr.c | 25 +++++++------------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/fs/gfs2/xattr.c b/fs/gfs2/xattr.c
index 124b3d5a72665..fe2109789f75b 100644
--- a/fs/gfs2/xattr.c
+++ b/fs/gfs2/xattr.c
@@ -26,12 +26,9 @@
 #include "trans.h"
 #include "util.h"
 
-/**
+/*
  * ea_calc_size - returns the acutal number of bytes the request will take up
  *                (not counting any unstuffed data blocks)
- * @sdp:
- * @er:
- * @size:
  *
  * Returns: 1 if the EA should be stuffed
  */
@@ -219,13 +216,8 @@ static int gfs2_ea_find(struct gfs2_inode *ip, int type, const char *name,
 	return error;
 }
 
-/**
+/*
  * ea_dealloc_unstuffed -
- * @ip:
- * @bh:
- * @ea:
- * @prev:
- * @private:
  *
  * Take advantage of the fact that all unstuffed blocks are
  * allocated from the same RG.  But watch, this may not always
@@ -448,8 +440,8 @@ ssize_t gfs2_listxattr(struct dentry *dentry, char *buffer, size_t size)
 }
 
 /**
- * ea_iter_unstuffed - copies the unstuffed xattr data to/from the
- *                     request buffer
+ * gfs2_iter_unstuffed - copies the unstuffed xattr data to/from the
+ *                       request buffer
  * @ip: The GFS2 inode
  * @ea: The extended attribute header structure
  * @din: The data to be copied in
@@ -573,7 +565,7 @@ int gfs2_xattr_acl_get(struct gfs2_inode *ip, const char *name, char **ppdata)
 }
 
 /**
- * gfs2_xattr_get - Get a GFS2 extended attribute
+ * __gfs2_xattr_get - Get a GFS2 extended attribute
  * @inode: The inode
  * @name: The name of the extended attribute
  * @buffer: The buffer to write the result into
@@ -801,14 +793,11 @@ static int ea_init_i(struct gfs2_inode *ip, struct gfs2_ea_request *er,
 	return error;
 }
 
-/**
+/*
  * ea_init - initializes a new eattr block
- * @ip:
- * @er:
  *
  * Returns: errno
  */
-
 static int ea_init(struct gfs2_inode *ip, int type, const char *name,
 		   const void *data, size_t size)
 {
@@ -1164,7 +1153,7 @@ static int gfs2_xattr_remove(struct gfs2_inode *ip, int type, const char *name)
 
 /**
  * __gfs2_xattr_set - Set (or remove) a GFS2 extended attribute
- * @ip: The inode
+ * @inode: The inode
  * @name: The name of the extended attribute
  * @value: The value of the extended attribute (NULL for remove)
  * @size: The size of the @value argument
-- 
2.27.0

