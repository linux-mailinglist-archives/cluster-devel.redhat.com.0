Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA589FF5
	for <lists+cluster-devel@lfdr.de>; Mon, 12 Aug 2019 15:43:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF9C8F9E6C;
	Mon, 12 Aug 2019 13:43:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B3FF17985;
	Mon, 12 Aug 2019 13:43:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17A34180B536;
	Mon, 12 Aug 2019 13:43:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7CDhcpJ021713 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 09:43:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1DF4C17B46; Mon, 12 Aug 2019 13:43:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF87F18E2E;
	Mon, 12 Aug 2019 13:43:35 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33CC724F30;
	Mon, 12 Aug 2019 13:43:35 +0000 (UTC)
Date: Mon, 12 Aug 2019 09:43:35 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Steven Whitehouse <swhiteho@redhat.com>
Message-ID: <432645393.7956321.1565617415072.JavaMail.zimbra@redhat.com>
In-Reply-To: <17eda7cd-5662-51a5-a6c8-0bbd34b48594@redhat.com>
References: <1717230208.7744454.1565377109013.JavaMail.zimbra@redhat.com>
	<17eda7cd-5662-51a5-a6c8-0bbd34b48594@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.116.97, 10.4.195.6]
Thread-Topic: gfs2: eliminate circular lock dependency in inode.c
Thread-Index: goxTLJ6XRlhSjBNHE07nLbRJ6H8wCw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: eliminate circular lock
 dependency in inode.c
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 12 Aug 2019 13:43:48 +0000 (UTC)

----- Original Message -----
> > The real problem came with renames, though. Function
> > gfs2_rename(), which locked a series of inode glocks, did so
> > in parent-child order due to that patch. But it was still
> > possible to create circular lock dependencies just by doing the
> > wrong combination of renames on different nodes. For example:
> >
> > Node a: mv /mnt/gfs2/sub /mnt/gfs2/tmp_name (rename sub to tmp_name)
> >
> > a1. Same directory, so rename glock is NOT held
> > a2. /mnt/gfs2 is locked
> > a3. Tries to lock sub for rename, but it is locked on node b
> >
> > Node b: mv /mnt/gfs2/sub /mnt/gfs2/dir1/ (move sub to dir1...
> >          mv /mnt/gfs2/dir1/sub /mnt/gfs2/  ...then move it back)
> >
> > b1. Different directory, so rename glock IS held
> > b2. /mnt/gfs2 is locked
> > b3. dir1 is locked
> > b4. sub is moved to dir1 and everything is unlocked
> > b5. Different directory, so rename glock IS held again
> > b6. dir1 is locked
> > b7. Lock for /mnt/gfs2 is requested, but cannot be granted because
> >      node 1 locked it in step a2.
> 
> If the parents are being locked before the child, as per the correct
> locking order, then this cannot happen. The directory in which the child
> is located should always be locked first, before the child, so that is
> what protects the operation on a from whatever might be going on, on node b.
> 
> When you get to step b7, sub is not locked (since it was unlocked in b4)
> and not locked again. Thus a3 can complete. So this doesn't look like it
> is the right explanation.

Hi,

I guess maybe my explanation is lacking.
It's not so much a relationship between "parent" and "child"
directories as it is "old" and "new" directories.

The comments for function vfs_rename() explain the situations in which
this can happen, and have been prevented on a single node through the
use of s_vfs_rename_mutex. However, that mutex is not cluster-wide,
which means the relationship of which inode is the "old" and which
inode is the "new" can change indiscriminately without notice and
without cluster-wide locking. The whole point of the "a" and "b"
scenarios was to illustrate that one node can lock "old", then "new",
but the other node can reverse the roles of those same inodes (which
is the "old" and which is the "new") and therefore reverse the lock
order without notice.

Since the old-new relationship itself is not protected, we need
some other way to get the lock order correct.

My first attempt to fix this was to extend the "rename" glock to have
a rename-wide reach so it affected both types of renames rather than
today's code which only locks old and new if they're different.
I implemented this with a new i_op called by vfs (vfs_rename) to make
the rename glock serve as a kind of cluster-wide version vfs's
s_vfs_rename_mutex. However, this ended up having a huge performance
penalty for my test.

My second attempt (the patch I posted) was to lock the inodes in
block-number-sort order, because the block number relationships
will never change, regardless of which is old and which is new.
It made no sense to me to reinvent the wheel wrt locking them in
sorted order, so I used gfs2_glock_nq_m which already does that.

Regards,

Bob Peterson

