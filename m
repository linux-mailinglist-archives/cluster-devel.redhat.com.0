Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE3E78C09B
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298479;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+DbnN4IEgt3YbtWVcHM6JHlKoiHsRI6MgIby97kAcrI=;
	b=dz0iUw2mcKAGjL7qo//I0+PTsBW1vsTRgCgcTBTqG8LBXMsjC8hZzA9R2uo1nXvREWspAw
	WaGvG90K0TL1k2aAsqdpYhYKgo6SgDVh06h+FnFxYz/nkXDb/OljBIaE0gaiTC1DZYk6HK
	J+S+FZh4+mYJTFKIIBgT8+T11OEZTa0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-EAyLEizFOn63Jh01vSbvEQ-1; Tue, 29 Aug 2023 04:41:14 -0400
X-MC-Unique: EAyLEizFOn63Jh01vSbvEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 603BA85CCE5;
	Tue, 29 Aug 2023 08:41:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 549206B2AC;
	Tue, 29 Aug 2023 08:41:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2CCD11946A42;
	Tue, 29 Aug 2023 08:41:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2FBAC19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:06:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 05F09140E962; Fri, 25 Aug 2023 14:06:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2D9E140E950
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:06:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7AAF1C0755B
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:06:11 +0000 (UTC)
Received: from out-245.mta1.migadu.com (out-245.mta1.migadu.com
 [95.215.58.245]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-rZSWM33sMN2ARXiVRTNXCQ-1; Fri, 25 Aug 2023 10:06:09 -0400
X-MC-Unique: rZSWM33sMN2ARXiVRTNXCQ-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:30 +0800
Message-Id: <20230825135431.1317785-29-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 28/29] xfs: support nowait semantics for
 xc_ctx_lock in xlog_cil_commit()
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

Apply trylock logic for xc_ctx_lock in xlog_cil_commit() in nowait
case and error out -EAGAIN for xlog_cil_commit().

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_log_cil.c  | 12 ++++++++++--
 fs/xfs/xfs_log_priv.h |  2 +-
 fs/xfs/xfs_trans.c    |  4 +++-
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/xfs_log_cil.c b/fs/xfs/xfs_log_cil.c
index b31830ee36dd..6d054359bbb5 100644
--- a/fs/xfs/xfs_log_cil.c
+++ b/fs/xfs/xfs_log_cil.c
@@ -1613,7 +1613,7 @@ xlog_cil_process_intents(
  * background commit, returns without it held once background commits are
  * allowed again.
  */
-void
+int
 xlog_cil_commit(
 =09struct xlog=09=09*log,
 =09struct xfs_trans=09*tp,
@@ -1623,6 +1623,7 @@ xlog_cil_commit(
 =09struct xfs_cil=09=09*cil =3D log->l_cilp;
 =09struct xfs_log_item=09*lip, *next;
 =09uint32_t=09=09released_space =3D 0;
+=09bool=09=09=09nowait =3D tp->t_flags & XFS_TRANS_NOWAIT;
=20
 =09/*
 =09 * Do all necessary memory allocation before we lock the CIL.
@@ -1632,7 +1633,12 @@ xlog_cil_commit(
 =09xlog_cil_alloc_shadow_bufs(log, tp);
=20
 =09/* lock out background commit */
-=09down_read(&cil->xc_ctx_lock);
+=09if (nowait) {
+=09=09if (!down_read_trylock(&cil->xc_ctx_lock))
+=09=09=09return -EAGAIN;
+=09} else {
+=09=09down_read(&cil->xc_ctx_lock);
+=09}
=20
 =09if (tp->t_flags & XFS_TRANS_HAS_INTENT_DONE)
 =09=09released_space =3D xlog_cil_process_intents(cil, tp);
@@ -1668,6 +1674,8 @@ xlog_cil_commit(
=20
 =09/* xlog_cil_push_background() releases cil->xc_ctx_lock */
 =09xlog_cil_push_background(log);
+
+=09return 0;
 }
=20
 /*
diff --git a/fs/xfs/xfs_log_priv.h b/fs/xfs/xfs_log_priv.h
index 41edaa0ae869..eb7a1241deab 100644
--- a/fs/xfs/xfs_log_priv.h
+++ b/fs/xfs/xfs_log_priv.h
@@ -580,7 +580,7 @@ int=09xlog_cil_init(struct xlog *log);
 void=09xlog_cil_init_post_recovery(struct xlog *log);
 void=09xlog_cil_destroy(struct xlog *log);
 bool=09xlog_cil_empty(struct xlog *log);
-void=09xlog_cil_commit(struct xlog *log, struct xfs_trans *tp,
+int=09xlog_cil_commit(struct xlog *log, struct xfs_trans *tp,
 =09=09=09xfs_csn_t *commit_seq, bool regrant);
 void=09xlog_cil_set_ctx_write_state(struct xfs_cil_ctx *ctx,
 =09=09=09struct xlog_in_core *iclog);
diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index f1f84a3dd456..e5beda636a37 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -1037,7 +1037,9 @@ __xfs_trans_commit(
 =09=09xfs_trans_apply_sb_deltas(tp);
 =09xfs_trans_apply_dquot_deltas(tp);
=20
-=09xlog_cil_commit(log, tp, &commit_seq, regrant);
+=09error =3D xlog_cil_commit(log, tp, &commit_seq, regrant);
+=09if (error)
+=09=09goto out_unreserve;
=20
 =09xfs_trans_free(tp);
=20
--=20
2.25.1

