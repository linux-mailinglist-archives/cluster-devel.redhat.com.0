Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 79B333F34CF
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 21:51:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629489090;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9/B98VPnRDuF4WgzDU4sXWG9PxjwybymJcYPB+7IFM0=;
	b=UftFh+ryvglN7GSdKu+PLlh4gxcnKn2SifMApR4j7Jwyfr+po+GI1gV929mBH+Yw971wvy
	axawR1cBp6pqQTgro02ciePZmcD8bXinc4RPw5+3z4KjuvRseizH/YQcPt3+WDPvS0IW2O
	fz2sZTyqTvBu8akvl2iI+SHMLrcsJlY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-sjKmjXhJMJ2dQUssttcv7A-1; Fri, 20 Aug 2021 15:51:29 -0400
X-MC-Unique: sjKmjXhJMJ2dQUssttcv7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86373190D342;
	Fri, 20 Aug 2021 19:51:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5455D60938;
	Fri, 20 Aug 2021 19:51:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A715181A0F7;
	Fri, 20 Aug 2021 19:51:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KJpO96017798 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 15:51:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4A4621893C; Fri, 20 Aug 2021 19:51:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 51A741346F;
	Fri, 20 Aug 2021 19:51:20 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 20 Aug 2021 15:51:12 -0400
Message-Id: <20210820195115.1370171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 0/3] fs: dlm: debug and tracepoints
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

again a resend of the tracepoints patches and fixed that the lkb
reference is hold during tracepoint call. We need to do that because we
access the structure during tracing. There is some code duplication to
convert the return error for dlm_lock_end trace now. I didn't wanted to
change the existing code and introduce more overhead if tracing is not
enabled.

- Alex

Alexander Aring (3):
  fs: dlm: debug improvements print nodeid
  fs: dlm: initial support for tracepoints
  fs: dlm: trace socket handling

 fs/dlm/ast.c               |   4 +
 fs/dlm/lock.c              |  10 ++
 fs/dlm/lowcomms.c          |   4 +
 fs/dlm/main.c              |   3 +
 fs/dlm/midcomms.c          |   4 +-
 include/trace/events/dlm.h | 260 +++++++++++++++++++++++++++++++++++++
 6 files changed, 283 insertions(+), 2 deletions(-)
 create mode 100644 include/trace/events/dlm.h

-- 
2.27.0

