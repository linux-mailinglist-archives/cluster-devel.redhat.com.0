Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7426678C081
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wMytk6gortV/ClD2jAfo1VsqAw6AVF1aa12MaHB9c8o=;
	b=ipz1lVb6vHlVpJe4N1Uri1bd+Mu5ryRAX/PI5MlFIxIGoTaLWm7ETy1oboQzA2aSDFbFoQ
	54JZnJNfsk3tJyrhCoSeo8aUpYHzNSP7ufpXS8qKVoGIbbDo2CgR8ODhU+1SlW1WmP560U
	Ib1fWL+xYpVyXZGVpAZ5qdAN0B8evhE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-roI4huMlN3yXbY0WqoGpRg-1; Tue, 29 Aug 2023 04:41:11 -0400
X-MC-Unique: roI4huMlN3yXbY0WqoGpRg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6F868D40DD;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B3BB2166B25;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9AD661946A7A;
	Tue, 29 Aug 2023 08:41:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 298DD19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 27 Aug 2023 13:30:37 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EDDDD4021C9; Sun, 27 Aug 2023 13:30:36 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5AD2401E54
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 13:30:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B84BA101A528
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 13:30:36 +0000 (UTC)
Received: from out-250.mta1.migadu.com (out-250.mta1.migadu.com
 [95.215.58.250]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-Ap1RUSiRNDqCx0_xUkthZw-1; Sun, 27 Aug 2023 09:30:34 -0400
X-MC-Unique: Ap1RUSiRNDqCx0_xUkthZw-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Sun, 27 Aug 2023 21:28:25 +0800
Message-Id: <20230827132835.1373581-2-hao.xu@linux.dev>
In-Reply-To: <20230827132835.1373581-1-hao.xu@linux.dev>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
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
Subject: [Cluster-devel] [PATCH 01/11] fs: split off vfs_getdents function
 of getdents64 syscall
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Dominique Martinet <asmadeus@codewreck.org>

This splits off the vfs_getdents function from the getdents64 system
call.
This will allow io_uring to call the vfs_getdents function.

Co-developed-by: Stefan Roesch <shr@fb.com>
Signed-off-by: Stefan Roesch <shr@fb.com>
Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/internal.h |  8 ++++++++
 fs/readdir.c  | 34 ++++++++++++++++++++++++++--------
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index f7a3dc111026..b1f66e52d61b 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -304,3 +304,11 @@ ssize_t __kernel_write_iter(struct file *file, struct =
iov_iter *from, loff_t *po
 struct mnt_idmap *alloc_mnt_idmap(struct user_namespace *mnt_userns);
 struct mnt_idmap *mnt_idmap_get(struct mnt_idmap *idmap);
 void mnt_idmap_put(struct mnt_idmap *idmap);
+
+/*
+ * fs/readdir.c
+ */
+struct linux_dirent64;
+
+int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
+=09=09 unsigned int count);
diff --git a/fs/readdir.c b/fs/readdir.c
index b264ce60114d..9592259b7e7f 100644
--- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -21,6 +21,7 @@
 #include <linux/unistd.h>
 #include <linux/compat.h>
 #include <linux/uaccess.h>
+#include "internal.h"
=20
 #include <asm/unaligned.h>
=20
@@ -351,10 +352,16 @@ static bool filldir64(struct dir_context *ctx, const =
char *name, int namlen,
 =09return false;
 }
=20
-SYSCALL_DEFINE3(getdents64, unsigned int, fd,
-=09=09struct linux_dirent64 __user *, dirent, unsigned int, count)
+
+/**
+ * vfs_getdents - getdents without fdget
+ * @file    : pointer to file struct of directory
+ * @dirent  : pointer to user directory structure
+ * @count   : size of buffer
+ */
+int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
+=09=09 unsigned int count)
 {
-=09struct fd f;
 =09struct getdents_callback64 buf =3D {
 =09=09.ctx.actor =3D filldir64,
 =09=09.count =3D count,
@@ -362,11 +369,7 @@ SYSCALL_DEFINE3(getdents64, unsigned int, fd,
 =09};
 =09int error;
=20
-=09f =3D fdget_pos(fd);
-=09if (!f.file)
-=09=09return -EBADF;
-
-=09error =3D iterate_dir(f.file, &buf.ctx);
+=09error =3D iterate_dir(file, &buf.ctx);
 =09if (error >=3D 0)
 =09=09error =3D buf.error;
 =09if (buf.prev_reclen) {
@@ -379,6 +382,21 @@ SYSCALL_DEFINE3(getdents64, unsigned int, fd,
 =09=09else
 =09=09=09error =3D count - buf.count;
 =09}
+=09return error;
+}
+
+SYSCALL_DEFINE3(getdents64, unsigned int, fd,
+=09=09struct linux_dirent64 __user *, dirent, unsigned int, count)
+{
+=09struct fd f;
+=09int error;
+
+=09f =3D fdget_pos(fd);
+=09if (!f.file)
+=09=09return -EBADF;
+
+=09error =3D vfs_getdents(f.file, dirent, count);
+
 =09fdput_pos(f);
 =09return error;
 }
--=20
2.25.1

