Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8E6292DE6
	for <lists+cluster-devel@lfdr.de>; Mon, 19 Oct 2020 20:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603133976;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pbr60EzGFZicMC48n1fKQbCun7eE8xq/vR4p+dFMUzA=;
	b=Zm/skkuaYeRkfCVR4ThkpehrkZ4SZ+GxZ5fCg3/OPA1oNxzCA8eDiCPnAZzqsZyivhlh0O
	blhEywpzfb8Sra+p9DztNn6aSIlVXZJOJcE8pZiM5E2uTUS3zQlwlg9gkktFgoz+/xD6Xi
	NjPQ8+WmvoShCMXPerJ+ucKx+hoAlGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-oDNlM--7Og63cVeozytAZA-1; Mon, 19 Oct 2020 14:59:33 -0400
X-MC-Unique: oDNlM--7Og63cVeozytAZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C44738049C8;
	Mon, 19 Oct 2020 18:59:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B1E236EF79;
	Mon, 19 Oct 2020 18:59:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F8B7181A06D;
	Mon, 19 Oct 2020 18:59:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JIxP5G021240 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 14:59:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C6A8C5C22A; Mon, 19 Oct 2020 18:59:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-116-200.rdu2.redhat.com [10.10.116.200])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4A1685C1A3;
	Mon, 19 Oct 2020 18:59:22 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 19 Oct 2020 14:59:07 -0400
Message-Id: <20201019185916.707827-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 0/9] fs: dlm: fixes and change
	listen socket handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
PAGE_SIZE, because the buffer allocator of lowcomms). The upper layer
protocol should never request a buffer which can be above PAGE_SIZE length,
otherwise we run in a bufferoverlow. With the recent changes of
"ci_buffer_size" it's allowed to be above PAGE_SIZE, the patch should be
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

Alexander Aring (9):
  fs: dlm: fix proper srcu api call
  fs: dlm: define max send buffer
  fs: dlm: add get buffer error handling
  fs: dlm: flush othercon at close
  fs: dlm: handle non blocked connect event
  fs: dlm: move connect callback in node creation
  fs: dlm: move shutdown action to node creation
  fs: dlm: refactor sctp sock parameter
  fs: dlm: listen socket out of connection hash

 fs/dlm/lockspace.c |   2 +-
 fs/dlm/lowcomms.c  | 225 +++++++++++++++++++++++----------------------
 fs/dlm/lowcomms.h  |   4 +
 fs/dlm/member.c    |   2 +-
 fs/dlm/rcom.c      |   6 +-
 5 files changed, 122 insertions(+), 117 deletions(-)

-- 
2.26.2

