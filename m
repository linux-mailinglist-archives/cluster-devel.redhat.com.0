Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D0717748C6D
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Jul 2023 20:59:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688583561;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XY9TOVde9lJeweB/za56HJgugFukzj6ytIwXyTG5i8A=;
	b=D81q7EiC55g5/QPgG/Mg58mKM25M/lZvwUKuM45iB9Xh20HzLttQ9bZacVKFgPPuP0iyg5
	kq2RoSkkqZ2SxdgLeBhYb930cITsAvUVp+2Sxx1JnGHBmP3saACPc8DvH4+1lZmjJzY3de
	WOVU1DDrvuaRjMu1INAk+Rlrysxq1aI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-OsTEVUVcNbS56bJ6zS9djw-1; Wed, 05 Jul 2023 14:59:17 -0400
X-MC-Unique: OsTEVUVcNbS56bJ6zS9djw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67A3C10504B6;
	Wed,  5 Jul 2023 18:59:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 58AE8140E952;
	Wed,  5 Jul 2023 18:59:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0CC06194658F;
	Wed,  5 Jul 2023 18:59:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E6CC31946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Jul 2023 18:59:14 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CFB5B1121315; Wed,  5 Jul 2023 18:59:14 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8B8C1121314
 for <cluster-devel@redhat.com>; Wed,  5 Jul 2023 18:59:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A92CE3C1CCCA
 for <cluster-devel@redhat.com>; Wed,  5 Jul 2023 18:59:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-DlN4NkubM5e9Btd8s-wIsw-1; Wed, 05 Jul 2023 14:59:11 -0400
