Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 22CAF2CA694
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Dec 2020 16:10:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606835432;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qGCDgbpuv9hxylVIBT+KJa+rJMAdra9GRybOul+L/14=;
	b=OjupT/xVwvRPkKSl1d5O+ql0iw/rI1hHZ+bBJFw7+7O81OKokzawDZ4WkKrpH0Hj1lHrYm
	t539PgDZfVWzn2VUqqRlBeNVvhAvIn2rEoB23OB1uyzvjU564xmA8TbbqjGU2/0PJy5ULh
	CglTCpcf3FkCajJJ32K+9SuAX+O9aRg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-K_QmGdiZOZaBvVpoGUqawA-1; Tue, 01 Dec 2020 10:10:30 -0500
X-MC-Unique: K_QmGdiZOZaBvVpoGUqawA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69ACF185E48E;
	Tue,  1 Dec 2020 15:10:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D10AD10013C1;
	Tue,  1 Dec 2020 15:10:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 593801809CA0;
	Tue,  1 Dec 2020 15:10:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B1FAIYS019571 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 1 Dec 2020 10:10:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 601235D705; Tue,  1 Dec 2020 15:10:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-202.rdu2.redhat.com [10.10.114.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDAAC5D6AB;
	Tue,  1 Dec 2020 15:10:14 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue,  1 Dec 2020 10:09:40 -0500
Message-Id: <20201201150957.115068-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 00/17] fs: dlm: introduce dlm
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
version 3.1. However I don't recommend at all to not mix these versions
in a setup since dlm version 3.2 fixes long-term issues.

- Alex

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

Alexander Aring (17):
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
  fs: dlm: add reliable connection if reconnect
  fs: dlm: don't allow half transmitted messages

 fs/dlm/config.c       |   60 ++-
 fs/dlm/dlm_internal.h |   32 +-
 fs/dlm/lock.c         |   16 +-
 fs/dlm/lockspace.c    |    5 +-
 fs/dlm/lowcomms.c     |  279 ++++++++---
 fs/dlm/lowcomms.h     |   26 +-
 fs/dlm/member.c       |   16 +
 fs/dlm/member.h       |    1 +
 fs/dlm/midcomms.c     | 1098 +++++++++++++++++++++++++++++++++++++++--
 fs/dlm/midcomms.h     |   10 +
 fs/dlm/rcom.c         |   61 ++-
 fs/dlm/recoverd.c     |    3 +
 fs/dlm/util.c         |   10 +-
 fs/dlm/util.h         |    2 +
 14 files changed, 1445 insertions(+), 174 deletions(-)

-- 
2.26.2

