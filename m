Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6CA3EEED5
	for <lists+cluster-devel@lfdr.de>; Tue, 17 Aug 2021 16:57:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629212233;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OnG/+OyeRBd3e2YK57Uc9rttBxUqVmCqet5/tlbtdnw=;
	b=GryRDv+SmNWx0+B7nRAiKjQBRA8cvdEuZBrzEbpwnEoOGng7KAM6lNRHEBBwQT1auZ2qCg
	PUBDkPVQdAo6gVVGzdK+5D9KlsX8wVnDr4F0MhqN905dALwUdAyUpvap7p2YSKWIcGT4Yw
	VRjPiokfSULH5vaoifIzh+SeVX1ifhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-F5HUjLl-PiyYQTXgitPXRw-1; Tue, 17 Aug 2021 10:57:12 -0400
X-MC-Unique: F5HUjLl-PiyYQTXgitPXRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 299B9108292A;
	Tue, 17 Aug 2021 14:57:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D95D60916;
	Tue, 17 Aug 2021 14:57:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D28D0181A2A6;
	Tue, 17 Aug 2021 14:57:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17HEmfb1007747 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 17 Aug 2021 10:48:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFCEB1036D2A; Tue, 17 Aug 2021 14:48:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D129210016FB;
	Tue, 17 Aug 2021 14:48:37 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 17 Aug 2021 10:48:22 -0400
Message-Id: <20210817144824.2127457-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 0/2] fs: dlm: tracepoints
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

this patch series will introduce an initial handling for tracepoints in
dlm. Can be used for debugging, profiling, etc. I believe tracepoint can
be easily extended with other attributes. That means there will no breakage
of API if we extend fields furthermore.

- Alex

Alexander Aring (2):
  fs: dlm: initial support for tracepoints
  fs: dlm: trace socket handling

 fs/dlm/ast.c               |   4 +
 fs/dlm/lock.c              |   7 ++
 fs/dlm/lowcomms.c          |   4 +
 fs/dlm/main.c              |   3 +
 include/trace/events/dlm.h | 199 +++++++++++++++++++++++++++++++++++++
 5 files changed, 217 insertions(+)
 create mode 100644 include/trace/events/dlm.h

-- 
2.27.0

