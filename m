Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BB96074D530
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Jul 2023 14:20:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688991617;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rfQoefo0HRfMWxeFdiaWAXfUhQpS8JKxcvZBwUj06PI=;
	b=ETUHj+AcceF7c+x8A6VLLKxdDMOfD8w5wV7xIeldd9RyzxIfi1m7AUV4qNcFT90x8x4Cyj
	VpoB6vpvaVyFezZn9UMqq0ZnUh/dn2AhsDIGtraLFEt38j486tvhuyJC0YPXDa5VThPu4B
	TlefaPW3q9B8IGcNTd/8l+uKkO3m8AQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-aS_S4wxrN9yE0bo-7RkQnw-1; Mon, 10 Jul 2023 08:20:14 -0400
X-MC-Unique: aS_S4wxrN9yE0bo-7RkQnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6556C380671E;
	Mon, 10 Jul 2023 12:20:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 88C5A40C2070;
	Mon, 10 Jul 2023 12:20:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3055D19465B5;
	Mon, 10 Jul 2023 12:20:06 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 76946194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 10 Jul 2023 12:19:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 30305C478DE; Mon, 10 Jul 2023 12:19:55 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 27DD6C09A09
 for <cluster-devel@redhat.com>; Mon, 10 Jul 2023 12:19:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 088242A59572
 for <cluster-devel@redhat.com>; Mon, 10 Jul 2023 12:19:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-W6a_q5IiNpid-5yQPRXRxQ-1; Mon, 10 Jul 2023 08:19:51 -0400
X-MC-Unique: W6a_q5IiNpid-5yQPRXRxQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78E6460FAA;
 Mon, 10 Jul 2023 12:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD76EC433C7;
 Mon, 10 Jul 2023 12:19:06 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Date: Mon, 10 Jul 2023 14:18:51 +0200
Message-Id: <20230710-stift-flexibel-0867d393e8fa@brauner>
In-Reply-To: <20230705185812.579118-1-jlayton@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11283; i=brauner@kernel.org;
 h=from:subject:message-id; bh=2J+fX1q6zGco9Qkkut7k1oGUom0kvdTsmG/UR5nBS/g=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaSs/vZNcyJHQ0Srmfqv55c3nchaqnLhiXDZo5JbRxU5e1cl
 n+5y6yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIeSLDPw3jLbFNd8SdNfmWvzKRN5
 4i/XfC34/Ccjwx+uq6O0V4vRgZbnS7HzHcMNt5f8KEj277edSLOHh1Hm9NW7nW7fLG/4kybAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Cluster-devel] [PATCH v2 00/92] fs: new accessors for
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
 Christian Brauner <brauner@kernel.org>, wsa+renesas@sang-engineering.com,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 05 Jul 2023 14:58:09 -0400, Jeff Layton wrote:
> v2:
> - prepend patches to add missing ctime updates
> - add simple_rename_timestamp helper function
> - rename ctime accessor functions as inode_get_ctime/inode_set_ctime_*
> - drop individual inode_ctime_set_{sec,nsec} helpers
>=20
> I've been working on a patchset to change how the inode->i_ctime is
> accessed in order to give us conditional, high-res timestamps for the
> ctime and mtime. struct timespec64 has unused bits in it that we can use
> to implement this. In order to do that however, we need to wrap all
> accesses of inode->i_ctime to ensure that bits used as flags are
> appropriately handled.
>=20
> [...]

Applied to the vfs.ctime branch of the vfs/vfs.git tree.
Patches in the vfs.ctime branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.ctime

[01/92] ibmvmc: update ctime in conjunction with mtime on write
        https://git.kernel.org/vfs/vfs/c/ead310563ad2
[02/92] bfs: update ctime in addition to mtime when adding entries
        https://git.kernel.org/vfs/vfs/c/f42faf14b838
[03/92] efivarfs: update ctime when mtime changes on a write
        https://git.kernel.org/vfs/vfs/c/d8d026e0d1f2
[04/92] exfat: ensure that ctime is updated whenever the mtime is
        https://git.kernel.org/vfs/vfs/c/d84bd8fa48d7
[05/92] apparmor: update ctime whenever the mtime changes on an inode
        https://git.kernel.org/vfs/vfs/c/73955caedfae
[06/92] cifs: update the ctime on a partial page write
        https://git.kernel.org/vfs/vfs/c/c2f784379c99
[07/92] fs: add ctime accessors infrastructure
        https://git.kernel.org/vfs/vfs/c/64f0367de800
