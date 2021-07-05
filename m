Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2949D3BBF05
	for <lists+cluster-devel@lfdr.de>; Mon,  5 Jul 2021 17:29:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-qzCfsynKNNeE-jrwYEVenw-1; Mon, 05 Jul 2021 11:29:00 -0400
X-MC-Unique: qzCfsynKNNeE-jrwYEVenw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBD9A1084F4C;
	Mon,  5 Jul 2021 15:28:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCEC75D9DE;
	Mon,  5 Jul 2021 15:28:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A80961809C9A;
	Mon,  5 Jul 2021 15:28:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 165FSt4A031888 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 5 Jul 2021 11:28:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6BCC1112C34; Mon,  5 Jul 2021 15:28:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBFBF1000DA4
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:28:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 349B91071CE1
	for <cluster-devel@redhat.com>; Mon,  5 Jul 2021 15:28:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-249-9zXUHzPAOcqEuTCZyFf_7Q-1;
	Mon, 05 Jul 2021 11:28:47 -0400
X-MC-Unique: 9zXUHzPAOcqEuTCZyFf_7Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id A67AC6198C;
	Mon,  5 Jul 2021 15:28:45 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Mon,  5 Jul 2021 11:27:39 -0400
Message-Id: <20210705152815.1520546-23-sashal@kernel.org>
In-Reply-To: <20210705152815.1520546-1-sashal@kernel.org>
References: <20210705152815.1520546-1-sashal@kernel.org>
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
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.13 23/59] fs: dlm: fix memory leak
	when fenced
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit 700ab1c363c7b54c9ea3222379b33fc00ab02f7b ]

I got some kmemleak report when a node was fenced. The user space tool
dlm_controld will therefore run some rmdir() in dlm configfs which was
triggering some memleaks. This patch stores the sps and cms attributes
which stores some handling for subdirectories of the configfs cluster
entry and free them if they get released as the parent directory gets
freed.

unreferenced object 0xffff88810d9e3e00 (size 192):
  comm "dlm_controld", pid 342, jiffies 4294698126 (age 55438.801s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 73 70 61 63 65 73 00 00  ........spaces..
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000db8b640b>] make_cluster+0x5d/0x360
    [<000000006a571db4>] configfs_mkdir+0x274/0x730
    [<00000000b094501c>] vfs_mkdir+0x27e/0x340
    [<0000000058b0adaf>] do_mkdirat+0xff/0x1b0
    [<00000000d1ffd156>] do_syscall_64+0x40/0x80
    [<00000000ab1408c8>] entry_SYSCALL_64_after_hwframe+0x44/0xae
unreferenced object 0xffff88810d9e3a00 (size 192):
  comm "dlm_controld", pid 342, jiffies 4294698126 (age 55438.801s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 63 6f 6d 6d 73 00 00 00  ........comms...
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000a7ef6ad2>] make_cluster+0x82/0x360
    [<000000006a571db4>] configfs_mkdir+0x274/0x730
    [<00000000b094501c>] vfs_mkdir+0x27e/0x340
    [<0000000058b0adaf>] do_mkdirat+0xff/0x1b0
    [<00000000d1ffd156>] do_syscall_64+0x40/0x80
    [<00000000ab1408c8>] entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/config.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 88d95d96e36c..52bcda64172a 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -79,6 +79,9 @@ struct dlm_cluster {
 	unsigned int cl_new_rsb_count;
 	unsigned int cl_recover_callbacks;
 	char cl_cluster_name[DLM_LOCKSPACE_LEN];
+
+	struct dlm_spaces *sps;
+	struct dlm_comms *cms;
 };
 
 static struct dlm_cluster *config_item_to_cluster(struct config_item *i)
@@ -409,6 +412,9 @@ static struct config_group *make_cluster(struct config_group *g,
 	if (!cl || !sps || !cms)
 		goto fail;
 
+	cl->sps = sps;
+	cl->cms = cms;
+
 	config_group_init_type_name(&cl->group, name, &cluster_type);
 	config_group_init_type_name(&sps->ss_group, "spaces", &spaces_type);
 	config_group_init_type_name(&cms->cs_group, "comms", &comms_type);
@@ -458,6 +464,9 @@ static void drop_cluster(struct config_group *g, struct config_item *i)
 static void release_cluster(struct config_item *i)
 {
 	struct dlm_cluster *cl = config_item_to_cluster(i);
+
+	kfree(cl->sps);
+	kfree(cl->cms);
 	kfree(cl);
 }
 
-- 
2.30.2

