Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id AC4D9197C1F
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 14:42:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585572142;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=iSdE7Wpskd6IXD9MgT9Mhxsjjg6icXEIwjH0l2J09yE=;
	b=LyHV4Bk/NGKTNSO87ATDhOZlNxf8I6lxSfiUopkNMh0UlIMU5Rz7f26LA/s17RFkp9d+xV
	xnhVPFMqZSvm1zR8MlSOGRxLBGZSzHuGw0ZstDmvZRe7qK4R8+EBQoXy58xbvSbmH/0qaW
	HbpTvnKL6n27FfPuXV82XZ1uOnC4MlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-dcP5cBAmP1Si6WGn0dcSXg-1; Mon, 30 Mar 2020 08:42:21 -0400
X-MC-Unique: dcP5cBAmP1Si6WGn0dcSXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23BCA18FE862;
	Mon, 30 Mar 2020 12:42:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5405819756;
	Mon, 30 Mar 2020 12:42:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83029944CC;
	Mon, 30 Mar 2020 12:42:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UCg6VA017158 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 08:42:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6B3CB96B7A; Mon, 30 Mar 2020 12:42:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 651CB96B73
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 12:42:03 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 112FE1803C32
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 12:42:03 +0000 (UTC)
Date: Mon, 30 Mar 2020 08:42:02 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <1439057493.19467991.1585572122685.JavaMail.zimbra@redhat.com>
In-Reply-To: <1831596904.19467951.1585572099993.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.112.79, 10.4.195.6]
Thread-Topic: gfs2: Fix oversight in gfs2_ail1_flush
Thread-Index: Sz2DKXxo0GrF755QQP4trn3UcKiWzQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Fix oversight in gfs2_ail1_flush
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi,

Under ordinary circumstances, function gfs2_ail1_start_one will start
an item from the ail1 list writing, then return -EBUSY. This causes
gfs2_ail1_flush to loop around and try again. However, it never
clears the -EBUSY return code, so on rare occasions, like when the
wbc runs out of nr_to_write, it can remain set, which triggers an
error and withdraw.

This patch resets the -EBUSY to 0 so this won't happen anymore.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 86c8389e77e4..0752b223b92f 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -204,8 +204,10 @@ void gfs2_ail1_flush(struct gfs2_sbd *sdp, struct writeback_control *wbc)
 			break;
 		ret = gfs2_ail1_start_one(sdp, wbc, tr);
 		if (ret) {
-			if (ret == -EBUSY)
+			if (ret == -EBUSY) {
+				ret = 0;
 				goto restart;
+			}
 			break;
 		}
 	}

