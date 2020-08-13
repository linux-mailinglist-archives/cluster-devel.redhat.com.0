Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 86A57243F8E
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Aug 2020 22:01:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597348889;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ys+KPH4WT3quZkFl0x/yTeFfxgko89eB3LyT2FdFPEs=;
	b=SVj277CmDC1QRmhA6Y4K8w0pKTILghbIoKDz6d1zb+3p8dQKLJYPAZL7lmKBvbU1KV8PgG
	zv1chYwKbnNYLdjsi0+RCvs5i99AQ2mj7H29Z2KeD19bFsuJVqkydl/dKJMAPxopInuKIR
	+o4uHunhxoxdwD+InYqVPYCcsmUALFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-zHq8qCxuPGukRbLWSuNuHA-1; Thu, 13 Aug 2020 16:01:27 -0400
X-MC-Unique: zHq8qCxuPGukRbLWSuNuHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B3001008549;
	Thu, 13 Aug 2020 20:01:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B71E7038E;
	Thu, 13 Aug 2020 20:01:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F1394EE16;
	Thu, 13 Aug 2020 20:01:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DK1J08024960 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 16:01:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0028C5D9F3; Thu, 13 Aug 2020 20:01:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from radium.msp.redhat.com (radium.msp.redhat.com [10.15.80.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C63DA5D9D2
	for <cluster-devel@redhat.com>; Thu, 13 Aug 2020 20:01:15 +0000 (UTC)
From: Abhi Das <adas@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 13 Aug 2020 15:01:11 -0500
Message-Id: <20200813200114.5665-1-adas@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 0/3] local statfs improvements
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit

With this patchset, we don't write to the local statfs file
anymore. The local statfs data is written into the journal
and synced to the master statfs file during a log flush or
during recovery.

Abhi Das (3):
  gfs2: Don't write updates to local statfs file
  gfs2: Add fields for statfs info in struct gfs2_log_header_host
  gfs2: Recover statfs info in journal head

 fs/gfs2/incore.h   |   4 ++
 fs/gfs2/lops.c     |  12 ++++-
 fs/gfs2/lops.h     |   1 +
 fs/gfs2/recovery.c | 125 +++++++++++++++++++++++++++++++++++++++++++++
 fs/gfs2/super.c    |   2 +-
 fs/gfs2/super.h    |   2 +
 6 files changed, 143 insertions(+), 3 deletions(-)

-- 
2.20.1

