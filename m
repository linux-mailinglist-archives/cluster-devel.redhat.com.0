Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 16F9D197D67
	for <lists+cluster-devel@lfdr.de>; Mon, 30 Mar 2020 15:47:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585576021;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ywpxY922RWiBqgAoQmW8MuBziXQm4K6p6VylzRCLybk=;
	b=YSxowdXChx6OiT6WH2AdTJGvsGVzcGR417dMlfBWsM7QN5HpjdKwsFH3tRMswRNU0zneFV
	hUYZJOmXGLDAnWxCvz1X3dskJVnSgQ5Po29Cdc6xxh5yybWvP99ipcA2Lj0s9P267CqqAv
	AR6iTbTpkHU2+iir2scsviXK20X1/8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-F1OAmq15NkWwQDWJ3FsbMA-1; Mon, 30 Mar 2020 09:47:00 -0400
X-MC-Unique: F1OAmq15NkWwQDWJ3FsbMA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A9F319067E1;
	Mon, 30 Mar 2020 13:46:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D66D7660;
	Mon, 30 Mar 2020 13:46:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7CAA944DB;
	Mon, 30 Mar 2020 13:46:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02UDkdiX020570 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 09:46:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EF2015C1A8; Mon, 30 Mar 2020 13:46:39 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from vishnu.redhat.com (ovpn-112-79.phx2.redhat.com [10.3.112.79])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE29148
	for <cluster-devel@redhat.com>; Mon, 30 Mar 2020 13:46:39 +0000 (UTC)
From: Bob Peterson <rpeterso@redhat.com>
To: cluster-devel <cluster-devel@redhat.com>
Date: Mon, 30 Mar 2020 08:46:13 -0500
Message-Id: <20200330134624.259349-29-rpeterso@redhat.com>
In-Reply-To: <20200330134624.259349-1-rpeterso@redhat.com>
References: <20200330134624.259349-1-rpeterso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] [GFS2 PATCH 28/39] gfs2: leaf_dealloc needs to
	allocate one more revoke
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Function leaf_dealloc was not allocating enough journal space for
revokes. Before, it allocated 'l_blocks' revokes, but it needs one
more for the revoke of the dinode that is modified. This patch adds
the needed revoke entry to function leaf_dealloc.

Signed-off-by: Bob Peterson <rpeterso@redhat.com>
---
 fs/gfs2/dir.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/dir.c b/fs/gfs2/dir.c
index c8b62577e2f2..c3f7732415be 100644
--- a/fs/gfs2/dir.c
+++ b/fs/gfs2/dir.c
@@ -2028,7 +2028,8 @@ static int leaf_dealloc(struct gfs2_inode *dip, u32 i=
ndex, u32 len,
=20
 =09error =3D gfs2_trans_begin(sdp,
 =09=09=09rg_blocks + (DIV_ROUND_UP(size, sdp->sd_jbsize) + 1) +
-=09=09=09RES_DINODE + RES_STATFS + RES_QUOTA, l_blocks);
+=09=09=09RES_DINODE + RES_STATFS + RES_QUOTA, RES_DINODE +
+=09=09=09=09 l_blocks);
 =09if (error)
 =09=09goto out_rg_gunlock;
=20
--=20
2.25.1

