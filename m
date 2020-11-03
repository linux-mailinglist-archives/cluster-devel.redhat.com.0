Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id BB2F02A3824
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Nov 2020 02:04:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604365495;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G8W000Xg6RKpu7H8LkjHdQKIZrCQUzI1iXnGQTfGjvA=;
	b=et6Yt0peJ3E0oX/jsYwxUTU642NPdA+3cKFe2cQhLouZYPyKOXZiXZP7DcwQ9b8ggTrpkA
	MuSLmqOXZC/smll/ncq3MYsiIvjU8dp8+F4LQ9PNyTEB4bc8XTmh5rjkWHqpO0b/tPm1nn
	AXad6OXFy29O1tmjXCLnjW0b9v4SKSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-7EuD-sH9OVyfzfwOjdcwBQ-1; Mon, 02 Nov 2020 20:04:54 -0500
X-MC-Unique: 7EuD-sH9OVyfzfwOjdcwBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A9FDA809DD7;
	Tue,  3 Nov 2020 01:04:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97D8F109F193;
	Tue,  3 Nov 2020 01:04:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA89A79FF7;
	Tue,  3 Nov 2020 01:04:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A314epG003462 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 2 Nov 2020 20:04:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 691C2177F9; Tue,  3 Nov 2020 01:04:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-115-45.rdu2.redhat.com [10.10.115.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0FD5B5C5DE;
	Tue,  3 Nov 2020 01:04:36 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon,  2 Nov 2020 20:04:15 -0500
Message-Id: <20201103010428.1009384-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 RESEND v5.10-rc2 00/13] fs: dlm: fixes and
	change listen socket handling
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

This series fix a issue by using the wrong RCU API for sleepable rcu.

The second patch is something what I discovered by placing a new header
in front of the dlm header. This header encapsulates a dlm message.
The patch will fix issues with the ci_buffer_size and I am not sure for
what the ci_buffer_size setting is exactly used before, there was no
range protection or something else and it is used for transmit and
receive side. As I saw that the previous receive handling was using it
as the receive buffer size for "bigger" dlm messages, I changed it mostly
the same way and allowed even reading more bytes in a recvmsg(). The user
need somehow know before the actual biggest possible dlm message (which is
4096 bytes, because the buffer allocator of lowcomms). The upper layer
protocol should never request a buffer which can be above 4096 bytes,
otherwise we run in a bufferoverlow. With the recent changes of
"ci_buffer_size" it's allowed to be above 4096 bytes, the patch should be
sure we use the maximum possible payload to a dlm recovery message and
don't let this configurable.

The rest of this patch-series makes the listen socket handling better
regarding to accept socket. There exists some code path which the listen
socket should never run, but possible when we handle the listen socket as
normal connection inside the connection hash. This patch series contains
patches to prepare and finally handle the listen connection in their own
separate structure. It also do some small cleanup to avoid double close
on the listen socket and be sure we set the sock pointer to NULL if
closed, some parts of the code seems to have this required.

- Alex

changes since v2:
 - define max send buffer to 4096 instead PAGE_SIZE
   This has something to do with the DEFAULT_BUFFER_SIZE and maximum
   message length of the receive buffer and I don't know all PAGE_SIZE
   defines of all supported Linux archs.
 - add BUILD_BUG_ON for max send buffer size and PAGE_SIZE
 - add helper for connection structure initialization
 - use runtime array size variable for multi-home address fix instead
   of assign to NULL after free

Alexander Aring (13):
  fs: dlm: fix proper srcu api call
  fs: dlm: define max send buffer
  fs: dlm: add get buffer error handling
  fs: dlm: flush othercon at close
  fs: dlm: handle non blocked connect event
  fs: dlm: add helper for init connection
  fs: dlm: move connect callback in node creation
  fs: dlm: move shutdown action to node creation
  fs: dlm: refactor sctp sock parameter
  fs: dlm: listen socket out of connection hash
  fs: dlm: fix check for multi-homed hosts
  fs: dlm: constify addr_compare
  fs: dlm: check on existing node address

 fs/dlm/lockspace.c |   2 +-
 fs/dlm/lowcomms.c  | 304 ++++++++++++++++++++++++---------------------
 fs/dlm/lowcomms.h  |   2 +
 fs/dlm/member.c    |   2 +-
 fs/dlm/rcom.c      |   6 +-
 5 files changed, 168 insertions(+), 148 deletions(-)

-- 
2.26.2

