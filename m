Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3395131EE24
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Feb 2021 19:22:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613672532;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=TewpmK0FopqaZ1J6NpYLy1m37Va04X3sFgrlayGPVmg=;
	b=itiwkzrxbVlbZv54l5T7EDDfklN7nmr7hxhsHdivUhKcUeFW7A7pKta1VbBjfnlNnYTs/D
	+RrddeO7nfteg0tCsCc4g5YFUwFIA5Hy3Olr2yZf5lcFUstLT5rdVgpnsGbfp1uNze7fnC
	ewoi950wQaTRT0U1c58mTDP/OUBMmCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-deDLodhSMJSUlEax6fPmWA-1; Thu, 18 Feb 2021 13:22:10 -0500
X-MC-Unique: deDLodhSMJSUlEax6fPmWA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F9851020C20;
	Thu, 18 Feb 2021 18:22:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C72195C5AE;
	Thu, 18 Feb 2021 18:22:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D583F18095CB;
	Thu, 18 Feb 2021 18:22:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11IILq3g023144 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 18 Feb 2021 13:21:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 21C845C5AE; Thu, 18 Feb 2021 18:21:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D4305C1C4
	for <cluster-devel@redhat.com>; Thu, 18 Feb 2021 18:21:49 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 345B818095C9
	for <cluster-devel@redhat.com>; Thu, 18 Feb 2021 18:21:49 +0000 (UTC)
Date: Thu, 18 Feb 2021 13:21:49 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1117207814.55338001.1613672509160.JavaMail.zimbra@redhat.com>
In-Reply-To: <1391335640.55337999.1613672477886.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.28, 10.4.195.10]
Thread-Topic: gfs2: In gfs2_ail1_start_one unplug the IO when needed
Thread-Index: 5wC9569Hv4sYzQao5bSmKTTeuAEcdw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: In gfs2_ail1_start_one unplug
	the IO when needed
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This patch adds a check in gfs2_ail1_start_one to see if our current
IO needs to be unplugged and replugged. If we don't unplug it once
in a while, our IO can get so clogged up that none of our pages for ail1
items can be written because they're all in PageWriteback but they can't be
written because the plug is never finished.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index abb051494b43..5fc706ea2472 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -91,7 +91,7 @@ void gfs2_remove_from_ail(struct gfs2_bufdata *bd)
 
 static int gfs2_ail1_start_one(struct gfs2_sbd *sdp,
 			       struct writeback_control *wbc,
-			       struct gfs2_trans *tr)
+			       struct gfs2_trans *tr, struct blk_plug *plug)
 __releases(&sdp->sd_ail_lock)
 __acquires(&sdp->sd_ail_lock)
 {
@@ -133,6 +133,10 @@ __acquires(&sdp->sd_ail_lock)
 			continue;
 		spin_unlock(&sdp->sd_ail_lock);
 		ret = generic_writepages(mapping, wbc);
+		if (blk_needs_flush_plug(current)) {
+			blk_finish_plug(plug);
+			blk_start_plug(plug);
+		}
 		spin_lock(&sdp->sd_ail_lock);
 		if (ret == -ENODATA) /* if a jdata write into a new hole */
 			ret = 0; /* ignore it */
@@ -207,7 +211,7 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control *wbc)
 	list_for_each_entry_reverse(tr, head, tr_list) {
 		if (wbc->nr_to_write <= 0)
 			break;
-		ret = gfs2_ail1_start_one(sdp, wbc, tr);
+		ret = gfs2_ail1_start_one(sdp, wbc, tr, &plug);
 		if (ret) {
 			if (ret == -EBUSY)
 				goto restart;

