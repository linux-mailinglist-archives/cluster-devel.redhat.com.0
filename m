Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8BD7A88FA
	for <lists+cluster-devel@lfdr.de>; Wed, 20 Sep 2023 17:51:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695225104;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Gw0GfkzEv5qjhmPaYmrLrmVLcBgiouetaUVK1NJf9SE=;
	b=Z4mEZec0PMcLVwvsVJNRC3h6Fz3rrzilFJ+UusGH5gPKJDb+3FX83CLnMzoEmD/ZDSYLB2
	VLspmVZg3GP3TUpJMC71BH9Dytz9ZXOYJiPQBER9hMoGtTUv3tfrIdmDBbqAM2yZKXOSYx
	9CIceIRFeuOixKmKgb5BgRxSM+TsjUY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-Pw6GLyyDPV-s1a-hVC8Tzg-1; Wed, 20 Sep 2023 11:51:38 -0400
X-MC-Unique: Pw6GLyyDPV-s1a-hVC8Tzg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB89A100DDE4;
	Wed, 20 Sep 2023 15:51:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD0C840C6EC0;
	Wed, 20 Sep 2023 15:51:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 40C4119465BC;
	Wed, 20 Sep 2023 15:51:20 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DD60019465BB for <cluster-devel@listman.corp.redhat.com>;
 Wed, 20 Sep 2023 15:45:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C7EB9215670B; Wed, 20 Sep 2023 15:45:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFD3C2156701
 for <cluster-devel@redhat.com>; Wed, 20 Sep 2023 15:45:32 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D6373C11A16
 for <cluster-devel@redhat.com>; Wed, 20 Sep 2023 15:45:32 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-385-B2aFxPWWN02FoWoOQ9nAfw-1; Wed,
 20 Sep 2023 11:45:30 -0400
X-MC-Unique: B2aFxPWWN02FoWoOQ9nAfw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BF6E422037;
 Wed, 20 Sep 2023 15:45:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AA9FC13A64;
 Wed, 20 Sep 2023 15:45:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sEc2KZcTC2VITwAAMHmgww
 (envelope-from <jack@suse.cz>); Wed, 20 Sep 2023 15:45:27 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id 33A59A077D; Wed, 20 Sep 2023 17:45:27 +0200 (CEST)
Date: Wed, 20 Sep 2023 17:45:27 +0200
From: Jan Kara <jack@suse.cz>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230920154527.pkwot4nu2nzrnamd@quack3>
References: <20230807-mgctime-v7-0-d1dec143a704@kernel.org>
 <20230919110457.7fnmzo4nqsi43yqq@quack3>
 <1f29102c09c60661758c5376018eac43f774c462.camel@kernel.org>
 <4511209.uG2h0Jr0uP@nimes>
 <08b5c6fd3b08b87fa564bb562d89381dd4e05b6a.camel@kernel.org>
 <20230920-leerung-krokodil-52ec6cb44707@brauner>
 <20230920101731.ym6pahcvkl57guto@quack3>
 <317d84b1b909b6c6519a2406fcb302ce22dafa41.camel@kernel.org>
 <20230920124823.ghl6crb5sh4x2pmt@quack3>
 <ca82af4d6a72d7f83223c0ddd74fd9f7bcfa96b1.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <ca82af4d6a72d7f83223c0ddd74fd9f7bcfa96b1.camel@kernel.org>
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
 Sungjong Seo <sj1557.seo@samsung.com>, Bruno Haible <bruno@clisp.org>,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.cz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 20-09-23 10:12:03, Jeff Layton wrote:
