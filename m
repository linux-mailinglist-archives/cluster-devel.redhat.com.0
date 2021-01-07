Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id E91582ED0F6
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Jan 2021 14:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610026977;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LmLbKuX150Mafpj/tCIfdzDUHpq5vjVPk3Yv2NMVFI8=;
	b=Ikn2LjzRH3uAlixb/C23NIMYdejxKi/Hr9lw/9jzCy2Mi8zRMdh+rqLWak53Nz9Jd19vmo
	DfVE3UnRKxvxI/s5zcajdqSj9zTs5Oudu3jeOq7QFVy0Ai3HB0cFAMxLQMzoU9NOy93BDF
	fjZbtLGU3fkrfFqJQ7vbhNnOUAKwBHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-Z9ug4JcKN5WVG6yj9SWzrQ-1; Thu, 07 Jan 2021 08:42:55 -0500
X-MC-Unique: Z9ug4JcKN5WVG6yj9SWzrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D48C10054FF;
	Thu,  7 Jan 2021 13:42:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 985775D9DC;
	Thu,  7 Jan 2021 13:42:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C6974BB7B;
	Thu,  7 Jan 2021 13:42:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 107DgkmB028877 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 7 Jan 2021 08:42:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A956419809; Thu,  7 Jan 2021 13:42:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03C06197FA
	for <cluster-devel@redhat.com>; Thu,  7 Jan 2021 13:42:42 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  7 Jan 2021 13:42:37 +0000
Message-Id: <20210107134240.386547-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 0/3] gfs2-utils: New fs format version
	support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

This patch set prepares gfs2-utils for supporting fs format 1802, which is intended to enable trusted.* xattrs and enable rgrplvb by default. mkfs.gfs2 still creates filesystems with format 1801 by default.

Andrew Price (3):
  mkfs.gfs2: Add extended option for specifying format version
  fsck.gfs2: Enable checking of format 1802
  tunegfs2: Add support for fs format versions

 gfs2/fsck/fsck.h          |  2 +-
 gfs2/fsck/initialize.c    |  2 +-
 gfs2/fsck/pass1.c         | 12 ++++++++++--
 gfs2/libgfs2/libgfs2.h    |  6 +++++-
 gfs2/libgfs2/structures.c |  4 ++--
 gfs2/man/mkfs.gfs2.8      |  3 +++
 gfs2/man/tunegfs2.8       |  5 +++++
 gfs2/mkfs/main_mkfs.c     | 26 +++++++++++++++++++++++++-
 gfs2/tune/Makefile.am     |  3 ++-
 gfs2/tune/main.c          | 18 +++++++++++++-----
 gfs2/tune/super.c         | 20 ++++++++++++++++++++
 gfs2/tune/tunegfs2.h      |  5 +++--
 tests/Makefile.am         |  3 ++-
 tests/fsck.at             |  4 +++-
 tests/mkfs.at             | 10 ++++++++++
 tests/testsuite.at        |  1 +
 tests/tune.at             | 17 +++++++++++++++++
 17 files changed, 123 insertions(+), 18 deletions(-)
 create mode 100644 tests/tune.at

-- 
2.29.2

