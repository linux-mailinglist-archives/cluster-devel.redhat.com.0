Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id E8B21197C65
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:03:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585573400;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Os23W0dSrlCbTfZOw1cX22GqA0f+p+ZRYjEUgmDWz7Y=;
	b=A0h7gUqRrEjSAf7lCrCYj8iCTx5OqQtSRyPvBXDtrIPI4AkcRXF+0dlxYHanCid2r27GcK
	rdYwt9QjOUKJd3WGl1EG+mIp0p/BzNIJ3u6++bR399oPDq0NUVyo1/ncNipR8aAeaqRBxD
	GaUSykC2347gv66PDzTBZqovVClP/ik=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-7kxYwPwcPxa--xGXDK52hg-1; Mon, 30 Mar 2020 09:03:18 -0400
X-MC-Unique: 7kxYwPwcPxa--xGXDK52hg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DD898018A6;
	Mon, 30 Mar 2020 13:03:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFD68100EBC2;
	Mon, 30 Mar 2020 13:03:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F1BF1803C33;
	Mon, 30 Mar 2020 13:03:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UD3AxG018111 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:03:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8498719756; Mon, 30 Mar 2020 13:03:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E14219925
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:03:07 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E0FBA944CA
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:03:07 +0000 (UTC)
Date: Mon, 30 Mar 2020 09:03:07 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1029072392.19473094.1585573387870.JavaMail.zimbra@redhat.com>
In-Reply-To: <1485082504.19473092.1585573387728.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.79, 10.4.195.6]
Thread-Topic: gfs2: Fix oversight in gfs2_ail1_flush
Thread-Index: lOjnNqSmFQLhS3TSUyUcln7AmJrgVw==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH v2] gfs2: Fix oversight in gfs2_ail1_flush
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Here is a revised version of the patch that is much simpler.

Hi,

Ordinarily, function gfs2_ail1_start_one issues a write request
for one item on the ail1 list, then returns -EBUSY. This makes the
caller, gfs2_ail1_flush, loop around and start another. However,
it was not clearing the -EBUSY return code each time through the loop.
So on rare occasions, like when the wbc runs out of nr_to_write, it
remained set to -EBUSY, which triggered an error and withdraw.

This patch sets the return code to 0 each time through the restart
loop so this won't happen anymore.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 82f356f57045..3a75843ae580 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -188,13 +188,14 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control *wbc)
 	struct list_head *head = &sdp->sd_ail1_list;
 	struct gfs2_trans *tr;
 	struct blk_plug plug;
-	int ret = 0;
+	int ret;
 	unsigned long flush_start = jiffies;
 
 	trace_gfs2_ail_flush(sdp, wbc, 1);
 	blk_start_plug(&plug);
 	spin_lock(&sdp->sd_ail_lock);
 restart:
+	ret = 0;
 	if (time_after(jiffies, flush_start + (HZ * 600))) {
 		dump_ail_list(sdp);
 		goto out;

