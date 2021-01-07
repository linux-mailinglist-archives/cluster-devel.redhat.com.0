Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4592ED118
	for <lists+cluster-devel@lfdr.de>; Thu,  7 Jan 2021 14:46:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610027190;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=69IulsVyHoVc92RE0pJG14qP8bOOaM/uoDNcBBZPXFo=;
	b=IzbkQdVXrMeunjJ8Hno9+0FAruwm8nps2yEsY55jlrvXJfBHH23REp+ONsPoQOhQMz0oQg
	YyLndgkBmcJqBSX+6Wd0mi4BbeDZO9wAPJRA31jbjMFnbCn10AKUrITtK3uEp4BEzHB9/0
	njo1cf6Ln+b7uKW5vdWwNlCUlkPs2vQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-kQLL17LEOgehz0DJFBsYxw-1; Thu, 07 Jan 2021 08:46:28 -0500
X-MC-Unique: kQLL17LEOgehz0DJFBsYxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C80EB59;
	Thu,  7 Jan 2021 13:46:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 862861803E;
	Thu,  7 Jan 2021 13:46:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 424884BB7B;
	Thu,  7 Jan 2021 13:46:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 107DkNOG029156 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 7 Jan 2021 08:46:23 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 96E365D9DD; Thu,  7 Jan 2021 13:46:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.redhat.com (unknown [10.33.37.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83A375D9DC
	for <cluster-devel@redhat.com>; Thu,  7 Jan 2021 13:46:19 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Thu,  7 Jan 2021 13:46:14 +0000
Message-Id: <20210107134616.386755-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [RFC PATCH 0/2] gfs2: Format 1802 patches
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

These are the kernel patches I've been using to verify gfs2-utils support for the 1802 fs format.

Andy

Andreas Gruenbacher (1):
  gfs2: Add trusted xattr support

Andrew Price (1):
  gfs2: Enable rgrplvb for sb_fs_format 1802

 fs/gfs2/incore.h                 |  1 +
 fs/gfs2/ops_fstype.c             | 27 +++++++++++++++---
 fs/gfs2/super.h                  |  8 +++++-
 fs/gfs2/xattr.c                  | 48 +++++++++++++++++++++++++++++---
 include/uapi/linux/gfs2_ondisk.h |  5 ++--
 5 files changed, 78 insertions(+), 11 deletions(-)

-- 
2.29.2

