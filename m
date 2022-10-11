Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3333E5FBC00
	for <lists+cluster-devel@lfdr.de>; Tue, 11 Oct 2022 22:23:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665519809;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vuYB1bfLBT/BybnhJAIKow6KEoVAgUejtP+5COBxF5k=;
	b=EH5RInn1NPfn4sKFJ9Y9BtCtOtcSjRLDhbmHyHZNlgeDhI4qgk2oNwmnz3dtFmh1BHkwI+
	DV7VF5lKRcT1q1W7Wdt4wbb9MMoVUPDASOEcLfeAg4aQoQl4wY/dfN5qJ9xeLiWhXn0UDN
	OctthD8gmL0PyGJlbHAlnyZ5psDjSUg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-EOpREVCnORK3rQD0C2Tn0g-1; Tue, 11 Oct 2022 16:23:26 -0400
X-MC-Unique: EOpREVCnORK3rQD0C2Tn0g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08B53811E75;
	Tue, 11 Oct 2022 20:23:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B158B492B05;
	Tue, 11 Oct 2022 20:23:25 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7EF1319465A2;
	Tue, 11 Oct 2022 20:23:25 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E09BD194658F for <cluster-devel@listman.corp.redhat.com>;
 Tue, 11 Oct 2022 20:23:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AE72AC15BB3; Tue, 11 Oct 2022 20:23:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A6B16C15BAB
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 20:23:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C62C811E7A
 for <cluster-devel@redhat.com>; Tue, 11 Oct 2022 20:23:24 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-115-bY-Jxpg1Oii5_A0b-trXwg-1; Tue, 11 Oct 2022 16:23:22 -0400
X-MC-Unique: bY-Jxpg1Oii5_A0b-trXwg-1
Received: by mail-pf1-f176.google.com with SMTP id d10so14562051pfh.6;
 Tue, 11 Oct 2022 13:23:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vuYB1bfLBT/BybnhJAIKow6KEoVAgUejtP+5COBxF5k=;
 b=bOtplabJynB5l9Kaqd4T64M7/ouTqRNoUNDvjKU6uJ2ps09lC0JwadzkJ8t9+1m6yA
 l1hvyTL8btL3cTQfZprQNFRHwQ37Pd8UOjXc6mpzcSQAouN9ieHp3SiW1vnfjEcWQ/RF
 RW7C8jt4DPZQIBlygnsu+UOPjtTuOKVtfgRktAwx4k90bZfNiu2eQFv2XmEPP0Y/NHiR
 fJqT9Gr/EBXUbTeALFHyOOQyvEYtvZkEhxQwCeZitcBZGEfXXAenjvQ/lnYTTm/ZLhyl
 z2TEDXqyPHbEpCRgqRNKqSgndhzhw3GrrRZGZn0ny53mu8kiDDs/c+JH7aOSkUIS/zr/
 p+JQ==
X-Gm-Message-State: ACrzQf03ZRuWy6sQWRhCXzetusoiDP0RPv3bH3xW06vOtoGzqMr/+jW1
 nHJJJTaS/i/rx/0fgYo/KNN+ig0JAbCYwQ==
X-Google-Smtp-Source: AMsMyM7aZBwmnOQaMKYMww1thIRvLjyiBjPkD1azfYPOnr2//Eyj2e0j+qLVme8PE1t+Bz6rowqokw==
X-Received: by 2002:aa7:810a:0:b0:55b:674d:d123 with SMTP id
 b10-20020aa7810a000000b0055b674dd123mr27740591pfi.52.1665519801056; 
 Tue, 11 Oct 2022 13:23:21 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 24-20020a631558000000b0045feab454f6sm6387757pgv.51.2022.10.11.13.23.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 13:23:20 -0700 (PDT)
Date: Wed, 12 Oct 2022 09:23:14 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>, cluster-devel@redhat.com
Message-ID: <Y0XQsqdRzlrSpgOh@mail.google.com>
MIME-Version: 1.0
In-Reply-To: <202210111305.743F591@keescook>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH v5] [next] dlm: replace one-element array
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

v5: use preferred sizeof style. Req: Gustavo Silva
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
index bae050df7abf..9479c8110979 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -473,7 +473,7 @@ static int new_lockspace(const char *name, const char *cluster,
 
 	error = -ENOMEM;
 
-	ls = kzalloc(sizeof(struct dlm_ls) + namelen, GFP_NOFS);
+	ls = kzalloc(sizeof(*ls), GFP_NOFS);
 	if (!ls)
 		goto out;
 	memcpy(ls->ls_name, name, namelen);
-- 
2.37.3

