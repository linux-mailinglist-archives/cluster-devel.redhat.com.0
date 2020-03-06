Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6B02D17C39B
	for <lists+cluster-devel@lfdr.de>; Fri,  6 Mar 2020 18:05:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583514353;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KihMpJevKZpsSqNL4O6crjwU13o4Xbfx+6TgXrySFC4=;
	b=fWtBb+8kJllajhuN0MmdUHh9GTltciu+frk2AX9zi8ThiUIFA3I1n4RkmZEuqfWlHfm1Ql
	owWv/2FU4TYtQIfLn59DKzpdqqVudfUbxxQPyrVMDkxqDkE10JnbwTPKrmPZJdPca52IL5
	CDw034j2ASot/pKLTFRnGN/+JkDwaSw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-IBtOyW_ZPzWVHZm55SbBog-1; Fri, 06 Mar 2020 12:05:51 -0500
X-MC-Unique: IBtOyW_ZPzWVHZm55SbBog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD463100550D;
	Fri,  6 Mar 2020 17:05:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75F9090796;
	Fri,  6 Mar 2020 17:05:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F17318089CF;
	Fri,  6 Mar 2020 17:05:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 026H5fGD028702 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 6 Mar 2020 12:05:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 48D768B75D; Fri,  6 Mar 2020 17:05:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C47EE8B74D
	for <cluster-devel@redhat.com>; Fri,  6 Mar 2020 17:05:36 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri,  6 Mar 2020 11:05:28 -0600
Message-Id: <20200306170534.1772544-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/6 v4] Clean up and fix quota data
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

This is version 4, which implements more of Andreas's suggestions and
fixes up a bug or two, plus some patches written by Andreas.

Andreas Gruenbacher (3):
  gfs2: Split gfs2_rsqa_delete into gfs2_rs_delete and gfs2_qa_put
  gfs2: Add missing gfs2_qa_get error handling in gfs2_open_common
  gfs2: Remove unnecessary gfs2_qa_{get,put} pairs

Bob Peterson (3):
  gfs2: Additional information when gfs2_ail1_flush withdraws
  gfs2: eliminate gfs2_rsqa_alloc in favor of gfs2_qa_alloc
  gfs2: Change inode qa_data to allow multiple users

 fs/gfs2/acl.c    |  7 ++++--
 fs/gfs2/bmap.c   |  5 ++--
 fs/gfs2/file.c   | 43 +++++++++++++--------------------
 fs/gfs2/incore.h |  1 +
 fs/gfs2/inode.c  | 35 ++++++++++++++++-----------
 fs/gfs2/log.c    |  5 +++-
 fs/gfs2/quota.c  | 63 +++++++++++++++++++++++++++++-------------------
 fs/gfs2/quota.h  |  4 +--
 fs/gfs2/rgrp.c   | 15 ++----------
 fs/gfs2/rgrp.h   |  3 +--
 fs/gfs2/super.c  |  5 +++-
 fs/gfs2/xattr.c  | 12 ++++++---
 12 files changed, 106 insertions(+), 92 deletions(-)

--=20
2.24.1

