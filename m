Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E417A82F1
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Sep 2023 15:09:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695215359;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=3YH4aY4cbPoScM3IUucMKFT40epHCwOjmoTvaSKlk4Y=;
	b=Clc9gjqnyiSXDbKcZgPOrjIy4swoF1KMTTVbkrS97LkH3UjoHp6RAAtof3hQ3ryM8mbqIN
	yFBuQik25dNW02oQjVR1Vlqc0koWXHalYq+notRxXqWBLYSdKjOcD2wLMWZWgh4C4IkBxV
	kLyc2X5dhV8Yhucm9tpzAyS3iJ/htqc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-krUQEqUBNV61DHr0CVpR9Q-1; Wed, 20 Sep 2023 09:09:15 -0400
X-MC-Unique: krUQEqUBNV61DHr0CVpR9Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E6A485A5A8;
	Wed, 20 Sep 2023 13:09:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E303EC158BA;
	Wed, 20 Sep 2023 13:09:12 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7409A19465B7;
	Wed, 20 Sep 2023 13:09:12 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id F3DB3194658D for <cluster-devel@listman.corp.redhat.com>;
 Wed, 20 Sep 2023 13:03:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BF1102904; Wed, 20 Sep 2023 13:03:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7A3951E3
 for <cluster-devel@redhat.com>; Wed, 20 Sep 2023 13:03:50 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 94FD5858F19
 for <cluster-devel@redhat.com>; Wed, 20 Sep 2023 13:03:50 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-387-AUCUxoyKNr2UIvnpZz0U5A-1; Wed,
 20 Sep 2023 09:03:46 -0400
X-MC-Unique: AUCUxoyKNr2UIvnpZz0U5A-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9027421BE4;
 Wed, 20 Sep 2023 13:03:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 752C213A64;
 Wed, 20 Sep 2023 13:03:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Eg6MHLDtCmX6bwAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 20 Sep 2023 13:03:44 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id F3DF5A077D; Wed, 20 Sep 2023 15:03:43 +0200 (CEST)
Date: Wed, 20 Sep 2023 15:03:43 +0200
From: Jan Kara <jack@suse.cz>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <20230920130343.qs2kuzngoomy4s3r@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
 <20230920101731.ym6pahcvkl57guto@quack3>
 <20230920-kaulquappen-computer-0a4a0e4c3c71@brauner>
MIME-Version: 1.0
In-Reply-To: <20230920-kaulquappen-computer-0a4a0e4c3c71@brauner>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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
 Marc Dionne <marc.dionne@auristor.com>, samba-technical@lists.samba.org,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 linux-mtd@lists.infradead.org, Mike Marshall <hubcap@omnibond.com>,
 Paulo Alcantara <pc@manguebit.com>, Amir Goldstein <l@gmail.com>,
 Eric Van Hensbergen <ericvh@kernel.org>, bug-gnulib@gnu.org,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, Gao Xiang <xiang@kernel.org>,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
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
 ntfs3@lists.linux.dev, Jeff Layton <jlayton@kernel.org>,
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.cz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 20-09-23 12:30:52, Christian Brauner wrote:
> On Wed, Sep 20, 2023 at 12:17:31PM +0200, Jan Kara wrote:
> > On Wed 20-09-23 10:41:30, Christian Brauner wrote:
> > > > > f1 was last written to *after* f2 was last written to. If the timestamp of f1
> > > > > is then lower than the timestamp of f2, timestamps are fundamentally broken.
> > > > > 
> > > > > Many things in user-space depend on timestamps, such as build system
> > > > > centered around 'make', but also 'find ... -newer ...'.
> > > > > 
> > > > 
> > > > 
> > > > What does breakage with make look like in this situation? The "fuzz"
> > > > here is going to be on the order of a jiffy. The typical case for make
> > > > timestamp comparisons is comparing source files vs. a build target. If
> > > > those are being written nearly simultaneously, then that could be an
> > > > issue, but is that a typical behavior? It seems like it would be hard to
> > > > rely on that anyway, esp. given filesystems like NFS that can do lazy
> > > > writeback.
> > > > 
> > > > One of the operating principles with this series is that timestamps can
> > > > be of varying granularity between different files. Note that Linux
> > > > already violates this assumption when you're working across filesystems
> > > > of different types.
> > > > 
> > > > As to potential fixes if this is a real problem:
> > > > 
> > > > I don't really want to put this behind a mount or mkfs option (a'la
> > > > relatime, etc.), but that is one possibility.
> > > > 
> > > > I wonder if it would be feasible to just advance the coarse-grained
> > > > current_time whenever we end up updating a ctime with a fine-grained
> > > > timestamp? It might produce some inode write amplification. Files that
> > > 
> > > Less than ideal imho.
> > > 
> > > If this risks breaking existing workloads by enabling it unconditionally
> > > and there isn't a clear way to detect and handle these situations
> > > without risk of regression then we should move this behind a mount
> > > option.
> > > 
> > > So how about the following:
> > > 
> > > From cb14add421967f6e374eb77c36cc4a0526b10d17 Mon Sep 17 00:00:00 2001
> > > From: Christian Brauner <brauner@kernel.org>
> > > Date: Wed, 20 Sep 2023 10:00:08 +0200
> > > Subject: [PATCH] vfs: move multi-grain timestamps behind a mount option
> > > 
> > > While we initially thought we can do this unconditionally it turns out
> > > that this might break existing workloads that rely on timestamps in very
> > > specific ways and we always knew this was a possibility. Move
> > > multi-grain timestamps behind a vfs mount option.
> > > 
> > > Signed-off-by: Christian Brauner <brauner@kernel.org>
> > 
> > Surely this is a safe choice as it moves the responsibility to the sysadmin
> > and the cases where finegrained timestamps are required. But I kind of
> > wonder how is the sysadmin going to decide whether mgtime is safe for his
> > system or not? Because the possible breakage needn't be obvious at the
> > first sight... If I were a sysadmin, I'd rather opt for something like
> 
> I think you'll basically enable this because you want to export a
> filesystem via NFS.

OK, that's what I thought but then you have to make a tough choice between:

1) Possibly inconsistent NFS caches on frequent changes.
2) Possibly broken builds on NFS.

Pick your poison ;)

> > finegrained timestamps + lazytime (if I needed the finegrained timestamps
> > functionality). That should avoid the IO overhead of finegrained timestamps
> 
> That would work with this patch, no? Or are you saying it would need
> something else?

Sorry, I was not really precise here. What I meant was that instead of
having multigrain timestamps, I (as a sysadmin) would want the filesystem
to set sb->s_time_gran to 1 ns and use lazytime to remove the IO overhead
of the frequent timestamp updates. But that is just me brainstorming
possible solutions of the original NFS problem.

> > as well and I'd know I can have problems with timestamps only after a
> > system crash.
> > 
> > I've just got another idea how we could solve the problem: Couldn't we
> > always just report coarsegrained timestamp to userspace and provide access
> > to finegrained value only to NFS which should know what it's doing?
> 
> What would changes would be involved for that?

See my other email. It should be fairly small...

> If this is invasive work and we decide this is something that we want to
> do then we should remove FS_MGTIME from btrfs, xfs, ext4, and tmpfs for
> v6.6.

.. but let's see what Jeff thinks. I can miss some problem with the
solution.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

