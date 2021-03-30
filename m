Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 28A5E34EE39
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:47:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-4E8-XigCMxiSPAeIstGRXQ-1; Tue, 30 Mar 2021 12:47:03 -0400
X-MC-Unique: 4E8-XigCMxiSPAeIstGRXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAC2F180FCAB;
	Tue, 30 Mar 2021 16:47:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A97CB5C5AE;
	Tue, 30 Mar 2021 16:47:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9585C4A7C8;
	Tue, 30 Mar 2021 16:47:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjFd8010809 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CC502166B44; Tue, 30 Mar 2021 16:45:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 572182166B2D
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E57A811E9C
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-341-ohDHp8jQMtqulSTBXW7c0g-1; Tue, 30 Mar 2021 12:45:10 -0400
X-MC-Unique: ohDHp8jQMtqulSTBXW7c0g-1
Received: by mail-wm1-f46.google.com with SMTP id
	b2-20020a7bc2420000b029010be1081172so8783869wmj.1
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dDw5EBc2NIDbfXjwrfN0J0Ba7xy8ebZtYdNOOedaL18=;
	b=d97YGa3kyevy0JE8r9I5JEIqKLoJ3c78LzOtMFVZ9MhK4MrIgeBNb3nJEaA3qKjO9h
	e7Eo5Y+INsUf3r2ITLP+VOLIRwqbbs7eg2HxqpcgZc1XR5+rQ5+O6vbQbae5Qa1Bu5JC
	8YQUYi4vT8mYuWlgTUyzZ6K39o2wMBByiM9OJqXXOVs4HNB2txZuY4WEoh0IWBrPuz74
	exRSrE3YPbkZPPwFNR9kNnFcCAjcKo94aK9IDHjIYf8rGtSHtiI0v+oKmQa6VLp0YJ9L
	ygoRWMw9yGR1TjrsxP9mEo9yzvc93FJwZtgibZlRd+nPxAvsviSyF3dA49c8M9asDNp3
	2LgQ==
X-Gm-Message-State: AOAM531WO10HGtpVKJLe7OSFEYWMZ1Rb8pKSIZFEVhVg7A097gOkU9fk
	VLPOwy7cj+cWzKF7St3c1k7tiw==
X-Google-Smtp-Source: ABdhPJweOxPa1+8eE5m33CxyD6v1omczvxeDd+pXvbLfgAow70mN+MDiVOpC3dh3UQ3iyMrn/U0glQ==
X-Received: by 2002:a1c:4382:: with SMTP id q124mr5078916wma.16.1617122708085; 
	Tue, 30 Mar 2021 09:45:08 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:07 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:34 +0100
Message-Id: <20210330164458.1625478-8-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 07/31] fs: gfs2: glock: Fix some deficient
	kernel-doc headers and demote non-conformant ones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/glock.c:365: warning: Function parameter or member 'gl' not described in 'do_error'
 fs/gfs2/glock.c:365: warning: Function parameter or member 'ret' not described in 'do_error'
 fs/gfs2/glock.c:461: warning: Function parameter or member 'new_state' not described in 'state_change'
 fs/gfs2/glock.c:1277: warning: Function parameter or member 'delay' not described in 'handle_callback'
 fs/gfs2/glock.c:1277: warning: Function parameter or member 'remote' not described in 'handle_callback'
 fs/gfs2/glock.c:1578: warning: Function parameter or member 'p' not described in 'nq_m_sync'
 fs/gfs2/glock.c:1993: warning: Excess function parameter 'wait' description in 'gfs2_gl_hash_clear'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/glock.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index 7cccc5e863a8a..c590e27aaf097 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -356,7 +356,7 @@ static void gfs2_holder_wake(struct gfs2_holder *gh)
 	}
 }
 
-/**
+/*
  * do_error - Something unexpected has happened during a lock request
  *
  */
@@ -453,8 +453,7 @@ static inline struct gfs2_holder *find_first_waiter(const struct gfs2_glock *gl)
 /**
  * state_change - record that the glock is now in a different state
  * @gl: the glock
- * @new_state the new state
- *
+ * @new_state: the new state
  */
 
 static void state_change(struct gfs2_glock *gl, unsigned int new_state)
@@ -1263,7 +1262,7 @@ int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs)
 	return ret;
 }
 
-/**
+/*
  * handle_callback - process a demote request
  * @gl: the glock
  * @state: the state the caller wants us to change to
@@ -1568,6 +1567,7 @@ static int glock_compare(const void *arg_a, const void *arg_b)
  * nq_m_sync - synchonously acquire more than one glock in deadlock free order
  * @num_gh: the number of structures
  * @ghs: an array of struct gfs2_holder structures
+ * @p: placeholder for the holder structure to pass back
  *
  * Returns: 0 on success (all glocks acquired),
  *          errno on failure (no glocks acquired)
@@ -1984,7 +1984,6 @@ static void dump_glock_func(struct gfs2_glock *gl)
 /**
  * gfs2_gl_hash_clear - Empty out the glock hash table
  * @sdp: the filesystem
- * @wait: wait until it's all gone
  *
  * Called when unmounting the filesystem.
  */
-- 
2.27.0

