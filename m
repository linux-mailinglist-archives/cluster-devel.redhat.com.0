Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC13C6EC63A
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Apr 2023 08:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682317383;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rxuwauPRwLemTJXwY3VrKMRJhs+GgwhnyBD4s7nm7AY=;
	b=bxPpmHcH/kSWErqFlrXlEs7VVT4KmE3jJZle1Kfr1cn5SrEGVzDt27eKfDAW4C4rHIEZSc
	+EEEY6b8gAVip4ZqQZtz9NrMTiSBQyDGRyr02ARrH3l9Hc+TtMJWJ2mUUmgumAymRrP8sa
	WO63OkyOoAevHKs5K8pfCFzP+fGXxQ4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-620-6C_dc0rPPLGnAhqrBEEI0Q-1; Mon, 24 Apr 2023 02:22:59 -0400
X-MC-Unique: 6C_dc0rPPLGnAhqrBEEI0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 943731C05B04;
	Mon, 24 Apr 2023 06:22:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 895114C83A;
	Mon, 24 Apr 2023 06:22:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 71E911946589;
	Mon, 24 Apr 2023 06:22:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 91E23194658C for <cluster-devel@listman.corp.redhat.com>;
 Mon, 24 Apr 2023 06:22:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 840AE14272BD; Mon, 24 Apr 2023 06:22:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C5B014272BC
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:22:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62B9885CE6C
 for <cluster-devel@redhat.com>; Mon, 24 Apr 2023 06:22:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-rvJ0hhNIMNuachhAWQuGsg-1; Mon, 24 Apr 2023 02:22:53 -0400
X-MC-Unique: rvJ0hhNIMNuachhAWQuGsg-1
Received: from [2001:4bb8:189:a74f:e8a5:5f73:6d2:23b8] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pqp4s-00FOtV-2G; Mon, 24 Apr 2023 05:49:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 24 Apr 2023 07:49:09 +0200
Message-Id: <20230424054926.26927-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [Cluster-devel] RFC: allow building a kernel without buffer_heads
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
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-ext4@vger.kernel.org,
 ceph-devel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Hi all,

after all the talk about removing buffer_heads, here is a series that
shows how to build a kernel without buffer_heads.  And how unrealistic
it is to remove the entirely.

Most of the series refactors some common code to make implementing direct
I/O easier without use of the ->direct_IO method and the helpers based
around it.  It then switches buffered writes (but not writeback) for
block devices to use iomap unconditionally, but still using buffer_heads.

The final patch then adds a CONFIG_BUFFER_HEAD selected by all file
systems that need it (which is most block based file systems), makes the
buffer_head support in iomap optional, and adds an alternative
implementation of the block device address_operations using iomap.

With this you can build a kernel with block device support, but without
buffer_heads.  This kernel supports xfs and btrfs as full blown block
based filesystems, and a bunch of read-only ones like cramfs, erofs and
squashfs.  Note that the md software raid drivers is also disabled as it
has some (rather questionable) buffer_head usage in the unconditionally
built bitmap code.

The series is based on Linux 6.3 and will need some rebasing before it
can be fed to the maintainers incrementally.  All but the last patch
definitively seem useful for me.  The last one I think is just to avoid
introducing new buffer_head dependencies, even if I suspect the real
life usefulness of a !CONFIG_BUFFER_HEAD kernel might be rather limited.

