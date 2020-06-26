Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B8BFF20B61A
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Jun 2020 18:45:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593189927;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rd4Hf4cnaKkxM3vSYDu5vVNwTtS6NkIBAtEvpWoZzLw=;
	b=W2QyFAgpBmzBTTJ6r4zk2vXNA/i31eFIckZmBOWOcyvHh5XyJigljwrr4xGFzMXWwr0FWM
	nikiuCbCZaCUwJxHPNKoL519NwzB/HsSEcAx/jOdiJtnREIuQzvxuAcDvbNZEVXgyC0NvY
	jyHNK9i6xNJzo0CdDeOxfaP54vMMoWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-EoHk_2C9PUq01s-REmiluw-1; Fri, 26 Jun 2020 12:45:26 -0400
X-MC-Unique: EoHk_2C9PUq01s-REmiluw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9B928015F8;
	Fri, 26 Jun 2020 16:45:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 006008247E;
	Fri, 26 Jun 2020 16:45:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB87518095FF;
	Fri, 26 Jun 2020 16:45:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QGjEvU014811 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 12:45:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 49E646106A; Fri, 26 Jun 2020 16:45:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-78.rdu2.redhat.com [10.10.115.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C779060C80;
	Fri, 26 Jun 2020 16:45:10 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 26 Jun 2020 12:44:42 -0400
Message-Id: <20200626164446.114220-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm-tool 0/4] dlm_controld: support for
	mark and waitplock_recovery
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi,

this patch series adds support for set the in-kernel socket skb mark
value over dlm_controld. There exists two kinds of socket, one listen
socket and multiple peer sockets. Both can be set via the dlm config
file via "listen_mark" or multiple entries of:

node id=$NODEID mark=$MARK

whereas $NODEID is the corosync assigned nodeid. The given mark number
can be hexadecimal or decimal.

Also it adds support to set the waitplock_recovery per cluster attribute
by setting enable_waitplock_recover over file or argument configuration.

- Alex

changes since v2:
 - remove leftover PRIu32 in nodeid configuration
 - make unsigned int values also work with file configuration, was arg
   only before
 - add support to set the waitplock_recovery switch via dlm_controld
 - remove free function of node_config, may be necessary when implement
   some kind of NOHUP and reparse config file

Alexander Aring (4):
  dlm_controld: add support for unsigned int values
  dlm_controld: set listen skb mark setting
  dlm_controld: add support for per nodeid configuration
  dlm_controld: add support for waitplock_recovery switch

 dlm_controld/Makefile      |  3 +-
 dlm_controld/action.c      | 38 ++++++++++++++++--
 dlm_controld/config.c      | 25 ++++++++++++
 dlm_controld/dlm.conf.5    | 23 +++++++++++
 dlm_controld/dlm_daemon.h  | 12 +++++-
 dlm_controld/main.c        | 17 ++++++++
 dlm_controld/member.c      |  6 ++-
 dlm_controld/node_config.c | 82 ++++++++++++++++++++++++++++++++++++++
 dlm_controld/node_config.h | 31 ++++++++++++++
 9 files changed, 231 insertions(+), 6 deletions(-)
 create mode 100644 dlm_controld/node_config.c
 create mode 100644 dlm_controld/node_config.h

-- 
2.26.2

