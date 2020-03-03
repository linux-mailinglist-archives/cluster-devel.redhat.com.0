Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A081B177C9F
	for <lists+cluster-devel@lfdr.de>; Tue,  3 Mar 2020 18:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583254935;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rMzX4AtnBTkXXS2ljrW5n0Nyrp1mhUhuSwPolrPKY9Q=;
	b=eIPEiit2tpWeAuKvy0a4M+u1wZOinLoy8/nD2kN3HCCiHN0HuxQFsBan/W1JMnVVuoYJnK
	HSQwEPKSHs9/ws0tSpnMiuAfZ9SpBWs3IGPDiZZ0KJtSfgFAxyuqeeQSulsd9JOrg1zStj
	GjK4om7WWH9WuLNbxfN/YnF9Xg8fBIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-eeK5mLsSNTKePkaSZyflzA-1; Tue, 03 Mar 2020 12:02:13 -0500
X-MC-Unique: eeK5mLsSNTKePkaSZyflzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D0A2801F8C;
	Tue,  3 Mar 2020 17:02:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2A7B73887;
	Tue,  3 Mar 2020 17:02:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7E7371802226;
	Tue,  3 Mar 2020 17:02:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 023H21PU004963 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 3 Mar 2020 12:02:01 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 15CB65DA7E; Tue,  3 Mar 2020 17:02:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D67D95DA76
	for <cluster-devel@redhat.com>; Tue,  3 Mar 2020 17:01:56 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Tue,  3 Mar 2020 11:01:52 -0600
Message-Id: <20200303170154.1486598-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/2 v3] Clean up and fix quota data
	allocate and free
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

This patch set cleans up a recently discovered race between file close
and chown. The problem was that file close would free the quota data
structures attached to the in-core inode, but chown relied on them to
exist. So if the timing of the close is wrong, the chown can result in
kernel panic. The problem is easily recreated with this:

On terminal session 1:
while true; do chown test /mnt/gfs2/test; chown root /mnt/gfs2/test; done

On terminal session 2:
while true; do echo "a" > /mnt/gfs2/test; echo "b" > /mnt/gfs2/test;done

This is version 3, which implements Andreas's suggestions.
The first patch hasn't changed from the previous version of the same name.
The second patch implements a get/put scheme for the qadata structure.
As per Andreas's request, I changed the reference counter from atomic to
regular int, and changed the way references were kept.

Bob Peterson (2):
  gfs2: eliminate gfs2_rsqa_alloc in favor of gfs2_qa_alloc
  gfs2: Change inode qa_data to allow multiple users

 fs/gfs2/acl.c    |  7 ++++--
 fs/gfs2/bmap.c   |  2 +-
 fs/gfs2/file.c   | 27 +++++++++++++++---------
 fs/gfs2/incore.h |  1 +
 fs/gfs2/inode.c  | 31 ++++++++++++++++-----------
 fs/gfs2/quota.c  | 55 ++++++++++++++++++++++++++++++------------------
 fs/gfs2/quota.h  |  4 ++--
 fs/gfs2/rgrp.c   | 12 +----------
 fs/gfs2/rgrp.h   |  1 -
 fs/gfs2/super.c  |  2 ++
 fs/gfs2/xattr.c  | 12 +++++++----
 11 files changed, 90 insertions(+), 64 deletions(-)

--=20
2.24.1