[08/92] fs: new helper: simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/54ced54a0239
[09/92] btrfs: convert to simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/218e0f662fee
[10/92] ubifs: convert to simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/caac4f65568d
[11/92] shmem: convert to simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/d3d11e9927b6
[12/92] exfat: convert to simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/71534b484c63
[13/92] ntfs3: convert to simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/140880821ce0
[14/92] reiserfs: convert to simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/1a1a4df5e8fc
[15/92] spufs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/784e5a93c9cf
[16/92] s390: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/1cece1f8e5c2
[17/92] binderfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/0bcd830a76f3
[18/92] infiniband: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/811f97f80b01
[19/92] ibm: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/b447ed7597f0
[20/92] usb: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/2557dc7f2dde
[21/92] 9p: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/4cd4b11385ef
[22/92] adfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/e257d7ade66e
[23/92] affs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/770619f19a77
[24/92] afs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/758506e44668
[25/92] fs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/a0a5a9810b37
[26/92] autofs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/d7d1363cc3f6
[27/92] befs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/d6218773de2d
[28/92] bfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/368b313ac2ab
[29/92] btrfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/d3d15221956a
[30/92] ceph: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/818fc6e0129a
[31/92] coda: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/4e0b22fbc012
[32/92] configfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/69c977798a6a
[33/92] cramfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/911f086eae23
[34/92] debugfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/634a50390dbb
[35/92] devpts: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/92bb29a24707
[36/92] ecryptfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/16d21856dfd6
[37/92] efivarfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/cfeee05a50e1
[38/92] efs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/3a30b097319f
[39/92] erofs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/e3594996216f
[40/92] exfat: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/8bd562d6f46d
[41/92] ext2: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/7483252e8894
[42/92] ext4: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/f2ddb05870fb
[43/92] 9afc475653af f2fs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/f2ddb05870fb
[44/92] fat: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/8a0c417b695b
[45/92] freevxfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/7affaeb5b914
[46/92] fuse: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/688279761436
[47/92] gfs2: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/9e5b114b5ee4
[48/92] hfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/d41f5876a177
[49/92] hfsplus: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/147f3dd171d2
[50/92] hostfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/2ceaa835b4f5
[51/92] hpfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/e6fd7f49daa7
[52/92] hugetlbfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/f5950f079b1a
[53/92] isofs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/53f2bb3567f0
[54/92] jffs2: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/7e8dc4ab1afb
[55/92] jfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/77737373dbb3
[56/92] kernfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/8b0e3c2e9900
[57/92] nfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/12844cb15dc6
[58/92] nfsd: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/f297728268bf
[59/92] nilfs2: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/1e9f083bc9cd
[60/92] ntfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/3cc66672eaa5
[61/92] ntfs3: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/9438de01396e
[62/92] ocfs2: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/da5b97da32e7
[63/92] omfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/563d772c8d70
[64/92] openpromfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/5f0978a6f0a6
[65/92] orangefs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/6a83804b4325
[66/92] overlayfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/60dcee636746
[67/92] procfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/85e0a6b3b8cf
[68/92] pstore: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/2b8125b5e7c6
[69/92] qnx4: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/77eb00659cb5
[70/92] qnx6: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/af1acd38df36
[71/92] ramfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/0eb8012f4b0b
[72/92] reiserfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/e3e5f5f70292
[73/92] romfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/b6058a9af143
[74/92] smb: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/d5c263f2187d
[75/92] squashfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/eaace9c73ba8
[76/92] sysv: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/41b6f4fbbe32
[77/92] tracefs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/5f69a5364568
[78/92] ubifs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/5bb225ba81c0
[79/92] udf: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/e251f0e98433
[80/92] ufs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/376ef9f6cab1
[81/92] vboxsf: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/9f06612951d5
[82/92] xfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/4e8c1361146f
[83/92] zonefs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/cbdc6aa5f65d
[84/92] linux: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/ff12abb4a71a
[85/92] mqueue: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/a6b5a0055142
[86/92] bpf: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/d2b6a0a3863a
[87/92] shmem: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/ffcd778237d3
[88/92] sunrpc: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/ccf1c9002d71
[89/92] apparmor: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/ff91aaa76f1a
[90/92] security: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/701071f9ad33
[91/92] selinux: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/cb6dfffdc7e9
[92/92] fs: rename i_ctime field to __i_ctime
        https://git.kernel.org/vfs/vfs/c/c06d4bf5e207

