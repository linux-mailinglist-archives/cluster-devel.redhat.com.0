Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C783B7A7C9F
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Sep 2023 14:02:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695211369;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=KOwFYJFVauAzGdLHiygCqgNB24b8lWzTQA0Uqsb4joQ=;
	b=Pt20RPkzNQjgm6hVnOt+6/V0CZlcfHwE8i0Y48ZreE9Ts5v6Aw076PcZl+zAFPtV0OeHv+
	NYgk6okonKJ163w+sO8f/YVDj4n19cmrcypMNiBZiFu0N+zSxUOKYsgRi8XXplWDS5RIqL
	W/yHWxdpcJXksva5+769W3Q92s19Vnk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-1_rNkfEYNuS0tZDv2AVZkg-1; Wed, 20 Sep 2023 08:02:44 -0400
X-MC-Unique: 1_rNkfEYNuS0tZDv2AVZkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6DD233800BBA;
	Wed, 20 Sep 2023 12:02:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F50F40C6EBF;
	Wed, 20 Sep 2023 12:02:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 171E51946595;
	Wed, 20 Sep 2023 12:02:43 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 105B1194658D for <cluster-devel@listman.corp.redhat.com>;
 Wed, 20 Sep 2023 11:49:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0203240C2070; Wed, 20 Sep 2023 11:49:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EEBAD40C2064
 for <cluster-devel@redhat.com>; Wed, 20 Sep 2023 11:49:25 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C30F01019C8C
 for <cluster-devel@redhat.com>; Wed, 20 Sep 2023 11:49:25 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-368-FUhEt8UaM7y27teS_yujuQ-1; Wed,
 20 Sep 2023 07:49:23 -0400
X-MC-Unique: FUhEt8UaM7y27teS_yujuQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96616B81CD5;
 Wed, 20 Sep 2023 11:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6370EC433C9;
 Wed, 20 Sep 2023 11:49:02 +0000 (UTC)
Date: Wed, 20 Sep 2023 13:48:59 +0200
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230920-raser-teehaus-029cafd5a6e4@brauner>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
 <20230920101731.ym6pahcvkl57guto@quack3>
 <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
 Jan Kara <jack@suse.cz>, linux-xfs@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Hans de Goede <hdegoede@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, codalist@coda.cs.cmu.edu,
 linux-afs@lists.infradead.org, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 Amir Goldstein <l@gmail.com>, Eric Van Hensbergen <ericvh@kernel.org>,
 bug-gnulib@gnu.org, Miklos Szeredi <miklos@szeredi.hu>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 Hugh Dickins <hughd@google.com>, Tyler Hicks <code@tyhicks.com>,
 cluster-devel@redhat.com, coda@cs.cmu.edu, linux-mm@kvack.org,
 Gao Xiang <xiang@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Xi Ruoyao <xry111@linuxfromscratch.org>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 linux-cifs@vger.kernel.org, Chao Yu <chao@kernel.org>,
 linux-erofs@lists.ozlabs.org, Josef Bacik <josef@toxicpanda.com>,
 Tom Talpey <tom@talpey.com>, Tejun Heo <tj@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
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
 Sungjong Seo <sj1557.seo@samsung.com>, Bruno Haible <bruno@clisp.org>,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

> > > While we initially thought we can do this unconditionally it turns out
> > > that this might break existing workloads that rely on timestamps in very
> > > specific ways and we always knew this was a possibility. Move
> > > multi-grain timestamps behind a vfs mount option.
> > 
> > Surely this is a safe choice as it moves the responsibility to the sysadmin
> > and the cases where finegrained timestamps are required. But I kind of
> > wonder how is the sysadmin going to decide whether mgtime is safe for his
> > system or not? Because the possible breakage needn't be obvious at the
> > first sight...
> > 
> 
> That's the main reason I really didn't want to go with a mount option.
> Documenting that may be difficult. While there is some pessimism around
> it, I may still take a stab at just advancing the coarse clock whenever
> we fetch a fine-grained timestamp. It'd be nice to remove this option in
> the future if that turns out to be feasible.
> 
> > If I were a sysadmin, I'd rather opt for something like
> > finegrained timestamps + lazytime (if I needed the finegrained timestamps
> > functionality). That should avoid the IO overhead of finegrained timestamps
> > as well and I'd know I can have problems with timestamps only after a
> > system crash.
> 
> > I've just got another idea how we could solve the problem: Couldn't we
> > always just report coarsegrained timestamp to userspace and provide access
> > to finegrained value only to NFS which should know what it's doing?
> > 
> 
> I think that'd be hard. First of all, where would we store the second
> timestamp? We can't just truncate the fine-grained ones to come up with
> a coarse-grained one. It might also be confusing having nfsd and local
> filesystems present different attributes.

As far as I can tell we have two options. The first one is to make this
into a mount option which I really think isn't a big deal and lets us
avoid this whole problem while allowing filesytems exposed via NFS to
make use of this feature for change tracking.

The second option is that we turn off fine-grained finestamps for v6.6
and you get to explore other options.

It isn't a big deal regressions like this were always to be expected but
v6.6 needs to stabilize so anything that requires more significant work
is not an option.

