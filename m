Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0831C3B1D67
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Jun 2021 17:15:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624461339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mIcoyGYnqinW3r9audIsEkw435TKFzxlfXxTho70fGs=;
	b=Em+/kDl4ogt0yUsWl0Su/lYm1psjSL4Pka52Fewu1rm2m9Fsayzq03v1v7PKlyZ6Xodst8
	7NWU7KzIVK2BBIUADpHvpXPlww9oFNwX1VlVrJwscWrpXucK0cPKIlbXBBqR7qqQg/ae8m
	NwjGA3oXX3zSvNkF3H9wTX3SwyUwG30=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-SkWALve_Pw2VuIvJLr0-yg-1; Wed, 23 Jun 2021 11:15:37 -0400
X-MC-Unique: SkWALve_Pw2VuIvJLr0-yg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 410EE195D573;
	Wed, 23 Jun 2021 15:15:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAAA060871;
	Wed, 23 Jun 2021 15:15:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BAEA180101E;
	Wed, 23 Jun 2021 15:15:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15NFFDfI024719 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Jun 2021 11:15:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D01A61095; Wed, 23 Jun 2021 15:15:13 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (unknown [10.22.8.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0E38460E1C;
	Wed, 23 Jun 2021 15:15:06 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 23 Jun 2021 11:14:39 -0400
Message-Id: <20210623151454.176649-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC dlm/next 00/15] fs: dlm: performance
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

this patch series to some more generic handling for some protocols but
mainly it should improve the performance. Here is why:

Current state:
 - Two global ordered workqueues for sending and receiving
 - Each connection has a "sock" mutex
 - The receiving functionality also processes dlm messages

Problem with this behaviour:
 - Each workqueue can only handle one connection in an ordered queuing
   which ends that we can never handle a parallel receive/send or
   processing for "all connections" (not per connection).
 - The sock mutex will block other send/recv handling if the same
   connection is queued in both workqueues
 - The sock mutex is also hold in processing dlm messages to block sending
   dlm messages

New behaviour:
 - Having io_workqueue for send/recv and process workqueue which is not
   ordered globally (but will be ordered per connection)
 - Allow parallel receive and send per connection, mutexes for receive
   and send workers will take care that we have ordered queuing _per_
   connection (same for process work)
 - The process workqueue will process dlm messages ordered in the
   background of io (send/recv) handling. While processing receive
   can still fill the "processqueue" with new possible arrival messages.

Notes:

I would like to get rid of the process workqueue but I didn't find a way
that we can still ordered receive while doing a ordered processing. Also
I am not sure how the unordered workqueue really works, I hope that the
workqueue handling is so clever that it stops queuing workers when it sees
that one worker is blocked at a mutex. Remember that we have these workers
per connection, so if one blocks others are still allowed to execute which
should make some performance improvements that other connections can also
be served. The main thing is I think that we switch from an ordered
workqueue to an unordered workqueue which should parallel the serving of
each connection instead doing each one after one.

Maybe the process workqueue can be changed to a tasklet, but this
requires a lot of more changes in dlm (although ACK messages can be
handled in non-sleepable contextes).

WARNING:

First time ever we let DLM application layer process parallel dlm messages,
BUT processing is per node/connection in an ordered way (which is
required). I tested it and I did saw no problems and think that global/per
lockspace multiple access per nodeid is correct protected for mutual
access.

- Alex

Alexander Aring (15):
  fs: dlm: clear CF_APP_LIMITED on close
  fs: dlm: introduce con_next_wq helper
  fs: dlm: move to static proto ops
  fs: dlm: introduce generic listen
  fs: dlm: auto load sctp module
  fs: dlm: generic connect func
  fs: dlm: fix multiple empty writequeue alloc
  fs: dlm: move receive loop into receive handler
  fs: dlm: introduce io_workqueue
  fs: dlm: introduce reconnect work
  fs: dlm: introduce process workqueue
  fs: dlm: remove send starve
  fs: dlm: move writequeue init to sendcon only
  fs: dlm: flush listen con
  fs: dlm: move srcu into loop call

 fs/dlm/lowcomms.c | 1548 +++++++++++++++++++++++----------------------
 fs/dlm/midcomms.c |   38 +-
 fs/dlm/midcomms.h |    3 +-
 3 files changed, 837 insertions(+), 752 deletions(-)

-- 
2.26.3

