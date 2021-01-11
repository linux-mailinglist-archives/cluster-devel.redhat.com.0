Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE012F1D59
	for <lists+cluster-devel@lfdr.de>; Mon, 11 Jan 2021 19:03:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610388223;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EADC1src0dSb6iNqCnv+4rvwxPbvt+aHtVASXKPJmpM=;
	b=B8euy4y/SFUmLtidqP0mEadzYN4NtK3Dc0Q/CwfM0g4bU4555+LYvXkXYZLorXWNK/ZLeF
	sTmVHVnxo1f6/Dd9rAWw4zzbFOIYymhXfecZ/qZMaYLOaW5eJaJNEL7SOIlOKLJxt9ROAj
	jNsAIu5Lyuu96rRfurP6HBaezb0az2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-aXCi6P8oONygr9MsN8WqXg-1; Mon, 11 Jan 2021 13:03:41 -0500
X-MC-Unique: aXCi6P8oONygr9MsN8WqXg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FB2DCC626;
	Mon, 11 Jan 2021 18:03:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D2FA10016F7;
	Mon, 11 Jan 2021 18:03:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17DEE180954D;
	Mon, 11 Jan 2021 18:03:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10BI3SMt032196 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 11 Jan 2021 13:03:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 72A0E5D9DB; Mon, 11 Jan 2021 18:03:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-187.rdu2.redhat.com [10.10.116.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37D035D9F4;
	Mon, 11 Jan 2021 18:03:25 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 11 Jan 2021 13:02:50 -0500
Message-Id: <20210111180310.122451-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv4 dlm/next 00/20] fs: dlm: introduce dlm
	re-transmission layer
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
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

changes since v4:
 - add big midcomms file header comment about what's the idea about
   midcomms layer and how it works.
 - add the close mutex lock to prevent running close API call while
   connection is being terimanted. However when a close call occurs
   it will terminate the current termination wait until the close
   lock is released. If the node is removed from the nodes hash the
   lowcomms close call will occur anyway.
   
   I added a define to insert some sleep to test this behaviour.

changes since v3:
 - make dlm messages to 8 byte boundary size (more pads), because there
   exists uint64_t fields and we should prepared for future 8 byte fields.
   This will make it directly aligned to 4 and 2 as well.
 - change unaligned memory access handling. I will not fix it yet. It
   seems nobody is using dlm on an architecture which cannot handle
   unaligned memory access at all (panics). However I added a note that
   this is a known problem. There is a slightly performance improvement
   (depends on many things e.g. if another message gets allocated after a
   (len % 8) != 0 message length got allocated). However I saw that such
   cases are rarely (for now some user space messages only) occur.

   The receiving side is not the problem here, the sending side is it
   and we run in a unaligned memory access in dlm messages fields there
   as well. However, fixing sending side will fix the receiving side and
   more length checks can be applied then to drop invalid message
   lengths.
 - be sure to remove node from hash at first at close call

   I am a little bit worried about the midcomms/lowcomms close call and
   the timer is running at exactly this time and maybe begins to
   re-transmit messages. I thought about to stop/start the timer but now
   I ended up to remove the node from the hash at first and be sure that
   no readers are left when calling lowcomms close. I think this should
   be fine because we "should" not receive any dlm messages from this
   node while close is running.

 - add patch "fs: dlm: add per node receive flush"

   As I was worried about that the lowcomms close call flushes the receive
   work on a socket close and we already removed the node from the hash,
   I added a functionality to flush the receive work right before we remove
   the node. With this functionality we male sure we don't receive any
   messages after we removed the node from the hash.
 - add patch "fs: dlm: remove obsolete code and comment"
 - add patch "fs: dlm: check for invalid namelen"

changes since v2:
 - add patch "fs: dlm: set connected bit after accept"
 - add patch "fs: dlm: set subclass for othercon sock_mutex"
 - change title "fs: dlm: public utils header utils" to
   "fs: dlm: public header in out utility"
 - squash "fs: dlm: add check for minimum allocation length" into
   "fs: dlm: remove unaligned memory access handling"
 - make the midcomms timeout a little bit longer, because I saw
   sometimes it's not enough (I hope that was the reason)
 - midcomms: fix version mismatch handling
 - remove DLM_ACK in invalid sequence handling
 - add additional length check in dlm_opts_check_msglen()
 - use optlen to skip DLM_OPTS header
 - add DLM_MSGLEN_IS_NOT_ALIGNED to check if msglen is proper
   aligned before parsing
 - change dlm_midcomms_close() to close first then cut queues,
   because lowcomms close will may flush some messages which
   need to be dropped afterwards if seq doesn't fit.
 - remove newline in "fs: dlm: add more midcomms hooks"
 - may more changes which I don't have on track.
 - change defines handling for calculating max application buffer
   size vs max allocation size
 - run aspell on my commit msgs

Alexander Aring (20):
  fs: dlm: set connected bit after accept
  fs: dlm: set subclass for othercon sock_mutex
  fs: dlm: add errno handling to check callback
  fs: dlm: add check if dlm is currently running
  fs: dlm: change allocation limits
  fs: dlm: public header in out utility
  fs: dlm: use GFP_ZERO for page buffer
  fs: dlm: simplify writequeue handling
  fs: dlm: add more midcomms hooks
  fs: dlm: make buffer handling per msg
  fs: dlm: make new buffer handling softirq ready
  fs: dlm: add functionality to re-transmit a message
  fs: dlm: move out some hash functionality
  fs: dlm: remove unaligned memory access handling
  fs: dlm: add union in dlm header for lockspace id
  fs: dlm: add per node receive flush
  fs: dlm: add reliable connection if reconnect
  fs: dlm: don't allow half transmitted messages
  fs: dlm: remove obsolete code and comment
  fs: dlm: check for invalid namelen

 fs/dlm/config.c       |   60 +-
 fs/dlm/dlm_internal.h |   41 +-
 fs/dlm/lock.c         |   16 +-
 fs/dlm/lockspace.c    |    5 +-
 fs/dlm/lowcomms.c     |  288 +++++++---
 fs/dlm/lowcomms.h     |   27 +-
 fs/dlm/member.c       |   16 +
 fs/dlm/member.h       |    1 +
 fs/dlm/midcomms.c     | 1266 +++++++++++++++++++++++++++++++++++++++--
 fs/dlm/midcomms.h     |   10 +
 fs/dlm/rcom.c         |   61 +-
 fs/dlm/recoverd.c     |    3 +
 fs/dlm/user.c         |    3 +
 fs/dlm/util.c         |   10 +-
 fs/dlm/util.h         |    2 +
 15 files changed, 1628 insertions(+), 181 deletions(-)

-- 
2.26.2

