Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CFF0F35DFAE
	for <lists+cluster-devel@lfdr.de>; Tue, 13 Apr 2021 15:06:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618319179;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AMEu7KUGzPJN+ibqWGb9qKXa1qPek5OnCKJcEo4fXDg=;
	b=TRQq8KapFxdCjixvPbrM3/HX7FBmSrxpt6C6Wv9u0eXdyuX9g70z82OTP9xIMGXgcQwkew
	R2xLixZy66CCFyOe99P3ST8r4VW7Uzh1dBswB5d6m5jma9ieuiprwWq0OxQp14bdbY0YzZ
	lKD53baREWik9lYIPdc1wfiEGMPVuKE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-OmYKn3m-PKG5_eoGQ6YBfA-1; Tue, 13 Apr 2021 09:06:18 -0400
X-MC-Unique: OmYKn3m-PKG5_eoGQ6YBfA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ECB180D6AA;
	Tue, 13 Apr 2021 13:06:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F54C5D9CA;
	Tue, 13 Apr 2021 13:06:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EB8844A60;
	Tue, 13 Apr 2021 13:06:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13DD68BF031029 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 13 Apr 2021 09:06:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD3601057FD2; Tue, 13 Apr 2021 13:06:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from cicero.cable.virginm.net (unknown [10.33.36.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 891041042A9C
	for <cluster-devel@redhat.com>; Tue, 13 Apr 2021 13:05:34 +0000 (UTC)
From: Andrew Price <anprice@redhat.com>
To: cluster-devel@redhat.com
Date: Tue, 13 Apr 2021 14:05:27 +0100
Message-Id: <20210413130532.1277163-1-anprice@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 0/5] fsck.gfs2: rindex checking improvements
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
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

These patches improve the rindex checking code in the fetch_rgrps() path and enable 3 more fsck.gfs2 test cases that now pass. There is more work to do in this area but these patches are worthwhile improvements on their own.

Andy

Andrew Price (5):
  fsck.gfs2: Refactor fetch_rgrps()
  fsck.gfs2: Call rindex_read() outside of ri_update()
  fsck.gfs2: Rename ri_update to read_rgrps
  fsck.gfs2: Fix bounds check in find_next_rgrp_dist()
  fsck.gfs2: Improve rindex consistency check

 gfs2/fsck/fsck.h       |  2 +-
 gfs2/fsck/initialize.c | 79 +++++++++++++++++++++++-------------------
 gfs2/fsck/rgrepair.c   |  5 ++-
 tests/fsck.at          | 28 ++++++++++++---
 4 files changed, 71 insertions(+), 43 deletions(-)

-- 
2.30.2

