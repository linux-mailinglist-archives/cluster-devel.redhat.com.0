Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D08774D7AB
	for <lists+cluster-devel@lfdr.de>; Mon, 10 Jul 2023 15:32:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688995978;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ypo6EEC/a10vTp0LME1omXwBE1UiKK/mReyAl6l5UHQ=;
	b=hD9+sGdVHrRZIkJOZn8OdOOqT+urKBjLbKxWqOd82Rk977PN08Auc4VfOHHtfYP14Ev9ge
	WETfStvwifbL8yYdqWP6RqFkLWiOtLKWfjFwSfDdrI+IJUzFGDgs7zJ7DIFe9vLaFErxtN
	NQQ5lLXLWAdCBnKtcgVkOSvvJ6cImwI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-kqpoZoxcMhGXjAE9_t4UZA-1; Mon, 10 Jul 2023 09:32:55 -0400
X-MC-Unique: kqpoZoxcMhGXjAE9_t4UZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F7AE80006E;
	Mon, 10 Jul 2023 13:32:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 52A83111DCE0;
	Mon, 10 Jul 2023 13:32:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 24B1219465B5;
	Mon, 10 Jul 2023 13:32:53 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 12374194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 10 Jul 2023 13:32:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E5EB340C2070; Mon, 10 Jul 2023 13:32:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DE3F440C206F
 for <cluster-devel@redhat.com>; Mon, 10 Jul 2023 13:32:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC163104458D
 for <cluster-devel@redhat.com>; Mon, 10 Jul 2023 13:32:51 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-XemxKFR9M8miU9Uji1Cr_A-1; Mon, 10 Jul 2023 09:32:46 -0400
X-MC-Unique: XemxKFR9M8miU9Uji1Cr_A-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58D4060B8D;
 Mon, 10 Jul 2023 13:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E3BC433C9;
 Mon, 10 Jul 2023 13:32:24 +0000 (UTC)
Message-ID: <c4eaff9389fe63ec4e29404ec0d1181b74935426.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Date: Mon, 10 Jul 2023 09:32:23 -0400
In-Reply-To: <20230710-zudem-entkam-bb508cbd8c78@brauner>
References: <20230705185812.579118-1-jlayton@kernel.org>
 <5e40891f6423feb5b68f025e31f26e9a50ae9390.camel@kernel.org>
 <20230710-zudem-entkam-bb508cbd8c78@brauner>
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
 wsa+renesas@sang-engineering.com, gregkh@linuxfoundation.org,
 stephen.smalley.work@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, lsahlber@redhat.com, senozhatsky@chromium.org,
 arve@android.com, chuck.lever@oracle.com, svens@linux.ibm.com,
 jolsa@kernel.org, jack@suse.com, tj@kernel.org, akpm@linux-foundation.org,
 linux-trace-kernel@vger.kernel.org, xu.xin16@zte.com.cn, shaggy@kernel.org,
 dhavale@google.com, penguin-kernel@I-love.SAKURA.ne.jp, zohar@linux.ibm.com,
 linux-mm@kvack.org, joel@joelfernandes.org, edumazet@google.com,
 sdf@google.com, jomajm@gmail.com, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, paul@paul-moore.com, rituagar@linux.ibm.com,
 john.fastabend@gmail.com, mcgrof@kernel.org, chi.minghao@zte.com.cn,
 codalist@coda.cs.cmu.edu, selinux@vger.kernel.org, zhangpeng362@huawei.com,
 quic_ugoswami@quicinc.com, yhs@fb.com, yzaikin@google.com,
 linkinjeon@kernel.org, mhiramat@kernel.org, ecryptfs@vger.kernel.org,
 tkjos@android.com, madkar@cs.stonybrook.edu, gor@linux.ibm.com,
 yuzhe@nfschina.com, linuxppc-dev@lists.ozlabs.org,
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
 konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org, leon@kernel.org,
 luisbg@kernel.org, martin.lau@linux.dev, v9fs@lists.linux.dev,
 fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org, lrh2000@pku.edu.cn,
 linux-security-module@vger.kernel.org, ezk@cs.stonybrook.edu,
 jefflexu@linux.alibaba.com, linux@treblig.org, hannes@cmpxchg.org,
 phillip@squashfs.org.uk, johannes@sipsolutions.net, sj1557.seo@samsung.com,
 dwmw2@infradead.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, jlbec@evilplan.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 2023-07-10 at 14:35 +0200, Christian Brauner wrote:
> On Fri, Jul 07, 2023 at 08:42:31AM -0400, Jeff Layton wrote:
> > On Wed, 2023-07-05 at 14:58 -0400, Jeff Layton wrote:
> > > v2:
> > > - prepend patches to add missing ctime updates
> > > - add simple_rename_timestamp helper function
> > > - rename ctime accessor functions as inode_get_ctime/inode_set_ctime_=
*
> > > - drop individual inode_ctime_set_{sec,nsec} helpers
> > >=20
> >=20
> > After review by Jan and others, and Jan's ext4 rework, the diff on top
> > of the series I posted a couple of days ago is below. I don't really
> > want to spam everyone with another ~100 patch v3 series, but I can if
> > you think that's best.
> >=20
> > Christian, what would you like me to do here?
>=20
> I picked up the series from the list and folded the fixups you posted
> here into the respective fs conversion patches. I hope that helps you
> avoid a resend. You should have received a separate "thank you" mail for
> all of this.
>=20
> To each patch that I folded one of the fixlets from below into I added a
> git note that records a link to your mail here and the respective patch
> hunk from this mail that I folded into the patch. git.kernel.org will
> show notes by default. For example,
> https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/commit/?h=3Dv=
fs.ctime&id=3D8b0e3c2e99004609a16ba145bcbdfdddb78e220e
> should show you the note I added. You can also fetch them via
> git fetch $remote refs/notes/*:refs/notes/*
> (You probably know that ofc but jic.) if you're interested.
>=20
> Based on v6.5-rc1 as of today.
>=20

Many thanks!!! I'll get to work rebasing the multigrain timestamp series
on top of that.

> Btw, both b4 and patchwork somehow treat the series in weird was.
> IOW, based on the message id of the cover letter I was able to pull most
> messages except for:
>=20
> [07/92] fs: add ctime accessors infrastructure
> [08/92] fs: new helper: simple_rename_timestamp
> [92/92] fs: rename i_ctime field to __i_ctime
>=20
> which I pulled in separately. Not sure what the cause of=A0
>=20
> this is.

Good to know.

I ended up doing the send in two phases: one for the cover letter and
infrastructure patches that went to everyone, and one for the per-
subsystem patches that went do individual maintainers and lists.

I suspect that screwed up the message IDs somehow. Hopefully I won't
need to do a posting like that again soon, but I'll pay closer attention
to the message id handling next time.

Thanks again!
--=20
Jeff Layton <jlayton@kernel.org>

