Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C6C3033CD49
	for <lists+cluster-devel@lfdr.de>; Tue, 16 Mar 2021 06:28:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-XJLPNjl_NZKNkCcNALvvLg-1; Tue, 16 Mar 2021 01:28:27 -0400
X-MC-Unique: XJLPNjl_NZKNkCcNALvvLg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DB31100C61C;
	Tue, 16 Mar 2021 05:28:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 876C462691;
	Tue, 16 Mar 2021 05:28:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A5C7957DC1;
	Tue, 16 Mar 2021 05:28:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12G5SANO016372 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 01:28:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C3C495AB64; Tue, 16 Mar 2021 05:28:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEBDF44076
	for <cluster-devel@redhat.com>; Tue, 16 Mar 2021 05:28:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF6BE185A79C
	for <cluster-devel@redhat.com>; Tue, 16 Mar 2021 05:28:07 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
	[209.85.219.54]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-382-S82ZBMPBO8SFpLzs5pd54Q-1; Tue, 16 Mar 2021 01:28:04 -0400
X-MC-Unique: S82ZBMPBO8SFpLzs5pd54Q-1
Received: by mail-qv1-f54.google.com with SMTP id q9so3514525qvm.6;
	Mon, 15 Mar 2021 22:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=91l+EZvobumpic5/EQLeULuDDYG6RJlmE6rR5M1RK9c=;
	b=g3uH9Vb4wTOVQKeRffDF2C7U+IjaucUb9XaVn8n/36hLzW8zKi0vTRNzAEemlF2qQw
	06Qmu7Rgzcd3sumptcs23QClYt1YAPZ+A1yXX9pZZD9kz0HPz/BnALycc+x7nfsQ1Tcx
	mTKMz8uYWrRFh3R4qwQW22STqzsMEJrdHKGxbjwPCufwsr7s0ALYhtZhjYn2HFdwou/7
	HC4gYOIxLqZicKJj/qupbXsU3qEaCDxR3d7xCXbGH7Yrs3hinxadRb3PqyIRWUlDkVwi
	f7cUl8yNXshDYVfE59kKq1DFsPGTttstNp+XxxrWHlF0D+CpciciffVENOFiHY6XrifL
	g95A==
X-Gm-Message-State: AOAM533DAwTRMcEQLPJjijjF7UPZXCQzY1ORLkjhGTq2d1Kbk5K8/nn+
	u+sqtsjxEuIT9m3AN7FuTIQqixmyMohwb+Nf
X-Google-Smtp-Source: ABdhPJw3PcD1c3rBh3dmkpZFKOL86X6+IzmMIU2mkAxAU4zW9FQqZQfGpvOXT7Ry/boAWRVC/QYq4A==
X-Received: by 2002:a0c:b59f:: with SMTP id g31mr14223318qve.28.1615872483128; 
	Mon, 15 Mar 2021 22:28:03 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.45])
	by smtp.gmail.com with ESMTPSA id
	i8sm12179387qtj.16.2021.03.15.22.27.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 15 Mar 2021 22:28:02 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: ccaulfie@redhat.com, teigland@redhat.com, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org
Date: Tue, 16 Mar 2021 10:57:32 +0530
Message-Id: <20210316052732.682020-1-unixbhaskar@gmail.com>
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
Cc: trivial@vger.kernel.org, rdunlap@infradead.org,
	Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [Cluster-devel] [PATCH] dlm: Mundane typo fixes throughout the file
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"


Trivial typo fixes throughout the file.

cc: trivial@vger.kernel.org

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 fs/dlm/lock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 002123efc6b0..caadc426c8b4 100644
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
@@ -1535,7 +1535,7 @@ static int _remove_from_waiters(struct dlm_lkb *lkb, int mstype,
 		return -1;
 	}

-	/* Remove for the convert reply, and premptively remove for the
+	/* Remove for the convert reply, and preemptively remove for the
 	   cancel reply.  A convert has been granted while there's still
 	   an outstanding cancel on it (the cancel is moot and the result
 	   in the cancel reply should be 0).  We preempt the cancel reply
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
--
2.30.2

