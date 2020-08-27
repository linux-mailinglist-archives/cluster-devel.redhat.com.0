Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5DC254DEB
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 21:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598555047;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7Dk/84dUulknzjMEpbIsYpBFGFwEAic20rqWEJoyWCA=;
	b=I17rnzL3jrbJ++GfA7WIfZAbIXZI274V6MUzdc68ie5v+5JmM3JZTHT2TXbj6A9w7E3Skj
	HJR+L2KCiABXj6FwaQJ8BY6ZlHa2gWZBu7nsoBAp03dQqmQ+oT0eZMHm1vF39mm9j8D91a
	SdaoMQ6AUuzDaBy2KRO4eGRw9foqSGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-4SQMF4pWOIe8y_VkC8SOWQ-1; Thu, 27 Aug 2020 15:04:05 -0400
X-MC-Unique: 4SQMF4pWOIe8y_VkC8SOWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3957D1029D23;
	Thu, 27 Aug 2020 19:04:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C5AA61100;
	Thu, 27 Aug 2020 19:04:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64EB4668F7;
	Thu, 27 Aug 2020 19:04:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RJ3x5L018154 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 15:03:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC1F119D7C; Thu, 27 Aug 2020 19:03:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-193.rdu2.redhat.com [10.10.114.193])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B66519C71;
	Thu, 27 Aug 2020 19:03:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Aug 2020 15:02:50 -0400
Message-Id: <20200827190254.719333-4-aahringo@redhat.com>
In-Reply-To: <20200827190254.719333-1-aahringo@redhat.com>
References: <20200827190254.719333-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 3/7] fs: dlm: fix dlm_local_addr
	memory leak
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch fixes the following memory detected by kmemleak and umount
gfs2 filesystem which removed the last lockspace:

unreferenced object 0xffff9264f4f48f00 (size 128):
  comm "mount", pid 425, jiffies 4294690253 (age 48.159s)
  hex dump (first 32 bytes):
    02 00 52 48 c0 a8 7a fb 00 00 00 00 00 00 00 00  ..RH..z.........
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<0000000067a34940>] kmemdup+0x18/0x40
    [<00000000c935f9ab>] init_local+0x4c/0xa0
    [<00000000bbd286ef>] dlm_lowcomms_start+0x28/0x160
    [<00000000a86625cb>] dlm_new_lockspace+0x7e/0xb80
    [<000000008df6cd63>] gdlm_mount+0x1cc/0x5de
    [<00000000b67df8c7>] gfs2_lm_mount.constprop.0+0x1a3/0x1d3
    [<000000006642ac5e>] gfs2_fill_super+0x717/0xba9
    [<00000000d3ab7118>] get_tree_bdev+0x17f/0x280
    [<000000001975926e>] gfs2_get_tree+0x21/0x90
    [<00000000561ce1c4>] vfs_get_tree+0x28/0xc0
    [<000000007fecaf63>] path_mount+0x434/0xc00
    [<00000000636b9594>] __x64_sys_mount+0xe3/0x120
    [<00000000cc478a33>] do_syscall_64+0x33/0x40
    [<00000000ce9ccf01>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/lowcomms.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index 9db7126de793..d0ece252a0d9 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1234,6 +1234,14 @@ static void init_local(void)
 	}
 }
 
+static void deinit_local(void)
+{
+	int i;
+
+	for (i = 0; i < dlm_local_count; i++)
+		kfree(dlm_local_addr[i]);
+}
+
 /* Initialise SCTP socket and bind to all interfaces */
 static int sctp_listen_for_all(void)
 {
@@ -1663,6 +1671,7 @@ void dlm_lowcomms_stop(void)
 	clean_writequeues();
 	foreach_conn(free_conn);
 	work_stop();
+	deinit_local();
 }
 
 int dlm_lowcomms_start(void)
-- 
2.26.2

