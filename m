Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A30277A888C
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Sep 2023 17:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695224273;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=shQOY5YSFRPH4MYjqUKwyU+DkSv5sjGrh2VkaY95KB0=;
	b=L2CyYggszgpY8/kG+/OLZF3lRmuQy6ap4Ffgz12nPKUqkme4OYV9Tgbvf4fufwbmu2uENx
	U0b0Dmdw6zUsMgTZi1yzd77kwlVKtx8pDJmzq9H7Zen1QEZOBR4TcbrWyM5HIzYnR73B93
	Zd74hHIunrc1KWOxCKcphOcGOL22eXM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-FzZ8e66DMdOOYhMsDLnz1A-1; Wed, 20 Sep 2023 11:37:50 -0400
X-MC-Unique: FzZ8e66DMdOOYhMsDLnz1A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A69028EC102;
	Wed, 20 Sep 2023 15:37:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ED3E440C2064;
	Wed, 20 Sep 2023 15:37:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A597E19465B7;
	Wed, 20 Sep 2023 15:37:38 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 069C619452F8 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 20 Sep 2023 15:30:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 05412215670B; Wed, 20 Sep 2023 15:30:00 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F17C02156702
 for <cluster-devel@redhat.com>; Wed, 20 Sep 2023 15:29:59 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D351985A5BA
 for <cluster-devel@redhat.com>; Wed, 20 Sep 2023 15:29:59 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-KXvCrSpTMm2BY7dZbtx0xw-1; Wed,
 20 Sep 2023 11:29:56 -0400
X-MC-Unique: KXvCrSpTMm2BY7dZbtx0xw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CB0C3CE168E;
 Wed, 20 Sep 2023 15:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E996C433C7;
 Wed, 20 Sep 2023 15:29:42 +0000 (UTC)
Message-ID: <4e6b2d3addc34619e5d2e35ccbd798362a1fb95a.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Christian Brauner <brauner@kernel.org>, Chuck Lever III
 <chuck.lever@oracle.com>, Jan Kara <jack@suse.cz>
Date: Wed, 20 Sep 2023 11:29:41 -0400
In-Reply-To: <20230920-keine-eile-c9755b5825db@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
 <20230920101731.ym6pahcvkl57guto@quack3>
 <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
 <20230920-raser-teehaus-029cafd5a6e4@brauner>
 <57C103E1-1AD2-4D86-926C-481BC6BDB191@oracle.com>
 <20230920-keine-eile-c9755b5825db@brauner>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: Re: [Cluster-devel] [PATCH v7 12/13] ext4: switch to multigrain
 timestamps
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
 Martin Brandenburg <martin@omnibond.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, "Darrick
 J. Wong" <djwong@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 "linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 "codalist@coda.cs.cmu.edu" <codalist@coda.cs.cmu.edu>,
 "linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Amir Goldstein <l@gmail.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 "bug-gnulib@gnu.org" <bug-gnulib@gnu.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Tyler Hicks <code@tyhicks.com>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "coda@cs.cmu.edu" <coda@cs.cmu.edu>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Gao Xiang <xiang@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Xi Ruoyao <xry111@linuxfromscratch.org>,
 Shyam Prasad N <sprasad@microsoft.com>,
 "ecryptfs@vger.kernel.org" <ecryptfs@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>,
 "ocfs2-devel@lists.linux.dev" <ocfs2-devel@lists.linux.dev>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
 Chao Yu <chao@kernel.org>,
 "linux-erofs@lists.ozlabs.org" <linux-erofs@lists.ozlabs.org>,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "v9fs@lists.linux.dev" <v9fs@lists.linux.dev>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 "devel@lists.orangefs.org" <devel@lists.orangefs.org>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Bruno Haible <bruno@clisp.org>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>,
 Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Wed, 2023-09-20 at 16:53 +0200, Christian Brauner wrote:
> > You could put it behind an EXPERIMENTAL Kconfig option so that the
> > code stays in and can be used by the brave or foolish while it is
> > still being refined.
>=20
> Given that the discussion has now fully gone back to the drawing board
> and this is a regression the honest thing to do is to revert the five
> patches that introduce the infrastructure:
>=20
> ffb6cf19e063 ("fs: add infrastructure for multigrain timestamps")
> d48c33972916 ("tmpfs: add support for multigrain timestamps")
> e44df2664746 ("xfs: switch to multigrain timestamps")
> 0269b585868e ("ext4: switch to multigrain timestamps")
> 50e9ceef1d4f ("btrfs: convert to multigrain timestamps")
>=20
> The conversion to helpers and cleanups are sane and should stay and can
> be used for any solution that gets built on top of it.
>=20
> I'd appreciate a look at the branch here:
> git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.ctime.rever=
t
>=20
> survives xfstests.

I think that's probably the wisest course of action. I need some time to
ponder the options for this series anyway, and another cycle in next
wouldn't hurt.

The branch itself looks fine, but you might want to reverse the order of
the patches in case someone lands there in the middle of a bisect. IOW,
I think you want to revert the "convert to multigrain" patches before
you revert the infrastructure.=20
--=20
Jeff Layton <jlayton@kernel.org>

