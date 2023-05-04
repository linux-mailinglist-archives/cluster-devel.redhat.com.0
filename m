Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F05D26F7443
	for <lists+cluster-devel@lfdr.de>; Thu,  4 May 2023 21:50:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683229820;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uT/ISgUne7Sjht+w6T9uw9NA0iN07+8gZnBefARWXek=;
	b=ckX97zZKvfs2oWaU1VeuFNPgYHazP9IiI6LuhMd1W2MvNrlPOcLKKRltXlxjQt9NUxbL7+
	t2qQtQJ09XjbXyP9vUnAUJMBLo5pbm8xWY+drfRQAcunkI0sU0b46+t67tAM9JkyFTV5jH
	02O6zNLAIfJ2OPYdQAsSYFbzPWzIqNU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-jVLAlX6tNze9Yujkq9GovQ-1; Thu, 04 May 2023 15:50:18 -0400
X-MC-Unique: jVLAlX6tNze9Yujkq9GovQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC41A858F0E;
	Thu,  4 May 2023 19:50:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE59A1121331;
	Thu,  4 May 2023 19:50:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7086E1946A47;
	Thu,  4 May 2023 19:50:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 808FC19465BB for <cluster-devel@listman.corp.redhat.com>;
 Thu,  4 May 2023 19:50:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 644F5492B00; Thu,  4 May 2023 19:50:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CDC5492C3E
 for <cluster-devel@redhat.com>; Thu,  4 May 2023 19:50:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CA02886063
 for <cluster-devel@redhat.com>; Thu,  4 May 2023 19:50:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-Kw1x7mSbOyyIgZoffle7Ug-1; Thu, 04 May 2023 15:50:12 -0400
X-MC-Unique: Kw1x7mSbOyyIgZoffle7Ug-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AC8D663802;
 Thu,  4 May 2023 19:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69765C4339E;
 Thu,  4 May 2023 19:50:10 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  4 May 2023 15:49:25 -0400
Message-Id: <20230504194937.3808414-12-sashal@kernel.org>
In-Reply-To: <20230504194937.3808414-1-sashal@kernel.org>
References: <20230504194937.3808414-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [Cluster-devel] [PATCH AUTOSEL 5.10 12/24] gfs2: Fix inode height
 consistency check
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
Cc: Sasha Levin <sashal@kernel.org>, cluster-devel@redhat.com,
 syzbot+45d4691b1ed3c48eba05@syzkaller.appspotmail.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Andreas Gruenbacher <agruenba@redhat.com>

[ Upstream commit cfcdb5bad34f600aed7613c3c1a5e618111f77b7 ]

The maximum allowed height of an inode's metadata tree depends on the
filesystem block size; it is lower for bigger-block filesystems.  When
reading in an inode, make sure that the height doesn't exceed the
maximum allowed height.

Arrays like sd_heightsize are sized to be big enough for any filesystem
block size; they will often be slightly bigger than what's needed for a
specific filesystem.

Reported-by: syzbot+45d4691b1ed3c48eba05@syzkaller.appspotmail.com
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/glops.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/gfs2/glops.c b/fs/gfs2/glops.c
index db28c240dae35..87f8110884663 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -405,6 +405,7 @@ static int inode_go_demote_ok(const struct gfs2_glock *=
gl)
=20
 static int gfs2_dinode_in(struct gfs2_inode *ip, const void *buf)
 {
+=09struct gfs2_sbd *sdp =3D GFS2_SB(&ip->i_inode);
 =09const struct gfs2_dinode *str =3D buf;
 =09struct timespec64 atime;
 =09u16 height, depth;
@@ -444,7 +445,7 @@ static int gfs2_dinode_in(struct gfs2_inode *ip, const =
void *buf)
 =09/* i_diskflags and i_eattr must be set before gfs2_set_inode_flags() */
 =09gfs2_set_inode_flags(&ip->i_inode);
 =09height =3D be16_to_cpu(str->di_height);
-=09if (unlikely(height > GFS2_MAX_META_HEIGHT))
+=09if (unlikely(height > sdp->sd_max_height))
 =09=09goto corrupt;
 =09ip->i_height =3D (u8)height;
=20
--=20
2.39.2

