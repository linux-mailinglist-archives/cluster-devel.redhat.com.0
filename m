Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DB066884E
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Jan 2023 01:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673569252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FLJGzd5MR+ku4wjGfI4m+dORSyAvR08JrW5IPife2Qw=;
	b=Mgl6d/0P05kmE0tbwjEaCTPJ8TeF02l8TNyPLXsXEQrObyompcyuZ7o8qzxQKNWC7RNs3a
	qEhCYhVbEPes9g3rZTBBdf+Xobf4ea8OwThHmLErRABbLljhWWnXf6n4vf1pqBQetMOuQA
	UdpGzbO/89PFhJw9hHqkedIyzqHQ9Ms=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-jn2NOQPhM7SS9lqcoT9FdA-1; Thu, 12 Jan 2023 19:20:47 -0500
X-MC-Unique: jn2NOQPhM7SS9lqcoT9FdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 810F62807D6D;
	Fri, 13 Jan 2023 00:20:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 635C340C2064;
	Fri, 13 Jan 2023 00:20:45 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 002D21947051;
	Fri, 13 Jan 2023 00:20:45 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A453F1946A78 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 13 Jan 2023 00:20:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 85EB9492B01; Fri, 13 Jan 2023 00:20:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EFE8492B00
 for <cluster-devel@redhat.com>; Fri, 13 Jan 2023 00:20:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64AAA183B3C0
 for <cluster-devel@redhat.com>; Fri, 13 Jan 2023 00:20:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-H6Qqdj9BN0i0LKmnSYBqjw-1; Thu, 12 Jan 2023 19:20:42 -0500
X-MC-Unique: H6Qqdj9BN0i0LKmnSYBqjw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A18BC62202;
 Fri, 13 Jan 2023 00:11:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53217C43322;
 Fri, 13 Jan 2023 00:11:35 +0000 (UTC)
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id AABED5C1C63; Thu, 12 Jan 2023 16:11:34 -0800 (PST)
From: "Paul E. McKenney" <paulmck@kernel.org>
To: rcu@vger.kernel.org
Date: Thu, 12 Jan 2023 16:11:23 -0800
Message-Id: <20230113001132.3375334-11-paulmck@kernel.org>
In-Reply-To: <20230113001103.GA3374173@paulmck-ThinkPad-P17-Gen-1>
References: <20230113001103.GA3374173@paulmck-ThinkPad-P17-Gen-1>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH rcu v2 11/20] fs/dlm: Remove "select SRCU"
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
Cc: John Ogness <john.ogness@linutronix.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, Anup Patel <anup@brainfault.org>,
 kernel-team@meta.com, linux-kernel@vger.kernel.org, rostedt@goodmis.org,
 cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Acked-by: Anup Patel <anup@brainfault.org>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
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

