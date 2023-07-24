Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 477DC75E85C
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Jul 2023 03:40:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690162840;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JimJewgqE0aaPUcBwd4gmvkneccYic8SMLU1sDkrfiU=;
	b=JGa/x6hGVUkkZIU21opHmoWxBcy3utWVdAFzIjui8FRN4pclz7mgx6ESFMjhxGxS8KcWf/
	19N4BNXgzkyvpFLwxuAqoTl1m83I2rnDnZY2ZAvQgQlWCM4o5GTyKC9Uh2gyL/876jbdpx
	ckQo77XAcZ0GEoikDTIgLFg9nmmX7TA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-yxHySQ6ROt2p45bqENWc3Q-1; Sun, 23 Jul 2023 21:40:35 -0400
X-MC-Unique: yxHySQ6ROt2p45bqENWc3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7ECD08008A4;
	Mon, 24 Jul 2023 01:40:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72588200BA73;
	Mon, 24 Jul 2023 01:40:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 26F4019465A8;
	Mon, 24 Jul 2023 01:40:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 10B9C194658D for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Jul 2023 01:40:00 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ED7E3400F1F; Mon, 24 Jul 2023 01:39:59 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E507C492CAC
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 01:39:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5481800B35
 for <cluster-devel@redhat.com>; Mon, 24 Jul 2023 01:39:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-tkKEDyjhMnCEhDOgz7nDsQ-1; Sun, 23 Jul 2023 21:39:58 -0400
X-MC-Unique: tkKEDyjhMnCEhDOgz7nDsQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3748260FA0;
 Mon, 24 Jul 2023 01:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA450C433C9;
 Mon, 24 Jul 2023 01:32:01 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sun, 23 Jul 2023 21:31:15 -0400
Message-Id: <20230724013140.2327815-15-sashal@kernel.org>
In-Reply-To: <20230724013140.2327815-1-sashal@kernel.org>
References: <20230724013140.2327815-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.5
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Cluster-devel] [PATCH AUTOSEL 6.4 15/40] gfs2: Fix possible data
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
index a84bf6444bba9..204ba7f8417e6 100644
--- a/fs/gfs2/super.c
+++ b/fs/gfs2/super.c
@@ -1004,7 +1004,14 @@ static int gfs2_show_options(struct seq_file *s, str=
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
@@ -1059,17 +1066,14 @@ static int gfs2_show_options(struct seq_file *s, st=
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

