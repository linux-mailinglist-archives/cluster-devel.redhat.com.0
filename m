Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA39711B69
	for <lists+cluster-devel@lfdr.de>; Fri, 26 May 2023 02:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685061593;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/vfyxn/XFBgbq1SCI/n+V4snBRmgUFgj2AkAcqfhZmQ=;
	b=I2ap4netGr6TEpEQXpmczPMH/7I3L25Uw5h1yrFp5JF1EnJ9vy3B2dJR8mqWqcJS+Lk4nq
	by1uhTXydDXIatxU8VUdBDOjPQjMNiQvI4Lrg2wuNVZKPoNPTeHtoG97o7IWtV+Mo2HGBV
	P9c5mhMyS/qVHwu2WkiMn8QDtIORJ3s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-uwNOJXqCPOG2nh3Oq4BwQQ-1; Thu, 25 May 2023 20:39:49 -0400
X-MC-Unique: uwNOJXqCPOG2nh3Oq4BwQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C234480120A;
	Fri, 26 May 2023 00:39:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCE6D8162;
	Fri, 26 May 2023 00:39:47 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 837BF19465B1;
	Fri, 26 May 2023 00:39:47 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B05A719465A0 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 26 May 2023 00:39:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A030B40C6CDE; Fri, 26 May 2023 00:39:46 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 98FDB40C6CDD
 for <cluster-devel@redhat.com>; Fri, 26 May 2023 00:39:46 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7E908811E86
 for <cluster-devel@redhat.com>; Fri, 26 May 2023 00:39:46 +0000 (UTC)
Received: from out-54.mta0.migadu.com (out-54.mta0.migadu.com
 [91.218.175.54]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100--HUrB2vTO7GAe3UlfRzNXA-1; Thu, 25 May 2023 20:39:39 -0400
X-MC-Unique: -HUrB2vTO7GAe3UlfRzNXA-1
Date: Thu, 25 May 2023 20:39:32 -0400
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Andreas =?utf-8?Q?Gr=C3=BCnbacher?= <andreas.gruenbacher@gmail.com>
Message-ID: <ZG//xK/QSp1Wm72M@moria.home.lan>
References: <20230509165657.1735798-1-kent.overstreet@linux.dev>
 <20230509165657.1735798-7-kent.overstreet@linux.dev>
 <20230510010737.heniyuxazlprrbd6@quack3>
 <ZFs3RYgdCeKjxYCw@moria.home.lan>
 <20230523133431.wwrkjtptu6vqqh5e@quack3>
 <ZGzoJLCRLk+pCKAk@infradead.org>
 <CAHpGcML0CZ1RGkOf26iYt_tK0Ux=cfdW8d3bjMVbjXLr91cs+g@mail.gmail.com>
 <ZG/tTorh8G2919Jz@moria.home.lan>
 <CAHpGcMKQke0f5-y6fg3O5dBwcTYX69dEbxZgDiFABgOLCc+zGw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHpGcMKQke0f5-y6fg3O5dBwcTYX69dEbxZgDiFABgOLCc+zGw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Cluster-devel] [PATCH 06/32] sched: Add
 task_struct->faults_disabled_mapping
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
Cc: cluster-devel@redhat.com, dhowells@redhat.com, Jan Kara <jack@suse.cz>,
 "Darrick J . Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Kent Overstreet <kent.overstreet@gmail.com>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 02:05:26AM +0200, Andreas Gr=C3=BCnbacher wrote:
> Oh, it's just that gfs2 uses one dlm lock per inode to control access
> to that inode. In the code, this is called the "inode glock" ---
> glocks being an abstraction above dlm locks --- but it boils down to
> dlm locks in the end. An additional layer of locking will only work
> correctly if all cluster nodes use the new locks consistently, so old
> cluster nodes will become incompatible. Those kinds of changes are
> hard.
>=20
> But the additional lock taking would also hurt performance, forever,
> and I'd really like to avoid taking that hit.
>=20
> It may not be obvious to everyone, but allowing page faults during
> reads and writes (i.e., while holding dlm locks) can lead to
> distributed deadlocks. We cannot just pretend to be a local
> filesystem.

Ah, gotcha. Same basic issue then, dio -> page fault means you're taking
two DLM locks simulateously, so without lock ordering you get deadlock.

So that means promoting this to the VFS won't be be useful to you
(because the VFS lock will be a local lock, not your DLM lock).

Do you have trylock() and a defined lock ordering you can check for or
glocks (inode number)? Here's the new and expanded commit message, in
case my approach is of interest to you:

commit 32858d0fb90b503c8c39e899ad5155e44639d3b5
Author: Kent Overstreet <kent.overstreet@gmail.com>
Date:   Wed Oct 16 15:03:50 2019 -0400

    sched: Add task_struct->faults_disabled_mapping
   =20
    There has been a long standing page cache coherence bug with direct IO.
    This provides part of a mechanism to fix it, currently just used by
    bcachefs but potentially worth promoting to the VFS.
   =20
    Direct IO evicts the range of the pagecache being read or written to.
   =20
    For reads, we need dirty pages to be written to disk, so that the read
    doesn't return stale data. For writes, we need to evict that range of
    the pagecache so that it's not stale after the write completes.
   =20
    However, without a locking mechanism to prevent those pages from being
    re-added to the pagecache - by a buffered read or page fault - page
    cache inconsistency is still possible.
   =20
    This isn't necessarily just an issue for userspace when they're playing
    games; filesystems may hang arbitrary state off the pagecache, and so
    page cache inconsistency may cause real filesystem bugs, depending on
    the filesystem. This is less of an issue for iomap based filesystems,
    but e.g. buffer heads caches disk block mappings (!) and attaches them
    to the pagecache, and bcachefs attaches disk reservations to pagecache
    pages.
   =20
    This issue has been hard to fix, because
     - we need to add a lock (henceforth calld pagecache_add_lock), which
       would be held for the duration of the direct IO
     - page faults add pages to the page cache, thus need to take the same
       lock
     - dio -> gup -> page fault thus can deadlock
   =20
    And we cannot enforce a lock ordering with this lock, since userspace
    will be controlling the lock ordering (via the fd and buffer arguments
    to direct IOs), so we need a different method of deadlock avoidance.
   =20
    We need to tell the page fault handler that we're already holding a
    pagecache_add_lock, and since plumbing it through the entire gup() path
    would be highly impractical this adds a field to task_struct.
   =20
    Then the full method is:
     - in the dio path, when we take first pagecache_add_lock, note the
       mapping in task_struct
     - in the page fault handler, if faults_disabled_mapping is set, we
       check if it's the same mapping as the one taking a page fault for,
       and if so return an error.
   =20
       Then we check lock ordering: if there's a lock ordering violation an=
d
       trylock fails, we'll have to cycle the locks and return an error tha=
t
       tells the DIO path to retry: faults_disabled_mapping is also used fo=
r
       signalling "locks were dropped, please retry".
   =20
    Also relevant to this patch: mapping->invalidate_lock.
    mapping->invalidate_lock provides most of the required semantics - it's
    used by truncate/fallocate to block pages being added to the pagecache.
    However, since it's a rwsem, direct IOs would need to take the write
    side in order to block page cache adds, and would then be exclusive wit=
h
    each other - we'll need a new type of lock to pair with this approach.
   =20
    Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
    Cc: Jan Kara <jack@suse.cz>
    Cc: Darrick J. Wong <djwong@kernel.org>
    Cc: linux-fsdevel@vger.kernel.org
    Cc: Andreas Gr=C3=BCnbacher <andreas.gruenbacher@gmail.com>

