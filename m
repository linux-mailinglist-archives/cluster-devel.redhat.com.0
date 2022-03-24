Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 443DA4E69EC
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Mar 2022 21:41:42 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-MyD2CAUUN228KdhZayjxxw-1; Thu, 24 Mar 2022 16:41:38 -0400
X-MC-Unique: MyD2CAUUN228KdhZayjxxw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04664101AA45;
	Thu, 24 Mar 2022 20:41:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ACF16401476;
	Thu, 24 Mar 2022 20:41:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 66926194034F;
	Thu, 24 Mar 2022 20:41:35 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 91EB91940341 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 24 Mar 2022 19:02:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 68E3F5E0B1C; Thu, 24 Mar 2022 19:02:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63C9B5E0B15
 for <cluster-devel@redhat.com>; Thu, 24 Mar 2022 19:02:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BD262800F6B
 for <cluster-devel@redhat.com>; Thu, 24 Mar 2022 19:02:10 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-fYVKkEVlPPW80cDSZjUfjQ-1; Thu, 24 Mar 2022 15:01:54 -0400
X-MC-Unique: fYVKkEVlPPW80cDSZjUfjQ-1
Received: by mail-ej1-f47.google.com with SMTP id qa43so11030802ejc.12;
 Thu, 24 Mar 2022 12:01:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4w2VVx2sxwH+F4SysFPlkK+N3OSyF4vvd9h0lfWz2D0=;
 b=IWS0CClKKoYd16+EG9wq7nEgjFFH1UmcnquzIy2HFOWcoxSk9oQWOkStkfAijbl+d6
 VTtH2tG5iYQd14W8fshEZZpUXI00V4Hyv62Y4Oc823raSIRx2Us7U7vdpMIlgEK2ycrl
 2liNoB1HaKbjyFac4Li8ewJIJV2E1dZZHg0WVQpngk61TaxkjDfyKdMsVBMGeZnO0p9o
 B/WRMjHo3Pov+NmL0nnYDyvhCvBYimE90/t/LTdcxa0r2IJEe3BQoacsLllsNcg5P/wY
 TTj+GgYl/CgLtoMIZJK2lLkRiQngl/JlNHypf/dk4QTug8ZZZWew35+WahNqQP0myAGj
 RtEg==
X-Gm-Message-State: AOAM530u8WJWpOgbOw5gxZ2uC0x/bqIHY7mh2dGDXaZ8MGKgFKK0RG+w
 55FC4IjaJiTtvXs2SBttVU99qpydovI=
X-Google-Smtp-Source: ABdhPJxKT30KfccgpDSFYqewkYGJ9s5jHkNakz3uTTugTzOYXQeBktWiF10OuBNcxJfIs09kuUrc4w==
X-Received: by 2002:a17:906:c092:b0:6ce:1018:9f4e with SMTP id
 f18-20020a170906c09200b006ce10189f4emr7430161ejz.430.1648148511169; 
 Thu, 24 Mar 2022 12:01:51 -0700 (PDT)
Received: from nlaptop.localdomain (178-117-134-240.access.telenet.be.
 [178.117.134.240]) by smtp.gmail.com with ESMTPSA id
 n24-20020a17090673d800b006df8ec24712sm1460193ejl.215.2022.03.24.12.01.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Mar 2022 12:01:50 -0700 (PDT)
From: Niels Dossche <dossche.niels@gmail.com>
To: cluster-devel@redhat.com
Date: Thu, 24 Mar 2022 20:01:03 +0100
Message-Id: <20220324190103.35001-1-dossche.niels@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Thu, 24 Mar 2022 20:41:33 +0000
Subject: [Cluster-devel] [PATCH] gfs2: use write lock to protect
 clean_journal's modifications
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
Cc: Niels Dossche <dossche.niels@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clean_journal is called within a read lock on sdp->sd_log_flush_lock.
However, clean_journal makes modifications on sdp-> members such as
sd_log_flush_head. That field is always protected using that same lock.
As this field is modified under a read lock instead of a write lock,
this can lead to race conditions. The solution is to change
{down,up}_read to {down,up}_write on the callsite.

Note:
I am currently working on a static analyser to detect missing locks.
This was a reported case. I manually verified the report by looking
at the code, so that I do not send wrong information or patches.
After concluding that this seems to be a true positive, I created
this patch. I was only able to compile-test this patch.

Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
---
 fs/gfs2/recovery.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
index 016ed1b2ca1d..19db755a6828 100644
--- a/fs/gfs2/recovery.c
+++ b/fs/gfs2/recovery.c
@@ -508,21 +508,21 @@ void gfs2_recover_func(struct work_struct *work)
 		/* We take the sd_log_flush_lock here primarily to prevent log
 		 * flushes and simultaneous journal replays from stomping on
 		 * each other wrt jd_log_bio. */
-		down_read(&sdp->sd_log_flush_lock);
+		down_write(&sdp->sd_log_flush_lock);
 		for (pass = 0; pass < 2; pass++) {
 			lops_before_scan(jd, &head, pass);
 			error = foreach_descriptor(jd, head.lh_tail,
 						   head.lh_blkno, pass);
 			lops_after_scan(jd, error, pass);
 			if (error) {
-				up_read(&sdp->sd_log_flush_lock);
+				up_write(&sdp->sd_log_flush_lock);
 				goto fail_gunlock_thaw;
 			}
 		}
 
 		recover_local_statfs(jd, &head);
 		clean_journal(jd, &head);
-		up_read(&sdp->sd_log_flush_lock);
+		up_write(&sdp->sd_log_flush_lock);
 
 		gfs2_freeze_unlock(&thaw_gh);
 		t_rep = ktime_get();
-- 
2.35.1

