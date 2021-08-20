Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id C958D3F31A1
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 18:39:39 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-h11jc7_VMq6R10TYQup3mg-1; Fri, 20 Aug 2021 12:39:37 -0400
X-MC-Unique: h11jc7_VMq6R10TYQup3mg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D91A11082925;
	Fri, 20 Aug 2021 16:39:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC51D18B42;
	Fri, 20 Aug 2021 16:39:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5805181A1CE;
	Fri, 20 Aug 2021 16:39:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KGdYKi003188 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 12:39:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 76DEB20C165B; Fri, 20 Aug 2021 16:39:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FDC52094D21
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 16:39:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0B18802A64
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 16:39:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-499-FILZz7VUPmOhD25pE9t-uQ-1;
	Fri, 20 Aug 2021 12:39:24 -0400
X-MC-Unique: FILZz7VUPmOhD25pE9t-uQ-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id DCCF86113B;
	Fri, 20 Aug 2021 16:39:21 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: torvalds@linux-foundation.org, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Fri, 20 Aug 2021 12:39:18 -0400
Message-Id: <20210820163919.435135-2-jlayton@kernel.org>
In-Reply-To: <20210820163919.435135-1-jlayton@kernel.org>
References: <20210820163919.435135-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: bfields@fieldses.org, linux-nfs@vger.kernel.org, linux-doc@vger.kernel.org,
	david@redhat.com, stable@vger.kernel.org, willy@infradead.org,
	cluster-devel@redhat.com, linux-mm@kvack.org,
	rostedt@goodmis.org, viro@zeniv.linux.org.uk, luto@kernel.org,
	v9fs-developer@lists.sourceforge.net, akpm@linux-foundation.org,
	linux-afs@lists.infradead.org, ocfs2-devel@oss.oracle.com,
	ebiederm@xmission.com
Subject: [Cluster-devel] [PATCH v3 1/2] fs: warn about impending deprecation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
 fs/namespace.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index ab4174a3c802..2279473d0d6f 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1716,8 +1716,12 @@ static inline bool may_mount(void)
 }
 
 #ifdef	CONFIG_MANDATORY_FILE_LOCKING
-static inline bool may_mandlock(void)
+static bool may_mandlock(void)
 {
+	pr_warn_once("======================================================\n"
+		     "WARNING: the mand mount option is being deprecated and\n"
+		     "         will be removed in v5.15!\n"
+		     "======================================================\n");
 	return capable(CAP_SYS_ADMIN);
 }
 #else
-- 
2.31.1

