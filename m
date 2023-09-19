Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 432097A619B
	for <lists+cluster-devel@lfdr.de>; Tue, 19 Sep 2023 13:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695123895;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3M0d3dD3pzePraPqdY5Lb/FSgSUINN1vw73+jr5dq7Q=;
	b=ItdtQ72MmDxLRJBHMPoXmWwnk8xW2VZPr2up8wg7puIRJIUrJu6IBOsWSe0paCFp1uAR1y
	wLATzJEY5C0Pt7f0uwGHYojCKFZdbB3AaFNrCBR/FfPVYjTR90jbFrIsri9Qjz4z0HQS1a
	YHX7LfmfJtqMSGcv/UNPczs9q+aTKDQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-uAUHKSOLMsGAmCgBAoFRUg-1; Tue, 19 Sep 2023 07:44:51 -0400
X-MC-Unique: uAUHKSOLMsGAmCgBAoFRUg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E33961875046;
	Tue, 19 Sep 2023 11:44:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 434CB140E950;
	Tue, 19 Sep 2023 11:44:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id ECDC71946594;
	Tue, 19 Sep 2023 11:44:48 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A3F21194658C for <cluster-devel@listman.corp.redhat.com>;
 Tue, 19 Sep 2023 11:44:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 807D21005E27; Tue, 19 Sep 2023 11:44:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 78B881006B72
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 11:44:41 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55C8E85A5A8
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 11:44:41 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-311-enpOYROMO7SMh64H3UWZKg-1; Tue,
 19 Sep 2023 07:44:37 -0400
X-MC-Unique: enpOYROMO7SMh64H3UWZKg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D45C8B815DD;
 Tue, 19 Sep 2023 11:33:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D159EC433C8;
 Tue, 19 Sep 2023 11:33:26 +0000 (UTC)
Message-ID: <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Jan Kara <jack@suse.cz>, Xi Ruoyao <xry111@linuxfromscratch.org>
Date: Tue, 19 Sep 2023 07:33:25 -0400
In-Reply-To: <20230919110457.7fnmzo4nqsi43yqq@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230807-mgctime-v7-12-d1dec143a704@kernel.org>
 <bf0524debb976627693e12ad23690094e4514303.camel@linuxfromscratch.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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
 linux-xfs@vger.kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, ecryptfs@vger.kernel.org,
 linux-unionfs@vger.kernel.org, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Eric Van Hensbergen <ericvh@kernel.org>, bug-gnulib@gnu.org,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Ilya Dryomov <idryomov@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Amir Goldstein <amir73il@gmail.com>,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-09-19 at 13:04 +0200, Jan Kara wrote:
> On Tue 19-09-23 15:05:24, Xi Ruoyao wrote:
> > On Mon, 2023-08-07 at 15:38 -0400, Jeff Layton wrote:
> > > Enable multigrain timestamps, which should ensure that there is an
> > > apparent change to the timestamp whenever it has been written after
> > > being actively observed via getattr.
> > >=20
> > > For ext4, we only need to enable the FS_MGTIME flag.
> >=20
> > Hi Jeff,
> >=20
> > This patch causes a gnulib test failure:
> >=20
> > $ ~/sources/lfs/grep-3.11/gnulib-tests/test-stat-time
> > test-stat-time.c:141: assertion 'statinfo[0].st_mtime < statinfo[2].st_=
mtime || (statinfo[0].st_mtime =3D=3D statinfo[2].st_mtime && (get_stat_mti=
me_ns (&statinfo[0]) < get_stat_mtime_ns (&statinfo[2])))' failed
> > Aborted (core dumped)
> >=20
> > The source code of the test:
> > https://git.savannah.gnu.org/cgit/gnulib.git/tree/tests/test-stat-time.=
c
> >=20
> > Is this an expected change?
>=20
> Kind of yes. The test first tries to estimate filesystem timestamp
> granularity in nap() function - due to this patch, the detected granulari=
ty
> will likely be 1 ns so effectively all the test calls will happen
> immediately one after another. But we don't bother setting the timestamps
> with more than 1 jiffy (usually 4 ms) precision unless we think someone i=
s
> watching. So as a result timestamps of all stamp1 and stamp2 files are
> going to be equal which makes the test fail.
>=20

That was my take too. The multigrain ctime changes are probably causing
nap() to settle on too small a time delta.

> The ultimate problem is that a sequence like:
>=20
> write(f1)
> stat(f2)
> write(f2)
> stat(f2)
> write(f1)
> stat(f1)
>
> can result in f1 timestamp to be (slightly) lower than the final f2
> timestamp because the second write to f1 didn't bother updating the
> timestamp. That can indeed be a bit confusing to programs if they compare
> timestamps between two files. Jeff?
>=20

Basically yes. When there is no stat() call issued on the file in
between writes, the kernel will use coarse-grained timestamps when
updating it (since no one is watching).


I'm not sure what we can do for this test. The nap() function is making
an assumption that the timestamp granularity will be constant, and that
isn't necessarily the case now.

--=20
Jeff Layton <jlayton@kernel.org>

