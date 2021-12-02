Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F0B466ADD
	for <lists+cluster-devel@lfdr.de>; Thu,  2 Dec 2021 21:23:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638476609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CCDNtbkWTOL7L0YokpA4QtEWkllIbYTjOyCDBz7/6sM=;
	b=GdE4mhjwGDoBR0/G/67gHwHDDQk7Y4Y7Jsj8J1E6l72uZrLlGLWn4m9G5Rl+5yve/vOyZQ
	oeWfixBIJj3ksM3Pk4CJlo+9zie7cL0YPtNLHkjLHfHOelqTOcLhBzCavbFDUzOf3tMj4z
	Yqs8iYJkTsPxaw7iyv8UvHgQqqUIoEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-R6RclE9gOhyz3diZM48amw-1; Thu, 02 Dec 2021 15:23:25 -0500
X-MC-Unique: R6RclE9gOhyz3diZM48amw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A5D6102CB2A;
	Thu,  2 Dec 2021 20:23:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9809945D76;
	Thu,  2 Dec 2021 20:23:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 881FA1809C89;
	Thu,  2 Dec 2021 20:23:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B2KL0NY028278 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 2 Dec 2021 15:21:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 43911100EBBF; Thu,  2 Dec 2021 20:21:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C81E410016FE;
	Thu,  2 Dec 2021 20:20:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  2 Dec 2021 15:20:33 -0500
Message-Id: <20211202202039.1386193-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, wferi@debian.org, vvidic@debian.org
Subject: [Cluster-devel] [PATCH dlm-tool 0/6] dlm: debian patches and python
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

this patch contains patches from the debian dlm package which I want to
sync to upstream. Also I resend the python bindings for libdlm again and
add an example for make some histogram latency tracing between dlm_lock()
and ast callback by using ebpf. You need the recent dlm tracepoint patches
to use those examples.

- Alex

Alexander Aring (6):
  init: Enable systemctl help dlm to show relevant man pages
  dlm_controld: man: Fix typo: specfic => specific
  stonith_helper: Fix gcc build warnings
  stonith_helper: Don't link dlm_stonith against libxml2
  python: add bindings and test example
  python: add ebpf histogram example

 dlm_controld/dlm.conf.5         |   2 +-
 fence/Makefile                  |   2 -
 fence/stonith_helper.c          |   3 +-
 init/dlm.service                |   1 +
 python/README                   |   7 +
 python/bindings/__init__.py     |   0
 python/bindings/dlm.py          | 244 ++++++++++++++++++++++++++++++++
 python/ebpf/README              |   6 +
 python/ebpf/dlmhist.py          |  78 ++++++++++
 python/tests/dlm.py             |   1 +
 python/tests/recovery_interrupt |  60 ++++++++
 11 files changed, 399 insertions(+), 5 deletions(-)
 create mode 100644 python/README
 create mode 100644 python/bindings/__init__.py
 create mode 100644 python/bindings/dlm.py
 create mode 100644 python/ebpf/README
 create mode 100755 python/ebpf/dlmhist.py
 create mode 120000 python/tests/dlm.py
 create mode 100755 python/tests/recovery_interrupt

-- 
2.27.0

