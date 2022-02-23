Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 174434C19B0
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Feb 2022 18:15:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645636507;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w8rDskUw+BRMPDAJSgNp589Ya5ziaDZSl2RoqgeXpGs=;
	b=QUhNfDpvaG2HsY7aq0bUrNBe0oyCZtMXamVtUDzJV15hWbSDnK7ZzVZk8Vrv/mY4GIcgTi
	CjqXQP6J1Y+qzpokF56ztDp2+CzOfNhx0j6C9j4PmHJIEYHXhEaGdWrMsa47O9Drge30Kl
	KPgN8kbQkaxtElwJ6g9smE64E1qvmfY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-YgFTmLG5O0WWWvDXOYe6Ig-1; Wed, 23 Feb 2022 12:15:03 -0500
X-MC-Unique: YgFTmLG5O0WWWvDXOYe6Ig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68CB81091DA2;
	Wed, 23 Feb 2022 17:15:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A06686B8F;
	Wed, 23 Feb 2022 17:15:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 442121809C98;
	Wed, 23 Feb 2022 17:15:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21NH8oFm009238 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 12:08:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5F14A838EE; Wed, 23 Feb 2022 17:08:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11246838E6;
	Wed, 23 Feb 2022 17:08:37 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Feb 2022 12:08:20 -0500
Message-Id: <20220223170829.830864-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, viro@zeniv.linux.org.uk
Subject: [Cluster-devel] [PATCH/RFC dlm/next 0/9] fs: dlm: change lock and
	endianness handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

this patch series removes all sparse warnings which are occur when
calling:

make C=2 fs/dlm/*.o

This patch series will not fix anything, but changes e.g. the endianness
handling in dlm so we probably can find issues in future if dlm wire
message value is compared against a host byte order value.

Otherwise there are some changes regarding casting or move functions
around to make sparse quiet that it does not complain about those
sections which are in my opinion false positives or at least handle it
in such way right now to find a better solution in future.

I hope I caught all necessary endianness conversions (sparse does not
complain if a format string and a value is handled as non host byte
order for printout, but I tried to caught them all). There might be some
better options to handle e.g. lkb types directly in little endian as it is
dlm wire byte order. However this patch series will at first remove the
in/out functionality for byte order conversion. There might be in future
more follow up patches to change the byte order conversion in dlm
application stack.

- Alex

Alexander Aring (9):
  fs: dlm: add __CHECKER__ for false positives
  fs: dlm: use __le types for options header
  fs: dlm: use __le types for dlm header
  fs: dlm: use __le types for rcom messages
  fs: dlm: use __le types for dlm messages
  fs: dlm: move conversion to compile time
  fs: dlm: remove __user conversion warnings
  fs: dlm: remove found label in dlm_master_lookup
  fs: dlm: cleanup lock handling in dlm_master_lookup

 fs/dlm/dir.c          |   2 +-
 fs/dlm/dlm_internal.h |  66 ++---
 fs/dlm/lock.c         | 545 ++++++++++++++++++++++--------------------
 fs/dlm/lowcomms.c     |  10 +
 fs/dlm/member.c       |  11 +-
 fs/dlm/midcomms.c     |  58 +++--
 fs/dlm/rcom.c         | 120 +++++-----
 fs/dlm/recover.c      |  10 +-
 fs/dlm/requestqueue.c |  20 +-
 fs/dlm/user.c         |  16 +-
 fs/dlm/util.c         |  92 +------
 fs/dlm/util.h         |   8 +-
 12 files changed, 458 insertions(+), 500 deletions(-)

-- 
2.31.1

