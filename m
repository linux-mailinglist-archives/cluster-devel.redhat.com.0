Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CCA78D1AD
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Aug 2023 03:23:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693358607;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=UGL8Hs7wie/83TbDi9sHxBsPaDb/+1IP8lK74uZbCKw=;
	b=UuS6HkgCNI371AO/UBwdxxQ0MIrqZPTh/EgpKHvzaeV24kXVI7vY15qawSnF5j1zfDGsKV
	GXr1eW/mIY9AiZiijAt4uxpB8FZI6y89Sz3p+p7PSiibBFL4S13sD9zyVkJ0QTMB6FbFbv
	8LWrYdT5MdUDsWLL97o5nXcJDmzdIm0=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-11Jhh9_cNeqQ31ZV4xE9ng-1; Tue, 29 Aug 2023 21:23:18 -0400
X-MC-Unique: 11Jhh9_cNeqQ31ZV4xE9ng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB2123C1350C;
	Wed, 30 Aug 2023 01:23:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A14FC15BAE;
	Wed, 30 Aug 2023 01:23:16 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2710B19465B6;
	Wed, 30 Aug 2023 01:23:16 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A4E671946594 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 30 Aug 2023 01:23:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 80C4840C6F4E; Wed, 30 Aug 2023 01:23:15 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7922240C6F4C
 for <cluster-devel@redhat.com>; Wed, 30 Aug 2023 01:23:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A7373C13501
 for <cluster-devel@redhat.com>; Wed, 30 Aug 2023 01:23:15 +0000 (UTC)
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-187-2p66CNpMMO-tOu91g_fI0g-1; Tue,
 29 Aug 2023 21:23:13 -0400
X-MC-Unique: 2p66CNpMMO-tOu91g_fI0g-1
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qb9v5-001yGw-2Z; Wed, 30 Aug 2023 01:22:55 +0000
Date: Wed, 30 Aug 2023 02:22:55 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20230830012255.GC3390869@ZenIV>
References: <20230725-mgctime-v6-0-a794c2b7abca@kernel.org>
 <20230725-mgctime-v6-1-a794c2b7abca@kernel.org>
 <20230829224454.GA461907@ZenIV>
 <e1c4a6d5001d029548542a1f10425c5639ce28e4.camel@kernel.org>
 <20230830000221.GB3390869@ZenIV>
 <1005e30582138e203a99f49564e2ef244b8d56aa.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <1005e30582138e203a99f49564e2ef244b8d56aa.camel@kernel.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH v6 1/7] fs: pass the request_mask to
 generic_fillattr
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
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Dave Chinner <david@fromorbit.com>, David Howells <dhowells@redhat.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Hans de Goede <hdegoede@redhat.com>, Marc Dionne <marc.dionne@auristor.com>,
 codalist@coda.cs.cmu.edu, linux-afs@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-cifs@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Hugh Dickins <hughd@google.com>,
 Tyler Hicks <code@tyhicks.com>, cluster-devel@redhat.com, coda@cs.cmu.edu,
 linux-mm@kvack.org, linux-f2fs-devel@lists.sourceforge.net,
 Ilya Dryomov <idryomov@gmail.com>, Iurii Zaikin <yzaikin@google.com>,
 Namjae Jeon <linkinjeon@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Shyam Prasad N <sprasad@microsoft.com>, ecryptfs@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, ocfs2-devel@lists.linux.dev,
 Anthony Iliopoulos <ailiop@suse.com>, Chao Yu <chao@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Tejun Heo <tj@kernel.org>, Yue Hu <huyue2@coolpad.com>,
 Joel Becker <jlbec@evilplan.org>, linux-mtd@lists.infradead.org,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Gao Xiang <xiang@kernel.org>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Jan Harkes <jaharkes@cs.cmu.edu>, Christian Brauner <brauner@kernel.org>,
 linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, v9fs@lists.linux.dev,
 ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 devel@lists.orangefs.org, Anna Schumaker <anna@kernel.org>,
 Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, linux-erofs@lists.ozlabs.org,
 linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: zeniv.linux.org.uk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 29, 2023 at 08:43:31PM -0400, Jeff Layton wrote:
> On Wed, 2023-08-30 at 01:02 +0100, Al Viro wrote:
> > On Tue, Aug 29, 2023 at 06:58:47PM -0400, Jeff Layton wrote:
> > > On Tue, 2023-08-29 at 23:44 +0100, Al Viro wrote:
> > > > On Tue, Jul 25, 2023 at 10:58:14AM -0400, Jeff Layton wrote:
> > > > > generic_fillattr just fills in the entire stat struct indiscriminately
> > > > > today, copying data from the inode. There is at least one attribute
> > > > > (STATX_CHANGE_COOKIE) that can have side effects when it is reported,
> > > > > and we're looking at adding more with the addition of multigrain
> > > > > timestamps.
> > > > > 
> > > > > Add a request_mask argument to generic_fillattr and have most callers
> > > > > just pass in the value that is passed to getattr. Have other callers
> > > > > (e.g. ksmbd) just pass in STATX_BASIC_STATS. Also move the setting of
> > > > > STATX_CHANGE_COOKIE into generic_fillattr.
> > > > 
> > > > Out of curiosity - how much PITA would it be to put request_mask into
> > > > kstat?  Set it in vfs_getattr_nosec() (and those get_file_..._info()
> > > > on smbd side) and don't bother with that kind of propagation boilerplate
> > > > - just have generic_fillattr() pick it there...
> > > > 
> > > > Reduces the patchset size quite a bit...
> > > 
> > > It could be done. To do that right, I think we'd want to drop
> > > request_mask from the ->getattr prototype as well and just have
> > > everything use the mask in the kstat.
> > > 
> > > I don't think it'd reduce the size of the patchset in any meaningful
> > > way, but it might make for a more sensible API over the long haul.
> > 
> > ->getattr() prototype change would be decoupled from that - for your
> > patchset you'd only need the field addition + setting in vfs_getattr_nosec()
> > (and possibly in ksmbd), with the remainders of both series being
> > independent from each other.
> > 
> > What I suggest is
> > 
> > branchpoint -> field addition (trivial commit) -> argument removal
> > 		|
> > 		V
> > your series, starting with "use stat->request_mask in generic_fillattr()"
> > 
> > Total size would be about the same, but it would be easier to follow
> > the less trivial part of that.  Nothing in your branch downstream of
> > that touches any ->getattr() instances, so it should have no
> > conflicts with the argument removal side of things.
> 
> The only problem with this plan is that Linus has already merged this.
> I've no issue with adding the request_mask to the kstat and removing it
> as a separate parameter elsewhere, but I think we'll need to do it on
> top of what's already been merged.

D'oh...  My apologies; I'll do a branch on top of that (and rebase on
top of -rc1 once the window closes).