X-MC-Unique: DlN4NkubM5e9Btd8s-wIsw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8AB0D616CE;
 Wed,  5 Jul 2023 18:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEF1C4167D;
 Wed,  5 Jul 2023 18:58:50 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: jk@ozlabs.org, arnd@arndb.de, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com,
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
 maco@android.com, joel@joelfernandes.org, brauner@kernel.org,
 cmllamas@google.com, surenb@google.com,
 dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca, leon@kernel.org,
 bwarrum@linux.ibm.com, rituagar@linux.ibm.com, ericvh@kernel.org,
 lucho@ionkov.net, asmadeus@codewreck.org, linux_oss@crudebyte.com,
 dsterba@suse.com, dhowells@redhat.com, marc.dionne@auristor.com,
 viro@zeniv.linux.org.uk, raven@themaw.net, luisbg@kernel.org,
 salah.triki@gmail.com, aivazian.tigran@gmail.com, ebiederm@xmission.com,
 keescook@chromium.org, clm@fb.com, josef@toxicpanda.com, xiubli@redhat.com,
 idryomov@gmail.com, jlayton@kernel.org, jaharkes@cs.cmu.edu,
 coda@cs.cmu.edu, jlbec@evilplan.org, hch@lst.de, nico@fluxnic.net,
 rafael@kernel.org, code@tyhicks.com, ardb@kernel.org, xiang@kernel.org,
 chao@kernel.org, huyue2@coolpad.com, jefflexu@linux.alibaba.com,
 linkinjeon@kernel.org, sj1557.seo@samsung.com, jack@suse.com,
 tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 hirofumi@mail.parknet.co.jp, miklos@szeredi.hu, rpeterso@redhat.com,
 agruenba@redhat.com, richard@nod.at, anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net, mikulas@artax.karlin.mff.cuni.cz,
 mike.kravetz@oracle.com, muchun.song@linux.dev, dwmw2@infradead.org,
 shaggy@kernel.org, tj@kernel.org, trond.myklebust@hammerspace.com,
 anna@kernel.org, chuck.lever@oracle.com, neilb@suse.de, kolga@netapp.com,
 Dai.Ngo@oracle.com, tom@talpey.com, konishi.ryusuke@gmail.com,
 anton@tuxera.com, almaz.alexandrovich@paragon-software.com,
 mark@fasheh.com, joseph.qi@linux.alibaba.com, me@bobcopeland.com,
 hubcap@omnibond.com, martin@omnibond.com, amir73il@gmail.com,
 mcgrof@kernel.org, yzaikin@google.com, tony.luck@intel.com,
 gpiccoli@igalia.com, al@alarsen.net, sfrench@samba.org, pc@manguebit.com,
 lsahlber@redhat.com, sprasad@microsoft.com, senozhatsky@chromium.org,
 phillip@squashfs.org.uk, rostedt@goodmis.org, mhiramat@kernel.org,
 dushistov@mail.ru, hdegoede@redhat.com, djwong@kernel.org,
 dlemoal@kernel.org, naohiro.aota@wdc.com, jth@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org, yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, hughd@google.com,
 akpm@linux-foundation.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, john.johansen@canonical.com,
 paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
 stephen.smalley.work@gmail.com, eparis@parisplace.org, jgross@suse.com,
 stern@rowland.harvard.edu, lrh2000@pku.edu.cn,
 sebastian.reichel@collabora.com, wsa+renesas@sang-engineering.com,
 quic_ugoswami@quicinc.com, quic_linyyuan@quicinc.com, john@keeping.me.uk,
 error27@gmail.com, quic_uaggarwa@quicinc.com, hayama@lineo.co.jp,
 jomajm@gmail.com, axboe@kernel.dk, dhavale@google.com, dchinner@redhat.com,
 hannes@cmpxchg.org, zhangpeng362@huawei.com, slava@dubeyko.com,
 gargaditya08@live.com, penguin-kernel@I-love.SAKURA.ne.jp,
 yifeliu@cs.stonybrook.edu, madkar@cs.stonybrook.edu, ezk@cs.stonybrook.edu,
 yuzhe@nfschina.com, willy@infradead.org, okanatov@gmail.com,
 jeffxu@chromium.org, linux@treblig.org, mirimmad17@gmail.com,
 yijiangshan@kylinos.cn, yang.yang29@zte.com.cn, xu.xin16@zte.com.cn,
 chengzhihao1@huawei.com, shr@devkernel.io, Liam.Howlett@Oracle.com,
 adobriyan@gmail.com, chi.minghao@zte.com.cn, roberto.sassu@huawei.com,
 linuszeng@tencent.com, bvanassche@acm.org, zohar@linux.ibm.com,
 yi.zhang@huawei.com, trix@redhat.com, fmdefrancesco@gmail.com,
 ebiggers@google.com, princekumarmaurya06@gmail.com,
 chenzhongjin@huawei.com, riel@surriel.com, shaozhengchao@huawei.com,
 jingyuwang_vip@163.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-usb@vger.kernel.org,
 v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-afs@lists.infradead.org, autofs@vger.kernel.org, linux-mm@kvack.org,
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org,
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-um@lists.infradead.org,
 linux-mtd@lists.infradead.org, jfs-discussion@lists.sourceforge.net,
 linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev,
 ocfs2-devel@lists.linux.dev, linux-karma-devel@lists.sourceforge.net,
 devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
 linux-hardening@vger.kernel.org, reiserfs-devel@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-trace-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, selinux@vger.kernel.org
Date: Wed,  5 Jul 2023 14:58:11 -0400
Message-ID: <20230705185812.579118-3-jlayton@kernel.org>
In-Reply-To: <20230705185812.579118-1-jlayton@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [Cluster-devel] [PATCH v2 08/92] fs: new helper:
 simple_rename_timestamp
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

A rename potentially involves updating 4 different inode timestamps. Add
a function that handles the details sanely, and convert the libfs.c
callers to use it.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/libfs.c         | 36 +++++++++++++++++++++++++++---------
 include/linux/fs.h |  2 ++
 2 files changed, 29 insertions(+), 9 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index a7e56baf8bbd..9ee79668c909 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -692,6 +692,31 @@ int simple_rmdir(struct inode *dir, struct dentry *den=
try)
 }
 EXPORT_SYMBOL(simple_rmdir);
