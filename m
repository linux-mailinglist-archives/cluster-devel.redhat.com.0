Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 72587319558
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Feb 2021 22:46:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613080005;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VaQP+y5eFvaDOnW3T+9iYE3rvJTzIilghPDS03yLQ4E=;
	b=NrobZ9w8HztJSUT82LqMVkb7T/lb+KIzvBTHf9PpzpLwXeD7+FO12iHzUV8cxN/mVxSOJc
	7a85h5IA7GeQuweMuZ5dv1ieGAvWesnLtLzUxgN9U5RaPRmenAgOs9jfoxK49HDITnR0rl
	lKAamdP4XPUpwJmnADXOSdxWJinpf8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147--oblzp9TNVyE2U2MexzXPw-1; Thu, 11 Feb 2021 16:46:43 -0500
X-MC-Unique: -oblzp9TNVyE2U2MexzXPw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA0AB84F223;
	Thu, 11 Feb 2021 21:46:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A4CB70BA5;
	Thu, 11 Feb 2021 21:46:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 802C318095CC;
	Thu, 11 Feb 2021 21:46:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11BLkPuK030351 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 11 Feb 2021 16:46:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 61EE221EC9; Thu, 11 Feb 2021 21:46:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-210.rdu2.redhat.com [10.10.116.210])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 013FD21EFA;
	Thu, 11 Feb 2021 21:46:19 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 11 Feb 2021 16:46:13 -0500
Message-Id: <20210211214613.222088-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-tool] libdlm: add stdint.h to api header
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch adds a include of stdint.h to the libdlm api header,
otherwise application linking to it need to be sure to include the stdint
header before libdlm header as a workaround.
---
 libdlm/libdlm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libdlm/libdlm.h b/libdlm/libdlm.h
index d025ef8c..9255181c 100644
--- a/libdlm/libdlm.h
+++ b/libdlm/libdlm.h
@@ -10,6 +10,8 @@
 #ifndef __LIBDLM_H
 #define __LIBDLM_H
 
+#include <stdint.h>
+
 /*
  * Typedefs for things that are compatible with the kernel but replicated here
  * so that users only need the libdlm include file.  libdlm itself needs the
-- 
2.26.2

