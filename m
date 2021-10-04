Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5C34218E5
	for <lists+cluster-devel@lfdr.de>; Mon,  4 Oct 2021 23:00:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633381253;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=85NNjYanHRJ86/WD5gp9Sj1raYQi1hy0j/0ow7X45zc=;
	b=b7GHos9nKmczrPtOFW044sbcN/5sN+lxM0HCHPMPUjflI/+OTDOc71m1j253BQ8paufMp0
	A6xuaNuO3g8xzanPNNSsAnjJiZx/rdCZp0rLx4dKP3edGmu/bFZfEUDnnQVO1r0kHlMUXX
	Xh9kHeeSEO/BhcPBgTYRjljwYFONz/I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-oGaZXqLfPImA8w_LLL0rLQ-1; Mon, 04 Oct 2021 17:00:52 -0400
X-MC-Unique: oGaZXqLfPImA8w_LLL0rLQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97EF384A5E1;
	Mon,  4 Oct 2021 21:00:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AD8C60C05;
	Mon,  4 Oct 2021 21:00:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E7C1C4EA2F;
	Mon,  4 Oct 2021 21:00:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 194Kwd9w017417 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 4 Oct 2021 16:58:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD0065DEFB; Mon,  4 Oct 2021 20:58:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8C7FD5E267;
	Mon,  4 Oct 2021 20:58:12 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  4 Oct 2021 16:58:03 -0400
Message-Id: <20211004205805.3938460-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC PATCH dlm/next 0/2] fs: dlm: remove reverse
	locking order
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

This patch series is another try to remove the ls_waiter_mutex and try to
make some locking behaviour in case of dlm_recover_waiters_pre().
Instead of earlier using the res_mutex to as a lock for some lkb fields,
this patch introduces a lkb lock, so it is less complex to keep track of
all locks which are needed to held.

- Alex

Alexander Aring (2):
  fs: dlm: provide some lockless functionality
  fs: dlm: change dlm logic locking behaviour

 fs/dlm/debug_fs.c     |   7 +-
 fs/dlm/dlm_internal.h |   5 +-
 fs/dlm/lock.c         | 256 ++++++++++++++++++++++++++----------------
 fs/dlm/lock.h         |  10 ++
 fs/dlm/lockspace.c    |   9 +-
 fs/dlm/recover.c      |   5 +
 6 files changed, 192 insertions(+), 100 deletions(-)

-- 
2.27.0

