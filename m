Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F024C22ECF1
	for <lists+cluster-devel@lfdr.de>; Mon, 27 Jul 2020 15:14:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595855659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h+Zwh0KB5l1ylVGEoea+XWxvzEBd+YiZfOdkt7Fn0lM=;
	b=Yp8F5pzZdJyioLXLY0Pg8h8K4CYgS0BABvNCR5fTFzsT6Kk+J5s20HBfqwsrFSGmA5HWNs
	YgLR6OQ6gcTRDsEfhKAQE+OZ/4QW22pc2dX88ip56eB2AAQINfFvYa2BmWOxJsCzqeT8CQ
	WszVbq5gRdmD5vgXf1azAyZUKXyn9wM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-VOzTjec9OLOoEMrizxGCXQ-1; Mon, 27 Jul 2020 09:14:13 -0400
X-MC-Unique: VOzTjec9OLOoEMrizxGCXQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F486800478;
	Mon, 27 Jul 2020 13:14:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF293610F3;
	Mon, 27 Jul 2020 13:14:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47CC71809554;
	Mon, 27 Jul 2020 13:14:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RDE3kk012172 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 09:14:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BDB74619C4; Mon, 27 Jul 2020 13:14:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-112-138.rdu2.redhat.com [10.10.112.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F73160BF4;
	Mon, 27 Jul 2020 13:14:00 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Mon, 27 Jul 2020 09:13:35 -0400
Message-Id: <20200727131338.9111-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCHv2 dlm-next 0/3] fs: dlm: receive handling
	changes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

Hi,

this patch series will do some changes according to the receive handling
in dlm. My goal is to survive tcpkill [0] which is my main testcase while
doing some heavy load on dlm. The code is still in a situation where dlm
can end in a deadlock state while e.g. using gfs2. For generating a lot
of dlm traffic I use gfs2 and running make_panic [1].

I mainly just run make_panic on two nodes and let run:

tcpkill -9 -i $IFACE port 21064

on both nodes. The first two patches changes the behaviour how to react
on invalid dlm messages (which does not occur on my test case). The third
patch increase in my test scenario the stability of dlm connection and
running tcpkill. The last patch will ensure that the other end agrees
to close the socket if we want to do a clean tcp termination.

FUTURE WORK:

I still get deadlocks, as PATCH 2/3 shows that I think the TCP stack
will drop some packets when receiving a tcp reset (and the application
layer think it's successful send). This is one of my future work to
solve this behaviour. I also think about to extend the test case to e.g.
umount/mount gfs2 while my testcase is running and doing randomly
drops/delaying/reordering of dlm tcp by using the introduced mark
functionality and traffic control.

- Alex

[0] https://salsa.debian.org/pkg-security-team/dsniff
[1] https://fedorapeople.org/cgit/teigland/public_git/dct-stuff.git/tree/fs/make_panic

changes since v2:
 - fixup patch 2/4 with 1/4, otherwise we have some broken state
 - correct cbuf_eat() to "eat" full received buffer size in case of
   receiption of invalid dlm message.

Alexander Aring (3):
  fs: dlm: don't close socket on invalid message
  fs: dlm: change handling of reconnects
  fs: dlm: implement tcp graceful shutdown

 fs/dlm/lowcomms.c | 112 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 87 insertions(+), 25 deletions(-)

-- 
2.26.2

