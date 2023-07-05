Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0F574905B
	for <lists+cluster-devel@lfdr.de>; Wed,  5 Jul 2023 23:58:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688594298;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mxHGvJQ2lYXILM8RaLME+ro39f0e5w1WxdBDS1r/BDY=;
	b=boq2QxfCRV/VQ8A2/LmyN0JCr4/pixMICEwekcpWQA4aBUeEQTeuZDlumQmKIEfebXVl9y
	2Qvl2CwD7WuclUXVqoIQib42snb0i7vhY48cDDvXJOo4aROMQymNgZrtlU7zm2OS1yGRx9
	VsZ7x5TnssYb7zEzXOe1ocHkTL2Zlhw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-6EUJ_iTdNKefRhkgPLMlfA-1; Wed, 05 Jul 2023 17:58:14 -0400
X-MC-Unique: 6EUJ_iTdNKefRhkgPLMlfA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA16E101A528;
	Wed,  5 Jul 2023 21:58:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BEA5D4CD0C8;
	Wed,  5 Jul 2023 21:58:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A2D05194658F;
	Wed,  5 Jul 2023 21:58:13 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 634D91946588 for <cluster-devel@listman.corp.redhat.com>;
 Wed,  5 Jul 2023 21:58:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4304D207B2DD; Wed,  5 Jul 2023 21:58:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B295207B2DB
 for <cluster-devel@redhat.com>; Wed,  5 Jul 2023 21:58:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18790185A791
 for <cluster-devel@redhat.com>; Wed,  5 Jul 2023 21:58:12 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-cVhOnmE1Pe2JhAGFhoJP6w-1; Wed, 05 Jul 2023 17:58:08 -0400
X-MC-Unique: cVhOnmE1Pe2JhAGFhoJP6w-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E75216176E;
 Wed,  5 Jul 2023 21:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE02C433C7;
 Wed,  5 Jul 2023 21:57:47 +0000 (UTC)
