Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB563347C9
	for <lists+cluster-devel@lfdr.de>; Wed, 10 Mar 2021 20:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615403892;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JrZNk0lpCudZIlQX9IUhsKgGhZdGTXpNeqBU7CpQT6s=;
	b=UXz9T9PTmu5b9RhUyrLlN78x0PxmQgP586lweRbXYWcGDPsXunVRo2DVCqPG9kSQp8dtOr
	uFYiY9y7qCFCsb0NZQWaw0+7E6zbLGBZLeu/mFliWOp1JsaKXrVuIUD80eBPPb1hM4T/k/
	Nt3iitF0twudB+iDINuRcHr+kbn9Evw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-nirJDj8xMEWh-tC6gyR8cw-1; Wed, 10 Mar 2021 14:18:06 -0500
X-MC-Unique: nirJDj8xMEWh-tC6gyR8cw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E77E19057C1;
	Wed, 10 Mar 2021 19:18:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBD8E690F9;
	Wed, 10 Mar 2021 19:18:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 827E41809C8C;
	Wed, 10 Mar 2021 19:18:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12AJHt2v004741 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 10 Mar 2021 14:17:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C494F1037EB5; Wed, 10 Mar 2021 19:17:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-190.rdu2.redhat.com [10.10.114.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FA691002F12;
	Wed, 10 Mar 2021 19:17:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 10 Mar 2021 14:17:37 -0500
Message-Id: <20210310191745.80824-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com, gnault@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 0/8] fs: dlm: introduce dlm
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

Thanks to Paolo Abeni for his review and recommendations.

changes since patch series split:
 - fixup "fs: dlm: make new buffer handling softirq ready" into
   "fs: dlm: add functionality to re-transmit a message"
 - change hooks to work with shutdown hook
 - use DEFAULT_BUFFER_SIZE for max send/recv buffer, because
   backwards compatiblility with dlm 3.1
 - remove "fs: dlm: add per node receive flush", I think we don't
   run into issues.
 - change comments regarding why DLM_FIN is needed.
 - move midcomms_remove_member hook in dlm protocol when removing
   ls->nodes_gone list, so far I can see it's the last point
   that the lockspace has this node as a member in some datastructures.
 - make deep free of recv/send queue when midcomms_node is freed
 - add DLM_NODE_FLAG_STOP_TX flag for midcomms node to warn
   if a node tries to send at point where dlm application should
   not starting transmissions anymore. It indicates a bug.
 - change some retransmit/timeout timings, I think we need somehow to
   figure out by waiting e.g. user reports if we getting problems with
   them.

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
 fs/dlm/lowcomms.c     |  197 +++++--
 fs/dlm/lowcomms.h     |   23 +-
 fs/dlm/member.c       |   12 +-
 fs/dlm/midcomms.c     | 1296 ++++++++++++++++++++++++++++++++++++++++-
 fs/dlm/midcomms.h     |   10 +
 fs/dlm/rcom.c         |   63 +-
 fs/dlm/util.c         |   10 +-
 fs/dlm/util.h         |    2 +
 12 files changed, 1566 insertions(+), 113 deletions(-)

-- 
2.26.2

