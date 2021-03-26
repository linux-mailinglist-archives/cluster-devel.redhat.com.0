Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3BE34A456
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:18 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-3xxtkOtpOJuzsxvXlp5grg-1; Fri, 26 Mar 2021 05:31:15 -0400
X-MC-Unique: 3xxtkOtpOJuzsxvXlp5grg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28FA010866AD;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 184C7299A1;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F22971800216;
	Fri, 26 Mar 2021 09:31:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9C7hB012300 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D06F21CAC6F; Fri, 26 Mar 2021 09:12:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F24A021CAC7D
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D00CE8002E2
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:06 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
	[209.85.218.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-352-l716npKuNUWnGcKQNSxlqg-1; Fri, 26 Mar 2021 05:12:02 -0400
X-MC-Unique: l716npKuNUWnGcKQNSxlqg-1
Received: by mail-ej1-f43.google.com with SMTP id ce10so7315433ejb.6
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dDw5EBc2NIDbfXjwrfN0J0Ba7xy8ebZtYdNOOedaL18=;
	b=Hkp++DGJ13vtHnNDYpqciGyJck9kJ5NIzYEclsMpDjHtax1Go0K6rX7ttSoGp40Bbh
	tbmTW1Lpb8MfGmwbOA4+qo0uqhP6DqfbhmNeJXJtmA7rr/qOqmFo8Zz2svPG1L/24bIK
	giZIFep6n8kfAVNmkDmXqUoIX2H2gxCLKmmsHYgr6zGTzpQTREX/e2rFIM3+MG88vAYz
	zhhj8N5tTavXfFk2BBT/HYKsv1l7yOh8GamfveM+9M73+ZT+2FbkLS6Spl8OOuFEmdQ1
	at/frxiwVXp6D6C8E8GEDdTNOcmtKVv50tXB4Wppvoy3IbS7aUiFaSgV40BAw9AIgZxq
	VJJQ==
X-Gm-Message-State: AOAM533oo6sRY7MmI8sTK5pjwTuMQ0HVUKRpR+KZwsUgCu/ZAVJyBxy8
	4Sj7TDFte3/GVGcRed7jiw0WBw==
X-Google-Smtp-Source: ABdhPJwkM6j9lU8imYlDo/vSfQp9mpMjEVbgfo99VUa6BnQG8RsyEmnHiKf6leg8wDggLrqKVgWyzQ==
X-Received: by 2002:a17:906:c08f:: with SMTP id
	f15mr14171512ejz.318.1616749921488; 
	Fri, 26 Mar 2021 02:12:01 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.12.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:01 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:40 +0000
Message-Id: <20210326091151.311647-8-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 07/18] fs: gfs2: glock: Fix some deficient
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

