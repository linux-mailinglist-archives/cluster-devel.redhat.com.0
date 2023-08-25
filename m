Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2648078C09F
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298480;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qrd0dT29BBs1qk2fF+TB2uyuW02rnM1Ps/Xt1qMtlQg=;
	b=HjDZNUPbwLQtISAbnjR2+Uf9NJU9qNFZI1c8phBjx9OGi45IfjlasnKnkrMvtu4ovSTVlU
	fdrBQswWWDKoNQ/NgqQhsy8PMLRx0khXuRjwekqu/4InVlz+NOklg/F/pyCwnp8pnIUXyt
	Zbx7LDmO0qFu6SQDgaX4v5s7WmIaGfQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-345-u3r_HwImOoi4BCr3gg1jQw-1; Tue, 29 Aug 2023 04:41:16 -0400
X-MC-Unique: u3r_HwImOoi4BCr3gg1jQw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 792E7823D68;
	Tue, 29 Aug 2023 08:41:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E81D63F6C;
	Tue, 29 Aug 2023 08:41:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6245819465BA;
	Tue, 29 Aug 2023 08:41:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 865FE19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:01:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 755E040C2079; Fri, 25 Aug 2023 14:01:25 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6EAA140C2073
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:01:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 53AAE3C13511
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:01:25 +0000 (UTC)
Received: from out-253.mta1.migadu.com (out-253.mta1.migadu.com
 [95.215.58.253]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-lelRVpk4NjqJcYu_g-qfwA-1; Fri, 25 Aug 2023 10:01:22 -0400
X-MC-Unique: lelRVpk4NjqJcYu_g-qfwA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:16 +0800
Message-Id: <20230825135431.1317785-15-hao.xu@linux.dev>
In-Reply-To: <20230825135431.1317785-1-hao.xu@linux.dev>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 14/29] xfs: support nowait for
 xfs_log_reserve()
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
Cc: Wanpeng Li <wanpengli@tencent.com>, "Darrick J . Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, cluster-devel@redhat.com, linux-cachefs@redhat.com,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 bpf@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>,
 linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

