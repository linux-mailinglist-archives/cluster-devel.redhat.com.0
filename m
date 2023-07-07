Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3C474B114
	for <lists+cluster-devel@lfdr.de>; Fri,  7 Jul 2023 14:43:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688733790;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jIcF0sYBsCqRvOsPEg18fPKUz2MIpTNkgvsx3zNjXCE=;
	b=N54F9Vs0iW6CpCufa2SZoWSZ8gK7X7FIFj/pIA7Ro3pLlT14v1g5PwTK4tGlYxhKvjuEqc
	8qtbDtYh/ob0mMN8ZJavkKCnnFab4wm56MKhXhym4wnzcaQxr1Resen9qGzjgSR/2a5Vgg
	CLvQy2aLQt4f0JmWccloC5IAlNDXNu4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-c7uqhDGYOTWIEG7yP_JVEA-1; Fri, 07 Jul 2023 08:43:05 -0400
X-MC-Unique: c7uqhDGYOTWIEG7yP_JVEA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 565CE3849529;
	Fri,  7 Jul 2023 12:43:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BEBB6200B402;
	Fri,  7 Jul 2023 12:43:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3AE5D19465A0;
	Fri,  7 Jul 2023 12:43:02 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 09BDE1946589 for <cluster-devel@listman.corp.redhat.com>;
 Fri,  7 Jul 2023 12:43:01 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EE23440C2070; Fri,  7 Jul 2023 12:43:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E657540C206F
 for <cluster-devel@redhat.com>; Fri,  7 Jul 2023 12:43:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C19CC85CEE6
 for <cluster-devel@redhat.com>; Fri,  7 Jul 2023 12:43:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-PfyrUKMANL2gwUR7p6BWnA-1; Fri, 07 Jul 2023 08:42:54 -0400
X-MC-Unique: PfyrUKMANL2gwUR7p6BWnA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 46E6860DC0;
 Fri,  7 Jul 2023 12:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96F41C433C7;
 Fri,  7 Jul 2023 12:42:32 +0000 (UTC)
