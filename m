Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D7FC9254DED
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Aug 2020 21:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598555047;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KXO2FxkLeST0FMUbFFv/TO4aCf1Jr9NnUzicn8lp8oE=;
	b=AEjC04jfXcxFCcq7nXN6dmPGHTo8tD3jzR7gZ4RIcYyOVvuna9WRt1lzw2a4NqG3mTERh6
	4sg8eSeASRWl3fyMA/GpwIjcVq5GUlVEinHkXzh6+Sgwp8254mhj3yQmuU/2h7SLCNygHl
	pu5ueeUo+En1da822c2E+KSCOhBf0Z0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-U7f1y47MNlmqkG0iwrw-oQ-1; Thu, 27 Aug 2020 15:04:05 -0400
X-MC-Unique: U7f1y47MNlmqkG0iwrw-oQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49D7A802B6D;
	Thu, 27 Aug 2020 19:04:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07C1E78390;
	Thu, 27 Aug 2020 19:04:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F94C85CD;
	Thu, 27 Aug 2020 19:04:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07RJ3vnn018111 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 27 Aug 2020 15:03:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 833C819D7D; Thu, 27 Aug 2020 19:03:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-193.rdu2.redhat.com [10.10.114.193])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30ACB19C71;
	Thu, 27 Aug 2020 19:03:53 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 27 Aug 2020 15:02:47 -0400
Message-Id: <20200827190254.719333-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 0/7] fs: dlm: locking and memory
	fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi,

this patch series contains some locking and memory issues which I found
while working on a bigger fix to make dlm secured against tcpkill.

- Alex

Alexander Aring (7):
  fs: dlm: synchronize dlm before shutdown
  fs: dlm: make connection hash lockless
  fs: dlm: fix dlm_local_addr memory leak
  fs: dlm: fix configfs memory leak
  fs: dlm: move free writequeue into con free
  fs: dlm: handle possible othercon writequeues
  fs: dlm: use free_con to free connection

 fs/dlm/Kconfig    |   1 +
 fs/dlm/config.c   |   3 ++
 fs/dlm/lowcomms.c | 122 +++++++++++++++++++++-------------------------
 3 files changed, 60 insertions(+), 66 deletions(-)

-- 
2.26.2

