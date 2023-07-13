Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E0A752759
	for <lists+cluster-devel@lfdr.de>; Thu, 13 Jul 2023 17:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689262586;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=ZnsbM2wbDJKZoJO63kCqa7skAvyrvbFpqW+OFngO6J0=;
	b=YMk7Fbs9KjkbWDxMPP2A6jnYZ7iYg9EIi6dgnZuSLTnvaP5yzNhykM5AUVVl/aanDITlNq
	cqCvFaD/nmVkR6uFNJevf7jVWqfDEBDe0Wbk0szpmWuFoPE4phIx/2wPJTegRPSSsNAI8+
	9BEzEJIWzgM3+WhyBkqpj8WmM5bvQtQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-tDxGq96KOKeb5M88Dy2lFg-1; Thu, 13 Jul 2023 11:36:23 -0400
X-MC-Unique: tDxGq96KOKeb5M88Dy2lFg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B0AE8A5144;
	Thu, 13 Jul 2023 15:34:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 55F461454143;
	Thu, 13 Jul 2023 15:34:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1BDF919465A0;
	Thu, 13 Jul 2023 15:34:50 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6A18719465BB for <cluster-devel@listman.corp.redhat.com>;
 Thu, 13 Jul 2023 15:34:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 67882492B03; Thu, 13 Jul 2023 15:34:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E5B9492B01
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 15:34:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 366EA8925DA
 for <cluster-devel@redhat.com>; Thu, 13 Jul 2023 15:33:55 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-158-_lxK0EUnPOOYuMCHW1TZzA-1; Thu,
 13 Jul 2023 11:33:52 -0400
X-MC-Unique: _lxK0EUnPOOYuMCHW1TZzA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C41522185;
 Thu, 13 Jul 2023 15:33:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42C8613489;
 Thu, 13 Jul 2023 15:33:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e3taEF4ZsGTsGAAAMHmgww
 (envelope-from <chrubis@suse.cz>); Thu, 13 Jul 2023 15:33:50 +0000
Date: Thu, 13 Jul 2023 17:34:55 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <ZLAZn_SBmoIFG5F5@yuki>
References: <202307132107.2ce4ea2f-oliver.sang@intel.com>
 <20230713150923.GA28246@lst.de>
MIME-Version: 1.0
In-Reply-To: <20230713150923.GA28246@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [LTP] [linus:master] [iomap] 219580eea1:
 ltp.writev07.fail
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
 Ilya Dryomov <idryomov@gmail.com>, Miklos Szeredi <mszeredi@redhat.com>,
 Chao Yu <chao@kernel.org>, oe-lkp@lists.linux.dev,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, ltp@lists.linux.it,
 lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-kernel@vger.kernel.org,
 linux-xfs@vger.kernel.org, kernel test robot <oliver.sang@intel.com>,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Hannes Reinecke <hare@suse.de>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.cz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!
> I can't reproduce this on current mainline.  Is this a robust failure
> or flapping test?  Especiall as the FAIL conditions look rather
> unrelated.

Actually the test is spot on, the difference is that previously the
error was returned form the iomap_file_buffered_write() only if we
failed with the first buffer from the iov, now we always return the
error and we do not advance the offset.

The change that broke it:

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 063133ec77f4..550525a525c4 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -864,16 +864,19 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
                .len            = iov_iter_count(i),
                .flags          = IOMAP_WRITE,
        };
-       int ret;
+       ssize_t ret;

        if (iocb->ki_flags & IOCB_NOWAIT)
                iter.flags |= IOMAP_NOWAIT;

        while ((ret = iomap_iter(&iter, ops)) > 0)
                iter.processed = iomap_write_iter(&iter, i);
-       if (iter.pos == iocb->ki_pos)
+
+       if (unlikely(ret < 0))
                return ret;
-       return iter.pos - iocb->ki_pos;
+       ret = iter.pos - iocb->ki_pos;
+       iocb->ki_pos += ret;
+       return ret;
 }

I suppose that we shoudl fix is with something as:

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index adb92cdb24b0..bfb39f7bc303 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -872,11 +872,12 @@ iomap_file_buffered_write(struct kiocb *iocb, struct iov_iter *i,
        while ((ret = iomap_iter(&iter, ops)) > 0)
                iter.processed = iomap_write_iter(&iter, i);

+       iocb->ki_pos += iter.pos - iocb->ki_pos;
+
        if (unlikely(ret < 0))
                return ret;
-       ret = iter.pos - iocb->ki_pos;
-       iocb->ki_pos += ret;
-       return ret;
+
+       return iter.pos - iocb->ki_pos;
 }
 EXPORT_SYMBOL_GPL(iomap_file_buffered_write);


-- 
Cyril Hrubis
chrubis@suse.cz