Message-ID: <5e40891f6423feb5b68f025e31f26e9a50ae9390.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Date: Fri, 07 Jul 2023 08:42:31 -0400
In-Reply-To: <20230705185812.579118-1-jlayton@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH v2 00/89] fs: new accessors for
 inode->i_ctime
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
Cc: lucho@ionkov.net, rafael@kernel.org, djwong@kernel.org, al@alarsen.net,
 cmllamas@google.com, andrii@kernel.org, hughd@google.com,
 john.johansen@canonical.com, agordeev@linux.ibm.com, hch@lst.de,
 hubcap@omnibond.com, pc@manguebit.com, linux-xfs@vger.kernel.org,
 bvanassche@acm.org, jeffxu@chromium.org, mpe@ellerman.id.au,
 john@keeping.me.uk, yi.zhang@huawei.com, jmorris@namei.org,
 christophe.leroy@csgroup.eu, code@tyhicks.com, stern@rowland.harvard.edu,
 borntraeger@linux.ibm.com, devel@lists.orangefs.org, mirimmad17@gmail.com,
 sprasad@microsoft.com, jaharkes@cs.cmu.edu, linux-um@lists.infradead.org,
 npiggin@gmail.com, viro@zeniv.linux.org.uk, ericvh@kernel.org,
 surenb@google.com, trond.myklebust@hammerspace.com, anton@tuxera.com,
 brauner@kernel.org, wsa+renesas@sang-engineering.com,
 gregkh@linuxfoundation.org, stephen.smalley.work@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, lsahlber@redhat.com,
 senozhatsky@chromium.org, arve@android.com, chuck.lever@oracle.com,
 svens@linux.ibm.com, jolsa@kernel.org, jack@suse.com, tj@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, shaggy@kernel.org, dhavale@google.com,
 penguin-kernel@I-love.SAKURA.ne.jp, zohar@linux.ibm.com, linux-mm@kvack.org,
 joel@joelfernandes.org, edumazet@google.com, sdf@google.com, jomajm@gmail.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, paul@paul-moore.com,
 leon@kernel.org, john.fastabend@gmail.com, mcgrof@kernel.org,
 chi.minghao@zte.com.cn, codalist@coda.cs.cmu.edu, selinux@vger.kernel.org,
 zhangpeng362@huawei.com, quic_ugoswami@quicinc.com, yhs@fb.com,
 yzaikin@google.com, linkinjeon@kernel.org, mhiramat@kernel.org,
 ecryptfs@vger.kernel.org, tkjos@android.com, madkar@cs.stonybrook.edu,
 gor@linux.ibm.com, yuzhe@nfschina.com, linuxppc-dev@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, miklos@szeredi.hu, huyue2@coolpad.com,
 jaegeuk@kernel.org, gargaditya08@live.com, maco@android.com,
 hirofumi@mail.parknet.co.jp, haoluo@google.com, tony.luck@intel.com,
 tytso@mit.edu, nico@fluxnic.net, linux-ntfs-dev@lists.sourceforge.net,
 muchun.song@linux.dev, roberto.sassu@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net, yang.yang29@zte.com.cn,
 gpiccoli@igalia.com, ebiederm@xmission.com, anna@kernel.org,
 quic_uaggarwa@quicinc.com, bwarrum@linux.ibm.com, mike.kravetz@oracle.com,
 jingyuwang_vip@163.com, linux-efi@vger.kernel.org, error27@gmail.com,
 martin@omnibond.com, trix@redhat.com, ocfs2-devel@lists.linux.dev,
 ast@kernel.org, sebastian.reichel@collabora.com, clm@fb.com,
 linux-mtd@lists.infradead.org, willy@infradead.org, marc.dionne@auristor.com,
 linux-afs@lists.infradead.org, raven@themaw.net, naohiro.aota@wdc.com,
 daniel@iogearbox.net, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, quic_linyyuan@quicinc.com, coda@cs.cmu.edu,
 slava@dubeyko.com, idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com,
 serge@hallyn.com, chengzhihao1@huawei.com, axboe@kernel.dk, amir73il@gmail.com,
 linuszeng@tencent.com, keescook@chromium.org, arnd@arndb.de,
 autofs@vger.kernel.org, rostedt@goodmis.org, yifeliu@cs.stonybrook.edu,
 dlemoal@kernel.org, eparis@parisplace.org, ceph-devel@vger.kernel.org,
 xiang@kernel.org, yijiangshan@kylinos.cn, dhowells@redhat.com,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, kolga@netapp.com,
 song@kernel.org, samba-technical@lists.samba.org, sfrench@samba.org,
 jk@ozlabs.org, netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 davem@davemloft.net, jfs-discussion@lists.sourceforge.net,
 princekumarmaurya06@gmail.com, ebiggers@google.com, neilb@suse.de,
 asmadeus@codewreck.org, linux_oss@crudebyte.com, me@bobcopeland.com,
 kpsingh@kernel.org, okanatov@gmail.com,
 almaz.alexandrovich@paragon-software.com, joseph.qi@linux.alibaba.com,
 hayama@lineo.co.jp, adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz,
 shaozhengchao@huawei.com, chenzhongjin@huawei.com, ardb@kernel.org,
 anton.ivanov@cambridgegreys.com, richard@nod.at, mark@fasheh.com,
 shr@devkernel.io, Dai.Ngo@oracle.com, cluster-devel@redhat.com, jgg@ziepe.ca,
 kuba@kernel.org, riel@surriel.com, salah.triki@gmail.com, dushistov@mail.ru,
 linux-cifs@vger.kernel.org, hca@linux.ibm.com, chao@kernel.org,
 apparmor@lists.ubuntu.com, josef@toxicpanda.com, Liam.Howlett@Oracle.com,
 tom@talpey.com, hdegoede@redhat.com, linux-hardening@vger.kernel.org,
 aivazian.tigran@gmail.com, dsterba@suse.com, xiubli@redhat.com,
 konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org,
 rituagar@linux.ibm.com, luisbg@kernel.org, martin.lau@linux.dev,
 v9fs@lists.linux.dev, fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org,
 lrh2000@pku.edu.cn, linux-security-module@vger.kernel.org,
 ezk@cs.stonybrook.edu, jefflexu@linux.alibaba.com, linux@treblig.org,
 hannes@cmpxchg.org, phillip@squashfs.org.uk, johannes@sipsolutions.net,
 sj1557.seo@samsung.com, dwmw2@infradead.org,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 jlbec@evilplan.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-07-05 at 14:58 -0400, Jeff Layton wrote:
> v2:
> - prepend patches to add missing ctime updates
> - add simple_rename_timestamp helper function
> - rename ctime accessor functions as inode_get_ctime/inode_set_ctime_*
> - drop individual inode_ctime_set_{sec,nsec} helpers
>=20

