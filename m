Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCAA560760
	for <lists+cluster-devel@lfdr.de>; Wed, 29 Jun 2022 19:31:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656523905;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OAdNCWBhFUS7ma7dl07a1mKGkLDnvewaZ3tLiSm2eA0=;
	b=aOkxkmn/5jNE8wdvSIwDPTCrzZp54LAmKNDSZsM0t1lxmqVv1cYETtkHwv/iOcypefb+Yi
	+VqIET4YoPkJpMlLgZlHNvCQ3G68GV1D006ewWB11i+GVnI2M81fCpo+C1qPK+8IWDd+12
	yTanOrHLS1x3LOeJtYsWQlJnW7+0XyM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-_Wz0UplYMk6Vy-QHQp6NEA-1; Wed, 29 Jun 2022 13:31:42 -0400
X-MC-Unique: _Wz0UplYMk6Vy-QHQp6NEA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48A9E1C01B4C;
	Wed, 29 Jun 2022 17:31:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3AE63492C3B;
	Wed, 29 Jun 2022 17:31:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B1FF3194706C;
	Wed, 29 Jun 2022 17:31:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1BE0B194705B for <cluster-devel@listman.corp.redhat.com>;
 Wed, 29 Jun 2022 16:37:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F29DC492CA5; Wed, 29 Jun 2022 16:37:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.localdomain (unknown [10.40.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F68B492C3B;
 Wed, 29 Jun 2022 16:37:12 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Wed, 29 Jun 2022 18:37:02 +0200
Message-Id: <20220629163711.732931-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [Cluster-devel] [PATCH 0/9] gfs2: glock instantiation and holder
 auto-demotion fixes
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

So far, glocks were instantiated inside of do_promote() as part of the
glock state engine logic.  This code can be moved outside the state
engine, which simplifies things significantly.  We no longer need to
release and re-acquire the glock spin lock in do_promote(), so the glock
holder we're trying to instantiate can no longer go away under us by
accident.  (Function do_promote() isn't always run in process context.)

To facilitate that, first fix and clean up gfs2_glock_async_wait() to
take advantage of the fact that canceling glock operations now works
properly.

With the above changes in place, split off a new go_held() glock
operation for actions to be performed whenever a new holder for a glock
is granted:  some of the actions carried out by inode_go_instantiate()
are meant to be carried out repeatedly, so move those over to the new
inode_go_held() handler.

Finally, Bob has found the remaining bug in the glock holder
auto-demotion feature we've disabled for 5.18; fix that and re-enable
the feature.

Thanks,
Andreas

Andreas Gruenbacher (8):
  gfs2: Fix up gfs2_glock_async_wait
  gfs2: Instantiate glocks ouside of glock state engine
  gfs2: Revert 'Fix "truncate in progress" hang'
  gfs2: Add new go_held glock operation
  gfs2: Make go_instantiate take a glock
  gfs2: Use better variable name
  gfs2: List traversal in do_promote is safe
  Revert "gfs2: Stop using glock holder auto-demotion for now"

Bob Peterson (1):
  gfs2: do_promote glock holder stealing fix

 fs/gfs2/file.c       |  46 +++++++----
 fs/gfs2/glock.c      | 187 +++++++++++++++++--------------------------
 fs/gfs2/glock.h      |   2 +-
 fs/gfs2/glops.c      |  31 ++++---
 fs/gfs2/incore.h     |   6 +-
 fs/gfs2/main.c       |   1 -
 fs/gfs2/ops_fstype.c |   2 -
 fs/gfs2/quota.c      |  28 +------
 fs/gfs2/rgrp.c       |   3 +-
 fs/gfs2/rgrp.h       |   2 +-
 fs/gfs2/super.c      |   2 +-
 11 files changed, 126 insertions(+), 184 deletions(-)

-- 
2.35.1

