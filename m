Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E6ABA78C0A5
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298483;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IFBn1yfTHAEsMoZ6WZ53H/lcyW5Ft+eaBlb6VxB4jhg=;
	b=ZBOy2YT5JmQcxooeYHYxFDZtd9xFiETxZpq5W3MRxMDczEwFxyap7ZM9IoXrr8bZUwYusB
	1gCRH+0J+2nE5jhiFlCklgqaezc8YkprDN/w3/q4C0r7GXSmsezio5SA7O5/KjKChbyfiW
	LOoIRHe3hkqcj5z6+fxH1oj3c0Em2nk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-jsKhwykXNueCy9y_6S2N2g-1; Tue, 29 Aug 2023 04:41:16 -0400
X-MC-Unique: jsKhwykXNueCy9y_6S2N2g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7949185A7A3;
	Tue, 29 Aug 2023 08:41:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6DA540C206F;
	Tue, 29 Aug 2023 08:41:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9B61E19465BA;
	Tue, 29 Aug 2023 08:41:15 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 30F3419465A8 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:02:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1FA8E40D283A; Fri, 25 Aug 2023 14:02:04 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1874140D2839
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:02:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E9F491C07263
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:02:03 +0000 (UTC)
Received: from out-245.mta1.migadu.com (out-245.mta1.migadu.com
 [95.215.58.245]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-JKhcDlfvMiSWa0SdJAZsWw-1; Fri, 25 Aug 2023 10:02:01 -0400
X-MC-Unique: JKhcDlfvMiSWa0SdJAZsWw-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:17 +0800
Message-Id: <20230825135431.1317785-16-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 15/29] xfs: don't wait for free space in
 xlog_grant_head_check() in nowait case
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

Don't sleep and wait for more space for a log ticket in
xlog_grant_head_check() when it is in nowait case.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/xfs/xfs_log.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index 90fbb1c0eca2..a2aabdd42a29 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -341,7 +341,8 @@ xlog_grant_head_check(
 =09struct xlog=09=09*log,
 =09struct xlog_grant_head=09*head,
 =09struct xlog_ticket=09*tic,
-=09int=09=09=09*need_bytes)
+=09int=09=09=09*need_bytes,
+=09bool=09=09=09nowait)
 {
 =09int=09=09=09free_bytes;
 =09int=09=09=09error =3D 0;
@@ -360,13 +361,15 @@ xlog_grant_head_check(
 =09=09spin_lock(&head->lock);
 =09=09if (!xlog_grant_head_wake(log, head, &free_bytes) ||
 =09=09    free_bytes < *need_bytes) {
-=09=09=09error =3D xlog_grant_head_wait(log, head, tic,
-=09=09=09=09=09=09     *need_bytes);
+=09=09=09error =3D nowait ?
+=09=09=09=09-EAGAIN : xlog_grant_head_wait(log, head, tic,
+=09=09=09=09=09=09=09       *need_bytes);
 =09=09}
 =09=09spin_unlock(&head->lock);
 =09} else if (free_bytes < *need_bytes) {
 =09=09spin_lock(&head->lock);
-=09=09error =3D xlog_grant_head_wait(log, head, tic, *need_bytes);
+=09=09error =3D nowait ? -EAGAIN : xlog_grant_head_wait(log, head, tic,
+=09=09=09=09=09=09=09=09*need_bytes);
 =09=09spin_unlock(&head->lock);
 =09}
=20
@@ -428,7 +431,7 @@ xfs_log_regrant(
 =09trace_xfs_log_regrant(log, tic);
=20
 =09error =3D xlog_grant_head_check(log, &log->l_write_head, tic,
-=09=09=09=09      &need_bytes);
+=09=09=09=09      &need_bytes, false);
 =09if (error)
 =09=09goto out_error;
=20
@@ -487,7 +490,7 @@ xfs_log_reserve(
 =09trace_xfs_log_reserve(log, tic);
=20
 =09error =3D xlog_grant_head_check(log, &log->l_reserve_head, tic,
-=09=09=09=09      &need_bytes);
+=09=09=09=09      &need_bytes, nowait);
 =09if (error)
 =09=09goto out_error;
=20
--=20
2.25.1

