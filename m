Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A399D7A6E0C
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Sep 2023 00:06:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695161170;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zUwXRTycQ5/8w4O2DLNW2tCpGKQP5ZKMm2R2FWkIU1k=;
	b=EWCUMU9rQ5cLPJXFuJHE0z6o7LTPns33u76AMt4lCIS9JniXQ0zWfDhoy6pynXIpVG8gCC
	i0LDbHvi0RE2gMMZAP2uBl0NNfQ3l7pORGk4BNHd96dqpuRKpNCpwHdF+CVBO7rdgZvepR
	5ZqVbdOQskoy5Oop8v+gY+Myo0nZLMY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-gNM3kxJ1PYODcCeFfaCXTA-1; Tue, 19 Sep 2023 18:06:07 -0400
X-MC-Unique: gNM3kxJ1PYODcCeFfaCXTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84D6F811E7B;
	Tue, 19 Sep 2023 22:06:06 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5315240C2070;
	Tue, 19 Sep 2023 22:06:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 064AC1946595;
	Tue, 19 Sep 2023 22:06:04 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E38A194658D for <cluster-devel@listman.corp.redhat.com>;
 Tue, 19 Sep 2023 20:46:45 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 2A60BC154CA; Tue, 19 Sep 2023 20:46:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 234D3C15BB8
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 20:46:40 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0292E3C0DF70
 for <cluster-devel@redhat.com>; Tue, 19 Sep 2023 20:46:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-vs1rwSiwPLKw0nYzL7bF8w-1; Tue, 19 Sep 2023 16:46:36 -0400
X-MC-Unique: vs1rwSiwPLKw0nYzL7bF8w-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F2E59617B9;
 Tue, 19 Sep 2023 20:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A819FC433C9;
 Tue, 19 Sep 2023 20:46:26 +0000 (UTC)
Message-ID: <6e6da8a875a0defec1a0f58314995a6a12dca74e.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Paul Eggert <eggert@cs.ucla.edu>, Bruno Haible <bruno@clisp.org>, Jan
 Kara <jack@suse.cz>, Xi Ruoyao <xry111@linuxfromscratch.org>,
 bug-gnulib@gnu.org
Date: Tue, 19 Sep 2023 16:46:25 -0400
In-Reply-To: <c8315110-4684-9b83-d6c5-751647037623@cs.ucla.edu>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <c8315110-4684-9b83-d6c5-751647037623@cs.ucla.edu>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable

On Tue, 2023-09-19 at 13:10 -0700, Paul Eggert wrote:
> On 2023-09-19 09:31, Jeff Layton wrote:
> > The typical case for make
> > timestamp comparisons is comparing source files vs. a build target. If
> > those are being written nearly simultaneously, then that could be an
> > issue, but is that a typical behavior?
>=20
> I vaguely remember running into problems with 'make' a while ago=20
> (perhaps with a BSDish system) when filesystem timestamps were=20
> arbitrarily truncated in some cases but not others. These files would=20
> look older than they really were, so 'make' would think they were=20
> up-to-date when they weren't, and 'make' would omit actions that it=20
> should have done, thus screwing up the build.
>=20
> File timestamps can be close together with 'make -j' on fast hosts.=20
> Sometimes a shell script (or 'make' itself) will run 'make', then modify=
=20
> a file F, then immediately run 'make' again; the latter 'make' won't=20
> work if F's timestamp is mistakenly older than targets that depend on it.
>=20
> Although 'make'-like apps are the biggest canaries in this coal mine,=20
> the issue also affects 'find -newer' (as Bruno mentioned), 'rsync -u',=20
> 'mv -u', 'tar -u', Emacs file-newer-than-file-p, and surely many other=20
> places. For example, any app that creates a timestamp file, then backs=20
> up all files newer than that file, would be at risk.
>=20
>=20
> > I wonder if it would be feasible to just advance the coarse-grained
> > current_time whenever we end up updating a ctime with a fine-grained
> > timestamp?
>=20
> Wouldn't this need to be done globally, that is, not just on a per-file=
=20
> or per-filesystem basis? If so, I don't see how we'd avoid locking=20
> performance issues.
>=20

Maybe. Another idea might be to introduce a new timekeeper for
multigrain filesystems, but all of those would likely have to share the
same coarse-grained clock source.

So yeah, if you stat an inode and then update it, any inode written on a
multigrain filesystem within the same jiffy-sized window would have to
log an extra transaction to write out the inode. That's what I meant
when I was talking about write amplification.

>=20
> PS. Although I'm no expert in the Linux inode code I hope you don't mind=
=20
> my asking a question about this part of inode_set_ctime_current:
>=20
> =09/*
> =09 * If we've recently updated with a fine-grained timestamp,
> =09 * then the coarse-grained one may still be earlier than the
> =09 * existing ctime. Just keep the existing value if so.
> =09 */
> =09ctime.tv_sec =3D inode->__i_ctime.tv_sec;
> =09if (timespec64_compare(&ctime, &now) > 0)
> =09=09return ctime;
>=20
> Suppose root used clock_settime to set the clock backwards. Won't this=20
> code incorrectly refuse to update the file's timestamp afterwards? That=
=20
> is, shouldn't the last line be "goto fine_grained;" rather than "return=
=20
> ctime;", with the comment changed from "keep the existing value" to "use=
=20
> a fine-grained value"?

It is a problem, and Linus pointed that out yesterday, which is why I
sent this earlier today:

https://lore.kernel.org/linux-fsdevel/20230919-ctime-v1-1-97b3da92f504@kern=
el.org/T/#u

Bear in mind that we're not dealing with a situation where the value has
not been queried since its last update, so we don't need to use a fine
grained timestamp there (and really, it's preferable not to do so). A
coarse one should be fine in this case.
--=20
Jeff Layton <jlayton@kernel.org>