> On Wed, 2023-09-20 at 14:48 +0200, Jan Kara wrote:
> > On Wed 20-09-23 06:35:18, Jeff Layton wrote:
> > > On Wed, 2023-09-20 at 12:17 +0200, Jan Kara wrote:
> > > > If I were a sysadmin, I'd rather opt for something like
> > > > finegrained timestamps + lazytime (if I needed the finegrained timestamps
> > > > functionality). That should avoid the IO overhead of finegrained timestamps
> > > > as well and I'd know I can have problems with timestamps only after a
> > > > system crash.
> > > 
> > > > I've just got another idea how we could solve the problem: Couldn't we
> > > > always just report coarsegrained timestamp to userspace and provide access
> > > > to finegrained value only to NFS which should know what it's doing?
> > > > 
> > > 
> > > I think that'd be hard. First of all, where would we store the second
> > > timestamp? We can't just truncate the fine-grained ones to come up with
> > > a coarse-grained one. It might also be confusing having nfsd and local
> > > filesystems present different attributes.
> > 
> > So what I had in mind (and I definitely miss all the NFS intricacies so the
> > idea may be bogus) was that inode->i_ctime would be maintained exactly as
> > is now. There will be new (kernel internal at least for now) STATX flag
> > STATX_MULTIGRAIN_TS. fill_mg_cmtime() will return timestamp truncated to
> > sb->s_time_gran unless STATX_MULTIGRAIN_TS is set. Hence unless you set
> > STATX_MULTIGRAIN_TS, there is no difference in the returned timestamps
> > compared to the state before multigrain timestamps were introduced. With
> > STATX_MULTIGRAIN_TS we return full precision timestamp as stored in the
> > inode. Then NFS in fh_fill_pre_attrs() and fh_fill_post_attrs() needs to
> > make sure STATX_MULTIGRAIN_TS is set when calling vfs_getattr() to get
> > multigrain time.
> 
> > I agree nfsd may now be presenting slightly different timestamps than user
> > is able to see with stat(2) directly on the filesystem. But is that a
> > problem? Essentially it is a similar solution as the mgtime mount option
> > but now sysadmin doesn't have to decide on filesystem mount how to report
> > timestamps but the stat caller knowingly opts into possibly inconsistent
> > (among files) but high precision timestamps. And in the particular NFS
> > usecase where stat is called all the time anyway, timestamps will likely
> > even be consistent among files.
> > 
> 
> I like this idea...
> 
> Would we also need to raise sb->s_time_gran to something corresponding
> to HZ on these filesystems?

I was actually confused a bit about how timestamp_truncate() works. The
jiffie granularity is just direct consequence of current_time() using
ktime_get_coarse_real_ts64() and not of timestamp_truncate().
sb->s_time_gran seems to be more about the on-disk format so it doesn't
seem like a great idea to touch it. So probably we can just truncate
timestamps in generic_fillattr() to HZ granularity unconditionally.

> If we truncate the timestamps at a granularity corresponding to HZ before
> presenting them via statx and the like then that should work around the
> problem with programs that compare timestamps between inodes.

Exactly.

> With NFSv4, when a filesystem doesn't report a STATX_CHANGE_COOKIE, nfsd
> will fake one up using the ctime. It's fine for that to use a full fine-
> grained timestamp since we don't expect to be able to compare that value
> with one of a different inode.

Yes.

> I think we'd want nfsd to present the mtime/ctime values as truncated,
> just like we would with a local fs. We could hit the same problem of an
> earlier-looking timestamp with NFS if we try to present the actual fine-
> grained values to the clients. IOW, I'm convinced that we need to avoid
> this behavior in most situations.

I wasn't sure if there's a way to do this within NFS - i.e., if the value
communicated via NFSv3 protocol (I know v4 has a special change cookie
field for it) that gets used for detecting need to revalidate file contents
isn't the one presented to client's userspace as ctime. If there's a way to
do this then great, I'm all for presenting truncated timestamps even for
NFS.

> If we do this, then we technically don't need the mount option either.

Yes, that was my hope.

> We could still add it though, and have it govern whether fill_mg_cmtime
> truncates the timestamps before storing them in the kstat.

Well, if we decide these timestamps are useful for userspace as well, I'd
rather make that a userspace visible STATX flag than a mount option. So
applications aware of the pitfalls can get high precision timestamps
without possibly breaking unaware applications.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

