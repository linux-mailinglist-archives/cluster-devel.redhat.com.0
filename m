Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F00706F7487
	for <lists+cluster-devel@lfdr.de>; Thu,  4 May 2023 21:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683229882;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gyj+89mi9JAwFPh4RgCZEyUZHiDP5G9KGPhz1m57Bns=;
	b=Oi6/AzkyUuC7rcrcX/0kQXayjepyNW9/+82iIBiWlILf3RIWnERLCIlZgL2nhzcLmC9HeG
	4iMSjtI3MWaO3R17aSENG2VsbOnIOh2AQ7xw+ytUMJRMjGhPBaSC8kn7t2MvsbSm3s6jd8
	qaFtOID2+4+2iTbxMGpxyotU1/dcNbw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-5mS3IGq8OiGtinm6i3-n0g-1; Thu, 04 May 2023 15:51:18 -0400
X-MC-Unique: 5mS3IGq8OiGtinm6i3-n0g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA1D0185A7A4;
	Thu,  4 May 2023 19:51:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DE37910DF8;
	Thu,  4 May 2023 19:51:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 96DD91946A47;
	Thu,  4 May 2023 19:51:17 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0946D19465BB for <cluster-devel@listman.corp.redhat.com>;
 Thu,  4 May 2023 19:51:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DDEC463F5F; Thu,  4 May 2023 19:51:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6E5663F3E
 for <cluster-devel@redhat.com>; Thu,  4 May 2023 19:51:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B32A3813F2F
 for <cluster-devel@redhat.com>; Thu,  4 May 2023 19:51:16 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-19-IcWe-GKtMUqYFfMxodlggg-1; Thu, 04 May 2023 15:51:12 -0400
X-MC-Unique: IcWe-GKtMUqYFfMxodlggg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 05E3663879;
 Thu,  4 May 2023 19:51:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4409C43444;
 Thu,  4 May 2023 19:51:09 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  4 May 2023 15:50:32 -0400
Message-Id: <20230504195042.3808716-10-sashal@kernel.org>
In-Reply-To: <20230504195042.3808716-1-sashal@kernel.org>
References: <20230504195042.3808716-1-sashal@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [Cluster-devel] [PATCH AUTOSEL 5.4 10/18] gfs2: Fix inode height
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
index 69106a1545fad..092223a8b1201 100644
--- a/fs/gfs2/glops.c
+++ b/fs/gfs2/glops.c
@@ -362,6 +362,7 @@ static int inode_go_demote_ok(const struct gfs2_glock *=
gl)
=20
 static int gfs2_dinode_in(struct gfs2_inode *ip, const void *buf)
 {
+=09struct gfs2_sbd *sdp =3D GFS2_SB(&ip->i_inode);
 =09const struct gfs2_dinode *str =3D buf;
 =09struct timespec64 atime;
 =09u16 height, depth;
@@ -401,7 +402,7 @@ static int gfs2_dinode_in(struct gfs2_inode *ip, const =
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

