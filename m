Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0AC65E1E8
	for <lists+cluster-devel@lfdr.de>; Thu,  5 Jan 2023 01:45:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1672879522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8YhbpSF0Q9n/O63HHpzvlILDUmIUlT7xx3yPzMRu/hU=;
	b=K7QZyYnZVNzi4S23JZFuTxxoV9o6VGs+wbX/UXAf+/ntFCHOqVqPgQtqsN2OpO5IteQSSL
	4jVif7wIKTB1VNSYdRYJ5xLxvNLO0Q9V7AhQjIyLaez3FWspuogTSFF2BolwA6477ULBDA
	uPJ8bHmv1sZ+7xKSdRcdi62aavpm+tI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-pRXRacwzOECPRSUlnsgZ7Q-1; Wed, 04 Jan 2023 19:45:19 -0500
X-MC-Unique: pRXRacwzOECPRSUlnsgZ7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A2DD9101A52E;
	Thu,  5 Jan 2023 00:45:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E85A01121315;
	Thu,  5 Jan 2023 00:45:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9547B194658F;
	Thu,  5 Jan 2023 00:45:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C57E01946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu,  5 Jan 2023 00:45:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A5D41C15BAD; Thu,  5 Jan 2023 00:45:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E80AC15BA0
 for <cluster-devel@redhat.com>; Thu,  5 Jan 2023 00:45:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83D322806042
 for <cluster-devel@redhat.com>; Thu,  5 Jan 2023 00:45:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-Nn8-bfSjPpKC_qHBsXKM_g-1; Wed, 04 Jan 2023 19:45:03 -0500
X-MC-Unique: Nn8-bfSjPpKC_qHBsXKM_g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 98360618C7;
 Thu,  5 Jan 2023 00:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D78C4332B;
 Thu,  5 Jan 2023 00:38:15 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id D83965C1C9E; Wed,  4 Jan 2023 16:38:14 -0800 (PST)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: rcu@vger.kernel.org
Date: Wed,  4 Jan 2023 16:38:05 -0800
Message-Id: <20230105003813.1770367-19-paulmck@kernel.org>
In-Reply-To: <20230105003759.GA1769545@paulmck-ThinkPad-P17-Gen-1>
References: <20230105003759.GA1769545@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH rcu 19/27] fs/dlm: Remove "select SRCU"
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, kernel-team@meta.com,
 linux-kernel@vger.kernel.org, rostedt@goodmis.org, cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Now that the SRCU Kconfig option is unconditionally selected, there is
no longer any point in selecting it.  Therefore, remove the "select SRCU"
Kconfig statements.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Christine Caulfield <ccaulfie@redhat.com>
Cc: David Teigland <teigland@redhat.com>
Cc: <cluster-devel@redhat.com>
---
 fs/dlm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/dlm/Kconfig b/fs/dlm/Kconfig
index 1105ce3c80cbd..b3b86dbdc1878 100644
--- a/fs/dlm/Kconfig
+++ b/fs/dlm/Kconfig
@@ -4,7 +4,6 @@ menuconfig DLM
 =09depends on INET
 =09depends on SYSFS && CONFIGFS_FS && (IPV6 || IPV6=3Dn)
 =09select IP_SCTP
-=09select SRCU
 =09help
 =09A general purpose distributed lock manager for kernel or userspace
 =09applications.
--=20
2.31.1.189.g2e36527f23

