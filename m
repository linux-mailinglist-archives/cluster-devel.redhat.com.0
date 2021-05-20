Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id AEC9538AD9C
	for <lists+cluster-devel@lfdr.de>; Thu, 20 May 2021 14:08:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-iEpOWF7vMfuPpWs8htVZ-w-1; Thu, 20 May 2021 08:07:59 -0400
X-MC-Unique: iEpOWF7vMfuPpWs8htVZ-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3532A107ACC7;
	Thu, 20 May 2021 12:07:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28D9360CE9;
	Thu, 20 May 2021 12:07:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A6835F9B0;
	Thu, 20 May 2021 12:07:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14KC0wuj028103 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 08:00:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7392C113B66; Thu, 20 May 2021 12:00:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DCC6113B70
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 12:00:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A8D795F34C
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 12:00:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-151-Iamub6hwOJqBnAAb7sxrxQ-1; Thu, 20 May 2021 08:00:48 -0400
X-MC-Unique: Iamub6hwOJqBnAAb7sxrxQ-1
Received: by mail-wr1-f44.google.com with SMTP id y14so15293342wrm.13
	for <cluster-devel@redhat.com>; Thu, 20 May 2021 05:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=litDP3dBoSqeZ9ru2ThnWBI6UxCaLCk4fTIzC6ohx5w=;
	b=lI1fa/X/3gBv0i1DqEMhiK3+lka8k28jhAWnmTWeEgP6K1FxY38A0TgIlvaRD0yAlW
	RU1BuXzGkA9gtsn2i5IJ80rhIVWnnrGIaw7om+OdxiEMLNWd19KyUf+XVeA5hxzQXr59
	qQA58C4s1QfIODg0u6k+GzzKIQqlQ1Eyb7EgOfofin0vEiGqQNN/lyRapnjuxNHeSh1a
	2X8x6BGA/UEeRwifx+16Qh9ialCuw3Sk8T8Wv+XKFHHu+9a9BTG0EBEgiYrQTQpLGNj7
	IhinRN63NcCsup/DTB02FK5tHPuPSDQOSjJjDmsfMadcS5lsLaD9IAJ76Mnc+T3g1hzG
	m6FQ==
X-Gm-Message-State: AOAM531yY+XpD6uVakZre0i8/ks/jE3YRlAsBci1mM7YjHIi05xRrO7H
	IYQk1fAma6a6+b6IDCF48EzypA==
X-Google-Smtp-Source: ABdhPJwEhQLoR/jKiPzjr4RLG0YjO1K801kkHxeAW1FaHiBqq24IajxLwf28og9Am1zvLL3RF1gTeQ==
X-Received: by 2002:adf:fdce:: with SMTP id i14mr3788703wrs.303.1621512047225; 
	Thu, 20 May 2021 05:00:47 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
	by smtp.gmail.com with ESMTPSA id
	s199sm8848269wme.43.2021.05.20.05.00.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 May 2021 05:00:46 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu, 20 May 2021 13:00:30 +0100
Message-Id: <20210520120043.3462759-3-lee.jones@linaro.org>
In-Reply-To: <20210520120043.3462759-1-lee.jones@linaro.org>
References: <20210520120043.3462759-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH 02/15] fs: gfs2: glock: Fix some deficient
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 fs/gfs2/glock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/glock.c b/fs/gfs2/glock.c
index ea7fc5c641c7e..0b34f50b51331 100644
--- a/fs/gfs2/glock.c
+++ b/fs/gfs2/glock.c
@@ -356,7 +356,7 @@ static void gfs2_holder_wake(struct gfs2_holder *gh)
 	}
 }
 
-/**
+/*
  * do_error - Something unexpected has happened during a lock request
  * @gl: The glock
  * @ret: The status from the DLM
@@ -1263,7 +1263,7 @@ int gfs2_glock_async_wait(unsigned int num_gh, struct gfs2_holder *ghs)
 	return ret;
 }
 
-/**
+/*
  * handle_callback - process a demote request
  * @gl: the glock
  * @state: the state the caller wants us to change to
-- 
2.31.1

