Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B0B78C079
	for <lists+cluster-devel@lfdr.de>; Tue, 29 Aug 2023 10:41:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693298472;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ssCocdUcLvZ6/0hOMi4/PBiBZdrbZwVdQlzo6IQhMQk=;
	b=AO/NkXA2J6myU9RSTQWMe5u94iJMRCIGpFMV0cxP2AicuPZY7eThWrndDOecKEzKFDtEeH
	zq3n+22aa2EdN2HEj+SUkvnZphi6GB63rH+eGNDE4+LpowDck905knNJWZOvlTl+ChLlwl
	gdfUSdgkPs0XHBXJf3D7ycqbRmw0ATA=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-Ct8UoarPPTmnbiTdowv0pg-1; Tue, 29 Aug 2023 04:41:11 -0400
X-MC-Unique: Ct8UoarPPTmnbiTdowv0pg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 069DA3810D48;
	Tue, 29 Aug 2023 08:41:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EA4FB2026D2A;
	Tue, 29 Aug 2023 08:41:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 671821946A46;
	Tue, 29 Aug 2023 08:41:08 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D289819465A8 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 27 Aug 2023 13:32:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A128040C6F4E; Sun, 27 Aug 2023 13:32:18 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9975B40C6F4C
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 13:32:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D5B329A9D50
 for <cluster-devel@redhat.com>; Sun, 27 Aug 2023 13:32:18 +0000 (UTC)
Received: from out-242.mta1.migadu.com (out-242.mta1.migadu.com
 [95.215.58.242]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-t71nV187M3elKImLrg2uWA-1; Sun, 27 Aug 2023 09:32:16 -0400
X-MC-Unique: t71nV187M3elKImLrg2uWA-1
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Hao Xu <hao.xu@linux.dev>
To: io-uring@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Date: Sun, 27 Aug 2023 21:28:27 +0800
Message-Id: <20230827132835.1373581-4-hao.xu@linux.dev>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Tue, 29 Aug 2023 08:41:07 +0000
Subject: [Cluster-devel] [PATCH 03/11] vfs: add nowait flag for struct
 dir_context
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

From: Hao Xu <howeyxu@tencent.com>

The flags will allow passing DIR_CONTEXT_F_NOWAIT to iterate()
implementations that support it (as signaled through FMODE_NWAIT
in file->f_mode)

Notes:
- considered using IOCB_NOWAIT but if we add more flags later it
would be confusing to keep track of which values are valid, use
dedicated flags
- might want to check ctx.flags & DIR_CONTEXT_F_NOWAIT is only set
when file->f_mode & FMODE_NOWAIT in iterate_dir() as e.g. WARN_ONCE?

Co-developed-by: Dominique Martinet <asmadeus@codewreck.org>
Signed-off-by: Dominique Martinet <asmadeus@codewreck.org>
Signed-off-by: Hao Xu <howeyxu@tencent.com>
---
 fs/internal.h      | 2 +-
 fs/readdir.c       | 6 ++++--
 include/linux/fs.h | 8 ++++++++
 3 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index b1f66e52d61b..7508d485c655 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -311,4 +311,4 @@ void mnt_idmap_put(struct mnt_idmap *idmap);
 struct linux_dirent64;
=20
 int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
-=09=09 unsigned int count);
+=09=09 unsigned int count, unsigned long flags);
diff --git a/fs/readdir.c b/fs/readdir.c
index 9592259b7e7f..b80caf4c9321 100644
--- a/fs/readdir.c
+++ b/fs/readdir.c
@@ -358,12 +358,14 @@ static bool filldir64(struct dir_context *ctx, const =
char *name, int namlen,
  * @file    : pointer to file struct of directory
  * @dirent  : pointer to user directory structure
  * @count   : size of buffer
+ * @flags   : additional dir_context flags
  */
 int vfs_getdents(struct file *file, struct linux_dirent64 __user *dirent,
-=09=09 unsigned int count)
+=09=09 unsigned int count, unsigned long flags)
 {
 =09struct getdents_callback64 buf =3D {
 =09=09.ctx.actor =3D filldir64,
+=09=09.ctx.flags =3D flags,
 =09=09.count =3D count,
 =09=09.current_dir =3D dirent
 =09};
@@ -395,7 +397,7 @@ SYSCALL_DEFINE3(getdents64, unsigned int, fd,
 =09if (!f.file)
 =09=09return -EBADF;
=20
-=09error =3D vfs_getdents(f.file, dirent, count);
+=09error =3D vfs_getdents(f.file, dirent, count, 0);
=20
 =09fdput_pos(f);
 =09return error;
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 6867512907d6..f3e315e8efdd 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1719,8 +1719,16 @@ typedef bool (*filldir_t)(struct dir_context *, cons=
t char *, int, loff_t, u64,
 struct dir_context {
 =09filldir_t actor;
 =09loff_t pos;
+=09unsigned long flags;
 };
=20
+/*
+ * flags for dir_context flags
+ * DIR_CONTEXT_F_NOWAIT: Request non-blocking iterate
+ *                       (requires file->f_mode & FMODE_NOWAIT)
+ */
+#define DIR_CONTEXT_F_NOWAIT=09(1 << 0)
+
 /*
  * These flags let !MMU mmap() govern direct device mapping vs immediate
  * copying more easily for MAP_PRIVATE, especially for ROM filesystems.
--=20
2.25.1

