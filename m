Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A264078C092
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298477;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PTeXL07YTUuoBdGNnBnX5z3rrdoQn9k3zE7OosNb9ec=;
	b=i4TcsFnObh72Ogwz/GSPUujjotBJNBpxsAkk9rQYC4bTa1a/xbjvrJylZcpgq4tPfaTNgd
	z4wQxVCzzYxtddluIuo+M2nqfJQKGpMxPByrqyTTQr1gbw0qi7O5kVz/BLAToovoHtBtjK
	loDrnJD3usCKG859z1pWVHNnRb8pDnw=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-696-xRfXgtCUMbS49nOFOchjVQ-1; Tue, 29 Aug 2023 04:41:16 -0400
X-MC-Unique: xRfXgtCUMbS49nOFOchjVQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85DB13C10151;
	Tue, 29 Aug 2023 08:41:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7AFCB492C13;
	Tue, 29 Aug 2023 08:41:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4A22C19465B9;
	Tue, 29 Aug 2023 08:41:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C41AA19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:01:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8E46E6B59C; Fri, 25 Aug 2023 14:01:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 86DFC6B59A
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:01:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 680858D40A7
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:01:10 +0000 (UTC)
Received: from out-249.mta1.migadu.com (out-249.mta1.migadu.com
 [95.215.58.249]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-XcnUwO90Pryi9b-hejYzgQ-1; Fri, 25 Aug 2023 10:01:06 -0400
X-MC-Unique: XcnUwO90Pryi9b-hejYzgQ-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:15 +0800
Message-Id: <20230825135431.1317785-14-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 13/29] xfs: make xfs_trans_alloc() support
 nowait semantics
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

There are locks in xfs_trans_alloc(), spot them and apply trylock logic.
Make them return -EAGAIN when it would block. To achieve this, add
nowait parameter for those functions in the path. Besides, add a generic
transaction flag XFS_TRANS_NOWAIT to deliver nowait info.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/libxfs/xfs_shared.h |  2 ++
 fs/xfs/xfs_iops.c          |  3 ++-
 fs/xfs/xfs_trans.c         | 21 ++++++++++++++++++---
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/libxfs/xfs_shared.h b/fs/xfs/libxfs/xfs_shared.h
index c4381388c0c1..0ba3d6f53405 100644
--- a/fs/xfs/libxfs/xfs_shared.h
+++ b/fs/xfs/libxfs/xfs_shared.h
@@ -83,6 +83,8 @@ void=09xfs_log_get_max_trans_res(struct xfs_mount *mp,
  * made then this algorithm will eventually find all the space it needs.
  */
 #define XFS_TRANS_LOWMODE=090x100=09/* allocate in low space mode */
+/* Transaction should follow nowait semantics */
+#define XFS_TRANS_NOWAIT=09=09(1u << 9)
=20
 /*
  * Field values for xfs_trans_mod_sb.
diff --git a/fs/xfs/xfs_iops.c b/fs/xfs/xfs_iops.c
index 5fa391083de9..47b4fd5f8f5c 100644
--- a/fs/xfs/xfs_iops.c
+++ b/fs/xfs/xfs_iops.c
@@ -1054,7 +1054,8 @@ xfs_vn_update_time(
 =09if (nowait)
 =09=09old_pflags =3D memalloc_noio_save();
=20
-=09error =3D xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp);
+=09error =3D xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0,
+=09=09=09=09nowait ? XFS_TRANS_NOWAIT : 0, &tp);
 =09if (error)
 =09=09goto out;
=20
diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index 8c0bfc9a33b1..dbec685f4f4a 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -251,6 +251,9 @@ xfs_trans_alloc(
 =09struct xfs_trans=09*tp;
 =09bool=09=09=09want_retry =3D true;
 =09int=09=09=09error;
+=09bool=09=09=09nowait =3D flags & XFS_TRANS_NOWAIT;
+=09gfp_t=09=09=09gfp_flags =3D GFP_KERNEL |
+=09=09=09=09=09    (nowait ? 0 : __GFP_NOFAIL);
=20
 =09/*
 =09 * Allocate the handle before we do our freeze accounting and setting u=
p
@@ -258,9 +261,21 @@ xfs_trans_alloc(
 =09 * by doing GFP_KERNEL allocations inside sb_start_intwrite().
 =09 */
 retry:
-=09tp =3D kmem_cache_zalloc(xfs_trans_cache, GFP_KERNEL | __GFP_NOFAIL);
-=09if (!(flags & XFS_TRANS_NO_WRITECOUNT))
-=09=09sb_start_intwrite(mp->m_super);
+=09tp =3D kmem_cache_zalloc(xfs_trans_cache, gfp_flags);
+=09if (!tp)
+=09=09return -EAGAIN;
+=09if (!(flags & XFS_TRANS_NO_WRITECOUNT)) {
+=09=09if (nowait) {
+=09=09=09bool locked =3D sb_start_intwrite_trylock(mp->m_super);
+
+=09=09=09if (!locked) {
+=09=09=09=09xfs_trans_cancel(tp);
+=09=09=09=09return -EAGAIN;
+=09=09=09}
+=09=09} else {
+=09=09=09sb_start_intwrite(mp->m_super);
+=09=09}
+=09}
 =09xfs_trans_set_context(tp);
=20
 =09/*
--=20
2.25.1

