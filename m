Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BD355536D
	for <lists+cluster-devel@lfdr.de>; Wed, 22 Jun 2022 20:46:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655923584;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MJN0ItPKCMDukT+ehegMGk/293zusqf5REfudRdpFqw=;
	b=TdIQllUzfexJB9pTfjYhBRJ5GmPxLnkLTAN2lWA/I5gIavdaeS5kseY8Afep0MD4Fp4Wjb
	RgCesDkxn/lKGKfxPumKMyWnMiXIRg0A0hOQugg4sx2BdMtryw0oxyddnqUVMIe5AXRau1
	IFCtRt5pBcKiSX40f6PCas7ZnYMgv98=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-xx02RT0KPwy1V3yZD2CVAg-1; Wed, 22 Jun 2022 14:46:18 -0400
X-MC-Unique: xx02RT0KPwy1V3yZD2CVAg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE0B0101E986;
	Wed, 22 Jun 2022 18:46:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 928DA2166B26;
	Wed, 22 Jun 2022 18:46:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C1D411947062;
	Wed, 22 Jun 2022 18:46:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 695B61947055 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 22 Jun 2022 18:45:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D7E940CFD0F; Wed, 22 Jun 2022 18:45:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3C7C40CFD0B;
 Wed, 22 Jun 2022 18:45:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 22 Jun 2022 14:45:22 -0400
Message-Id: <20220622184523.1886869-20-aahringo@redhat.com>
In-Reply-To: <20220622184523.1886869-1-aahringo@redhat.com>
References: <20220622184523.1886869-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [Cluster-devel] [PATCH RESEND v5.19-rc3 19/20] fs: dlm: add API
 deprecation warning
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

This patch adds a deprecation config to DLM for API which will be removed
in kernel v5.22. This deprecation warning will occur if somebody enables
the deprecation API Kconfig entry and using the actual feature which
will get deprecated as a notification to update their user space.

Note that the timeout feature for kernel locks was never been supported.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/Kconfig     |  9 +++++++++
 fs/dlm/lockspace.c | 11 ++++++++++-
 fs/dlm/netlink.c   |  8 ++++++++
 fs/dlm/user.c      |  8 ++++++++
 4 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/Kconfig b/fs/dlm/Kconfig
index ee92634196a8..cae58f21da08 100644
--- a/fs/dlm/Kconfig
+++ b/fs/dlm/Kconfig
@@ -9,6 +9,15 @@ menuconfig DLM
 	A general purpose distributed lock manager for kernel or userspace
 	applications.
 
+config DLM_DEPRECATED_API
+	bool "DLM deprecated API"
+	depends on DLM
+	help
+	Enables DLM deprecated API which will be removed in later Linux
+	kernel releases.
+
+	If you are unsure, say N.
+
 config DLM_DEBUG
 	bool "DLM debugging"
 	depends on DLM
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index ca1eca0809d4..c9ec10700115 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -489,8 +489,17 @@ static int new_lockspace(const char *name, const char *cluster,
 		ls->ls_ops_arg = ops_arg;
 	}
 
-	if (flags & DLM_LSFL_TIMEWARN)
+	if (flags & DLM_LSFL_TIMEWARN) {
+#ifdef CONFIG_DLM_DEPRECATED_API
+		pr_warn_once("===============================================================\n"
+			     "WARNING: the dlm DLM_LSFL_TIMEWARN flag is being deprecated and\n"
+			     "         will be removed in v5.22!\n"
+			     "         Inclusive DLM_LSFL_TIMEWARN define in UAPI header!\n"
+			     "===============================================================\n");
+#endif
+
 		set_bit(LSFL_TIMEWARN, &ls->ls_flags);
+	}
 
 	/* ls_exflags are forced to match among nodes, and we don't
 	   need to require all nodes to have some flags set */
diff --git a/fs/dlm/netlink.c b/fs/dlm/netlink.c
index 67f68d48d60c..fed04860e550 100644
--- a/fs/dlm/netlink.c
+++ b/fs/dlm/netlink.c
@@ -57,6 +57,14 @@ static int send_data(struct sk_buff *skb)
 
 static int user_cmd(struct sk_buff *skb, struct genl_info *info)
 {
+#ifdef CONFIG_DLM_DEPRECATED_API
+	pr_warn_once("====================================================\n"
+		     "WARNING: the dlm netlink API is being deprecated and\n"
+		     "         will be removed in v5.22!\n"
+		     "         Inclusive DLM netlink UAPI header!\n"
+		     "====================================================\n");
+#endif
+
 	listener_nlportid = info->snd_portid;
 	printk("user_cmd nlpid %u\n", listener_nlportid);
 	return 0;
diff --git a/fs/dlm/user.c b/fs/dlm/user.c
index 4b2a24a6a15d..1fccb08bd825 100644
--- a/fs/dlm/user.c
+++ b/fs/dlm/user.c
@@ -250,6 +250,14 @@ static int device_user_lock(struct dlm_user_proc *proc,
 		goto out;
 	}
 
+#ifdef CONFIG_DLM_DEPRECATED_API
+	if (params->timeout)
+		pr_warn_once("========================================================\n"
+			     "WARNING: the lkb timeout feature is being deprecated and\n"
+			     "         will be removed in v5.22!\n"
+			     "========================================================\n");
+#endif
+
 	ua = kzalloc(sizeof(struct dlm_user_args), GFP_NOFS);
 	if (!ua)
 		goto out;
-- 
2.31.1

