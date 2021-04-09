Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2D035A173
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Apr 2021 16:49:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617979758;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tTdSnUjjfOlmnO8hpr26/uAyqi81BFjLM+ponHFQJEw=;
	b=XxL5PtPZJDozLUhKoFCIjElci9052Sw/BHeymX67JKkuiNPA7e021kJXHzADzfbXuULrmz
	vemnrPm6mqpoUz9+w/HjGRL1H7jqa0pzLcTiau5WAdD/gLaBz2MJ59u5yt4lahmG/d6JKw
	p5ojff9caw2KKLxQza0RufqvdzzrZ8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-m1Skl_UrN1ec1X5HBs0K6Q-1; Fri, 09 Apr 2021 10:49:16 -0400
X-MC-Unique: m1Skl_UrN1ec1X5HBs0K6Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E4A11006C82;
	Fri,  9 Apr 2021 14:49:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1277B5D9C0;
	Fri,  9 Apr 2021 14:49:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B5141806D10;
	Fri,  9 Apr 2021 14:49:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139En8d2022683 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 10:49:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A53F46A97E; Fri,  9 Apr 2021 14:49:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9BDB46B8DD;
	Fri,  9 Apr 2021 14:49:04 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri,  9 Apr 2021 10:48:51 -0400
Message-Id: <20210409144859.48385-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com, gnault@redhat.com
Subject: [Cluster-devel] [PATCHv4 dlm/next 0/8] fs: dlm: introduce dlm
	re-transmission layer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

this is the final patch-series to make dlm reliable when re-connection
occurs. You can easily generate a couple of re-connections by running:

tcpkill -9 -i $IFACE port 21064

on your own to test these patches. At some time dlm will detect message
drops and will re-transmit messages if necessary. It introduces a new dlm
protocol behaviour and increases the dlm protocol version. I tested it
with SCTP as well and tried to be backwards compatible with dlm protocol
version 3.1. However I don't recommend at all to mix these versions
in a setup since dlm version 3.2 fixes long-term issues.

- Alex

changes since v4:
 - remove fast retransmit and the timer, introduce logic to retransmit
   all unacknowledged message when doing reconnect. The receiver side
   will deliver the next fit sequence number then.

   There might be still problems with that we don't trigger a
   reconnection again if we don't transmit anything (but still have
   something unacknowledged in midcomms). This is still an issue in
   lowcomms implementation which I want to fix in due courses.
 - Change comments/commit msg how it works regarding to the new
   behaviour.
 - Let the send_queue now have messages in order according to the seq
   this is necessary for the new behaviour that the receiver side can
   resolve drops by receiving unacknowledged messages in their order of
   delivery. If sequence .e.g. 1 3 2 is received then the receiver will
   not be able to resolve the drop because 3 will be dropped and not
   retransmitted again.
 - change the dlm fin waiting mechanism to split the wait into fin ack
   received and fin message received. Also change the timeout handling
   a little bit there.
 - add a missing flush send_queue in midcomms_close
 - update patch 04 to not be irqsafe anymore
 - fix use-after-free for dlm version 3.1 and recent nodes_srcu changes

I thought about to update patch 08 to drop all pending messages inside
the write queue, because we retransmit all unacknowledged messages
at reconnect anyway. However that makes a very bad behaviour on
reconnects with DLM version 3.1 so I only drop half-transmitted page
buffers to don't start the bytestream inside the middle of an DLM
message which is terrible as well. It might send more duplicate messages
at reconnect, but the receive should solve these duplicates.

I still have some problems with synchronization of membership with
DLM_FIN. However I think my testcase is overkill and I have zero
problems with any synchronization when not running tcpkill. It gets
a lot of more worse when I don't have any synchronization and the
"midcomms membership" and sequence numbers are out of sync with the
"cluster manager membership". I think such synchronization need to be
there but there might be more additional handling. (I hope non protocol
changes needed).

changes since v3:
 - add comment about why queues are unbound
 - move rcu usage to version receive handler

changes since v2:
 - make timer handling pending only if messages are on air, the sync
   isn't quite correct there but doesn't need to be precise
 - use before() from tcp to check if seq is before other seq with
   respect of overflows
 - change srcu handling to hold srcu in all places where nodes are
   referencing - we should not get a disadvantage of holding that
   lock. We should update also lowcomms regarding to that.
 - add some WARN_ON() to check that nothing in send/recv is going
   anymore otherwise it's likely an issue.
 - add more future work regarding to fencing of nodes if over
   cluster manager timeout/bad seq happens
 - add note about missing length size check of tail payload
   (resource name length) regarding to the receive buffer
 - remove some include which isn't necessary in recoverd.c

Thanks to Paolo Abeni and Guillaume Nault for their reviews and
recommendations.

Alexander Aring (8):
  fs: dlm: public header in out utility
  fs: dlm: add more midcomms hooks
  fs: dlm: make buffer handling per msg
  fs: dlm: add functionality to re-transmit a message
  fs: dlm: move out some hash functionality
  fs: dlm: add union in dlm header for lockspace id
  fs: dlm: add reliable connection if reconnect
  fs: dlm: don't allow half transmitted messages

 fs/dlm/config.c       |    3 +-
 fs/dlm/dlm_internal.h |   35 +-
 fs/dlm/lock.c         |   14 +-
 fs/dlm/lockspace.c    |   14 +-
 fs/dlm/lowcomms.c     |  173 ++++++-
 fs/dlm/lowcomms.h     |   23 +-
 fs/dlm/member.c       |   12 +-
 fs/dlm/midcomms.c     | 1101 +++++++++++++++++++++++++++++++++++++++--
 fs/dlm/midcomms.h     |   11 +
 fs/dlm/rcom.c         |   63 ++-
 fs/dlm/util.c         |   10 +-
 fs/dlm/util.h         |    2 +
 12 files changed, 1361 insertions(+), 100 deletions(-)

-- 
2.26.3

