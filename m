Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 27E503F2D8F
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 15:57:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-Jdw43IZoNDmS149phfXzEg-1; Fri, 20 Aug 2021 09:57:26 -0400
X-MC-Unique: Jdw43IZoNDmS149phfXzEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 338E0802947;
	Fri, 20 Aug 2021 13:57:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2135E1A26A;
	Fri, 20 Aug 2021 13:57:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B57A4A7C8;
	Fri, 20 Aug 2021 13:57:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KDvMfl021252 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 09:57:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB4EF104FA66; Fri, 20 Aug 2021 13:57:21 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E561110500B7
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 13:57:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4568118A6534
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 13:57:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-296-djD1K4ZhOKS6OFxFoj8SQw-1;
	Fri, 20 Aug 2021 09:57:13 -0400
X-MC-Unique: djD1K4ZhOKS6OFxFoj8SQw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A4716113B;
	Fri, 20 Aug 2021 13:57:10 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: torvalds@linux-foundation.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 20 Aug 2021 09:57:06 -0400
Message-Id: <20210820135707.171001-2-jlayton@kernel.org>
In-Reply-To: <20210820135707.171001-1-jlayton@kernel.org>
References: <20210820135707.171001-1-jlayton@kernel.org>
MIME-Version: 1.0
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
Cc: bfields@fieldses.org, linux-nfs@vger.kernel.org, linux-doc@vger.kernel.org,
	david@redhat.com, stable@vger.kernel.org, willy@infradead.org,
	w@1wt.eu, cluster-devel@redhat.com, linux-mm@kvack.org,
	rostedt@goodmis.org, viro@zeniv.linux.org.uk, luto@kernel.org,
	v9fs-developer@lists.sourceforge.net, akpm@linux-foundation.org,
	linux-afs@lists.infradead.org, ocfs2-devel@oss.oracle.com,
	ebiederm@xmission.com
Subject: [Cluster-devel] [PATCH v2 1/2] fs: warn about impending deprecation
	of mandatory locks
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

We've had CONFIG_MANDATORY_FILE_LOCKING since 2015 and a lot of distros
have disabled it. Warn the stragglers that still use "-o mand" that
we'll be dropping support for that mount option.

Cc: stable@vger.kernel.org
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/namespace.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/namespace.c b/fs/namespace.c
index ab4174a3c802..ffab0bb1e649 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1716,8 +1716,16 @@ static inline bool may_mount(void)
 }
 
 #ifdef	CONFIG_MANDATORY_FILE_LOCKING
+static bool warned_mand;
 static inline bool may_mandlock(void)
 {
+	if (!warned_mand) {
+		warned_mand = true;
+		pr_warn("======================================================\n");
+		pr_warn("WARNING: the mand mount option is being deprecated and\n");
+		pr_warn("         will be removed in v5.15!\n");
+		pr_warn("======================================================\n");
+	}
 	return capable(CAP_SYS_ADMIN);
 }
 #else
-- 
2.31.1

