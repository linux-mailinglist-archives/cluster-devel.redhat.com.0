Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0142D70D040
	for <lists+cluster-devel@lfdr.de>; Tue, 23 May 2023 03:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684804358;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=S9kEBlrM2mXZCJZviNHwocMuJjhBpx9Jd+tPaUpbpJo=;
	b=dsQTVZUDki78VVnJVlp7YmEbqOGISWTstakDtCgssYFGSu8fxMIaa/1Wly4zAw2JZ2bYtY
	0sq70yk1ttNXE68pYS6T38onJttt3kZ5u2ZxI7oIOQZjypDiiwCm5ebda3gJdOH5rXVlAW
	SyOysl9lY3KSLY7nEqs/flhhYOjVNkc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-QC9twq_5OMiDskwz8TcPzQ-1; Mon, 22 May 2023 21:12:35 -0400
X-MC-Unique: QC9twq_5OMiDskwz8TcPzQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FCF0185A78B;
	Tue, 23 May 2023 01:12:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5B428400F1F;
	Tue, 23 May 2023 01:12:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 206F319465B1;
	Tue, 23 May 2023 01:12:34 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 512E41946595 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 23 May 2023 01:12:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 31A8920296C8; Tue, 23 May 2023 01:12:32 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2991820296C6
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 01:12:32 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [170.10.128.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A88F811E7C
 for <cluster-devel@redhat.com>; Tue, 23 May 2023 01:12:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-_gLZNoZ7N56TvUmFvKYOJQ-1; Mon, 22 May 2023 21:12:28 -0400
X-MC-Unique: _gLZNoZ7N56TvUmFvKYOJQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6254462D5C;
 Tue, 23 May 2023 01:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4572C433EF;
 Tue, 23 May 2023 01:12:26 +0000 (UTC)
Date: Mon, 22 May 2023 18:12:26 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230523011226.GF11642@frogsfrogsfrogs>
References: <20230519093521.133226-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230519093521.133226-1-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [Cluster-devel] cleanup the filemap / direct I/O interaction
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
Cc: linux-mm@kvack.org, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>,
 linux-xfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 19, 2023 at 11:35:08AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this series cleans up some of the generic write helper calling
> conventions and the page cache writeback / invalidation for
> direct I/O.  This is a spinoff from the no-bufferhead kernel
> project, for while we'll want to an use iomap based buffered
> write path in the block layer.

Heh.

For patches 3 and 8, I wonder if you could just get rid of
current->backing_dev_info?

For patches 2, 4-6, and 10:
Acked-by: Darrick J. Wong <djwong@kernel.org>

For patches 1, 7, and 9:
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

The fuse patches I have no idea about. :/

--D

> diffstat:
>  block/fops.c            |   18 ----
>  fs/ceph/file.c          |    6 -
>  fs/direct-io.c          |   10 --
>  fs/ext4/file.c          |   12 ---
>  fs/f2fs/file.c          |    3 
>  fs/fuse/file.c          |   47 ++----------
>  fs/gfs2/file.c          |    7 -
>  fs/iomap/buffered-io.c  |   12 ++-
>  fs/iomap/direct-io.c    |   88 ++++++++--------------
>  fs/libfs.c              |   36 +++++++++
>  fs/nfs/file.c           |    6 -
>  fs/xfs/xfs_file.c       |    7 -
>  fs/zonefs/file.c        |    4 -
>  include/linux/fs.h      |    7 -
>  include/linux/pagemap.h |    4 +
>  mm/filemap.c            |  184 +++++++++++++++++++++---------------------------
>  16 files changed, 190 insertions(+), 261 deletions(-)

