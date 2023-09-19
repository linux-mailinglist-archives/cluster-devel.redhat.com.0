Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 959627A69A6
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Sep 2023 19:30:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695144642;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2YOWI6/JAFOB4t8+Jl1G0UAU2WJNOEKR+ozWrF+wCHw=;
	b=TiIjebyta00uPK62atpfA9LRh5/neIuoLMxIRIqe8IPxVd7vnuK+zcNqSO36XsnsF/STeB
	1AnC8oP3HEtNkaLG8u65m+Up9k9GGEetj/aqO3S56gSXw70RtrTljWulm1lCcnCSDf/NCE
	E+hGg36AGaE5MsLbsVzPQ/SjBQwOR8k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-246-es3SfPNGNCu0IkDFoEa4IA-1; Tue, 19 Sep 2023 13:30:37 -0400
X-MC-Unique: es3SfPNGNCu0IkDFoEa4IA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05592800883;
	Tue, 19 Sep 2023 17:30:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E740AC15BB8;
	Tue, 19 Sep 2023 17:30:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 231C019465BB;
	Tue, 19 Sep 2023 17:30:18 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 157161946594 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 19 Sep 2023 16:40:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E4B4C2156702; Tue, 19 Sep 2023 16:40:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDC9E2156701
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 16:40:27 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE45B858F1C
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 16:40:27 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-425-Saf5bi8JNGKlGnrL4UjUPw-1; Tue,
 19 Sep 2023 12:40:23 -0400
X-MC-Unique: Saf5bi8JNGKlGnrL4UjUPw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 8CD0BCE139A;
 Tue, 19 Sep 2023 16:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A27C433CD;
 Tue, 19 Sep 2023 16:31:09 +0000 (UTC)
Message-ID: <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Bruno Haible <bruno@clisp.org>, Jan Kara <jack@suse.cz>, Xi Ruoyao
 <xry111@linuxfromscratch.org>, bug-gnulib@gnu.org
Date: Tue, 19 Sep 2023 12:31:08 -0400
In-Reply-To: <4511209.uG2h0Jr0uP@nimes>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
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
 linux-xfs@vger.kernel.org, "Darrick
 J. Wong" <djwong@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Amir Goldstein <l@gmail.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, Chao Yu <chao@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Gao Xiang <xiang@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 Christian Brauner <brauner@kernel.org>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-09-19 at 16:52 +0200, Bruno Haible wrote:
> Jeff Layton wrote:
> > I'm not sure what we can do for this test. The nap() function is making
> > an assumption that the timestamp granularity will be constant, and that
> > isn't necessarily the case now.
>=20
> This is only of secondary importance, because the scenario by Jan Kara
> shows a much more fundamental breakage:
>=20
> > > The ultimate problem is that a sequence like:
> > >=20
> > > write(f1)
> > > stat(f2)
> > > write(f2)
> > > stat(f2)
> > > write(f1)
> > > stat(f1)
> > >=20
> > > can result in f1 timestamp to be (slightly) lower than the final f2
> > > timestamp because the second write to f1 didn't bother updating the
> > > timestamp. That can indeed be a bit confusing to programs if they com=
pare
> > > timestamps between two files. Jeff?
> > >=20
> >=20
> > Basically yes.
>=20
> f1 was last written to *after* f2 was last written to. If the timestamp o=
f f1
> is then lower than the timestamp of f2, timestamps are fundamentally brok=
en.
>=20
> Many things in user-space depend on timestamps, such as build system
> centered around 'make', but also 'find ... -newer ...'.
>=20


What does breakage with make look like in this situation? The "fuzz"
here is going to be on the order of a jiffy. The typical case for make
timestamp comparisons is comparing source files vs. a build target. If
those are being written nearly simultaneously, then that could be an
issue, but is that a typical behavior? It seems like it would be hard to
rely on that anyway, esp. given filesystems like NFS that can do lazy
writeback.

One of the operating principles with this series is that timestamps can
be of varying granularity between different files. Note that Linux
already violates this assumption when you're working across filesystems
of different types.

As to potential fixes if this is a real problem:

I don't really want to put this behind a mount or mkfs option (a'la
relatime, etc.), but that is one possibility.

I wonder if it would be feasible to just advance the coarse-grained
current_time whenever we end up updating a ctime with a fine-grained
timestamp? It might produce some inode write amplification. Files that
were written within the same jiffy could see more inode transactions
logged, but that still might not be _too_ awful.

I'll keep thinking about it for now.
--=20
Jeff Layton <jlayton@kernel.org>

