Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD173740BC
	for <lists+cluster-devel@lfdr.de>; Wed,  5 May 2021 18:37:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103--u-kIml2Pf-obXbvOXnKqA-1; Wed, 05 May 2021 12:37:06 -0400
X-MC-Unique: -u-kIml2Pf-obXbvOXnKqA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1C401009600;
	Wed,  5 May 2021 16:37:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E07B060C17;
	Wed,  5 May 2021 16:37:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA1A4180B463;
	Wed,  5 May 2021 16:37:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 145Gb2D2032147 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 5 May 2021 12:37:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0014211E5BA; Wed,  5 May 2021 16:37:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED57C11E5B8
	for <cluster-devel@redhat.com>; Wed,  5 May 2021 16:37:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0158C8CDDF1
	for <cluster-devel@redhat.com>; Wed,  5 May 2021 16:37:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-136-mJ_uFu71MsaosNJDEKDb4g-1;
	Wed, 05 May 2021 12:36:56 -0400
X-MC-Unique: mJ_uFu71MsaosNJDEKDb4g-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E7F061948;
	Wed,  5 May 2021 16:36:53 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed,  5 May 2021 12:35:26 -0400
Message-Id: <20210505163648.3462507-3-sashal@kernel.org>
In-Reply-To: <20210505163648.3462507-1-sashal@kernel.org>
References: <20210505163648.3462507-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 145Gb2D2032147
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH AUTOSEL 5.10 03/85] fs: dlm: add errno
	handling to check callback
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
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 8bit

From: Alexander Aring <aahringo@redhat.com>

[ Upstream commit 8aa9540b49e0833feba75dbf4f45babadd0ed215 ]

This allows to return individual errno values for the config attribute
check callback instead of returning invalid argument only.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/config.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/config.c b/fs/dlm/config.c
index 49c5f9407098..73e6643903af 100644
--- a/fs/dlm/config.c
+++ b/fs/dlm/config.c
@@ -125,7 +125,7 @@ static ssize_t cluster_cluster_name_store(struct config_item *item,
 CONFIGFS_ATTR(cluster_, cluster_name);
 
 static ssize_t cluster_set(struct dlm_cluster *cl, unsigned int *cl_field,
-			   int *info_field, bool (*check_cb)(unsigned int x),
+			   int *info_field, int (*check_cb)(unsigned int x),
 			   const char *buf, size_t len)
 {
 	unsigned int x;
@@ -137,8 +137,11 @@ static ssize_t cluster_set(struct dlm_cluster *cl, unsigned int *cl_field,
 	if (rc)
 		return rc;
 
-	if (check_cb && check_cb(x))
-		return -EINVAL;
+	if (check_cb) {
+		rc = check_cb(x);
+		if (rc)
+			return rc;
+	}
 
 	*cl_field = x;
 	*info_field = x;
@@ -161,14 +164,20 @@ static ssize_t cluster_##name##_show(struct config_item *item, char *buf)     \
 }                                                                             \
 CONFIGFS_ATTR(cluster_, name);
 
-static bool dlm_check_zero(unsigned int x)
+static int dlm_check_zero(unsigned int x)
 {
-	return !x;
+	if (!x)
+		return -EINVAL;
+
+	return 0;
 }
 
-static bool dlm_check_buffer_size(unsigned int x)
+static int dlm_check_buffer_size(unsigned int x)
 {
-	return (x < DEFAULT_BUFFER_SIZE);
+	if (x < DEFAULT_BUFFER_SIZE)
+		return -EINVAL;
+
+	return 0;
 }
 
 CLUSTER_ATTR(tcp_port, dlm_check_zero);
-- 
2.30.2


