Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D25E97524C1
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 16:13:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689257634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SDcWO+WcJ36t/6eJX0IYkz7/yw2/iEyh7Rt/9ysYQ/8=;
	b=eimH1+bgEnfaF3QEDX8oDm9j9A4EJQtoY9JrbOV8Q03XRoQ7AXEGCdngOwyH2DWgr0BphJ
	xBRbw5jY51bdLGQC1/+VWdAsJCvnjLIWD4Jb/17KtzNXMjt2ngekMv67emm/qChGCBk6Dd
	3qA2xlujPtKjosDFWRCzGK+5FbelrTI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-259-Af4da4HtMtmlpDVeUBUMoA-1; Thu, 13 Jul 2023 10:13:21 -0400
X-MC-Unique: Af4da4HtMtmlpDVeUBUMoA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EE2138210A1;
	Thu, 13 Jul 2023 14:08:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32F7E4CD0C6;
	Thu, 13 Jul 2023 14:08:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EEBC01930E27;
	Thu, 13 Jul 2023 14:06:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E9D4E1946589 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 13:52:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 925992166B27; Thu, 13 Jul 2023 13:52:58 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A61E2166B26
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 13:52:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6CA6C185A791
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 13:52:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-52XkcpE6OfejgUhxnb42kw-1; Thu, 13 Jul 2023 09:52:52 -0400
X-MC-Unique: 52XkcpE6OfejgUhxnb42kw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01AFF61488;
 Thu, 13 Jul 2023 13:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3534C433C8;
 Thu, 13 Jul 2023 13:52:50 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: brauner@kernel.org, Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 13 Jul 2023 09:52:48 -0400
Message-ID: <20230713135249.153796-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [Cluster-devel] [PATCH] gfs2: fix timestamp handling on quota inodes
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
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

While these aren't generally visible from userland, it's best to be
consistent with timestamp handling. When adjusting the quota, update the
mtime and ctime like we would with a write operation on any other inode,
and avoid updating the atime which should only be done for reads.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/gfs2/quota.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Christian,

Would you mind picking this into the vfs.ctime branch, assuming the GFS2
maintainers ack it? Andreas and I had discussed this privately, and I
think it makes sense as part of that series.

Thanks,
Jeff

diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
index 704192b73605..aa5fd06d47bc 100644
--- a/fs/gfs2/quota.c
+++ b/fs/gfs2/quota.c
@@ -871,7 +871,7 @@ static int gfs2_adjust_quota(struct gfs2_inode *ip, lof=
f_t loc,
 =09=09size =3D loc + sizeof(struct gfs2_quota);
 =09=09if (size > inode->i_size)
 =09=09=09i_size_write(inode, size);
-=09=09inode->i_mtime =3D inode->i_atime =3D current_time(inode);
+=09=09inode->i_mtime =3D inode_set_ctime_current(inode);
 =09=09mark_inode_dirty(inode);
 =09=09set_bit(QDF_REFRESH, &qd->qd_flags);
 =09}
--=20
2.41.0

