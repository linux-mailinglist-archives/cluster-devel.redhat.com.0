Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E341278C0A2
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ex7XLonsdjSMKqQtTcZJtBrAcWxu6ezblmhps2tlk4Q=;
	b=HYvud4qw+mIe35J8jWEspIs6hcSJ7BQg9YKM1oeAVo09uGDY1wesKSOQ7U01juRe9P5ud5
	7eit0aEmHaX0PNdXfQth6QlM3tEhVj9syILy9q+9DJgVZDUE4+Zx1Zvxp9Q1LVmkI+6jsg
	J+j71tuAhHFtNDTj6GDPy7RHgxDOk80=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-43-dHs5WpxZMX6vfgBiucXiYw-1; Tue, 29 Aug 2023 04:41:14 -0400
X-MC-Unique: dHs5WpxZMX6vfgBiucXiYw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0970E823DF5;
	Tue, 29 Aug 2023 08:41:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F2D57140E950;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CF9B21946A4C;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 530C919465B1 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 25 Aug 2023 14:00:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3EDE34021B9; Fri, 25 Aug 2023 14:00:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 365D3492C14
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:00:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15AAE2812949
 for <cluster-devel@redhat.com>; Fri, 25 Aug 2023 14:00:19 +0000 (UTC)
Received: from out-242.mta1.migadu.com (out-242.mta1.migadu.com
 [95.215.58.242]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-FUocNvIgM9m23oqwHJo3WQ-1; Fri, 25 Aug 2023 10:00:17 -0400
X-MC-Unique: FUocNvIgM9m23oqwHJo3WQ-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Aug 2023 21:54:13 +0800
Message-Id: <20230825135431.1317785-12-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 11/29] vfs: trylock inode->i_rwsem in
 iterate_dir() to support nowait
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

Trylock inode->i_rwsem in iterate_dir() to support nowait semantics and
error out -EAGAIN when there is contention.

Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/readdir.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/fs/readdir.c b/fs/readdir.c
index 6469f076ba6e..664ecd9665a1 100644
--- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -43,6 +43,8 @@ int iterate_dir(struct file *file, struct dir_context *ct=
x)
 =09struct inode *inode =3D file_inode(file);
 =09bool shared =3D false;
 =09int res =3D -ENOTDIR;
+=09bool nowait;
+
 =09if (file->f_op->iterate_shared)
 =09=09shared =3D true;
 =09else if (!file->f_op->iterate)
@@ -52,16 +54,22 @@ int iterate_dir(struct file *file, struct dir_context *=
ctx)
 =09if (res)
 =09=09goto out;
=20
-=09if (shared)
-=09=09res =3D down_read_killable(&inode->i_rwsem);
-=09else
-=09=09res =3D down_write_killable(&inode->i_rwsem);
-=09if (res)
+=09nowait =3D ctx->flags & DIR_CONTEXT_F_NOWAIT;
+=09if (nowait) {
+=09=09res =3D shared ? down_read_trylock(&inode->i_rwsem) :
+=09=09=09       down_write_trylock(&inode->i_rwsem);
+=09=09if (!res)
+=09=09=09res =3D -EAGAIN;
+=09} else {
+=09=09res =3D shared ? down_read_killable(&inode->i_rwsem) :
+=09=09=09       down_write_killable(&inode->i_rwsem);
+=09}
+=09if (res < 0)
 =09=09goto out;
=20
 =09res =3D -ENOENT;
 =09if (!IS_DEADDIR(inode)) {
-=09=09res =3D file_accessed(file, ctx->flags & DIR_CONTEXT_F_NOWAIT);
+=09=09res =3D file_accessed(file, nowait);
 =09=09if (res =3D=3D -EAGAIN)
 =09=09=09goto out_unlock;
=20
--=20
2.25.1

