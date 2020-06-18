Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 98E121FDB5B
	for <lists+cluster-devel@lfdr.de>; Thu, 18 Jun 2020 03:12:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592442766;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L1BBLi+PWpIPs7Y5Vp07PFj2ODQap5sw6q1eALeTQv0=;
	b=V9Ib/B/Ww4cGZBbNknr4rfXIlSI4E30GpRU/g58GywS7lGQsyWiJGdJGEd78F+YF+c35XP
	DGV0gUYZopzlaLy26AG/DtB1ZsM4R0nvPnaqDRtInr0gIOdReys8TvL+0L8e2laKdScHaG
	8s6N0170l7rW5F+oCjekl4Oc8GeDceo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-a5o6vNG-MCyqt5S6_6myfQ-1; Wed, 17 Jun 2020 21:12:44 -0400
X-MC-Unique: a5o6vNG-MCyqt5S6_6myfQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5603E464;
	Thu, 18 Jun 2020 01:12:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF0E260BF4;
	Thu, 18 Jun 2020 01:12:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B0D9833C6;
	Thu, 18 Jun 2020 01:12:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I1CXjQ031275 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 21:12:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EFA5010AF406; Thu, 18 Jun 2020 01:12:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB40810AF404
	for <cluster-devel@redhat.com>; Thu, 18 Jun 2020 01:12:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98165101A526
	for <cluster-devel@redhat.com>; Thu, 18 Jun 2020 01:12:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-462-w2fNhyiBPSqxEo8UYSyajQ-1;
	Wed, 17 Jun 2020 21:12:26 -0400
X-MC-Unique: w2fNhyiBPSqxEo8UYSyajQ-1
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ADBEA221E9;
	Thu, 18 Jun 2020 01:12:24 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Wed, 17 Jun 2020 21:04:55 -0400
Message-Id: <20200618010805.600873-198-sashal@kernel.org>
In-Reply-To: <20200618010805.600873-1-sashal@kernel.org>
References: <20200618010805.600873-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05I1CXjQ031275
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	cluster-devel@redhat.com, clang-built-linux@googlegroups.com,
	Josh Poimboeuf <jpoimboe@redhat.com>
Subject: [Cluster-devel] [PATCH AUTOSEL 5.7 198/388] dlm: remove BUG()
	before panic()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit fe204591cc9480347af7d2d6029b24a62e449486 ]

Building a kernel with clang sometimes fails with an objtool error in dlm:

fs/dlm/lock.o: warning: objtool: revert_lock_pc()+0xbd: can't find jump dest instruction at .text+0xd7fc

The problem is that BUG() never returns and the compiler knows
that anything after it is unreachable, however the panic still
emits some code that does not get fully eliminated.

Having both BUG() and panic() is really pointless as the BUG()
kills the current process and the subsequent panic() never hits.
In most cases, we probably don't really want either and should
replace the DLM_ASSERT() statements with WARN_ON(), as has
been done for some of them.

Remove the BUG() here so the user at least sees the panic message
and we can reliably build randconfig kernels.

Fixes: e7fd41792fc0 ("[DLM] The core of the DLM for GFS2/CLVM")
Cc: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: clang-built-linux@googlegroups.com
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: David Teigland <teigland@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/dlm/dlm_internal.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 416d9de35679..4311d01b02a8 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -97,7 +97,6 @@ do { \
                __LINE__, __FILE__, #x, jiffies); \
     {do} \
     printk("\n"); \
-    BUG(); \
     panic("DLM:  Record message above and reboot.\n"); \
   } \
 }
-- 
2.25.1


