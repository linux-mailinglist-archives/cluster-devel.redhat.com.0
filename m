Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA20748C58
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Jul 2023 20:59:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688583543;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RtXZFm+PNDFYt8Un/efOWhpD0DsuoT48QVHjxQTf0Dg=;
	b=aHT6KLyfeMzuVNaXvQwe8L/cUZNZnsmH1H0NLvjushms1y6XDSgk/n+G3qKZgDvhcMsnxu
	H98omUiObEjNmp0pCBKyZ/Q5jdwuhAOpszudbxKLdcMimwdI1sYGTSbtPDYYXY1WO6ns59
	vnqLPxBiyjCH7qXs5y8EFERN5X0pTys=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361--GO7TtJzNHedOd3FzSewpw-1; Wed, 05 Jul 2023 14:59:00 -0400
X-MC-Unique: -GO7TtJzNHedOd3FzSewpw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70991809F8F;
	Wed,  5 Jul 2023 18:58:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62CC54087C6A;
	Wed,  5 Jul 2023 18:58:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 29DE2194658F;
	Wed,  5 Jul 2023 18:58:59 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EFF511946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Jul 2023 18:58:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D8D5015230A8; Wed,  5 Jul 2023 18:58:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D05C615230A7
 for <cluster-devel@redhat.com>; Wed,  5 Jul 2023 18:58:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6BCE185A7A8
 for <cluster-devel@redhat.com>; Wed,  5 Jul 2023 18:58:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-x9zwouEwOqecTsJPA4omrg-1; Wed, 05 Jul 2023 14:58:53 -0400
X-MC-Unique: x9zwouEwOqecTsJPA4omrg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 32928616DA;
 Wed,  5 Jul 2023 18:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048E0C433BB;
 Wed,  5 Jul 2023 18:58:31 +0000 (UTC)
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
Date: Wed,  5 Jul 2023 14:58:10 -0400
Message-ID: <20230705185812.579118-2-jlayton@kernel.org>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] [PATCH v2 07/92] fs: add ctime accessors
 infrastructure
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
Cc: Jan Kara <jack@suse.cz>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"; x-default=true

struct timespec64 has unused bits in the tv_nsec field that can be used
for other purposes. In future patches, we're going to change how the
inode->i_ctime is accessed in certain inodes in order to make use of
them. In order to do that safely though, we'll need to eradicate raw
accesses of the inode->i_ctime field from the kernel.

Add new accessor functions for the ctime that we use to replace them.

Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/inode.c         | 16 ++++++++++++++++
 include/linux/fs.h | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/fs/inode.c b/fs/inode.c
index d37fad91c8da..21b026d95b51 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -2499,6 +2499,22 @@ struct timespec64 current_time(struct inode *inode)
 }
 EXPORT_SYMBOL(current_time);
=20
+/**
+ * inode_set_ctime_current - set the ctime to current_time
+ * @inode: inode
+ *
+ * Set the inode->i_ctime to the current value for the inode. Returns
+ * the current value that was assigned to i_ctime.
+ */
+struct timespec64 inode_set_ctime_current(struct inode *inode)
+{
+=09struct timespec64 now =3D current_time(inode);
+
+=09inode_set_ctime(inode, now.tv_sec, now.tv_nsec);
+=09return now;
+}
+EXPORT_SYMBOL(inode_set_ctime_current);
+
 /**
  * in_group_or_capable - check whether caller is CAP_FSETID privileged
  * @idmap:=09idmap of the mount @inode was found from
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 824accb89a91..bdfbd11a5811 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1474,7 +1474,50 @@ static inline bool fsuidgid_has_mapping(struct super=
_block *sb,
 =09       kgid_has_mapping(fs_userns, kgid);
 }
=20
-extern struct timespec64 current_time(struct inode *inode);
+struct timespec64 current_time(struct inode *inode);
+struct timespec64 inode_set_ctime_current(struct inode *inode);
+
+/**
+ * inode_get_ctime - fetch the current ctime from the inode
+ * @inode: inode from which to fetch ctime
+ *
+ * Grab the current ctime from the inode and return it.
+ */
+static inline struct timespec64 inode_get_ctime(const struct inode *inode)
+{
+=09return inode->i_ctime;
+}
+
+/**
+ * inode_set_ctime_to_ts - set the ctime in the inode
+ * @inode: inode in which to set the ctime
+ * @ts: value to set in the ctime field
+ *
+ * Set the ctime in @inode to @ts
+ */
+static inline struct timespec64 inode_set_ctime_to_ts(struct inode *inode,
+=09=09=09=09=09=09      struct timespec64 ts)
+{
+=09inode->i_ctime =3D ts;
+=09return ts;
+}
+
+/**
+ * inode_set_ctime - set the ctime in the inode
+ * @inode: inode in which to set the ctime
+ * @sec: tv_sec value to set
+ * @nsec: tv_nsec value to set
+ *
+ * Set the ctime in @inode to { @sec, @nsec }
+ */
+static inline struct timespec64 inode_set_ctime(struct inode *inode,
+=09=09=09=09=09=09time64_t sec, long nsec)
+{
+=09struct timespec64 ts =3D { .tv_sec  =3D sec,
+=09=09=09=09 .tv_nsec =3D nsec };
+
+=09return inode_set_ctime_to_ts(inode, ts);
+}
=20
 /*
  * Snapshotting support.
--=20
2.41.0

