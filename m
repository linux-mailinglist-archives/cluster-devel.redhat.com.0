Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id A53E2146839
	for <lists+cluster-devel@lfdr.de>; Thu, 23 Jan 2020 13:42:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579783363;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oRbNtSCIG6uWnbAkf6Sf55xyKWz8SvV3C2OjMFAiLb0=;
	b=WObgjtjVhGMw2ksOT8ymJXXMjZyQmqlelSzbfBoQO3hrGwTJgcSwsk4ALX6BixgzlEdf4j
	JcPjJMl2PjwxpqrZ7VlPhQY8onhDz4dxdK+x3sTiHaMYeYSpC13uHrsjV0hgb2pmlnI4S8
	PIFii8QLDCu+a7oMQXsl+PD6lKzKnI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-cWqbz5apPa-aUCe3rzakPA-1; Thu, 23 Jan 2020 07:42:41 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 08F20DB25;
	Thu, 23 Jan 2020 12:42:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03EA186C54;
	Thu, 23 Jan 2020 12:42:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60A3185943;
	Thu, 23 Jan 2020 12:42:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NCfTlp028575 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 07:41:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 84670399; Thu, 23 Jan 2020 12:41:29 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from max.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD67719C69;
	Thu, 23 Jan 2020 12:41:26 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: cluster-devel@redhat.com
Date: Thu, 23 Jan 2020 13:41:24 +0100
Message-Id: <20200123124124.28741-1-agruenba@redhat.com>
In-Reply-To: <20200120091305.24997-9-agruenba@redhat.com>
References: <20200120091305.24997-9-agruenba@redhat.com>
	<20200120091305.24997-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH 08/11] gfs2: Move inode generation
	number check into gfs2_inode_lookup
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
X-MC-Unique: cWqbz5apPa-aUCe3rzakPA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

As it turns out, this patch needs the following fix.

Thanks,
Andreas

diff --git b/fs/gfs2/inode.c a/fs/gfs2/inode.c
index e12e694a1bbb..9c06680c798f 100644
--- b/fs/gfs2/inode.c
+++ a/fs/gfs2/inode.c
@@ -202,8 +202,12 @@ struct inode *gfs2_inode_lookup(struct super_block *sb=
, unsigned int type,
=20
 =09error =3D -ESTALE;
 =09if (no_formal_ino && ip->i_no_formal_ino &&
-=09    no_formal_ino !=3D ip->i_no_formal_ino)
-=09=09goto fail_refresh;
+=09    no_formal_ino !=3D ip->i_no_formal_ino) {
+=09=09if (inode->i_state & I_NEW)
+=09=09=09goto fail_refresh;
+=09=09iput(inode);
+=09=09return ERR_PTR(error);
+=09}
=20
 =09if (inode->i_state & I_NEW)
 =09=09unlock_new_inode(inode);