Support nowait logic for xfs_log_reserve(), including add a nowait
boolean parameter and error out -EAGAIN for ticket allocation.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_log.c      | 18 +++++++++++++-----
 fs/xfs/xfs_log.h      |  5 +++--
 fs/xfs/xfs_log_cil.c  |  2 +-
 fs/xfs/xfs_log_priv.h |  2 +-
 fs/xfs/xfs_trans.c    |  5 +++--
 5 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index 79004d193e54..90fbb1c0eca2 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -462,7 +462,8 @@ xfs_log_reserve(
 =09int=09=09=09unit_bytes,
 =09int=09=09=09cnt,
 =09struct xlog_ticket=09**ticp,
-=09bool=09=09=09permanent)
+=09bool=09=09=09permanent,
+=09bool=09=09=09nowait)
 {
 =09struct xlog=09=09*log =3D mp->m_log;
 =09struct xlog_ticket=09*tic;
@@ -475,7 +476,9 @@ xfs_log_reserve(
 =09XFS_STATS_INC(mp, xs_try_logspace);
=20
 =09ASSERT(*ticp =3D=3D NULL);
-=09tic =3D xlog_ticket_alloc(log, unit_bytes, cnt, permanent);
+=09tic =3D xlog_ticket_alloc(log, unit_bytes, cnt, permanent, nowait);
+=09if (!tic)
+=09=09return -EAGAIN;
 =09*ticp =3D tic;
=20
 =09xlog_grant_push_ail(log, tic->t_cnt ? tic->t_unit_res * tic->t_cnt
@@ -974,7 +977,7 @@ xlog_unmount_write(
 =09struct xlog_ticket=09*tic =3D NULL;
 =09int=09=09=09error;
=20
-=09error =3D xfs_log_reserve(mp, 600, 1, &tic, 0);
+=09error =3D xfs_log_reserve(mp, 600, 1, &tic, 0, false);
 =09if (error)
 =09=09goto out_err;
=20
@@ -3527,12 +3530,17 @@ xlog_ticket_alloc(
 =09struct xlog=09=09*log,
 =09int=09=09=09unit_bytes,
 =09int=09=09=09cnt,
-=09bool=09=09=09permanent)
+=09bool=09=09=09permanent,
+=09bool=09=09=09nowait)
 {
 =09struct xlog_ticket=09*tic;
 =09int=09=09=09unit_res;
=20
-=09tic =3D kmem_cache_zalloc(xfs_log_ticket_cache, GFP_NOFS | __GFP_NOFAIL=
);
+=09gfp_t=09=09=09gfp_flags =3D GFP_NOFS |
+=09=09=09=09=09    (nowait ? 0 : __GFP_NOFAIL);
+=09tic =3D kmem_cache_zalloc(xfs_log_ticket_cache, gfp_flags);
+=09if (!tic)
+=09=09return NULL;
=20
 =09unit_res =3D xlog_calc_unit_res(log, unit_bytes, &tic->t_iclog_hdrs);
=20
diff --git a/fs/xfs/xfs_log.h b/fs/xfs/xfs_log.h
index 2728886c2963..ba515df443c3 100644
--- a/fs/xfs/xfs_log.h
+++ b/fs/xfs/xfs_log.h
@@ -139,8 +139,9 @@ void=09xfs_log_mount_cancel(struct xfs_mount *);
 xfs_lsn_t xlog_assign_tail_lsn(struct xfs_mount *mp);
 xfs_lsn_t xlog_assign_tail_lsn_locked(struct xfs_mount *mp);
 void=09xfs_log_space_wake(struct xfs_mount *mp);
-int=09xfs_log_reserve(struct xfs_mount *mp, int length, int count,
-=09=09=09struct xlog_ticket **ticket, bool permanent);
+int=09xfs_log_reserve(struct xfs_mount *mp, int length,
+=09=09=09int count, struct xlog_ticket **ticket,
+=09=09=09bool permanent, bool nowait);
 int=09xfs_log_regrant(struct xfs_mount *mp, struct xlog_ticket *tic);
 void=09xfs_log_unmount(struct xfs_mount *mp);
 bool=09xfs_log_writable(struct xfs_mount *mp);
diff --git a/fs/xfs/xfs_log_cil.c b/fs/xfs/xfs_log_cil.c
index eccbfb99e894..f17c1799b3c4 100644
--- a/fs/xfs/xfs_log_cil.c
+++ b/fs/xfs/xfs_log_cil.c
@@ -37,7 +37,7 @@ xlog_cil_ticket_alloc(
 {
 =09struct xlog_ticket *tic;
=20
-=09tic =3D xlog_ticket_alloc(log, 0, 1, 0);
+=09tic =3D xlog_ticket_alloc(log, 0, 1, 0, false);
=20
 =09/*
 =09 * set the current reservation to zero so we know to steal the basic
diff --git a/fs/xfs/xfs_log_priv.h b/fs/xfs/xfs_log_priv.h
index 1bd2963e8fbd..41edaa0ae869 100644
--- a/fs/xfs/xfs_log_priv.h
+++ b/fs/xfs/xfs_log_priv.h
@@ -503,7 +503,7 @@ extern __le32=09 xlog_cksum(struct xlog *log, struct xl=
og_rec_header *rhead,
=20
 extern struct kmem_cache *xfs_log_ticket_cache;
 struct xlog_ticket *xlog_ticket_alloc(struct xlog *log, int unit_bytes,
-=09=09int count, bool permanent);
+=09=09int count, bool permanent, bool nowait);
=20
 void=09xlog_print_tic_res(struct xfs_mount *mp, struct xlog_ticket *ticket=
);
 void=09xlog_print_trans(struct xfs_trans *);
diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index dbec685f4f4a..7988b4c7f36e 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -155,6 +155,7 @@ xfs_trans_reserve(
 =09struct xfs_mount=09*mp =3D tp->t_mountp;
 =09int=09=09=09error =3D 0;
 =09bool=09=09=09rsvd =3D (tp->t_flags & XFS_TRANS_RESERVE) !=3D 0;
+=09bool=09=09=09nowait =3D tp->t_flags & XFS_TRANS_NOWAIT;
=20
 =09/*
 =09 * Attempt to reserve the needed disk blocks by decrementing
@@ -192,8 +193,8 @@ xfs_trans_reserve(
 =09=09=09error =3D xfs_log_regrant(mp, tp->t_ticket);
 =09=09} else {
 =09=09=09error =3D xfs_log_reserve(mp, resp->tr_logres,
-=09=09=09=09=09=09resp->tr_logcount,
-=09=09=09=09=09=09&tp->t_ticket, permanent);
+=09=09=09=09=09=09resp->tr_logcount, &tp->t_ticket,
+=09=09=09=09=09=09permanent, nowait);
 =09=09}
=20
 =09=09if (error)
--=20
2.25.1

