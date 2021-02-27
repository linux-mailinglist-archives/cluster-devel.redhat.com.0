Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 63353327E95
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Mar 2021 13:49:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-YPQHSsgPMyeSRXD-JiTSXg-1; Mon, 01 Mar 2021 07:49:09 -0500
X-MC-Unique: YPQHSsgPMyeSRXD-JiTSXg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F38780364B;
	Mon,  1 Mar 2021 12:49:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 743DE5D9DB;
	Mon,  1 Mar 2021 12:49:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4BFFB18095CA;
	Mon,  1 Mar 2021 12:49:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11RNaFt2025118 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 27 Feb 2021 18:36:16 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C388B2166B2D; Sat, 27 Feb 2021 23:36:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE22D2166B27
	for <cluster-devel@redhat.com>; Sat, 27 Feb 2021 23:36:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A0EEF800883
	for <cluster-devel@redhat.com>; Sat, 27 Feb 2021 23:36:13 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-333-cG2B1epmP6SpWVxRAXU6XQ-1; Sat, 27 Feb 2021 18:36:09 -0500
X-MC-Unique: cG2B1epmP6SpWVxRAXU6XQ-1
Received: by mail-qk1-f172.google.com with SMTP id w19so12979701qki.13;
	Sat, 27 Feb 2021 15:36:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=peWghVwzakObRswcYtMdIQaLAPGjdtQ5TK7CULWgtzo=;
	b=JFZTOIVisFLy3c23PnMicu7wU4g14vcUgmu7yCYXq7jaxQflIDzhWNfmpJiI6TgKs7
	IGOh7ARBLATsBEkH/Bfz1NFUAnh9q72M84Z0SA1lwIb1bE71tLVw0Cr5/yCtLOMjC2Yj
	gBX4fVHoRm/l/OaBz99O9hEDzwfeAlrF1h12GDMS6CK24g9/H5J8T+E3joLkxV1sJin5
	CSDb30JJx3ETO9ZxitecrpT4jljhESkoKp7TJk6iVXLKu2rAeaPcPbEUYE11lHJI77Bp
	e58O1FwpVwcywmPB3LWByq4Xx49hyLrS+SocZl+7Ns+f1dX3CmU+BpC//0p21RHXbZYr
	B6iw==
X-Gm-Message-State: AOAM5305qxcm3X808qx2vRFgJhGZO7oA/LvfJHOpiaeg+DBV+sDa3RL+
	cmuvkNRytlNA9u91aBJWUy47t+snm5c64w==
X-Google-Smtp-Source: ABdhPJyw5onIAkNUvSK4Om9JRgqKDy20b5WlQGitBylKsJxFxxyOqj+kghsr1d9p+DCKzanKWkVMHg==
X-Received: by 2002:a05:620a:2206:: with SMTP id
	m6mr8711634qkh.176.1614468968270; 
	Sat, 27 Feb 2021 15:36:08 -0800 (PST)
Received: from localhost.localdomain ([138.199.10.27])
	by smtp.gmail.com with ESMTPSA id
	o19sm8159568qtt.62.2021.02.27.15.36.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 27 Feb 2021 15:36:07 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: ccaulfie@redhat.com, teigland@redhat.com, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org
Date: Sun, 28 Feb 2021 05:03:36 +0530
Message-Id: <20210227233336.6290-1-unixbhaskar@gmail.com>
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
X-Mailman-Approved-At: Mon, 01 Mar 2021 07:48:53 -0500
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [Cluster-devel] [PATCH] fs: dlm: Spellings fixed throughout the fle
	lock.c
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


Few spelling fixes throughout the file.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 fs/dlm/lock.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 002123efc6b0..efcd84faca14 100644
--- a/fs/dlm/lock.c
+++ b/fs/dlm/lock.c
@@ -91,7 +91,7 @@ static void del_timeout(struct dlm_lkb *lkb);
 static void toss_rsb(struct kref *kref);

 /*
- * Lock compatibilty matrix - thanks Steve
+ * Lock compatibility matrix - thanks Steve
  * UN = Unlocked state. Not really a state, used as a flag
  * PD = Padding. Used to make the matrix a nice power of two in size
  * Other states are the same as the VMS DLM.
@@ -594,7 +594,7 @@ static int find_rsb_dir(struct dlm_ls *ls, char *name, int len,
 	error = dlm_search_rsb_tree(&ls->ls_rsbtbl[b].keep, name, len, &r);
 	if (error)
 		goto do_toss;
-
+
 	/*
 	 * rsb is active, so we can't check master_nodeid without lock_rsb.
 	 */
@@ -2357,14 +2357,14 @@ static int _can_be_granted(struct dlm_rsb *r, struct dlm_lkb *lkb, int now,
 	 * 6-5: But the default algorithm for deciding whether to grant or
 	 * queue conversion requests does not by itself guarantee that such
 	 * requests are serviced on a "first come first serve" basis.  This, in
-	 * turn, can lead to a phenomenon known as "indefinate postponement".
+	 * turn, can lead to a phenomenon known as "indefinite postponement".
 	 *
 	 * 6-7: This issue is dealt with by using the optional QUECVT flag with
 	 * the system service employed to request a lock conversion.  This flag
 	 * forces certain conversion requests to be queued, even if they are
 	 * compatible with the granted modes of other locks on the same
 	 * resource.  Thus, the use of this flag results in conversion requests
-	 * being ordered on a "first come first servce" basis.
+	 * being ordered on a "first come first serve" basis.
 	 *
 	 * DCT: This condition is all about new conversions being able to occur
 	 * "in place" while the lock remains on the granted queue (assuming
@@ -5745,7 +5745,7 @@ int dlm_recover_process_copy(struct dlm_ls *ls, struct dlm_rcom *rc)

 		log_debug(ls, "dlm_recover_process_copy %x remote %d %x %d",
 			  lkid, rc->rc_header.h_nodeid, remid, result);
-
+
 		dlm_send_rcom_lock(r, lkb);
 		goto out;
 	case -EEXIST:
--
2.26.2

