Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9BAFBABE
	for <lists+cluster-devel@lfdr.de>; Wed, 13 Nov 2019 22:30:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573680646;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+AvJPoe31bacOzqXmhjz2acApyollp7gEKr2tOH2JmE=;
	b=cS4qRAcZVUf+RNApxuLk+EC06N7aSa7CaAgbBNBanhRSVcr64IdNCzbvN5vsevyhoxRQBw
	DDZLCNV78l+K+R/nuLy+5oLfGuwMFx1oBU8Zxbya00vfrNmRORnQ7X75eC18ocTdBXIjLC
	LN6GXii4CmsdatjpTxoRVxXZ7pXT2wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-Vcjf6mg2PpOtE6__Gnf69Q-1; Wed, 13 Nov 2019 16:30:44 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17E9EDBF9;
	Wed, 13 Nov 2019 21:30:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 043F06A505;
	Wed, 13 Nov 2019 21:30:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E0CBA4E567;
	Wed, 13 Nov 2019 21:30:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xADLUcsG005264 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 13 Nov 2019 16:30:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9469F6973C; Wed, 13 Nov 2019 21:30:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-116-140.phx2.redhat.com [10.3.116.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6102A5C1BB
	for <cluster-devel@redhat.com>; Wed, 13 Nov 2019 21:30:38 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Wed, 13 Nov 2019 15:30:10 -0600
Message-Id: <20191113213030.237431-13-rpeterso@redhat.com>
In-Reply-To: <20191113213030.237431-1-rpeterso@redhat.com>
References: <20191113213030.237431-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [PATCH 12/32] gfs2: Don't write log headers after
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Vcjf6mg2PpOtE6__Gnf69Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

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
index e8b1a7a2341b..735291a93e1a 100644
--- a/fs/gfs2/log.c
+++ b/fs/gfs2/log.c
@@ -692,12 +692,16 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, stru=
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
@@ -750,6 +754,7 @@ void gfs2_write_log_header(struct gfs2_sbd *sdp, struct=
 gfs2_jdesc *jd,
=20
 =09gfs2_log_write(sdp, page, sb->s_blocksize, 0, dblock);
 =09gfs2_log_submit_bio(&sdp->sd_log_bio, REQ_OP_WRITE | op_flags);
+out:
 =09log_flush_wait(sdp);
 }
=20
--=20
2.23.0

