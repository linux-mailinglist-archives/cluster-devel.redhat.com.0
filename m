Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id BA8E23DBE13
	for <lists+cluster-devel@lfdr.de>; Fri, 30 Jul 2021 20:07:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627668457;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Br4nNyyL1/UhLQt4J2ByzvSxiBd7kwcFAQ6B0fRrO+c=;
	b=dfIZ7u8Wt9edbzJWEGF3zJ+8AWxYWOWzT9zg4CagMp8arapp7kUpdZ1kR8fhkaYRImPsKW
	HGhoukX4/gu6xtPjF8qZcfH5MhHsV1gQzh780Aw4pXKmUsZ3qweCzjNtzFXvOn02KFyFoT
	lvp39PM89WZEJ3yDTq4bZfVEKmo+Cj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-Q3C3rOJMNjSp906J6_v7og-1; Fri, 30 Jul 2021 14:07:36 -0400
X-MC-Unique: Q3C3rOJMNjSp906J6_v7og-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 645A88799EF;
	Fri, 30 Jul 2021 18:07:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 06D9F19C44;
	Fri, 30 Jul 2021 18:07:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0E3B7180BAB1;
	Fri, 30 Jul 2021 18:07:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16UI22Wc020820 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 30 Jul 2021 14:02:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EA12919D9D; Fri, 30 Jul 2021 18:02:02 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-104.phx2.redhat.com [10.3.112.104])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BB33419C44
	for <cluster-devel@redhat.com>; Fri, 30 Jul 2021 18:01:56 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Fri, 30 Jul 2021 13:01:55 -0500
Message-Id: <20210730180155.427336-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH] gfs2: Mark journal inodes as "don't cache"
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Before this patch, journal inodes were considered regular inodes,
which meant that instead of evicting them, function iput_final would
just put them on the lru for later processing. If the file system
withdrew for whatever reason, the withdraw would never be seen until
the inode was evicted, which could be indefinitely.

This patch marks all journal inodes as "don't cache" which means
function iput_final will evict them immediately, allowing us to
properly recover the journal on other cluster nodes.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/ops_fstype.c | 1 +
 fs/gfs2/util.c       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 24ec449c034d..3ddb615c735d 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -614,6 +614,7 @@ static int gfs2_jindex_hold(struct gfs2_sbd *sdp, struct gfs2_holder *ji_gh)
 			break;
 		}
 
+		d_mark_dontcache(jd->jd_inode);
 		spin_lock(&sdp->sd_jindex_spin);
 		jd->jd_jid = sdp->sd_journals++;
 		jip = GFS2_I(jd->jd_inode);
diff --git a/fs/gfs2/util.c b/fs/gfs2/util.c
index 34087bba88ee..cf345a86ef67 100644
--- a/fs/gfs2/util.c
+++ b/fs/gfs2/util.c
@@ -278,6 +278,7 @@ static void signal_our_withdraw(struct gfs2_sbd *sdp)
 		goto skip_recovery;
 	}
 	sdp->sd_jdesc->jd_inode = inode;
+	d_mark_dontcache(inode);
 
 	/*
 	 * Now wait until recovery is complete.
-- 
2.31.1

