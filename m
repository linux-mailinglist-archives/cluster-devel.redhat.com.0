Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A145943CDA5
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Oct 2021 17:34:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635348865;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JzlwT4M+tbq3nRPUkX5M2eIKsqfsQoMBybOxJM8Mk5M=;
	b=aWXrtMVKh4GIw2j1lElAcWuWzb8qffvlt/zK3fj+BAyJCkqYZzFlDj4C0lXO5QglRrw5T4
	xnvcFwJuwGhAUbPyfpM3h6r7JW38mbU6PMwHIWpGwkyfgHHYJEEwOXis4exlWW8tYs46dz
	85MjCNHw7oNO3UIBCvbxM5I5BL3tR2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-uchebrmlPKOW1nlHaIRBaA-1; Wed, 27 Oct 2021 11:34:22 -0400
X-MC-Unique: uchebrmlPKOW1nlHaIRBaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 801E719200C2;
	Wed, 27 Oct 2021 15:34:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 703B618539;
	Wed, 27 Oct 2021 15:34:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1A6354EA78;
	Wed, 27 Oct 2021 15:34:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19RFNnvm009173 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 11:23:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C4A671042AAF; Wed, 27 Oct 2021 15:23:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 747A210429D2;
	Wed, 27 Oct 2021 15:23:49 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 27 Oct 2021 11:23:15 -0400
Message-Id: <20211027152322.3236492-2-aahringo@redhat.com>
In-Reply-To: <20211027152322.3236492-1-aahringo@redhat.com>
References: <20211027152322.3236492-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 1/8] fs: dlm: remove obsolete INBUF
	define
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

This patch removes an obsolete define for some length for an temporary
buffer which is not being used anymore. The use of this define is not
necessary anymore since commit 4798cbbfbd00 ("fs: dlm: rework receive
handling").

Signed-off-by: Alexander Aring <aahringo@redhat.com>
---
 fs/dlm/dlm_internal.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 18f72c30f4e1..bf3a5b39437a 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -41,12 +41,6 @@
 #include <linux/dlm.h>
 #include "config.h"
 
-/* Size of the temp buffer midcomms allocates on the stack.
-   We try to make this large enough so most messages fit.
-   FIXME: should sctp make this unnecessary? */
-
-#define DLM_INBUF_LEN		148
-
 struct dlm_ls;
 struct dlm_lkb;
 struct dlm_rsb;
-- 
2.27.0

