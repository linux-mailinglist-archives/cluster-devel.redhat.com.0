Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C1DDD34EE3D
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:47:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-uCL5pUvrMdet08FojEPbcA-1; Tue, 30 Mar 2021 12:47:27 -0400
X-MC-Unique: uCL5pUvrMdet08FojEPbcA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B5651005D58;
	Tue, 30 Mar 2021 16:47:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 679B860871;
	Tue, 30 Mar 2021 16:47:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A6CB18155DD;
	Tue, 30 Mar 2021 16:47:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGj9Ca010744 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E98A2166B44; Tue, 30 Mar 2021 16:45:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47B542157F24
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 071BB81C964
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-503-sAt79XMqMhmarS7RyAJZlQ-1; Tue, 30 Mar 2021 12:45:04 -0400
X-MC-Unique: sAt79XMqMhmarS7RyAJZlQ-1
Received: by mail-wr1-f46.google.com with SMTP id j9so15171675wrx.12
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hX4c3dvNt7mKQZ9EtHrANR7zKvje+/DsUArCAOpPAxo=;
	b=izzSiFYS4OGTq0582cWhvWga78I99i/dRlPJlICoRKLwFtNdiA1YF6J6FTtnIyC/jN
	sAn4kcLwkeuMQHhmI/lJujfdWzjxKlLE7Cw2uN7NpeK4V4w7R21o3lG+if7E0q4VcFou
	a+pfggjAOcx5sdXvTyyPc3rKksvH9D+WLj8KR6OjH66Ft1CtZOcKHZP+giapfHHggqrt
	AVThAtfThKUr+ceeyvSqxg6m2mOIKfYB0sxFwgAd7ZDRufw4TXMLr6PA5XbnOu5H99F5
	IIo3Mqtagtp85SdXZPnJxN2ext9SY1avCEdZD3tsHw2iu5yOHjzxHOlOOiXzLIqX87Fx
	Hy/g==
X-Gm-Message-State: AOAM533WnywGurbTR+S7QkfhF2yS6vBcpB6m1tm0gsUGGOpUrtYW6MgW
	TEU66O/tIZcfCgKi0fWy6slAag==
X-Google-Smtp-Source: ABdhPJzpMXQko2D3UFs8+f/kYkyaRHzL86/nAvCPzzz9zaLjxOxavCcpnSysA8SNm+ag9Lxgj29vng==
X-Received: by 2002:a5d:591a:: with SMTP id v26mr34589876wrd.172.1617122703371;
	Tue, 30 Mar 2021 09:45:03 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:02 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:29 +0100
Message-Id: <20210330164458.1625478-3-lee.jones@linaro.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 02/31] fs: gfs2: xattr: Help out some
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

