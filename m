Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6FB291A7F
	for <lists+cluster-devel@lfdr.de>; Sun, 18 Oct 2020 21:24:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-PYwjbWLgP6-YjIEQuf-jPQ-1; Sun, 18 Oct 2020 15:24:55 -0400
X-MC-Unique: PYwjbWLgP6-YjIEQuf-jPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E4FC185A0CA;
	Sun, 18 Oct 2020 19:24:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F0435D9D2;
	Sun, 18 Oct 2020 19:24:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3562A180B657;
	Sun, 18 Oct 2020 19:24:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09IJOoOt012416 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 18 Oct 2020 15:24:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F32A810AF416; Sun, 18 Oct 2020 19:24:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEFC110AF414
	for <cluster-devel@redhat.com>; Sun, 18 Oct 2020 19:24:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DCBA811E79
	for <cluster-devel@redhat.com>; Sun, 18 Oct 2020 19:24:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-594-o9c062WZO3iXeC0lgx91tA-1;
	Sun, 18 Oct 2020 15:24:43 -0400
X-MC-Unique: o9c062WZO3iXeC0lgx91tA-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4703D222EC;
	Sun, 18 Oct 2020 19:24:41 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Sun, 18 Oct 2020 15:23:40 -0400
Message-Id: <20201018192417.4055228-19-sashal@kernel.org>
In-Reply-To: <20201018192417.4055228-1-sashal@kernel.org>
References: <20201018192417.4055228-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09IJOoOt012416
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 4.19 19/56] fs: dlm: fix configfs
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
index 1270551d24e38..f13d865244501 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -218,6 +218,7 @@ struct dlm_space {
 	struct list_head members;
 	struct mutex members_lock;
 	int members_count;
+	struct dlm_nodes *nds;
 };
 
 struct dlm_comms {
@@ -426,6 +427,7 @@ static struct config_group *make_space(struct config_group *g, const char *name)
 	INIT_LIST_HEAD(&sp->members);
 	mutex_init(&sp->members_lock);
 	sp->members_count = 0;
+	sp->nds = nds;
 	return &sp->group;
 
  fail:
@@ -447,6 +449,7 @@ static void drop_space(struct config_group *g, struct config_item *i)
 static void release_space(struct config_item *i)
 {
 	struct dlm_space *sp = config_item_to_space(i);
+	kfree(sp->nds);
 	kfree(sp);
 }
 
-- 
2.25.1


