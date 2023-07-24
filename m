Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB9975E7CE
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jul 2023 03:35:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690162513;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yd/1xvOrBRLj5xn2xWDnm+B5ygZn5vDjV6KZaHeCq4E=;
	b=JvyU8AhEDVcM5R2JR3fzSbbAVC9+S3R28wqe3gxDm2fzP3xMUJqwafIpAMul33YH/9voty
	2jVgaKb8GiiWW5P/R88SmAS1AIXdWbRL85WUCfhwdjE1vxicjPnGee6+54oQbrmTTTD38d
	2BZdOk4Mv/pPfuwR3WfNnxhw0KXDQtI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-nGWr4uLmO7maxZ0q1raKRA-1; Sun, 23 Jul 2023 21:35:09 -0400
X-MC-Unique: nGWr4uLmO7maxZ0q1raKRA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD883380670C;
	Mon, 24 Jul 2023 01:35:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0E61492C13;
	Mon, 24 Jul 2023 01:35:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A9E481946594;
	Mon, 24 Jul 2023 01:35:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 04D1F1946588 for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 01:35:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C6062C2C7D3; Mon, 24 Jul 2023 01:35:06 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC827C2C856
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 01:35:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9ED218028B2
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 01:35:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-9vgAZDjNPLa6e5gq0zil6Q-1; Sun, 23 Jul 2023 21:35:03 -0400
X-MC-Unique: 9vgAZDjNPLa6e5gq0zil6Q-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9CA760C7A;
 Mon, 24 Jul 2023 01:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384A9C433C8;
 Mon, 24 Jul 2023 01:35:00 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun, 23 Jul 2023 21:34:41 -0400
Message-Id: <20230724013445.2334326-5-sashal@kernel.org>
In-Reply-To: <20230724013445.2334326-1-sashal@kernel.org>
References: <20230724013445.2334326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.288
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [Cluster-devel] [PATCH AUTOSEL 4.19 5/9] gfs2: Fix possible data
 races in gfs2_show_options()
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
Cc: Sasha Levin <sashal@kernel.org>, Tuo Li <islituo@gmail.com>,
 cluster-devel@redhat.com, BassCheck <bass@buaa.edu.cn>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Tuo Li <islituo@gmail.com>

[ Upstream commit 6fa0a72cbbe45db4ed967a51f9e6f4e3afe61d20 ]

Some fields such as gt_logd_secs of the struct gfs2_tune are accessed
without holding the lock gt_spin in gfs2_show_options():

  val =3D sdp->sd_tune.gt_logd_secs;
  if (val !=3D 30)
    seq_printf(s, ",commit=3D%d", val);

And thus can cause data races when gfs2_show_options() and other functions
such as gfs2_reconfigure() are concurrently executed:

  spin_lock(&gt->gt_spin);
  gt->gt_logd_secs =3D newargs->ar_commit;

To fix these possible data races, the lock sdp->sd_tune.gt_spin is
acquired before accessing the fields of gfs2_tune and released after these
accesses.

Further changes by Andreas:

- Don't hold the spin lock over the seq_printf operations.

Reported-by: BassCheck <bass@buaa.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/gfs2/super.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
index 3cc2237e58967..586d48e3e9129 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1374,7 +1374,14 @@ static int gfs2_show_options(struct seq_file *s, str=
uct dentry *root)
 {
 =09struct gfs2_sbd *sdp =3D root->d_sb->s_fs_info;
 =09struct gfs2_args *args =3D &sdp->sd_args;
-=09int val;
+=09unsigned int logd_secs, statfs_slow, statfs_quantum, quota_quantum;
+
+=09spin_lock(&sdp->sd_tune.gt_spin);
+=09logd_secs =3D sdp->sd_tune.gt_logd_secs;
+=09quota_quantum =3D sdp->sd_tune.gt_quota_quantum;
+=09statfs_quantum =3D sdp->sd_tune.gt_statfs_quantum;
+=09statfs_slow =3D sdp->sd_tune.gt_statfs_slow;
+=09spin_unlock(&sdp->sd_tune.gt_spin);
=20
 =09if (is_ancestor(root, sdp->sd_master_dir))
 =09=09seq_puts(s, ",meta");
@@ -1429,17 +1436,14 @@ static int gfs2_show_options(struct seq_file *s, st=
ruct dentry *root)
 =09}
 =09if (args->ar_discard)
 =09=09seq_puts(s, ",discard");
-=09val =3D sdp->sd_tune.gt_logd_secs;
-=09if (val !=3D 30)
-=09=09seq_printf(s, ",commit=3D%d", val);
-=09val =3D sdp->sd_tune.gt_statfs_quantum;
-=09if (val !=3D 30)
-=09=09seq_printf(s, ",statfs_quantum=3D%d", val);
-=09else if (sdp->sd_tune.gt_statfs_slow)
+=09if (logd_secs !=3D 30)
+=09=09seq_printf(s, ",commit=3D%d", logd_secs);
+=09if (statfs_quantum !=3D 30)
+=09=09seq_printf(s, ",statfs_quantum=3D%d", statfs_quantum);
+=09else if (statfs_slow)
 =09=09seq_puts(s, ",statfs_quantum=3D0");
-=09val =3D sdp->sd_tune.gt_quota_quantum;
-=09if (val !=3D 60)
-=09=09seq_printf(s, ",quota_quantum=3D%d", val);
+=09if (quota_quantum !=3D 60)
+=09=09seq_printf(s, ",quota_quantum=3D%d", quota_quantum);
 =09if (args->ar_statfs_percent)
 =09=09seq_printf(s, ",statfs_percent=3D%d", args->ar_statfs_percent);
 =09if (args->ar_errors !=3D GFS2_ERRORS_DEFAULT) {
--=20
2.39.2

