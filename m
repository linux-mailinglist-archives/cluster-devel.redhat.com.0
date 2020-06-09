Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EA0671F3DB5
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jun 2020 16:15:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591712116;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nOFPOYnZCz3thcScaUp3AvQSnWRMNeLIhrylh1+cMvU=;
	b=ZX1q2imNpxbSkuRf99IZBDEahaZZX1HAJ445uAfY00LBwmad/8j+VTnL8RfAaG/TO6JFnB
	lBc4F/g5LrD+wRyysEg3k5BpMID09GBrwUU68s0dasWtFq18W8gU11Z4tvL56avlN1J7CT
	+9GhQMnkjA1KfBqI1Q/ykI0RYV/jPmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-bHVVEQObMTWB56_28QGvxQ-1; Tue, 09 Jun 2020 10:15:06 -0400
X-MC-Unique: bHVVEQObMTWB56_28QGvxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19D3919200C0;
	Tue,  9 Jun 2020 14:15:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C322891CE;
	Tue,  9 Jun 2020 14:15:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 370A297019;
	Tue,  9 Jun 2020 14:15:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059EEwfR007890 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 10:14:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EBA939F77; Tue,  9 Jun 2020 14:14:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4FE561169;
	Tue,  9 Jun 2020 14:14:56 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 241241809542;
	Tue,  9 Jun 2020 14:14:56 +0000 (UTC)
Date: Tue, 9 Jun 2020 10:14:53 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <439170501.32917657.1591712093863.JavaMail.zimbra@redhat.com>
In-Reply-To: <d9b2cb1b-c190-4945-ff3a-b6fd1fd61803@redhat.com>
References: <181861383.32913711.1591710911880.JavaMail.zimbra@redhat.com>
	<d9b2cb1b-c190-4945-ff3a-b6fd1fd61803@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.115.80, 10.4.195.26]
Thread-Topic: gfs2: fix trans slab error when withdraw occurs inside log_flush
Thread-Index: shx/1IzV8ofnb80S+aaf7qUOrdYA5w==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: fix trans slab error when
 withdraw occurs inside log_flush
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----
> I'm not sure quite what the aim is here... are you sure that it is ok to
> move something to the AIL list if there has been a withdrawal? If the
> log flush has not completed correctly then we should not be moving
> anything to the AIL lists I think,
> 
> Steve.

Yes, I'm sure it's okay in this case. We only add it temporarily to the
ail1 list so that function ail_drain() finds and removes it like the rest.

I only coded it this way because Andreas didn't like my somewhat longer
previous implementation, which follows.

Regards,

Bob

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 3e4734431783..0c45851b88d5 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -845,8 +845,15 @@ static void log_write_header(struct gfs2_sbd *sdp, u32 flags)
 /**
  * ail_drain - drain the ail lists after a withdraw
  * @sdp: Pointer to GFS2 superblock
+ * @flush_tr: If non-null, transaction that was being flushed
+ *
+ * We're draining the ail lists after a withdraw, during a log flush op.
+ * If the log flush was targeting a specific transaction, it will never
+ * go through "after" lops processing, so we need to free it here.
+ * If we find it on one of the ail lists, we free it as we dequeue it.
+ * If we don't find it, we free it at the end.
  */
-static void ail_drain(struct gfs2_sbd *sdp)
+static void ail_drain(struct gfs2_sbd *sdp, struct gfs2_trans *flush_tr)
 {
 	struct gfs2_trans *tr;
 
@@ -865,6 +872,8 @@ static void ail_drain(struct gfs2_sbd *sdp)
 		gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
 		list_del(&tr->tr_list);
 		gfs2_trans_free(sdp, tr);
+		if (tr == flush_tr)
+			flush_tr = NULL;
 	}
 	while (!list_empty(&sdp->sd_ail2_list)) {
 		tr = list_first_entry(&sdp->sd_ail2_list, struct gfs2_trans,
@@ -872,7 +881,11 @@ static void ail_drain(struct gfs2_sbd *sdp)
 		gfs2_ail_empty_tr(sdp, tr, &tr->tr_ail2_list);
 		list_del(&tr->tr_list);
 		gfs2_trans_free(sdp, tr);
+		if (tr == flush_tr)
+			flush_tr = NULL;
 	}
+	if (flush_tr)
+		gfs2_trans_free(sdp, flush_tr);
 	spin_unlock(&sdp->sd_ail_lock);
 }
 
@@ -1002,7 +1015,7 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
 
 out:
 	if (gfs2_withdrawn(sdp)) {
-		ail_drain(sdp); /* frees all transactions */
+		ail_drain(sdp, tr); /* frees all transactions */
 		tr = NULL;
 	}
 

