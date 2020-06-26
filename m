Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 739AE20B6EF
	for <lists+cluster-devel@lfdr.de>; Fri, 26 Jun 2020 19:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593192433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=y+EqkHhZOPIBxR+QDj7Zty6OskdxX+Ma6e695FyuAE8=;
	b=UsWjNrZ5msnBeIUcwne7EZqQGFWp+D6cvuiPDGiTDfCRJN51/RQORo5qtiE6trV5/C6RKE
	c7mFGg6wWifa+t9FJTN331SlCI0qgsYm40hj2Ez6OnX9jwL0UXq7pFvvwQqSlbiVlP718T
	YQGSh1ePjnHt92Z29KruD9rhm5jb4HA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-T2aGfA-gN8q8db0_Sey85A-1; Fri, 26 Jun 2020 13:27:11 -0400
X-MC-Unique: T2aGfA-gN8q8db0_Sey85A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06DDC804002;
	Fri, 26 Jun 2020 17:27:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5F165C1B2;
	Fri, 26 Jun 2020 17:27:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D3A9C1809543;
	Fri, 26 Jun 2020 17:27:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05QHR57F019136 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 13:27:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FD8C8FF83; Fri, 26 Jun 2020 17:27:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-78.rdu2.redhat.com [10.10.115.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E52D51C8;
	Fri, 26 Jun 2020 17:27:00 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: davem@davemloft.net
Date: Fri, 26 Jun 2020 13:26:47 -0400
Message-Id: <20200626172650.115224-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: netdev@vger.kernel.org, cluster-devel@redhat.com, kuba@kernel.org
Subject: [Cluster-devel] [PATCHv2 dlm-next 0/3] fs: dlm: add support to set
	skb mark value
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

changes since v2:

- rebase on current dlm/next branch
- because rebase it's necessary now to add PATCH 1/3. Please netdev
  maintainers, reply if it's okay to merge this one patch into dlm/next.
  Due other patches in dlm/next it's as well not possible to merge
  everything in net-next. Thanks.

Alexander Aring (3):
  net: sock: add sock_set_mark
  fs: dlm: set skb mark for listen socket
  fs: dlm: set skb mark per peer socket

 fs/dlm/config.c    | 44 ++++++++++++++++++++++++++++++++++++++++++++
 fs/dlm/config.h    |  2 ++
 fs/dlm/lowcomms.c  | 19 +++++++++++++++++++
 include/net/sock.h |  1 +
 net/core/sock.c    |  8 ++++++++
 5 files changed, 74 insertions(+)

-- 
2.26.2

