Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D28A78C087
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298476;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oELJXHaipZy7gzfhowD2Yln0XS4GPY5gCClHo/2qDoo=;
	b=LEneY5ypBQj7D88m27BKdr7vE1KwDGsFXhvWVf+N1MGV/hy7wEwnGD24yH/oGYRGzlvNPo
	WFk2hXnzQEgRRLJaLnQHJPqGr9EXOb82+ew7SLVb1ycQX24Tc3tk1JNa+w9Ylmw9wRi1eI
	D3W742OWD0dbRGZgnngujXnl43eZGDI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-Z88IQ3Z4NG-zKjWKWfknEQ-1; Tue, 29 Aug 2023 04:41:13 -0400
X-MC-Unique: Z88IQ3Z4NG-zKjWKWfknEQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C4A9823E1A;
	Tue, 29 Aug 2023 08:41:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 90201492C13;
	Tue, 29 Aug 2023 08:41:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 534601946588;
	Tue, 29 Aug 2023 08:41:11 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 56D1F19465A8 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 27 Aug 2023 13:36:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 47C992026D68; Sun, 27 Aug 2023 13:36:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 400BC2026D4B
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 13:36:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 259F9101A52E
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 13:36:32 +0000 (UTC)
Received: from out-248.mta1.migadu.com (out-248.mta1.migadu.com
 [95.215.58.248]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-nW_B91E1PFeoprTIuky_kA-1; Sun, 27 Aug 2023 09:36:28 -0400
X-MC-Unique: nW_B91E1PFeoprTIuky_kA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Sun, 27 Aug 2023 21:28:35 +0800
Message-Id: <20230827132835.1373581-12-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 11/11] io_uring: add support for getdents
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

This add support for getdents64 to io_uring, acting exactly like the
syscall: the directory is iterated from it's current's position as
stored in the file struct, and the file's position is updated exactly as
if getdents64 had been called.

For filesystems that support NOWAIT in iterate_shared(), try to use it
first; if a user already knows the filesystem they use do not support
nowait they can force async through IOSQE_ASYNC in the sqe flags,
avoiding the need to bounce back through a useless EAGAIN return.

Co-developed-by: Dominique Martinet <asmadeus@codewreck.org>
Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 include/uapi/linux/io_uring.h |  1 +
 io_uring/fs.c                 | 53 +++++++++++++++++++++++++++++++++++
 io_uring/fs.h                 |  3 ++
 io_uring/opdef.c              |  8 ++++++
 4 files changed, 65 insertions(+)

diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.h
index 8e61f8b7c2ce..3896397a1998 100644
--- a/include/uapi/linux/io_uring.h
+++ b/include/uapi/linux/io_uring.h
@@ -240,6 +240,7 @@ enum io_uring_op {
 =09IORING_OP_URING_CMD,
 =09IORING_OP_SEND_ZC,
 =09IORING_OP_SENDMSG_ZC,
+=09IORING_OP_GETDENTS,
=20
 =09/* this goes last, obviously */
 =09IORING_OP_LAST,
diff --git a/io_uring/fs.c b/io_uring/fs.c
index f6a69a549fd4..04711feac4e6 100644
--- a/io_uring/fs.c
+++ b/io_uring/fs.c
@@ -47,6 +47,12 @@ struct io_link {
 =09int=09=09=09=09flags;
 };
=20
+struct io_getdents {
+=09struct file=09=09=09*file;
+=09struct linux_dirent64 __user=09*dirent;
+=09unsigned int=09=09=09count;
+};
+
 int io_renameat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 {
 =09struct io_rename *ren =3D io_kiocb_to_cmd(req, struct io_rename);
@@ -291,3 +297,50 @@ void io_link_cleanup(struct io_kiocb *req)
 =09putname(sl->oldpath);
 =09putname(sl->newpath);
 }
+
+int io_getdents_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
+{
+=09struct io_getdents *gd =3D io_kiocb_to_cmd(req, struct io_getdents);
+
+=09if (READ_ONCE(sqe->off))
+=09=09return -EINVAL;
+
+=09gd->dirent =3D u64_to_user_ptr(READ_ONCE(sqe->addr));
+=09gd->count =3D READ_ONCE(sqe->len);
+
+=09return 0;
+}
+
+int io_getdents(struct io_kiocb *req, unsigned int issue_flags)
+{
+=09struct io_getdents *gd =3D io_kiocb_to_cmd(req, struct io_getdents);
+=09struct file *file =3D req->file;
+=09unsigned long getdents_flags =3D 0;
+=09bool force_nonblock =3D issue_flags & IO_URING_F_NONBLOCK;
+=09bool locked;
+=09int ret;
+
+=09if (force_nonblock) {
+=09=09if (!(file->f_flags & O_NONBLOCK) &&
+=09=09    !(file->f_mode & FMODE_NOWAIT))
+=09=09=09return -EAGAIN;
+
+=09=09getdents_flags =3D DIR_CONTEXT_F_NOWAIT;
+=09}
+
+=09ret =3D file_pos_lock_nowait(file, force_nonblock);
+=09if (ret =3D=3D -EAGAIN)
+=09=09return ret;
+=09locked =3D ret;
+
+=09ret =3D vfs_getdents(file, gd->dirent, gd->count, getdents_flags);
+=09if (locked)
+=09=09file_pos_unlock(file);
+
+=09if (ret =3D=3D -EAGAIN && force_nonblock)
+=09=09return -EAGAIN;
+
+=09io_req_set_res(req, ret, 0);
+=09return 0;
+}
+
diff --git a/io_uring/fs.h b/io_uring/fs.h
index 0bb5efe3d6bb..f83a6f3a678d 100644
--- a/io_uring/fs.h
+++ b/io_uring/fs.h
@@ -18,3 +18,6 @@ int io_symlinkat(struct io_kiocb *req, unsigned int issue=
_flags);
 int io_linkat_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe);
 int io_linkat(struct io_kiocb *req, unsigned int issue_flags);
 void io_link_cleanup(struct io_kiocb *req);
+
+int io_getdents_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)=
;
+int io_getdents(struct io_kiocb *req, unsigned int issue_flags);
diff --git a/io_uring/opdef.c b/io_uring/opdef.c
index 3b9c6489b8b6..1bae6b2a8d0b 100644
--- a/io_uring/opdef.c
+++ b/io_uring/opdef.c
@@ -428,6 +428,11 @@ const struct io_issue_def io_issue_defs[] =3D {
 =09=09.prep=09=09=09=3D io_eopnotsupp_prep,
 #endif
 =09},
+=09[IORING_OP_GETDENTS] =3D {
+=09=09.needs_file=09=09=3D 1,
+=09=09.prep=09=09=09=3D io_getdents_prep,
+=09=09.issue=09=09=09=3D io_getdents,
+=09},
 };
=20
=20
@@ -648,6 +653,9 @@ const struct io_cold_def io_cold_defs[] =3D {
 =09=09.fail=09=09=09=3D io_sendrecv_fail,
 #endif
 =09},
+=09[IORING_OP_GETDENTS] =3D {
+=09=09.name=09=09=09=3D "GETDENTS",
+=09},
 };
=20
 const char *io_uring_get_opcode(u8 opcode)
--=20
2.25.1

