Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 72CF226FFCA
	for <lists+cluster-devel@lfdr.de>; Fri, 18 Sep 2020 16:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600439279;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3RH1YNvwNqI0lpSy43U6+1v18FJe7R3YKGF3/wGPSgc=;
	b=XXUqAazVxM2Ijzyq//Wjb5RWZgBbPcWTKk6QOYMztcSWxmVZBhN9qyR9bdgs9NuTQkmpge
	m4hQM2O0q9HmTA8LiNJWv67SSq/9NB3XJiEnl9t3XkDn7pA67uXiU1ChjMZFRbR2GasWRD
	wMO5piWVJTBtZfTknwvQPgt/cJe8DJ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-bgFXJUz9N9WLpGxU2UAP1g-1; Fri, 18 Sep 2020 10:27:57 -0400
X-MC-Unique: bgFXJUz9N9WLpGxU2UAP1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C21081882FBB;
	Fri, 18 Sep 2020 14:27:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B13815C225;
	Fri, 18 Sep 2020 14:27:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 798A5183D044;
	Fri, 18 Sep 2020 14:27:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08IERjtC002394 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 18 Sep 2020 10:27:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95B6755764; Fri, 18 Sep 2020 14:27:45 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-112-228.rdu2.redhat.com [10.10.112.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 223B755762;
	Fri, 18 Sep 2020 14:27:42 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Fri, 18 Sep 2020 10:27:22 -0400
Message-Id: <20200918142728.147392-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 0/6] fs: dlm: rework receive and
	transmit handling
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi,

This patch series contains a huge change regarding to the
receive/transmit handling of dlm. As I placed sequence numbering on dlm
messages I expierenced that dlm messages can be transmitted in an
incorrect order. I changed the transmit handling that the writequeue
handles entries per dlm message buffer and sendmsg() will use
scatter/gather to transmit a bunch of them. At the receive handling I
removed some allocations and copies into different buffers. There is
only one receive buffer now which fill be get filled and the upper layer
will working on that buffer as well.

- Alex

Alexander Aring (6):
  fs: dlm: remove lock dependency warning
  fs: dlm: handle range check as callback
  fs: dlm: disallow buffer size below default
  fs: dlm: release connection with call_rcu
  fs: dlm: rework receive handling
  fs: dlm: rework transmit handling

 fs/dlm/config.c   |  47 +++--
 fs/dlm/config.h   |   2 +
 fs/dlm/lowcomms.c | 471 ++++++++++++++++++++++------------------------
 fs/dlm/midcomms.c | 136 ++++++-------
 fs/dlm/midcomms.h |   3 +-
 5 files changed, 310 insertions(+), 349 deletions(-)

-- 
2.26.2

