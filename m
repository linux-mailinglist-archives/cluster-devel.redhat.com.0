Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C31F45F9C47
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Oct 2022 11:54:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665395684;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=lULkEACMGXAqLMVro1NAmGHqDFrc11oNE+hqnHHNv9k=;
	b=O9s6Fsm4GcQrkA329AS6xr4hejcJsg+pxqrkPGMyHrPcFwmTLKoroalwCS3BBGHakRU4LG
	qNcrwVNWbpJZ16wjzBpbpzrs+BHlQsexIWMuzWISBe6ZOgyD73dZ2p5vQRLqDAQckUAUVJ
	S2JRbxlOJ28u7smjMPYseP8vwbQaQ0A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-55i6tbH6NC-bLaiSui1RZA-1; Mon, 10 Oct 2022 05:54:41 -0400
X-MC-Unique: 55i6tbH6NC-bLaiSui1RZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB8528027FE;
	Mon, 10 Oct 2022 09:54:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52B6340C95A1;
	Mon, 10 Oct 2022 09:54:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 063DA19465A3;
	Mon, 10 Oct 2022 09:54:39 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 685521946586 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  8 Oct 2022 23:17:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 042DE112D164; Sat,  8 Oct 2022 23:17:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0DC5112D162
 for <cluster-devel@redhat.com>; Sat,  8 Oct 2022 23:17:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D10EC811E81
 for <cluster-devel@redhat.com>; Sat,  8 Oct 2022 23:17:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-KkvqMlB0N4WrhKemAar8ow-1; Sat, 08 Oct 2022 19:17:45 -0400
X-MC-Unique: KkvqMlB0N4WrhKemAar8ow-1
Received: by mail-pl1-f177.google.com with SMTP id b2so7484092plc.7;
 Sat, 08 Oct 2022 16:17:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lULkEACMGXAqLMVro1NAmGHqDFrc11oNE+hqnHHNv9k=;
 b=CqcN9DriQhIxNRBrucBAUfVEebFpFYulATILS/ZZjyl0te1/dfqS8CqXQmyIhwmqEq
 1rIIMZxC6lRDM3RhytxZN5TgtzB166XJgLRvk/4a2W4VvcBfv0lDDKAQqUB2e8Y8HIxB
 iy09uGgOwACE8gymImS9oQghtQ+6E7Uiv7RV/QG6vxEu9GKOWGDYjmH3hlDbtSIHqJMs
 nRNKNLmeURbKf8PhccjyUg9h7J7Ve3r9MlYdyaLok/xVgq9maGVTurx02ZDjnHntiaWA
 pCdQBP0N2Uj5RetVQd73JJTsWTnuxaGl4XyfYvG8xL8C92UCD7KJUJGx8jcb4NtikKD0
 2gfQ==
X-Gm-Message-State: ACrzQf1RbLT2JAtMi7aM/y6vCtTKjFGMS9xt3NxElAECLJt9YYwDE+Vt
 6uXWfTXPozbe8qixQNGS9XysZMvTut017g==
X-Google-Smtp-Source: AMsMyM4xCPYXMXi1Te7y4oshOQYKBRSbFnKh+S3fc5qSiQRjfgq0SfUO8kmr+SCApTGZiY4s8dHRlA==
X-Received: by 2002:a17:902:bc8c:b0:178:a406:72ea with SMTP id
 bb12-20020a170902bc8c00b00178a40672eamr11495880plb.56.1665271064101; 
 Sat, 08 Oct 2022 16:17:44 -0700 (PDT)
Received: from mail.google.com (122-58-209-93-fibre.sparkbb.co.nz.
 [122.58.209.93]) by smtp.gmail.com with ESMTPSA id
 c17-20020a170903235100b00180daa59314sm1963597plh.125.2022.10.08.16.17.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Oct 2022 16:17:43 -0700 (PDT)
Date: Sun, 9 Oct 2022 12:17:37 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: Christine Caulfield <ccaulfie@redhat.com>,
 David Teigland <teigland@redhat.com>, cluster-devel@redhat.com
Message-ID: <Y0IFEUjwXGZFf7bB@mail.google.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Mon, 10 Oct 2022 09:54:37 +0000
Subject: [Cluster-devel] [PATCH v2][next] dlm: Replace one-element array
 with flexible-array member
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

One-element arrays are deprecated, and we are replacing them with
flexible array members instead. So, replace one-element array with
flexible-array member in struct dlm_ls, and refactor the rest of the
code, accordingly.

We strive to make changes that don't produce any before/after binary
output differeces as that makes it easier for the reviewer to accept the
patch. In this particular instance, it wasn't possible to achieve this
due to the fact that the ls_name[1] size, which is used as the
NUL-terminator space, was hidden within the struct's padding as shown
below.

$ diff <(objdump -M intel -j .text -D dlm.old) <(objdump -M intel -j
.text -D dlm.new)

13778c13778
<     c693:	49 8d bc 24 c0 08 00 	lea    rdi,[r12+0x8c0]
---
>     c693:	49 8d bc 24 c1 08 00 	lea    rdi,[r12+0x8c1]

$ pahole dlm.old -C dlm_ls
...
	int                        ls_namelen;           /*  2232     4 */
	char                       ls_name[1];           /*  2236     1 */

	/* size: 2240, cachelines: 35, members: 90 */
	/* sum members: 2166, holes: 17, sum holes: 71 */
	/* padding: 3 */
	/* paddings: 3, sum paddings: 17 */
	/* forced alignments: 1 */
} __attribute__((__aligned__(8)));

$ pahole dlm.new -C dlm_ls
...
	int                        ls_namelen;           /*  2232     4 */
	char                       ls_name[];            /*  2236     0 */

	/* size: 2240, cachelines: 35, members: 90 */
	/* sum members: 2165, holes: 17, sum holes: 71 */
	/* padding: 4 */
	/* paddings: 3, sum paddings: 17 */
	/* forced alignments: 1 */
} __attribute__((__aligned__(8)));


This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
routines on memcpy() and help us make progress towards globally
enabling -fstrict-flex-arrays=3 [1].

Link: https://github.com/KSPP/linux/issues/79
Link: https://github.com/KSPP/linux/issues/228
Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101836 [1]

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
My apologies for v2, there was an accidental <Cr> I added on
the CC line which messed up the body of my previus email. 

This patch sets it right.

---
 fs/dlm/dlm_internal.h | 2 +-
 fs/dlm/lockspace.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index e34c3d2639a5..ce2e32ed2ede 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -670,7 +670,7 @@ struct dlm_ls {
 	void			*ls_ops_arg;
 
 	int			ls_namelen;
-	char			ls_name[1];
+	char			ls_name[];
 };
 
 /*
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index bae050df7abf..c3a36f3197da 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -473,7 +473,7 @@ static int new_lockspace(const char *name, const char *cluster,
 
 	error = -ENOMEM;
 
-	ls = kzalloc(sizeof(struct dlm_ls) + namelen, GFP_NOFS);
+	ls = kzalloc(sizeof(struct dlm_ls) + namelen + 1, GFP_NOFS);
 	if (!ls)
 		goto out;
 	memcpy(ls->ls_name, name, namelen);
-- 
2.37.3

