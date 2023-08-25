Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F4078C084
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298476;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dJCwuXYF2ysnNGZ4IwIRn3J3yw7EJFJ2XOIKIwetbvA=;
	b=OLXwIVtR5+ToLSI9TKVpnYt6YDINQuJmrP9IfgYFdkdr5ZWLyWrWKwxA3J5temJdxI33pA
	Uc/ky4K/L76KB//riInV49dxBuQ2mWcbcDkxnM4hijOJJq/3NxNL/TepVKRWGwsISA2r68
	mLTd071PdRHbSel8kS7kkVD/wfV/uiQ=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-648-kqXy9NADMhmZbZ29dpY5Og-1; Tue, 29 Aug 2023 04:41:11 -0400
X-MC-Unique: kqXy9NADMhmZbZ29dpY5Og-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 78A501C29B09;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6AA064021C9;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 87AE719465BD;
	Tue, 29 Aug 2023 08:41:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7979219465B1 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 13:59:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 65089492C14; Fri, 25 Aug 2023 13:59:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DC17492C18
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 13:59:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42E21857A84
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 13:59:19 +0000 (UTC)
Received: from out-252.mta1.migadu.com (out-252.mta1.migadu.com
 [95.215.58.252]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-aM84zhhSM0iq1FEnQYpK2Q-1; Fri, 25 Aug 2023 09:59:15 -0400
X-MC-Unique: aM84zhhSM0iq1FEnQYpK2Q-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:11 +0800
Message-Id: <20230825135431.1317785-10-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 09/29] vfs: move file_accessed() to the
 beginning of iterate_dir()
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

Move file_accessed() to the beginning of iterate_dir() so that we don't
need to rollback all the work done when file_accessed() returns -EAGAIN
at the end of getdents.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/readdir.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/readdir.c b/fs/readdir.c
index 2f4c9c663a39..6469f076ba6e 100644
--- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -61,6 +61,10 @@ int iterate_dir(struct file *file, struct dir_context *c=
tx)
=20
 =09res =3D -ENOENT;
 =09if (!IS_DEADDIR(inode)) {
+=09=09res =3D file_accessed(file, ctx->flags & DIR_CONTEXT_F_NOWAIT);
+=09=09if (res =3D=3D -EAGAIN)
+=09=09=09goto out_unlock;
+
 =09=09ctx->pos =3D file->f_pos;
 =09=09if (shared)
 =09=09=09res =3D file->f_op->iterate_shared(file, ctx);
@@ -68,8 +72,9 @@ int iterate_dir(struct file *file, struct dir_context *ct=
x)
 =09=09=09res =3D file->f_op->iterate(file, ctx);
 =09=09file->f_pos =3D ctx->pos;
 =09=09fsnotify_access(file);
-=09=09file_accessed(file, ctx->flags & DIR_CONTEXT_F_NOWAIT);
 =09}
+
+out_unlock:
 =09if (shared)
 =09=09inode_unlock_shared(inode);
 =09else
--=20
2.25.1

