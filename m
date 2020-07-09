Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D030921A5B5
	for <lists+cluster-devel@lfdr.de>; Thu,  9 Jul 2020 19:22:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594315347;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=trteiTEXqCqZE+Y2a6EgjALMXKVcIVfoRoZAVmo2YE0=;
	b=LIzQesI517/VpMIcFIFaw5WUGWDvCtvIS69RovyuFeTwXdiM1DtNQS7gwTS9j8c+etohFS
	e+eBpXjFO9c5GJJLweeIL5XEBiW7ur2aP+grCWqUxWvLFlo3OsVPsovSOWTJIeXG3qXOTF
	FV9R9NxDFEFA0XTu4lfpNicEdzPJ/dE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-9S2NHUu8PvyjxXz1uzvwJg-1; Thu, 09 Jul 2020 13:22:26 -0400
X-MC-Unique: 9S2NHUu8PvyjxXz1uzvwJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD2BD18FF660;
	Thu,  9 Jul 2020 17:22:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CC4B10013C2;
	Thu,  9 Jul 2020 17:22:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E3A71809561;
	Thu,  9 Jul 2020 17:22:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069HLx0D016170 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 13:21:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F9D160E1C; Thu,  9 Jul 2020 17:21:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-75.rdu2.redhat.com [10.10.114.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60CFB6106A;
	Thu,  9 Jul 2020 17:21:54 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu,  9 Jul 2020 13:21:46 -0400
Message-Id: <20200709172150.53643-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv3 dlm-tool 0/4] dlm_controld: support for
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
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

changes since v3:
 - add support for unsigned int default values
 - changed default value of boolean arg enable_waitplock_recover from 1
   to 0. dlm_controld was not using the default value anyway, because
   there exists a check to ignore default values and only set it when
   it's set. I changed it anyway to be consistent.
 - Let mark per node config don't abort the whole node configuration
   if open fails (e.g. older kernel) instead we skip now to try to set
   the mark value. It will show up in the log that open fails.

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
 dlm_controld/action.c      | 43 ++++++++++++++++++--
 dlm_controld/config.c      | 25 ++++++++++++
 dlm_controld/dlm.conf.5    | 23 +++++++++++
 dlm_controld/dlm_daemon.h  | 13 +++++-
 dlm_controld/main.c        | 74 ++++++++++++++++++++++------------
 dlm_controld/member.c      |  6 ++-
 dlm_controld/node_config.c | 82 ++++++++++++++++++++++++++++++++++++++
 dlm_controld/node_config.h | 31 ++++++++++++++
 9 files changed, 268 insertions(+), 32 deletions(-)
 create mode 100644 dlm_controld/node_config.c
 create mode 100644 dlm_controld/node_config.h

-- 
2.26.2