Message-ID: <a4e6cfec345487fc9ac8ab814a817c79a61b123a.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: jk@ozlabs.org, arnd@arndb.de, mpe@ellerman.id.au, npiggin@gmail.com, 
 christophe.leroy@csgroup.eu, hca@linux.ibm.com, gor@linux.ibm.com, 
 agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, 
 gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
 maco@android.com,  joel@joelfernandes.org, brauner@kernel.org,
 cmllamas@google.com, surenb@google.com, 
 dennis.dalessandro@cornelisnetworks.com, jgg@ziepe.ca, leon@kernel.org, 
 bwarrum@linux.ibm.com, rituagar@linux.ibm.com, ericvh@kernel.org,
 lucho@ionkov.net,  asmadeus@codewreck.org, linux_oss@crudebyte.com,
 dsterba@suse.com,  dhowells@redhat.com, marc.dionne@auristor.com,
 viro@zeniv.linux.org.uk,  raven@themaw.net, luisbg@kernel.org,
 salah.triki@gmail.com,  aivazian.tigran@gmail.com, ebiederm@xmission.com,
 keescook@chromium.org,  clm@fb.com, josef@toxicpanda.com,
 xiubli@redhat.com, idryomov@gmail.com,  jaharkes@cs.cmu.edu,
 coda@cs.cmu.edu, jlbec@evilplan.org, hch@lst.de,  nico@fluxnic.net,
 rafael@kernel.org, code@tyhicks.com, ardb@kernel.org,  xiang@kernel.org,
 chao@kernel.org, huyue2@coolpad.com, jefflexu@linux.alibaba.com, 
 linkinjeon@kernel.org, sj1557.seo@samsung.com, jack@suse.com,
 tytso@mit.edu,  adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 hirofumi@mail.parknet.co.jp,  miklos@szeredi.hu, rpeterso@redhat.com,
 agruenba@redhat.com, richard@nod.at,  anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net,  mikulas@artax.karlin.mff.cuni.cz,
 mike.kravetz@oracle.com, muchun.song@linux.dev,  dwmw2@infradead.org,
 shaggy@kernel.org, tj@kernel.org,  trond.myklebust@hammerspace.com,
 anna@kernel.org, chuck.lever@oracle.com,  neilb@suse.de, kolga@netapp.com,
 Dai.Ngo@oracle.com, tom@talpey.com,  konishi.ryusuke@gmail.com,
 anton@tuxera.com,  almaz.alexandrovich@paragon-software.com,
 mark@fasheh.com,  joseph.qi@linux.alibaba.com, me@bobcopeland.com,
 hubcap@omnibond.com,  martin@omnibond.com, amir73il@gmail.com,
 mcgrof@kernel.org, yzaikin@google.com,  tony.luck@intel.com,
 gpiccoli@igalia.com, al@alarsen.net, sfrench@samba.org,  pc@manguebit.com,
 lsahlber@redhat.com, sprasad@microsoft.com,  senozhatsky@chromium.org,
 phillip@squashfs.org.uk, rostedt@goodmis.org,  mhiramat@kernel.org,
 dushistov@mail.ru, hdegoede@redhat.com, djwong@kernel.org, 
 dlemoal@kernel.org, naohiro.aota@wdc.com, jth@kernel.org, ast@kernel.org, 
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 song@kernel.org,  yhs@fb.com, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com,  haoluo@google.com, jolsa@kernel.org, hughd@google.com,
 akpm@linux-foundation.org,  davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com,  john.johansen@canonical.com,
 paul@paul-moore.com, jmorris@namei.org,  serge@hallyn.com,
 stephen.smalley.work@gmail.com, eparis@parisplace.org,  jgross@suse.com,
 stern@rowland.harvard.edu, lrh2000@pku.edu.cn, 
 sebastian.reichel@collabora.com, wsa+renesas@sang-engineering.com, 
 quic_ugoswami@quicinc.com, quic_linyyuan@quicinc.com, john@keeping.me.uk, 
 error27@gmail.com, quic_uaggarwa@quicinc.com, hayama@lineo.co.jp,
 jomajm@gmail.com,  axboe@kernel.dk, dhavale@google.com,
 dchinner@redhat.com, hannes@cmpxchg.org,  zhangpeng362@huawei.com,
 slava@dubeyko.com, gargaditya08@live.com, 
 penguin-kernel@I-love.SAKURA.ne.jp, yifeliu@cs.stonybrook.edu, 
 madkar@cs.stonybrook.edu, ezk@cs.stonybrook.edu, yuzhe@nfschina.com, 
 willy@infradead.org, okanatov@gmail.com, jeffxu@chromium.org,
 linux@treblig.org,  mirimmad17@gmail.com, yijiangshan@kylinos.cn,
 yang.yang29@zte.com.cn,  xu.xin16@zte.com.cn, chengzhihao1@huawei.com,
 shr@devkernel.io,  Liam.Howlett@Oracle.com, adobriyan@gmail.com,
 chi.minghao@zte.com.cn,  roberto.sassu@huawei.com, linuszeng@tencent.com,
 bvanassche@acm.org,  zohar@linux.ibm.com, yi.zhang@huawei.com,
 trix@redhat.com, fmdefrancesco@gmail.com,  ebiggers@google.com,
 princekumarmaurya06@gmail.com, chenzhongjin@huawei.com,  riel@surriel.com,
 shaozhengchao@huawei.com, jingyuwang_vip@163.com, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-rdma@vger.kernel.org, 
 linux-usb@vger.kernel.org, v9fs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org,  linux-afs@lists.infradead.org,
 autofs@vger.kernel.org, linux-mm@kvack.org,  linux-btrfs@vger.kernel.org,
 ceph-devel@vger.kernel.org,  codalist@coda.cs.cmu.edu,
 ecryptfs@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com, 
 linux-um@lists.infradead.org, linux-mtd@lists.infradead.org, 
 jfs-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org, 
 linux-nilfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, 
 ntfs3@lists.linux.dev, ocfs2-devel@lists.linux.dev, 
 linux-karma-devel@lists.sourceforge.net, devel@lists.orangefs.org, 
 linux-unionfs@vger.kernel.org, linux-hardening@vger.kernel.org, 
 reiserfs-devel@vger.kernel.org, linux-cifs@vger.kernel.org, 
 samba-technical@lists.samba.org, linux-trace-kernel@vger.kernel.org, 
 linux-xfs@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org
Date: Wed, 05 Jul 2023 17:57:46 -0400
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
> I've been working on a patchset to change how the inode->i_ctime is
> accessed in order to give us conditional, high-res timestamps for the
> ctime and mtime. struct timespec64 has unused bits in it that we can use
> to implement this. In order to do that however, we need to wrap all
> accesses of inode->i_ctime to ensure that bits used as flags are
> appropriately handled.
>=20
> The patchset starts with reposts of some missing ctime updates that I
> spotted in the tree. It then adds a new helper function for updating the
> timestamp after a successful rename, and new ctime accessor
> infrastructure.
>=20
> The bulk of the patchset is individual conversions of different
> subsysteme to use the new infrastructure. Finally, the patchset renames
> the i_ctime field to __i_ctime to help ensure that I didn't miss
> anything.
>=20
> This should apply cleanly to linux-next as of this morning.
>=20
> Most of this conversion was done via 5 different coccinelle scripts, run
> in succession, with a large swath of by-hand conversions to clean up the
> remainder.
>=20

A couple of other things I should note:

If you sent me an Acked-by or Reviewed-by in the previous set, then I
tried to keep it on the patch here, since the respun patches are mostly
just renaming stuff from v1. Let me know if I've missed any.

I've also pushed the pile to my tree as this tag:

    https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/tag/?=
h=3Dctime.20230705

In case that's easier to work with.

Cheers,
--=20
Jeff Layton <jlayton@kernel.org>

