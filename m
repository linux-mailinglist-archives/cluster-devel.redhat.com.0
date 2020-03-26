Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 7413719469A
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Mar 2020 19:36:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585247779;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XZmpp4rn4JYtQzCTbRQkr0+XDUAuVpMdp4OtLYJnocU=;
	b=ijoG9V/v6w2Okbbm8cYZUTggvb8Y1tH7FaTauENRxxIMlU7pPoIG2HqzeknbPWrwdI7wD2
	LkpEShPucGU2iIoTFISfCMAdlTuOY5Y1rbaazf65mpWL4BwIK5Rw7cNmSO7laTLM3W9Jxv
	5LgqNL9Soq8VPzgL9su6nUwxBKdwBAE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-0ogbE4tvMvC-jjgIb7Em4g-1; Thu, 26 Mar 2020 14:36:18 -0400
X-MC-Unique: 0ogbE4tvMvC-jjgIb7Em4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87774100551A;
	Thu, 26 Mar 2020 18:36:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 586BA5C1BA;
	Thu, 26 Mar 2020 18:36:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24BCE8A03F;
	Thu, 26 Mar 2020 18:36:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02QIa7jn004740 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 14:36:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 583BE7E311; Thu, 26 Mar 2020 18:36:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF9935C1BA
	for <cluster-devel@redhat.com>; Thu, 26 Mar 2020 18:36:03 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 26 Mar 2020 13:35:59 -0500
Message-Id: <20200326183603.123323-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/4 v5] Clean up and fix quota data
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

This is version 5, which implements more of Andreas's suggestions and
fixes up a bug or two, plus some patches written by Andreas.

Andreas Gruenbacher (2):
  gfs2: Split gfs2_rsqa_delete into gfs2_rs_delete and gfs2_qa_put
  gfs2: Remove unnecessary gfs2_qa_{get,put} pairs

Bob Peterson (2):
  gfs2: eliminate gfs2_rsqa_alloc in favor of gfs2_qa_alloc
  gfs2: Change inode qa_data to allow multiple users

 fs/gfs2/acl.c    |  7 ++++--
 fs/gfs2/bmap.c   |  5 ++--
 fs/gfs2/file.c   | 43 +++++++++++++--------------------
 fs/gfs2/incore.h |  1 +
 fs/gfs2/inode.c  | 35 ++++++++++++++++-----------
 fs/gfs2/quota.c  | 63 +++++++++++++++++++++++++++++-------------------
 fs/gfs2/quota.h  |  4 +--
 fs/gfs2/rgrp.c   | 15 ++----------
 fs/gfs2/rgrp.h   |  3 +--
 fs/gfs2/super.c  |  5 +++-
 fs/gfs2/xattr.c  | 12 ++++++---
 11 files changed, 102 insertions(+), 91 deletions(-)

--=20
2.25.1

