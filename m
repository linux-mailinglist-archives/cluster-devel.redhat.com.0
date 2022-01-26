Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E385549CD44
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jan 2022 16:04:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643209479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PwDpPFsxTrq2rRtwOqI7ZJIt9eR/2qLQnt7AqyYtFWc=;
	b=Hb1Eijy0glYCTcgXI5T0iRlz6+IE2YNZ0Gnnd6UIuYelGdgGKtuA280yDstvA+ReoGXnbn
	q6m4bdIm6ruhmMRv2TnUKLZHDJXeY9Otv81MKr2CvGPtOZAt/r2gaU9d+XhoDnexqDuf9v
	q+/OSWbwD5ahWeWYhzbwhWPHWdcHnf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-mVCBH5IANxGsgessfxCQQw-1; Wed, 26 Jan 2022 10:04:35 -0500
X-MC-Unique: mVCBH5IANxGsgessfxCQQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D93888143EF;
	Wed, 26 Jan 2022 15:04:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F63D1091EE9;
	Wed, 26 Jan 2022 15:04:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 014974CA93;
	Wed, 26 Jan 2022 15:04:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20QF4SnY016283 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jan 2022 10:04:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EDD5A70D38; Wed, 26 Jan 2022 15:04:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D92A570D30;
	Wed, 26 Jan 2022 15:04:06 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: jiangshanlai@gmail.com
Date: Wed, 26 Jan 2022 10:03:54 -0500
Message-Id: <20220126150354.3644838-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, paulmck@kernel.org, josh@joshtriplett.org,
	rostedt@goodmis.org, rcu@vger.kernel.org, mathieu.desnoyers@efficios.com
Subject: [Cluster-devel] [PATCH] srcutree: use export for srcu_struct
	defined by DEFINE_STATIC_SRCU()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch fixes a sparse issue if DEFINE_STATIC_SRCU() of srcutree is
used by a module. Sparse will show:

sparse: symbol '__srcu_struct_nodes_srcu' was not declared. Should it be static?

The problem is here that the DEFINE_STATIC_SRCU() of srcutree uses
__DEFINE_SRCU() and define a non-static srcu_struct. This srcu_struct
will be exported by inserting it in a special module section
'__section("___srcu_struct_ptrs")'. During load/unloading srcutree runs
their init/cleanup functionality. It seems sparse does not understand
this connection. To avoid the sparse warning we make a prototype of the
exported srcu_struct with an export keyword. This way we tell the
that the srcu_struct might be used outside of the module.

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 include/linux/srcutree.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/srcutree.h b/include/linux/srcutree.h
index cb1f4351e8ba..f81be0749484 100644
--- a/include/linux/srcutree.h
+++ b/include/linux/srcutree.h
@@ -121,6 +121,7 @@ struct srcu_struct {
 #ifdef MODULE
 # define __DEFINE_SRCU(name, is_static)					\
 	is_static struct srcu_struct name;				\
+	extern struct srcu_struct * const __srcu_struct_##name;		\
 	struct srcu_struct * const __srcu_struct_##name			\
 		__section("___srcu_struct_ptrs") = &name
 #else
-- 
2.31.1

