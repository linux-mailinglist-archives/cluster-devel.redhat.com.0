Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 89355327E96
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Mar 2021 13:49:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-PQpmCn3CO2GstUDdRIvg9g-1; Mon, 01 Mar 2021 07:49:08 -0500
X-MC-Unique: PQpmCn3CO2GstUDdRIvg9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72A42193578F;
	Mon,  1 Mar 2021 12:49:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DE3310013C1;
	Mon,  1 Mar 2021 12:49:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D04904E58E;
	Mon,  1 Mar 2021 12:49:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11S14cwG000787 for <cluster-devel@listman.util.phx.redhat.com>;
	Sat, 27 Feb 2021 20:04:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 81EB11111A6F; Sun, 28 Feb 2021 01:04:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D6B81111A6E
	for <cluster-devel@redhat.com>; Sun, 28 Feb 2021 01:04:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA5EA9988E2
	for <cluster-devel@redhat.com>; Sun, 28 Feb 2021 01:04:35 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-138-WZLFKr1SOyCxxlUOndOuVg-1; Sat, 27 Feb 2021 20:04:33 -0500
X-MC-Unique: WZLFKr1SOyCxxlUOndOuVg-1
Received: by mail-qk1-f177.google.com with SMTP id l132so11911300qke.7;
	Sat, 27 Feb 2021 17:04:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2ov50pcOYpHPtDidYN1luJvbz0DQd6yKs2tzdfomyZg=;
	b=QIknCI2443jaH63KHT0Imgp+9EzyViDGzz9V4OZv5vvhjKxGyZ1tu3k+bddub5uWwv
	n7rNyCs5XA81qwV36lAvAm5/OeqYf/tncbboznbv0d5L8TsTEQNvEv/GmVyz1vbY1Mal
	BDoF4heZ+LaF1aTpo/nTSBVj9BdzWLioxVPcfFVwksHjaG7S2ZvlrbmOlB5schoxfR8g
	utUhjeiCZ77zID/I03NCWwQmiH3EXNSypu+e1tYATzJYNe4UBO1t2zBLPESQ9DEyK7/M
	oCc5fW9zPEQzrZAgTV/1EbGc1AZk/YJPltWh0kqt2upnqGAQn3b6Vp33b29hHPTesIWf
	NCUA==
X-Gm-Message-State: AOAM532778S6lmfKUU9420+N7iAtTF/34BO7/PvYFKXhY8q50+8fe0P6
	AiGOaZuxSzs5+hdfZzWeknEWDHqpMenTDg==
X-Google-Smtp-Source: ABdhPJw9bzTub02JH6QsLgxGMcJKN84KUZfjDyYV5+H6gSu9epEpGs0FZhaTB9VT4NlfgkiNvlDaTA==
X-Received: by 2002:a37:ef17:: with SMTP id j23mr8640946qkk.209.1614474272546; 
	Sat, 27 Feb 2021 17:04:32 -0800 (PST)
Received: from localhost.localdomain ([138.199.10.3])
	by smtp.gmail.com with ESMTPSA id
	a34sm8706771qtc.97.2021.02.27.17.04.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 27 Feb 2021 17:04:31 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: ccaulfie@redhat.com, teigland@redhat.com, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org
Date: Sun, 28 Feb 2021 06:32:05 +0530
Message-Id: <20210228010205.28697-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Mon, 01 Mar 2021 07:48:53 -0500
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [Cluster-devel] [PATCH V2] fs: dlm: Spellings fixed throughout the
	file lock.c
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"


Few spelling fixes throughout the file.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Changes from V1:
 Fixed the subject line typo.
 Measured unwanted blank lines insertion.

 fs/dlm/lock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
index 002123efc6b0..b00001c36ed5 100644
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
2.26.2

