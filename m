Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 076A74C21AA
	for <lists+cluster-devel@lfdr.de>; Thu, 24 Feb 2022 03:16:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-1zMEZsniMI-InEUCNtXeXg-1; Wed, 23 Feb 2022 21:16:55 -0500
X-MC-Unique: 1zMEZsniMI-InEUCNtXeXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B3B1804B65;
	Thu, 24 Feb 2022 02:16:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C10D79BEB2;
	Thu, 24 Feb 2022 02:16:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A005C4A701;
	Thu, 24 Feb 2022 02:16:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21O2E5bc018457 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 23 Feb 2022 21:14:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D98DE112133F; Thu, 24 Feb 2022 02:14:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D4ACA112133E
	for <cluster-devel@redhat.com>; Thu, 24 Feb 2022 02:14:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB5C738035A3
	for <cluster-devel@redhat.com>; Thu, 24 Feb 2022 02:14:02 +0000 (UTC)
Received: from mail104.syd.optusnet.com.au (mail104.syd.optusnet.com.au
	[211.29.132.246]) by relay.mimecast.com with ESMTP id
	us-mta-519-MmQp2HYbNhGrIISkKcVHPg-1; Wed, 23 Feb 2022 21:13:59 -0500
X-MC-Unique: MmQp2HYbNhGrIISkKcVHPg-1
Received: from dread.disaster.area (pa49-186-17-0.pa.vic.optusnet.com.au
	[49.186.17.0])
	by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id 1FBA553306C;
	Thu, 24 Feb 2022 12:48:43 +1100 (AEDT)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
	(envelope-from <david@fromorbit.com>)
	id 1nN3FK-00FgMA-GD; Thu, 24 Feb 2022 12:48:42 +1100
Date: Thu, 24 Feb 2022 12:48:42 +1100
From: Dave Chinner <david@fromorbit.com>
To: "Theodore Ts'o" <tytso@mit.edu>
Message-ID: <20220224014842.GM59715@dread.disaster.area>
References: <Yg0m6IjcNmfaSokM@google.com>
	<82d0f4e4-c911-a245-4701-4712453592d9@nvidia.com>
	<Yg8bxiz02WBGf6qO@mit.edu> <Yg9QGm2Rygrv+lMj@kroah.com>
	<YhbE2nocBMtLc27C@mit.edu>
MIME-Version: 1.0
In-Reply-To: <YhbE2nocBMtLc27C@mit.edu>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.4 cv=VuxAv86n c=1 sm=1 tr=0 ts=6216e3fe
	a=+dVDrTVfsjPpH/ci3UuFng==:117 a=+dVDrTVfsjPpH/ci3UuFng==:17
	a=kj9zAlcOel0A:10 a=oGFeUVbbRNcA:10 a=7-415B0cAAAA:8
	a=-kggqxpRYmVVPZmSJLkA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
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
Cc: cluster-devel@redhat.com, Damien Le Moal <damien.lemoal@wdc.com>,
	Johannes Thumshirn <jth@kernel.org>, John Hubbard <jhubbard@nvidia.com>,
	"Darrick J . Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, Ritesh Harjani <riteshh@linux.ibm.com>,
	linux-ext4@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Christoph Hellwig <hch@lst.de>, Goldwyn Rodrigues <rgoldwyn@suse.com>
Subject: Re: [Cluster-devel] [REPORT] kernel BUG at fs/ext4/inode.c:2620 -
	page_buffers()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 23, 2022 at 06:35:54PM -0500, Theodore Ts'o wrote:
> On Fri, Feb 18, 2022 at 08:51:54AM +0100, Greg Kroah-Hartman wrote:
> > > The challenge is that fixing this "the right away" is probably not
> > > something we can backport into an LTS kernel, whether it's 5.15 or
> > > 5.10... or 4.19.
> > 
> > Don't worry about stable backports to start with.  Do it the "right way"
> > first and then we can consider if it needs to be backported or not.
> 
> Fair enough; on the other hand, we could also view this as making ext4
> more robust against buggy code in other subsystems, and while other
> file systems may be losing user data if they are actually trying to do
> remote memory access to file-backed memory, apparently other file
> systems aren't noticing and so they're not crashing.

Oh, we've noticed them, no question about that.  We've got bug
reports going back years for systems being crashed, triggering BUGs
and/or corrupting data on both XFS and ext4 filesystems due to users
trying to run RDMA applications with file backed pages.

Most of the people doing this now know that we won't support such
applications until the RDMA stack/hardware can trigger on-demand
write page faults the same way CPUs do when they first write to a
clean page. They don't have this, so mostly these people don't
bother reporting these class of problems to us anymore.  The
gup/RDMA infrastructure to make this all work is slowly moving
forwards, but it's not here yet.

> Issuing a
> warning and then not crashing is arguably a better way for ext4 to
> react, especially if there are other parts of the kernel that are
> randomly calling set_page_dirty() on file-backed memory without
> properly first informing the file system in a context where it can
> block and potentially do I/O to do things like allocate blocks.

I'm not sure that replacing the BUG() with a warning is good enough
- it's still indicative of an application doing something dangerous
that could result in silent data corruption and/or other problems.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

