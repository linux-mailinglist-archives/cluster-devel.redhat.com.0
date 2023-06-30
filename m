Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1307444FE
	for <lists+cluster-devel@lfdr.de>; Sat,  1 Jul 2023 01:01:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688166095;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=mmrCw93FsSgGVqkQGx3tY+c3DxJ3ErMGqt6cuZmQDk4=;
	b=RCMOv/k3ZmdQNDRUHOj0XXJrIbqD6T7H2gcMNRlwxI5r80x2uNWbD3xYkM8CsJjHzw82Ym
	3hFH8X5JrwTaqXcyqyS5kZx2PcTI94xxtsTRSLmj2W9mDxBdwx1kY5eu6ioP5myzgdcaZ3
	z6me5ieaHXfyzOhK/PNy9gYK5uZvJAk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-b-jx3kR1OXevA8tvhj0Vvg-1; Fri, 30 Jun 2023 19:01:32 -0400
X-MC-Unique: b-jx3kR1OXevA8tvhj0Vvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C964E858F1E;
	Fri, 30 Jun 2023 23:01:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B6D09F5CF4;
	Fri, 30 Jun 2023 23:01:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2150A1946A46;
	Fri, 30 Jun 2023 23:01:31 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A8CF519465B3 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 30 Jun 2023 22:51:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 426BC40C206F; Fri, 30 Jun 2023 22:51:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A9D340C2063
 for <cluster-devel@redhat.com>; Fri, 30 Jun 2023 22:51:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16740101A54E
 for <cluster-devel@redhat.com>; Fri, 30 Jun 2023 22:51:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-Wm9Iel4SN4uImXOlYCE0bQ-1; Fri, 30 Jun 2023 18:51:50 -0400
X-MC-Unique: Wm9Iel4SN4uImXOlYCE0bQ-1
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
 Hat Linux)) id 1qFML8-004eW8-2f; Fri, 30 Jun 2023 22:11:42 +0000
Date: Fri, 30 Jun 2023 15:11:42 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@inria.fr>, Takashi Iwai <tiwai@suse.de>
Message-ID: <ZJ9THiUlOUmm0xpD@bombadil.infradead.org>
References: <20230621144507.55591-1-jlayton@kernel.org>
 <20230621152141.5961cf5f@gandalf.local.home>
MIME-Version: 1.0
In-Reply-To: <20230621152141.5961cf5f@gandalf.local.home>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] [PATCH 00/79] fs: new accessors for
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>,
 Hugh Dickins <hughd@google.com>, John Johansen <john.johansen@canonical.com>,
 Seth Forshee <sforshee@digitalocean.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-xfs@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
 Michael Ellerman <mpe@ellerman.id.au>, John Keeping <john@keeping.me.uk>,
 Zhang Yi <yi.zhang@huawei.com>, James Morris <jmorris@namei.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Tyler Hicks <code@tyhicks.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-um@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
 Chuck Lever <chuck.lever@oracle.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-trace-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 Dave Kleikamp <shaggy@kernel.org>, Sandeep Dhavale <dhavale@google.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 samba-technical@lists.samba.org, Mimi Zohar <zohar@linux.ibm.com>,
 linux-mm@kvack.org, Joel Fernandes <joel@joelfernandes.org>,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Hangyu Hua <hbh25y@gmail.com>,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, Leon Romanovsky <leon@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 Minghao Chi <chi.minghao@zte.com.cn>, codalist@coda.cs.cmu.edu,
 selinux@vger.kernel.org, ZhangPeng <zhangpeng362@huawei.com>,
 Udipto Goswami <quic_ugoswami@quicinc.com>, Yonghong Song <yhs@fb.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, ecryptfs@vger.kernel.org,
 Todd Kjos <tkjos@android.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Yu Zhe <yuzhe@nfschina.com>, linuxppc-dev@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Yue Hu <huyue2@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Aditya Garg <gargaditya08@live.com>, Martijn Coenen <maco@android.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
 Muchun Song <muchun.song@linux.dev>, Roberto Sassu <roberto.sassu@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Jozef Martiniak <jomajm@gmail.com>, Eric Biederman <ebiederm@xmission.com>,
 Anna Schumaker <anna@kernel.org>, xu xin <cgel.zte@gmail.com>,
 Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 Jingyu Wang <jingyuwang_vip@163.com>, linux-efi@vger.kernel.org,
 Dan Carpenter <error27@gmail.com>, Martin Brandenburg <martin@omnibond.com>,
 Tom Rix <trix@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
 Chris Mason <clm@fb.com>, linux-mtd@lists.infradead.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
 Ian Kent <raven@themaw.net>, Naohiro Aota <naohiro.aota@wdc.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, Linyu Yuan <quic_linyyuan@quicinc.com>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Alexey Dobriyan <adobriyan@gmail.com>, "Serge E. Hallyn" <serge@hallyn.com>,
 Zhihao Cheng <chengzhihao1@huawei.com>, Jens Axboe <axboe@kernel.dk>,
 Zeng Jingxiang <linuszeng@tencent.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, autofs@vger.kernel.org,
 Yifei Liu <yifeliu@cs.stonybrook.edu>, Damien Le Moal <dlemoal@kernel.org>,
 Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, Jiangshan Yi <yijiangshan@kylinos.cn>,
 David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Song Liu <song@kernel.org>,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 ocfs2-devel@oss.oracle.com, jfs-discussion@lists.sourceforge.net,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>, KP Singh <kpsingh@kernel.org>,
 Oleg Kanatov <okanatov@gmail.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>, Yuta Hayama <hayama@lineo.co.jp>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Zhengchao Shao <shaozhengchao@huawei.com>,
 Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Stefan Roesch <shr@devkernel.io>, cluster-devel@redhat.com,
 Jason Gunthorpe <jgg@ziepe.ca>, Jakub Kicinski <kuba@kernel.org>,
 Rik van Riel <riel@surriel.com>, Salah Triki <salah.triki@gmail.com>,
 Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, Chao Yu <chao@kernel.org>,
 apparmor@lists.ubuntu.com, Josef Bacik <josef@toxicpanda.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Juergen Gross <jgross@suse.com>,
 Johannes Thumshirn <jth@kernel.org>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, v9fs@lists.linux.dev,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-unionfs@vger.kernel.org, Ruihan Li <lrh2000@pku.edu.cn>,
 linux-security-module@vger.kernel.org, Erez Zadok <ezk@cs.stonybrook.edu>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 21, 2023 at 03:21:41PM -0400, Steven Rostedt wrote:
> On Wed, 21 Jun 2023 10:45:05 -0400
> Jeff Layton <jlayton@kernel.org> wrote:
> 
> > Most of this conversion was done via coccinelle, with a few of the more
> > non-standard accesses done by hand. There should be no behavioral
> > changes with this set. That will come later, as we convert individual
> > filesystems to use multigrain timestamps.
> 
> BTW, Linus has suggested to me that whenever a conccinelle script is used,
> it should be included in the change log.

Sometimes people like the coccinelle included in the commit, sometimes
people don't [0], it really ends up being up to a subjective maintainer
preference. A compromise could be to use git notes as these are
optional, however if we want to go down that path we should try to make
a general consensus on it so we can send a consistent message.

[0] https://lore.kernel.org/all/20230512073100.GC32559@twin.jikos.cz/

  Luis

