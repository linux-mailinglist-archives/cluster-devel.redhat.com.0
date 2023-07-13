Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB375290F
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 18:49:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689266962;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pZlL8jMpyOjdrZANlyHGPPGFAx27pk+4T5C748Xc53A=;
	b=U0JcP4s2ujSwNt8ci9pImXwCacM0n9Gm9fBr1hfEhEOOWRPs7xesfl7k1oSHGL1MscrxCp
	HrFU11+mIb/VuBXbLFvOY7pJ2eUJPZgt8Xo7//3mEcOjxdCYjRmlH5aV9hUKk7BFb6jLTV
	bam2kl5wuj9COKDW4HTCQD39q37iUeE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-Vlxrea86N0CT3mZCl8JkSg-1; Thu, 13 Jul 2023 12:49:20 -0400
X-MC-Unique: Vlxrea86N0CT3mZCl8JkSg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88D428022EF;
	Thu, 13 Jul 2023 16:49:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7CEF0F66CB;
	Thu, 13 Jul 2023 16:49:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1ED6619465A0;
	Thu, 13 Jul 2023 16:49:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5CD4D1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 16:49:02 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4167E2166B2A; Thu, 13 Jul 2023 16:49:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
 (fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A3592166B26;
 Thu, 13 Jul 2023 16:49:01 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 13 Jul 2023 12:48:35 -0400
Message-Id: <20230713164838.3583052-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCHv2 v6.5-rc1 0/3] fs: dlm: workarounds and
 cancellation
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
Cc: cluster-devel@redhat.com, stable@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi,

This patch-series trying to avoid issues when plock ops with
DLM_PLOCK_FL_CLOSE flag is set sends a reply back which should never be
the case. This problem getting more serious when introducing a new plock
op and an answer was not expected as 

I changed in v2 to check on DLM_PLOCK_FL_CLOSE flag for stable as this
can also being used to fix the potential issue for older kernels and it
does not change the UAPI. For newer user space applications the new flag
DLM_PLOCK_FL_NO_REPLY will tell the user space application to never send
an result back, it will handle this filter earlier in user space. For
older user space software we will filter the result in ther kernel.

This requires the behaviour that the flags are the same for the request
and the reply which is the case for dlm_controld.

Also fix the wrapped string and don't spam the user ignoring replies.

- Alex

Alexander Aring (3):
  fs: dlm: ignore DLM_PLOCK_FL_CLOSE flag results
  fs: dlm: introduce DLM_PLOCK_FL_NO_REPLY flag
  fs: dlm: allow to F_SETLKW getting interrupted

 fs/dlm/plock.c                 | 107 ++++++++++++++++++++++++---------
 include/uapi/linux/dlm_plock.h |   2 +
 2 files changed, 81 insertions(+), 28 deletions(-)

-- 
2.31.1

