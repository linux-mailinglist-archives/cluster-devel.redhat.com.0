Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D9A121B7CA3
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Apr 2020 19:25:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587749108;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3HY62aLbFa9BjIiUVglh0O0I/UYZAwjc4TbbaUojEOs=;
	b=cFhWJ8tLFQjHzdaAXfu0X9fitc62LCSiqhnFeXHTfk49TN6DQZwUVMJN9KCxdI0BMGbkF2
	VX5n2s/Q4oePZD0T2s2LStLx1V+3Wa+fqkWoHW8a1nNzBZhc24hMm9XttfVmUrK+AKpeiY
	qz4nvBmiErukacYK6ob6rZ2SAV84vMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-AMElHCpXPnCPKsTsgpYDug-1; Fri, 24 Apr 2020 13:25:05 -0400
X-MC-Unique: AMElHCpXPnCPKsTsgpYDug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFA6C801E67;
	Fri, 24 Apr 2020 17:25:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A28F925262;
	Fri, 24 Apr 2020 17:25:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BDEB4CAA8;
	Fri, 24 Apr 2020 17:25:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OHOvCH020678 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 13:24:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1AFDC9080; Fri, 24 Apr 2020 17:24:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-238.phx2.redhat.com [10.3.112.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2C09605D1;
	Fri, 24 Apr 2020 17:24:56 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 24 Apr 2020 12:24:52 -0500
Message-Id: <20200424172456.616586-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/4] gfs2: misc withdraw patch fixes
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

Further recovery testing revealed some problems with the withdraw code,
especially related to single-node (lock_nolock) withdraws. This patch set
fixes some of the recent issues.

Bob Peterson (4):
  gfs2: fix withdraw sequence deadlock
  gfs2: Fix error exit in do_xmote
  gfs2: Fix BUG during unmount after file system withdraw
  gfs2: Fix use-after-free in gfs2_logd after withdraw

 fs/gfs2/glock.c   |  2 +-
 fs/gfs2/log.c     |  5 +++++
 fs/gfs2/meta_io.c |  2 +-
 fs/gfs2/util.c    | 10 ++++++----
 4 files changed, 13 insertions(+), 6 deletions(-)

--=20
2.25.1

