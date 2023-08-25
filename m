Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 625F678C08C
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298477;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vjO7KlNXm7O0YYuZ+PM3WAJnc4GqqgwK7EDXf5daQio=;
	b=UTnfQ7AR0JPVeNlSkNYpsD8sz67wKX6yRQVOkiVof3rdxDg5oL9YgWnpFqhlidHX8b/Hzu
	fPQEMPsvRZbnCi1cqbZJ7QMtcHqxUKMKmAf2E0yIquKE58Ar9HRUJ207IZ8891mvyHqsyP
	aZGKBAPYhchKDspWv0uej3YTjawKqNQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-695-KgywVHepMvSDeL8n8-N3VQ-1; Tue, 29 Aug 2023 04:41:11 -0400
X-MC-Unique: KgywVHepMvSDeL8n8-N3VQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B35D101B453;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 701DB492C14;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 998BB1946A79;
	Tue, 29 Aug 2023 08:41:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9CCEB19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:05:43 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 86E882166B28; Fri, 25 Aug 2023 14:05:43 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EABD2166B26
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:05:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62580185A78B
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:05:43 +0000 (UTC)
Received: from out-252.mta1.migadu.com (out-252.mta1.migadu.com
 [95.215.58.252]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-CiBzTVzcNPSS1RGXC-mHvA-1; Fri, 25 Aug 2023 10:05:39 -0400
X-MC-Unique: CiBzTVzcNPSS1RGXC-mHvA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:28 +0800
Message-Id: <20230825135431.1317785-27-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 26/29] xfs: return -EAGAIN when nowait meets
 sync in transaction commit
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

if the log transaction is a sync one, let's fail the nowait try and
return -EAGAIN directly since sync transaction means blocked by IO.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_trans.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_trans.c b/fs/xfs/xfs_trans.c
index 7988b4c7f36e..f1f84a3dd456 100644
--- a/fs/xfs/xfs_trans.c
+++ b/fs/xfs/xfs_trans.c
@@ -968,12 +968,24 @@ __xfs_trans_commit(
 =09xfs_csn_t=09=09commit_seq =3D 0;
 =09int=09=09=09error =3D 0;
 =09int=09=09=09sync =3D tp->t_flags & XFS_TRANS_SYNC;
+=09bool=09=09=09nowait =3D tp->t_flags & XFS_TRANS_NOWAIT;
+=09bool=09=09=09perm_log =3D tp->t_flags & XFS_TRANS_PERM_LOG_RES;
=20
 =09trace_xfs_trans_commit(tp, _RET_IP_);
=20
+=09if (nowait && sync) {
+=09=09/*
+=09=09 * Currently nowait is only from xfs_vn_update_time()
+=09=09 * so perm_log is always false here, but let's make
+=09=09 * code general.
+=09=09 */
+=09=09if (perm_log)
+=09=09=09xfs_defer_cancel(tp);
+=09=09goto out_unreserve;
+=09}
 =09error =3D xfs_trans_run_precommits(tp);
 =09if (error) {
-=09=09if (tp->t_flags & XFS_TRANS_PERM_LOG_RES)
+=09=09if (perm_log)
 =09=09=09xfs_defer_cancel(tp);
 =09=09goto out_unreserve;
 =09}
--=20
2.25.1

