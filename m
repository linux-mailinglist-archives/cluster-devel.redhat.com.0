Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 93891254DF1
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 21:04:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598555047;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6CpADeT4HojygtJruhpmTQutMTkibb6zUn7J0MT6ZIU=;
	b=K99GRLVIEyUs/GImjxPIU1e1aye4Xy6gU0EfHI5Y7G982OWpsRdx8A9N83wYtwniu3qajo
	PVjApyYSPbrn5zEqFlAnx8PjV76fLRPjFa1fcr7ia794c5ydix3Ekz6rd5yTTyU/TTfLup
	zr5ykipkHZ8EGr0rct+gqol/6XObdx0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-NJ1ZsCT-NduxBobhKm_gQg-1; Thu, 27 Aug 2020 15:04:05 -0400
X-MC-Unique: NJ1ZsCT-NduxBobhKm_gQg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83BD46408E;
	Thu, 27 Aug 2020 19:04:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7261F19C71;
	Thu, 27 Aug 2020 19:04:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5881D18408AC;
	Thu, 27 Aug 2020 19:04:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RJ40VU018159 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 15:04:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66DDF19C71; Thu, 27 Aug 2020 19:04:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-193.rdu2.redhat.com [10.10.114.193])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB1ED19D61;
	Thu, 27 Aug 2020 19:03:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Aug 2020 15:02:51 -0400
Message-Id: <20200827190254.719333-5-aahringo@redhat.com>
In-Reply-To: <20200827190254.719333-1-aahringo@redhat.com>
References: <20200827190254.719333-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 4/7] fs: dlm: fix configfs memory
	leak
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

This patch fixes the following memory detected by kmemleak and umount
gfs2 filesystem which removed the last lockspace:

unreferenced object 0xffff9264f482f600 (size 192):
  comm "dlm_controld", pid 325, jiffies 4294690276 (age 48.136s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 6e 6f 64 65 73 00 00 00  ........nodes...
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000060481d7>] make_space+0x41/0x130
    [<000000008d905d46>] configfs_mkdir+0x1a2/0x5f0
    [<00000000729502cf>] vfs_mkdir+0x155/0x210
    [<000000000369bcf1>] do_mkdirat+0x6d/0x110
    [<00000000cc478a33>] do_syscall_64+0x33/0x40
    [<00000000ce9ccf01>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

The patch just remembers the "nodes" entry pointer in space as I think
it's created as subdirectory when parent "spaces" is created. In
function drop_space() we will lost the pointer reference to nds because
configfs_remove_default_groups(). However as this subdirectory is always
available when "spaces" exists it will just be freed when "spaces" will be
freed.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/config.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 47f0b98b707f..f33a7e4ae917 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -221,6 +221,7 @@ struct dlm_space {
 	struct list_head members;
 	struct mutex members_lock;
 	int members_count;
+	struct dlm_nodes *nds;
 };
 
 struct dlm_comms {
@@ -430,6 +431,7 @@ static struct config_group *make_space(struct config_group *g, const char *name)
 	INIT_LIST_HEAD(&sp->members);
 	mutex_init(&sp->members_lock);
 	sp->members_count = 0;
+	sp->nds = nds;
 	return &sp->group;
 
  fail:
@@ -451,6 +453,7 @@ static void drop_space(struct config_group *g, struct config_item *i)
 static void release_space(struct config_item *i)
 {
 	struct dlm_space *sp = config_item_to_space(i);
+	kfree(sp->nds);
 	kfree(sp);
 }
 
-- 
2.26.2

