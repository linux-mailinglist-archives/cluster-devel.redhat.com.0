Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3256F739E4D
	for <lists+cluster-devel@lfdr.de>; Thu, 22 Jun 2023 12:19:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687429150;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7+cabg86v1cYpPv8vDJOW5RfunjhlSEWXfJLwIkmtqs=;
	b=IeWh/5fCvrGhNrnAzmjPNxint23TNNEbIRgVy/ZBgWnJBmX43FFgnBe8zimWvBRUFjWI4o
	enV2JNmRKsNSoIC9WhOAVf04LrIKJicJ+DVXddbaLvG9kQdudFGAbHGSYGO+UIm/VxFhUN
	X6Hu9i7OLyRhwzhTsbnCa5vBB34ON3Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-maTPic-mP6KlVc5laT5C5g-1; Thu, 22 Jun 2023 06:19:07 -0400
X-MC-Unique: maTPic-mP6KlVc5laT5C5g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 953728564EF;
	Thu, 22 Jun 2023 10:19:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 63587C1ED96;
	Thu, 22 Jun 2023 10:19:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 504F2194658D;
	Thu, 22 Jun 2023 10:18:57 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 707C41946587 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 22 Jun 2023 10:14:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 5D5191402C06; Thu, 22 Jun 2023 10:14:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5643614682FA
 for <cluster-devel@redhat.com>; Thu, 22 Jun 2023 10:14:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 059391C0904B
 for <cluster-devel@redhat.com>; Thu, 22 Jun 2023 10:14:55 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-JhEK4yDvPg-4tiK-fniMDQ-1; Thu, 22 Jun 2023 06:14:51 -0400
X-MC-Unique: JhEK4yDvPg-4tiK-fniMDQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4277617BB;
 Thu, 22 Jun 2023 10:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2888C433C9;
 Thu, 22 Jun 2023 10:14:31 +0000 (UTC)
Message-ID: <ad4bfb630128709588164db6f1fd2ef39c31d2a5.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Damien Le Moal <dlemoal@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, Arnd
 Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>,  Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>, Todd Kjos
 <tkjos@android.com>, Martijn Coenen <maco@android.com>, Joel Fernandes
 <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, Carlos
 Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason
 Gunthorpe <jgg@ziepe.ca>,  Leon Romanovsky <leon@kernel.org>, Brad Warrum
 <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>, Eric Van
 Hensbergen <ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>, Christian Schoenebeck
 <linux_oss@crudebyte.com>, David Sterba <dsterba@suse.com>, David Howells
 <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Ian Kent <raven@themaw.net>, Luis de
 Bethencourt <luisbg@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Eric Biederman
 <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>, Chris Mason
 <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, Xiubo Li
 <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Jan Harkes
 <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, Joel Becker <jlbec@evilplan.org>,
 Christoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>,  "Rafael
 J. Wysocki" <rafael@kernel.org>, Tyler Hicks <code@tyhicks.com>, Ard
 Biesheuvel <ardb@kernel.org>, Gao Xiang <xiang@kernel.org>, Chao Yu
 <chao@kernel.org>,  Yue Hu <huyue2@coolpad.com>, Jeffle Xu
 <jefflexu@linux.alibaba.com>, Namjae Jeon <linkinjeon@kernel.org>, Sungjong
 Seo <sj1557.seo@samsung.com>, Jan Kara <jack@suse.com>, Theodore Ts'o
 <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, Jaegeuk Kim
 <jaegeuk@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Miklos
 Szeredi <miklos@szeredi.hu>, Bob Peterson <rpeterso@redhat.com>, Andreas
 Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Mikulas Patocka
 <mikulas@artax.karlin.mff.cuni.cz>,  Mike Kravetz
 <mike.kravetz@oracle.com>, Muchun Song <muchun.song@linux.dev>, David
 Woodhouse <dwmw2@infradead.org>, Dave Kleikamp <shaggy@kernel.org>, Tejun
 Heo <tj@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Anton Altaparmakov
 <anton@tuxera.com>,  Konstantin Komarov
 <almaz.alexandrovich@paragon-software.com>, Mark Fasheh <mark@fasheh.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Bob Copeland <me@bobcopeland.com>,
 Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg
 <martin@omnibond.com>, Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin
 <yzaikin@google.com>, Tony Luck <tony.luck@intel.com>,  "Guilherme G.
 Piccoli" <gpiccoli@igalia.com>, Anders Larsen <al@alarsen.net>, Steve
 French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.com>, Ronnie
 Sahlberg <lsahlber@redhat.com>, Shyam Prasad N <sprasad@microsoft.com>, Tom
 Talpey <tom@talpey.com>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, Steven Rostedt
 <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Evgeniy
 Dushistov <dushistov@mail.ru>, Hans de Goede <hdegoede@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>,  Hugh Dickins <hughd@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge
 E. Hallyn" <serge@hallyn.com>, Stephen Smalley
 <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, 
 Juergen Gross <jgross@suse.com>, Ruihan Li <lrh2000@pku.edu.cn>, Laurent
 Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Udipto Goswami
 <quic_ugoswami@quicinc.com>,  Linyu Yuan <quic_linyyuan@quicinc.com>, John
 Keeping <john@keeping.me.uk>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>, Dan Carpenter <error27@gmail.com>, Yuta Hayama
 <hayama@lineo.co.jp>, Jozef Martiniak <jomajm@gmail.com>, Jens Axboe
 <axboe@kernel.dk>, Alan Stern <stern@rowland.harvard.edu>, Sandeep Dhavale
 <dhavale@google.com>, Dave Chinner <dchinner@redhat.com>, Johannes Weiner
 <hannes@cmpxchg.org>, ZhangPeng <zhangpeng362@huawei.com>, Viacheslav
 Dubeyko <slava@dubeyko.com>, Tetsuo Handa
 <penguin-kernel@I-love.SAKURA.ne.jp>,  Aditya Garg <gargaditya08@live.com>,
 Erez Zadok <ezk@cs.stonybrook.edu>, Yifei Liu <yifeliu@cs.stonybrook.edu>,
 Yu Zhe <yuzhe@nfschina.com>, "Matthew Wilcox (Oracle)"
 <willy@infradead.org>, Oleg Kanatov <okanatov@gmail.com>, "Dr. David Alan
 Gilbert" <linux@treblig.org>, Jiangshan Yi <yijiangshan@kylinos.cn>, xu xin
 <cgel.zte@gmail.com>, Stefan Roesch <shr@devkernel.io>, Zhihao Cheng
 <chengzhihao1@huawei.com>, "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
 Alexey Dobriyan <adobriyan@gmail.com>, Minghao Chi
 <chi.minghao@zte.com.cn>, Seth Forshee <sforshee@digitalocean.com>, Zeng
 Jingxiang <linuszeng@tencent.com>, Bart Van Assche <bvanassche@acm.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>,
 Zhang Yi <yi.zhang@huawei.com>, Tom Rix <trix@redhat.com>, "Fabio M. De
 Francesco" <fmdefrancesco@gmail.com>, Chen Zhongjin
 <chenzhongjin@huawei.com>, Zhengchao Shao <shaozhengchao@huawei.com>, Rik
 van Riel <riel@surriel.com>, Jingyu Wang <jingyuwang_vip@163.com>, Hangyu
 Hua <hbh25y@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,  linux-s390@vger.kernel.org,
 linux-rdma@vger.kernel.org,  linux-usb@vger.kernel.org,
 v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-afs@lists.infradead.org, autofs@vger.kernel.org, linux-mm@kvack.org, 
 linux-btrfs@vger.kernel.org, ceph-devel@vger.kernel.org, 
 codalist@coda.cs.cmu.edu, ecryptfs@vger.kernel.org,
 linux-efi@vger.kernel.org,  linux-erofs@lists.ozlabs.org,
 linux-ext4@vger.kernel.org,  linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com,  linux-um@lists.infradead.org,
 linux-mtd@lists.infradead.org,  jfs-discussion@lists.sourceforge.net,
 linux-nfs@vger.kernel.org,  linux-nilfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net,  ntfs3@lists.linux.dev,
 ocfs2-devel@oss.oracle.com,  linux-karma-devel@lists.sourceforge.net,
 devel@lists.orangefs.org,  linux-unionfs@vger.kernel.org,
 linux-hardening@vger.kernel.org,  reiserfs-devel@vger.kernel.org,
 linux-cifs@vger.kernel.org,  samba-technical@lists.samba.org,
 linux-trace-kernel@vger.kernel.org,  linux-xfs@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,  apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org,  selinux@vger.kernel.org
