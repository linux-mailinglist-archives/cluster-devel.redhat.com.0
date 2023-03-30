Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4196D066B
	for <lists+cluster-devel@lfdr.de>; Thu, 30 Mar 2023 15:21:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680182488;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UMgOcaBYHmqhOkJHME9qiHTqpNNGWfEaKghbG+Vz4mM=;
	b=Cvht81DHdSmh8VFYp6uaxdU7sBqUMEhCUAzML1tD4FmKJnnw2XZJ4otavmaGd7IYLHm11w
	zHy2twxglx7KVIOq6sH28EsFC9Dv7619oXE0ywlTzuH4ckH9cbRKnjUWLyLuRh+iTg38QC
	3ULZwj0137hqtti9pryNw1tsxRWzTkw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-zGf9HWaIMzCefLQgEhCItA-1; Thu, 30 Mar 2023 09:21:23 -0400
X-MC-Unique: zGf9HWaIMzCefLQgEhCItA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEB688028AD;
	Thu, 30 Mar 2023 13:21:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8ABA5202701F;
	Thu, 30 Mar 2023 13:21:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 470E319465A2;
	Thu, 30 Mar 2023 13:21:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 058F31946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 30 Mar 2023 13:21:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D9816C15BB8; Thu, 30 Mar 2023 13:21:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D16CBC15BA0
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 13:21:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B6446185A791
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 13:21:19 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-tThgjIPlPMmyjRBD6qGrBg-1; Thu, 30 Mar 2023 09:21:18 -0400
X-MC-Unique: tThgjIPlPMmyjRBD6qGrBg-1
Received: by mail-qt1-f199.google.com with SMTP id
 w13-20020ac857cd000000b003e37d3e6de2so12439158qta.16
 for <cluster-devel@redhat.com>; Thu, 30 Mar 2023 06:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680182478;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UMgOcaBYHmqhOkJHME9qiHTqpNNGWfEaKghbG+Vz4mM=;
 b=5rHo4muY0BQSxHAu9E0IJLoqJD2ptBWYZo47VSj1rMqyA7lQE2f1N8G79VufKsyygH
 167vMiiHJNa9kiSnMZrFRZxwjsDg38H/BRa1YxbT0DNglfeVnW+0TCnGqMCqlREG1bHW
 X4c78H/iS+ei86+IX0Q+BRn1HIL1p2tTlxSEmqt4Z8vUpEfH0SX+eg8GfquSucmdBKbi
 8CIV2QQmcrQZ1TmtSdYv8se7vBj5jk3PXXAzfY5UfqmVPLeFcVIuiwjlTMwUalUpjW4+
 lZNVuq21WEgrrSHjpTJuE3mPQMeg8X0HMV98rXHUD83EcKzxNYI+OakruqNQ7KmEmTSR
 BUeQ==
X-Gm-Message-State: AAQBX9fiscW3lGPJJXCX7r+AZDVHwQJ40yotmGzX4mlzkJZMO6+eKhcF
 ECwh1DDCMBWv2I8kaJQh4grrQAIR2J52Og8iG3sBdi2KRAKR98mQRdwDEyhsqr5a+vYPE7M/ltC
 fJ4K6B/zdexsy4E/1Xwon6g==
X-Received: by 2002:ac8:57c2:0:b0:3b6:3a12:2bf9 with SMTP id
 w2-20020ac857c2000000b003b63a122bf9mr41512587qta.2.1680182477788; 
 Thu, 30 Mar 2023 06:21:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set/gzHee0RWTGrj5XptDSoc7k80mtN1LbJfu1rmyF743GurwDMiR8L9IeT+B4QfnE1T3ZSvMjQ==
X-Received: by 2002:ac8:57c2:0:b0:3b6:3a12:2bf9 with SMTP id
 w2-20020ac857c2000000b003b63a122bf9mr41512554qta.2.1680182477546; 
 Thu, 30 Mar 2023 06:21:17 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com
 (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id
 fu48-20020a05622a5db000b003b9b8ec742csm17026168qtb.14.2023.03.30.06.21.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 06:21:17 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: ccaulfie@redhat.com, teigland@redhat.com, nathan@kernel.org,
 ndesaulniers@google.com
Date: Thu, 30 Mar 2023 09:21:14 -0400
Message-Id: <20230330132114.1826399-1-trix@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH] fs: dlm: remove unused count_match variable
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
Cc: cluster-devel@redhat.com, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
fs/dlm/dir.c:67:26: error: variable
  'count_match' set but not used [-Werror,-Wunused-but-set-variable]
        unsigned int count = 0, count_match = 0, count_bad = 0, count_add = 0;
                                ^
This variable is not used so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 fs/dlm/dir.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/fs/dlm/dir.c b/fs/dlm/dir.c
index fb1981654bb2..982f7a5570fe 100644
--- a/fs/dlm/dir.c
+++ b/fs/dlm/dir.c
@@ -64,7 +64,7 @@ int dlm_recover_directory(struct dlm_ls *ls)
 	char *b, *last_name = NULL;
 	int error = -ENOMEM, last_len, nodeid, result;
 	uint16_t namelen;
-	unsigned int count = 0, count_match = 0, count_bad = 0, count_add = 0;
+	unsigned int count = 0, count_bad = 0, count_add = 0;
 
 	log_rinfo(ls, "dlm_recover_directory");
 
@@ -158,14 +158,6 @@ int dlm_recover_directory(struct dlm_ls *ls)
 							     b, namelen);
 				}
 
-				/* The name was found in rsbtbl, and the
-				 * master nodeid matches memb->nodeid. */
-
-				if (result == DLM_LU_MATCH &&
-				    nodeid == memb->nodeid) {
-					count_match++;
-				}
-
 				/* The name was not found in rsbtbl and was
 				 * added with memb->nodeid as the master. */
 
-- 
2.27.0

