Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B735443657
	for <lists+cluster-devel@lfdr.de>; Tue,  2 Nov 2021 20:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635880688;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8KeMTyznVdLikRzyV5PGUS8kaMpXdvr63qCOpxSrAKM=;
	b=c3R+76tHsaewLYL9rusOieF98ZQLO7D49aicqGAZb20B5fwrqpA42Ihg1fzOGNqN84qcn/
	k+j4lzHPC8xZBcC/nEsAmzLzeLv2z2oCIlX930/NfYgksf4gGzUeWSzDrVRZ3tpkAKitgm
	vRFzHbRKl8wgx435+buVcph5Jov/r2c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-14SS898kOF6U4rj1Gfl7IA-1; Tue, 02 Nov 2021 15:18:03 -0400
X-MC-Unique: 14SS898kOF6U4rj1Gfl7IA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7C378735C2;
	Tue,  2 Nov 2021 19:18:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7208A19C59;
	Tue,  2 Nov 2021 19:18:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 02B2A181A1D0;
	Tue,  2 Nov 2021 19:17:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A2JHrwU020682 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 2 Nov 2021 15:17:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77BBB60657; Tue,  2 Nov 2021 19:17:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A90FC67842;
	Tue,  2 Nov 2021 19:17:30 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  2 Nov 2021 15:17:06 -0400
Message-Id: <20211102191724.210095-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND v5.15-rc7 00/18] fs: dlm: cleanups,
	trace and debugfs
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

this patch series contains patches for some cleanups, adding tracepoints
and add more debugfs functionality to put dlm into a specific state
which can be combined to fuzz/test the DLM stack. This is a resend of
some pending patches. I still have some patches for trying changing the
ls_waiters mutex handling and how acting on critical recovery errors
(either if there is a dlm_new_lockspace() waiter or not).

- Alex

Alexander Aring (18):
  fs: dlm: remove obsolete INBUF define
  fs: dlm: fix small lockspace typo
  fs: dlm: debug improvements print nodeid
  fs: dlm: remove check SCTP is loaded message
  fs: dlm: move version conversion to compile time
  fs: dlm: use dlm_recovery_stopped instead of test_bit
  fs: dlm: use dlm_recovery_stopped in condition
  fs: dlm: make dlm_callback_resume quite
  fs: dlm: initial support for tracepoints
  fs: dlm: trace socket handling
  fs: dlm: requestqueue busy wait to event based wait
  fs: dlm: ls_count busy wait to event based wait
  fs: dlm: let handle callback data as void
  fs: dlm: add debugfs rawmsg send functionality
  fs: dlm: allow create lkb with specific id range
  fs: dlm: add lkb debugfs functionality
  fs: dlm: add lkb waiters debugfs functionality
  fs: dlm: filter user dlm messages for kernel locks

 fs/dlm/ast.c               |  12 +-
 fs/dlm/debug_fs.c          |  96 +++++++++++++-
 fs/dlm/dir.c               |   3 +-
 fs/dlm/dlm_internal.h      |  11 +-
 fs/dlm/lock.c              |  90 ++++++++++++-
 fs/dlm/lock.h              |   4 +
 fs/dlm/lockspace.c         |  37 +++---
 fs/dlm/lowcomms.c          |  25 ++--
 fs/dlm/lowcomms.h          |   4 +-
 fs/dlm/main.c              |   3 +
 fs/dlm/member.c            |   3 +-
 fs/dlm/midcomms.c          |  62 ++++++++-
 fs/dlm/midcomms.h          |   2 +
 fs/dlm/rcom.c              |   2 +-
 fs/dlm/recoverd.c          |   3 +-
 fs/dlm/requestqueue.c      |  17 ++-
 include/trace/events/dlm.h | 260 +++++++++++++++++++++++++++++++++++++
 17 files changed, 568 insertions(+), 66 deletions(-)
 create mode 100644 include/trace/events/dlm.h

-- 
2.27.0

