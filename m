Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CE8271FBD49
	for <lists+cluster-devel@lfdr.de>; Tue, 16 Jun 2020 19:48:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592329687;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FlzyOWHbT7iCBVu5t0CM8UnNqRR4GWjfiUj4ziwrVi0=;
	b=PL7d9sms74aMMSi+pHNXLVpUOcrCd7RuD3rIqA0hFMdlMxSJY23rzSO5MrUjCfduChraVr
	88Rnaw5Sq2EIjg+bfIeiY9tTw9aIlIQKjP+zuKQyB1g5iiHar/H8tS1Wp6b1txgfjsfmoo
	TnTHWqO0gJun0KEv/KaGNoLSFzkGWPM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-fd_S6YW6PXK8Svu5ZfB_JA-1; Tue, 16 Jun 2020 13:48:06 -0400
X-MC-Unique: fd_S6YW6PXK8Svu5ZfB_JA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B589010059C7;
	Tue, 16 Jun 2020 17:48:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E57C5C1BD;
	Tue, 16 Jun 2020 17:48:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD434833C6;
	Tue, 16 Jun 2020 17:48:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GHlxYt015356 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 13:47:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 789AB5C1D4; Tue, 16 Jun 2020 17:47:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-78.rdu2.redhat.com [10.10.114.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCA315C1BD;
	Tue, 16 Jun 2020 17:47:55 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Tue, 16 Jun 2020 13:47:25 -0400
Message-Id: <20200616174727.34030-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH RESEND dlm-next 0/2] fs: dlm: add support to
	set skb mark value
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

this patch series adds support for setting the skb mark value as socket
option. It's not possible yet to change this after the socket is
created, although the mark value can be changed afterwards.

How to test it:

1. Setup mark values

echo 0xcafe > /sys/kernel/config/dlm/cluster/mark
echo 0xbeef > /sys/kernel/config/dlm/cluster/comms/2/mark

Note: setting a mark value for local node has no effect.

2. Add some skb mark classifier:

tc qdisc add dev $DEV root handle 1: htb
tc filter add dev $DEV parent 1: u32 match mark 0xcafe 0xffffffff action ok
tc filter add dev $DEV parent 1: u32 match mark 0xbeef 0xffffffff action ok

3. Mount e.g. gfs2

4. dump stats:

tc -s -d filter show dev $DEV

5. Open e.g. wireshark and check the success rate of stats

I have also patches for dlm user space to set these values via
dlm controld.

- Alex

RESEND the whole series because I don't see them in the archive,
I think because I wasn't subscribed before.

Alexander Aring (2):
  fs: dlm: set skb mark for listen socket
  fs: dlm: set skb mark per peer socket

 fs/dlm/config.c   | 44 ++++++++++++++++++++++++++++++++++++++++++++
 fs/dlm/config.h   |  2 ++
 fs/dlm/lowcomms.c | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)

-- 
2.26.2

