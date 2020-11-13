Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE6A2B28E2
	for <lists+cluster-devel@lfdr.de>; Fri, 13 Nov 2020 23:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605308326;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zQCNE/p2LWA1ZVQh6cMOvsZozCMGX7n1cliTSbDsugc=;
	b=VPtLOVLTwYkMtdFUrrpD1nkxjkFGaGS8kF23/PrM0D7StyI82g/IzuAJtK7YXItM+Cdhni
	eYEpOa6R1D9toGKfxHt9z4vkK53Die7ukULeQez4zvJV5a9Y6YuSOcTvqWnYfLDxzgujKE
	DxokEUDp6+yaAs/gjJdr815OZxlsiFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-I5sO3rKmOaeJPvKiM6Skag-1; Fri, 13 Nov 2020 17:58:44 -0500
X-MC-Unique: I5sO3rKmOaeJPvKiM6Skag-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3ABE186841C;
	Fri, 13 Nov 2020 22:58:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A333C5D9F1;
	Fri, 13 Nov 2020 22:58:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B9437181A06B;
	Fri, 13 Nov 2020 22:58:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ADMwSbM003918 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 13 Nov 2020 17:58:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EDFC35C716; Fri, 13 Nov 2020 22:58:28 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-120.rdu2.redhat.com [10.10.117.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8A4C35C225;
	Fri, 13 Nov 2020 22:58:25 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 13 Nov 2020 17:57:58 -0500
Message-Id: <20201113225814.461167-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC PATCH dlm/next 00/16] fs: dlm: introduce dlm
	retransmission layer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

this is the final patch-series to make dlm reliable when reconnection
occurs. You can easily generate a couple of reconnections by running:

tcpkill -9 -i $IFACE port 21064

on your own to test these patches. At some time dlm will detect message
drops and will retransmit messages if necessary. It introduces a new dlm
protocol behaviour and increases the dlm protocol version. I tested it
with SCTP as well and tried to be backwardscompatible with dlm protocol
version 3.1. However I don't recommend at all to not mix these versions
in a setup since dlm version 3.2 fixes long-term issues.

- Alex

Alexander Aring (16):
  fs: dlm: add errno handling to check callback
  fs: dlm: add check if dlm is currently running
  fs: dlm: add check for minimum allocation length
  fs: dlm: public utils header utils
  fs: dlm: use GFP_ZERO for page buffer
  fs: dlm: simplify writequeue handling
  fs: dlm: add more midcomms hooks
  fs: dlm: make buffer handling per msg
  fs: dlm: make new buffer handling softirq ready
  fs: dlm: add functionality to retransmit a message
  fs: dlm: move out some hash functionality
  fs: dlm: remove unaligned memory access handling
  fs: dlm: check on minimum header size
  fs: dlm: add union in dlm header for lockspace id
  fs: dlm: add reliable connection if reconnect
  fs: dlm: don't allow half transmitted messages

 fs/dlm/config.c       |   60 ++-
 fs/dlm/dlm_internal.h |   32 +-
 fs/dlm/lock.c         |   16 +-
 fs/dlm/lockspace.c    |    5 +-
 fs/dlm/lowcomms.c     |  273 +++++++---
 fs/dlm/lowcomms.h     |   25 +-
 fs/dlm/member.c       |   16 +
 fs/dlm/member.h       |    1 +
 fs/dlm/midcomms.c     | 1094 +++++++++++++++++++++++++++++++++++++++--
 fs/dlm/midcomms.h     |   10 +
 fs/dlm/rcom.c         |   61 ++-
 fs/dlm/recoverd.c     |    4 +
 fs/dlm/util.c         |   10 +-
 fs/dlm/util.h         |    2 +
 14 files changed, 1438 insertions(+), 171 deletions(-)

-- 
2.26.2

