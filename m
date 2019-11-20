Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED77103C9B
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Nov 2019 14:53:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574258011;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=z7d/4HrOBPrUsOsLJAUZWReVnFyylbzU0UNcQR7y3/o=;
	b=PxCzjt18AXRz9b05yGcFPPCmEzoBoygbEvpQjXU0o9Pgr4U4Cd3BA1O7HenaTmbqMS+1yI
	3cp1fTsUI3ZgUTmH1jg6SLP/fAydDTtIMfw0Y+1xch3fDrOHBI0A+grkycUofahbTJQ7bn
	4YYECcqqqLuZ18sLL2r7/mPCkXXbEGM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-Xk6YQjlZOFaUdCt908ZeSA-1; Wed, 20 Nov 2019 08:53:30 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3E028026A9;
	Wed, 20 Nov 2019 13:53:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC68F67E40;
	Wed, 20 Nov 2019 13:53:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C0481819ACE;
	Wed, 20 Nov 2019 13:53:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAKDrJJP002420 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 20 Nov 2019 08:53:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E1F7D65F6A; Wed, 20 Nov 2019 13:53:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB06E51F1E
	for <cluster-devel@redhat.com>; Wed, 20 Nov 2019 13:53:15 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 009234BB5B
	for <cluster-devel@redhat.com>; Wed, 20 Nov 2019 13:53:14 +0000 (UTC)
Date: Wed, 20 Nov 2019 08:53:14 -0500 (EST)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Message-ID: <107211449.35690135.1574257994946.JavaMail.zimbra@redhat.com>
In-Reply-To: <501115369.35690105.1574257982295.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.3.116.60, 10.4.195.26]
Thread-Topic: gfs2: Don't write log headers after file system withdraw
Thread-Index: sJtmKHg05qdFw1MfnMzB3lyxkp0bhw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH] gfs2: Don't write log headers after
 file system withdraw
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
X-MC-Unique: Xk6YQjlZOFaUdCt908ZeSA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Before this patch, when a node withdrew a gfs2 file system, it
wrote a (clean) unmount log header. That's wrong. You don't want
to write anything to the journal once you're withdrawn because
that's acknowledging that the transaction is complete and the
journal is in good shape, neither of which may be a valid
assumption when the file system is withdrawn. This is especially
true if the withdraw was caused due to io errors writing to the
journal in the first place. The best course of action is to leave
the journal "as is" until it may be safely replayed during
journal recovery, regardless of whether it's done by this node or
another.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/log.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
index 72c8f30b1822..eb3f2e7b8085 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -693,12 +693,16 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, stru=
ct gfs2_jdesc *jd,
 {
 =09struct gfs2_log_header *lh;
 =09u32 hash, crc;
-=09struct page *page =3D mempool_alloc(gfs2_page_pool, GFP_NOIO);
+=09struct page *page;
 =09struct gfs2_statfs_change_host *l_sc =3D &sdp->sd_statfs_local;
 =09struct timespec64 tv;
 =09struct super_block *sb =3D sdp->sd_vfs;
 =09u64 dblock;
=20
+=09if (gfs2_withdrawn(sdp))
+=09=09goto out;
+
+=09page =3D mempool_alloc(gfs2_page_pool, GFP_NOIO);
 =09lh =3D page_address(page);
 =09clear_page(lh);
=20
@@ -751,6 +755,7 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct=
 gfs2_jdesc *jd,
=20
 =09gfs2_log_write(sdp, page, sb->s_blocksize, 0, dblock);
 =09gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE | op_flags);
+out:
 =09log_flush_wait(sdp);
 }
=20

