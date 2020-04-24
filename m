Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 342461B7C9F
	for <lists+cluster-devel@lfdr.de>; Fri, 24 Apr 2020 19:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587749107;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n8S7VUo1P8970KQDRFZ51kmKbMECoUA0gzmep/mDAVM=;
	b=fj6d7t9H9updQ0FxzMbMqrvFzDIG0mfBfBlSeNkyCW3V3mnD9v6ux9QEjO3+45YLYtTtCi
	rRindeoNZBztgoPSNZZZw1LwLmz/IUBSY3QeEn1bYdJjatADSlIgDe5mNcUi+pqjpyRhiL
	nNn9FinvVRog5SeT/4amKAym+GqwP6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-h1n8U2p1N1m-1nBw7YOrGg-1; Fri, 24 Apr 2020 13:25:05 -0400
X-MC-Unique: h1n8U2p1N1m-1nBw7YOrGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38A10800D24;
	Fri, 24 Apr 2020 17:25:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ECA221EF8;
	Fri, 24 Apr 2020 17:25:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9924B4CAAE;
	Fri, 24 Apr 2020 17:25:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OHOvY2020683 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 13:24:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8875C9080; Fri, 24 Apr 2020 17:24:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-238.phx2.redhat.com [10.3.112.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3E26319632;
	Fri, 24 Apr 2020 17:24:57 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Date: Fri, 24 Apr 2020 12:24:53 -0500
Message-Id: <20200424172456.616586-2-rpeterso@redhat.com>
In-Reply-To: <20200424172456.616586-1-rpeterso@redhat.com>
References: <20200424172456.616586-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 1/4] gfs2: fix withdraw sequence
	deadlock
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

After a gfs2 file system withdraw, any attempt to read metadata is
automatically rejected by function gfs2_meta_read() except for reads
of the journal inode. This turns out to be a problem because function
signal_our_withdraw() repeatedly calls check_journal_clean() which reads
the metadata (both its dinode and indirect blocks) to see if the entire
journal is mapped. The dinode read works, but reading the indirect blocks
returns -EIO which gets sent back up and causes a consistency error.
This results in withdraw-from-withdraw, which becomes a deadlock.

This patch changes the test in gfs2_meta_read() to allow all metadata
reads for the journal. Instead of checking the journal block, it now
checks for the journal inode glock which is the same for all blocks in
the journal. This allows check_journal_clean() to properly check the
journal without trying to withdraw recursively.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/meta_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/meta_io.c b/fs/gfs2/meta_io.c
index 4b72abcf83b2..9856cc2e0795 100644
--- a/fs/gfs2/meta_io.c
+++ b/fs/gfs2/meta_io.c
@@ -252,7 +252,7 @@ int gfs2_meta_read(struct gfs2_glock *gl, u64 blkno, in=
t flags,
 =09int num =3D 0;
=20
 =09if (unlikely(gfs2_withdrawn(sdp)) &&
-=09    (!sdp->sd_jdesc || (blkno !=3D sdp->sd_jdesc->jd_no_addr))) {
+=09    (!sdp->sd_jdesc || gl !=3D sdp->sd_jinode_gl)) {
 =09=09*bhp =3D NULL;
 =09=09return -EIO;
 =09}
--=20
2.25.1

