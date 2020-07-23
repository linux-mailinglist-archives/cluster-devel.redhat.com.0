Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAFA22B1CE
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jul 2020 16:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595515793;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BiiL4ROO4XERxtKeeleP5z3VKWfJ9LeNwQ4g82IzoxU=;
	b=QPNlZafXu03ah8J2nP/wTKUtHtqYFUFI2rXLJp6RXBa9c9tJe12DZg9VvobORFOXUvT9FH
	tbPITrQlH5YKYOcN2c/66dU7Bnj8Lk0xFGzhNQu1l9J5CgkcbUd1REfcA7dHeVnRJSVH4l
	8ngVLVoH8i1wV5khThl7whR1DYvM2b8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-2lu4qH0pOQ6wvpqaWGG1FQ-1; Thu, 23 Jul 2020 10:49:38 -0400
X-MC-Unique: 2lu4qH0pOQ6wvpqaWGG1FQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B857E1B18BE2;
	Thu, 23 Jul 2020 14:49:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5AED74F58;
	Thu, 23 Jul 2020 14:49:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E09A49625C;
	Thu, 23 Jul 2020 14:49:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06NEnTsw009058 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jul 2020 10:49:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39CD319D7E; Thu, 23 Jul 2020 14:49:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from carbon.redhat.com (ovpn-118-215.rdu2.redhat.com [10.10.118.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BFAD32E021;
	Thu, 23 Jul 2020 14:49:25 +0000 (UTC)
From: Alexander Aring <aahringo@redhat.com>
To: teigland@redhat.com
Date: Thu, 23 Jul 2020 10:49:04 -0400
Message-Id: <20200723144908.271110-1-aahringo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH dlm-next 0/4] fs: dlm: receive handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
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

I still get deadlocks, as PATCH 3/4 shows that I think the TCP stack
will drop some packets when receiving a tcp reset (and the application
layer think it's successful send). This is one of my future work to
solve this behaviour. I also think about to extend the test case to e.g.
umount/mount gfs2 while my testcase is running and doing randomly
drops/delaying/reordering of dlm tcp by using the introduced mark
functionality and traffic control.

- Alex

[0] https://salsa.debian.org/pkg-security-team/dsniff
[1] https://fedorapeople.org/cgit/teigland/public_git/dct-stuff.git/tree/fs/make_panic


Alexander Aring (4):
  fs: dlm: don't close socket on invalid message
  fs: dlm: fix report error of invalid messages
  fs: dlm: change handling of reconnects
  fs: dlm: implement tcp graceful shutdown

 fs/dlm/lowcomms.c | 108 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 84 insertions(+), 24 deletions(-)

-- 
2.26.2

