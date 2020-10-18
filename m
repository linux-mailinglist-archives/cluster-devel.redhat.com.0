Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D9B1C2919A6
	for <lists+cluster-devel@lfdr.de>; Sun, 18 Oct 2020 21:20:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-Wla0bz9IO9ikjS4PiRbVTg-1; Sun, 18 Oct 2020 15:20:03 -0400
X-MC-Unique: Wla0bz9IO9ikjS4PiRbVTg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27A20802B46;
	Sun, 18 Oct 2020 19:20:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0CE35C1DC;
	Sun, 18 Oct 2020 19:19:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D75E44A6B;
	Sun, 18 Oct 2020 19:19:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09IJIrAh010413 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 18 Oct 2020 15:18:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 64C8C202278D; Sun, 18 Oct 2020 19:18:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FDFF2022780
	for <cluster-devel@redhat.com>; Sun, 18 Oct 2020 19:18:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 261458007DF
	for <cluster-devel@redhat.com>; Sun, 18 Oct 2020 19:18:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-243-4Mzcr6DeOLGlXA22VJ7KeQ-1;
	Sun, 18 Oct 2020 15:18:48 -0400
X-MC-Unique: 4Mzcr6DeOLGlXA22VJ7KeQ-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9D23922370;
	Sun, 18 Oct 2020 19:18:46 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sun, 18 Oct 2020 15:16:48 -0400
Message-Id: <20201018191807.4052726-32-sashal@kernel.org>
In-Reply-To: <20201018191807.4052726-1-sashal@kernel.org>
References: <20201018191807.4052726-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09IJIrAh010413
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.9 032/111] fs: dlm: fix configfs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit 3d2825c8c6105b0f36f3ff72760799fa2e71420e ]

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
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/config.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 47f0b98b707f8..f33a7e4ae917b 100644
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
2.25.1


