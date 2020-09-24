Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B803D277404
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Sep 2020 16:32:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600957963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AQ6ojuWLIf2Og6m+4AApm7llkTcCeZA78Z8ySOb0MTI=;
	b=bjHXFBMYb96iAJd11zvxFsj1zH0nhbTTvWYtgaU3v1Xw1r+/hxDNERty6JudF2AEyaLRZ4
	yP+ZFMo+8KA88YA9ovIxQfSKjAGX49tIXXDi+h2Gd2mvcwykYar2rmCRYx9jpXi/9EraKo
	shAs+uKla+3IhsawCkT723h9rNRzxaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-yIod8DNlMkObYUsIKIBo1g-1; Thu, 24 Sep 2020 10:32:40 -0400
X-MC-Unique: yIod8DNlMkObYUsIKIBo1g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA0CC1891E8C;
	Thu, 24 Sep 2020 14:32:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF2CD78830;
	Thu, 24 Sep 2020 14:32:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07AD48C7A2;
	Thu, 24 Sep 2020 14:32:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08OEWVrT000982 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 10:32:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 69A7B5D9F1; Thu, 24 Sep 2020 14:32:31 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-114-178.rdu2.redhat.com [10.10.114.178])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 10E875D9D2;
	Thu, 24 Sep 2020 14:32:27 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 24 Sep 2020 10:31:21 -0400
Message-Id: <20200924143126.158629-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm/next 0/5] fs: dlm: receive and mark
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

This patch-series contains some improvements for the receive handling
and fixes for really setting per nodeid mark settings. The cluster mark
value becomes now the meaning of default mark value, a per nodeid mark
value will overwrite this mark value only for this node traffic.

- Alex

changes since v2:

- drop patch of rework transmit side:

  After I got some review regarding to performance issues
  with sendmsg()/sendpage() I will drop this patch. And yes [0]
  all branches of tcp sendmsg() will copy except the zerocopy
  branch [1]. However for now zerocopy seems to be very only
  developed for user space thing.

  I changed to a "per dlm message" behaviour to have it easier
  to implement a possible "retransmit" handling to provide that
  dlm can survive a spam of tcp reset messages (tcpkill). However
  I will schedule a different solution when I implement that feature
  later. This solution will hopefully combine to send large page buffers
  and having the possibility to retransmit specific dlm messages of it.
  Unlikely that a retransmit ends in a large page buffer but they
  _should_ be happen very rarely.

- drop patch of release connection with call_rcu:

  This patch makes problems regarding to cleaning up the
  writequeue, according to [2] the call_rcu() callback
  can be invoked by softirq context. We using spin_lock()
  primitives there without _bh(). I came to conclusion it's
  fine as it for now without the transmit handling changes.

- add patch to fix/change skb mark handling:

  Yea, I got finally aware why some mark values wasn't working as
  expected. The cluster mark value will now be used always. If a
  per nodeid mark is specified it will be used instead of the
  default one. I will send another patch for dlm_controld man
  page to update the meaning.

- fix in receive rework patch a con vs othercon regarding to rx_buflen

[0] https://elixir.bootlin.com/linux/v5.9-rc6/source/net/ipv4/tcp.c#L1315
[1] https://elixir.bootlin.com/linux/v5.9-rc6/source/net/ipv4/tcp.c#L1359
[2] https://www.kernel.org/doc/Documentation/RCU/whatisRCU.txt

Alexander Aring (5):
  fs: dlm: remove lock dependency warning
  fs: dlm: fix mark per nodeid setting
  fs: dlm: handle range check as callback
  fs: dlm: disallow buffer size below default
  fs: dlm: rework receive handling

 fs/dlm/config.c   |  63 +++++++++------
 fs/dlm/config.h   |   4 +-
 fs/dlm/lowcomms.c | 197 ++++++++++++++++++++++------------------------
 fs/dlm/midcomms.c | 136 +++++++++++++-------------------
 fs/dlm/midcomms.h |   3 +-
 5 files changed, 188 insertions(+), 215 deletions(-)

-- 
2.26.2

