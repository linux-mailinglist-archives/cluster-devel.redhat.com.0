Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 43560A8611
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Sep 2019 17:32:36 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99685308219E;
	Wed,  4 Sep 2019 15:32:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A104B196B2;
	Wed,  4 Sep 2019 15:32:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53AA2EEFE;
	Wed,  4 Sep 2019 15:32:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x84FWRkR028517 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 4 Sep 2019 11:32:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10DE45D9E2; Wed,  4 Sep 2019 15:32:27 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BA625D9C9
	for <cluster-devel@redhat.com>; Wed,  4 Sep 2019 15:32:22 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AFB291800B74;
	Wed,  4 Sep 2019 15:32:22 +0000 (UTC)
Date: Wed, 4 Sep 2019 11:32:21 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: =?utf-8?B?7ZWc64yA6rec?= <hdg9400@skku.edu>
Message-ID: <300514420.12648595.1567611141801.JavaMail.zimbra@redhat.com>
In-Reply-To: <OF91C20228.BA07262A-ON4925846B.000B9F9F@skku.ac.kr>
References: <OF91C20228.BA07262A-ON4925846B.000B9F9F@skku.ac.kr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.116.191, 10.4.195.4]
Thread-Topic: How do the nodes that are mounting GFS2 see the latest version
	of file system?
Thread-Index: AjP3EAsdv3HFxiKrdbzOlMWNJh2/+A==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] How do the nodes that are mounting GFS2 see the
 latest version of file system?
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 04 Sep 2019 15:32:35 +0000 (UTC)

Hi Daegyu,

----- Original Message -----
> How can B's file system data structure be kept up to date?

GFS2 uses cluster-wide locking called "glocks" to synchronize metadata.

For example, when A wants to update a file F1 in a gfs2 file system,
it first acquires the glock for F1's inode. The glock gets
permission to use F1 using locks in DLM, the Distributed Lock Manager.

If node B has the glock for F1 already locked, it requests the glock be
released. The request to release the glock causes node B to write
everything it has in memory related to F1 before the glock is released.
Then B's in-core inode for F1 is invalidated and needs to be re-read
the next time it needs to see it.

After B releases the glock, then A is granted the lock by DLM.
When it acquires the glock, it must re-read the metadata needed for F1
(either because it was never read in, or because it was invalidated from
the last time it released the glock).

In this way, the metadata is kept synchronized as the glocks are passed
around the cluster.

> Is B rereading the superblock every time like the mount process? How do B

In GFS2, the file system superblock only tells the file system where
to start looking for things and it is only read when the file system
is mounted. It is never updated, except by gfs2-utils when it is offline,
like gfs2_edit, fsck.gfs2, mkfs.gfs2, etc.

Each node has its own unique memory with regard to the file system's
metadata. And that metadata is kept in sync by using the glocks as
described above.

> machine know that the disk's file system has been updated?
> I would like to know a detailed explanation.

It's all coordinated through glocks, which correspond to DLM locks.

Regards,

Bob Peterson
Red Hat File Systems

