Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B92473F0CBA
	for <lists+cluster-devel@lfdr.de>; Wed, 18 Aug 2021 22:27:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629318465;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O8lzCTf//63gAxHboQcZTEOpnepevgqGXHM8Utc52Dc=;
	b=Fv8ngOP0O2BEoyDxpXqR4dFkvk0PP/X1+WfVw5lmvMmA0ECHfp+ikEJPSVyfI77tE2PO2H
	3IjBL0mIXIJ7DKuhUYKjZuZFDdRaX0JlQxZ43a4Jm+khgleY8NfomtCry0oNDVSilcQOQ6
	wKIOwVH/71jQn6fLTuuc6lKJyyt8Nd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-hw_9KWwKNTGmgVeY_CTmyQ-1; Wed, 18 Aug 2021 16:27:44 -0400
X-MC-Unique: hw_9KWwKNTGmgVeY_CTmyQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33FC81008064;
	Wed, 18 Aug 2021 20:27:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8098A60938;
	Wed, 18 Aug 2021 20:27:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CFA44BB7C;
	Wed, 18 Aug 2021 20:27:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17IKRXZD011391 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 18 Aug 2021 16:27:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5CE465D9DE; Wed, 18 Aug 2021 20:27:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8E84B5D9C6;
	Wed, 18 Aug 2021 20:27:29 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 18 Aug 2021 16:27:12 -0400
Message-Id: <20210818202716.3094835-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND dlm/next 0/4] fs: dlm: misc and
	tracing
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

this series is a resend of my pending patches which I sent some days ago.
For the recent dlm tracepoint patches I did some changes, see below.

changes in "fs: dlm: initial support for tracepoints":

 - switch from e.g. uin32_t/u32 to __u32 in dlm tracing header as
   I figured out that this is common used. However it seems it really
   doesn't care, they are not uapi headers.
 - switch from %d to %x printout for lkb_id as it is used for dlm
   debugfs. The lockspace id is still %d as it is used for sysfs.
 - move trace_dlm_lock_start after error, we don't trace the error
   and we need to garuantee that lkb pointer is not dangled.
 - add tracepoint start/end for dlm_unlock aswell, otherwise there are
   ast callbacks which are not recognizable, especially on DLM_EUNLOCK
   inside the status block.
 - add a note that dlm_lock/unlock_start will only be traced if ls/lkb
   is valid. I think it makes no sense without any reference to do any
   lock/unlock tracing.

- Alex

Alexander Aring (4):
  fs: dlm: implement delayed ack handling
  fs: dlm: fix return -EINTR on recovery stopped
  fs: dlm: initial support for tracepoints
  fs: dlm: trace socket handling

 fs/dlm/ast.c               |   4 +
 fs/dlm/dir.c               |   4 +-
 fs/dlm/lock.c              |  10 ++
 fs/dlm/lowcomms.c          |   5 +
 fs/dlm/lowcomms.h          |   1 +
 fs/dlm/main.c              |   3 +
 fs/dlm/member.c            |   4 +-
 fs/dlm/midcomms.c          |  56 +++++++--
 fs/dlm/recoverd.c          |   4 +-
 include/trace/events/dlm.h | 252 +++++++++++++++++++++++++++++++++++++
 10 files changed, 332 insertions(+), 11 deletions(-)
 create mode 100644 include/trace/events/dlm.h

-- 
2.27.0

