Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A57E3174086
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Feb 2020 20:47:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582919269;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G6EL59ORafh7FMyAR8h5Ip7cb3379imDnRG89gc/CCk=;
	b=GBMhWfgGXB3/VSKp36kODMQ2s8fKOvh4I/BElaIdo9x8TOnZ2PbEwBfpghr+h4YzaaWy63
	s9CLNrjt4Y6dLJQktveuOLw3oa1+BdqnxCbJ9ZvjAhwlNyu0Z/tFqsbVpRgfXvatssTJ07
	6e25JHu/hIkkAWZDjxB+3TMWnsqUBF4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-UJySyo0oONmdI-UT0ryZtQ-1; Fri, 28 Feb 2020 14:47:46 -0500
X-MC-Unique: UJySyo0oONmdI-UT0ryZtQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60ACD18FE863;
	Fri, 28 Feb 2020 19:47:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0E645C21A;
	Fri, 28 Feb 2020 19:47:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7D44B18089CF;
	Fri, 28 Feb 2020 19:47:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01SJlYgM017432 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 28 Feb 2020 14:47:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B4D679298D; Fri, 28 Feb 2020 19:47:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 709179299C
	for <cluster-devel@redhat.com>; Fri, 28 Feb 2020 19:47:30 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 28 Feb 2020 13:47:26 -0600
Message-Id: <20200228194728.1375940-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/2 v2] Clean up and fix quota data
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

This is version 2 of this patch set. The first patch hasn't changed from
the previous patch #3. The second patch is new. Andreas pointed out that v1
kept the memory for quota data allocated too long because it was not freed
until evict. This version takes a completely different approach. It changes
the quota data structure to be policed by an atomic count of users.
Instead of gfs2_qa_alloc, each user must instead gfs2_qa_get() which
allocates the structure if necessary, and initializes its usage count to 2.
After gfs2_qa_get, callers must call a corresponding gfs2_qa_put().
As before, a file close or evict will decrement the counter one last time
from 1 to 0, and free the memory.

This patch set has not had adequate testing and may require some more chang=
es,
although it does fix the scenario listed above. I just wanted to throw this
one out as an alternative to the last and see if people like it any better.

Bob Peterson (2):
  gfs2: eliminate gfs2_rsqa_alloc in favor of gfs2_qa_alloc
  gfs2: Change inode qa_data to allow multiple users

 fs/gfs2/acl.c    |  7 +++++--
 fs/gfs2/bmap.c   |  2 +-
 fs/gfs2/file.c   | 19 ++++++++++++------
 fs/gfs2/incore.h |  1 +
 fs/gfs2/inode.c  | 31 +++++++++++++++++------------
 fs/gfs2/quota.c  | 51 +++++++++++++++++++++++++++++-------------------
 fs/gfs2/quota.h  |  4 ++--
 fs/gfs2/rgrp.c   | 12 +-----------
 fs/gfs2/rgrp.h   |  1 -
 fs/gfs2/super.c  |  2 ++
 fs/gfs2/xattr.c  | 12 ++++++++----
 11 files changed, 83 insertions(+), 59 deletions(-)

--=20
2.24.1

