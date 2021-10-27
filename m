Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0E443CDA2
	for <lists+cluster-devel@lfdr.de>; Wed, 27 Oct 2021 17:34:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635348854;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zxKEGzYkDqpuNIfBCRLkwADX828G3sOChA/I6vrccWo=;
	b=boWHNx1NN6h7JuKT0Cwjoao+WhuNnWq0clIStymdN3iGAnJedAWiEvGEN1lL8EXgwL0/+J
	JxJOZFJzkP0UiMkEwEDbewBojo47WYzCpaO0LfnLE3GvC/W5OV4JvK57XkDwWSn2+c9yJV
	AxpiDh78FVVXMq1CLmYdc7u0Lcw39pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-aZsSsokNNcSEbqOaxB-33w-1; Wed, 27 Oct 2021 11:34:11 -0400
X-MC-Unique: aZsSsokNNcSEbqOaxB-33w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B868C80A5C2;
	Wed, 27 Oct 2021 15:34:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A71681F43F;
	Wed, 27 Oct 2021 15:34:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F18124EA3B;
	Wed, 27 Oct 2021 15:34:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19RFNnri009168 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 27 Oct 2021 11:23:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 576CB1042AA9; Wed, 27 Oct 2021 15:23:49 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from fs-i40c-03.fs.lab.eng.bos.redhat.com
	(fs-i40c-03.fs.lab.eng.bos.redhat.com [10.16.224.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9F0D110429D2;
	Wed, 27 Oct 2021 15:23:32 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Wed, 27 Oct 2021 11:23:14 -0400
Message-Id: <20211027152322.3236492-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm/next 0/8] fs: dlm: new debug feature and
	fix invalid message
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Hi,

This patch contains small cleanups and a new debugging feature which
will allow us to manipulate DLM state and sending out a dlm message
constructed by user space. It's an early state feature and not everything
is possible yet. The goal is here to bring DLM in a somehow valid testing
state and send some DLM message to crash the kernel.

I did a scapy module for DLM [0]. Furthermore this can also be used to
fuzz the DLM kernel stack and detect issues earlier like PATCH 8/8
fixes. After some more cleanup I try to bring it upstream.

The method is simple:

1. add lkb and waiter to bring DLM in a state that it accepts a specific
   dlm message
2. construct the message in python by using scapy and send it out

May we do that in a loop and fuzz some dlm message fields to check for
issues if a invalid message was received.

Now there might be other bugs why we received an invalid message, but we
should check and filter those out. 

- Alex

[0] https://github.com/alexaring/scapy/commit/8d58896e65b6d8f96442e04219325b8abfd4c398

Alexander Aring (8):
  fs: dlm: remove obsolete INBUF define
  fs: dlm: move version conversion to compile time
  fs: dlm: let handle callback data as void
  fs: dlm: add debugfs rawmsg send functionality
  fs: dlm: allow create lkb with specific id range
  fs: dlm: add lkb debugfs functionality
  fs: dlm: add lkb waiters debugfs functionality
  fs: dlm: filter user dlm messages for kernel locks

 fs/dlm/debug_fs.c     | 96 ++++++++++++++++++++++++++++++++++++++++++-
 fs/dlm/dlm_internal.h |  6 ---
 fs/dlm/lock.c         | 80 +++++++++++++++++++++++++++++++++++-
 fs/dlm/lock.h         |  4 ++
 fs/dlm/lowcomms.c     | 19 ++++-----
 fs/dlm/lowcomms.h     |  4 +-
 fs/dlm/midcomms.c     | 58 ++++++++++++++++++++++++--
 fs/dlm/midcomms.h     |  2 +
 8 files changed, 243 insertions(+), 26 deletions(-)

-- 
2.27.0