=20
+/**
+ * simple_rename_timestamp - update the various inode timestamps for renam=
e
+ * @old_dir: old parent directory
+ * @old_dentry: dentry that is being renamed
+ * @new_dir: new parent directory
+ * @new_dentry: target for rename
+ *
+ * POSIX mandates that the old and new parent directories have their ctime=
 and
+ * mtime updated, and that inodes of @old_dentry and @new_dentry (if any),=
 have
+ * their ctime updated.
+ */
+void simple_rename_timestamp(struct inode *old_dir, struct dentry *old_den=
try,
+=09=09=09     struct inode *new_dir, struct dentry *new_dentry)
+{
+=09struct inode *newino =3D d_inode(new_dentry);
+
+=09old_dir->i_mtime =3D inode_set_ctime_current(old_dir);
+=09if (new_dir !=3D old_dir)
+=09=09new_dir->i_mtime =3D inode_set_ctime_current(new_dir);
+=09inode_set_ctime_current(d_inode(old_dentry));
+=09if (newino)
+=09=09inode_set_ctime_current(newino);
+}
+EXPORT_SYMBOL_GPL(simple_rename_timestamp);
+
 int simple_rename_exchange(struct inode *old_dir, struct dentry *old_dentr=
y,
 =09=09=09   struct inode *new_dir, struct dentry *new_dentry)
 {
@@ -707,11 +732,7 @@ int simple_rename_exchange(struct inode *old_dir, stru=
ct dentry *old_dentry,
 =09=09=09inc_nlink(old_dir);
 =09=09}
 =09}
-=09old_dir->i_ctime =3D old_dir->i_mtime =3D
-=09new_dir->i_ctime =3D new_dir->i_mtime =3D
-=09d_inode(old_dentry)->i_ctime =3D
-=09d_inode(new_dentry)->i_ctime =3D current_time(old_dir);
-
+=09simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
 =09return 0;
 }
 EXPORT_SYMBOL_GPL(simple_rename_exchange);
@@ -720,7 +741,6 @@ int simple_rename(struct mnt_idmap *idmap, struct inode=
 *old_dir,
 =09=09  struct dentry *old_dentry, struct inode *new_dir,
 =09=09  struct dentry *new_dentry, unsigned int flags)
 {
-=09struct inode *inode =3D d_inode(old_dentry);
 =09int they_are_dirs =3D d_is_dir(old_dentry);
=20
 =09if (flags & ~(RENAME_NOREPLACE | RENAME_EXCHANGE))
@@ -743,9 +763,7 @@ int simple_rename(struct mnt_idmap *idmap, struct inode=
 *old_dir,
 =09=09inc_nlink(new_dir);
 =09}
=20
-=09old_dir->i_ctime =3D old_dir->i_mtime =3D new_dir->i_ctime =3D
-=09=09new_dir->i_mtime =3D inode->i_ctime =3D current_time(old_dir);
-
+=09simple_rename_timestamp(old_dir, old_dentry, new_dir, new_dentry);
 =09return 0;
 }
 EXPORT_SYMBOL(simple_rename);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index bdfbd11a5811..14e38bd900f1 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2979,6 +2979,8 @@ extern int simple_open(struct inode *inode, struct fi=
le *file);
 extern int simple_link(struct dentry *, struct inode *, struct dentry *);
 extern int simple_unlink(struct inode *, struct dentry *);
 extern int simple_rmdir(struct inode *, struct dentry *);
+void simple_rename_timestamp(struct inode *old_dir, struct dentry *old_den=
try,
+=09=09=09     struct inode *new_dir, struct dentry *new_dentry);
 extern int simple_rename_exchange(struct inode *old_dir, struct dentry *ol=
d_dentry,
 =09=09=09=09  struct inode *new_dir, struct dentry *new_dentry);
 extern int simple_rename(struct mnt_idmap *, struct inode *,
--=20
2.41.0

