Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 67900337D8B
	for <lists+cluster-devel@lfdr.de>; Thu, 11 Mar 2021 20:21:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615490466;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=T7edswVaIeU69AixiEqqwj8xLnPVwpXD7BLQGRdvjTI=;
	b=EA/qc8yHYH1o4Wb58MnYstvFpnOoZqbxbvHpZaai1+3oL68vBd2seCN7pxJ7W0xCcw5J6l
	zddd3tMiJ/7RFejGuxxKm4KZLodv5z/Tr9GhCwLaWesEMgC/YfL9Hiy7Sgi+pV60jEa+g0
	V3xJnuppVFC7jUK9RLOtUpugn93QA6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-t71i71YDMTeb4KCQ6NoJ7Q-1; Thu, 11 Mar 2021 14:21:04 -0500
X-MC-Unique: t71i71YDMTeb4KCQ6NoJ7Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2389E100CF6E;
	Thu, 11 Mar 2021 19:21:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3572E1000358;
	Thu, 11 Mar 2021 19:21:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF1CB8E1C;
	Thu, 11 Mar 2021 19:20:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12BJKqNS001934 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 11 Mar 2021 14:20:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 852C439A5F; Thu, 11 Mar 2021 19:20:52 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-117-91.rdu2.redhat.com [10.10.117.91])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 57C7D18B5E;
	Thu, 11 Mar 2021 19:20:49 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: anprice@redhat.com
Date: Thu, 11 Mar 2021 14:20:34 -0500
Message-Id: <20210311192036.17218-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH gfs2-utils 0/2] glocktop: dlmwaiters above
	100 fixes
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

these patches fixes issues for me with glocktop. I got a:


*** buffer overflow detected ***: terminated
Aborted (core dumped)

debugging with gdb figured out that there are some maximum limitation to
handle dlm waiters which was in my case 117. This patches increased the
maximum allowed dlm waiters. These limitations are still static and
should be changed to dynamic allocation in due courses otherwise buffer
overflow happens again.

- Alex

Alexander Aring (2):
  glocktop: use MAX_LINES for dlmwlines
  glocktop: allocate fsdlm dynamically

 gfs2/glocktop/glocktop.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.26.2