Date: Thu, 22 Jun 2023 06:14:30 -0400
In-Reply-To: <99b3c749-23d9-6f09-fb75-6a84f3d1b066@kernel.org>
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621144507.55591-2-jlayton@kernel.org>
 <99b3c749-23d9-6f09-fb75-6a84f3d1b066@kernel.org>
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [PATCH 01/79] fs: add ctime accessors
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Thu, 2023-06-22 at 09:46 +0900, Damien Le Moal wrote:
> On 6/21/23 23:45, Jeff Layton wrote:
> > struct timespec64 has unused bits in the tv_nsec field that can be used
> > for other purposes. In future patches, we're going to change how the
> > inode->i_ctime is accessed in certain inodes in order to make use of
> > them. In order to do that safely though, we'll need to eradicate raw
> > accesses of the inode->i_ctime field from the kernel.
> >=20
> > Add new accessor functions for the ctime that we can use to replace the=
m.
> >=20
> > Signed-off-by: Jeff Layton <jlayton@kernel.org>
>=20
> [...]
>=20
> > +/**
> > + * inode_ctime_peek - fetch the current ctime from the inode
> > + * @inode: inode from which to fetch ctime
> > + *
> > + * Grab the current ctime from the inode and return it.
> > + */
> > +static inline struct timespec64 inode_ctime_peek(const struct inode *i=
node)
>=20
> To be consistent with inode_ctime_set(), why not call this one inode_ctim=
e_get()

In later patches fetching the ctime for presentation may have side
effects on certain filesystems. Using "peek" here is a hint that we want
to avoid those side effects in these calls.

> ? Also, inode_set_ctime() & inode_get_ctime() may be a little more natura=
l. But
> no strong opinion about that though.
>=20

I like the consistency of the inode_ctime_* prefix. It makes it simpler
to find these calls when grepping, etc.

That said, my opinions on naming are pretty loosely-held, so if the
consensus is that the names should as you suggest, I'll go along with
it.
--=20
Jeff Layton <jlayton@kernel.org>

