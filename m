Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 76CA632947F
	for <lists+cluster-devel@lfdr.de>; Mon,  1 Mar 2021 23:05:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614636343;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NM2xP6SlmlicVoKN8RXu5CXn6fhGaISTyvoNxX9pWKs=;
	b=YI51Hbf3QzAKs9zH2dTIlITu59apAPP5tpVJTt5f1x5d3/0ngvRT7gZ2kdgdZmFaaA1CLg
	tZFSnvp7Ks9vurC5ZsGqv6jDNuynBRqtIwyU/bW+pVcrb2oH3NkU5fkk5UsKrDAjl159EG
	cHBvxEDj9cofkK9reTrrkkGJ/9XE7QQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-RjaqzdlcPYGI5Rjt4OZCTg-1; Mon, 01 Mar 2021 17:05:40 -0500
X-MC-Unique: RjaqzdlcPYGI5Rjt4OZCTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CF4C86A063;
	Mon,  1 Mar 2021 22:05:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BEC66A03D;
	Mon,  1 Mar 2021 22:05:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4107E4EEF6;
	Mon,  1 Mar 2021 22:05:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 121M5SrY005880 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 1 Mar 2021 17:05:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C6087100239A; Mon,  1 Mar 2021 22:05:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-35.rdu2.redhat.com [10.10.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58C1C10013C1;
	Mon,  1 Mar 2021 22:05:25 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  1 Mar 2021 17:05:07 -0500
Message-Id: <20210301220520.514470-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 00/13] fs: dlm: lowcomms and
	midcomms changes
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

this patch series contains some of the patches of the previous patch series
to fix dlm message drops if reconnects occurs. These patches have
less to do something to introduce the reliable midcomms layer so I split
it off the patch series to have them at first upstream which makes the
new feature easier to review.

However I did some changes:

- fix "fs: dlm: remove unaligned memory access handling" to use the
  correct pointer.
- add WARN_ON(1) in "fs: dlm: change allocation limits" to see where an
  illegal allocation size was coming from.
- add patch "fs: dlm: check on dlm header size" from changes of
  "fs: dlm: remove unaligned memory access handling"

- Alex

changes since v3:

 - rebased on v5.12-rc1
 - add "fs: dlm: fix mark setting deadlock"
 - stop scand thread before calling shutdown hook
 - fix calling shutdown hook in error case of
   new lockspace allocation

changes since v2:
 - fix length check in dlm processing loop
 - add "fs: dlm: fix debugfs dump" patch
 - add "fs: dlm: flush swork on shutdown" patch
 - add "fs: dlm: add shutdown hook"

About the shutdown hook:

The lowcomms layer will synchronize workqueue at "stop" hook and we
already released the lockspace. I introduce the shutdown callback
to synchronize the workqueue/tcp before releasing the lockspace
but after stopping the recoverd thread. I hope at this point we
don't transmit anymore (calling dlm_lowcomms_commit_buffer()) from
dlm application layer and we are still capable to deliver dlm messages
from lowcomms to application. However the current code definitely has
some issues there which I expirence with tcpkill and reliable
connection patches. I need to recheck if DLM_FIN is really necessary.

Alexander Aring (13):
  fs: dlm: fix debugfs dump
  fs: dlm: fix mark setting deadlock
  fs: dlm: set connected bit after accept
  fs: dlm: set subclass for othercon sock_mutex
  fs: dlm: add errno handling to check callback
  fs: dlm: add check if dlm is currently running
  fs: dlm: change allocation limits
  fs: dlm: use GFP_ZERO for page buffer
  fs: dlm: simplify writequeue handling
  fs: dlm: check on minimum msglen size
  fs: dlm: remove unaligned memory access handling
  fs: dlm: flush swork on shutdown
  fs: dlm: add shutdown hook

 fs/dlm/config.c    |  86 +++++++++++++-------
 fs/dlm/config.h    |   1 -
 fs/dlm/debug_fs.c  |   1 +
 fs/dlm/lock.c      |   2 -
 fs/dlm/lockspace.c |  20 ++---
 fs/dlm/lowcomms.c  | 193 ++++++++++++++++++++++++++-------------------
 fs/dlm/lowcomms.h  |   5 ++
 fs/dlm/midcomms.c  |  33 ++++----
 fs/dlm/rcom.c      |   2 -
 9 files changed, 201 insertions(+), 142 deletions(-)

-- 
2.26.2

