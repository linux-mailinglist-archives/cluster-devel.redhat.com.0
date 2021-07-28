Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 02A273D8ECE
	for <lists+cluster-devel@lfdr.de>; Wed, 28 Jul 2021 15:18:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-M6-A537mMqa0v7qBYy2Mgw-1; Wed, 28 Jul 2021 09:18:47 -0400
X-MC-Unique: M6-A537mMqa0v7qBYy2Mgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF8228774BE;
	Wed, 28 Jul 2021 13:18:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A4DB781E7;
	Wed, 28 Jul 2021 13:18:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C092180BAB0;
	Wed, 28 Jul 2021 13:18:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16SDGGBe027878 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 28 Jul 2021 09:16:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 305C1101A7F9; Wed, 28 Jul 2021 13:16:16 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 26E2D101B57B
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 13:16:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 012601066688
	for <cluster-devel@redhat.com>; Wed, 28 Jul 2021 13:16:13 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-170-MlJfQ-SNNpO-xNBiUsnK3A-1; Wed, 28 Jul 2021 09:16:08 -0400
X-MC-Unique: MlJfQ-SNNpO-xNBiUsnK3A-1
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 182DB201A2;
	Wed, 28 Jul 2021 13:16:07 +0000 (UTC)
Received: from quack2.suse.cz (unknown [10.100.200.198])
	by relay2.suse.de (Postfix) with ESMTP id 07105A3B87;
	Wed, 28 Jul 2021 13:16:07 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id D55BC1E1321; Wed, 28 Jul 2021 15:16:06 +0200 (CEST)
Date: Wed, 28 Jul 2021 15:16:06 +0200
From: Jan Kara <jack@suse.cz>
To: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <20210728131606.GF29619@quack2.suse.cz>
References: <20210713180958.66995-1-rpeterso@redhat.com>
	<20210713180958.66995-11-rpeterso@redhat.com>
	<34e7b795c97d781b8788d965dd7caf48d8b8ec24.camel@redhat.com>
	<76779e30-76b3-b867-7d1c-46a96b56a741@redhat.com>
	<CAHc6FU6NNG3M8ewuehy50G4PVJ7v_aWgoUpZfNitJSzU1ajzdA@mail.gmail.com>
	<d2f338843211059e4f35996c4771fdbfa80aab65.camel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d2f338843211059e4f35996c4771fdbfa80aab65.camel@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-mm@kvack.org,
	Matthew Wilcox <willy@infradead.org>,
	cluster-devel <cluster-devel@redhat.com>, linux-fsdevel@vger.kernel.org
Subject: Re: [Cluster-devel] [GFS2 PATCH 10/10] gfs2: replace sd_aspace with
 sd_inode
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed 28-07-21 09:57:01, Steven Whitehouse wrote:
> On Wed, 2021-07-28 at 08:50 +0200, Andreas Gruenbacher wrote:
> > On Tue, Jul 13, 2021 at 9:34 PM Bob Peterson <rpeterso@redhat.com>
> > wrote:
> > > On 7/13/21 1:26 PM, Steven Whitehouse wrote:
> > > 
> > > Hi,
> > > 
> > > On Tue, 2021-07-13 at 13:09 -0500, Bob Peterson wrote:
> > > 
> > > Before this patch, gfs2 kept its own address space for rgrps, but
> > > this
> > > caused a lockdep problem because vfs assumes a 1:1 relationship
> > > between
> > > address spaces and their inode. One problematic area is this:
> > > 
> > > I don't think that is the case. The reason that the address space
> > > is a
> > > separate structure in the first place is to allow them to exist
> > > without
> > > an inode. Maybe that has changed, but we should see why that is, in
> > > that case rather than just making this change immediately.
> > > 
> > > I can't see any reason why if we have to have an inode here that it
> > > needs to be hashed... what would need to look it up via the hashes?
> > > 
> > > Steve.
> > > 
> > > Hi,
> > > 
> > > The actual use case, which is easily demonstrated with lockdep, is
> > > given
> > > in the patch text shortly after where you placed your comment. This
> > > goes
> > > back to this discussion from April 2018:
> > > 
> > > https://listman.redhat.com/archives/cluster-devel/2018-April/msg00017.html
> > > 
> > > in which Jan Kara pointed out that:
> > > 
> > > "The problem is we really do expect mapping->host->i_mapping ==
> > > mapping as
> > > we pass mapping and inode interchangeably in the mm code. The
> > > address_space
> > > and inodes are separate structures because you can have many inodes
> > > pointing to one address space (block devices). However it is not
> > > allowed
> > > for several address_spaces to point to one inode!"
> > 
> > This is fundamentally at adds with how we manage inodes: we have
> > inode->i_mapping which is the logical address space of the inode, and
> > we have gfs2_glock2aspace(GFS2_I(inode)->i_gl) which is the metadata
> > address space of the inode. The most important function of the
> > metadata address space is to remove the inode's metadata from memory
> > by truncating the metadata address space (inode_go_inval). We need
> > that when moving an inode to another node. I don't have the faintest
> > idea how we could otherwise achieve that in a somewhat efficient way.
> > 
> > Thanks,
> > Andreas
> > 
> 
> In addition, I'm fairly sure also that we were told to use this
> solution (i.e. a separate address space) back in the day because it was
> expected that they didn't have a 1:1 relationship with inodes. I don't
> think we'd have used that solution otherwise. I've not had enough time
> to go digging back in my email to check, but it might be worth looking
> to see when we introduced the use of the second address space (removing
> a whole additional inode structure) and any discussions around that
> change,

AFAIK in last 20 years it has never been the case that multiple
address_space structs for an inode would be handled by the VFS/MM code
properly. There can be multiple 'struct inode' for one 'struct
address_space'. That is handled just fine and is being used. The trouble is
that once you allow multiple address_space structs pointing to one struct
inode, you have some hard questions to answer (at least for VFS) - e.g. you
get a request to writeback the inode, how you do that when you have
multiple address spaces? Writeback them all? And how do you iterate them?

And there are similar questions regarding how to determine inode's
dirtiness or whether some inode's page is under writeback. Tied to that are
locking questions where inode->i_mapping->i_pages->xa_lock lock is used to
protect some of the inode state transitions. But when you have multiple
address spaces pointing to the inode it is not clear which of these many
locks would be protecting it (and the warning syzbot is hitting exactly
says that these state transitions are not properly serialized).

Of course all this can be decided and implemented but it is not a trivial
task there needs to be good motivation for the added complexity in the code
used by everybody. And AFAIU GFS2 even doesn't strictly need it. It uses a
very limited subset of functions that can operate on address_space for
these special address spaces. Andreas mentions you use metadata
address_space for tracking and evicting cached metadata associated with the
inode. Quickly checking the code, another heavy use seems to be metadata
dirtiness tracking and writeback. I'd note that other filesystems
traditionally use mapping->private_list for exactly these purposes (through
helpers like mark_buffer_dirty_inode, sync_mapping_buffers, etc.). Any
reason why you don't use these?

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

