Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8054E34EE26
	for <lists+cluster-devel@lfdr.de>; Tue, 30 Mar 2021 18:45:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-nlJh-cdkOJO_kBd-IplZSQ-1; Tue, 30 Mar 2021 12:45:21 -0400
X-MC-Unique: nlJh-cdkOJO_kBd-IplZSQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DFE36B9D9;
	Tue, 30 Mar 2021 16:45:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFFF019C44;
	Tue, 30 Mar 2021 16:45:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C7BB18155DD;
	Tue, 30 Mar 2021 16:45:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12UGjG7l010821 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 30 Mar 2021 12:45:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 048672026D6B; Tue, 30 Mar 2021 16:45:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F35FB2026D65
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8107C811E93
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 16:45:13 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-488-c2WUdgEjPc2xuDlxnXfucQ-1; Tue, 30 Mar 2021 12:45:11 -0400
X-MC-Unique: c2WUdgEjPc2xuDlxnXfucQ-1
Received: by mail-wm1-f54.google.com with SMTP id
	t5-20020a1c77050000b029010e62cea9deso8790354wmi.0
	for <cluster-devel@redhat.com>; Tue, 30 Mar 2021 09:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b7E9ANSWVnOkd6S+LvdaLCdOS3FRa7Vd+au3GaJnYrI=;
	b=li2NKiiVc32WRXLD13oXN/xt+4q8lT5azYAXxaRZHwGE8TTMJInKA6YrCl2hHaJWVo
	WLm4ohPoNjv8J3y4WaQ1Jtnsz2tRt7hBq9oLJ65Fy2fcf1egLGGfRb5Kd+q+4eQOItma
	QQZgc/Z4Fv0vfKvf97iG8QA6kH99SANrPMtahMCCtTX/1g/O3FAGqPPeYFEaAxC27U6Y
	bRsCPwuie4DtFoEuzXF07hveNZ1tzSqxuNMrR/QL3joP+5tKCimaWn50iSGcCQmQrlGi
	VDxTTzryYnNG+qOnQgyZuudTpwDZDV/ZCnnvsMP+CF+XUgCt6LOExiJ4LntoGyzE9HF2
	HuRQ==
X-Gm-Message-State: AOAM530LkYlc56+YaIe3TYTrWW0Dnp3HndqJydBaqiN05yYBZI56YmU8
	t3mvNSpQH0LNuHt2YvYR/mUeWmqyCWYl+w==
X-Google-Smtp-Source: ABdhPJwCk3P+TYA5zfxerNkG0iKDd/6+8j3OZvSjQUsjScjybqSh/0o+6k43Ke3/mcrUCaPxfNcz6A==
X-Received: by 2002:a1c:6a05:: with SMTP id f5mr4898917wmc.75.1617122709878;
	Tue, 30 Mar 2021 09:45:09 -0700 (PDT)
Received: from dell.default ([91.110.221.217])
	by smtp.gmail.com with ESMTPSA id
	a15sm25660805wrr.53.2021.03.30.09.45.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 30 Mar 2021 09:45:09 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Tue, 30 Mar 2021 17:44:36 +0100
Message-Id: <20210330164458.1625478-10-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 09/31] fs: gfs2: meta_io: Add missing
	description for 'rahead' param
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Fixes the following W=1 kernel build warning(s):

 fs/gfs2/meta_io.c:249: warning: Function parameter or member 'rahead' not described in 'gfs2_meta_read'

Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 fs/gfs2/meta_io.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index c38e3805f4689..9f01df6a84911 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -243,6 +243,7 @@ static void gfs2_submit_bhs(int op, int op_flags, struct buffer_head *bhs[],
  * @gl: The glock covering the block
  * @blkno: The block number
  * @flags: flags
+ * @rahead: Do read-ahead
  * @bhp: the place where the buffer is returned (NULL on failure)
  *
  * Returns: errno
-- 
2.27.0

