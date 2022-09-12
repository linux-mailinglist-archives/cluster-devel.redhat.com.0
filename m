Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3875B5700
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Sep 2022 11:13:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662974012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wqRYf4bK8HxWj4cxt1yNwL6L5/oKp/VpFBzV0pFAgGQ=;
	b=N4inwLQbcbvR6Ki7PQCceGfKKC852BHTEU1PcYqL5kHRzFko2jA4B3afVnqTjFchMm8iDY
	LrfCY0zTZu4nRFd2bAQrW/P0ej4jmqXRB8v+NcY0Vxxy8CFWUPllT+xdM9mwucKUPfNlkK
	fHXzVa6AYFhWnMhXZ5gthfQwwKYeqR0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-287-yvvk2qFKPtmz6kxe7UGh9A-1; Mon, 12 Sep 2022 05:13:28 -0400
X-MC-Unique: yvvk2qFKPtmz6kxe7UGh9A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA2F81C006A5;
	Mon, 12 Sep 2022 09:13:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 181CBC15BA4;
	Mon, 12 Sep 2022 09:13:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B5A3E1946A46;
	Mon, 12 Sep 2022 09:13:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C338F1946A42 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 12 Sep 2022 09:13:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B7BC7C15BA5; Mon, 12 Sep 2022 09:13:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3DF1C15BA4
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 09:13:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9AC42185A7BA
 for <cluster-devel@redhat.com>; Mon, 12 Sep 2022 09:13:12 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-609-_6UMjtBFOdyr6aBaYJlhpg-1; Mon, 12 Sep 2022 05:13:08 -0400
X-MC-Unique: _6UMjtBFOdyr6aBaYJlhpg-1
Received: by mail-ej1-f50.google.com with SMTP id r18so18599953eja.11;
 Mon, 12 Sep 2022 02:13:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=wqRYf4bK8HxWj4cxt1yNwL6L5/oKp/VpFBzV0pFAgGQ=;
 b=hnqUtJanv257m7r0kcECfSvlUJA2trVGTMnjBY6/FfRkjT/XtwgKl43aEAsEttMDpb
 WYIEs9Lz4hiK4hiM7hCVCALjUQ9S3qWcOp4hmNREpRxLpJOE+vhBx2Igcfz08tm6uK3l
 EjkeUpeV36FvmbvTheOg823LfMlk0s3d3qcFM58dr9lDotU3GmL6LmeWU0sR1Lox130F
 q6KdV2V9Qf7gn5X8NqK/rTqpdAukDrxcpE2xszsXTijMQKfs8HD07NQBaY8ym6oTedGc
 4T57/JdMGLhCaayDKrVt8BwfsB+FRf4S2RMR5tD/VrAT6939Bq3V/VfCDy42fMXdsaAs
 v7sw==
X-Gm-Message-State: ACgBeo3Gj7gA/URMv11ecQpC22TpxRXs3opPu9mNsYp00eq2TZJKRotX
 FXfAD+UEBJuvitRqGf57EAhbLHuTlMM=
X-Google-Smtp-Source: AA6agR6pXVidZNH5wFFW0qKrPs8VY015BB7XMUgPJhOW3SS5DDjfJGmLpK79iSbnCl5zIjFHDFMmCQ==
X-Received: by 2002:a17:907:7e90:b0:77d:fecf:c243 with SMTP id
 qb16-20020a1709077e9000b0077dfecfc243mr2032412ejc.361.1662973987406; 
 Mon, 12 Sep 2022 02:13:07 -0700 (PDT)
Received: from nlaptop.wireless.UGent.be (nata195.ugent.be. [157.193.240.195])
 by smtp.gmail.com with ESMTPSA id
 eo6-20020a056402530600b004478be33bddsm5329689edb.15.2022.09.12.02.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Sep 2022 02:13:07 -0700 (PDT)
From: Niels Dossche <dossche.niels@gmail.com>
To: cluster-devel@redhat.com
Date: Mon, 12 Sep 2022 11:13:05 +0200
Message-Id: <20220912091305.107797-1-dossche.niels@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH] gfs2: acquire sd_log_flush_lock in
 gfs2_trans_remove_revoke
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
Cc: Niels Dossche <dossche.niels@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

gfs2_log_release_revokes states in its function documentation that
sdp->sd_log_flush_lock must be held. The operations on
sd_log_revokes_available are always protected under that lock. All
callers except gfs2_trans_remove_revoke hold the lock.
Acquire that lock in gfs2_trans_remove_revoke. The other callsites use a
read lock as well.

This bug was found using my experimental own-developed static analysis
tool, which reported the missing lock on v6.0-rc5. I manually verified
this bug report by doing code review as well. I compile tested and
runtime checked that the required lock is not held on a x86-64 config.
After applying this patch, my analyser no longer reports this
potential bug.

Fixes: 2129b4288852 ("gfs2: Per-revoke accounting in transactions")
Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
---
 fs/gfs2/trans.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/gfs2/trans.c b/fs/gfs2/trans.c
index 63fec11ef2ce..468e4da20a44 100644
--- a/fs/gfs2/trans.c
+++ b/fs/gfs2/trans.c
@@ -301,6 +301,7 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
 	struct gfs2_bufdata *bd, *tmp;
 	unsigned int n = len;
 
+	down_read(&sdp->sd_log_flush_lock);
 	gfs2_log_lock(sdp);
 	list_for_each_entry_safe(bd, tmp, &sdp->sd_log_revokes, bd_list) {
 		if ((bd->bd_blkno >= blkno) && (bd->bd_blkno < (blkno + len))) {
@@ -316,6 +317,7 @@ void gfs2_trans_remove_revoke(struct gfs2_sbd *sdp, u64 blkno, unsigned int len)
 		}
 	}
 	gfs2_log_unlock(sdp);
+	up_read(&sdp->sd_log_flush_lock);
 }
 
 void gfs2_trans_free(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
-- 
2.37.3

