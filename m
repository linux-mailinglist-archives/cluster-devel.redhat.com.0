Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9B00D38149D
	for <lists+cluster-devel@lfdr.de>; Sat, 15 May 2021 02:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621038975;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cwx2DAOWPyphu86NUlksNMw6KJZgepsmPhs7tyxGrfM=;
	b=jTRIffdVOTNvtcWkPWEdb1AtbaPkLZ2m4oHcryRJnFyEQTKP6qAP0mdKEm5iiX8sim2RGv
	7qRK0BGmvDAQ56SYZx4Sx2TKaAkpkSC4RxXvLzLL/zQOA68oiRgE+QVCjgrZV/VSL+9j0M
	vEGJDQcAhIxds7P1K+/1aU8Gm80m8kM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-gckXDmp7MJW66rH-eIBEbQ-1; Fri, 14 May 2021 20:36:14 -0400
X-MC-Unique: gckXDmp7MJW66rH-eIBEbQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D79378015DB;
	Sat, 15 May 2021 00:36:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2FF610016FC;
	Sat, 15 May 2021 00:36:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E258D1801029;
	Sat, 15 May 2021 00:36:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14F0a1ep030815 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 20:36:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B93965D9E3; Sat, 15 May 2021 00:36:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-135.rdu2.redhat.com [10.10.115.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53C505D9CD;
	Sat, 15 May 2021 00:35:59 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 14 May 2021 20:35:34 -0400
Message-Id: <20210515003549.1118171-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, gnault@redhat.com, pabeni@redhat.com
Subject: [Cluster-devel] [PATCHv5 v5.13-rc1 dlm/next 00/15] fs: dlm:
	introduce dlm re-transmission layer
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

changes since v5:
 - huge change about how we handle the FIN handling, it does not now
   block at cluster membership removal. I think I got more information
   regarding to this issue. It's about ls->ls_nodes attribute and the
   function dlm_is_member(ls). So far the member is still in this list
   the DLM subsystem will send msgs to it. In a passive shutdown case
   we need to wait until this happens and close the connection after
   such event otherwise it could happen something like (note printout
   doesn't match to recent implementation):

[ 3341.497741] receive fin from passive shutdown from node 3, send_queue_cnt 0, flags 4
[ 3341.498667] send fin from passive shutdown case 1 to node 3
[ 3341.503333] ------------[ cut here ]------------
[ 3341.503971] WARNING: CPU: 1 PID: 455 at fs/dlm/midcomms.c:878 dlm_midcomms_get_mhandle+0x24b/0x260
...
[ 3341.523797] Call Trace:
[ 3341.524110]  _request_lock+0x305/0x500
[ 3341.524509]  ? do_request+0xc0/0xc0
[ 3341.524922]  ? create_lkb+0x1fa/0x2b0
[ 3341.525319]  ? lock_downgrade+0x3d0/0x3d0
[ 3341.525679]  request_lock.part.0+0x137/0x190
...
[ 3341.537588]  gfs2_atomic_open+0x59/0x110

   DLM will send requests message, so there is only one question that
   we cannot receive anything anymore but the requestqueue will handle
   this and change the handling of the messages in such cases so far I
   understood? In the above warning the fin message was sent before
   membership removal of ls->ls_nodes. This patch will take care that
   there are two cases for a send_fin event either if we receive fin
   and removal was already happened or delay the send_fin event when
   the removal happens (half-closed socket case) to still send out
   messages to the other peer. I think there is now a more higher risk
   to fail, because we wait for the cluster manager event of membership
   removal but it should happened.

   Otherwise a lot of new state functionality copied from RFC 793 was
   added for the termination case. See midcomms comment for a nice
   state diagramm.

   Good news is, I don't have any issues anymore with FIN handling and
   think this is the right approach.

 - add debugfs
 - add resend state
 - fix that we was resend messages which wasn't committed
 - add fix srcu patch
 - add flush lowcomms workqueue
 - add fix of tcp half-socket closing with workqueue handling
 - ratelimit some print messages
 - use dlm_mhandle and dlm_msg instead of void * as recommended
   by Guillaume
 - remove #if 0 #endif handling to parse possible options
 - add reconnect on error report patch, there is still a weird handling
   with the othercon paradigm but I cannot remove it without breaking
   backwards compatiblility.

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

Alexander Aring (15):
  fs: dlm: add dlm macros for ratelimit log
  fs: dlm: fix srcu read lock usage
  fs: dlm: set is othercon flag
  fs: dlm: reconnect if socket error report occurs
  fs: dlm: fix connection tcp EOF handling
  fs: dlm: public header in out utility
  fs: dlm: add more midcomms hooks
  fs: dlm: make buffer handling per msg
  fs: dlm: add functionality to re-transmit a message
  fs: dlm: move out some hash functionality
  fs: dlm: add union in dlm header for lockspace id
  fs: dlm: add force flush of writequeue function
  fs: dlm: add reliable connection if reconnect
  fs: dlm: add midcomms debugfs functionality
  fs: dlm: don't allow half transmitted messages

 fs/dlm/config.c       |    3 +-
 fs/dlm/debug_fs.c     |   54 ++
 fs/dlm/dlm_internal.h |   42 +-
 fs/dlm/lock.c         |   16 +-
 fs/dlm/lockspace.c    |   14 +-
 fs/dlm/lowcomms.c     |  381 ++++++++++--
 fs/dlm/lowcomms.h     |   26 +-
 fs/dlm/member.c       |    3 +
 fs/dlm/midcomms.c     | 1340 ++++++++++++++++++++++++++++++++++++++++-
 fs/dlm/midcomms.h     |   15 +
 fs/dlm/rcom.c         |  113 ++--
 fs/dlm/util.c         |   10 +-
 fs/dlm/util.h         |    2 +
 13 files changed, 1867 insertions(+), 152 deletions(-)

-- 
2.26.3

