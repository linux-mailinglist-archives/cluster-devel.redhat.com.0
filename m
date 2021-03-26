Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAFE34ADA2
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Mar 2021 18:34:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616780040;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NawIq/q/3Ftg9vg+M9DTJpSPY9l2oDox3ECk7GMw5Aw=;
	b=Wu0qdpAau+gzWeiOxZmVXatJybzip8p9/yHrpFoZ2P/CMI0+gM+YB+HyKD+Faw7yAG8pPG
	hoKSjRK7kyY+9KX50lgsLD9SsJivPrwL8aAzPblHSgHAspwAu+yXrHj9cviUIntvU9IQJu
	mBoBzAZrE4F9d44YQ5JjtvfCJOrVyok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-aZWh0-QMM4K0nHmOye6CUQ-1; Fri, 26 Mar 2021 13:33:58 -0400
X-MC-Unique: aZWh0-QMM4K0nHmOye6CUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0F241926DA0;
	Fri, 26 Mar 2021 17:33:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91A3E5C541;
	Fri, 26 Mar 2021 17:33:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16F724BB7C;
	Fri, 26 Mar 2021 17:33:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12QHXlsC009382 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Mar 2021 13:33:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 166001002EE6; Fri, 26 Mar 2021 17:33:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-90.rdu2.redhat.com [10.10.117.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B18A31000324;
	Fri, 26 Mar 2021 17:33:43 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 26 Mar 2021 13:33:29 -0400
Message-Id: <20210326173337.44231-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, pabeni@redhat.com, gnault@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm/next 0/8] fs: dlm: introduce dlm
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

Thanks to Paolo Abeni for his review and recommendations.

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
 fs/dlm/midcomms.c     | 1307 ++++++++++++++++++++++++++++++++++++++++-
 fs/dlm/midcomms.h     |   10 +
 fs/dlm/rcom.c         |   63 +-
 fs/dlm/util.c         |   10 +-
 fs/dlm/util.h         |    2 +
 12 files changed, 1577 insertions(+), 113 deletions(-)

-- 
2.26.3

