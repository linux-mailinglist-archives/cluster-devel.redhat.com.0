Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1F23498D4
	for <lists+cluster-devel@lfdr.de>; Thu, 25 Mar 2021 18:58:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616695130;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=verpugg21D5LL4lesxU0d/Cvj6wVxhGctHKzMCv0uV4=;
	b=WxROFajODf4DIbs1mt/eNPvYSE765MFzWwtXpn5HdG0k9i0GLuWy6bvcPduvTVYb+AvbSE
	PYeUFZX+E4jPFlxeB/grW5Qx8s/XMPVhUDXCXxgsmm1aIcjxO4DlO3bwWk0wPQU7pyahhC
	idFxskb2d75/CX4vFh35y9t6+hj2D7M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-84P9sAcjO-qde3v6k1oZ9A-1; Thu, 25 Mar 2021 13:58:49 -0400
X-MC-Unique: 84P9sAcjO-qde3v6k1oZ9A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 389FB1922961;
	Thu, 25 Mar 2021 17:58:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A22FB610AE;
	Thu, 25 Mar 2021 17:58:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA3B51809C83;
	Thu, 25 Mar 2021 17:58:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12PHwagO008322 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 25 Mar 2021 13:58:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 678B15D741; Thu, 25 Mar 2021 17:58:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-113.rdu2.redhat.com [10.10.117.113])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E419B5D6D5;
	Thu, 25 Mar 2021 17:58:32 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: anprice@redhat.com
Date: Thu, 25 Mar 2021 13:58:28 -0400
Message-Id: <20210325175828.12708-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH gfs2-utils] man: gfs2.5: remove barrier
	automatically turned off note
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch removes a note that the barrier option is automatically turned
off if the underlaying device doesn't support I/O barriers. So far I
understand it's default on, means "barriers" option is applied which
should not make any problems if the underlaying device supports something
or not. There is by the kernel or gfs2-utils no automatically detection
going on which changes this mount option. However there could be third
party software which has an automatically detection but this isn't part
of kernel or gfs2-utils collection and the user is running out of scope
of this manpage entry.

Additional this patch adds a point at the end of the manpage section
entry which seems to be missing.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 gfs2/man/gfs2.5 | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/gfs2/man/gfs2.5 b/gfs2/man/gfs2.5
index 8f67ce23..38d97bb1 100644
--- a/gfs2/man/gfs2.5
+++ b/gfs2/man/gfs2.5
@@ -127,11 +127,10 @@ in kernel version 2.6.30 and above.
 .TP
 \fBbarrier\fP
 This option, which defaults to on, causes GFS2 to send I/O barriers
-when flushing the journal. The option is automatically turned off
-if the underlying device does not support I/O barriers. We highly
-recommend the use of I/O barriers with GFS2 at all times unless
-the block device is designed so that it cannot lose its write cache
-content (e.g. its on a UPS, or it doesn't have a write cache)
+when flushing the journal. We highly recommend the use of I/O barriers
+with GFS2 at all times unless the block device is designed so that it
+cannot lose its write cache content (e.g. its on a UPS, or it doesn't
+have a write cache).
 .TP
 \fBcommit=\fP\fIsecs\fR
 This is similar to the ext3 \fBcommit=\fP option in that it sets
-- 
2.26.3

