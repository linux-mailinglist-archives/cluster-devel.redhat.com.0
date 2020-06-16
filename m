Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCFF1FBC69
	for <lists+cluster-devel@lfdr.de>; Tue, 16 Jun 2020 19:07:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592327271;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GnYUuGpqhgu71/RvUDaL+DOUKnn18Jz6ok0wvO7C9Ts=;
	b=ff0gG178MRPoPJAC5XK1jTAqJusZOIoQCeoyJc+RdLqIng3mk2gCQFLp5OKeuCqUlPEzHW
	f56rAhiZK1hCszXvV3BnpBZpRiAOkH0a22/Lj+T5td4lFjOwn6c+45xvLIfn6hoK+G0MCk
	pjh1yvA2y/4P8KyxDzNSg2UZJcwJZRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-1ZVMpdhxOw2uH35w9g3aeg-1; Tue, 16 Jun 2020 13:07:48 -0400
X-MC-Unique: 1ZVMpdhxOw2uH35w9g3aeg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BB2910059DD;
	Tue, 16 Jun 2020 17:07:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 006415C1BD;
	Tue, 16 Jun 2020 17:07:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D9AD833C9;
	Tue, 16 Jun 2020 17:07:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GH7cSl010564 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 13:07:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BA2645D9D7; Tue, 16 Jun 2020 17:07:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-78.rdu2.redhat.com [10.10.114.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2C05B5D9D3;
	Tue, 16 Jun 2020 17:07:35 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: ccaulfie@redhat.com
Date: Tue, 16 Jun 2020 13:07:10 -0400
Message-Id: <20200616170713.32210-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm 0/3] dlm_controld: add support for mark
	per node configuration
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

- Alex

Alexander Aring (3):
  dlm_controld: add support for unsigned int values
  dlm_controld: set listen skb mark setting
  dlm_controld: add support for per nodeid configuration

 dlm_controld/Makefile      |  3 +-
 dlm_controld/action.c      | 33 +++++++++++++--
 dlm_controld/dlm.conf.5    | 21 +++++++++
 dlm_controld/dlm_daemon.h  | 10 ++++-
 dlm_controld/main.c        | 12 ++++++
 dlm_controld/member.c      |  6 ++-
 dlm_controld/node_config.c | 87 ++++++++++++++++++++++++++++++++++++++
 dlm_controld/node_config.h | 33 +++++++++++++++
 8 files changed, 199 insertions(+), 6 deletions(-)
 create mode 100644 dlm_controld/node_config.c
 create mode 100644 dlm_controld/node_config.h

-- 
2.26.2

