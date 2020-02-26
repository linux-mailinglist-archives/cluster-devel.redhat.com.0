Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D2BCD170312
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Feb 2020 16:49:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582732141;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ejhXBm9VD9bT+E5I7q8dMRr/yUq04JVEgAqdXZKjTfc=;
	b=TSMR5EURArAjTf1rTWVChXZfRa0bT7WWtL+zzU4QoLnsKhZyYCGjtK7Q3evCva3Nl6RuEF
	/zIXMSrcVMbfSGzTv+PqgC2CpUZ3noZvdMWr5pYXhuNU4Ql5HlBmb9ufB2xaiWFGh5kw8r
	WqvJL8zWgak85fzPBtuJqdBbeOo2Rbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-xjvbPQj1PIWvE0JwZ2PCXg-1; Wed, 26 Feb 2020 10:48:59 -0500
X-MC-Unique: xjvbPQj1PIWvE0JwZ2PCXg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1253DB64;
	Wed, 26 Feb 2020 15:48:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 02C988681F;
	Wed, 26 Feb 2020 15:48:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EE4C1803C37;
	Wed, 26 Feb 2020 15:48:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01QFmo7m014440 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Feb 2020 10:48:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B4DA45C241; Wed, 26 Feb 2020 15:48:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-223.ams2.redhat.com [10.36.116.223])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C897166835
	for <cluster-devel@redhat.com>; Wed, 26 Feb 2020 15:48:46 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 26 Feb 2020 09:48:41 -0600
Message-Id: <20200226154844.1264672-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/3] Clean up and fix quota data
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

The first patch changes the sequence so that the quota data structure
isn't freed until evict time, rather than at close time. The other two
patches are cleanups that natually follow from the first patch.

Bob Peterson (3):
  gfs2: free quota data struct during evict, not file close
  gfs2: rename gfs2_rsqa_delete to gfs2_rs_delete
  gfs2: eliminate gfs2_rsqa_alloc in favor of gfs2_qa_alloc

 fs/gfs2/acl.c   |  3 ++-
 fs/gfs2/bmap.c  |  4 ++--
 fs/gfs2/file.c  | 10 +++++-----
 fs/gfs2/inode.c | 14 +++++++-------
 fs/gfs2/quota.c | 16 +++-------------
 fs/gfs2/quota.h |  1 -
 fs/gfs2/rgrp.c  | 15 ++-------------
 fs/gfs2/rgrp.h  |  3 +--
 fs/gfs2/super.c |  5 ++++-
 fs/gfs2/xattr.c |  2 +-
 10 files changed, 27 insertions(+), 46 deletions(-)

--=20
2.24.1

