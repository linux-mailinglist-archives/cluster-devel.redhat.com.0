Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id CAF9A1946B0
	for <lists+cluster-devel@lfdr.de>; Thu, 26 Mar 2020 19:40:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585248030;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fSJfxmWCkd29FTtYSy3GSiXMfa43eVbfi9usnyHokzA=;
	b=YNiZU9Z6Tzsh/L2WizgrH3+7XwjtHv49r3cQ14f45AvEo2cljIzV0cEne95lmBLhrUW1tQ
	wDBaDm749CCmLJubqNcApB8oaMvVsiHuU39GQYoFX1yk7rz0oUnBTGQ2Rv3tSyZCbHWsr/
	TmeviqaoqJYRNyQISW2YrY9hdThsjY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-fV_DFphRPsaUfa7pBjcYEw-1; Thu, 26 Mar 2020 14:40:29 -0400
X-MC-Unique: fV_DFphRPsaUfa7pBjcYEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACECB19251A2;
	Thu, 26 Mar 2020 18:40:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 975515C1D4;
	Thu, 26 Mar 2020 18:40:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4313B8A042;
	Thu, 26 Mar 2020 18:40:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02QIeOjq005015 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 14:40:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 930965C1BA; Thu, 26 Mar 2020 18:40:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20E6092F8F
	for <cluster-devel@redhat.com>; Thu, 26 Mar 2020 18:40:21 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Thu, 26 Mar 2020 13:40:15 -0500
Message-Id: <20200326184020.123544-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 0/5] gfs2; jdata io deadlocks
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

This patch set addresses several problems I encountered while testing write=
s
to journaled data (jdata) files.

Bob Peterson (5):
  gfs2: don't lock sd_log_flush_lock in try_rgrp_unlink
  gfs2: instrumentation wrt ail1 stuck
  gfs2: change from write to read lock for sd_log_flush_lock in journal
    replay
  gfs2: special log flush sequence to protect jdata writes
  gfs2: implement special transaction type for jdata sync writes

 fs/gfs2/aops.c       |  25 ++++++--
 fs/gfs2/glops.c      |   2 +-
 fs/gfs2/incore.h     |   1 +
 fs/gfs2/log.c        | 137 +++++++++++++++++++++++++++++++++----------
 fs/gfs2/log.h        |   6 +-
 fs/gfs2/ops_fstype.c |   1 +
 fs/gfs2/recovery.c   |   4 +-
 fs/gfs2/rgrp.c       |   2 -
 fs/gfs2/trans.c      |  39 +++++++++---
 fs/gfs2/trans.h      |   4 ++
 10 files changed, 171 insertions(+), 50 deletions(-)

--=20
2.25.1

