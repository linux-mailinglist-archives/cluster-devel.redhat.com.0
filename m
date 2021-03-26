Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 301A634A461
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 10:31:21 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-Lmc6pYz8NayEjbrPATiWfQ-1; Fri, 26 Mar 2021 05:31:18 -0400
X-MC-Unique: Lmc6pYz8NayEjbrPATiWfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD44B50207;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A1E467891;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 82ABE4A706;
	Fri, 26 Mar 2021 09:31:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q9C7cS012299 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 05:12:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F1C212026D65; Fri, 26 Mar 2021 09:12:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECF452026D48
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5068100DE93
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 09:12:06 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
	[209.85.218.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-260-ZEdLMAccOyqOq5SROrIJZA-1; Fri, 26 Mar 2021 05:12:04 -0400
X-MC-Unique: ZEdLMAccOyqOq5SROrIJZA-1
Received: by mail-ej1-f44.google.com with SMTP id a7so7328303ejs.3
	for <cluster-devel@redhat.com>; Fri, 26 Mar 2021 02:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Rh7+6VZagF62oLd2fZv1hzXiSRvNqAreFqP0LRkuxi0=;
	b=UgefNOqXhMeFrLRLUwTnjd2MIRkZARYV7ohgVyxK7GPKnFnvkf42hCs+aEjMi3deCW
	ZUnYkQZ7LCazDJK/8x8iNcuEMqRUfS4ccY7S+8ax2PqBCcESUWH/vp6U5r9kMeSsp3EN
	dIKhePA0/5lXAYrLoYq+1sgZQzXlVJUWrEwC/0LzdhN5v7kl0nNQMpng2/rGLBK1W9F3
	AGkk68IkVpIYd0tILc2Bp4QTmxlp8N5SWO/3nmx9e7bqCE06LugeT4oX8DnpCc848ZFF
	hc2oRsZN4MLdf1VnlPzHXycH9ky8v8av9a8uLhzqkLBFZ3vo1VZI8a9ZcJnZ/IXiwjpg
	D2yg==
X-Gm-Message-State: AOAM532kBEWBdebX9TnpV2HMuF6tRDXNYDWSU/ASdnA5oV+bXdRVkTC4
	xb6LdMTVruHQ0gwwQvvufEDpjg==
X-Google-Smtp-Source: ABdhPJwCi3YrMGQvYH+fYdfuHsO82T/noAw26g1FP4zB7xqJBJI4+uQmJUb3Ccy9RQV8eutefbumXQ==
X-Received: by 2002:a17:906:b7d5:: with SMTP id
	fy21mr14181298ejb.153.1616749923237; 
	Fri, 26 Mar 2021 02:12:03 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
	by smtp.gmail.com with ESMTPSA id r13sm3895645edy.3.2021.03.26.02.12.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 26 Mar 2021 02:12:02 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 26 Mar 2021 09:11:42 +0000
Message-Id: <20210326091151.311647-10-lee.jones@linaro.org>
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
Subject: [Cluster-devel] [PATCH 09/18] fs: gfs2: meta_io: Add missing
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
index 2db573e31f78d..23ce2a82a0e7f 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -239,6 +239,7 @@ static void gfs2_submit_bhs(int op, int op_flags, struct buffer_head *bhs[],
  * @gl: The glock covering the block
  * @blkno: The block number
  * @flags: flags
+ * @rahead: Do read-ahead
  * @bhp: the place where the buffer is returned (NULL on failure)
  *
  * Returns: errno
-- 
2.27.0