After review by Jan and others, and Jan's ext4 rework, the diff on top
of the series I posted a couple of days ago is below. I don't really
want to spam everyone with another ~100 patch v3 series, but I can if
you think that's best.

Christian, what would you like me to do here?

diff --git a/fs/ceph/inode.c b/fs/ceph/inode.c
index bcdb1a0beccf..5f6e93714f5a 100644
--- a/fs/ceph/inode.c
+++ b/fs/ceph/inode.c
@@ -699,8 +699,7 @@ void ceph_fill_file_time(struct inode *inode, int issue=
d,
 =09=09if (ci->i_version =3D=3D 0 ||
 =09=09    timespec64_compare(ctime, &ictime) > 0) {
 =09=09=09dout("ctime %lld.%09ld -> %lld.%09ld inc w/ cap\n",
-=09=09=09     inode_get_ctime(inode).tv_sec,
-=09=09=09     inode_get_ctime(inode).tv_nsec,
+=09=09=09     ictime.tv_sec, ictime.tv_nsec,
 =09=09=09     ctime->tv_sec, ctime->tv_nsec);
 =09=09=09inode_set_ctime_to_ts(inode, *ctime);
 =09=09}
diff --git a/fs/erofs/inode.c b/fs/erofs/inode.c
index 806374d866d1..567c0d305ea4 100644
--- a/fs/erofs/inode.c
+++ b/fs/erofs/inode.c
@@ -175,10 +175,7 @@ static void *erofs_read_inode(struct erofs_buf *buf,
 =09=09vi->chunkbits =3D sb->s_blocksize_bits +
 =09=09=09(vi->chunkformat & EROFS_CHUNK_FORMAT_BLKBITS_MASK);
 =09}
-=09inode->i_mtime.tv_sec =3D inode_get_ctime(inode).tv_sec;
-=09inode->i_atime.tv_sec =3D inode_get_ctime(inode).tv_sec;
-=09inode->i_mtime.tv_nsec =3D inode_get_ctime(inode).tv_nsec;
-=09inode->i_atime.tv_nsec =3D inode_get_ctime(inode).tv_nsec;
+=09inode->i_mtime =3D inode->i_atime =3D inode_get_ctime(inode);
=20
 =09inode->i_flags &=3D ~S_DAX;
 =09if (test_opt(&sbi->opt, DAX_ALWAYS) && S_ISREG(inode->i_mode) &&
diff --git a/fs/exfat/namei.c b/fs/exfat/namei.c
index c007de6ac1c7..1b9f587f6cca 100644
--- a/fs/exfat/namei.c
+++ b/fs/exfat/namei.c
@@ -1351,7 +1351,7 @@ static int exfat_rename(struct mnt_idmap *idmap,
 =09=09=09exfat_warn(sb, "abnormal access to an inode dropped");
 =09=09=09WARN_ON(new_inode->i_nlink =3D=3D 0);
 =09=09}
-=09=09EXFAT_I(new_inode)->i_crtime =3D inode_set_ctime_current(new_inode);
+=09=09EXFAT_I(new_inode)->i_crtime =3D current_time(new_inode);
 =09}
=20
 unlock:
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index d502b930431b..d63543187359 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -868,64 +868,63 @@ struct ext4_inode {
  * affected filesystem before 2242.
  */
=20
-static inline __le32 ext4_encode_extra_time(struct timespec64 *time)
+static inline __le32 ext4_encode_extra_time(struct timespec64 ts)
 {
-=09u32 extra =3D((time->tv_sec - (s32)time->tv_sec) >> 32) & EXT4_EPOCH_MA=
SK;
-=09return cpu_to_le32(extra | (time->tv_nsec << EXT4_EPOCH_BITS));
+=09u32 extra =3D ((ts.tv_sec - (s32)ts.tv_sec) >> 32) & EXT4_EPOCH_MASK;
+=09return cpu_to_le32(extra | (ts.tv_nsec << EXT4_EPOCH_BITS));
 }
=20
-static inline void ext4_decode_extra_time(struct timespec64 *time,
-=09=09=09=09=09  __le32 extra)
+static inline struct timespec64 ext4_decode_extra_time(__le32 base,
+=09=09=09=09=09=09       __le32 extra)
 {
+=09struct timespec64 ts =3D { .tv_sec =3D le32_to_cpu(base) };
+
 =09if (unlikely(extra & cpu_to_le32(EXT4_EPOCH_MASK)))
-=09=09time->tv_sec +=3D (u64)(le32_to_cpu(extra) & EXT4_EPOCH_MASK) << 32;
-=09time->tv_nsec =3D (le32_to_cpu(extra) & EXT4_NSEC_MASK) >> EXT4_EPOCH_B=
ITS;
+=09=09ts.tv_sec +=3D (u64)(le32_to_cpu(extra) & EXT4_EPOCH_MASK) << 32;
+=09ts.tv_nsec =3D (le32_to_cpu(extra) & EXT4_NSEC_MASK) >> EXT4_EPOCH_BITS=
;
+=09return ts;
 }
=20
-#define EXT4_INODE_SET_XTIME(xtime, inode, raw_inode)=09=09=09=09\
+#define EXT4_INODE_SET_XTIME_VAL(xtime, inode, raw_inode, ts)=09=09=09\
 do {=09=09=09=09=09=09=09=09=09=09\
-=09if (EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), xtime ## _extra))     =
{\
-=09=09(raw_inode)->xtime =3D cpu_to_le32((inode)->xtime.tv_sec);=09\
-=09=09(raw_inode)->xtime ## _extra =3D=09=09=09=09=09\
-=09=09=09=09ext4_encode_extra_time(&(inode)->xtime);=09\
-=09=09}=09=09=09=09=09=09=09=09\
-=09else=09\
-=09=09(raw_inode)->xtime =3D cpu_to_le32(clamp_t(int32_t, (inode)->xtime.t=
v_sec, S32_MIN, S32_MAX));=09\
+=09if (EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), xtime ## _extra)) {=09=
\
+=09=09(raw_inode)->xtime =3D cpu_to_le32((ts).tv_sec);=09=09=09\
+=09=09(raw_inode)->xtime ## _extra =3D ext4_encode_extra_time(ts);=09\
+=09} else=09=09=09=09=09=09=09=09=09\
+=09=09(raw_inode)->xtime =3D cpu_to_le32(clamp_t(int32_t, (ts).tv_sec, S32=
_MIN, S32_MAX));=09\
 } while (0)
=20
+#define EXT4_INODE_SET_XTIME(xtime, inode, raw_inode)=09=09=09=09\
+=09EXT4_INODE_SET_XTIME_VAL(xtime, inode, raw_inode, (inode)->xtime)
+
+#define EXT4_INODE_SET_CTIME(inode, raw_inode)=09=09=09=09=09\
+=09EXT4_INODE_SET_XTIME_VAL(i_ctime, inode, raw_inode, inode_get_ctime(ino=
de))
+
 #define EXT4_EINODE_SET_XTIME(xtime, einode, raw_inode)=09=09=09       \
-do {=09=09=09=09=09=09=09=09=09       \
-=09if (EXT4_FITS_IN_INODE(raw_inode, einode, xtime))=09=09       \
-=09=09(raw_inode)->xtime =3D cpu_to_le32((einode)->xtime.tv_sec);      \
-=09if (EXT4_FITS_IN_INODE(raw_inode, einode, xtime ## _extra))=09       \
-=09=09(raw_inode)->xtime ## _extra =3D=09=09=09=09       \
-=09=09=09=09ext4_encode_extra_time(&(einode)->xtime);      \
-} while (0)
+=09EXT4_INODE_SET_XTIME_VAL(xtime, &((einode)->vfs_inode), raw_inode, (ein=
ode)->xtime)
+
+#define EXT4_INODE_GET_XTIME_VAL(xtime, inode, raw_inode)=09=09=09\
+=09(EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), xtime ## _extra) ?=09\
+=09=09ext4_decode_extra_time((raw_inode)->xtime,=09=09=09=09\
+=09=09=09=09       (raw_inode)->xtime ## _extra) :=09=09\
+=09=09(struct timespec64) {=09=09=09=09=09=09\
+=09=09=09.tv_sec =3D (signed)le32_to_cpu((raw_inode)->xtime)=09\
+=09=09})
=20
 #define EXT4_INODE_GET_XTIME(xtime, inode, raw_inode)=09=09=09=09\
 do {=09=09=09=09=09=09=09=09=09=09\
-=09(inode)->xtime.tv_sec =3D (signed)le32_to_cpu((raw_inode)->xtime);=09\
-=09if (EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), xtime ## _extra)) {=09=
\
-=09=09ext4_decode_extra_time(&(inode)->xtime,=09=09=09=09\
-=09=09=09=09       raw_inode->xtime ## _extra);=09=09\
-=09=09}=09=09=09=09=09=09=09=09\
-=09else=09=09=09=09=09=09=09=09=09\
-=09=09(inode)->xtime.tv_nsec =3D 0;=09=09=09=09=09\
+=09(inode)->xtime =3D EXT4_INODE_GET_XTIME_VAL(xtime, inode, raw_inode);=
=09\
 } while (0)
=20
+#define EXT4_INODE_GET_CTIME(inode, raw_inode)=09=09=09=09=09\
+do {=09=09=09=09=09=09=09=09=09=09\
+=09inode_set_ctime_to_ts(inode,=09=09=09=09=09=09\
+=09=09EXT4_INODE_GET_XTIME_VAL(i_ctime, inode, raw_inode));=09=09\
+} while (0)
=20
 #define EXT4_EINODE_GET_XTIME(xtime, einode, raw_inode)=09=09=09       \
 do {=09=09=09=09=09=09=09=09=09       \
-=09if (EXT4_FITS_IN_INODE(raw_inode, einode, xtime))=09=09       \
-=09=09(einode)->xtime.tv_sec =3D =09=09=09=09       \
-=09=09=09(signed)le32_to_cpu((raw_inode)->xtime);=09       \
-=09else=09=09=09=09=09=09=09=09       \
-=09=09(einode)->xtime.tv_sec =3D 0;=09=09=09=09       \
-=09if (EXT4_FITS_IN_INODE(raw_inode, einode, xtime ## _extra))=09       \
-=09=09ext4_decode_extra_time(&(einode)->xtime,=09=09       \
-=09=09=09=09       raw_inode->xtime ## _extra);=09       \
-=09else=09=09=09=09=09=09=09=09       \
-=09=09(einode)->xtime.tv_nsec =3D 0;=09=09=09=09       \
+=09(einode)->xtime =3D EXT4_INODE_GET_XTIME_VAL(xtime, &(einode->vfs_inode=
), raw_inode);=09\
 } while (0)
=20
 #define i_disk_version osd1.linux1.l_i_version
@@ -3823,27 +3822,6 @@ static inline int ext4_buffer_uptodate(struct buffer=
_head *bh)
 =09return buffer_uptodate(bh);
 }
=20
-static inline void ext4_inode_set_ctime(struct inode *inode, struct ext4_i=
node *raw_inode)
-{
-=09struct timespec64 ctime =3D inode_get_ctime(inode);
-
-=09if (EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), i_ctime_extra)) {
-=09=09raw_inode->i_ctime =3D cpu_to_le32(ctime.tv_sec);
-=09=09raw_inode->i_ctime_extra =3D ext4_encode_extra_time(&ctime);
-=09} else {
-=09=09raw_inode->i_ctime =3D cpu_to_le32(clamp_t(int32_t, ctime.tv_sec, S3=
2_MIN, S32_MAX));
-=09}
-}
-
-static inline void ext4_inode_get_ctime(struct inode *inode, const struct =
ext4_inode *raw_inode)
-{
-=09struct timespec64 ctime =3D { .tv_sec =3D (signed)le32_to_cpu(raw_inode=
->i_ctime) };
-
-=09if (EXT4_FITS_IN_INODE(raw_inode, EXT4_I(inode), i_ctime_extra))
-=09=09ext4_decode_extra_time(&ctime, raw_inode->i_ctime_extra);
-=09inode_set_ctime(inode, ctime.tv_sec, ctime.tv_nsec);
-}
-
 #endif=09/* __KERNEL__ */
=20
 #define EFSBADCRC=09EBADMSG=09=09/* Bad CRC detected */
diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
index 7935ea6cf92c..f0c0fd507fbc 100644
--- a/fs/ext4/inode-test.c
+++ b/fs/ext4/inode-test.c
@@ -245,9 +245,9 @@ static void inode_test_xtimestamp_decoding(struct kunit=
 *test)
 =09struct timestamp_expectation *test_param =3D
 =09=09=09(struct timestamp_expectation *)(test->param_value);
=20
-=09timestamp.tv_sec =3D get_32bit_time(test_param);
-=09ext4_decode_extra_time(&timestamp,
-=09=09=09       cpu_to_le32(test_param->extra_bits));
+=09timestamp =3D ext4_decode_extra_time(
+=09=09=09=09cpu_to_le32(get_32bit_time(test_param)),
+=09=09=09=09cpu_to_le32(test_param->extra_bits));
=20
 =09KUNIT_EXPECT_EQ_MSG(test,
 =09=09=09    test_param->expected.tv_sec,
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index bbc57954dfd3..c6a837b90af4 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -4249,7 +4249,7 @@ static int ext4_fill_raw_inode(struct inode *inode, s=
truct ext4_inode *raw_inode
 =09}
 =09raw_inode->i_links_count =3D cpu_to_le16(inode->i_nlink);
=20
-=09ext4_inode_set_ctime(inode, raw_inode);
+=09EXT4_INODE_SET_CTIME(inode, raw_inode);
 =09EXT4_INODE_SET_XTIME(i_mtime, inode, raw_inode);
 =09EXT4_INODE_SET_XTIME(i_atime, inode, raw_inode);
 =09EXT4_EINODE_SET_XTIME(i_crtime, ei, raw_inode);
@@ -4858,7 +4858,7 @@ struct inode *__ext4_iget(struct super_block *sb, uns=
igned long ino,
 =09=09}
 =09}
=20
-=09ext4_inode_get_ctime(inode, raw_inode);
+=09EXT4_INODE_GET_CTIME(inode, raw_inode);
 =09EXT4_INODE_GET_XTIME(i_mtime, inode, raw_inode);
 =09EXT4_INODE_GET_XTIME(i_atime, inode, raw_inode);
 =09EXT4_EINODE_GET_XTIME(i_crtime, ei, raw_inode);
@@ -4981,7 +4981,7 @@ static void __ext4_update_other_inode_time(struct sup=
er_block *sb,
 =09=09spin_unlock(&inode->i_lock);
=20
 =09=09spin_lock(&ei->i_raw_lock);
-=09=09ext4_inode_get_ctime(inode, raw_inode);
+=09=09EXT4_INODE_SET_CTIME(inode, raw_inode);
 =09=09EXT4_INODE_SET_XTIME(i_mtime, inode, raw_inode);
 =09=09EXT4_INODE_SET_XTIME(i_atime, inode, raw_inode);
 =09=09ext4_inode_csum_set(inode, raw_inode, ei);
diff --git a/fs/fat/inode.c b/fs/fat/inode.c
index 2be40ff8a74f..cdd39b6020f3 100644
--- a/fs/fat/inode.c
+++ b/fs/fat/inode.c
@@ -1407,9 +1407,7 @@ static int fat_read_root(struct inode *inode)
 =09MSDOS_I(inode)->mmu_private =3D inode->i_size;
=20
 =09fat_save_attrs(inode, ATTR_DIR);
-=09inode->i_mtime.tv_sec =3D inode->i_atime.tv_sec =3D inode_set_ctime(ino=
de,
-=09=09=09=09=09=09=09=09=090, 0).tv_sec;
-=09inode->i_mtime.tv_nsec =3D inode->i_atime.tv_nsec =3D 0;
+=09inode->i_mtime =3D inode->i_atime =3D inode_set_ctime(inode, 0, 0);
 =09set_nlink(inode, fat_subdirs(inode)+2);
=20
 =09return 0;
diff --git a/fs/hpfs/namei.c b/fs/hpfs/namei.c
index 36babb78b510..f4eb8d6f5989 100644
--- a/fs/hpfs/namei.c
+++ b/fs/hpfs/namei.c
@@ -15,8 +15,7 @@ static void hpfs_update_directory_times(struct inode *dir=
)
 =09if (t =3D=3D dir->i_mtime.tv_sec &&
 =09    t =3D=3D inode_get_ctime(dir).tv_sec)
 =09=09return;
-=09dir->i_mtime.tv_sec =3D inode_set_ctime(dir, t, 0).tv_sec;
-=09dir->i_mtime.tv_nsec =3D 0;
+=09dir->i_mtime =3D inode_set_ctime(dir, t, 0);
 =09hpfs_write_inode_nolock(dir);
 }
=20
@@ -59,11 +58,8 @@ static int hpfs_mkdir(struct mnt_idmap *idmap, struct in=
ode *dir,
 =09result->i_ino =3D fno;
 =09hpfs_i(result)->i_parent_dir =3D dir->i_ino;
 =09hpfs_i(result)->i_dno =3D dno;
-=09inode_set_ctime(result,
-=09=09=09result->i_mtime.tv_sec =3D result->i_atime.tv_sec =3D local_to_gm=
t(dir->i_sb, le32_to_cpu(dee.creation_date)),
-=09=09=090);
-=09result->i_mtime.tv_nsec =3D 0;=20
-=09result->i_atime.tv_nsec =3D 0;=20
+=09result->i_mtime =3D result->i_atime =3D
+=09=09inode_set_ctime(result, local_to_gmt(dir->i_sb, le32_to_cpu(dee.crea=
tion_date)), 0);
 =09hpfs_i(result)->i_ea_size =3D 0;
 =09result->i_mode |=3D S_IFDIR;
 =09result->i_op =3D &hpfs_dir_iops;
@@ -168,11 +164,8 @@ static int hpfs_create(struct mnt_idmap *idmap, struct=
 inode *dir,
 =09result->i_fop =3D &hpfs_file_ops;
 =09set_nlink(result, 1);
 =09hpfs_i(result)->i_parent_dir =3D dir->i_ino;
-=09inode_set_ctime(result,
-=09=09=09result->i_mtime.tv_sec =3D result->i_atime.tv_sec =3D local_to_gm=
t(dir->i_sb, le32_to_cpu(dee.creation_date)),
-=09=09=090);
-=09result->i_mtime.tv_nsec =3D 0;
-=09result->i_atime.tv_nsec =3D 0;
+=09result->i_mtime =3D result->i_atime =3D
+=09=09inode_set_ctime(result, local_to_gmt(dir->i_sb, le32_to_cpu(dee.crea=
tion_date)), 0);
 =09hpfs_i(result)->i_ea_size =3D 0;
 =09if (dee.read_only)
 =09=09result->i_mode &=3D ~0222;
@@ -252,11 +245,8 @@ static int hpfs_mknod(struct mnt_idmap *idmap, struct =
inode *dir,
 =09hpfs_init_inode(result);
 =09result->i_ino =3D fno;
 =09hpfs_i(result)->i_parent_dir =3D dir->i_ino;
-=09inode_set_ctime(result,
-=09=09=09result->i_mtime.tv_sec =3D result->i_atime.tv_sec =3D local_to_gm=
t(dir->i_sb, le32_to_cpu(dee.creation_date)),
-=09=09=090);
-=09result->i_mtime.tv_nsec =3D 0;
-=09result->i_atime.tv_nsec =3D 0;
+=09result->i_mtime =3D result->i_atime =3D
+=09=09inode_set_ctime(result, local_to_gmt(dir->i_sb, le32_to_cpu(dee.crea=
tion_date)), 0);
 =09hpfs_i(result)->i_ea_size =3D 0;
 =09result->i_uid =3D current_fsuid();
 =09result->i_gid =3D current_fsgid();
@@ -329,11 +319,8 @@ static int hpfs_symlink(struct mnt_idmap *idmap, struc=
t inode *dir,
 =09result->i_ino =3D fno;
 =09hpfs_init_inode(result);
 =09hpfs_i(result)->i_parent_dir =3D dir->i_ino;
-=09inode_set_ctime(result,
-=09=09=09result->i_mtime.tv_sec =3D result->i_atime.tv_sec =3D local_to_gm=
t(dir->i_sb, le32_to_cpu(dee.creation_date)),
-=09=09=090);
-=09result->i_mtime.tv_nsec =3D 0;
-=09result->i_atime.tv_nsec =3D 0;
+=09result->i_mtime =3D result->i_atime =3D
+=09=09inode_set_ctime(result, local_to_gmt(dir->i_sb, le32_to_cpu(dee.crea=
tion_date)), 0);
 =09hpfs_i(result)->i_ea_size =3D 0;
 =09result->i_mode =3D S_IFLNK | 0777;
 =09result->i_uid =3D current_fsuid();
diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
index 98a78200cff1..2ee21286ac8f 100644
--- a/fs/isofs/inode.c
+++ b/fs/isofs/inode.c
@@ -1422,13 +1422,8 @@ static int isofs_read_inode(struct inode *inode, int=
 relocated)
 =09=09=09inode->i_ino, de->flags[-high_sierra]);
 =09}
 #endif
-
-=09inode->i_mtime.tv_sec =3D
-=09inode->i_atime.tv_sec =3D inode_set_ctime(inode,
-=09=09=09=09=09=09iso_date(de->date, high_sierra),
-=09=09=09=09=09=090).tv_sec;
-=09inode->i_mtime.tv_nsec =3D
-=09inode->i_atime.tv_nsec =3D 0;
+=09inode->i_mtime =3D inode->i_atime =3D
+=09=09inode_set_ctime(inode, iso_date(de->date, high_sierra), 0);
=20
 =09ei->i_first_extent =3D (isonum_733(de->extent) +
 =09=09=09isonum_711(de->ext_attr_length));
diff --git a/fs/minix/inode.c b/fs/minix/inode.c
index 3715a3940bd4..8a4fc9420b36 100644
--- a/fs/minix/inode.c
+++ b/fs/minix/inode.c
@@ -501,11 +501,7 @@ static struct inode *V1_minix_iget(struct inode *inode=
)
 =09i_gid_write(inode, raw_inode->i_gid);
 =09set_nlink(inode, raw_inode->i_nlinks);
 =09inode->i_size =3D raw_inode->i_size;
-=09inode->i_mtime.tv_sec =3D inode->i_atime.tv_sec =3D inode_set_ctime(ino=
de,
-=09=09=09=09=09=09=09=09=09raw_inode->i_time,
-=09=09=09=09=09=09=09=09=090).tv_sec;
-=09inode->i_mtime.tv_nsec =3D 0;
-=09inode->i_atime.tv_nsec =3D 0;
+=09inode->i_mtime =3D inode->i_atime =3D inode_set_ctime(inode, raw_inode-=
>i_time, 0);
 =09inode->i_blocks =3D 0;
 =09for (i =3D 0; i < 9; i++)
 =09=09minix_inode->u.i1_data[i] =3D raw_inode->i_zone[i];
diff --git a/fs/overlayfs/file.c b/fs/overlayfs/file.c
index 7acd3e3fe790..7e7876aae01c 100644
--- a/fs/overlayfs/file.c
+++ b/fs/overlayfs/file.c
@@ -255,7 +255,7 @@ static void ovl_file_accessed(struct file *file)
 =09if ((!timespec64_equal(&inode->i_mtime, &upperinode->i_mtime) ||
 =09     !timespec64_equal(&ctime, &uctime))) {
 =09=09inode->i_mtime =3D upperinode->i_mtime;
-=09=09inode_set_ctime_to_ts(inode, inode_get_ctime(upperinode));
+=09=09inode_set_ctime_to_ts(inode, uctime);
 =09}
=20
 =09touch_atime(&file->f_path);
diff --git a/fs/romfs/super.c b/fs/romfs/super.c
index 961b9d342e0e..d89739655f9e 100644
--- a/fs/romfs/super.c
+++ b/fs/romfs/super.c
@@ -322,8 +322,7 @@ static struct inode *romfs_iget(struct super_block *sb,=
 unsigned long pos)
=20
 =09set_nlink(i, 1);=09=09/* Hard to decide.. */
 =09i->i_size =3D be32_to_cpu(ri.size);
-=09i->i_mtime.tv_sec =3D i->i_atime.tv_sec =3D inode_set_ctime(i, 0, 0).tv=
_sec;
-=09i->i_mtime.tv_nsec =3D i->i_atime.tv_nsec =3D 0;
+=09i->i_mtime =3D i->i_atime =3D inode_set_ctime(i, 0, 0);
=20
 =09/* set up mode and ops */
 =09mode =3D romfs_modemap[nextfh & ROMFH_TYPE];
diff --git a/fs/smb/client/fscache.h b/fs/smb/client/fscache.h
index a228964bc2ce..84f3b09367d2 100644
--- a/fs/smb/client/fscache.h
+++ b/fs/smb/client/fscache.h
@@ -56,7 +56,7 @@ void cifs_fscache_fill_coherency(struct inode *inode,
 =09cd->last_write_time_sec   =3D cpu_to_le64(cifsi->netfs.inode.i_mtime.tv=
_sec);
 =09cd->last_write_time_nsec  =3D cpu_to_le32(cifsi->netfs.inode.i_mtime.tv=
_nsec);
 =09cd->last_change_time_sec  =3D cpu_to_le64(ctime.tv_sec);
-=09cd->last_change_time_nsec  =3D cpu_to_le64(ctime.tv_nsec);
+=09cd->last_change_time_nsec =3D cpu_to_le32(ctime.tv_nsec);
 }
=20
=20

--=20
Jeff Layton <jlayton@kernel.org>

