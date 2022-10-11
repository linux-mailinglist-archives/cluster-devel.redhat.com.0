Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7C55FBBC4
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Oct 2022 22:04:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665518676;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1mcFLXqtRl0XJ50RmZ7UiVHxAaM7FNqJT26e3F2Iovs=;
	b=IU3RMO0hR0RpWifVGl78jTgjHe25zH+a0xKjY4/weZNw+sw7QNVvd/o1b6ooNNYV433IbH
	zrHVS/5UdbdZtQiHAcboSzLW3LYijBIaVp7UdjeKFZPi82CD3yWKO0gK2NgJ6RIraRacry
	Z2zP2umLcWshvkfTgzWL6gIammnysZk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-ZUWateKFPyS1aKmbDEFntA-1; Tue, 11 Oct 2022 16:04:33 -0400
X-MC-Unique: ZUWateKFPyS1aKmbDEFntA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 611AE85A5B6;
	Tue, 11 Oct 2022 20:04:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44619414A809;
	Tue, 11 Oct 2022 20:04:32 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 37C1519465A2;
	Tue, 11 Oct 2022 20:04:28 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6E10F194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 20:04:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0EF012157F45; Tue, 11 Oct 2022 20:04:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0812E2166B2F
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 20:04:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEAE28828C6
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 20:04:26 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-628-1aUjxL5sPZqjxmyVA5zvmg-1; Tue, 11 Oct 2022 16:04:23 -0400
X-MC-Unique: 1aUjxL5sPZqjxmyVA5zvmg-1
Received: by mail-pj1-f42.google.com with SMTP id pq16so13439025pjb.2;
 Tue, 11 Oct 2022 13:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1mcFLXqtRl0XJ50RmZ7UiVHxAaM7FNqJT26e3F2Iovs=;
 b=E1WGq5JEn8IyMdw8CliBa4GVMZ6LYtEv4qtxhJ7RnsZtz8KjH1IIw3Y2FrytBZ9erh
 tVPQW52z1tOrNcWvxhczfQXhCv6ZhVvfqONy29IJ2BvCO8aq83TCpuUdusD9oBtjaQjW
 bTWSXlzDZyAXdp0y/HqtdA1lg9/QS0Y7t5mTnYkXZdAoHQF3mAZriONkFiNiBb0NU0hf
 wX7Tcx7c62JD9ak1S+LRdwfoHdjUh0AUSwrNpsYQjBYtAxU4bHuZx302c+qaIFP7IG13
 jIYkam4vlk0X2w+tzaxfE9yOoBkd7kJkc+tw0pABQULWHJsUVS1KbRFwNuDtt7mPVIy2
 iXoA==
X-Gm-Message-State: ACrzQf2vDR5GLP6+FOyMSHmsFP8qHl8IHDnzL6VVYagIxcV5gOzhwLOh
 VJg9hr4pclMjKU7mPPENOpLM52rN/6It8Q==
X-Google-Smtp-Source: AMsMyM7oxB+GXhhjKdUbdC7MsY+skrJqg7L39sa8j1qeR4QTdEcix2nUt1DvbVTvH5KiCUhapuKXIQ==
X-Received: by 2002:a17:90b:1d88:b0:20d:7449:c0ef with SMTP id
 pf8-20020a17090b1d8800b0020d7449c0efmr905477pjb.103.1665518661683; 
 Tue, 11 Oct 2022 13:04:21 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b00561f8fdba8esm9715166pfl.12.2022.10.11.13.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 13:04:20 -0700 (PDT)
Date: Wed, 12 Oct 2022 09:04:15 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>, cluster-devel@redhat.com
Message-ID: <Y0XMP2RMkE4MWNPE@mail.google.com>
MIME-Version: 1.0
In-Reply-To: <Y0W5jkiXUkpNl4ap@mail.google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH v4] [next] dlm: replace one-element array
 with fixed size array
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: paulo.miguel.almeida.rodenas@gmail.com, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

One-element arrays are deprecated. So, replace one-element array with
fixed size array member in struct dlm_ls, and refactor the rest of the
code, accordingly.

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/228
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836
Link: https://lore.kernel.org/lkml/Y0W5jkiXUkpNl4ap@mail.google.com/

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
Changelog:

v4: resend patch using the right version number. Req: Gustavo Silva
v3: replace one-element array with a fixed size array. Req: Kees Cook
v2: patch resent as I had an issue with a <CRLF> char in my mail client
v1: https://lore.kernel.org/lkml/Y0ICbf8tCtXMn+W0@mail.google.com/
---
 fs/dlm/dlm_internal.h | 2 +-
 fs/dlm/lockspace.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index e34c3d2639a5..94fadb619ba0 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -670,7 +670,7 @@ struct dlm_ls {
 	void			*ls_ops_arg;
 
 	int			ls_namelen;
-	char			ls_name[1];
+	char			ls_name[DLM_LOCKSPACE_LEN + 1];
 };
 
 /*
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index bae050df7abf..23de0d47cbc1 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -473,7 +473,7 @@ static int new_lockspace(const char *name, const char *cluster,
 
 	error = -ENOMEM;
 
-	ls = kzalloc(sizeof(struct dlm_ls) + namelen, GFP_NOFS);
+	ls = kzalloc(sizeof(struct dlm_ls), GFP_NOFS);
 	if (!ls)
 		goto out;
 	memcpy(ls->ls_name, name, namelen);
-- 
2.37.3

