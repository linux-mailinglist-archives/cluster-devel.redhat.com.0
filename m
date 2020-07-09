Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DFC3821A06E
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jul 2020 15:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594299822;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vUBSNwmsRqGMPG0Mft+PLiQMFI3j8iZKllcslO2P0fE=;
	b=ENe26N2/5QYyTsdVo5S9+cjn7vDyKo1AhC6J/WRSoRo2SLDzbPEGYiDMF31WN4Vt97eLQM
	L6Q9zhst8OVTkeRE7yFA21VAYwJTiwuDM0KjDO8RBLRuR0+aUBqK+lurJ1r6e/bVdChaVX
	XduldTDtefShu6TXvDPIcv9mGmzmDUo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-5tLWvmu2MOqx9kUfnCz6iw-1; Thu, 09 Jul 2020 09:03:40 -0400
X-MC-Unique: 5tLWvmu2MOqx9kUfnCz6iw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A20480BCA0;
	Thu,  9 Jul 2020 13:03:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 983C060C80;
	Thu,  9 Jul 2020 13:03:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C4B984342;
	Thu,  9 Jul 2020 13:03:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069D3Vw5015134 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 09:03:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E870D79801; Thu,  9 Jul 2020 13:03:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.36.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C211779CE8;
	Thu,  9 Jul 2020 13:03:23 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: mtk.manpages@gmail.com
Date: Thu,  9 Jul 2020 14:03:17 +0100
Message-Id: <20200709130317.582038-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-man@vger.kernel.org
Subject: [Cluster-devel] [PATCH] lseek.2: List gfs2 support for
	SEEK_HOLE/SEEK_DATA
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Price <anprice@redhat.com>
---
 man2/lseek.2 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/man2/lseek.2 b/man2/lseek.2
index a20b10431..22de446fc 100644
--- a/man2/lseek.2
+++ b/man2/lseek.2
@@ -182,6 +182,9 @@ NFS (since Linux 3.18)
 .IP *
 FUSE (since Linux 4.5)
 .\" commit 0b5da8db145bfd44266ac964a2636a0cf8d7c286
+.IP *
+GFS2 (since Linux 4.15)
+.\" commit 3a27411cb4bc3ce31db228e3569ad01b462a4310
 .SH RETURN VALUE
 Upon successful completion,
 .BR lseek ()
-- 
2.26.2

